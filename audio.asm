; because apparently Pokemon Crystal's audio code needs these
rNR20	equ	$ff15
rNR40	equ	$ff1f
rWave_0     EQU $ff30
rWave_1     EQU $ff31
rWave_2     EQU $ff32
rWave_3     EQU $ff33
rWave_4     EQU $ff34
rWave_5     EQU $ff35
rWave_6     EQU $ff36
rWave_7     EQU $ff37
rWave_8     EQU $ff38
rWave_9     EQU $ff39
rWave_a     EQU $ff3a
rWave_b     EQU $ff3b
rWave_c     EQU $ff3c
rWave_d     EQU $ff3d
rWave_e     EQU $ff3e
rWave_f     EQU $ff3f

; Enumerate variables
enum_start: MACRO
if _NARG >= 1
__enum__ = \1
else
__enum__ = 0
endc
if _NARG >= 2
__enumdir__ = \2
else
__enumdir__ = +1
endc
ENDM

enum: MACRO
\1 = __enum__
__enum__ = __enum__ + __enumdir__
ENDM

enum_set: MACRO
__enum__ = \1
ENDM

; Enumerate constants
const_def: MACRO
if _NARG >= 1
const_value = \1
else
const_value = 0
endc
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + 1
ENDM

shift_const: MACRO
\1 EQU (1 << const_value)
const_value = const_value + 1
ENDM

; ========

; Value macros

percent EQUS "* $ff / 100"


; Constant data (db, dw, dl) macros

dwb: MACRO
	dw \1
	db \2
ENDM

dbbw: MACRO
	db \1, \2
	dw \3
ENDM

dbww: MACRO
	db \1
	dw \2, \3
ENDM

dbwww: MACRO
	db \1
	dw \2, \3, \4
ENDM

dn: MACRO ; nybbles
rept _NARG / 2
	db ((\1) << 4) | (\2)
	shift
	shift
endr
ENDM

dc: MACRO ; "crumbs"
rept _NARG / 4
	db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | (\4)
	shift
	shift
	shift
	shift
endr
ENDM

dx: MACRO
x = 8 * ((\1) - 1)
rept \1
	db ((\2) >> x) & $ff
x = x + -8
endr
ENDM

dt: MACRO ; three-byte (big-endian)
	dx 3, \1
ENDM

dd: MACRO ; four-byte (big-endian)
	dx 4, \1
ENDM

bigdw: MACRO ; big-endian word
	dx 2, \1
ENDM

dba: MACRO ; dbw bank, address
rept _NARG
	dbw BANK(\1), \1
	shift
endr
ENDM

dab: MACRO ; dwb address, bank
rept _NARG
	dwb \1, BANK(\1)
	shift
endr
ENDM

dba_pic: MACRO ; dbw bank, address
	db BANK(\1) - PICS_FIX
	dw \1
ENDM


dbpixel: MACRO
if _NARG >= 4
; x tile, x pxl, y tile, y pxl
	db \1 * 8 + \3, \2 * 8 + \4
else
; x, y
	db \1 * 8, \2 * 8
endc
ENDM

dsprite: MACRO
; y tile, y pxl, x tile, x pxl, vtile offset, flags, attributes
	db (\1 * 8) % $100 + \2, (\3 * 8) % $100 + \4, \5, \6
ENDM


menu_coords: MACRO
; x1, y1, x2, y2
	db \2, \1 ; start coords
	db \4, \3 ; end coords
ENDM


bcd: MACRO
rept _NARG
	dn ((\1) % 100) / 10, (\1) % 10
	shift
endr
ENDM


sine_table: MACRO
; \1 samples of sin(x) from x=0 to x<32768 (pi radians)
x = 0
rept \1
	dw (sin(x) + (sin(x) & $ff)) >> 8 ; round up
x = x + DIV(32768, \1) ; a circle has 65536 "degrees"
endr
ENDM


; ========

include	"audio_constants.asm"
include	"cry_constants.asm"
include	"music_constants.asm"
include	"sfx_constants.asm"

channel_struct: MACRO
; Addreses are wChannel1 (c101).
\1MusicID::           dw
\1MusicBank::         db
\1Flags::             db ; 0:on/off 1:subroutine 3:sfx 4:noise 5:rest
\1Flags2::            db ; 0:vibrato on/off 2:duty 4:cry pitch
\1Flags3::            db ; 0:vibrato up/down
\1MusicAddress::      dw
\1LastMusicAddress::  dw
                      dw
\1NoteFlags::         db ; 5:rest
\1Condition::         db ; conditional jumps
\1DutyCycle::         db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1Intensity::         db ; hi:pressure lo:velocity
\1Frequency:: ; 11 bits
\1FrequencyLo::       db
\1FrequencyHi::       db
\1Pitch::             db ; 0:rest 1-c:note
\1Octave::            db ; 7-0 (0 is highest)
\1PitchOffset::       db ; raises existing octaves (to repeat phrases)
\1NoteDuration::      db ; frames remaining for the current note
\1Field16::           ds 1 ; c117
                      ds 1 ; c118
\1LoopCount::         db
\1Tempo::             dw
\1Tracks::            db ; hi:left lo:right
\1SFXDutyLoop::       db ; c11d
\1VibratoDelayCount:: db ; initialized by \1VibratoDelay
\1VibratoDelay::      db ; number of frames a note plays until vibrato starts
\1VibratoExtent::     db
\1VibratoRate::       db ; hi:frames for each alt lo:frames to the next alt
\1PitchWheelTarget::  dw ; frequency endpoint for pitch wheel
\1PitchWheelAmount::  db ; c124
\1PitchWheelAmountFraction::   db ; c125
\1Field25::           db ; c126
                      ds 1 ; c127
\1CryPitch::          dw
\1Field29::           ds 1
\1Field2a::           ds 2
\1Field2c::           ds 1
\1NoteLength::        db ; frames per 16th note
\1Field2e::           ds 1 ; c12f
\1Field2f::           ds 1 ; c130
\1Field30::           ds 1 ; c131
                      ds 1 ; c132
ENDM

maskbits: MACRO
; masks just enough bits to cover the argument
; e.g. "maskbits 26" becomes "and %00011111" (since 26 - 1 = %00011001)
; example usage in rejection sampling:
; .loop
; 	call Random
; 	maskbits 26
; 	cp 26
; 	jr nc, .loop
x = 1
rept 8
if x + 1 < (\1)
x = x << 1 | 1
endc
endr
	and x
ENDM

musicheader: MACRO
	; number of tracks, track idx, address
	dbw ((\1 - 1) << 6) + (\2 - 1), \3
ENDM

note: MACRO
	dn (\1), (\2) - 1
ENDM

sound: MACRO
	note \1, \2
	db \3 ; intensity
	dw \4 ; frequency
ENDM

noise: MACRO
	note \1, \2 ; duration
	db \3 ; intensity
	db \4 ; frequency
ENDM

; MusicCommands indexes (see audio/engine.asm)
	enum_start $d8

	enum notetype_cmd ; $d8
octave: MACRO
	db notetype_cmd - (\1)
ENDM

notetype: MACRO
	db notetype_cmd
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
ENDM

	enum pitchoffset_cmd ; $d9
pitchoffset: MACRO
	db pitchoffset_cmd
	dn \1, \2 - 1 ; octave, key
ENDM

	enum tempo_cmd ; $da
tempo: MACRO
	db tempo_cmd
	bigdw \1 ; tempo
ENDM

	enum dutycycle_cmd ; $db
dutycycle: MACRO
	db dutycycle_cmd
	db \1 ; duty_cycle
ENDM

	enum intensity_cmd ; $dc
intensity: MACRO
	db intensity_cmd
	db \1 ; intensity
ENDM

	enum soundinput_cmd ; $dd
soundinput: MACRO
	db soundinput_cmd
	db \1 ; input
ENDM

	enum sound_duty_cmd ; $de
sound_duty: MACRO
	db sound_duty_cmd
	if _NARG == 4
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6) ; duty sequence
	else
	db \1 ; one-byte duty value for legacy support
	endc
ENDM

	enum togglesfx_cmd ; $df
togglesfx: MACRO
	db togglesfx_cmd
ENDM

	enum slidepitchto_cmd ; $e0
slidepitchto: MACRO
	db slidepitchto_cmd
	db \1 - 1 ; duration
	dn \2, \3 ; octave, pitch
ENDM

	enum vibrato_cmd ; $e1
vibrato: MACRO
	db vibrato_cmd
	db \1 ; delay
	db \2 ; extent
ENDM

	enum unknownmusic0xe2_cmd ; $e2
unknownmusic0xe2: MACRO
	db unknownmusic0xe2_cmd
	db \1 ; unknown
ENDM

	enum togglenoise_cmd ; $e3
togglenoise: MACRO
	db togglenoise_cmd
	db \1 ; id
ENDM

	enum panning_cmd ; $e4
panning: MACRO
	db panning_cmd
	db \1 ; tracks
ENDM

	enum volume_cmd ; $e5
volume: MACRO
	db volume_cmd
	db \1 ; volume
ENDM

	enum tone_cmd ; $e6
tone: MACRO
	db tone_cmd
	bigdw \1 ; tone
ENDM

	enum unknownmusic0xe7_cmd ; $e7
unknownmusic0xe7: MACRO
	db unknownmusic0xe7_cmd
	db \1 ; unknown
ENDM

	enum unknownmusic0xe8_cmd ; $e8
unknownmusic0xe8: MACRO
	db unknownmusic0xe8_cmd
	db \1 ; unknown
ENDM

	enum tempo_relative_cmd ; $e9
tempo_relative: MACRO
	db tempo_relative_cmd
	bigdw \1 ; value
ENDM

	enum restartchannel_cmd ; $ea
restartchannel: MACRO
	db restartchannel_cmd
	dw \1 ; address
ENDM

	enum newsong_cmd ; $eb
newsong: MACRO
	db newsong_cmd
	bigdw \1 ; id
ENDM

	enum sfxpriorityon_cmd ; $ec
sfxpriorityon: MACRO
	db sfxpriorityon_cmd
ENDM

	enum sfxpriorityoff_cmd ; $ed
sfxpriorityoff: MACRO
	db sfxpriorityoff_cmd
ENDM

	enum unknownmusic0xee_cmd ; $ee
unknownmusic0xee: MACRO
	db unknownmusic0xee_cmd
	dw \1 ; address
ENDM

	enum stereopanning_cmd ; $ef
stereopanning: MACRO
	db stereopanning_cmd
	db \1 ; tracks
ENDM

	enum sfxtogglenoise_cmd ; $f0
sfxtogglenoise: MACRO
	db sfxtogglenoise_cmd
	db \1 ; id
ENDM

	enum music0xf1_cmd ; $f1
music0xf1: MACRO
	db music0xf1_cmd
ENDM

	enum music0xf2_cmd ; $f2
music0xf2: MACRO
	db music0xf2_cmd
ENDM

	enum music0xf3_cmd ; $f3
music0xf3: MACRO
	db music0xf3_cmd
ENDM

	enum music0xf4_cmd ; $f4
music0xf4: MACRO
	db music0xf4_cmd
ENDM

	enum music0xf5_cmd ; $f5
music0xf5: MACRO
	db music0xf5_cmd
ENDM

	enum music0xf6_cmd ; $f6
music0xf6: MACRO
	db music0xf6_cmd
ENDM

	enum music0xf7_cmd ; $f7
music0xf7: MACRO
	db music0xf7_cmd
ENDM

	enum music0xf8_cmd ; $f8
music0xf8: MACRO
	db music0xf8_cmd
ENDM

	enum unknownmusic0xf9_cmd ; $f9
unknownmusic0xf9: MACRO
	db unknownmusic0xf9_cmd
ENDM

	enum setcondition_cmd ; $fa
setcondition: MACRO
	db setcondition_cmd
	db \1 ; condition
ENDM

	enum jumpif_cmd ; $fb
jumpif: MACRO
	db jumpif_cmd
	db \1 ; condition
	dw \2 ; address
ENDM

	enum jumpchannel_cmd ; $fc
jumpchannel: MACRO
	db jumpchannel_cmd
	dw \1 ; address
ENDM

	enum loopchannel_cmd ; $fd
loopchannel: MACRO
	db loopchannel_cmd
	db \1 ; count
	dw \2 ; address
ENDM

	enum callchannel_cmd ; $fe
callchannel: MACRO
	db callchannel_cmd
	dw \1 ; address
ENDM

	enum endchannel_cmd ; $ff
endchannel: MACRO
	db endchannel_cmd
ENDM

SECTION "Audio RAM", WRAM0[$c100]

wMusic::

; nonzero if playing
wMusicPlaying:: db ; c100

wChannels::
wChannel1:: channel_struct wChannel1 ; c101
wChannel2:: channel_struct wChannel2 ; c133
wChannel3:: channel_struct wChannel3 ; c165
wChannel4:: channel_struct wChannel4 ; c197

wSFXChannels::
wChannel5:: channel_struct wChannel5 ; c1c9
wChannel6:: channel_struct wChannel6 ; c1fb
wChannel7:: channel_struct wChannel7 ; c22d
wChannel8:: channel_struct wChannel8 ; c25f

	ds 1 ; c291

wCurTrackDuty:: db
wCurTrackIntensity:: db
wCurTrackFrequency:: dw
wc296:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

wCurMusicByte:: db ; c298
wCurChannel:: db ; c299
wVolume:: ; c29a
; corresponds to $ff24
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
wSoundOutput:: ; c29b
; corresponds to $ff25
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
wSoundInput:: ; c29c
; corresponds to $ff26
; bit 7: global on/off
; bit 0: ch1 on/off
; bit 1: ch2 on/off
; bit 2: ch3 on/off
; bit 3: ch4 on/off
	db

wMusicID:: dw ; c29d
wMusicBank:: db ; c29f
wNoiseSampleAddress:: dw ; c2a0
wNoiseSampleDelay:: db ; c2a2
	ds 1 ; c2a3
wMusicNoiseSampleSet:: db ; c2a4
wSFXNoiseSampleSet:: db ; c2a5

wLowHealthAlarm:: ; c2a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade:: ; c2a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db ; c2a8
wMusicFadeID:: dw ; c2a9

	ds 5

wCryPitch:: dw ; c2b0
wCryLength:: dw ; c2b2

wLastVolume:: db ; c2b4
wc2b5:: db ; c2b5

wSFXPriority:: ; c2b6
; if nonzero, turn off music when playing sfx
	db

	ds 1

wChannel1JumpCondition:: db
wChannel2JumpCondition:: db
wChannel3JumpCondition:: db
wChannel4JumpCondition:: db

wStereoPanningMask:: db ; c2bc

wCryTracks:: ; c2bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
wCurSFX:: ; c2bf
; id of sfx currently playing
	db
wChannelsEnd::

wMapMusic:: db ; c2c0

wDontPlayMapMusicOnReload:: db
wOptions::	db
wMusicEnd::

STEREO		equ	5

section "Audio stubs",rom0
; Audio interfaces.

MapSetup_Sound_Off:: ; 3b4e

	push hl
	push de
	push bc
	push af

	ld a, [sys_CurrentROMBank]
	push af
	ld a, BANK(_MapSetup_Sound_Off)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	call _MapSetup_Sound_Off

	pop af
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3b6a

UpdateSound:: ; 3b6a

	push hl
	push de
	push bc
	push af

	ld a, [sys_CurrentROMBank]
	push af
	ld a, BANK(_UpdateSound)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	call _UpdateSound

	pop af
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3b86


_LoadMusicByte:: ; 3b86
; wCurMusicByte = [a:de]
;GLOBAL LoadMusicByte

	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(LoadMusicByte)

	ld [sys_CurrentROMBank], a
	ld [rROMB0], a
	ret
; 3b97


PlayMusic:: ; 3b97
; Play music de.

	push hl
	push de
	push bc
	push af

	ld a, [sys_CurrentROMBank]
	push af
	ld a, BANK(_PlayMusic) ; and BANK(_MapSetup_Sound_Off)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	ld a, e
	and a
	jr z, .nomusic

	call _PlayMusic
	jr .end

.nomusic
	call _MapSetup_Sound_Off

.end
	pop af
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3bbc

PlayMusic2:: ; 3bbc
; Stop playing music, then play music de.

	push hl
	push de
	push bc
	push af

	ld a, [sys_CurrentROMBank]
	push af
	ld a, BANK(_PlayMusic)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	push de
	ld de, MUSIC_NONE
	call _PlayMusic
	pop de
	call _PlayMusic

	pop af
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	pop af
	pop bc
	pop de
	pop hl
	ret

; 3be3

PlayCry::
; Play cry de.
	push hl
	push de
	push bc
	push af

	ld a, [sys_CurrentROMBank]
	push af

	; Cries are stuck in one bank.
	ld a, BANK(PokemonCries)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	ld hl, PokemonCries
rept 6 ; sizeof(mon_cry)
	add hl, de
endr

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	ld a, BANK(_PlayCry)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	call _PlayCry

	pop af
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	pop af
	pop bc
	pop de
	pop hl
	ret
; 3c23


PlaySFX:: ; 3c23
; Play sound effect de.
; Sound effects are ordered by priority (highest to lowest)

	push hl
	push de
	push bc
	push af

	; Is something already playing?
	call CheckSFX
	jr nc, .play

	; Does it have priority?
	ld a, [wCurSFX]
	cp e
	jr c, .done

.play
	ld a, [sys_CurrentROMBank]
	push af
	ld a, BANK(_PlaySFX)
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

	ld a, e
	ld [wCurSFX], a
	call _PlaySFX

	pop af
	ld [sys_CurrentROMBank], a
	ld [rROMB0], a

.done
	pop af
	pop bc
	pop de
	pop hl
	ret
; 3c4e


WaitPlaySFX:: ; 3c4e
	call WaitSFX
	call PlaySFX
	ret
; 3c55


WaitSFX:: ; 3c55
; infinite loop until sfx is done playing

	push hl

.wait
	ld hl, wChannel5Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel6Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel7Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel8Flags
	bit 0, [hl]
	jr nz, .wait

	pop hl
	ret
; 3c74

IsSFXPlaying:: ; 3c74
; Return carry if no sound effect is playing.
; The inverse of CheckSFX.
	push hl

	ld hl, wChannel5Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel6Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel7Flags
	bit 0, [hl]
	jr nz, .playing
	ld hl, wChannel8Flags
	bit 0, [hl]
	jr nz, .playing

	pop hl
	scf
	ret

.playing
	pop hl
	and a
	ret
; 3c97

MaxVolume:: ; 3c97
	ld a, MAX_VOLUME
	ld [wVolume], a
	ret
; 3c9d

LowVolume:: ; 3c9d
	ld a, $33 ; 40%
	ld [wVolume], a
	ret
; 3ca3

VolumeOff:: ; 3ca3
	xor a
	ld [wVolume], a
	ret
; 3ca8

FadeOutMusic:: ; 3ca8
	ld a, 4
	ld [wMusicFade], a
	ret
; 3cae

FadeInMusic:: ; 3cae
	ld a, 4 | (1 << MUSIC_FADE_IN_F)
	ld [wMusicFade], a
	ret
; 3cb4

SkipMusic:: ; 3cb4
; Skip a frames of music.
.loop
	and a
	ret z
	dec a
	call UpdateSound
	jr .loop
; 3cbc


CheckSFX:: ; 3dde
; Return carry if any SFX channels are active.
	ld a, [wChannel5Flags]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel6Flags]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel7Flags]
	bit 0, a
	jr nz, .playing
	ld a, [wChannel8Flags]
	bit 0, a
	jr nz, .playing
	and a
	ret
.playing
	scf
	ret
; 3dfe

TerminateExpBarSound:: ; 3dfe
	xor a
	ld [wChannel5Flags], a
	ld [wSoundInput], a
	ld [rNR10], a
	ld [rNR11], a
	ld [rNR12], a
	ld [rNR13], a
	ld [rNR14], a
	ret
; 3e10


ChannelsOff:: ; 3e10
; Quickly turn off music channels
	xor a
	ld [wChannel1Flags], a
	ld [wChannel2Flags], a
	ld [wChannel3Flags], a
	ld [wChannel4Flags], a
	ld [wSoundInput], a
	ret
; 3e21

SFXChannelsOff:: ; 3e21
; Quickly turn off sound effect channels
	xor a
	ld [wChannel5Flags], a
	ld [wChannel6Flags], a
	ld [wChannel7Flags], a
	ld [wChannel8Flags], a
	ld [wSoundInput], a
	ret
; 3e32

SECTION "Audio", ROMX[$4000],bank[1]

INCLUDE "audio/engine.asm"
INCLUDE "audio/music_pointers.asm"
INCLUDE "audio/music/nothing.asm"
INCLUDE "audio/cry_pointers.asm"
INCLUDE "audio/sfx_pointers.asm"

SECTION "Songs 1", ROMX

SECTION "Sound Effects", ROMX,bank[1]

INCLUDE "audio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX,bank[1]

INCLUDE "audio/sfx_crystal.asm"



SECTION "Crydata", ROMX, bank[3]

INCLUDE "crydata.asm"

SECTION "Cries", rom0

INCLUDE "audio/cries.asm"
