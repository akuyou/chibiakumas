di

;	call DiskDriver_Init
;	call Bankswapper_Init
;	call Bankswapper_FullRam


	pop af
	ld (DefaultDrive_Plus1-1),a

	pop hl
	ld (FullRamA),hl

	pop hl
	ld (SlotRestoreA),hl

;	ld a,&C9	;Disable interrupt handler
;	ld (38),a


;;;;;;;;;;;;;;;;;;;;;;;;; Hardware Detect ;;;;;;;;;;;;;;;;;;;;;;
	xor a
ifdef buildMSX_V9K
	or %00000001
endif
ex af,af'
	pop af
	cp 247
	jr z,WX
	cp	&0C3
	jr	nz,NoTurboR

	ex af,af'
	or %00000100
	ex af,af'
	jr NoTurboR
WX:
	ex af,af'
	or %00000010
	ex af,af'

	;Shift the Arkos frequency table half an octive on wsx
	ld hl,PLY_FrequencyTable+144-12
	ld de,PLY_FrequencyTable+144
	ld bc,144-12
	lddr

NoTurboR:
ex af,af'
	ld (CPCVer),a

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	call VDP_SetScreenMode4
	di

	ld hl,MSXGameoverPalette
	call Akuyou_VDP_SetPalette

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
	ld hl,512
	ld (VDP_MyHMMV_NY),hl
	ld hl,VDP_MyHMMV
	call VDP_HMMV_BusyCheck
	call VDP_FirmwareSafeWait


;di
;halt

;ld hl,256
;ld (VDP_MyHMMV_Nx),hl

;ld hl,32
;ld (VDP_MyHMMV_NY),hl

;ld hl,VDP_MyHMMV
;call VDP_HMMV_busycheck

;ld hl,96
;ld (VDP_MyHMMV_DY),hl

;ld hl,20
;ld (VDP_MyHMMV_NY),hl


;ld hl,VDP_MyHMMV
;call VDP_HMMV_Hyper

	;Show the Loading Screen
	ld hl,DiskMap_LoadingScreen		;&26C1 ; T38-SC1.D01 
	ld c, DiskMap_LoadingScreen_Disk
	ld iy,&0000
	call LoadLZ48RLE





	ld hl,DiskMap_Font			;T07-SC1.D00
	ld c, DiskMap_Font_Disk
;	ld ix,0
	ld iy,Akuyou_FontPos_Y
	call LoadLZ48RLE

;	call VDP_rleProcessor

	ld a,(CPCVer)
push af
	
	ld hl,FileName_Settings
	ld bc,SavedSettings_Last-SavedSettings
	ld de,SavedSettings
	call DiskDriver_LoadDirect
;	call DiskDriver_Write
pop af
	ld (CPCVer),a



	ld hl,DiskMap_PlayerSpriteRLE
	ld c,DiskMap_PlayerSpriteRLE_Disk
;	ld ix,0
	ld iy,Akuyou_PlayerSpritePos_Y
;	call VDP_rleProcessor
	call LoadLZ48RLE




	ld a,0
	ld hl,DiskMap_PlayerSprite
	ld c,DiskMap_PlayerSprite_Disk
	ld de,Akuyou_PlayerSpritePos
	call LoadDiscSector


	ld hl,DiskMap_PlusSpritesRLE
	ld c,DiskMap_PlusSpritesRLE_Disk
	;ld ix,0
	ld iy,Akuyou_PlusSpritesPos_Y
;	call VDP_rleProcessor
	call LoadLZ48RLE

	ld a,0
	ld hl,DiskMap_PlusSprites
	ld c,DiskMap_PlusSprites_Disk
	ld de,Akuyou_PlusSpritesPos
	call LoadDiscSector


ifdef buildMSX_V9K
	ld hl,DiskMap_Screens	       
	ld c,DiskMap_Screens_Disk
	ld iy,Akuyou_CompiledSprites_Y
	call LoadLZ48RLE
endif



	



;	ld a,2
;	call SpriteBank_Font
;	ld hl,&2108;14
;	ld bc,txtPressButtonMsg2
;	call DrawText_LocateAndPrintStringUnlimited




	ld de,Akuyou_SfxPos 
	ld hl,DiskMap_Sfx	   	;	equ &06C8 ;T06-SC8.D00
	ld c, DiskMap_Sfx_Disk
	call LoadDiscSector


;	ld hl,&01C8
;	ld de,Akuyou_MusicPos
;	ld c,1
;	ld a,0
;	ld IX,&FFFF;B000
;	call LoadDiscSector			; This was all structured assuming amsdos would be replaced with 
	; H = Track  (41)		; a sector based disk reader however with the success of M4
	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
	; B = Size - size is not used at all , no need to pass it
	; C = disk
	;  A  = 128 k memory bank
	;; DE = load address 

;ld hl,PlayAgain
;call INT_Enable
;ld sp,StackPointerAlt

call Akuyou_Sfx_Init
;call Music_Restart

ld hl,null
call INT_Define
Jp StartgameDone


LoadLZ48RLE:
	ld ix,&0000
LoadLZ48RLE_AltX:
	push IX
	Push IY
	ld de,Akuyou_LevelStart
	ld IX,Akuyou_LevelStart+&3FFF;&5B00;B000
	call LoadDiscSectorZ
	call Aku_GetLZ48FileEnd	
	push hl

		or a 
		ld de,Akuyou_LevelStart
		push de
		sbc hl,de
			push hl
			pop bc	;length
		pop hl	;start
	pop de	;end

	pop IY
	pop IX

	jp Akuyou_VDP_RLEProcessorFromMemory	


StartgameDone: