
ifdef buildZXS
	ld a,7	
	ld hl,Background_Draw	:Background_Call_Plus2
	call Akuyou_Bankswapper_CallHL
else
	call Background_Draw	:Background_Call_Plus2
endif



	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw



ifdef buildZXS
	ld a,7	
	ld hl,Akuyou_Player_Handler
	call Akuyou_Bankswapper_CallHL
else
	call Akuyou_Player_Handler
endif


ifdef buildZXS
	ld a,7	
	ld hl,AkuYou_Player_StarArray_Redraw
	call Akuyou_Bankswapper_CallHL
else
	call AkuYou_Player_StarArray_Redraw
endif


Ifdef BuildMSX
	ifdef MSX_BulletSprites 
		ld bc,&0000	:CustomStarsY_Plus2
		ld hl,&0000	:CustomStarsX_Plus2
		ld a,6						;Set Bullet image
		call Akuyou_VDP_CommandNum
	
		ld a,(CustomStarsX_Plus2-2)
		add 6
		cp MSX_BulletSprites*6
		jr nz,BulletSpriteNoReset
		xor a
	BulletSpriteNoReset:
		ld (CustomStarsX_Plus2-2),a
	endif
endif

ifdef buildZXS
	ld a,7	
	ld hl,Akuyou_StarArray_Redraw
	call Akuyou_Bankswapper_CallHL
else
	call Akuyou_StarArray_Redraw
endif


Ifdef BuildMSX
	ifdef MSX_BulletSprites 
		ld bc,&0000
		ld a,6						;Set Bullet image
		call Akuyou_VDP_CommandNum
	
	endif
endif

ifdef buildMSX
	call Background_DrawMsx2	:Foreground_CallMSX_Plus2
endif


ifdef buildZXS
	ld a,7	
	ld hl,AkuYou_Player_DrawUI
	call Akuyou_Bankswapper_CallHL
else
	call AkuYou_Player_DrawUI
endif
	call Akuyou_PlaySfx

;jp TestBuild
;TestBuild

ifdef Debug_ShowLevelTime
	call ShowLevelTime
endif



ifdef buildZXS
	ld a,7	
	ld hl,SpectrumFadeDark :FadeCommand_Plus2
	call Akuyou_Bankswapper_CallHL
else
	call null	:FadeCommand_Plus2	; also MSX

endif
