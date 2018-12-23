
	ld hl,(&0038)
	ld (FirmwareIH1_Plus2-2),hl

	ld hl,(&0038+2)
	ld (FirmwareIH2_Plus2-2),hl

	ld hl,BootStrap_EntTitlePalette
	ld a,2
	call Akuyou_ENTGPU_CommandNum

;	ld a,&FF
;	out(&B3),a

	ld a,Akuyou_ScreenBufferA
	ld hl,DiskMap_LoadingScreen		;&26C1 ; T38-SC1.D01 
	ld c, DiskMap_LoadingScreen_Disk
	ld de,&C000
	ld iy,&FF00
	call Akuyou_LoadDiscSector

;	ld a,Akuyou_ScreenBufferA
;	out(&B3),a


	ifdef BuildENT
		in a,(&B0)
	else
		ld a,Akuyou_Music_Bank
	endif
	ld hl,DiskMap_SFX
	ld c,DiskMap_SFX_Disk
	ld de,Akuyou_SfxPos
;	push de
	call Akuyou_LoadDiscSector
;	pop de
	call Akuyou_Sfx_Init;



	ld a,Font_Membank
	ld hl,DiskMap_Font		;T07-SC1.D00
	ld c,DiskMap_Font_Disk
	ld de,Font_RegularSizePos
	ld ix,Font_RegularSizePos-1+&1000

	call Akuyou_LoadDiscSectorZ


 		
	; Load Player sprites
	ld a, PlusSprite_ExtBank
	ld de,Akuyou_PlusSpritesPos

	ld hl,DiskMap_PlayerSprite		; &06C1 ;T06-SC1.D00	
	ld c, DiskMap_PlayerSprite_Disk

	ld IX,&FFFF;&5B00;B000
	call LoadDiscSector


	ld a, CSprite_Bank
	ld de,CSprite_Pos

	ld hl,DiskMap_Screens		;
	ld c, DiskMap_Screens_Disk

	ld IX,&FFFF;&5B00;B000
	call LoadDiscSector

		ld a,2
		call Akuyou_SpriteBank_Font

;push af
;call Monitor_PushedRegister
;ld hl,&0000
;call Akuyou_DrawText_LocateSprite
;call Monitor_MemDump
;db 32
;dw &8000
	
