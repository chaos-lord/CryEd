; ===============
; System routines
; ===============

; ================================================================
; Check joypad input
; ================================================================

CheckInput:
	ld	a,P1F_5
	ld	[rJOYP],a
	ld	a,[rJOYP]
	ld	a,[rJOYP]
	cpl
	and	a,$f
	swap	a
	ld	b,a
	
	ld	a,P1F_4
	ld	[rJOYP],a
	ld	a,[rJOYP]
	ld	a,[rJOYP]
	ld	a,[rJOYP]
	ld	a,[rJOYP]
	ld	a,[rJOYP]
	ld	a,[rJOYP]
	cpl
	and	a,$f
	or	a,b
	ld	b,a
	
	ld	a,[sys_btnHold]
	xor	a,b
	and	a,b
	ld	[sys_btnPress],a
	ld	a,b
	ld	[sys_btnHold],a
	ld	a,P1F_5|P1F_4
	ld	[rJOYP],a
	ret

; ================================================================
; Draw hexadecimal number A at HL
; ================================================================

DrawHex:
	push	af
	swap	a
	call	.loop1
	pop	af
.loop1
	and	$f
	cp	$a
	jr	c,.loop2
	add	a,$7
.loop2
	add	a,$10
	push	af
	ldh	a,[rSTAT]
	and	2
	jr	nz,@-4
	pop	af
	ld	[hl+],a
	ret
	
DrawHexDigit:
	and	$f
	cp	$a
	jr	c,.carry
	add	a,$7
.carry
	add	a,$10
	push	af
	ldh	a,[rSTAT]
	and	2
	jr	nz,@-4
	pop	af
	ld	[hl+],a
	ret
	
; ================================================================	
; Draw binary number A at HL
; ================================================================

DrawBin:
	ld	c,a
	ld	a,l
	add	7
	ld	l,a
	jr	nc,.nocarry
	inc	h
.nocarry
	ld	b,8
	ld	a,c
.loop
	rra
	jr	c,.one
	ld	[hl],"0"-32
.chkloop
	dec	hl
	dec	b
	jr	nz,.loop
	ret
.one
	ld	[hl],"1"-32
	jr	.chkloop
	
; ================================================================
; Load a text tilemap
; ================================================================

LoadMapText:
	ld	de,_SCRN0
	ld	bc,$1214
.loop
	ld	a,[hl+]
	sub 32	
	ld	[de],a
	inc	de
	dec	c
	jr	nz,.loop
	ld	c,$14
	ld	a,e
	add	$c
	jr	nc,.continue
	inc	d
.continue
	ld	e,a
	dec	b
	jr	nz,.loop
	ret
