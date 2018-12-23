org &8000
	ld hl,&C000
	ld c,0

NextLine:
	ld b,80
	push hl
	nextPixel:
		ld (hl),c
		inc hl
		djnz nextPixel
	pop hl

	call GetNxtLin
	inc c
	ld a,c
	cp 199
	jp c,NextLine

ret

GetNxtLin:
	;ld de,&800

;	jp GetNxtLinMain GetNxtLinJump_Plus2
	;ld a,(ScreenBuffer_ActiveScreen)
	;cp &c0
	;jr NZ,GetNxtLinAlt
	ld a,h
	add a,&08
	ld h,a

GetNextLineScreenLoopCheck_Minus1:
	bit 7,h
	ret nz

	ld de,&c050
	add hl,de
	ret
