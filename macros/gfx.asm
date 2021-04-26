RGB: MACRO
rept _NARG / 3
	dw palred (\1) + palgreen (\2) + palblue (\3)
	shift 3
endr
ENDM

palred   EQUS "(1 << 0) *"
palgreen EQUS "(1 << 5) *"
palblue  EQUS "(1 << 10) *"

palettes EQUS "* PALETTE_SIZE"
palette  EQUS "+ PALETTE_SIZE *"
color    EQUS "+ PAL_COLOR_SIZE *"

tiles EQUS "* LEN_2BPP_TILE"
tile  EQUS "+ LEN_2BPP_TILE *"

; extracts the middle two colors from a 2bpp binary palette
; example usage:
; INCBIN "foo.gbcpal", middle_colors
middle_colors EQUS "PAL_COLOR_SIZE, PAL_COLOR_SIZE * 2"



; Loads a DMG palette.
; USAGE: SetPal <rBGP/rOBP0/rOBP1>,(color 1),(color 2),(color 3),(color 4)
SetDMGPal:				macro
	ld		a,(\2 + (\3 << 2) + (\4 << 4) + (\5 << 6))
	ldh		[\1],a
	endm
	
; Wait for VRAM accessibility.
WaitForVRAM:			macro
	ldh		a,[rSTAT]
	and		2
	jr		nz,@-4
	endm
	
; Same as CopyTileset1BPP but inverts the tileset
; USAGE: CopyTileset1BPP [tileset],[VRAM address],[number of tiles to copy]
CopyTileset1BPPInvert:		macro
	ld		bc,$10*\3		; number of tiles to copy
	ld		hl,\1			; address of tiles to copy
	ld		de,$8000+\2		; address to copy to
	call	_CopyTileset1BPPInvert
	endm
