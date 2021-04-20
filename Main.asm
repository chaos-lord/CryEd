; ======================================
; CryEd - cry editor for Pokémon Crystal
; ======================================

; Defines
include "Defines.asm"

; =============
; Reset vectors
; =============
section "Reset $00",rom0[$00]
CallHL:         jp  hl
    
section "Reset $08",rom0[$08]
FillRAM::       jp  _FillRAM
    
section "Reset $10",rom0[$10]
WaitVBlank::    jp  _WaitVBlank

section "Reset $18",rom0[$18]
WaitTimer::     jp  _WaitTimer

section "Reset $20",rom0[$20]
WaitLCDC::      jp  _WaitLCDC
    
section "Reset $30",rom0[$30]
Panic::         jp  _Panic

section "Reset $38",rom0[$38]
GenericTrap::
    xor a
    jp  _Panic
    
; ==================
; Interrupt handlers
; ==================

section "VBlank IRQ",rom0[$40]
IRQ_VBlank::    jp  DoVBlank

section "STAT IRQ",rom0[$48]
IRQ_Stat::      jp  DoStat

section "Timer IRQ",rom0[$50]
IRQ_Timer::     jp  DoTimer

section "Serial IRQ",rom0[$58]
IRQ_Serial::    reti            ; not used

section "Joypad IRQ",rom0[$60]
IRQ_Joypad::    reti            ; not used

; ===============
; System routines
; ===============

include "SystemRoutines.asm"

; ==========
; ROM header
; ==========

section "ROM header",rom0[$100]

EntryPoint::
    nop
    jp      ProgramStart
NintendoLogo:   ; DO NOT MODIFY OR ROM WILL NOT BOOT!!!
    db  $ce,$ed,$66,$66,$cc,$0d,$00,$0b,$03,$73,$00,$83,$00,$0c,$00,$0d
    db  $00,$08,$11,$1f,$88,$89,$00,$0e,$dc,$cc,$6e,$e6,$dd,$dd,$d9,$99
    db  $bb,$bb,$67,$63,$6e,$0e,$ec,$cc,$dd,$dc,$99,$9f,$bb,$b9,$33,$3e
ROMTitle:       romTitle    "CRYED" ; ROM title (15 bytes)
GBCSupport:     db  $00                         ; GBC support (0 = DMG only, $80 = DMG/GBC, $C0 = GBC only)
NewLicenseCode: db  "DS"                        ; new license code (2 bytes)
SGBSupport:     db  0                           ; SGB support
CartType:       db  $1b                         ; Cart type, see hardware.inc for a list of values
ROMSize:        ds  1                           ; ROM size (handled by post-linking tool)
RAMSize:        db  2                           ; RAM size
DestCode:       db  1                           ; Destination code (0 = Japan, 1 = All others)
OldLicenseCode: db  $33                         ; Old license code (if $33, check new license code)
ROMVersion:     db  0                           ; ROM version
HeaderChecksum: ds  1                           ; Header checksum (handled by post-linking tool)
ROMChecksum:    ds  2                           ; ROM checksum (2 bytes) (handled by post-linking tool)

; =====================
; Start of program code
; =====================

ProgramStart::
    di
    ld      sp,$e000
    push    bc
    push    af
    
; disable LCD
.wait
    ldh     a,[rLY]
    cp      $90
    jr      nz,.wait
    xor     a
    ldh     [rLCDC],a
    
; init memory
    ld      hl,$c000    ; start of WRAM
    ld      bc,$1ffa    ; don't clear stack
    xor     a
    rst     $08
    
    ld      hl,$8000    ; start of VRAM
    ld      bc,$2000
    xor     a
    rst     $08
    
    ; clear HRAM
    ld      bc,$7f80
    xor     a
.loop
    ld      [c],a
    inc     c
    dec     b
    jr      nz,.loop
    call    CopyDMARoutine
    call    $ff80   ; clear OAM
    
    call    LoadSaveScreen_SRAMCheck
    jr      nc,.noinitsram
    ld      a,$a
    ld      [rRAMG],a
    xor     a
    ld      hl,$a000
    ld      bc,$2000
    rst     $08
    ld      hl,.savestr
    ld      de,$a600
    ld      b,5
.strloop
    ld      a,[hl+]
    ld      [de],a
    inc     de
    dec     b
    jr      nz,.strloop
    xor     a
    ld      [$0000],a
    jr      .noinitsram
    
.savestr
    db      "SAVE!"
.noinitsram
    
; check GB type
; sets sys_GBType to 0 if DMG/SGB/GBP/GBL/SGB2, 1 if GBC, 2 if GBA/GBA SP/GB Player
; TODO: Improve checks to allow for GBP/SGB/SGB2 to be detected separately
    pop     af
    pop     bc
    cp      $11
    jr      nz,.dmg
.gbc
    and     1       ; a = 1
    add     b       ; b = 1 if on GBA
    ld      [sys_GBType],a
    jr      .continue
.dmg
    xor     a
    ld      [sys_GBType],a
.continue

InitCryEditor::
    rst     $10
    xor     a
    ldh     [rLCDC],a
    ld      a,9
    ld      [sys_MenuMax],a
    xor     a
    ld      [sys_MenuPos],a
    call    MapSetup_Sound_Off
    ; load font + graphics
    CopyTileset1BPP Font,0,98
    ld      hl,CryEditorTilemap
    call    LoadMapText
    ; init rendering variables
    SetDMGPal   rBGP, 0,1,2,3
    SetDMGPal   rOBP0,0,0,2,3
    SetDMGPal   rOBP1,0,1,2,3
    xor     a
    ldh     [rSCX],a
    ldh     [rSCY],a
    ldh     [rWX],a
    ldh     [rWY],a
    ld      a,%10010001
    ldh     [rLCDC],a
    ld      a,IEF_VBLANK
    ldh     [rIE],a
    ei
    halt
    
CryEditorLoop::
    ld      a,[sys_btnPress]
    bit     btnA,a
    jr      nz,.playCry
    bit     btnStart,a
    jr      nz,.playCry
    bit     btnB,a
    jr      nz,.resetCry
    bit     btnSelect,a
    jp      nz,InitOptionsMenu
    ld      hl,sys_MenuPos
    bit     btnUp,a
    jr      nz,.editUp
    bit     btnDown,a
    jr      nz,.editDown
    bit     btnRight,a
    jr      nz,.cursorNext
    bit     btnLeft,a
    jr      nz,.cursorPrev
    jr      .continue
.resetCry
    xor     a
    ld      hl,CryEdit_CryBase
    ld      [hl+],a
    ld      [hl+],a
    ld      [hl+],a
    ld      [hl+],a
    ld      [hl+],a
    jr      .continue
.playCry
    ld      hl,CryEdit_CryBase
    ld      d,0
    ld      e,[hl]
    inc     hl
    ld      a,[hl+]
    ld      [wCryPitch],a
    ld      a,[hl+]
    ld      [wCryPitch+1],a
    ld      a,[hl+]
    ld      [wCryLength],a
    ld      a,[hl+]
    ld      [wCryLength+1],a
    call    CryEd_PreviewCry
    jr      .continue
.editUp
    ld      e,1
    call    CryEdit_EditNybble  
    jr      .continue
.editDown
    ld      e,0
    call    CryEdit_EditNybble
    jr      .continue
.setItem
    ld      [hl],b
    jr      .continue
.cursorNext
    ld      b," "-32
    call    CryEditor_DrawCursor
    inc     [hl]
    ld      b,[hl]
    ld      a,[sys_MenuMax]
    inc     a
    cp      b
    jr      nz,.setItem
    ld      [hl],0
    jr      .continue
.cursorPrev
    ld      b," "-32
    call    CryEditor_DrawCursor
    dec     [hl]
    ld      a,[hl]
    cp      $ff
    ld      b,a
    jr      nz,.setItem
    ld      a,[sys_MenuMax]
    ld      [hl],a
    ; fall through to .continue
.continue
    ld      b,"^"-32
    call    CryEditor_DrawCursor

    ld      a,[CryEdit_CryBase]
    ld      hl,$9831
    call    DrawHex
    ld      a,[CryEdit_CryPitch+1]
    ld      hl,$986f
    call    DrawHex
    ld      a,[CryEdit_CryPitch]
    call    DrawHex
    ld      a,[CryEdit_CryLength+1]
    ld      hl,$98af
    call    DrawHex
    ld      a,[CryEdit_CryLength]
    call    DrawHex
    
    halt
    call    UpdateSound
    jp      CryEditorLoop

; INPUT: b = char to use for cursor
; Destroys A.
CryEditor_DrawCursor::
    push    hl
    ld      a,[sys_MenuPos]
    ld      hl,CryEdit_CursorLocations
    add     a
    add     l
    ld      l,a
    jr      nc,.nocarry
    inc     h
.nocarry
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ; write char
    WaitForVRAM
    ld      [hl],b
    pop     hl
    ret

CryEdit_EditNybble:
    ld      a,[sys_MenuPos]
    ld      b,a
    add     a
    add     b
    ld      hl,CryEdit_NybbleLocations
    add     l
    ld      l,a
    jr      nc,.nocarry
    inc     h
.nocarry
    ld      a,[hl+]
    ld      d,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    
    ld      a,d
    and     a
    jr      nz,.uppernybble
.lowernybble
    ld      a,e
    and     a
    jr      z,.sub1
    jr      .add1
.uppernybble
    ld      a,e
    and     a
    jr      z,.sub10
    jr      .add10
.add1
    inc     [hl]
    ld      a,[hl]
    and     $f
    cp      0
    ret     nz
    ld      a,[hl]
    sub     $10
    ld      [hl],a
    ret
.sub1
    dec     [hl]
    ld      a,[hl]
    and     $f
    cp      $f
    ret     nz
    ld      a,[hl]
    add     $10
    ld      [hl],a
    ret
.add10
    ld      a,[hl]
    add     $10
    ld      [hl],a
    ret
.sub10
    ld      a,[hl]
    sub     $10
    ld      [hl],a
    ret
    
CryEdit_CursorLocations:
    dw      $9851,$9852             ; base
    dw      $988f,$9890,$9891,$9892 ; pitch
    dw      $98cf,$98d0,$98d1,$98d2 ; length
    
CryEdit_NybbleLocations:
    dbw     1,CryEdit_CryBase
    dbw     0,CryEdit_CryBase
    dbw     1,CryEdit_CryPitch+1
    dbw     0,CryEdit_CryPitch+1
    dbw     1,CryEdit_CryPitch
    dbw     0,CryEdit_CryPitch
    dbw     1,CryEdit_CryLength+1
    dbw     0,CryEdit_CryLength+1
    dbw     1,CryEdit_CryLength
    dbw     0,CryEdit_CryLength
    
Menu_DrawCursor::
    push    af
    ld      h,0
    ld      a,[sys_MenuPos]
    ld      l,a
    add     hl,hl   ; x2
    add     hl,hl   ; x4
    add     hl,hl   ; x8
    add     hl,hl   ; x16
    add     hl,hl   ; x32
    ld      b,h
    ld      c,l
    ld      hl,$9861
    add     hl,bc
    WaitForVRAM
    pop     af
    ld      [hl],a
    ret
    
CryEditorTilemap::
;        ####################
    db  "                    "
    db  " Base:          $?? "
    db  "                    "
    db  " Pitch:       $???? "
    db  "                    "
    db  " Length:      $???? "
    db  "                    "
    db  "    - CONTROLS -    "
    db  "Left/Right    Cursor"
    db  "Up/Down   Edit value"
    db  "A/Start         Test"
    db  "B              Reset"
    db  "Select          Menu"
    db  "                    "
    db  "Build date:         "
.datestart
    db  __DATE__
.dateend
    rept    20-(.dateend-.datestart)
    db  20
    endr
.timestart
    db  __TIME__
.timeend
    rept    20-(.timeend-.timestart)
    db  20
    endr
    db  "                    "
;        ####################

; ================================
InitOptionsMenu::
    rst     $10
    xor     a
    ldh     [rLCDC],a
    ld      a,2
    ld      [sys_MenuMax],a
    xor     a
    ld      [sys_MenuPos],a
    call    MapSetup_Sound_Off
    ; load font + graphics
    CopyTileset1BPP Font,0,98
    ld      hl,OptionsMenuTilemap
    call    LoadMapText
    xor     a
    call    Options_PrintDescription
    ; init rendering variables
    SetDMGPal   rBGP, 0,1,2,3
    SetDMGPal   rOBP0,0,0,2,3
    SetDMGPal   rOBP1,0,1,2,3
    xor     a
    ldh     [rSCX],a
    ldh     [rSCY],a
    ldh     [rWX],a
    ldh     [rWY],a
    ld      a,%10010001
    ldh     [rLCDC],a
    ld      a,IEF_VBLANK
    ldh     [rIE],a
    ei
    
    ld      de,6    ; SFX_MENU
    call    PlaySFX
    
    halt
    
OptionsMenuLoop::
    ld      a,[sys_btnPress]
    bit     btnA,a
    jr      nz,.selectItem
    bit     btnB,a
    jp      nz,InitCryEditor
    bit     btnStart,a
    jr      nz,.selectItem
    bit     btnSelect,a
    jr      nz,.nextItem
    bit     btnUp,a
    jr      nz,.prevItem
    bit     btnDown,a
    jr      z,.continue
.nextItem
    ld      a," "-$20
    call    Menu_DrawCursor
    ld      a,[sys_MenuPos]
    inc     a
    ld      b,a
    ld      a,[sys_MenuMax]
    inc     a
    cp      b
    ld      a,b
    jr      nz,.setItem
    xor     a
.setItem
    ld      [sys_MenuPos],a
    call    Options_PrintDescription
    jr      .continue
.prevItem
    ld      a," "-$20
    call    Menu_DrawCursor
    ld      a,[sys_MenuPos]
    dec     a
    cp      $ff
    jr      nz,.setItem
    ld      a,[sys_MenuMax]
    jr      .setItem
.selectItem
    ld      hl,MenuItemPtrs_OptionsMenu
    ld      a,[sys_MenuPos]
    add     a
    add     l
    ld      l,a
    jr      nc,.nocarry
    inc     h
.nocarry
    ld      de,7    ; SFX_READ_TEXT
    call    PlaySFX 
    push    af
; wait for SFX to finish playing
.waitSFX
    call    UpdateSound
    halt
    call    IsSFXPlaying
    jr  nc,.waitSFX
    call    PtrToHL
    rst $00
.continue
    ld  a,">"-$20
    call    Menu_DrawCursor
    call    UpdateSound
    
    halt
    jr  OptionsMenuLoop
    
MenuItemPtrs_OptionsMenu::
    dw  .importCry
    dw  .loadSaveCry
    dw  .exit
    
.importCry
    pop hl  ; stack overflow prevention
    jp  InitCryImporter
.loadSaveCry
    pop hl  ; stack overflow prevention
    xor a
    jp  InitLoadSaveScreen
.exit
    pop hl  ; stack overflow prevention
    jp  InitCryEditor
    
OptionsMenuTilemap::
;        ####################
    db  "                    "
    db  "    - OPTIONS -     "
    db  "                    "
    db  "  Import cry        "
    db  "  Load/save cry     "
    db  "  Exit              "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "DESCRIPTION LINE 1  "
    db  "DESCRIPTION LINE 2  "
    db  "DESCRIPTION LINE 3  "
    db  "DESCRIPTION LINE 4  "
    
OptionsMenu_DescriptionPointers:
    dw  .importCry
    dw  .loadSaveCry
    dw  .exit
    
.importCry
    db  "Import an existing  "
    db  "cry.                "
    db  "                    "
    db  "                    "
.loadSaveCry
    db  "Load or save a cry. "
    db  "                    "
    db  "                    "
    db  "                    "
.exit
    db  "Return to the cry   "
    db  "editor.             "
    db  "                    "
    db  "                    "
    
Options_PrintDescription:
    ld      bc,OptionsMenu_DescriptionPointers
    ld      h,0
    ld      l,a
    add     hl,hl
    add     hl,bc
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ld      de,$99c0
    ld      bc,$414
.loop
    ld      a,[hl+]
    sub     32
    push    af
    WaitForVRAM
    pop     af
    ld      [de],a
    inc     de
    dec     c
    jr      nz,.loop
    ld      c,$14
    ld      a,e
    add     $c
    jr      nc,.continue
    inc     d
.continue
    ld      e,a
    dec     b
    jr      nz,.loop
    ret
    
; ================
; Load/save screen
; ================

InitLoadSaveScreen:
    rst     $10
    xor     a
    ldh     [rLCDC],a
    ld      [sys_MenuPos],a
    ld      a,[SelectedSaveSlot]
    ld      [sys_MenuMax],a         ; sys_MenuMax is repurposed as currently selected save slot
    call    MapSetup_Sound_Off
    ; load font + graphics
    CopyTileset1BPP Font,0,98
    CopyTileset1BPPInvert   Font,$800,98
    ld      hl,LoadSaveScreenTilemap
    call    LoadMapText
    
    xor     a
    ld      hl,msg_dummy
    call    LoadSaveScreen_PrintLine
    inc     a
    ld      hl,msg_dummy
    call    LoadSaveScreen_PrintLine
    
    ; init rendering variables
    SetDMGPal   rBGP, 0,1,2,3
    SetDMGPal   rOBP0,0,0,2,3
    SetDMGPal   rOBP1,0,1,2,3
    xor     a
    ldh     [rSCX],a
    ldh     [rSCY],a
    ldh     [rWX],a
    ldh     [rWY],a
    ld      a,%10010001
    ldh     [rLCDC],a
    ld      a,IEF_VBLANK
    ldh     [rIE],a
    ei
    halt
    
LoadSaveScreenLoop:
    call    UpdateSound
    
    ld      hl,sys_MenuMax
    ld      a,[sys_btnPress]
    bit     btnA,a
    jp      nz,.selectSlot
    bit     btnB,a
    jr      nz,.exit
    bit     btnSelect,a
    jr      nz,.previewCry
    bit     btnUp,a
    jr      nz,.add16
    bit     btnDown,a
    jr      nz,.sub16
    bit     btnRight,a
    jr      nz,.add1
    bit     btnLeft,a
    jr      nz,.sub1
.continue
    ld      a,[sys_MenuMax]
    ld      [SelectedSaveSlot],a
    ld      hl,$9871
    call    DrawHex
    halt
    jr      LoadSaveScreenLoop

.previewCry
    call    LoadSaveScreen_SRAMCheck
    jr      c,.previewfail
    ld      a,[sys_MenuMax]
    call    LoadSaveScreen_GetPtr
    ld      a,$a
    ld      [rRAMG],a
    push    hl
    call    LoadSave_CheckIfCryExists
    jp      nc,.crydoesntexist
    pop     hl
    ld      a,[hl+]
    ld      d,0
    ld      e,a
    inc     hl
    ld      a,[hl+]
    ld      [wCryPitch],a
    ld      a,[hl+]
    ld      [wCryPitch+1],a
    ld      a,[hl+]
    ld      [wCryLength],a
    ld      a,[hl+]
    ld      [wCryLength+1],a
    call    CryEd_PreviewCry
    jr  .continue
.previewfail
    call    MapSetup_Sound_Off
    ld      de,$19  ; SFX_WRONG
    call    PlaySFX
    ld      hl,msg_previewfail
    jp      .doprintmessage
    
.sub1
    dec     [hl]
    jr      .continue
.add1
    inc     [hl]
    jr      .continue
.sub16
    ld      a,[hl]
    sub     16
    ld      [hl],a
    jr      .continue
.add16
    ld      a,[hl]
    add     16
    ld      [hl],a
    jr      .continue
.exit
    call    MapSetup_Sound_Off
    ld      de,$e
    call    PlaySFX
.waitSFX
    call    UpdateSound
    halt
    call    IsSFXPlaying
    jr      nc,.waitSFX
    
    jp      InitCryEditor
.selectSlot
    call    MapSetup_Sound_Off
    ld      de,$7
    call    PlaySFX
    
.loop1
    xor     a
    ld      hl,msg_loadsave
    call    LoadSaveScreen_PrintLine
    inc a
    ld      hl,prompt_loadsave
    call    LoadSaveScreen_PrintLine
    call    LoadSaveScreen_WaitForPrompt
    cp      $ff
    jp      z,.cancel
    and     a
    jp      nz,.doSave
    dec     a
    jr      nz,.doLoad
    jp      .continue
.doLoad
    call    LoadSaveScreen_SRAMCheck
    jr      c,.loadfail
    call    LoadSaveScreen_GetPtr
    ld      a,$a
    ld      [rRAMG],a
    push    hl
    call    LoadSave_CheckIfCryExists
    jr      nc,.crydoesntexist
    pop     hl
    ld      a,[hl+]
    ld      [CryEdit_CryBase],a
    inc     hl
    ld      a,[hl+]
    ld      [CryEdit_CryPitch],a
    ld      a,[hl+]
    ld      [CryEdit_CryPitch+1],a
    ld      a,[hl+]
    ld      [CryEdit_CryLength],a
    ld      a,[hl]
    ld      [CryEdit_CryLength+1],a
    xor     a
    ld      [rRAMG],a
    
    call    MapSetup_Sound_Off
    ld      de,$22
    call    PlaySFX
    ld      hl,msg_loaded
    jr      .doprintmessage

.crydoesntexist
    xor     a
    ld      [rRAMG],a
    call    MapSetup_Sound_Off
    ld      de,$19  ; SFX_WRONG
    call    PlaySFX
    ld      hl,msg_slotempty
    jr      .doprintmessage
.loadfail
    call    MapSetup_Sound_Off
    ld      de,$19  ; SFX_WRONG
    call    PlaySFX
    ld      hl,msg_loadfail
    jr      .doprintmessage
.savefail
    xor     a
    ld      [rRAMG],a
    call    MapSetup_Sound_Off
    ld      de,$19  ; SFX_WRONG
    call    PlaySFX
    ld      hl,msg_savefail
.doprintmessage
    xor     a
    call    LoadSaveScreen_PrintLine
    inc     a
    ld      hl,msg_dummy
    call    LoadSaveScreen_PrintLine
    call    LoadSaveScreen_WaitForButton
    ld      b,60
.loop
    push    bc
    call    UpdateSound
    halt
    pop     bc
    dec     b
    jr  nz,.loop
    ; fall through to .cancel
    
.cancel
    xor     a
    ld      [rRAMG],a
    ld      hl,msg_dummy
    call    LoadSaveScreen_PrintLine
    inc     a
    ld      hl,msg_dummy
    call    LoadSaveScreen_PrintLine
    jp      .continue
    
.doSave
    ; save check
    ld      a,$a
    ld      [rRAMG],a
    ld      hl,$a606
    ld      a,$ed
    ld      [hl],a
    ld      b,a
    ld      a,[hl]
    cp      b
    jr      nz,.savefail
    ld      a,[sys_MenuMax]
    call    LoadSaveScreen_GetPtr
    push    hl
    ; check if cry exists
    call    LoadSave_CheckIfCryExists
    jr      nc,.crydoesntexist2
    
    xor     a
    ld      hl,msg_overwrite
    call    LoadSaveScreen_PrintLine
    inc     a
    ld      hl,prompt_yesno
    call    LoadSaveScreen_PrintLine
    
    call    MapSetup_Sound_Off
    ld      de,$7
    call    PlaySFX
    call    LoadSaveScreen_WaitForPrompt
    cp      $ff
    jr      z,.cancel
    and     a
    jr      nz,.crydoesntexist2
    jr      .cancel
.crydoesntexist2
    pop     de
    ld      hl,CryEdit_CryBase
    ld      a,[hl+]
    ld      [de],a
    inc     de
    inc     de
    ld      b,4
.saveloop
    ld      a,[hl+]
    ld      [de],a
    inc     de
    dec     b
    jr      nz,.saveloop
    xor     a
    ld      [rRAMG],a
    call    MapSetup_Sound_Off
    ld      de,$22
    call    PlaySFX
    ld      hl,msg_saved
    jp      .doprintmessage

; carry = 1 if cry exists
LoadSave_CheckIfCryExists:
    ld      b,3
.loop
    ld      c,0
    ld      a,[hl+]
    add     c
    ld      c,a
    ld      a,[hl+]
    add     c
    ld      c,a
    cp      0
    jr      nz,.exists
    dec     b
    jr      nz,.loop
    and     a   ; clear carry
    ret
.exists
    scf
    ret
    
LoadSaveScreen_GetPtr:
    ld      a,[sys_MenuMax]
    ld      e,a
    ld      d,0
    ld      hl,$a000
    add     hl,de
    add     hl,de
    add     hl,de
    add     hl,de
    add     hl,de
    add     hl,de
    ret
    
LoadSaveScreen_SRAMCheck:
    ld      a,$a
    ld      [rRAMG],a   ; enable SRAM
    ld      hl,$a600
    ld      b,5
    ld      c,0
.loop
    ld      a,[hl+]
    add     c
    ld      c,a
    dec     b
    jr      nz,.loop
    xor     a
    ld      [rRAMG],a
    ld      a,c
    cp      $50
    scf
    ret     nz  ; return carry = 1 if check failed
    ccf         ; return carry = 0 if check passed
    ret
    
LoadSaveScreen_WaitForButton:
    call    UpdateSound
    halt
    ld      a,[sys_btnPress]
    and     a
    jr      nz,LoadSaveScreen_WaitForButton
    ret
    
; OUTPUT: 0 if item 1 selected, 1 if item 2 selected, $ff if user cancelled
LoadSaveScreen_WaitForPrompt:
    xor     a
    ld      [sys_MenuPos],a
    halt
.loop
    ld      a,[sys_btnPress]
    bit     btnLeft,a
    jr      nz,.toggle
    bit     btnRight,a
    jr      nz,.toggle
    bit     btnA,a
    jr      nz,.select
    bit     btnB,a
    jr      nz,.cancel  
.continue
    ld      a,[sys_MenuPos]
    and     a
    jr      nz,.right
.left
    ld      hl,$9a21
    ld      de,$9a2b
    jr      .drawcursor
.right
    ld      hl,$9a2b
    ld      de,$9a21
.drawcursor
    WaitForVRAM
    ld      a,">"+$60
    ld      [hl],a
    ld      a," "+$60
    ld      [de],a
    
    call    UpdateSound
    halt
    jr      .loop
.toggle
    ld      a,[sys_MenuPos]
    xor     1
    ld      [sys_MenuPos],a
    jr      .continue
.select
    ld      a,[sys_MenuPos]
    ret
.cancel
    ld      a,$ff
    ret
    
LoadSaveScreenTilemap:
;        ####################
    db  "                    "
    db  "   - LOAD/SAVE -    "
    db  "                    "
    db  " Save slot:     $?? "
    db  "                    "
    db  "    - CONTROLS -    "
    db  "A          Load/save"
    db  "B             Cancel"
    db  "Select       Preview"
    db  "D-pad         Select"
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "MESSAGE GOES HERE   "
    db  "PROMPT GOES HERE    "
    
LoadSaveScreenMessages:
msg_dummy:          db  "                    "
msg_loadsave:       db  " LOAD OR SAVE?      "
msg_overwrite:      db  " OVERWRITE?         "
msg_saved:          db  " CRY SAVED          "
msg_loaded:         db  " CRY LOADED         "
msg_slotempty:      db  " SLOT EMPTY         "
msg_savefail:       db  " SAVE FAILED!       "
msg_loadfail:       db  " LOAD FAILED!       "
msg_previewfail:    db  " PREVIEW FAILED!    "
;msg_free:          db  " Free slot          "
;msg_notfree:       db  " Slot in use        "
prompt_loadsave:    db  " > Load      Save   "
prompt_yesno:       db  " > No        Yes    "
    
; INPUT: hl = string pointer, a = line no.
LoadSaveScreen_PrintLine:
    push    af
    ld      b,20
    and     a
    jr      nz,.line1
.line0
    ld      de,$9a00
    jr      .loop
.line1
    ld      de,$9a20
.loop
    ld      a,[hl+]
    add     $60
    push    af
    WaitForVRAM
    pop     af
    ld      [de],a
    inc     de
    dec     b
    jr      nz,.loop
    pop     af
    ret
    
; =============
; Misc routines
; =============

CryEd_PreviewCry:
    ld      a,[sys_CurrentROMBank]
    push    af
    ld      a,BANK(_PlayCry)
    ld      [sys_CurrentROMBank],a
    ld      [rROMB0],a
    call    _PlayCry
    pop     af
    ld      [sys_CurrentROMBank],a
    ld      [rROMB0],a
    ret

; Fill RAM with a value.
; INPUT:  a = value
;        hl = address
;        bc = size
_FillRAM::
    ld      e,a
.loop
    ld      [hl],e
    inc     hl
    dec     bc
    ld      a,b
    or      c
    jr      nz,.loop
    ret
    
; Fill up to 256 bytes of RAM with a value.
; INPUT:  a = value
;        hl = address
;         b = size
_FillRAMSmall::
    ld      e,a
.loop
    ld      [hl],e
    inc     hl
    dec     b
    jr      nz,.loop
    ret
    
; Copy up to 65536 bytes to RAM.
; INPUT: hl = source
;        de = destination
;        bc = size
_CopyRAM::
    ld      a,[hl+]
    ld      [de],a
    inc     de
    dec     bc
    ld      a,b
    or      c
    jr      nz,_CopyRAM
    ret
    
; Copy up to 256 bytes to RAM.
; INPUT: hl = source
;        de = destination
;         b = size
_CopyRAMSmall::
    ld      a,[hl+]
    ld      [de],a
    inc     de
    dec     b
    jr      nz,_CopyRAMSmall
    ret
    
; ==================
; Interrupt handlers
; ==================

DoVBlank::
    push    af
    push    bc                      ; CheckInput uses bc
    ld      a,[sys_CurrentFrame]
    inc     a
    ld      [sys_CurrentFrame],a    ; increment current frame
    call    CheckInput              ; get button input for current frame
    ; A+B+Start+Select restart sequence
    ld      a,[sys_btnHold]
    cp      _A+_B+_Start+_Select    ; is A+B+Start+Select pressed
    jr      nz,.noreset             ; if not, skip
    ld      a,[sys_ResetTimer]      ; get reset timer
    inc     a
    ld      [sys_ResetTimer],a      ; store reset timer
    cp      60                      ; has 1 second passed?
    jr      nz,.continue            ; if not, skip
    ld      a,[sys_GBType]          ; get current GB model
    dec     a                       ; GBC?
    jr      z,.gbc                  ; if yes, jump
    dec     a                       ; GBA?
    jr      z,.gba                  ; if yes, jump
.dmg                                ; default case: assume DMG
    xor     a                       ; a = 0, b = whatever
    jr      .dorestart
.gbc                                ; a = $11, b = 0
    ld      a,$11
    ld      b,0
    jr      .dorestart
.gba                                ; a = $11, b = 1
    ld      a,$11
    ld      b,1
    ; fall through to .dorestart
.dorestart
    jp      ProgramStart            ; restart game
.noreset                            ; if A+B+Start+Select aren't held...
    xor     a
    ld      [sys_ResetTimer],a      ; reset timer
.continue
    ; done
    ld      a,1
    ld      [sys_VBlankFlag],a      ; set VBlank flag
    pop     bc
    pop     af
    reti
    
DoStat::
    push    af
    ld      a,1
    ld      [sys_LCDCFlag],a
    pop     af
    reti
    
DoTimer::
    push    af
    ld      a,1
    ld      [sys_TimerFlag],a
    pop     af
    reti
    
; =======================
; Error handling routines
; =======================

_Panic::
    jr  _Panic
    
; =======================
; Interrupt wait routines
; =======================

_WaitVBlank::
    ldh     a,[rIE]
    bit     IEF_VBLANK,a
    ret     z ;if vblank interupt is off, return
.wait
    halt ;wait for interupt
    ld      a,[sys_VBlankFlag]
    and     a
    jr      nz,.wait ;loop until sys_VBlankFlag is unset
    xor     a
    ld      [sys_VBlankFlag],a ;then load 0 into it? when it has to be 0 to get here? this code is probably broken.
    ret

_WaitTimer::
    ldh     a,[rIE]
    bit     IEF_TIMER,a
    ret     z
.wait
    halt
    ld      a,[sys_TimerFlag]
    and     a
    jr      nz,.wait
    xor     a
    ld      [sys_VBlankFlag],a
    ret

_WaitLCDC::
    ldh     a,[rIE]
    bit     IEF_LCDC,a
    ret     z
.wait
    halt
    ld      a,[sys_LCDCFlag]
    and     a
    jr      nz,.wait
    xor     a
    ld      [sys_LCDCFlag],a
    ret
    
; =================
; Graphics routines
; =================

_CopyTileset::                          ; WARNING: Do not use while LCD is on!
    ld      a,[hl+]                     ; get byte
    ld      [de],a                      ; write byte
    inc     de
    dec     bc
    ld      a,b                         ; check if bc = 0
    or      c
    jr      nz,_CopyTileset             ; if bc != 0, loop
    ret
    
_CopyTilesetSafe::                      ; same as _CopyTileset, but waits for VRAM accessibility before writing data
    ldh     a,[rSTAT]
    and     2                           ; check if VRAM is accessible
    jr      nz,_CopyTilesetSafe         ; if it isn't, loop until it is
    ld      a,[hl+]                     ; get byte
    ld      [de],a                      ; write byte
    inc     de
    dec     bc
    ld      a,b                         ; check if bc = 0
    or  c
    jr      nz,_CopyTilesetSafe         ; if bc != 0, loop
    ret
    
_CopyTileset1BPP::                      ; WARNING: Do not use while LCD is on!
    ld      a,[hl+]                     ; get byte
    ld      [de],a                      ; write byte
    inc     de                          ; increment destination address
    ld      [de],a                      ; write byte again
    inc     de                          ; increment destination address again
    dec     bc
    dec     bc                          ; since we're copying two bytes, we need to dec bc twice
    ld      a,b                         ; check if bc = 0
    or      c
    jr      nz,_CopyTileset1BPP         ; if bc != 0, loop
    ret
    
_CopyTileset1BPPInvert::            ; WARNING: Do not use while LCD is on!
    ld      a,[hl+]                     ; get byte
    cpl                                 ; invert byte
    ld      [de],a                      ; write byte
    inc     de                          ; increment destination address
    ld      [de],a                      ; write byte again
    inc     de                          ; increment destination address again
    dec     bc
    dec     bc                          ; since we're copying two bytes, we need to dec bc twice
    ld      a,b                         ; check if bc = 0
    or      c
    jr      nz,_CopyTileset1BPPInvert   ; if bc != 0, loop
    ret

_CopyTileset1BPPSafe::              ; same as _CopyTileset1BPP, but waits for VRAM accessibility before writing data
    ldh     a,[rSTAT]
    and     2                           ; check if VRAM is accessible
    jr      nz,_CopyTileset1BPPSafe     ; if it isn't, loop until it is
    ld      a,[hl+]                     ; get byte
    ld      [de],a                      ; write byte
    inc         de                          ; increment destination address
    ld      [de],a                      ; write byte again
    inc     de                          ; increment destination address again
    dec     bc
    dec     bc                          ; since we're copying two bytes, we need to dec bc twice
    ld      a,b                         ; check if bc = 0
    or      c
    jr      nz,_CopyTileset1BPP         ; if bc != 0, loop
    ret
    
; =============
; Graphics data
; =============

Font::      incbin  "GFX/Font.bin"
; ================================

InitCryImporter::
    rst     $10
    xor     a
    ldh     [rLCDC],a
    call    MapSetup_Sound_Off
    ; load font + graphics
    CopyTileset1BPP Font,0,98
    ld      hl,CryImporterTilemap
    call    LoadMapText
    ; init rendering variables
    SetDMGPal   rBGP, 0,1,2,3
    SetDMGPal   rOBP0,0,0,2,3
    SetDMGPal   rOBP1,0,1,2,3
    xor     a
    ldh     [rSCX],a
    ldh     [rSCY],a
    ldh     [rWX],a
    ldh     [rWY],a
    ld      a,%10010001
    ldh     [rLCDC],a
    ld      a,IEF_VBLANK
    ldh     [rIE],a
    ei
    halt

CryImporterLoop::
    ld      a,[sys_btnPress]
    bit     btnA,a
    jr      nz,.importCry
    bit     btnB,a
    jp      nz,InitCryEditor
    bit     btnStart,a
    jr      nz,.importCry
    bit     btnSelect,a
    jp      nz,.previewCry
    ld      hl,sys_MenuPos
    bit     btnUp,a
    jr      nz,.add16
    bit     btnDown,a
    jr      nz,.sub16
    bit     btnRight,a
    jr      nz,.add1
    bit     btnLeft,a
    jr      nz,.sub1
    jr      .continue
.add16
    ld      d,[hl]
    inc     hl
    ld      a,[hld]
    add     16
    ld      e, a
    ld      a, 0
    adc     d
    ld      [hli],a
    ld      [hl],e
    jr      .continue
.sub16
    ld      d,[hl]
    inc     hl
    ld      a,[hld]
    sub     16
    ld      e, a
    ld      a, d
    sbc     0
    ld      [hli],a
    ld      [hl],e
    jr      .continue
.add1
    ld      d,[hl]
    inc     hl
    ld      a,[hld]
    ld      e, a
    inc     de
    ld      [hl],d
    inc     hl
    ld      [hl],e
    jr      .continue
.sub1
    ld      d,[hl]
    inc     hl
    ld      a,[hld]
    ld      e, a
    dec     de
    ld      [hl],d
    inc     hl
    ld      [hl],e
    jr      .continue
.previewCry
    ld      a,[sys_MenuPos]
    ld      d,a
    ld      a,[sys_MenuPos + 1]
    ld      e,a
    call    PlayCry
    jr  .continue
.importCry
    ld      a,[sys_MenuPos]
    ld      d,a
    ld      a,[sys_MenuPos + 1]
    ld      e,a
    call    PlayCry
.cryloop
    halt
    call    UpdateSound
    call    IsSFXPlaying
    jr      nc,.cryloop
    ld      hl,PokemonCries
    add     hl,de
    add     hl,de
    add     hl,de
    add     hl,de
    add     hl,de
    add     hl,de
    ld      a,[hl+]
    inc     hl
    ld      [CryEdit_CryBase],a
    ld      a,[hl+]
    ld      [CryEdit_CryPitch],a
    ld      a,[hl+]
    ld      [CryEdit_CryPitch+1],a
    ld      a,[hl+]
    ld      [CryEdit_CryLength],a
    ld      a,[hl]
    ld      [CryEdit_CryLength+1],a
    jp      InitCryEditor
.nocry
    ld      de,$19  ; SFX_WRONG
    call    PlaySFX
.continue
    ld      a,[sys_MenuPos]
    ld      hl,$986F
    call    DrawHex
    ld      a,[sys_MenuPos+1]
    ld      hl,$9871
    call    DrawHex
    ld      a,[sys_MenuPos]
    ld      h,a
    ld      a,[sys_MenuPos+1]
    ld      l,a
    ld      bc,$9881
    call    PrintMonName
    call    UpdateSound
    halt
    jp      CryImporterLoop
    
CryImporterTilemap::
;        ####################
    db  "                    "
    db  "  - CRY IMPORTER -  "
    db  "                    "
    db  " Cry ID:      $???? "
    db  " ??????????         "
    db  "                    "
    db  "    - CONTROLS -    "
    db  " Left/Right    +- 1 "
    db  " Up/Down      +- 16 "
    db  " A/Start     Import "
    db  " B             Exit "
    db  " Select     Preview "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "
    db  "                    "

; Input: hl = Pokemon ID, bc = screen pos
PrintMonName:
	ld      a, h
	cp      HIGH(NUM_MONS - 1)
	jr      c, .continue
	jr      nz, .noname
	ld      a, l
	cp      LOW(NUM_MONS - 1)
	jr      c, .continue
	jr      nz, .noname
.continue
    add     hl,hl   ; x2
    ld      d,h
    ld      e,l
    add     hl,hl   ; x4
    add     hl,hl   ; x8
    add     hl,de   ; x10
    ld      a,bank(PokemonNames)
    ld      [rROMB0],a
    ld      de,PokemonNames
    add     hl,de
    ld      d,b
    ld      e,c
    ld      b,10
.loop
    WaitForVRAM
    ld      a,[hl+]
    sub     32
    ld      [de],a
    inc     de
    dec     b
    jr      nz,.loop
    ld      a,1
    ld      [rROMB0],a
    ret
    
.noname
	ld      hl, OutOfBoundText
	ld      d,b
    ld      e,c
    ld      b,10
.nonameloop
    WaitForVRAM
    ld      a,[hl+]
    sub     32
    ld      [de],a
    inc     de
    dec     b
    jr      nz,.nonameloop
    ret

OutOfBoundText:
    db      "OUTOFBOUND"
    
; ============
; Sprite stuff
; ============

CopyDMARoutine::
    ld      bc,$80 + ((_OAM_DMA_End-_OAM_DMA) << 8)
    ld      hl,_OAM_DMA
.loop
    ld      a,[hl+]
    ld      [c],a
    inc     c
    dec     b
    jr      nz,.loop
    ret
    
_OAM_DMA::
    ld      a,high(SpriteBuffer)
    ldh     [rDMA],a
    ld      a,$28
.wait
    dec     a
    jr      nz,.wait
    ret
_OAM_DMA_End:

; =============
; Misc routines
; =============

PtrToHL::
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ret
    
PtrToDE::
    ld      a,[hl+]
    ld      d,[hl]
    ld      e,a
    ret

; =============
; Pokemon names
; =============

NUM_MONS = 260 ;put the number of pokemon names added here

;section    "Pokemon names",romx,bank[2]    
PokemonNames::
    db      "BULBASAUR "
    db      "IVYSAUR   "
    db      "VENUSAUR  "
    db      "CHARMANDER"
    db      "CHARMELEON"
    db      "CHARIZARD "
    db      "SQUIRTLE  "
    db      "WARTORTLE "
    db      "BLASTOISE "
    db      "CATERPIE  "
    db      "METAPOD   "
    db      "BUTTERFREE"
    db      "WEEDLE    "
    db      "KAKUNA    "
    db      "BEEDRILL  "
    db      "PIDGEY    "
    db      "PIDGEOTTO "
    db      "PIDGEOT   "
    db      "RATTATA   "
    db      "RATICATE  "
    db      "SPEAROW   "
    db      "FEAROW    "
    db      "EKANS     "
    db      "ARBOK     "
    db      "PIKACHU   "
    db      "RAICHU    "
    db      "SANDSHREW "
    db      "SANDSLASH "
    db      "NIDORAN",$80,"  "
    db      "NIDORINA  "
    db      "NIDOQUEEN "
    db      "NIDORAN",$81,"  "
    db      "NIDORINO  "
    db      "NIDOKING  "
    db      "CLEFAIRY  "
    db      "CLEFABLE  "
    db      "VULPIX    "
    db      "NINETALES "
    db      "JIGGLYPUFF"
    db      "WIGGLYTUFF"
    db      "ZUBAT     "
    db      "GOLBAT    "
    db      "ODDISH    "
    db      "GLOOM     "
    db      "VILEPLUME "
    db      "PARAS     "
    db      "PARASECT  "
    db      "VENONAT   "
    db      "VENOMOTH  "
    db      "DIGLETT   "
    db      "DUGTRIO   "
    db      "MEOWTH    "
    db      "PERSIAN   "
    db      "PSYDUCK   "
    db      "GOLDUCK   "
    db      "MANKEY    "
    db      "PRIMEAPE  "
    db      "GROWLITHE "
    db      "ARCANINE  "
    db      "POLIWAG   "
    db      "POLIWHIRL "
    db      "POLIWRATH "
    db      "ABRA      "
    db      "KADABRA   "
    db      "ALAKAZAM  "
    db      "MACHOP    "
    db      "MACHOKE   "
    db      "MACHAMP   "
    db      "BELLSPROUT"
    db      "WEEPINBELL"
    db      "VICTREEBEL"
    db      "TENTACOOL "
    db      "TENTACRUEL"
    db      "GEODUDE   "
    db      "GRAVELER  "
    db      "GOLEM     "
    db      "PONYTA    "
    db      "RAPIDASH  "
    db      "SLOWPOKE  "
    db      "SLOWBRO   "
    db      "MAGNEMITE "
    db      "MAGNETON  "
    db      "FARFETCH'D"
    db      "DODUO     "
    db      "DODRIO    "
    db      "SEEL      "
    db      "DEWGONG   "
    db      "GRIMER    "
    db      "MUK       "
    db      "SHELLDER  "
    db      "CLOYSTER  "
    db      "GASTLY    "
    db      "HAUNTER   "
    db      "GENGAR    "
    db      "ONIX      "
    db      "DROWZEE   "
    db      "HYPNO     "
    db      "KRABBY    "
    db      "KINGLER   "
    db      "VOLTORB   "
    db      "ELECTRODE "
    db      "EXEGGCUTE "
    db      "EXEGGUTOR "
    db      "CUBONE    "
    db      "MAROWAK   "
    db      "HITMONLEE "
    db      "HITMONCHAN"
    db      "LICKITUNG "
    db      "KOFFING   "
    db      "WEEZING   "
    db      "RHYHORN   "
    db      "RHYDON    "
    db      "CHANSEY   "
    db      "TANGELA   "
    db      "KANGASKHAN"
    db      "HORSEA    "
    db      "SEADRA    "
    db      "GOLDEEN   "
    db      "SEAKING   "
    db      "STARYU    "
    db      "STARMIE   "
    db      "MR.MIME   "
    db      "SCYTHER   "
    db      "JYNX      "
    db      "ELECTABUZZ"
    db      "MAGMAR    "
    db      "PINSIR    "
    db      "TAUROS    "
    db      "MAGIKARP  "
    db      "GYARADOS  "
    db      "LAPRAS    "
    db      "DITTO     "
    db      "EEVEE     "
    db      "VAPOREON  "
    db      "JOLTEON   "
    db      "FLAREON   "
    db      "PORYGON   "
    db      "OMANYTE   "
    db      "OMASTAR   "
    db      "KABUTO    "
    db      "KABUTOPS  "
    db      "AERODACTYL"
    db      "SNORLAX   "
    db      "ARTICUNO  "
    db      "ZAPDOS    "
    db      "MOLTRES   "
    db      "DRATINI   "
    db      "DRAGONAIR "
    db      "DRAGONITE "
    db      "MEWTWO    "
    db      "MEW       "
    db      "CHIKORITA "
    db      "BAYLEEF   "
    db      "MEGANIUM  "
    db      "CYNDAQUIL "
    db      "QUILAVA   "
    db      "TYPHLOSION"
    db      "TOTODILE  "
    db      "CROCONAW  "
    db      "FERALIGATR"
    db      "SENTRET   "
    db      "FURRET    "
    db      "HOOTHOOT  "
    db      "NOCTOWL   "
    db      "LEDYBA    "
    db      "LEDIAN    "
    db      "SPINARAK  "
    db      "ARIADOS   "
    db      "CROBAT    "
    db      "CHINCHOU  "
    db      "LANTURN   "
    db      "PICHU     "
    db      "CLEFFA    "
    db      "IGGLYBUFF "
    db      "TOGEPI    "
    db      "TOGETIC   "
    db      "NATU      "
    db      "XATU      "
    db      "MAREEP    "
    db      "FLAAFFY   "
    db      "AMPHAROS  "
    db      "BELLOSSOM "
    db      "MARILL    "
    db      "AZUMARILL "
    db      "SUDOWOODO "
    db      "POLITOED  "
    db      "HOPPIP    "
    db      "SKIPLOOM  "
    db      "JUMPLUFF  "
    db      "AIPOM     "
    db      "SUNKERN   "
    db      "SUNFLORA  "
    db      "YANMA     "
    db      "WOOPER    "
    db      "QUAGSIRE  "
    db      "ESPEON    "
    db      "UMBREON   "
    db      "MURKROW   "
    db      "SLOWKING  "
    db      "MISDREAVUS"
    db      "UNOWN     "
    db      "WOBBUFFET "
    db      "GIRAFARIG "
    db      "PINECO    "
    db      "FORRETRESS"
    db      "DUNSPARCE "
    db      "GLIGAR    "
    db      "STEELIX   "
    db      "SNUBBULL  "
    db      "GRANBULL  "
    db      "QWILFISH  "
    db      "SCIZOR    "
    db      "SHUCKLE   "
    db      "HERACROSS "
    db      "SNEASEL   "
    db      "TEDDIURSA "
    db      "URSARING  "
    db      "SLUGMA    "
    db      "MAGCARGO  "
    db      "SWINUB    "
    db      "PILOSWINE "
    db      "CORSOLA   "
    db      "REMORAID  "
    db      "OCTILLERY "
    db      "DELIBIRD  "
    db      "MANTINE   "
    db      "SKARMORY  "
    db      "HOUNDOUR  "
    db      "HOUNDOOM  "
    db      "KINGDRA   "
    db      "PHANPY    "
    db      "DONPHAN   "
    db      "PORYGON2  "
    db      "STANTLER  "
    db      "SMEARGLE  "
    db      "TYROGUE   "
    db      "HITMONTOP "
    db      "SMOOCHUM  "
    db      "ELEKID    "
    db      "MAGBY     "
    db      "MILTANK   "
    db      "BLISSEY   "
    db      "RAIKOU    "
    db      "ENTEI     "
    db      "SUICUNE   "
    db      "LARVITAR  "
    db      "PUPITAR   "
    db      "TYRANITAR "
    db      "LUGIA     "
    db      "HO-OH     "
    db      "CELEBI    "
    db      "TREECKO   "
    db      "GROVYLE   "
    db      "SCEPTILE  "
    db      "TORCHIC   "
    db      "COMBUSKEN "
    db      "BLAZIKEN  "
    db      "MUDKIP    "
    db      "MARSHSTOMP"
    db      "SWAMPERT  "


; ===========
; Sound stuff
; ===========

include     "audio.asm"
