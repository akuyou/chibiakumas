;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 


	SetFader:
		push de
		push bc
		push iy
			call PlusPaletteShiftDoInit
			call PlusPaletteShiftReset
		pop iy
		pop bc
		pop de
	ret


EnableFader:
	push hl
	push de
	push bc
	push iy
	push ix
		ld hl,PaletteInit
		call PlusPaletteSet		
		ld hl,PaletteDest
		call PlusPaletteShiftDoInit
		call PlusPaletteShiftReset
	pop ix
	pop iy
	pop bc
	pop de
	pop hl
ret

PlusPaletteSet:
	ld de,MsxPaletteCurrent
	ld bc,16*2
	ldir
	ld hl,MsxPaletteCurrent
	call Akuyou_VDP_SetPalette
ret


PlusPaletteShiftReset:

	ld hl,PlusPaletteTimer
	ld de,PlusPaletteTimer+1
	ld bc,16*8-1
	ld (hl),0
	ldir
ret


PlusPaletteShiftDoInit:  
	ld (Palette_PlusFadeFinish_Plus2-2),hl	

	ld de,MsxPaletteCurrent
	ld iy,PlusPaletteShiftArray
	ex hl,de		      

PlusPaletteShiftInitAgain2:
;	ld a,(hl)
;	ld (iy),a	;shift point

;	inc de
;	inc hl
;	inc iy

	ld b,16
PlusPaletteShiftInitAgain:
	push bc
		ld a,(de) 
		and %11110000
		ld c,a
		ld a,(hl)
		and %11110000
		sub c
		jr nc,PlusPaletteShiftInitAgainBig
		neg	
PlusPaletteShiftInitAgainBig:
		ld b,a
		ld a,(de) 
		and %00001111
		ld c,a
		ld a,(hl)
		and %00001111
		sub c
		jr nc,PlusPaletteShiftInitAgainBigb
		neg	
PlusPaletteShiftInitAgainBigb:
		or b
	pop bc
	ld (iy),a
	inc iy

	ld (iy),%00010000
	ld a,(hl)
	and %11110000
	ld ixl,a
	ld a,(de)
	and %11110000
	cp ixl
	jr NC,PlusPaletteShiftInitAgainA
	ld (iy),-16
PlusPaletteShiftInitAgainA:

	inc iy
	ld (iy),%00000001
	ld a,(hl)
	and %00001111
	ld ixl,a
	ld a,(de)
	and %00001111
	cp ixl
	jr NC,PlusPaletteShiftInitAgainB
	ld (iy),-1
PlusPaletteShiftInitAgainB:


	inc de
	inc hl
	inc iy



	push bc
		ld a,(de) 
;		and %11110000
		ld c,a
		ld a,(hl)
;		and %11110000
		sub c
		jr nc,PlusPaletteShiftInitAgainBigc
		neg	
PlusPaletteShiftInitAgainBigc:
	pop bc


	ld (iy),a
	inc iy

	ld (iy),%00000001
	ld a,(de)
	cp (hl)
	jr NC,PlusPaletteShiftInitAgainC
	ld (iy),-1
PlusPaletteShiftInitAgainC:
	inc de
	inc hl
	inc iy

	djnz PlusPaletteShiftInitAgain
	
	ld hl,PlusPaletteDoShift
	ld (FadeCommand_Plus2-2),hl

	xor a
	ld (plusfade_plus1-1),a
ret
PlusFadeFinish:
	ld hl,null :Palette_PlusFadeFinish_Plus2
	call PlusPaletteSet
jp FadeDone

PlusPaletteDoShift:
	ld a,0 :plusfade_plus1
	inc a
	cp 15
	jr z,PlusFadeFinish
	ld (plusfade_plus1-1),a

	ld hl,PlusPaletteShiftArray


		di
		
		ld de,MsxPaletteCurrent

		exx

			ld hl,PlusPaletteTimer-1
PlusPaletteShiftNxt:
			ld b,16

;	exx

;		ld a,(hl)	;Shift point
;		ld (de),a
;		inc hl
;		inc de
;		exx


PlusPaletteShift: 
		exx

		;ix=src
		;iy=dest 

		ld a,(de)	;Shift point
		and %11110000
		ld ixh,a
	
		ld a,(de)	;Shift point
		and %00001111
		ld ixl,a	




		ld a,(hl)	;Shift point
		and %00001111
		ld iyl,a	

		ld a,(hl)	;Shift point
		and %11110000
		ld iyh,a	

		exx
;			ld a,iyh
			rrca
			rrca
			rrca
			rrca
			ld d,a

			inc hl

			ld a,(hl)
			and %00001111
			add d
			ld (hl),a
		exx
			inc hl

		cp 15
		jp c,PlusPaletteShiftskip

		ld a,ixh
		add (hl)
		ld ixh,a
PlusPaletteShiftskip:



		exx
			inc hl
			ld a,(hl)	
			and %00001111
			add iyl
			ld (hl),a
		exx
			inc hl

		cp 15
		ld a,ixl
		jp c,PlusPaletteShiftskip2
		add (hl)
		ld ixl,a
PlusPaletteShiftskip2: 
		or ixh
		ld (de),a
		inc hl
		inc de



		;ix=src
		;iy=dest 


;		ld a,(de)	;Shift point
;		and %00001111
;		ld ixl,a	




		ld a,(hl)	;Shift point
		;and %00001111
		ld iyl,a	


		exx
			inc hl
			ld a,(hl)	
			and %00001111
			add iyl
			ld (hl),a
		exx
			inc hl

		cp 15

		jp c,PlusPaletteShiftskip3
		ld a,(de);ld a,ixl
;		cp iyl
;		jr nc,PlusPaletteShiftHigh3
		add (hl)
;		jr PlusPaletteShiftskip3b
;PlusPaletteShiftHigh3
;		sub (hl)
;PlusPaletteShiftskip3b

		ld (de),a
PlusPaletteShiftskip3:
 

		inc hl
		inc de

exx
djnz PlusPaletteShift
 

ei

	ld hl,MsxPaletteCurrent
	jp Akuyou_VDP_SetPalette
;ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PlusPaletteTimer:
	defs 16*8

PlusPaletteShiftArray:
	     ;0GRB
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
;	defb 25
	defw &0000
		defb 0,0,0
	defw &004C
		defb 0,0,0
	defw &0CC0
		defb 0,0,0
	defw &0FFB
		defb 0,0,0
	     ;0GRB



MsxPaletteCurrent:
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;0  -RRR-BBB,-----GGG