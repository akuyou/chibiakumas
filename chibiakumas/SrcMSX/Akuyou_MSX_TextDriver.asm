;TextScreen_MaxX equ 36 ;40
;TextScreen_MinX equ 4	;0
;TextScreen_MaxY equ 23	;24
;TextScreen_MinY equ 0	;0

;SprShow_X defb 0
;SprShow_Y defb 0
;SprShow_TempX defb 0
;SprShow_TempY defb 0



; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			 Text Driver

;***************************************************************************************************
;--------------------------------------------------------------------------------------------

;DrawText_SetPen equ &bb90 ;set pen to A
;DrawText_Locate equ &bb75 ; set location to X=L , Y=H
;DrawText_PrintChar equ &bb5a

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


;DrawText_LocateAndPrintString
;	call DrawText_LocateSprite
DrawText_PrintString:
	; I Limits the number of characters to be show,
	; used for 'typing' effect during the boss sequences, and intro
	ld a,i		
	dec a
	ret z
	ld i,a
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
		call DrawText_CharSprite; draw char
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

	push hl
		ld h,0	:DrawTextYPosB_Plus1
		ld l,a
		;ld (VDP_MyHMMM_FontDY_Bak_Plus2-2),hl
		ld (VDP_MyHMMM_DY),hl
	pop hl

;	add 24
;	ld (SprShow_Y),a

	ld a,h
	sub TextScreen_MinX	; for speccy
	add a
	add a
	add a
	ld (FontNextX_Plus1-1),a	



	ld (SprShow_X),a
	;xor a
	;ld hl,&C000
	;ld (SprShow_BankAddr),hl
ret


; equiv of DrawText_PrintChar
DrawText_CharSprite:		; Must have already set the correct bank!
	ld b,8	:DrawText_CharSpriteMoveSize_Plus1
	cp 13
	jr z,DrawText_CarriageReturnSprite

DrawText_CharSpriteDirect:
	sub 33	
;	ld (SprShow_SprNum),a
	ld e,a
;		push de
			and %00111111 :DrawText_LineSplit1_Plus1

;			and %00011111
			add a	:DrawText_LineMove_Plus1
			add a
			add a
	
			ld h,0
			ld l,a
;			ld de,0100
;			add hl,de
			ld (VDP_MyHMMM_SX),hl
;		pop de

		push de
		ld a,e
		and %11000000	:DrawText_LineSplit2_Plus1

;		and %11100000
		nop	:DrawText_LineMove2_Plus1
		rrca
		rrca
			ld h,0
			ld l,a
			ld de,0100	:DrawText_FontYpos_Plus2
			add hl,de
			ld (VDP_MyHMMM_SY),hl
		pop de



		ld a,b
		cp 128
		ld a,0:FontNextX_Plus1

		ld h,0
		ld l,a
		ld (VDP_MyHMMM_DX),hl


		jp C,CharFordwards
;char moving backwards
		add b
		jr CharFordwardsb
CharFordwards:

;		cp 256-8
;		ret nc
;		ld (SprShow_TempX),a		; move the cursor along for next char
;		ld d,a
		add b
		jr c,CharFordwardsSkip
CharFordwardsb:
		ld (FontNextX_Plus1-1),a	
CharFordwardsSkip:
;		ld a,(SprShow_Y)
;		ld (SprShow_TempY),a
;		ld c,a


;		ld hl,&0000 VDP_MyHMMM_FontDY_Bak_Plus2
;		ld (VDP_MyHMMM_DY),hl

;		ld hl,&0000 VDP_MyHMMM_FontNY_Bak_Plus2
;		ld (VDP_MyHMMM_NY),hl

	ld a,e
	cp 192
	ret NC	; Our font has no space! so dont draw anything below 32 (above 192)

	ld hl,VDP_MyHMMM
	di
	call VDP_HMMM_BusyCheck
	ei

ret
	;sprite render goes here

;	ld a,(BankSwitch_C0_CurrentB_Plus2-2)
;	push af
;		ld a,Font_Membank
;		call BankSwitch_C0_SetCurrent
;		call ShowSpriteDirect 
;	pop af
;	jp BankSwitch_C0_SetCurrent
;SprShow_SprNum defb 0


SpriteBank_Font2:			
	ld a,2
SpriteBank_Font:			;Init the spritefont location - Corrupts HL and now BC

;SpriteBank_FontNum ;A= 1 = Chibifont   2 = regularfont
	cp 1 
	jr z,SpriteBank_FontNumChibi
;	ld bc,DrawText_DicharSprite_NextLine-DrawText_DicharSprite_Font_Plus1
;	ld hl,Font_RegularSizePos			;The font is located at &C000/4000 in bank C1/C3, or &7000 in the Bootstrap block
	ld bc,Akuyou_FontPos_Y
	ld l,8
	ld a,%00011111
	ld h,&87
	push af
	ld a,0
	jr ShowSprite_SetFontBankAddr

SpriteBank_FontNumChibi:
;		ld bc,DrawText_DicharSprite_NextLineMini-DrawText_DicharSprite_Font_Plus1
;		ld hl,Font_SmallSizePos			;The font is located at &C000 in bank C1/C3, or &7000 in the Bootstrap block
	ld bc,Akuyou_FontPos_Y+32
	ld l,4
	ld a,%00111111
	ld h,0
	push af
	ld a,&0F
ShowSprite_SetFontBankAddr:
	ld (DrawText_LineMove2_Plus1-1),a
	pop af
	ld (DrawText_LineSplit1_Plus1-1),a
	cpl 
	ld (DrawText_LineSplit2_Plus1-1),a
	
	ld a,h
	ld (DrawText_LineMove_Plus1-1),a

	ld (DrawText_FontYpos_Plus2-2),bc

	ld a,l
	ld (DrawText_CharSpriteMoveSize_Plus1-1),a
;	ld a,c
;	ld (DrawText_DicharSprite_Font_Plus1-1),a


	ld h,0
	ld (VDP_MyHMMM_NX),hl
	ld l,8
	ld (VDP_MyHMMM_NY),hl
;	ld (VDP_MyHMMM_FontNY_Bak_Plus2-2),hl
;	ld hl,100
;	ld (VDP_MyHMMM_SY),hl

call	VDP_GetStatusRegister


;	ld (SprShow_BankAddr),hl
;ret

ret



