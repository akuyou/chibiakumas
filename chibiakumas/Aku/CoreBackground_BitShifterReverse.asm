; This routine can 'bitshift' a 2x2 grid of pixels, it is useful for Quad and QuadSprite background routines, as these have no way of handling scrolling
; so code like this must scroll the data for them



; This routine can 'bitshift' a 2x2 grid of pixels, it is useful for Quad and QuadSprite background routines, as these have no way of handling scrolling
; so code like this must scroll the data for them

BitShifterRSkip:
	ld a,l
BitShifterRSkipB:
	add b
	ld l,a
	dec c
	jr nz,BitShifterRSkipB
	
ret


BitShifterReverse:
;	ifdef buildZXS
;		ld e,a
;		ld a,(Timer_TicksOccured_Plus1-1)
;		and e
;		jr z,BitShifterRSkip
;	endif
;	ifdef buildCPC
		and 0	:BitshifterRTicksOccured_Plus1
		jr z,BitShifterRSkip
;	endif

	ld a,l
	sub 7
	ld l,a

;	ld hl,Tile_Start+7	; Sourcemempos
;	ld b,&8		; Bytes per line
;	ld c,16		; lines

BitShifterReverseAgain:
	push bc

	;SCF	;clear the carry flag
	;CCF
	or a   ; Clear carry flag
	ld e,0	; e remembers the overflow from the last byte X---
	push hl

BitShifterReverseloop:	ld a,(hl)	; load memory
		ld d,a		; backup for later
ifdef BuildZXS
		and %11111110
		rra
		or e		; add e X---
	 	ld (hl),a	; put it onscreen
		ld a,d		; restore backup
		and %00000001
		rrca		;wrap around
endif
ifdef BuildCPC
	      	and %11101110;&EE		; keep XXX-
		RRA		; shift right -XXX
		or e		; add e X---
	 	ld (hl),a	; put it onscreen

		ld a,d		; restore backup
		and &FF-%11101110;&11		; Keep leftmost ---X

		rla		; Shift Left x3 = X---
		rla
		rla
endif
		ld e,a		; store in E for next byte

		inc l		; screen byte

		djnz BitShifterReverseloop
		pop hl
		ld a,(hl)
		or e
		ld (hl),a
	pop bc
	ld a,b

	add l
	ld l,a
	dec c
	jp nz,BitShifterReverseAgain

	ld a,l
	add 7
	ld l,a

	ret
