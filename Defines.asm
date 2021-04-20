; ===============
; Project defines
; ===============

if	!def(definesIncluded)
definesIncluded	set	1

; Hardware defines
include	"hardware.inc"

; ================
; Global constants
; ================

sys_DMG			equ	0
sys_GBP			equ	1
sys_SGB			equ	2
sys_SGB2		equ	3
sys_GBC			equ	4
sys_GBA			equ	5

btnA			equ	0
btnB			equ	1
btnSelect		equ	2
btnStart		equ	3
btnRight		equ	4
btnLeft			equ	5
btnUp			equ	6
btnDown			equ	7

_A				equ	1
_B				equ	2
_Select			equ	4
_Start			equ	8
_Right			equ	16
_Left			equ	32
_Up				equ	64
_Down			equ	128

errno_Generic	equ	0
errno_Checksum	equ	1
errno_BufOver	equ	2
errno_BufUnder	equ	3
errno_Test		equ	4

; ==========================
; Project-specific constants
; ==========================

; ======
; Macros
; ======

; Copy a tileset to a specified VRAM address.
; USAGE: CopyTileset [tileset],[VRAM address],[number of tiles to copy]
CopyTileset:			macro
	ld		bc,$10*\3		; number of tiles to copy
	ld		hl,\1			; address of tiles to copy
	ld		de,$8000+\2		; address to copy to
	call	_CopyTileset
	endm
	
; Same as CopyTileset, but waits for VRAM accessibility.
CopyTilesetSafe:		macro
	ld		bc,$10*\3		; number of tiles to copy
	ld		hl,\1			; address of tiles to copy
	ld		de,$8000+\2		; address to copy to
	call	_CopyTilesetSafe
	endm
	
; Copy a 1BPP tileset to a specified VRAM address.
; USAGE: CopyTileset1BPP [tileset],[VRAM address],[number of tiles to copy]
CopyTileset1BPP:		macro
	ld		bc,$10*\3		; number of tiles to copy
	ld		hl,\1			; address of tiles to copy
	ld		de,$8000+\2		; address to copy to
	call	_CopyTileset1BPP
	endm
	
; Same as CopyTileset1BPP but inverts the tileset
; USAGE: CopyTileset1BPP [tileset],[VRAM address],[number of tiles to copy]
CopyTileset1BPPInvert:		macro
	ld		bc,$10*\3		; number of tiles to copy
	ld		hl,\1			; address of tiles to copy
	ld		de,$8000+\2		; address to copy to
	call	_CopyTileset1BPPInvert
	endm

; Same as CopyTileset1BPP, but waits for VRAM accessibility.
CopyTileset1BPPSafe:	macro
	ld		bc,$10*\3		; number of tiles to copy
	ld		hl,\1			; address of tiles to copy
	ld		de,$8000+\2		; address to copy to
	call	_CopyTileset1BPPSafe
	endm

; Loads a DMG palette.
; USAGE: SetPal <rBGP/rOBP0/rOBP1>,(color 1),(color 2),(color 3),(color 4)
SetDMGPal:				macro
	ld		a,(\2 + (\3 << 2) + (\4 << 4) + (\5 << 6))
	ldh		[\1],a
	endm
	
; Define ROM title.
romTitle:				macro
.str\@
	db		\1
.str\@_end
	rept	15-(.str\@_end-.str\@)
			db	0
	endr
	endm
endc

; Wait for VRAM accessibility.
WaitForVRAM:			macro
	ldh		a,[rSTAT]
	and		2
	jr		nz,@-4
	endm
	
RestoreStackPtr:		macro
	ld		hl,tempSP
	call	PtrToHL
	ld		sp,hl
	endm
	
dbw: macro
	db		\1
	dw		\2
endm

; =========
; Variables
; =========

section	"Variables",wram0[$c000]

SpriteBuffer:			ds	40*4	; 40 sprites, 4 bytes each

sys_GBType:				ds	1
sys_Errno:				ds	1
sys_CurrentFrame:		ds	1
sys_ResetTimer:			ds	1
sys_btnPress:			ds	1
sys_btnHold:			ds	1
sys_VBlankFlag:			ds	1
sys_TimerFlag:			ds	1
sys_LCDCFlag:			ds	1
sys_MenuPos:			ds	2
sys_MenuMax:			ds	1
sys_VBlankID:			ds	1
sys_StatID:				ds	1
sys_TimerID:			ds	1

CryEdit_CryBase:		ds	1
CryEdit_CryPitch:		ds	2
CryEdit_CryLength:		ds	2

SelectedSaveSlot:		ds	1

section "Zeropage",hram

OAM_DMA:				ds	16
tempAF:					ds	2
tempBC:					ds	2
tempDE:					ds	2
tempHL:					ds	2
tempSP:					ds	2

sys_CurrentROMBank:		ds	1
