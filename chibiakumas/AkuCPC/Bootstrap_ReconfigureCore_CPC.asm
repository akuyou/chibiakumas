ifdef buildCPC

	ld b,12
	ld hl,PlusSprites_Config1+3
ZeroPlusSprites:
	ld (hl),0
	inc hl
	inc hl
	inc hl
	inc hl
djnz ZeroPlusSprites
endif


; PLUS STUFF
ifdef buildCPC
	ld b,RasterColors_4

	ifdef SupportPlus
		ld a,(CPCVer)
		and %00000001
		jp z,ResetCore_NotPlus
		ld b,RasterColors_4_Plus
	endif 

	ResetCore_NotPlus:
		ld a,b
	ifdef buildCPC
		ld (RasterColors_4Ver_Plus1-1),a
	endif
endif


ifdef buildCPC
	xor a
	ld iy,null
	call Akuyou_RasterColors_SetPointers
endif

	;turbo mode! - disable stuff to make the game fster
ifdef buildCPC
	ld hl,PLY_Play
	ld (MusicExec_PerFrame_Plus2-2),hl

	ld hl, RasterColors_TickOverrideFirm 
	ld (RasterColorInterruptHandler_Plus2-2),hl

	ld hl,&CC33 
	ld (StarArrayColors_Plus2-2),hl
endif


ifdef buildCPC
	ld a,0
	call Akuyou_Background_SetScroll
endif










	call AkuYou_Player_GetPlayerVars


;;;;;;;;;;;;;;;This part must be last!;;;;;;;;;;;;;;;;;;;;;


	ld a,(iy-8)
	and %00000011	;See if we want to turn of music or rasters
	ret z
ifdef buildCPC
	ld hl,null
	ld (MusicExec_PerFrame_Plus2-2),hl
endif
	and %00000010	;See if we want to turn of music or rasters
	ret z
	;2
ifdef buildCPC
	ld (RasterColorInterruptHandler_Plus2-2),hl
endif
