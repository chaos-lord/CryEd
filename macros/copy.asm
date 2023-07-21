; Copy a 1BPP tileset to a specified VRAM address.
; USAGE: CopyTileset1BPP [tileset], [VRAM address], [number of tiles to copy]
MACRO CopyTileset1BPP
	ld		bc, $10*\3		; number of tiles to copy
	ld		hl, \1			; address of tiles to copy
	ld		de, $8000+\2		; address to copy to
	call	_CopyTileset1BPP
ENDM
