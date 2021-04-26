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

SECTION "Audio RAM", WRAM0[$c100]

; nonzero if playing
wMusicPlaying:: db

wAudio::
	table_width CHANNEL_STRUCT_LENGTH, wAudio
wChannel1:: channel_struct wChannel1
wChannel2:: channel_struct wChannel2
wChannel3:: channel_struct wChannel3
wChannel4:: channel_struct wChannel4
	assert_table_length NUM_MUSIC_CHANS
wChannel5:: channel_struct wChannel5
wChannel6:: channel_struct wChannel6
wChannel7:: channel_struct wChannel7
wChannel8:: channel_struct wChannel8
	assert_table_length NUM_CHANNELS

	ds 1

wCurTrackDuty:: db
wCurTrackVolumeEnvelope:: db
wCurTrackFrequency:: dw
wUnusedBCDNumber:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

wCurMusicByte:: db
wCurChannel:: db
wVolume::
; corresponds to rNR50
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
wSoundOutput::
; corresponds to rNR51
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
wPitchSweep::
; corresponds to rNR10
; bit 7:   unused
; bit 4-6: sweep time
; bit 3:   sweep direction
; but 0-2: sweep shift
	db

wMusicID:: dw
wMusicBank:: db
wNoiseSampleAddress:: dw
wNoiseSampleDelay:: db
	ds 1
wMusicNoiseSampleSet:: db
wSFXNoiseSampleSet:: db

wLowHealthAlarm::
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade::
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db
wMusicFadeID:: dw

	ds 5

wCryPitch:: dw
wCryLength:: dw

wLastVolume:: db
wUnusedMusicF9Flag:: db

wSFXPriority::
; if nonzero, turn off music when playing sfx
	db

	ds 1

wChannel1JumpCondition:: db
wChannel2JumpCondition:: db
wChannel3JumpCondition:: db
wChannel4JumpCondition:: db

wStereoPanningMask:: db

wCryTracks::
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
wCurSFX::
; id of sfx currently playing
	db

wAudioEnd::

wMapMusic:: db

wDontPlayMapMusicOnReload:: db
wOptions::	db

section	"Hram", HRAM[$FF80]

INCLUDE "hram.asm"
