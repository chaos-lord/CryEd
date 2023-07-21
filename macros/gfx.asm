MACRO assert_valid_rgb
	rept _NARG
		assert 0 <= (\1) && (\1) <= 31, "RGB channel must be 0-31"
		shift
	endr
ENDM

MACRO RGB
	rept _NARG / 3
		assert_valid_rgb \1, \2, \3
		dw palred (\1) + palgreen (\2) + palblue (\3)
		shift 3
	endr
ENDM

DEF palred   EQUS "(1 << 0) *"
DEF palgreen EQUS "(1 << 5) *"
DEF palblue  EQUS "(1 << 10) *"

DEF palettes EQUS "* PALETTE_SIZE"
DEF palette  EQUS "+ PALETTE_SIZE *"
DEF color    EQUS "+ PAL_COLOR_SIZE *"

DEF tiles EQUS "* LEN_2BPP_TILE"
DEF tile  EQUS "+ LEN_2BPP_TILE *"

; extracts the middle two colors from a 2bpp binary palette
; example usage:
; INCBIN "foo.gbcpal", middle_colors
DEF middle_colors EQUS "PAL_COLOR_SIZE, PAL_COLOR_SIZE * 2"

; Loads a DMG palette.
; USAGE: SetPal <rBGP/rOBP0/rOBP1>, (color 1), (color 2), (color 3), (color 4)
MACRO SetDMGPal
	ld		a, (\2 + (\3 << 2) + (\4 << 4) + (\5 << 6))
	ldh		[\1], a
ENDM
	
; Wait for VRAM accessibility.
MACRO WaitForVRAM
	ldh		a, [rSTAT]
	and		2
	jr		nz, @-4
ENDM
	
; Same as CopyTileset1BPP but inverts the tileset
; USAGE: CopyTileset1BPP [tileset], [VRAM address], [number of tiles to copy]
MACRO CopyTileset1BPPInvert
	ld		bc, $10*\3		; number of tiles to copy
	ld		hl, \1			; address of tiles to copy
	ld		de, $8000+\2	; address to copy to
	call	_CopyTileset1BPPInvert
ENDM
