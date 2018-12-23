


;---------------------------------------------------------------------------

ShowSprite_ReadInfo:
nop;	di
nop;	halt

	ld hl,0000 :SprShow_X_Plus2
	ld (VDP_MyLMMM_DX),hl
	ld hl,0000 :SprShow_Y_Plus2
	ld (VDP_MyLMMM_DY),hl


	ld c,0 :SprShow_SprNum_Plus1
	ld hl,&0000 :SprShow_BankAddr_Plus2
	ld b,0
        or a ; only done to clear carry flag
	rl b
	rl c
;	rl b
;	rl c



	add hl,bc
	add hl,bc	; 10 bytes per sprite
	add hl,bc
	add hl,bc
	add hl,bc


	ld a,(hl)	;h
	inc hl
	ld a,(hl)	;w
	inc hl
;	di
;	halt
	cp 0 :SpriteSizeConfig6_Plus1
	call nz,ShowSpriteReconfigure

	ld b,(hl)	;Yoff
	inc hl

	ld a,(hl)	;Xoff
	inc hl

	push hl
	pop ix

ret
VDP_GetBankYpos:
	ld a,d
	ld de,(Bank0_Ypos_Plus2-2)
	or a
	ret z
	ld de,(Bank1_Ypos_Plus2-2)
	dec a
	ret z
	ld de,(Bank2_Ypos_Plus2-2)
	dec a
	ret z	
	ld de,(Bank3_Ypos_Plus2-2)
ret
VDP_GetSpritePos:
	;hl = data memory
	;de = sprite screen pos
	push de

		ld a,b
		ld (SprShow_SprNum_Plus1-1),a
		ld (SprShow_BankAddr_Plus2-2),hl
		call ShowSprite_ReadInfo


		ld a,(hl)
		ld ixl,a
		inc hl
		ld a,(hl)
		ld ixh,a
		inc hl

		ld a,(hl)
		ld iyl,a
		inc hl
		ld a,(hl)
		ld iyh,a
	pop de
	add iy,de
ret



ShowSpriteDirect:
	call ShowSprite_ReadInfo

		
	ld l,(ix)
	inc ix
	ld h,(ix)
	inc ix
	ld (VDP_MyLMMM_SX),hl
	ld l,(ix)
	inc ix
	ld h,(ix)
	inc ix
	ld bc,&0000 :SprShowDirect_MsxBankYpos_Plus2
	add hl,bc
	ld (VDP_MyLMMM_SY),hl

	ld a,(ix)
;	or a
;	ret z		;Don't show zero size sprites!


	inc ix
	ld (VDP_MyLMMM_NX),a

	ld a,(ix)
	inc ix
	ld (VDP_MyLMMM_NY),a

	ld hl,VDP_MyLMMM
	di
ifdef buildMSX_V9K
	call VDP_LMMM_BusyCheck
else

	ld a,%10011000
	ld (VDP_MyLMMM_CM),a

	call VDP_HMMM_BusyCheck;VDP_LMMM_BusyCheck
endif
	ei
ret
ShowSprite:


	call ShowSprite_ReadInfo

	;Xoff is still in A
	
	bit 7,a
	ld a,%10011000
	jr z,ShowSprite_NotPset
	ld a,%11010000
ShowSprite_NotPset:
	ld (VDP_MyLMMM_CM),a

;	ld (VDP_MyLMMM_CM),a

	ld a,(VDP_MyLMMM_DY)
	add b
	cp 192+24	;Check we're not totally offscreen
	ret NC

	ld c,a


	ld a,(VDP_MyLMMM_DX)
	ld b,a

	call VirtualPosToScreenByte
 
	;		H X bytes to skip	L	X bytes to remove
	;		D Y bytes to skip	E	Y bytes to remove
	


	push hl
	pop iy

	ld a,c
	ld (VDP_MyLMMM_DY),a

	ld a,b
	ld (VDP_MyLMMM_DX),a



	ld b,0

	ld a,iyh
;	cpl
;	inc a
	ld c,a
		
	ld l,(ix)
	inc ix
	ld h,(ix)
	inc ix
	add hl,bc
	ld (VDP_MyLMMM_SX),hl


	ld c,d

	ld l,(ix)
	inc ix
	ld h,(ix)
	inc ix
	add hl,bc

	ld bc,&0000 :SprShow_MsxBankYpos_Plus2
	add hl,bc
	ld (VDP_MyLMMM_SY),hl

	ld a,(ix)
	sub iyl
	ret c
	and %11111110			;byte copier doesn't like 1 pixel sprites!!!
	ret z
	inc ix
	ld (VDP_MyLMMM_NX),a

	ld a,(ix)
	sub e
	ret c
	ret z
	inc ix
	ld (VDP_MyLMMM_NY),a
	ld hl,VDP_MyLMMM
	di
ifdef buildMSX_V9K
	call VDP_LMMM_BusyCheck
else

;	ld a,%11010000
;	ld (VDP_MyLMMM_CM),a

	call VDP_HMMM_BusyCheck;VDP_LMMM_BusyCheck
endif
ei
ret




SprShow_TempH:	defb 0
SprShow_TempW:	defb 0
SprShow_W:	defb 0
SprShow_Yoff:	defb 0
SprShow_Xoff:	defb 0


SprShow_TempY:	defb 0
SprShow_TempX:	defb 0

GetSpriteXY
	ld a,(VDP_MyLMMM_SX)
	ld b,a
	ld a,(VDP_MyLMMM_SY)
 	ld c,a
ret
