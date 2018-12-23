
;-----------------------------------------------------------

;                         plus Sprites

; --------------------------------------------------------
ifdef SupportPlus 
Plus_SpritesOff:
	ld a,(CPCVer)
	and 1 
	ret z
	ld de,&0000
	ld h,16
Plus_ShowHide:

	ifdef Debug
		call Debug_CheckIntOff
	endif 
	; h = sprite count 
	; d 1st Sprite Num
	; e = Scale (0 = sprite off , 9= normal )

	ld bc,&7fb8
	out (c),c
	ld b,h

	ld a,d
	sla a
	sla a
	sla a
	ld h,&60
	ld l,a
	ld c,4
Plus_ShowHideNext:
	add c
	ld l,a
;	inc l
;	inc l
;	inc l
;	inc l
	ld (hl),e
	add c
;	inc l
;	inc l
;	inc l
;	inc l
	djnz Plus_ShowHideNext

	ld bc,&7fa0	;TurnPluss Off
	out (c),c	
	ret
;	jp Plus_TurnBankOff
ConvertSpriteCoords:			; Used for CPC plus

		ld a,(SprShow_Y)
ifdef CPC320
		sub 24
else
		sub 32
endif
		ld c,a

		ld a,(SprShow_X)
ifdef CPC320
		sub 24
else
		sub 32
endif
		ld b,a
Plus_SetSpriteInterruptsafe:
	di
		call Plus_SetSprite
	ei
ret
Plus_CopySpriteCompressed:
; b Sprite Num
; a Source bank
; hl = Source memory Loc
;	push af
		ld a,b
		ld e,&00
		add &41
		ld d,a
		call Plus_CopySpriteCompressedPlusPart	


		dec d
		ld e,&C0
		call Plus_CopySpriteCompressedPlusPart	

		ld e,&80
		call Plus_CopySpriteCompressedPlusPart	

		ld e,&40

Plus_CopySpriteCompressedPlusPart: 
	;DE = Destination
	;HL = source
	push de
; We do the plus sprite in 2 parts to not annoy the interrupts

			ld (Plus_CopySpriteCompressed_StackRestore_Plus2-2),sp
			ex hl,de

			ld bc,&7fb8	;turn Plus Asic on
			di
			out (c),c
			;ld bc,&0100
			ld b,&10	;no of byte chunks


			ld sp,hl
			ex hl,de
Plus_CopySpriteCompressed_Loop:
	ld a,(hl)
	ld e,a
	rrca
	rrca
	rrca
	rrca
	ld d,a
	push de
	dec l
	ld a,(hl)
	ld e,a
	rrca
	rrca
	rrca
	rrca
	ld d,a
	push de
	dec l


	djnz Plus_CopySpriteCompressed_Loop




	ld bc,&7fa0 ;turn asic off
	out (c),c
	ei
	ld sp,&0000:Plus_CopySpriteCompressed_StackRestore_Plus2
	pop de
	
ret
Plus_HideSprites:
	ld a,(CPCVer)
	and %00000001
	ret z
	ld d,15
Plus_HideSpritesNext:	
	
	ld bc,&00DB

	ld e,b
	push de
	call Plus_SetSprite
	pop de
	dec d
	ld a,d
	inc a ; cp 255
	jr nz,Plus_HideSpritesNext
;	ld de,4
	ld hl,PlusSprites_Config1+3
	ld b,6
	ld a,l
HideMorePlusSprites:
	ld (hl),0
	add 4
	ld l,a
;	add hl,de
	djnz HideMorePlusSprites
	
	; bc = X (0-160) ,Y (0-199 (>220 is negative)
	; d Sprite Num
	; e = Scale (0 = sprite off , 9= normal )
ret
CoreExt_PlusSpriteSwapB:

	ld a,&C0 :PlusSpriteBank_Plus1
	call BankSwitch_C0_SetCurrent
	ld b,4

	ld a,(SprShow_BankAddr+1)
	cp &40
	jr c,PlusSpriteLT4k
	;convert C1 address to C7
	add &80
PlusSpriteLT4k:
	ld (PlusSpriteOneByteMempos_Plus1-1),a
NextSpriteSwapperB:
	push bc
		ld a,b
		dec a

		ld b,a
		add &00	:PlusSpriteOffsetB_Plus1 ;memloc

		push af
		and %00000001
		rrca
		add &7F
		ld l,a

		ld a,b
		add 0	:PlayerSpriteOffset_Plus1
		ld b,a

		pop af
		srl a
		add &00:PlusSpriteOneByteMempos_Plus1;&A8	;memloc of sprite bank
		ld h,a

		;ld h,a
		;ld l,&0
		;ld a,2
; b Sprite Num
; a Source bank
		;ld de,&C000	;temp mem loc (in mainmem)
		call Plus_CopySpriteCompressed

	pop bc
	djnz NextSpriteSwapperB


;	ld a,&C0
;	call BankSwitch_C0_SetCurrent
	call BankSwitch_C0_SetCurrentToC0
	ld a,3
ret



Plus_SetSprite:
	ifdef Debug
		call Debug_CheckIntOff
	endif 

	; bc = X (0-160) ,Y (0-199 (>220 is negative)
	; d Sprite Num
	; e = Scale (0 = sprite off , 9= normal )
	push bc
		ld bc,&7fb8	;TurnPlus on
		out (c),c
	pop bc

	ld a,d
	sla a
	sla a
	sla a
	ld h,&60
	ld l,a


	push de
		;; set x coordinate for sprite 0
		ex hl,de

			ld h,0
			ld l,b
			add hl,hl
			add hl,hl
			;add hl,hl
			;add hl,hl
			;add hl,hl
		ex hl,de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		;; set y coordinate for sprite 0
		ld a,c
		ld d,0
		ld e,a
		cp 220
		jr C,Plus_SetSprite_DoY
		ld d,255
Plus_SetSprite_DoY
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
	pop de

	ld a,e
	ld (hl),a
	push bc
		ld bc,&7fa0	;TurnPluss Off
		out (c),c
	pop bc
ret
Plus_SetPalette:
	;HL = Address of palette
		ld bc,&7fb8	;TurnPlus on
		out (c),c
	ld de,&6422
	ld bc,15*2
	ldir

;Plus_TurnBankOff
	ld bc,&7fa0	;TurnPluss Off
	out (c),c
ret
;Plus_TurnBankOn:
;		ld bc,&7fb8	;TurnPlus on
;		out (c),c
;ret
endif

;ifdef BuildCPC
;	TurnOffPlusRaster
;		;turn of the midframe raster colors
;		ld bc,&7fb8	;TurnPlus on
;		out (c),c
;		xor a
;		ld (&6800),a
;		ld c,&a0	;TurnPluss Off
;		out (c),c
;	ret
;endif



CPCGPU_VectorArray:
	defw CPCGPU_GetVectorArray		;0
	defw null :EnablePlusPalette_Plus2	;1
	defw Plus_SetPlusRasters		;2
	defw getPlusRasterPalette		;3
;	defw null TurnOffPlusRaster_Plus2	;4
;	defw VDP_HMMV_BusyCheck

CPCGPU_GetVectorArray:
	ld hl,CPCGPU_VectorArray
	ret

CPCGPU_CommandNum:
	push hl			;
	ld hl,CPCGPU_VectorArray
jp VectorJump_PushHlFirst


getPlusRasterPalette:
	ld de,PlusRasterPalette
ret
Plus_SetPlusRasters:
	ld de,PlusRasterPalette
	ld bc,9*8
	ldir
ret
