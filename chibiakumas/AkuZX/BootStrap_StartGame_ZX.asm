di

	xor a
;ZX  0=TAP 1=TRD 2=DSK   128= 128k ;192 = +3 or black +2
	ifdef buildZXS_TRD
	or 1
	endif
	ifdef buildZXS_DSK
	or 2
	endif

	ex af,af'

	pop af ;On 128k models, PEEK 2899 is 159 on a 128 or +2, 126 on a +3 or +2a.
	cp 126
	jr nz,DetectNonPlus
	ex af,af'
		or 64
	ex af,af'
DetectNonPlus:
	pop af ;1=48k 0=128k
	or a
	jr nz,Detect48k
	ex af,af'
		or 128
	ex af,af'
Detect48k:
	ex af,af'
	ld (CPCVer),a



;;;;;;;;;;;;;;;;;;;;;;;;;;;; end of hardware detect ;;;;;;;;;;;;;;;;;;;;;;;










	ld a,Akuyou_BootStrapStart_Bank
	call Bankswapper_SetCurrent
	ld sp,SPReset
;	ld hl,savefilename
;	ld de,&8000
;	ld bc,&0010
;	call DiskDriver_Save

	call Cls

	ld bc,&fe00		;border black
	out (c),c



;backup disk system
ifdef buildZXS_DSK
		ld ixl,7
		ld ixh,6
		ld hl,&DB00		
		ld de,&C900
		ld bc,&1100
		call Bankswapper_Copy
	;HL=Source Pos
	;DE=Dest Post
	;IXL= Source Bank
	;IXH= Dest Bank
	;BC= ByteCount
		
endif





	;Show the Loading Screen
	ld de,&4000
	ld hl,DiskMap_LoadingScreen		;&26C1 ; T38-SC1.D01 
	ld c, DiskMap_LoadingScreen_Disk
	ld a, 4
	ld IX,&FFFF;&5B00;B000
	call LoadDiscSectorZ			

ifndef buildZXS_TAP
	ld a,0
	ld hl,FileName_Settings
	ld de,SavedSettings
	call DiskDriver_Load_FromHL

	ld bc,&fe00		;border black
	out (c),c
endif

	call SetKempson	;Enable Kempson


 		
	; Load Player sprites
	ld de,Akuyou_PlayerSpritePos
	ld hl,DiskMap_PlayerSprite		; &06C1 ;T06-SC1.D00	
	ld c, DiskMap_PlayerSprite_Disk
	ld a, 0
	ld IX,&FFFF;&5B00;B000
	call LoadDiscSector




	; Load Font sprites
	ld de,Font_RegularSizePos 
	ld hl,DiskMap_Font  		; &07C1 ;T07-SC1.D00	
	ld c, DiskMap_Font_Disk 
	ld a, Font_Membank 
	ld IX,&FFFF;&5B00;B000
	call LoadDiscSectorZ
	

	; Load Font sprites
	ld de,CompiledSprite_Pos 
	ld hl,DiskMap_Screens  		; &07C1 ;T07-SC1.D00	
	ld c, DiskMap_Screens_Disk 
	ld a, CompiledSprite_Membank 
	ld IX,&FFFF;&5B00;B000
	call LoadDiscSectorZ
	




;di
;halt


;	call Firmware_Kill
;	ld a,2
;	call SpriteBank_Font
;	ld hl,&0808;14
;	ld bc,txtPressButtonMsg2
;	call DrawText_LocateAndPrintStringUnlimited
;	call Firmware_Restore





	ld de,Akuyou_SfxPos 
	ld hl,DiskMap_Sfx	   	;	equ &06C8 ;T06-SC8.D00
	ld c, DiskMap_Sfx_Disk
	ld a, Akuyou_Music_Bank
;	ld IX,&FFFF;&5B00;B000

	call LoadDiscSector





;	ld hl,&01C8
;	ld de,Akuyou_MusicPos
;	ld c,1
;	ld a,Akuyou_Music_Bank
;	ld IX,&FFFF;B000
;	call LoadDiscSector			; This was all structured assuming amsdos would be replaced with 
;	; H = Track  (41)		; a sector based disk reader however with the success of M4
;	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
;	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
;	; B = Size - size is not used at all , no need to pass it
;	; C = disk
;	;  A  = 128 k memory bank
;	;; DE = load address 




	


	ld hl,INT_Execute
	call INT_Define



	ld a,Akuyou_Music_Bank	
	ld hl,Akuyou_Sfx_Init;
;	ld de,Akuyou_SfxPos 
	call Bankswapper_CallHL

;	ld a,Akuyou_Music_Bank	
;	ld hl,Music_Restart;
;	ld de,Akuyou_MusicPos 
;	call Bankswapper_CallHL


;Backup Disk variables



;im 2
;ei
;di
;halt

;	call StartANewGame
;	call Cheat_BochanOnly
;	call Cheat_ChibikoOnly
;	call Cheat_TwoPlayer	
;	call ScreenBuffer_Init



;	ld hl,DiskMap_Level1		;10  T10-SC1.D01
;	ld c,DiskMap_Level1_Disk
;	jp Bootstrap_LoadEP2Level_2Part	


;jp Bootstrap_Level_0

;jp testloop
