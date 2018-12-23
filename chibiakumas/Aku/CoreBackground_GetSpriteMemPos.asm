;note this has changed!

;Feed in Spritenum as A
;put sprite bank pos in DE
;sprite pos is returned in DE
GetSpriteMempos:
	push hl
		ex hl,de
		ld c,a
		ld b,0
	        or a ; only done to clear carry flag
		rl b
		rl c
		ld d,h
		ld e,l
		add hl,bc
		add hl,bc	; 6 bytes per sprite
		add hl,bc
		inc hl
		inc hl
		inc hl
		inc hl
		ld a,(hl)
		inc hl
		ld h,(hl)
		ld l,a
		add hl,de
		ex hl,de
	pop hl
	ret