
ENTGPU_VectorArray:
	defw ENTGPU_GetVectorArray		;0
	defw null :EnablePlusPalette_Plus2	;1
	defw Plus_SetPlusRasters		;2
	defw getPlusRasterPalette		;3
	defw null ;not used even by cpc	;4
	defw ENT_UpdatePlusRasters		;5

ENTGPU_GetVectorArray:
	ld hl,ENTGPU_VectorArray
	ret

ENTGPU_CommandNum:
	push hl			;
	ld hl,ENTGPU_VectorArray
jp VectorJump_PushHlFirst




getPlusRasterPalette:
	ld de,PlusRasterPalette
ret
Plus_SetPlusRasters:
		ld de,PlusRasterPalette

		ld bc,9*8
		ldir
;Int_ColorChange_plus2
ENT_UpdatePlusRasters
	ld de,ENT_UpdatePlusRastersInterrupt
	ld (Int_ColorChange_plus2-2),de
	ld de,PlusRasterPalette
	

ret
ENT_UpdatePlusRastersInterrupt:
	ld de,PlusRasterPalette
ENT_UpdatePlusRastersAlt
	ld hl,null
	ld (Int_ColorChange_plus2-2),hl

	ld hl,&FF00;LPT in ram


	ld iyl,0
	ld ixh,8
NextPalBlock:

	ld ixl,4

	ld a,iyl
	ld iyh,a

	ld a,(de)	;linenum
	inc a				;ENTERPRISE FIX
	inc a				;ENTERPRISE FIX
	cp 200
	jp c,NextPalBlock_NotTooBig
	ld a,200
NextPalBlock_NotTooBig:
	push af
		sub iyl
		neg
		ld (hl),a
	pop af
	ld iyl,a


	inc de

	ld bc,4
	add hl,bc


	ex hl,de		
	push hl

		ld hl,0
		ld a,iyh



		or a
		jr z,EntLineAddAgainSkip

;	push af
;	call Monitor_PushedRegister

	push bc
		ld bc,80
EntLineAddAgain:
		add hl,bc
		dec a
	jr nz,EntLineAddAgain
	pop bc
EntLineAddAgainSkip:
;	push hl
;	call Monitor_PushedRegister

		ld a,l
		ld (de),a
		inc de
		ld a,(de)
		and %11000000
		or h
		ld (de),a



	pop hl
	ex hl,de
	


	ld bc,3
	add hl,bc
NextPalentry:
	ld a,(de)	;Paletteentry
	ld c,a
	inc de
	ld a,(de)
	ld b,a
	inc de


	call ParsePaletteBC
	ld (hl),a
	inc hl

;	push hl
;	call Monitor_PushedRegister


;	push bc
;	call Monitor_PushedRegister

	dec ixl
	jr nz,NextPalentry


;	Call Newline

	ld bc,4
	add hl,bc

	dec ixh
	jr nz,NextPalBlock

ret
 
ParsePaletteBC:
	push de
	ld a,c
	and &F0
	ld d,a	 ;R
	
	ld a,c
	and &0F  ;B
	rrca
	rrca
	rrca
	rrca
	ld c,a

	ld a,b
;	and &0F  ;G
	rrca
	rrca
	rrca
	rrca
	ld b,a

	;Green in H

	xor a	; g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

	rl d	;r2
	rra
	rl b	;g2
	rra
	rl c	;b1
	rra

	rl d	;r1
	rra
	rl b	;g1
	rra
	rl c	;b0
	rra

	rl d	;r0
	rra
	rl b	;g0
	rra
	pop de
ret



Ifdef BuildENT
	EntSafePalette:
	defb 25	;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 50	;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 75	;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 100	;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 125		;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 150		;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 175		;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 200	;next split
	defw &0000
	defw &008C
	defw &0C0F
	defw &0FFF
	defb 0		;next split
endif





