write "..\BldZX\spectest.bin"

org &8000
SOF:

	ld hl,&4000
	ld c,0

NextLine:
	ld b,32
	push hl
	nextPixel:
		ld (hl),c
		inc hl
		djnz nextPixel
	pop hl

	call GetNxtLin
	inc c
	ld a,c
	cp 191
	jp c,NextLine

ret






GetNxtLin:
	inc h
	ld a,h
	and  %00000111;7
	ret nz
	ld a,l
	add a,%00100000;32
	ld l,a
	ret c
	ld a,h
	sub %00001000;8
	ld h,a

ret




