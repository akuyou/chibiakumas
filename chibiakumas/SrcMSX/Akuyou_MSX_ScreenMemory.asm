get_scr_addr_table:
GetMemPos:
scr_addr_table:
GetNxtLin:
ret

ScreenBuffer_GetActiveScreen:
ld a,(ScreenBufferMSX_YY+1)
ret


CLS:
	xor a
	ld h,a
	ld l,a
	ld a,&11
	ld (VDP_MyHMMV_Byte),a
	ld (VDP_MyHMMV_DX),hl
	ld hl,(ScreenBufferMSX_YY)
	ld (VDP_MyHMMV_DY),hl	
	ld hl,256
	ld (VDP_MyHMMV_NX),hl
ifdef buildMSX_V9K
	ld hl,212
else
	ld hl,192
endif
	ld (VDP_MyHMMV_NY),hl
	ld hl,VDP_MyHMMV

	
ifdef buildMSX_V9K
	call VDP_HMMV_BusyCheck
	jp VDP_Wait

else 
	jp VDP_HMMV_BusyCheck
endif 






ifndef buildMSX_V9K

	;ScreenBufferMSX_Reset
	;ScreenBufferMSX_Init
	ScreenBufferMSX_YY:
	defw &0000
	ScreenBuffer_Init:
		xor a
		jr ScreenBuffer_Initb
	ScreenBuffer_Flip:
		ld a,0	:ScreenBufferMSX_Screen_Plus1
	ScreenBuffer_Initb:
		call ScreenBuffer_Alt
		xor 1	
		ld (ScreenBufferMSX_Screen_Plus1-1),a
	ScreenBuffer_Apply:
		rrca
		rrca
		rrca
		or  %00011111
		out (VdpOut_Control),a		
		ld a,128+2
		out (VdpOut_Control),a
	
	ret
	ScreenBuffer_Reset:
		xor a
		ld (ScreenBufferMSX_Screen_Plus1-1),a
		call ScreenBuffer_Alt
	jr ScreenBuffer_Apply

	ScreenBuffer_Alt:
		ld (VDP_Star_DY+1),a
		ld (ScreenBufferMSX_YY+1),a
		ld (SprShow_Y_Plus2-1),a	;Only need to frig with one byte!
		ld (DrawTextYPosB_Plus1-1),a
		ld (TileDestY_Plus2-1),a
		rrca ;%10000000
		ld (StardrawBuffer_Plus1-1),a
		rlca
	ret
endif

VDP_GetFreeYPos:
	ld hl,&0000 :VDP_NextFreeYPos_Plus2
ret
VDP_SetTilePos:
	ld (TileYOffset_Plus2-2),hl
ret
VDP_GetTilePos:
	ld hl,&0000 :LoadTilePos_Plus2
ret

Vdp_VectorArray:
	defw Vdp_GetVectorArray			;0
	defw VDP_HMMV_BusyCheck			;1
	defw VDP_RLEProcessor_GetLastY		;2
	defw VDP_SetTilePos			;3
	defw VDP_SetPalettePartial		;4
	defw VDP_GetTilePos			;5
	defw VDP_SetStarSprite			;6
ifdef buildMSX_V9K
	defw VDP_LMMM_BusyCheck			;7
else
	defw VDP_HMMM_BusyCheck			;7
endif
	defw VDP_GetSpritePos			;8
	defw VDP_GetBankYpos			;9
	defw LoadRLE_WithPushesV9K		;10

;	defw VDP_GetFreeYPos
Vdp_GetVectorArray:
	ld hl,Vdp_VectorArray
	ret

VDP_CommandNum:
	push hl			;
	ld hl,Vdp_VectorArray
jp VectorJump_PushHlFirst

VDP_SetStarSprite:
ifdef buildMSX_V9K
	ld a,b
	or c
	jr nz,VDP_SetStarSpriteNonDefault
	ld hl,64+0
	ld bc,&0000+Akuyou_PlusSpritesPos_Y 

VDP_SetStarSpriteNonDefault:

			ld (StarArray_Xpos_Plus2-2),hl
			ld (VDP_Star_SY),bc
endif
ret

if BuildLang =''
	LoadingMessage:	db  "Loadin","g"+&80
else
	LoadingMessage:	db  "LOADING",255
endif
ShowCompiledSprite:
push af
	call cls
ifdef buildMSX
		ld hl,MSXGameoverPalette
	if BuildLang='j'
		ld b,10
	else
		ld b,9
	endif

		ld a,4
		call Akuyou_VDP_CommandNum
endif
pop af
	
ifdef buildMSX_V9K

	ld hl,Akuyou_CompiledSprites_Y
	cp CSprite_Loading
	jr z,Csprite_Start

	ld hl,Akuyou_CompiledSprites_Y+384
	cp CSprite_Continue
	jr z,Csprite_Start

	ld hl,Akuyou_CompiledSprites_Y+192
	cp CSprite_Loading
	jr z,Csprite_Start

	;cp CSprite_SetDisk

Csprite_Start:
	ld (VDP_MyLoading_SY),hl

	ld hl,VDP_MyLoading
	jp VDP_HMMM_BusyCheck
else

	or a
	ret nz

	ld hl,&110a
	ld bc,LoadingMessage
	jp DrawText_LocateAndPrintStringUnlimited

endif




VDP_MyLoading:
VDP_MyLoading_SX:	defw &0000 ;SY 32,33
VDP_MyLoading_SY:	defw &0000 ;SY 34,35
VDP_MyLoading_DX:	defw &0000 ;DX 36,37
VDP_MyLoading_DY:	defw &0000 ;DY 38,39
VDP_MyLoading_NX:	defw &0100 ;NX 40,41 
VDP_MyLoading_NY:	defw &00C0 ;NY 42,43
		defb 0     ;Color 44 - unused
VDP_MyLoading_MV:	defb 0     ;Move 45
VDP_MyLoading_CM:	defb %10011000 ;Command 46	
