;This will overwrite &8000-&8101 and &8181
;Yes it sucks! but what can you do?!?

;need defs 387 at &8000 - or equivalent, there is a gap beween &8101 and &8181

;org &8000
;FileStart:
;jp LetsGo
;defs 387-3


INT_Define:	;Jump to HL on interrupt
	ld (&8182),hl
	ld a,&C3
	ld (&8181),a

	ld hl,&8000
	ld de,&8001
	ld a,&81
	ld (hl),a
	ld bc,&0101
	ldir
	dec a
	;ld a,&80
	ld i,a
ret

INT_Init:
im 2
ei

ret



INT_Execute:


	push af
	push bc
	push de
	push hl
	push ix
	push iy
	exx
	ex af,af'
	push af
	push bc
	push de
	push hl


		ld hl,null
		ld (InterruptForcePos_Plus2-2),hl

		ld a,Akuyou_Music_Bank
		call Bankswapper_Set

;		ld a,i
;		push af
		call PLY_Play
;		pop af
;		ld i,a
		call Bankswapper_Reset


	pop hl
	pop de
	pop bc
	pop af

	ex af,af'
	exx

	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	pop af



	ei
ret


INT_ExecuteQuick:
di
	ld hl,null
	ld (InterruptForcePos_Plus2-2),hl
	ld a,Akuyou_Music_Bank
	call Bankswapper_Set
	call PLY_Play
	call Bankswapper_Reset
ei
ret


INT_Force:
	call null :InterruptForcePos_Plus2
INT_ForceDone:
	ld hl,INT_ExecuteQuick
	ld (InterruptForcePos_Plus2-2),hl
ret