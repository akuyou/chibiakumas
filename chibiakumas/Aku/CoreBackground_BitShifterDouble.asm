; This routine can 'bitshift' a 2x2 grid of pixels, it is useful for Quad and QuadSprite background routines, as these have no way of handling scrolling
; so code like this must scroll the data for them

BitShifterDouble:
;	ld hl,Tile_Start+7	; Sourcemempos
;	ld b,&8		; Bytes per line
;	ld c,16		; lines

BitShifterDoubleAgain:
	push bc

	;SCF	;clear the carry flag
	;CCF
	or a   ; Clear carry flag
	ld e,0	; e remembers the overflow from the last byte X---
	push hl
BitShifterDoubleloop:	
		ld a,(hl)	; load memory
		ld d,a		; backup for later
if BuildCPCv+BuildENTv
	      	and &33		; keep XXX-
		rla;RRA		; shift right -XXX
		rla
		or e		; add e X---
	 	ld (hl),a	; put it onscreen

		ld a,d		; restore backup
		and &FF-&33;&11		; Keep leftmost ---X

		rra;rla		; Shift Left x3 = X---
		rra;rla
		;rra;rla

endif
ifdef buildZXS	
		and %00111111
		rla
		rla
		or e		; add e X---
	 	ld (hl),a	; put it onscreen
		ld a,d		; restore backup
		and %11000000
		rlca		;wrap around
		rlca		;wrap around
endif
		ld e,a		; store in E for next byte
		dec l ;inc l		; screen byte

		djnz BitShifterDoubleloop
		pop hl
		ld a,(hl)
		or e
		ld (hl),a
	pop bc
	ld a,b
	add l
	ld l,a
	dec c
	jp nz,BitShifterDoubleAgain
	ret
