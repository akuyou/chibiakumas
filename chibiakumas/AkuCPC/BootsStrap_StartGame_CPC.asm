
	ld sp,&BFFF	; we are not returning, so reset the stack

	;Border To black
	ld a,1
	ld b,0
	ld c,b
	call &bc38	; set border 0 to black
	ifndef debug
		;ld hl,RasterColors_InitColors
		ld hl,RasterColors_ZeroColors
		call SetColors
	endif
	;Load the game core - this is always in memory
	ld hl,FileName_Core
	ld de,Akuyou_CoreStart
	call BootStrap_LoadDiskFile




	call &BB57 ; VDU Disable

	ld hl,FileName_Settings
	ld de,SavedSettings
	call BootStrap_LoadDiskFile

	call &BB54 ; VDU enable




	;wipe the CPC ver setting
	xor a
	ld (CPCVer),a



	;Backup Disk operating system Vars here - Please add your own
	;if you have special requirements
	;please see Firmware_Restore in the core.asm file for the other half!




	ld hl,(&be7d)	; get address where current drive number is held
	ld a,(hl)	; get drive number
	ld (FirwareRestoreDriveNo_Plus1-1),a
	ld hl,(&BAFE)
	ld (ParadosSettings_Plus2-2),hl
;	ld hl,(&A700)
;	ld (AmsDosDiskSettings_Plus2-2),hl

	di
	ld hl,(&bd37+1)				;Get the Restore High Jumpblock command
	ld (FirmJumpLoc_Plus2-2),hl		; it's different on 464/6128 firmware!


;test



;Put some strange bytes at &4000 for us to detect!
ld hl,&6669
ld (&4000),hl

ifdef SupportPlus
	di
	ld b,&bc
	ld hl,PlusInitSequence
	ld e,17
PlusInitLoop:
	ld a,(hl)
	out (c),a
	inc hl
	dec e
	jr nz,PlusInitLoop


	ld a,&C1
	call Akuyou_BankSwitch_C0_SetCurrent
	;copy to the lower area.
	ld bc,&100
	ld hl,Plus_BankCopy
	ld de,&C000
	ldir
	

		ld bc,4
		ld de,&FFD0;&2000
		ld hl,&4000
		call &C000

		ld bc,&7fa0	; move the lower firmware back on a plus
		out (c),c
		ld bc,&7f8D	; Reset the firmware to OFF
		out (c),c


	;test 2 bytes from &4000 - if the asic has paged in they will not match main mem 

	ld hl,&FFD0;&2000
	ld de,&4000
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jp z,DetectedNonPlus ; non plus
	inc hl
	inc de
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jp z,DetectedNonPlus ; 

	ld a,(CPCVer)
	or 1
	ld (CPCVer),a
endif
DetectedNonPlus:
	ld a,&C0
	call Akuyou_BankSwitch_C0_SetCurrent
	ei


	; reset location

	ld a,&c0
;	call SetScreenMemPos
	ld hl,&0000
	call &bd1f	;call mc_screen_offset

	ld a,1
	call &bc0e ;Scr_SetMode

	ifndef AllowDisk2

	ld a,&C0
	ld hl,DiskMap_LoadingScreen ; T38-SC1.D01 
	ld b,DiskMap_LoadingScreen_Size
	ld c,DiskMap_LoadingScreen_Disk
	ld de,&C000
	ld ix,&C000+&4000-1;-8523
	call Akuyou_LoadDiscSectorZ


	endif



	ld hl,RasterColors_InitColors
	call SetColors

;	call ScreenBackupC000



ifdef Support128k
	;test to see if we have multiple ram banks
	di
	ld a,&C7
	ld bc,4
	ld de,&FFD0;&2000
	ld hl,&4000
	call Akuyou_BankSwitch_C0_BankCopy 

	ld hl,&FFD0;&2000
	ld de,&4000
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jr nz,Detected128k ; 64 k only
	inc hl
	inc de
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jr nz,Detected128k ; 64 k only
endif

	; we detected a 64k system
;	ld a,(CPCVer)
;	or 0
;	ld (CPCVer),a

	ld a,&0D
	ld (SetDiskMessagePos_Plus2-1),a


	ld a,&C0
	call BankSwitch_C0_SetCurrent

	jp PlusLoad

; Load 128k specific stuff
ifdef Support128k
Detected128k:
	ld a,(CPCVer)
	ifdef Support128k
		or 128
	else
		or 0
	endif 
	ld (CPCVer),a




	;test to see if we have multiple ram banks

	;copy 4 bytes to bank D7 - if this works we have 256k
	ld a,&D7
	ld bc,4
	ld de,&4000
	ld hl,&0000
	call Akuyou_BankSwitch_C0_BankCopy 

	;copy 4 bytes from bank D7 - if this works we have 256k

	ld a,&D7
	ld bc,4
	ld hl,&4000
	ld de,&FFF0
	call Akuyou_BankSwitch_C0_BankCopy 


	ld hl,&FFF0;&2000
	ld de,&0000
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jr nz,No256k ; Data Not Stored
	inc hl
	inc de
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jr nz,No256k ; Data Not Stored
	
	; if we got here - the data was stored - now see if C7 and D7 are the same thing!?
	ld a,&C7
	ld bc,4
	ld hl,&4000
	ld de,&FFF8
	call Akuyou_BankSwitch_C0_BankCopy 


	ld hl,&FFF0
	ld de,&FFF8
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jr nz,Have256k ; Match
	inc hl
	inc de
	ld a,(hl)
	ld b,a
	ld a,(de)
	cp b
	jr nz,Have256k ; Match
	jr No256k
Have256k:
	ld a,(CPCVer)
		or 64 ;128+64 = 256k system 
	ld (CPCVer),a


No256k:
	ld a,&C0
	call BankSwitch_C0_SetCurrent






	;ld a,1
;	ld hl,&7000
;	ld bc,&1000
;	ld de,&C000			; copy the font to bank 7 for ingame on the 6128 (464 will have to use firmware or reload)
;	call Akuyou_BankSwitch_128k_BankCopy
endif


	ld a,Font_Membank
	ld hl,DiskMap_Font		;T07-SC1.D00
;	ld b,DiskMap_Font_Size
	ld c,DiskMap_Font_Disk
	ld de,Font_RegularSizePos
	ld ix,Font_RegularSizePos-1+&1000

	call Akuyou_LoadDiscSectorZ



PlusLoad:
ei
ifdef SupportPlus
	ld a,(CPCVer)
	and 1
	jp z,notaplus



	ifdef AllowDisk2	;Plus sprites are on disk 1
		jp notaplus
	endif 

	call Blackout64k

	ld bc,15*2		;Snag a few bytes of temp space to copy the palette
	ld hl,-15*2-4
	add hl,sp
	ex hl,de
	push de
		ld hl,PlusPaletteGame
;	ld de,&C000
		ldir
	pop hl
;	ld hl,&C000
	di
	call Plus_SetPalette
	ei

	call Bootstrap_ReloadPlusSprites
di
	call Plus_HideSprites
ei
	

;	call ScreenRestoreC000
endif
NotAPlus:


	ld a,&C0
	call BankSwitch_C0_SetCurrent



	ifdef Debug
	ld l,12				; Show the 'Debug mode' message
	ld bc,DebugBuild
	call ShowTextLines
	endif

ifdef Support128k
	ld a,&C6
	ld hl,DiskMap_Screens
	ld b,DiskMap_Screens_Size
	ld c,DiskMap_Screens_Disk
	ld de,&4000
	ld ix,&4000+&3000
	call Akuyou_LoadDiscSectorZ

endif

;Load in player sprites
ifdef SupportPlus
	ld a,(CPCVer)
	and 1
	jp nz,PlayerSpritesNotNeeded
endif

	ld a,&C0
	ld hl,DiskMap_PlayerSprite
	ld b,DiskMap_PlayerSprite_Size
	ld c,DiskMap_PlayerSprite_Disk
	ld de,Akuyou_PlayerSpritePos
	ld ix,Akuyou_PlayerSpritePos+&800-1
	call Akuyou_LoadDiscSectorz


	;DiskMap_PlayerSpriteUD 		equ &06C3 ;T06-SC3.D00
	ld a,&C7
	ld hl,DiskMap_PlayerSpriteBo
	ld c,0
	ld de,&6800
	ld ix,&6800+&1800
	call Akuyou_LoadDiscSectorz


PlayerSpritesNotNeeded:





	ld a,&C0
	ld hl,DiskMap_SFX

	ld c,DiskMap_SFX_Disk
	ld de,Akuyou_SfxPos
	push de
	call Akuyou_LoadDiscSector
	pop de
	call Akuyou_Sfx_Init;




ifdef Support128k
	; Copy the bootstrap to bank 5 - part 1
	ld a,(CPCVer)
	and 128
	jr z,BootstrapBackup_Not128k

	ld a,&C5
	ld hl,&8000
	ld bc,&4000
	ld de,&4000		
	call Akuyou_BankSwitch_C0_BankCopy
BootstrapBackup_Not128k:
endif
