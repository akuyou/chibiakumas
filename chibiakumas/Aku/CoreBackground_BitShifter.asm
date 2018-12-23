; This routine can 'bitshift' a 2x2 grid of pixels, it is useful for Quad and QuadSprite background routines, as these have no way of handling scrolling
; so code like this must scroll the data for them

BitShifterSkip:
	ld a,l
BitShifterSkipB:
	add b
	ld l,a
	dec c
	jr nz,BitShifterSkipB
	
ret


BitShifter:
	ifdef buildZXS
		ld e,a
		ld a,(Timer_TicksOccured_Plus1-1)
		and e
		jr z,BitShifterSkip
	endif
if buildCPCv+buildENTv
		and 0	:BitshifterTicksOccured_Plus1
		jr z,BitShifterSkip
	endif
;	ld hl,Tile_Start+7	; Sourcemempos
;	ld b,&8		; Bytes per line
;	ld c,16		; lines

BitShifterAgain:
	push bc

	;SCF	;clear the carry flag
	;CCF
	or a   ; Clear carry flag
	ld e,0	; e remembers the overflow from the last byte X---
	push hl
BitShifterloop:	ld a,(hl)	; load memory


		ld d,a		; backup for later
ifdef BuildZXS
		and %01111111
		rla
		or e		; add e X---
	 	ld (hl),a	; put it onscreen
		ld a,d		; restore backup
		and %10000000
		rlca		;wrap around
endif
if buildCPCv+buildENTv
	      	and &77;&EE		; keep XXX-
		rla;RRA		; shift right -XXX
		or e		; add e X---
	 	ld (hl),a	; put it onscreen

		ld a,d		; restore backup
		and &88;&11		; Keep leftmost ---X

		rra;rla		; Shift Left x3 = X---
		rra;rla
		rra;rla
endif
		ld e,a		; store in E for next byte

		dec l ;inc l		; screen byte

		djnz BitShifterloop
		pop hl
		ld a,(hl)
		or e
		ld (hl),a
	pop bc
	ld a,b
	add l
	ld l,a
	dec c
	jp nz,BitShifterAgain
	ret
