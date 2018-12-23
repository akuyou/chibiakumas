
;	Font_RegularSizePos equ &C000;&F000
;	Font_SmallSizePos equ 	&C400;&F800	

DrawText_ZXTextColor:
	ld a,c
	ld (ZXFontColor_Plus1-1),a
ret

SpriteBank_Font2:			
	ld a,2
SpriteBank_Font:			;Init the spritefont location - Corrupts HL and now BC

;SpriteBank_FontNum ;A= 1 = Chibifont   2 = regularfont
	dec a
	jr z,SpriteBank_FontNumChibi
	ld bc,DrawText_DicharSprite_NextLine-DrawText_DicharSprite_Font_Plus1
	push af
	ld hl,Font_RegularSizePos			;The font is located at &C000/4000 in bank C1/C3, or &7000 in the Bootstrap block
	xor a
	jr ShowSprite_SetFontBankAddr
SpriteBank_FontNumChibi:
		ld bc,DrawText_DicharSprite_NextLineMini-DrawText_DicharSprite_Font_Plus1
		ld hl,Font_SmallSizePos			;The font is located at &C000 in bank C1/C3, or &7000 in the Bootstrap block
;ret
	inc a
	push af
	ld a,1

ShowSprite_SetFontBankAddr:
	ld (DrawText_HalfMoveB_Plus1-1),a
	ld (DrawText_HalfMove_Plus1-1),a
	pop af
	ld (DrawText_CharSpriteMoveSize_Plus1-1),a
	ld a,c
	ld (DrawText_DicharSprite_Font_Plus1-1),a
;ShowSprite_SetBankAddr:
	ld (FontAddr_Plus2-2),hl
ret








; These were designed to mimic firmware functions
DrawText_LocateAndPrintStringUnlimited:
	call DrawText_LocateSprite
DrawText_PrintStringUnlimited:
	ld a,(bc)
if BuildLang =''
	cp a,&80
	jr nc,DrawText_PrintLastChar
else
	cp a,255
	ret z
endif


	push bc
		call DrawText_CharSprite; draw char
	pop bc

	inc bc
	jp DrawText_PrintStringUnlimited


DrawText_PrintString:
	; I Limits the number of characters to be show,
	; used for 'typing' effect during the boss sequences, and intro
	ldai		
	dec a
	ret z
	ldia
	ld a,(bc)
if BuildLang =''
	cp a,&80
	jr nc,DrawText_PrintLastChar
else
	cp a,255
	ret z
endif


	Call DrawText_CharSpriteProtectBC
	inc bc
	jp DrawText_PrintString
DrawText_PrintLastChar:
	and %01111111
DrawText_CharSpriteProtectBC:
	push bc
		call DrawText_CharSprite
	pop bc
	ret
	

DrawText_Decimal:
	ld c,0
	ld b,a
	ld a,&C4
	ld (DrawTextForceZeroCall_Plus3-3),a
	ld a,b
	cp 100
	jr c,SkipDigit100

	ld a,&CD
	ld (DrawTextForceZeroCall_Plus3-3),a
	ld a,b
DrawText_DecimalSub100:
	cp 100
	jr c,DrawText_DecimalLessThan100
	inc c
	sub 100
	jr DrawText_DecimalSub100

DrawText_DecimalLessThan100:
	ld b,a
	ld a,c
	or a
;	jr z,SkipDigit100
	call nz,DrawText_CharSprite48
SkipDigit100:
	ld a,b
	ld c,0
DrawText_DecimalSubTen:
	cp 10
	jr c,DrawText_DecimalLessThanTen
	inc c
	sub 10
	jr DrawText_DecimalSubTen
DrawText_DecimalLessThanTen:
	ld b,a
	ld a,c
	or a
	call nz,DrawText_CharSprite48	:DrawTextForceZeroCall_Plus3
SkipDigit10:
	ld a,b
DrawText_CharSprite48:
	add 48
	push bc
		call DrawText_CharSprite
	pop bc
ret
;end of drawtext decimal



DrawText_CarriageReturnSprite:
ld hl,&0000 :DrawText_CarriageReturnSpritePos_Plus2
inc l
DrawText_LocateSprite4CR:
ld (DrawText_CarriageReturnSpritePos_Plus2-2),hl
DrawText_LocateSprite:	; this mimics the way the firmare functions work  (DrawText_Locate)

	ld a,l
	add a
	add a
	add a
	ld (SprShow_Y),a
	ld a,h
;	add a		;for cpc
	sub TextScreen_MinX	; for speccy
	ld (SprShow_X),a

ret


; equiv of DrawText_PrintChar
DrawTextSpace:
	ld a,(DrawText_CharSpriteMoveSize_Plus1-1)
	xor 0 	:DrawText_HalfMoveB_Plus1
	ld (DrawText_CharSpriteMoveSize_Plus1-1),a
ret
DrawText_CharSprite:		; Must have already set the correct bank!
	ld b,1	:DrawText_CharSpriteMoveSize_Plus1
	cp 13
	jr z,DrawText_CarriageReturnSprite

DrawText_CharSpriteDirect:
	sub 33	
	ld (SprShow_SprNum),a
	ld e,a
		ld a,(SprShow_X)
		cp TextScreen_MaxX-TextScreen_MinX*2		;Bail if over screen width
		ret nc
		ld (SprShow_TempX),a		; move the cursor along for next char

		ld d,a
		add b
		ld (SprShow_X),a	

		ld a,(SprShow_Y)
		ld (SprShow_TempY),a
		ld c,a

	ld a,e
	cp 192
	jr NC,DrawTextSpace	; Our font has no space! so dont draw anything below 32 (above 192)


DrawText_CharFirmwareFont:



	ld b,d
	push de
		call GetColMemPos

		ld (hl),%01000111 :ZXFontColor_Plus1
		call GetMemPos
	pop de
	push hl
	;	ld hl,33*8+TextFirmwareFontAddr	
		ld hl,Font_RegularSizePos :FontAddr_Plus2
		ld d,0

		rl e
		rl d
		rl e
		rl d
		rl e
		rl d
		add hl,de
		ld d,h
	
	pop hl


	di
	ld a,Font_Membank 
	call Bankswapper_Set

	ld a,(ScreenBuffer_ActiveScreen_Plus1-1)
	cp &C0
	jr nz,NoFontCache
	push hl
		ex hl,de
		ld de,SpriteCache
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ld de,SpriteCache

	ld a,7
	call Bankswapper_Set
	pop hl
NoFontCache:





	ld a,(DrawText_CharSpriteMoveSize_Plus1-1)
	ld (MinifontToggle_Plus1-1),a
	xor 0					:DrawText_HalfMove_Plus1
	ld (DrawText_CharSpriteMoveSize_Plus1-1),a


	ld b,9
;	ld de,&F7D0
	jr DrawText_DicharSprite_NextLine2B 
DrawText_DicharSprite_NextLineMini:



	ld a,(de)
;	ld c,a
;	xor a
;	rr c
;	rra
;	srl c
;	rr c
;	rra
;	srl c
;	rr c
;	rra
;	srl c
;	rr c
;	rra
;	srl c
;
;	ld c,a
;	push bc
;		ld a,(de)
;		ld c,a
;		xor a
;
;		srl c
;		rr c
;		rra
;
;		srl c
;		rr c
;		rra
;
;		srl c
;		rr c
;		rra
;
;		srl c
;		rr c
;		rra
;	pop bc
;	or c
	ld c,a
	ld a,0	:MinifontToggle_Plus1
	or a
	jr z,MiniFont1
;MiniFont2
	srl c
	srl c
	srl c
	srl c

	ld a,(hl)
	or c
	ld (hl),a
	


	jr DrawText_DicharSprite_NextLine2
MiniFont1:
	ld a,c
	ld (hl),a
	jr DrawText_DicharSprite_NextLine2
DrawText_DicharSprite_NextLine:
;	and &0F
;	inc hl
;	ld (hl),a
;	dec hl
;	ld a,c
;	and &F0
;	rrca
;	rrca
;	rrca
;	rrca
;	ld (hl),a

	ld a,(de)
;	ld c,a
;	and &0F
;	inc hl
;	ld (hl),a
;	dec hl
;	ld a,c
;	and &F0
;	rrca
;	rrca
;	rrca
;	rrca
	ld (hl),a



DrawText_DicharSprite_NextLine2:
	push de
		call GetNxtLin
	pop de
	inc de
DrawText_DicharSprite_NextLine2B:
	djnz DrawText_DicharSprite_NextLine  :DrawText_DicharSprite_Font_Plus1

	call Bankswapper_Reset	

	ei
;	ret

ret











