read "CoreDefs.asm"
nolist

;Bank C4 - Level Sprites 3+4 / Level Compiled Sprites (7B00 - alternate (boss) music)
;Bank C5 - Bootstrap Cache
;Bank C6 - 128k Special screens / Font (F000)
;Bank C7 - Level sprites (C000) / Vertical Sprites E800 / Bochan Plus sprites! (F800)

DiskMap1 equ 1
DiskMap2 equ 2
DiskMap3 equ 3
DiskMap4 equ 4
 

ifdef buildZXS
	if BuildLang =''
		ifdef buildZXS_DSK
			write "..\BldZX\BootStrp_DSK.bin"
		endif
		ifdef buildZXS_TRD
			write "..\BldZX\BootStrp_TRD.bin"
		endif
		ifdef buildZXS_TAP
			write "..\BldZX\BootStrp_TAP.bin"
		endif
	endif
	if BuildLang ='r'
		ifdef buildZXS_DSK
			write "..\BldZXr\BootStrp_DSK.bin"
		endif
		ifdef buildZXS_TRD
			write "..\BldZXr\BootStrp_TRD.bin"
		endif
		ifdef buildZXS_TAP
			write "..\BldZXr\BootStrp_TAP.bin"
		endif
	endif
endif 

ifdef buildENT
		write "..\BldENT\BootStrp.aku"
endif
ifdef buildMSX
	ifndef buildMSX_V9K
		if BuildLang =''
			write "..\ResMSX\BootStrp.aku"
		else
			write "..\ResMSXj\BootStrp.aku"
		endif
	else
		if BuildLang =''
			write "..\ResMSX\BootStrp.V9K"
		else
			write "..\ResMSXj\BootStrp.V9K"
		endif
	endif
;	db &FE     ; magic number
;	dw FileBeginBootStrap    ; begin address
;	dw FileEndBootStrap - 1  ; end address
;	dw FileBeginBootStrap;Execute  ; program execution address (for ,R option)
endif 


;limit Akuyou_LevelStart+&6500
org Akuyou_BootStrapStart

FileBeginBootStrap:


; The bootstrap is responsible for most loading, it will page in and start new levels when called
; handle their distribution over the system memory and do title screens / game over and the like

; depending on the command Control may not be returned, as this program wipes out the level code
; however if needed the level will be restarted via its jumpblock

; It loads into &4000, so cannot be used when the screen is page flipping

; When the bootstrap is in memory, the Bitmap font will be available at &7000 
; This is for the Main menu and similar

; on the 464 it will be loaded in each time
; in the 6128 it will be always in memory



;Make Instructions:

; Do not compile this directly, Compile Core.asm as it compiles this as well
; Both must be compiled together, as Bootstrap points to locations in Core - you will get a crash otherwise!



;mc_screen_offset equ &bd1f
;scr_set_position equ &bd55
;KeyboardScanner_Flush equ &BB03

jp Bootstrap_Launch	; &4000
jp Bootstrap_FromBasic	; &4003
jp Bootstrap_FromHL	; &4006
;jp Bootstrap_Reload	; &4009
ifdef SupportPlus 
	jp Bootstrap_ReloadPlusSprites	; &400C
else
	jp null
endif




Bootstrap_Launch:

ifdef buildCPC
	ld bc,&7f8D	; Reset the firmware to OFF
	out (c),c
	ld hl,RasterColors_InitColors
	call SetColors
endif

	ld h,0
	ld l,0
Bootstrap_FromHL:

	; HL is used as the bootstrap command
	; H=1 means levels
	; H=0 means system events (Menu etc)
	ld a,h
	or a
	jr z,Bootstrap_SystemEvent
	cp 1
	jr z,Bootstrap_Level

	; Bootstrap Level
ret	
Bootstrap_SystemEvent:
	; Bootstrap System event
	ld a,l
	cp 0
	jp z,BootsStrap_StartGame
	cp 1
	jp z,BootsStrap_ContinueScreen
	cp 2
	jp z,BootsStrap_ConfigureControls
	cp 3
	jp z,BootStrap_SaveSettings
	cp 4
	jp z,GameOverWin
	cp 5
	jp z,NewGame_EP2_1UP
	cp 6
	jp z,NewGame_EP2_2UP
	cp 7
	jp z,NewGame_EP2_2P
	cp 8
	jp z,NewGame_CheatStart
ret
Bootstrap_Level:
	ld sp,SPReset	; we are not returning, so reset the stack

	; Load and start a level
	ld a,l
	cp 0
	jp z,Bootstrap_Level_0Again

ifdef CompileEP1
	cp 1
	jp z,Bootstrap_Level_1

	cp 2
	jp z,Bootstrap_Level_2
	cp 3
	jp z,Bootstrap_Level_3
	cp 4
	jp z,Bootstrap_Level_4
	cp 5
	jp z,Bootstrap_Level_5
	cp 6
	jp z,Bootstrap_Level_6
	cp 7
	jp z,Bootstrap_Level_7
	cp 8
	jp z,Bootstrap_Level_8
	cp 9
	jp z,Bootstrap_Level_9
	cp 250
	jp z,Bootstrap_Level_EndIntro	;Shown before the last level
	cp 251
	jp z,Bootstrap_Level_EndOutro	; End Sequence
	cp 252
	jp z,Bootstrap_Level_Intro
	cp 255
	jp z,Bootstrap_Level_TEST
endif
ifdef CompileEP2
	cp 11
	jp z,Bootstrap_Stage_11
	cp 12
	jp z,Bootstrap_Stage_12
	cp 13
	jp z,Bootstrap_Stage_13
	cp 14
	jp z,Bootstrap_Stage_14
	cp 15
	jp z,Bootstrap_Stage_15
	cp 16
	jp z,Bootstrap_Stage_16
	cp 17
	jp z,Bootstrap_Stage_17
	cp 18
	jp z,Bootstrap_Stage_18
	cp 19
	jp z,Bootstrap_Stage_19
	cp 20
	jp z,Bootstrap_Stage_20
	cp 240
	jp z,Bootstrap_Level_Ep2Intro
	cp 241
	jp z,Bootstrap_Level_Ep2EndIntro
	cp 242
	jp z,Bootstrap_Level_Ep2EndOutro
endif


jp Bootstrap_Level_1 ;should never get here!

Bootstrap_FromBasic:
	ld l,(ix+0)	
	ld h,(ix+1)
	jp Bootstrap_FromHL

;***************************************************************************************************

;					Start Game

;***************************************************************************************************

Blackout64k:			;Blackout screen on 64k, do nothing on 128
ifdef Support64k
	ifdef debug
		ret
	endif

	ifdef Support128k
		ld a,(CPCVer)
		and 128
		ret nz
	endif
	ifndef debug
		ifdef buildCPC
			ld e,1
			ld hl,RasterColors_Black
			call RasterColors_NoDelay
			ld hl,RasterColors_ZeroColors
			call SetColors
		endif
	endif
endif
ret

BootsStrap_StartGame:
ifdef buildCPC
	read "..\AkuCPC\BootsStrap_StartGame_CPC.asm"
endif
ifdef buildENT
	read "..\AkuENT\BootsStrap_StartGame_ENT.asm"
endif

ifdef buildMSX
	read "..\AkuMSX\BootStrap_StartGame_MSX.asm"
endif
ifdef buildZXS

	read "..\AkuZX\BootStrap_StartGame_ZX.asm"
endif
 

	;bochanonly



	;ld a,0*3
	;call Akuyou_ShowCompiledSprite


;	call StartANewGame
;	xor a
;	call Enable_Player_CheatMode
;	call Cheat_BochanOnly
;	call Cheat_ChibikoOnly
;	call Cheat_TwoPlayer



;	jp Bootstrap_Level_TEST

;	jp GameOverWin
;	jp GameOver
 
	;Episode 1
;	jp Bootstrap_Level_0Again
;	call FireMode_4D
;	jp Bootstrap_Level_1
;	jp Bootstrap_Level_2
; 	jp Bootstrap_Level_3
;	jp Bootstrap_Level_4
;	jp Bootstrap_Level_5
;	jp Bootstrap_Level_6
;	jp Bootstrap_Level_7
;	jp Bootstrap_Level_8
;	jp Bootstrap_Level_9
;	JP Bootstrap_Level_EndIntro	;Shown before the last level
;	JP Bootstrap_Level_EndOutro	; End Sequence
;	JP Bootstrap_Level_Intro


;	jp NewGame_EP2_2P
;	jp Bootstrap_Stage_11
;	jp Bootstrap_Stage_12
;	jp Bootstrap_Stage_13
;	jp Bootstrap_Stage_15
;	jp Bootstrap_Stage_15
;	jp Bootstrap_Stage_16
;	jp Bootstrap_Stage_17
;	jp Bootstrap_Stage_18
;	jp Bootstrap_Stage_19
;	jp Bootstrap_Stage_20
;	jp Bootstrap_Level_Ep2Intro
;	jp Bootstrap_Level_Ep2EndOutro
;	jp Bootstrap_Level_Ep2EndIntro

;jp GameOverWin


;	jp Bootstrap_Level_Intro
;	jp Bootstrap_Level_EndOutro
	jp Bootstrap_Level_0	; Start the menu


Enable_Player_CheatMode:
	xor a
	ld (CheatMode_Plus1-1),a
	ret


endif

;For testing the game from an intro - cheat the game to start with certain players
Cheat_BochanOnly:
	ld a,1
	ld (LivePlayers),a
	ld a,3
	ld (P2_P09),a
	xor a
	ld (P1_P09),a
ret
Cheat_ChibikoOnly:
	ld a,1
	ld (LivePlayers),a
	ld a,3
	ld (P1_P09),a
	xor a
	ld (P2_P09),a
ret
Cheat_TwoPlayer:
	ld a,2
	ld (LivePlayers),a
	ld a,3
	ld (P1_P09),a
	ld (P2_P09),a
ret

;There are two version of Level0 (Menu) - one to run from the game load up
; and one to reset things if the game has returned from gameover

;backup 4k of screen for temp use - we always use the screen for scratch area,
;but if we have spare space somewhere else, lets's use it!
LocateAndShowTextLines:
	


	call Akuyou_DrawText_LocateSprite	
ifdef BuildZXS
	push bc
	push hl
		ld a,1
		ld c,64+2
		call Akuyou_ZXSGPU_CommandNum
	pop hl
	pop bc
endif
ShowTextLines:
	push hl
	push bc



		ld a,2
		call Akuyou_SpriteBank_Font
		;ld hl,&7000
;		call Akuyou_ShowSprite_SetBankAddr
	pop bc
	pop hl
ShowTextLinesAgain:
	ld a,(bc)
	ld h,a
	dec h
	inc bc
	call Akuyou_DrawText_LocateSprite	
	
	ld a,255
	ldia
	push hl
		call Akuyou_DrawText_PrintString	
	pop hl
	inc bc
	inc l
	ld a,(bc)
	or a
	jr nz,ShowTextLinesAgain
	di
	call Akuyou_Music_Stop
ret

ifdef Debug
	DebugBuild:
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db 13,"Debug Build","!"+&80
	db 0
endif
InitPlayer:
	ld a,3
	ld (iy+9),a
	ret

NewGame_CheatStart:
ifdef BuildZXS
	pop hl
endif

	pop hl	;junk
	call StartANewGame
	pop hl	;Get CheatSettings
	ld a,h
	push hl
		ld hl,Cheat_ChibikoOnly
		cp 0		
		jr z,ApplyCheatPlayerCall

		ld hl,Cheat_BochanOnly
		cp 1
		jr z,ApplyCheatPlayerCall

		ld hl,Cheat_TwoPlayer
		cp 2
		jr z,ApplyCheatPlayerCall

ApplyCheatPlayerCall:
		ld (CheatPlayerCall_Plus2-2),hl
	pop hl
	ld a,l
	or a
	jr z,ApplyCheatNoCheatMode

	xor a
	call Enable_Player_CheatMode
;	call Cheat_BochanOnly
;	call Cheat_ChibikoOnly


ApplyCheatNoCheatMode:
	call null :CheatPlayerCall_Plus2

	pop hl ;level

	ld sp,SPReset
	jp Bootstrap_Level
ret

NewGame_EP2_2P:
	call StartANewGame
	ld iy,Player_Array

	ld a,2
	ld (iy-7),a ;live players

	call InitPlayer

	ld de,Akuyou_PlayerSeparator
	add iy,de
	call InitPlayer
ifdef CompileEP2
	jr Bootstrap_Stage_11
endif
ifdef CompileEP1 
	jp Bootstrap_Level_1
endif


NewGame_EP2_1UP:
;	call Akuyou_Music_Stop

	call StartANewGame
	ld iy,Player_Array
	
	call InitPlayer
ifdef CompileEP2
	jr Bootstrap_Stage_11
endif
ifdef CompileEP1 
	jp Bootstrap_Level_1
endif


NewGame_EP2_2UP:
	call StartANewGame
	
	ld iy,Player_Array
	ld de,Akuyou_PlayerSeparator
	add iy,de
	call InitPlayer
ifdef CompileEP2
	jr Bootstrap_Stage_11
endif
ifdef CompileEP1 
	jp Bootstrap_Level_1
endif

ifdef CompileEP2

Bootstrap_Stage_11:	

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	ld hl,DiskMap_Level1		;T10-SC1.D01
	ld c,DiskMap_Level1_Disk 	

	call Bootstrap_LoadEP2Music_Z

	jp Bootstrap_LoadEP2Level_2PartZ;_Zpartial
;	jp Bootstrap_LoadEP2Level_2Part_Z



Bootstrap_Stage_12:

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite


	;Music from first part
	ld hl,DiskMap_Level1		;T10-SC1.D01
	ld c,DiskMap_Level1_Disk 	
	call Bootstrap_LoadEP2Music_Z

	;music for boss battle
	ld hl,DiskMap_MusicBoss
	ld c,DiskMap_MusicBoss_Disk
	call Bootstrap_LoadEP2AltMusic_Z


	ld a,&C0
	ld hl,DiskMap_Level2
	ld c,DiskMap_Level2_Disk

	jp Bootstrap_LoadEP2Level_4PartZ


;ret


Bootstrap_Stage_13:	

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	ld hl,DiskMap_Level3		;T20-SC1.D01
	ld c,DiskMap_Level3_Disk 	

	call Bootstrap_LoadEP2Music_Z

	jp Bootstrap_LoadEP2Level_2PartZ;_Zpartial


Bootstrap_Stage_14:

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	ld hl,DiskMap_Level3		;T20-SC1.D01
	ld c,DiskMap_Level3_Disk 	
	call Bootstrap_LoadEP2Music_Z

	;music for boss battle
	ld hl,DiskMap_MusicBoss
	ld c,DiskMap_MusicBoss_Disk
	call Bootstrap_LoadEP2AltMusic_Z

	ld hl,DiskMap_Level4
	ld c,DiskMap_Level4_Disk	;T24-SC1.D01
	jp Bootstrap_LoadEP2Level_2PartZ;_Zpartial





Bootstrap_Stage_15:

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	ld hl,DiskMap_Level1		
	ld c,2;DiskMap_Level1_Disk 	

	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level1 ;T10-SC1.D01
	ld c,2 	
	jp Bootstrap_LoadEP2Level_2PartZ

Bootstrap_Stage_16:

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite


	ld hl,DiskMap_Level1		
	ld c,2	
	call Bootstrap_LoadEP2Music_Z


	;music for boss battle
	ld hl,DiskMap_MusicBoss
	ld c,DiskMap_MusicBoss_Disk
	call Bootstrap_LoadEP2AltMusic_Z



	ld hl,DiskMap_Level2
	ld c,2 	;T14-SC1.D01
	jp Bootstrap_LoadEP2Level_4PartZ;_Zpartial





Bootstrap_Stage_17:	

	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	ld hl,DiskMap_Level3
	ld c,2 	;T20-SC1.D02	
	call Bootstrap_LoadEP2LoadScreen_Z

	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level3
	ld c,2 	;T20-SC1.D02
	jp Bootstrap_LoadEP2Level_2PartZ;_Zpartial



Bootstrap_Stage_18:	
	
	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	ld hl,DiskMap_Level3
	ld c,2 	;T20-SC1.D02	
	call Bootstrap_LoadEP2Music_Z




;	ld a,&C4
;	ld hl,DiskMap_Level4_C
;	ld c,2  ;T17-SC3.D02
;	ld de,&4000
;	call Akuyou_LoadDiscSectorz


	ld hl,DiskMap_Level4
	ld c,2 	;T24-SC1.D02

	ld a,&C4
	ld l,&C3
	ld de,&4000
	ld ix,&8000
	call LoadDiscSectorZ_WithPushes

	ld a,&C1	       ;128k Part
	ld l,&C2
	ld de,LevelData128kpos
	ld ix,&E800
	call LoadDiscSectorZ_WithPushes

	push bc
	push hl
	push ix

		;music for boss battle
		ld a,&C7
		ld hl,DiskMap_MusicBoss
		ld c,DiskMap_MusicBoss_Disk
		ld de,&6200
		ld ix,&6200+&450
		call Akuyou_LoadDiscSectorZ
	pop ix
	pop hl
	pop bc


jp Bootstrap_LoadEP2Level_1PartZ





Bootstrap_Level_Ep2EndOutro:

	ld hl,DiskMap_Intro		;T56-SC1.D04
	ld c,DiskMap_IntroEp2_Disk
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_EndOutro ;T50-SC1.D03
	ld c,4

	jp Bootstrap_LoadEP2Level_1PartZ	

Bootstrap_Level_Ep2EndIntro:

	ld hl,DiskMap_EndIntro ;"T56-SC1.D04"
	ld c,3

	call Bootstrap_LoadEP2Music_Z

	jp Bootstrap_LoadEP2Level_1PartZ


Bootstrap_Level_Ep2Intro:
	ld hl,DiskMap_Intro		;T56-SC1.D04
	ld c,DiskMap_IntroEp2_Disk
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_Intro ;"T56-SC1.D04"
	ld c,DiskMap_IntroEp2_Disk
	jp Bootstrap_LoadEP2Level_1PartZ

Bootstrap_Stage_19:
	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call FireMode_4D


	ld hl,DiskMap_Stage_19  ;T30-SC1.D02
	ld c,2

	call Bootstrap_LoadEP2LoadScreen_Z

	call Bootstrap_LoadEP2Music_Z

;	ld a,&C4
;	ld l,&C4
;	ld de,&6000
;	ld ix,Akuyou_MusicPosAlt;&8000
;	call LoadDiscSectorZ_WithPushes



;	ld c,3	;Disk3


;	ld a,&C4
;	ld l,&C3
;	ld de,&4000
;	ld ix,&6000
	;call LoadDiscSectorZ_WithPushes
	;push hl
;	push bc
;		call &4000
;	pop bc
;	pop hl

	jp Bootstrap_LoadEP2Level_4PartZ
Bootstrap_Stage_20:


	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call FireMode_4D


	ld hl,DiskMap_Stage_20B		;T32-SC1.D02
	ld c,DiskMap_Stage_20_Disk

	call Bootstrap_LoadEP2Music_Z


;	ld a,&C0
	ld hl,DiskMap_Stage_20  ;T31-SC1.D02
	ld c,DiskMap_Stage_20_Disk



	ld a,&C4
	ld de,&4000
	ld ix,&4000+&4000
	ld l,&C3
	call LoadDiscSectorZ_WithPushes


	;256k Banks
	;CC CD CE CF
	;D4 D5 D6 D7
	

	ld a,(CPCVer)	;cpcver
	and 64		;256k?
	jr z,Stage20No256k

	ld l,23				; Show the 'Debug mode' message
	ld bc,load256k
	call ShowTextLines



	ld hl,DiskMap_Stage_20  ;T31-SC1.D02
	ld c,DiskMap_Stage_20_Disk


	ld a,&CC
	ld de,&4000
	ld l,&C4
	ld ix,&4000+&4000
	call LoadDiscSectorZ_WithPushes

	ld a,&CD
	ld de,&4000
	ld l,&C5
	call LoadDiscSectorZ_WithPushes

	ld a,&CE
	ld de,&4000
	ld l,&C6
	call LoadDiscSectorZ_WithPushes


	ld a,&CF
	ld de,&4000
	ld l,&C7
	call LoadDiscSectorZ_WithPushes


	ld a,&D4
	ld de,&4000
	ld l,&C8
	call LoadDiscSectorZ_WithPushes

	ld a,&D5
	ld de,&4000
	ld l,&C9
	call LoadDiscSectorZ_WithPushes


	ld hl,DiskMap_Stage_20B  ;T32-SC1.D02
	ld a,&D6
	ld de,&4000
	ld l,&C1
	call LoadDiscSectorZ_WithPushes

	ld a,&D7
	ld de,&4000
	ld l,&C2
	call LoadDiscSectorZ_WithPushes


	ld hl,DiskMap_Stage_20  ;T31-SC1.D02
Stage20No256k:
	jp Bootstrap_LoadEP2Level_2PartZ





endif




load256k:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db 2, "Please Wait, Loading 256K Sprites..","."+&80
db 0


ifdef buildMSX
	LoadRLE_WithPushes:
	push bc
	push hl
		inc h
;		ld ix,0
;		call VDP_rleProcessor
		call LoadLZ48RLE
LoadRLE_WithPushesDone:
	pop hl
	pop bc
	call VDP_RLEProcessor_GetLastY	; Load last IY end
	ld (VDP_NextFreeYPos_Plus2-2),IY
ret
LoadRLE_WithPushesV9K:
	push bc
	push hl
		inc h
		ld ix,0
		call VDP_rleProcessor
jr LoadRLE_WithPushesDone
endif


LoadDiscSector_WithPushes:
	ifdef buildMSX
		push iy
	endif
		push bc
		push hl
			call Akuyou_LoadDiscSector
		pop hl
		pop bc
	ifdef buildMSX
		pop iy
	endif
ret


LoadDiscSectorZ_WithPushes:
	ifdef buildMSX
		push iy
	endif
		push bc
		push hl
			call Akuyou_LoadDiscSectorZ
		pop hl
		pop bc
	ifdef buildMSX
		pop iy
	endif
ret
 

;Compressed Loader

Bootstrap_LoadEP2LoadScreen_Z:
ifdef BuildCPC	
	ld a,&C0
	ld de,&4000
	ld ix,&4000+&4000
	ld l,&C8
		call LoadDiscSectorZ_WithPushes
		call Akuyou_RasterColors_DefaultSafe
		call Akuyou_CLS
		di
		exx
		push bc
		call &4000
		pop bc
		exx
endif
ifdef BuildENT
	ld a,Akuyou_LevelStart_Bank
	ld de,&4000
	ld ix,&4000+&4000
	ld l,&C8
		call LoadDiscSector_WithPushes

		ld de,EntSafePalette
		call ENT_UpdatePlusRastersAlt

		call Akuyou_CLS
		di

		call &4000
	
	
endif

ifdef BuildZXS
	ld a,Akuyou_LevelStart_Bank
	ld de,&C000
	ld ix,&C000+&4000
	ld l,&C8
		call LoadDiscSectorZ_WithPushes
		call Akuyou_CLS

		exx
		push bc
			ld de,Akuyou_LevelStart
			ld a,Akuyou_LevelStart_Bank
			ld hl,Rle_FromPointers
			call Akuyou_Bankswapper_CallHL
		pop bc
		exx
		ld iy,&5C3A	;apparently good practice?

endif


ifdef BuildMSX
		push hl
		push bc
			call Akuyou_CLS

		pop bc
		pop hl
		ld l,&C8
		ld ix,64
		ld iy,0
		call LoadLZ48RLE_AltX
endif
ret


Bootstrap_LoadEP2AltMusic_Z:
	ld a,&C4
	ld de,Akuyou_MusicPosAlt
	ld ix,Akuyou_MusicPosAlt+&450
	jp Akuyou_LoadDiscSectorZ

Bootstrap_LoadEP2Music_Z:
	ifdef BuildENT
		in a,(&B0)
	else
		ld a,Akuyou_Music_Bank
	endif
	ld de,Akuyou_MusicPos
	ld ix,Akuyou_MusicPos+&400
	ld l,&C9
ifdef BuildZXS
	jp LoadDiscSector_WithPushes	;Z is corrupting my speccy SFX - I don't know why!
else
	jp LoadDiscSectorZ_WithPushes
endif


Bootstrap_LoadEP2Level_2Part_Z:

	ld a,&C1	       ;128k Part
	ld l,&C2
	ld de,LevelData128kpos
	ld ix,&E800
	call LoadDiscSectorZ_WithPushes

Bootstrap_LoadEP2Level_1Part_Z:

	ld a,&C0		; Base Part
	ld l,&C1
	ld de,Akuyou_LevelStart+&1000
	ld ix,&8000;7FFF
	call Akuyou_LoadDiscSectorZ

	jp GenericStartLevel
 



; Uncompressed - For Testing

Bootstrap_LoadEP2Music:
	ld a,&C0
	ld de,Akuyou_MusicPos
	ld ix,Akuyou_MusicPos+&400
	ld l,&C9
	jp LoadDiscSector_WithPushes


Bootstrap_LoadEP2Level_3PartAlt:

	ld a,&C4
	ld l,&C3
	ld de,&4000
	ld ix,&8000
	call LoadDiscSector_WithPushes
	jp Bootstrap_LoadEP2Level_2Part

Bootstrap_LoadEP2Level_2PartBegin:
	ifdef buildMSX
		ld iy,Akuyou_LevelSprites_Y
	endif
	jr Bootstrap_LoadEP2Level_2Part


Bootstrap_LoadEP2Level_4PartBegin:
	ifdef buildMSX
		ld iy,Akuyou_LevelSprites_Y
	endif
Bootstrap_LoadEP2Level_4Part:
	ld l,&C4
ifdef buildMSX
	ld (Bank3_Ypos_Plus2-2),IY
	call LoadRLE_WithPushes
endif
	ld a,LevelData128kpos_D_Bank ;&C4

	ld de,LevelData128kpos_D ;&6000
	ld ix,LevelData128kpos_D +&2000;&8000
	call LoadDiscSector_WithPushes

Bootstrap_LoadEP2Level_3Part:
	ld l,&C3
ifdef buildMSX
	ld (Bank2_Ypos_Plus2-2),IY
	call LoadRLE_WithPushes
endif
	ld a,LevelData128kpos_C_Bank ;&C4
	ld de,LevelData128kpos_C;&4000
	ld ix,LevelData128kpos_C +&2000;&6000
	call LoadDiscSector_WithPushes


Bootstrap_LoadEP2Level_2Part:
	ld l,&C2
ifdef buildMSX
	ld (Bank1_Ypos_Plus2-2),IY
	call LoadRLE_WithPushes
endif
	ld a,LevelData128kpos_Bank ;&C1	       ;128k Part

	ld de,LevelData128kpos
	ld ix,LevelData128kpos+&2800
	call LoadDiscSector_WithPushes


Bootstrap_LoadEP2Level_1Part:
ifdef buildMSX_V9K
	ld iy,Akuyou_V9K_Paralax_Y
	ld l,&C9
	call LoadRLE_WithPushesV9K	:V9K_Part_Plus2
endif 


Bootstrap_LoadEP2Level_1PartOnly:
	ld l,&C1
ifdef buildMSX
	ld (Bank0_Ypos_Plus2-2),IY
	call LoadRLE_WithPushes
	ld (LoadTilePos_Plus2-2),IY
endif



	ld a,Akuyou_LevelStart_Bank ;&C0		; Base Part

	ld de,Akuyou_LevelStart
	ld ix,Akuyou_LevelStart+&3FFF

if BuildMSXv+BuildZXSv+BuildCPCv
	call LoadDiscSectorZ_WithPushes
else
	call LoadDiscSector_WithPushes
endif
	jp GenericStartLevel
Bootstrap_Level_NoV9K:
ifdef buildMSX_V9K
		ld hl,null
		ld (V9K_Part_Plus2-2),hl
endif 
ret

Bootstrap_LoadEP2Level_4PartZ:

	ld a,&C4
	ld l,&C4
	ld de,&6000
	ld ix,Akuyou_MusicPosAlt;&8000
	call LoadDiscSectorZ_WithPushes

Bootstrap_LoadEP2Level_3PartZ:

	ld a,&C4
	ld l,&C3
	ld de,&4000
	ld ix,&6000
	call LoadDiscSectorZ_WithPushes


Bootstrap_LoadEP2Level_2PartZ:

	ld a,&C1	       ;128k Part
	ld l,&C2
	ld de,LevelData128kpos
	ld ix,&E800
	call LoadDiscSectorZ_WithPushes

Bootstrap_LoadEP2Level_1PartZ:

	ld a,&C0		; Base Part
	ld l,&C1
	ld de,Akuyou_LevelStart
	ld ix,&8000;7FFF
	call Akuyou_LoadDiscSectorZ

	jp GenericStartLevel






; Part Compressed - For Testing

Bootstrap_LoadEP2Level_4Part_Zpartial:

	ld a,&C4
	ld l,&C4
	ld de,&6000
	ld ix,&8000
	call LoadDiscSectorZ_WithPushes

Bootstrap_LoadEP2Level_3Part_Zpartial:

	ld a,&C4
	ld l,&C3
	ld de,&4000
	ld ix,&6000
	call LoadDiscSectorZ_WithPushes


Bootstrap_LoadEP2Level_2Part_Zpartial:

	ld a,&C1	       ;128k Part
	ld l,&C2
	ld de,LevelData128kpos
	ld ix,&E800
	call LoadDiscSectorZ_WithPushes

Bootstrap_LoadEP2Level_1Part_Zpartial:

	ld a,&C0		; Base Part
	ld l,&C1
	ld de,Akuyou_LevelStart
	ld ix,&8000;7FFF
	call Akuyou_LoadDiscSector

	jp GenericStartLevel





Bootstrap_Level_0Again:	

	ld sp,SPReset	; we are not returning, so reset the stack


;	call StartANewGame
;	call LevelReset0000



	;call Akuyou_Firmware_Restore
	;call Akuyou_ScreenBuffer_

	ei
	ifdef BuildCPC
		ld hl,RasterColors_ZeroColors
		call SetColors
		halt
		halt
		halt 
		halt 
		halt
	endif
ifdef BuildENT
	
	ld a,LevelData128kpos_Bank				
	ld hl,DiskMap_LoadingScreen
	ld c,DiskMap_LoadingScreen_Disk
	ld de,&C000
	ld ix,&8000-1;-8523
	call Akuyou_LoadDiscSector

	ld a,LevelData128kpos_Bank
	ld hl,&4000
	ld de,&C000
	ld bc,&3F00	; Don't corrupt the stack!
	call Akuyou_BankSwitch_C0_BankCopy
endif


ifdef BuildCPC
	;call Akuyou_Firmware_Restore
	ld a,(CPCVer)
	and %10000000
	jr z,ReloadTitleCPC64k
	
	ld a,LevelData128kpos_C_Bank				
	ld hl,DiskMap_LoadingScreen
	ld b,DiskMap_LoadingScreen_Size
	ld c,DiskMap_LoadingScreen_Disk
	ld de,&C000
	ld ix,&8000-1;-8523
	jr ReloadTitleCPC
ReloadTitleCPC64k:
	ld a,&C0				
	ld hl,DiskMap_LoadingScreen
	ld b,DiskMap_LoadingScreen_Size
	ld c,DiskMap_LoadingScreen_Disk
	ld de,&C000
	ld ix,&C000+&4000-1;-8523
	jr ReloadTitleCPC
ReloadTitleCPC:
	call Akuyou_LoadDiscSectorZ

		
	;	ld a,Akuyou_LevelStart_Bank
;		ld hl,DiskMap_LoadingScreen
;		ld c,DiskMap_LoadingScreen_Disk
;		ld de,&C000
;		ld ix,&C000+&3FFF ;Akuyou_LevelStart+&3FFF
;		call Akuyou_LoadDiscSectorZ

endif

ifdef BuildZXS

	;Show the Loading Screen
	ld de,&4000
	ld hl,DiskMap_LoadingScreen		;&26C1 ; T38-SC1.D01 
	ld c, DiskMap_LoadingScreen_Disk
	ld a, 0
	ld IX,&FFFF;&5B00;B000
	call LoadDiscSectorZ			

endif

ifdef BuildMSX
	call cls
	call Akuyou_Music_Stop 
	;Show the Loading Screen
	ld hl,DiskMap_LoadingScreen		;&26C1 ; T38-SC1.D01 
	ld c, DiskMap_LoadingScreen_Disk
	ld iy,&0000
	call LoadLZ48RLE
endif


;Why???
;	ld hl,FileName_Settings
;	ld de,SavedSettings
;
;	ifndef buildZXS_TAP
;		call DiskDriver_LoadDirect
;	endif



;	jr Bootstrap_Level_0
Bootstrap_Level_0:	

	call StartANewGame
	call LevelReset0000

	ld hl,DiskMap_MainMenu		;T08-SC1.D01
	ld c,DiskMap_MainMenu_Disk

	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_MainMenu		;T08-SC1.D01
	ld c,DiskMap_MainMenu_Disk


	ifdef buildMSX
		ld iy,Akuyou_LevelSprites_Y
	endif

	;need to use Specail MSX version - no extra tilemaps
	jp Bootstrap_LoadEP2Level_1PartOnly;Bootstrap_LoadEP2Level_1Part;Z;_Zpartial

ret



Level_1Msg:


if BuildLang='j'
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db 008,140,133,139,159,158,125,159,110,116," ",146,152,140,159,133,129,130,103," ",143,159,121,124,131,125,132,255
db 010,122,131,117,120,103," ",114,131,147,132," ",130,140,159,123,139," ",131,119,155,129,119,152,255
db 009,115,130,135,130,125,159,110,116," ",118,149,126,145,126,154," ",131,148,153,129,159,112,129,122,133,159,255
db 007,133,131,127,159,158," ",128,116,128,159,116,125,121,132," ",139,159,119,139,159,119,125,115,255
db 009,142,129,121,128,135," ",119,119,155,129," ",119,115,141,159,131,119,159," ",118,125,156,135,255
db 008,125,138,140,159,123,158,132,159," ",116,154,124,121," ",133,140,159,144,157,112,132,115,144,126,098,255
db 011,130,140,159,123,139," ",128,116,115,116," ",125,131,155,115,134,123,133,103,255
db 013,145,138,119,159,126,157,122," ",114,153,144,127,158,119,152,255
db 011,123,155,119,152," ",123,138," ",119,115,141,159,131,103," ",129,159,125,129,255
db 010,140,133,135," ",115,120,125,159,123,159,121,103," ",145,127,132,114,122,159,154,"!",255
else
ifndef CPC320
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5
	db 6 ,"After a hard night massacring"," "+&80
	db 6 ,"villagers and harvesting their"," "+&80
	db 6 ,"Blood,Chibiko is having a well"," "+&80
	db 6 ,"earned days sleep. Suddenly She"," "+&80
	db 6 ,"is awoken by A swarm of noizy,"," "+&80
	db 6 ,"ill concieved and badly drawn"," "+&80
	db 5 ,"Monsters, that are invading her"," "+&80
	db 5 ,"Castle and disturbing the peace!"," "+&80
	db 7 ,"Chibiko's not the kind of"," "+&80
	db 6 ,"Vampire to take that! Time to"," "+&80
	db 5 ,"'Rise from your grave' and give"," "+&80
	db 7 ,"hell to whoever sent them","!"+&80

else
	db 2 ,"After a hard nights work massacrin","g"+&80
	db 2 ,"villagers and harvesting their bloo","d"+&80
	db 1 ,"Chibiko is having a well earned day'","s"+&80
	db 1 ,"sleep... Suddenly she is awoken by ","a"+&80
	db 4 ,"commotion. A swarm of noizy, stupi","d"+&80
	db 2 ,"ill concieved and badly drawn monster","s"+&80
	db 2 ,"are being drawn to her castle, and ar","e"+&80
	db 4 ,"seriously disturbing the peace","!"+&80
	db 4 ,"No self respecting vampire ca","n"+&80
	db 3 ,"overlook this insult! its time t","o"+&80
	db 3 ,"'Rise from your grave' and unleas","h"+&80
	db 6 ,"hell on whoever sent them","!"+&80
endif
endif
db &0

Bootstrap_Level_TEST:
	ld a,CSprite_Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000

	ld hl,DiskMap_LevelTest		;T10-SC1.D01
	ld c,DiskMap_LevelTest_Disk
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_LevelTest
	ld c,DiskMap_LevelTest_Disk

	jp Bootstrap_LoadEP2Level_2PartBegin



Bootstrap_Level_1:	

;Turn these on later
;	call Akuyou_RasterColors_DefaultSafe
	ld a,CSprite_Loading
	call Akuyou_ShowCompiledSprite
	
	call LevelReset0000

	ld hl,DiskMap_Level1		;T10-SC8.D01
	ld c,DiskMap_Level1_Disk
	call Bootstrap_LoadEP2LoadScreen_Z

	ld l,12
	ld bc,Level_1Msg
	call LocateAndShowTextLines


	ld hl,DiskMap_Level1		;T10-SC1.D01
	ld c,DiskMap_Level1_Disk
	call Bootstrap_LoadEP2Music_Z





	ld hl,DiskMap_Level1
	ld c,DiskMap_Level1_Disk
	jp Bootstrap_LoadEP2Level_2PartBegin	

Bootstrap_Level_2:	

	ld a,CSprite_Loading 		;Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000

	ld hl,DiskMap_Level2
	ld c,DiskMap_Level2_Disk
	call Bootstrap_LoadEP2Music_Z




	ld hl,DiskMap_Level2
	ld c,DiskMap_Level2_Disk

	jp Bootstrap_LoadEP2Level_2PartBegin	


ret

Level_3Msg
ifndef CPC320

if BuildLang='j'
        ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db 008,255
db 008,255
db 008,149,144,103," ",138,143,159,154," ",119,115,141,159,131,139," ",148,153,119,152," ",120,132,154,255
db 008,145,129,115,132,159,126,098,123,138,148,153,135," ",139,115,112,132," ",125,158,153,109,121,103,255
db 017,133,147,144,125,111,116,"!",255
db 007,148,153,138," ",133,159,116,141,159,131,129,130,119,159," ",139,159,122,132," ",128,159,158,140,159,135,255
db 009,134,112,132,125,144,112,129,098,116,154,124,121,132," ",147,115,157,121,132,159,126,"!",255
db 009,132,159,148," ",128,159,158,140,159,148," ",142,158,134," ",119,115,141,159,131,148,255
db 010,130,140,159,123,138," ",121,156,144,143,116,135,139," ",119,134,157,134,115,098,255
else

	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5
	db 7 ,"The monsters climbing the"," "+&80
	db 7 ,"mountain seem to be coming"," "+&80
	db 6 ,"from the forest.Its time to"," "+&80
	db 6,"push forward, and stop the"," "+&80
	db 14,"invasion!"," "+&80
	db 5 ,"The animals of the forest seem"," "+&80
	db 5 ,"to have become mutants,zombies"," "+&80
	db 6 ,"& generally super-annoyin","g"+&80
	db 6 ,"But no matter what monster","s"+&80
	db 6 ,"lurks in the forest it will"," "+&80
	db 7 ,"be no match for Chibiko'","s"+&80
	db 11,"Black Magic!!","!"+&80
endif

else
	db 3 ,"The monsters climbing the mountai","n"+&80
	db 3 ,"Seem to be coming from the fores","t"+&80
	db 3 ,"Its time to push forward, and sto","p"+&80
	db 13,"the invasion","!"+&80
	db 3 ,"The animals of the forest seem t","o"+&80
	db 3 ,"have become mutants, zombies, an","d"+&80
	db 8 ,"generally super-annoyin","g"+&80
	db 15," "," "+&80
	db 3 ,"But no matter what zombified evi","l"+&80
	db 3 ,"lurks in the heart of the fores","t"+&80
	db 3 ,"it will be no match for Chibiko'","s"+&80
	db 13,"Black Magic!!","!"+&80
endif
db &0
Bootstrap_Level_3:	



	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000

	ld hl,DiskMap_Level3		;T10-SC8.D01
	ld c,DiskMap_Level3_Disk
	call Bootstrap_LoadEP2LoadScreen_Z

	ld l,12
	ld bc,Level_3Msg
	call LocateAndShowTextLines

	ld hl,DiskMap_Level1
	ld c,DiskMap_Level1_Disk
	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level3
	ld c,DiskMap_Level3_Disk

	jp Bootstrap_LoadEP2Level_2PartBegin	





;ret



Bootstrap_Level_4:	


	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000

	ld hl,DiskMap_Level2
	ld c,DiskMap_Level2_Disk

	call Bootstrap_LoadEP2Music_Z




	ld hl,DiskMap_Level4
	ld c,DiskMap_Level4_Disk

	jp Bootstrap_LoadEP2Level_2PartBegin	



ret

Level_5Msg
ifndef CPC320

if BuildLang='j'
        ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5      
db 008,255
db 008,255
db 009,128,159,158,140,159,138," ",150,154,120,109,152,138," ",127,158,138,116,103," ",134,158,133,119,255
db 005,119,159,144,158,125,132," ",125,111,116,140,158,103," ",119,157,126,159,135," ",119,157,144,132,159," ",126,126,158,129,159,098,255
db 009,132,159,148," ",123,123,148," ",119,157,112,129," ",133,159,116,141,159,131," ",139,159,119,153,"!",255
db 009,119,157,138," ",148,133,144,132,159," ",126,126,158,132,159," ",123,138," ",147,115,157,121,138,255
db 013,145,134,148,133,103," ",131,141,159,125,144,125,111,116,"!",255


else
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5
	db  5,"After defeating the zombified"," "+&80
	db  7,"merchandise cash-cow,and"," "+&80
	db  6,"narrowly avoiding buying the"," "+&80
	db  5,"plush doll,Chibiko headed down"," "+&80
	db  5,"to the river, only to find it"," "+&80
	db  5,"also full of weird stuff too!"," "+&80
	db  6,"Heading to the source will"," "+&80
	db  8,"reveal whoever sent the","m"+&80
	db  5,"and stop this annoyance once"," "+&80
	db 14,"and for all","!"+&80
endif

else
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db 15,""," "+&80
	db  2,"After defeating the evil zombifie","d"+&80
	db  3,"merchandise cash-cow,and narrowl","y"+&80
	db  4,"avoiding buying the plush dol","l"+&80
	db  3,"Chibiko headed down to the river",","+&80
	db  3,"only to find it also full of weir","d"+&80
	db  4,"stuff too! Heading to the sourc","e"+&80
	db  5,"will reveal whoever sent the","m"+&80
	db  3,"and stop this annoyance once an","d"+&80
	db 15,"for all","!"+&80
endif
db &0



Bootstrap_Level_5:	

	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000


	ld hl,DiskMap_Level5		;T10-SC8.D01
	ld c,DiskMap_Level5_Disk
	call Bootstrap_LoadEP2LoadScreen_Z

	ld l,12
	ld bc,Level_5Msg
	call LocateAndShowTextLines




	ld hl,DiskMap_Level5
	ld c,DiskMap_Level5_Disk
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_Level5
	ld c,DiskMap_Level5_Disk

	jp Bootstrap_LoadEP2Level_2PartBegin	



Bootstrap_Level_6:
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000


	ld hl,DiskMap_Level6
	ld c,DiskMap_Level6_Disk
	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level6
	ld c,DiskMap_Level6_Disk
	jp Bootstrap_LoadEP2Level_4PartBegin



ret
PressFireMessage:

	ld hl,&0918				; Show the Continue message
	call Akuyou_DrawText_LocateSprite	
	ld bc,PressFireMsg
	ld a,255
	ldia
	call Akuyou_DrawText_PrintString	

	jp WaitForFire
PressFireMsg:
db "Press Fire to Continue","!"+&80

Level_7Msg
ifndef CPC320
if BuildLang='j'
        ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5      
db 011,119,115,141,159,131,129,130,139," ",123,138,133,159,116,121,131,119,152,255
db 013,120,132,154,145,129,115,098," ",115,153,121,159,130,139,255
db 010,140,133,131,129,159,122," ",129,159,119,152," ",131,121,112,132,154," ",140,133,139,255
db 015,120,112,133," ",128,123,135," ",115,154,"!",255
db 011,121,152,121,132," ",143,133,158,133,159," ",145,117,134,115,122,133,159,255
db 008,153,158,123,116,138," ",115,125,133," ",143,129,154,132,159," ",134,158,133,119," ",145,117,154,098,255
db 011,148,116,126,121,159," ",125,111,116,141,159,119,159," ",139,125,159,144,154,"!",255
db 008,133,159,116,121,131,135," ",139,115,112,132," ",115,119,155,129," ",120,110,116,122,131,120,138,255
db 014,143,158,120,103," ",145,127,144,125,111,116,"!",255

else

	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5
	db 6 ,"The monsters are coming from"," "+&80
	db 6 ,"this cave! There's only one"," "+&80
	db 5 ,"entrance,So whoever is sending"," "+&80
	db 9 ,"them must be in there","!"+&80
	db 5 ,"Its difficult to see, as the"," "+&80
	db 7 ,"cave is are only lit by "," "+&80
	db 7 ,"phosphor rock and Glowing"," "+&80
	db 14,"creatures!"," "+&80
	db 6 ,"Victory is in your grasp","!"+&80
	db 6 ,"Go in there, and sort this"," "+&80
	db 14,"Shit out!"," "+&80
endif
else
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db 3 ,"The monsters are coming from thi","s"+&80
	db 3 ,"cave! There's only one entranc","e"+&80
	db 2 ,"So whoever is sending them must b","e"+&80
	db 15,"in there","!"+&80
	db 15," "," "+&80
	db 3 ,"Its difficult to see, as the cave","s"+&80
	db 2 ,"is are only lit by phosphor rock","s"+&80
	db 09,"and Glowing Creature","s"+&80
	db 15," "," "+&80
	db 7 ,"Victory is in your grasp","!"+&80
	db 1 ,"Go in there, and 'Sort that shit out!","'"+&80
endif
db &0



Bootstrap_Level_7:	
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite

	call LevelReset0000

	ld hl,DiskMap_Level7		;T10-SC8.D01
	ld c,DiskMap_Level7_Disk
	call Bootstrap_LoadEP2LoadScreen_Z

	ld l,12
	ld bc,Level_7Msg
	call LocateAndShowTextLines





	ld hl,DiskMap_Level5
	ld c,DiskMap_Level5_Disk
	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level7
	ld c,DiskMap_Level7_Disk
	jp Bootstrap_LoadEP2Level_2PartBegin	

ret



Bootstrap_Level_8:	
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite
	call LevelReset0000


	ld hl,DiskMap_Level5
	ld c,DiskMap_Level5_Disk
	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level8
	ld c,DiskMap_Level8_Disk
	jp Bootstrap_LoadEP2Level_2PartBegin



;ret


Bootstrap_Level_9:	
 
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite
	call LevelReset0000

	ld hl,DiskMap_Level6
	ld c,DiskMap_Level6_Disk
	call Bootstrap_LoadEP2Music_Z


	ld hl,DiskMap_Level9
	ld c,DiskMap_Level9_Disk
	jp Bootstrap_LoadEP2Level_2PartBegin

Bootstrap_Level_Intro:
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite
	call LevelReset0000


	call Bootstrap_Level_NoV9K

	ld hl,DiskMap_Intro
	ld c,2
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_Intro
	ld c,2				;T38-SC1.D02
	jp Bootstrap_LoadEP2Level_2PartBegin




Bootstrap_Level_EndIntro:	
	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite
	call LevelReset0000

	call Bootstrap_Level_NoV9K


	ld hl,DiskMap_Level5
	ld c,DiskMap_Level5_Disk
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_EndIntro
	ld c,DiskMap_EndIntro_Disk		;T38-SC1.D02
	jp Bootstrap_LoadEP2Level_2PartBegin




Bootstrap_Level_EndOutro:	

	ld a,CSprite_Loading		;Loading
	call Akuyou_ShowCompiledSprite
	call LevelReset0000

	call Bootstrap_Level_NoV9K

	ld hl,DiskMap_Level5
	ld c,DiskMap_Level5_Disk
	call Bootstrap_LoadEP2Music_Z

	ld hl,DiskMap_EndOutro
	ld c,2				;T38-SC1.D02

	jp Bootstrap_LoadEP2Level_2PartBegin




ifdef SupportPlus






Bootstrap_ReloadPlusSprites:
	ld a,&C0
	ld hl,DiskMap_PlusSprites
	ld b,DiskMap_PlusSprites_Size
	ld c,DiskMap_PlusSprites_Disk
	ld de,Akuyou_PlusSpritesPos
	ld ix,Akuyou_PlusSpritesPos+&800-1
;	ld ix,&E800
	call Akuyou_LoadDiscSectorz


	ld a,&C0
	call BankSwitch_C0_SetCurrent

		di
		ld b,4
		ld a,2
		ld hl,Akuyou_PlusSpritesPos+&0FF
		call Plus_CopySpriteCompressed

		ld b,5
		ld a,2
		ld hl,Akuyou_PlusSpritesPos+&07F
		call Plus_CopySpriteCompressed

		ld b,6
		ld a,2
		ld hl,Akuyou_PlusSpritesPos+&17F
		push hl
		call Plus_CopySpriteCompressed

		ld b,7
		ld a,2
		pop hl
		push hl
		call Plus_CopySpriteCompressed

		ld b,8
		ld a,2
		pop hl
		call Plus_CopySpriteCompressed

		ld b,9
		ld a,2
		ld hl,Akuyou_PlusSpritesPos+&1FF
		push hl
		call Plus_CopySpriteCompressed

		ld b,10
		ld a,2
		pop hl
		push hl
		call Plus_CopySpriteCompressed

		ld b,11
		ld a,2
		pop hl
		call Plus_CopySpriteCompressed

		ei



	ld a,&C0
	ld hl,DiskMap_PlusSpritesChibiko
	ld c,DiskMap_PlusSpritesChibiko_Disk
	ld de,Akuyou_PlayerSpritePos
;	ld ix,&3800+&800;-1
	call Akuyou_LoadDiscSector


;	ld a,&C1
;	ld hl,DiskMap_PlusSpritesBo
;	ld c,DiskMap_PlusSpritesBo_Disk
;	ld de,&F800
;	call Akuyou_LoadDiscSector

;	ld a,&C1
;	ld hl,DiskMap_PlusSpritesBoUD
;	ld c,0
;	ld de,&F000
;	call Akuyou_LoadDiscSector


	ld a,&C1
	ld hl,DiskMap_PlusSpritesBo;DiskMap_PlusSpritesChibikoUD
	ld c,DiskMap_PlusSpritesChibiko_Disk;0
	ld de,&E800
	ld ix,&E800;+&1800
	call Akuyou_LoadDiscSectorz



ret
endif

; File Locations in virtual Track-Sector
; The game was originally intended to use a direct disk reader - however as I managed
; to get Firware restore working, and the popularity of C4CPC and M4 disk emulators
; it seemed a bad choice to limit compatibility like that.
; note the SIZE variables are redundant, the reader never uses them!

read "diskmap.asm"





SetColors:

	ld a,1
	ld b,0
	ld c,b
	push hl
	call &bc38	; set border 0 to black
	pop hl
	ld b,4
	ld c,0
RasterColors_InitBasic:
	push hl
	push bc
		ld a,c
		ld c,(hl)
		ld b,c
		call &bc32	; set ink 0 to black
	pop bc
	pop hl
	inc c
	inc hl
	djnz RasterColors_InitBasic
	ret


;Savesettings save the Highscore, Controls etc

Bootstrap_SaveSettings:

ifdef BuildCPC
	call &BB57 ; VDU Disable
endif
	ld hl,FileName_Settings
	ld bc,SavedSettings_Last-SavedSettings
	ld de,SavedSettings
ifdef BuildZXS
	call DiskDriver_Save
	call SetKempson
endif
ifdef BuildMSX
	call DiskDriver_Save
endif
ifdef BuildENT
	call DiskDriver_Save
endif
ifdef BuildCPC
	call BootStrap_SaveDiskFile
	call &BB54 ; VDU enable
endif



ret


RasterColors_ZeroColors:
	defb 0,0,0
RasterColors_InitColors:
	defb 0,4,14,26

;Before the core is active we load files by filename, afterwards we use Track-Sector-Disk


ifdef BuildCPC
FileName_Settings:
	db "SETTINGS.V02"
endif
ifdef BuildENT
FileName_Settings:
	db 12,"SETTINGS.V02"
endif
ifdef BuildMSX
FileName_Settings:
	db "SETTINGSV02"
endif
FileName_Core:
	db "CORE    .AKU"
;FileName_LoadingScreen:
;	db "T38-SC1 .D01" 

;***************************************************************************************************

;					Generic Startlevel

;***************************************************************************************************
;ifdef Support128k
;GenericStartLevel128k
;	di
;
;	push hl
;		ld bc,&7f8D	; Reset the firmware to OFF
;		out (c),c
;		call Akuyou_Firmware_Kill ; Backup the firmware so the Level can override it
;	pop hl
;
	;copy the music back
;	ld a,&C4
;	ld de,Akuyou_MusicPos;&B000
;	ld bc,&400
;	call BankSwitch_C0_BankCopy

	;get the plus sprites
;ifdef SupportPlus
;	ld a,(CPCVer)
;	and 1
;	jp z,GenericStartLevel128kB
;This part is plus only
;	ld a,&C4
;	ld hl,&4000
;	ld de,Akuyou_PlusSpritesPos;&A800
;	ld bc,&800
;	call BankSwitch_C0_BankCopy

;jp GenericStartLevel128kB
;endif



GenericStartLevel:


	di
	call Akuyou_Firmware_Kill ; Backup the firmware so the Level can override it


ifdef buildZXS
	ld a,Akuyou_LevelStart_Bank	
	ld hl,LevelData_StartLevel
	call Akuyou_Bankswapper_CallHL
else

ifdef BuildENT
	ld a,Akuyou_LevelStart_Bank
	call BankSwitch_C0_SetCurrent
	ld de,EntBlackoutPalette
	call ENT_UpdatePlusRastersAlt
Endif

	jp LevelData_StartLevel ; the Bootstrap will be overwritten by the screenbuffer
endif



;***************************************************************************************************

;					Music Loader

;***************************************************************************************************



;This backs up the level colors, and uses the 'safe color' pallete
;used by the continue screen to pause the level, then restore it later
ifdef buildCPC
BootsStrap_BasicColors:

	ld hl,(RasterColors_ColorArray1Pointer_Plus2-2);,bc
	ld (BootsStrap_RestoreColors_BC_Plus2-2),hl
	ld hl,(RasterColors_ColorArray2Pointer_Plus2-2);,de
	ld (BootsStrap_RestoreColors_DE_Plus2-2),hl
	ld hl,(RasterColors_ColorArray3Pointer_Plus2-2);,hl
	ld (BootsStrap_RestoreColors_HL_Plus2-2),hl
	ld hl,(RasterColors_ColorArray4Pointer_Plus2-2);,ix
	ld (BootsStrap_RestoreColors_IX_Plus2-2),hl
	ld hl,(RasterColors_PerFrameCallRestore_Plus2-2);,iy
	ld (BootsStrap_RestoreColors_IY_Plus2-2),hl
	ld iy,null
	push de
	push de
	push de
	pop bc	
	pop hl
	pop ix
	jr BootsStrap_RestoreColors_Doset
BootsStrap_RestoreColors:
	ld bc,&0000 :BootsStrap_RestoreColors_BC_Plus2
	ld de,&0000:BootsStrap_RestoreColors_De_Plus2
	ld hl,&0000:BootsStrap_RestoreColors_HL_Plus2
	ld ix,&0000:BootsStrap_RestoreColors_IX_Plus2
	ld iy,&0000:BootsStrap_RestoreColors_IY_Plus2
	jr BootsStrap_RestoreColors_Dosetb
BootsStrap_RestoreColors_Doset:
	ld iy,null
BootsStrap_RestoreColors_Dosetb:
	ld a,1

	jp RasterColors_SetPointers
endif

ifdef SupportPlus 
Plus_BankCopy:
	push bc
		ld bc,&7fb8
		out (c),c
		ld c,&8D
		out (c),c
	pop bc
	;call &b909

	ldir
	ld bc,&7fA8
	out (c),c
	ld c,&8D	; Reset the firmware to OFF
	out (c),c
ret
endif

BootsStrap_ContinueMsg:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
if BuildLang =''
	db 15,"You're Dead!"," "+&80
	db 17,"(Again!)"," "+&80
	db 0
else
	db 17,125,158,125,159,109,112,129,"!",255
;	db 15,"You're Dead!",255
	db 18,139,159,114,113,119,"!",255
	db 0
endif
ifdef BuildCPC
	TurnOffPlusRaster:
	di
		ld a,(CPCVer)
		and %00000001
		ret z

		;turn of the midframe raster colors
		ld bc,&7fb8	;TurnPlus on
		out (c),c
		xor a
		ld (&6800),a
		ld bc,&7fa0	;TurnPluss Off
		out (c),c
	ret
endif


BootsStrap_ContinueScreen:

	;call Akuyou_Music_Restart
ifdef buildCPC
	ld de,RasterColors_Safe_ForInterrupt
	call BootsStrap_BasicColors
	call RasterColors_RestoreInterrupt	
endif
	;call Akuyou_RasterColors_MusicOnly


ifdef BuildZXS
	call Firmware_Kill	;needed for font
	call INT_Init
endif
ifdef BuildMSX
	ei
endif

	ld a,2
	call SpriteBank_Font

	call AkuYou_Player_GetPlayerVars
	ld a,(iy+5)	
	or a
	jp z,GameOver

ifdef BuildMSX
	call ScreenBuffer_Reset


	ld a,CSprite_Continue 		;Loading
	call Akuyou_ShowCompiledSprite


	ld hl,MSXGameoverPalette
if BuildLang='j'
	ld b,10
else
	ld b,8
endif
	ld a,4
	call Akuyou_VDP_CommandNum

	ifndef buildMSX_V9K
		ld l,0
		call Akuyou_DrawText_LocateSprite	
		ld bc,BootsStrap_ContinueMsg
		call ShowTextLines

		ld hl,RleContinue	
		ld de,RleContinue_End
		ld bc,RleContinue_End-RleContinue
		ld ix,128-48
		ld iy,32
		call Akuyou_VDP_RLEProcessorFromMemory	
	endif
endif

ifdef BuildZXS
;		Call CLS
;		ld l,0
;		call Akuyou_DrawText_LocateSprite	
;		ld bc,BootsStrap_ContinueMsg
;		call ShowTextLines
;		call SpecRLE_Continue


		ld a,CSprite_Continue 		;Loading
		call Akuyou_ShowCompiledSprite


endif

ifdef BuildENT
	ld a,CSprite_Continue  		;Loading
	call Akuyou_ShowCompiledSprite
	call INT_Init

endif

ifdef BuildCPC	
		Call TurnOffPlusRaster
		ld a,CSprite_Continue  		;Loading
		call Akuyou_ShowCompiledSprite



		ifdef Support64k	
		;simpler compiled sprite for 64k
			ld a,(CPCVer)
			and 128
			jr nz,Skip64kcompiled


			ld l,1
			call Akuyou_DrawText_LocateSprite	
			ld bc,BootsStrap_ContinueMsg
			call ShowTextLines


			call CompiledSpriteContinue
		endif
	Skip64kcompiled:
endif


	ld a,2
	call SpriteBank_Font

	ld hl,&0F12				; Show the Continue message
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtPressButtonMsg2;txtContinueMsg
	ld a,255
	ldia
	call Akuyou_DrawText_PrintString	


	ld l,&15				; show how many credits are left
;	call Akuyou_DrawText_LocateSprite	
;	ld bc,txtCreditsMsg
;	ld a,255
;	ld i,a
;	call Akuyou_DrawText_PrintString	

;	call AkuYou_Player_GetPlayerVars

	call ShowContinues


	ld B,10
	ld ixl,255

Player_Dead_CountDown:

	dec B					; Show the countdown
	jp z,GameOver;Player_Dead_Resume ;GameOver		;Player_Dead_Resume=continue on zero		
	ld hl,&1317
	call Akuyou_DrawText_LocateSprite 
	ld a,48
	add B
	push bc
		call Akuyou_DrawText_CharSprite  
	pop bc

	ld a,b
	cp 8
	jr C,Player_Dead_PauseForFire
	call PauseASec
	jr Player_Dead_Pause
Player_Dead_PauseForFire:
	call PauseASecForFire

Player_Dead_Pause:
	
	ld a,b
	cp 8
	jr NC,Player_Dead_CountDown

	ld a, ixl	; read the keymap
	or Keymap_AnyFire
	cp 255
	jp nz,Player_Dead_Resume
	
	ld a, ixh	; read the keymap
	or Keymap_AnyFire
	cp 255
	jp nz,Player_Dead_Resumep2

	jr Player_Dead_CountDown
Player_Dead_Resumep2:
	ld iy,Player_Array2
	jr Player_Dead_ResumeB
Player_Dead_Resume:
;	call AkuYou_Player_GetPlayerVars
	ld iy,Player_Array
Player_Dead_ResumeB:
	ld a,3
	ld (iy+9),a
	ld a,(SmartbombsReset)
	ld (iy+3),a

SpendCreditSelfMod2:	ld iy,Player_Array		; All credits are (currently) stored in player 1's var!	

	ld a,(iy+5)
	dec a
	ld (iy+5),a

	xor a
	ld (ShowContinueCounter_Plus1-1),a

	

	;re-enable our buffered screen and bits
	di

ifdef BuildENT
	call ENT_UpdatePlusRasters
	ld a,&80
	jp CLS
endif

ifdef buildCPC
	call BootsStrap_RestoreColors
;	call Firmware_Kill
	call RasterColors_RestoreInterrupt	
	ld a,&80
	jp CLS
endif
ifdef BuildMSX
	jp CLS
endif

	ret


PauseASec:
	push bc
	ld b,60
PauseASecB:
		push bc
			call AkuYou_Player_ReadControls
		pop bc
	ei
ifdef buildCPC
	halt
	halt 		
	halt
	halt 
	halt
endif
	halt 
	djnz PauseASecB

	pop bc
ret


PauseASecForFire:
	push bc
	ld b,250
	ld c,4
PauseASecForFireB:
		push bc
			call AkuYou_Player_ReadControls
		pop bc


		ld a, ixl	; read the keymap
		or Keymap_AnyFire
		cp 255
		jp nz,PauseASecForFireDone
		ld a, ixh	; read the keymap
		or Keymap_AnyFire
		cp 255
		jp nz,PauseASecForFireDone
	djnz PauseASecForFireB
	dec c
	ld a,c
	or a
	jp nz,PauseASecForFireB

PauseASecForFireDone
	pop bc
ret
;Insulting player messages!
ifdef CompileEP1
	txtGameOver1Msg:
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
if BuildLang=''
		 db 6,"The Monster Hoarde Has Drive","n"+&80
		 db 8,"Chibiko from her homelan","d"+&80
	if BuildCPCv+BuildENTv
		 db 2,"She is forced to live in a cardboar","d"+&80
	else
		 db 7,"She is forced to live in ","a"+&80
	endif
		 db 8,"box as a street vampire","!"+&80
		 db 10,"With Chibiko gone",","+&80
		 db 10,"Peace and harmon","y"+&80
		 db 6,"Spreads through out the land","."+&80
		 db 8,"(Boy! Did you fuck up!",")"+&80
		db 0
endif
if BuildLang='j'
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 7,119,115,125,159,110,116,129,130,139,130,140,159,123,103,116,130,119,152,118,115,129,159,125,129,"!",255
	db 7,116,130,119,159,134,121,132,101,130,140,159,123,139,129,159,158,143,159,113,154,121,159,152,125,"!",255
	db 7,130,140,159,123,138,115,134,115,144,130,139,101,142,115,157,119,159,148,133,159,153,144,125,129,"!",255
	db 13,147,132,159,129,125,"!",147,132,159,129,125,"!",255
	db 12,"(",149,112,130,109,112,129,137,"!",118,144,117,152,"!",")",255
		db 0
endif
if BuildLang='r'
       ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	defb 10,111,145,133,156, 141,143,142,146,147,145,143,131, 137,136,132,142,129,140,137,255
	defb 9,120,137,130,137,139,143, 137,136, 146,131,143,137,150, 131,140,129,133,134,142,137,138,255
	defb 8,104,129,146,147,129,131,137,131, 131, 139,143,145,143,130,139,134, 139,129,145,147,143,142,142,143,138,255
	defb 8,144,143,146,134,140,137,147,146,160, 142,129, 136,129,130,145,143,153,134,142,143,141, 139,140,129,133,130,137,154,134,'.',255
	defb 4,114, 148,150,143,133,143,141, 120,137,130,137,139,143,',', 141,137,145, 137, 132,129,145,141,143,142,137,160,255
	defb 6,99,143,146,147,129,142,143,131,137,140,129,146,157, 131, 141,134,145,147,131,156,150, 136,134,141,140,160,150,',',255
	defb 9,105, 131,146,134, 135,137,140,137, 131,134,152,142,143, 137, 146,152,129,146,140,137,131,143,".",255
	defb 12,97, 147,156, 143,130,140,129,135,129,140,146,160,"!",255
db 0
endif
RankText:
if BuildLang=''
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildCPCv+BuildENTv
		 db 3,"Your 'Chibiko Scoring System (TM)","'"+&80
	else
		 db 17,"Your"," "+&80
		 db 6,"'Chibiko Scoring System (TM)","'"+&80
	endif
	db 15,"Rank was","-"+&80
	db 0
	RankF:
	db 17,"*****"," "+&80
	db 17,"*    "," "+&80
	db 17,"*****"," "+&80
	db 17,"*    "," "+&80
	db 17,"*    "," "+&80
	db 0
	ChibikoReview:
	db 12,"Chibiko says:"," "+&80
	db 0
else	
	if BuildLang='j' 
       ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 11,114,134,129,138,099,130,140,159,123," ",124,115,132,158," ",125,126,132,146,100,255
	db 17,125,159,110,158,115,139,255
	db 0
	RankF:
	db 17,"*****"," ",255
	db 17,"*    "," ",255
	db 17,"*****"," ",255
	db 17,"*    "," ",255
	db 17,"*    "," ",255
	db 0
	ChibikoReview:
	db 14,130,140,159,123,138," ",115,122,158,255
	db 0

	else
	db 17,"Your"," ",255
	db 6,"'Chibiko Scoring System (TM)","'",255

	db 15,"Rank was","-",255
	db 0
	RankF:
	db 17,"*****"," ",255
	db 17,"*    "," ",255
	db 17,"*****"," ",255
	db 17,"*    "," ",255
	db 17,"*    "," ",255
	db 0
	ChibikoReview:
	db 12,"Chibiko says:"," ",255
	db 0
	endif
endif
ChibikoReviewsWin:
defw ChibikoReviewWin

ChibikoReviewsNewScore:
defw ChibikoReview1
defw ChibikoReview2
defw ChibikoReview3
defw ChibikoReview4

ChibikoReviewsMehScore:
defw ChibikoReview5
defw ChibikoReview6
defw ChibikoReview7
defw ChibikoReview8






ifdef CPC320
	ScoreXPos equ 10
else
	ScoreXPos equ 13
endif






ifdef CompileEP1
ChibikoReviewWin:
if BuildLang='j'
;	       	     12345678901234567890123123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,144,113,101,122,159,113,146,119,159," ",118,157,153,144,125,129,098,255
	db ScoreXPos,132,159,148,101,114,134,129,145,129,115,134," ",121,128,123,159,145,139,255
	db ScoreXPos,"'","F","'",121,159,155,113,133,159,119,159," ",140,160,112,129,153,"!",255
	db ScoreXPos,114,153,119,159,129,121," ",116,122,133,112,132," ",139,159,119,135,158,122,159,158,"!",255

else
ifdef CPC320
	db ScoreXPos,"Well, you won","!"+&80
	db ScoreXPos,"But I'm still giving you an F","!"+&80
	db ScoreXPos," "," "+&80
	db ScoreXPos,"Try get a better score nex","t"+&80
	db ScoreXPos,"time sucker! ;-)"," "+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"Well, you won","!"+&80
	db ScoreXPos,"But I'm still giving"," "+&80
	db ScoreXPos,"you an F! "," "+&80
	db ScoreXPos,"Try get a better score"," "+&80
	db ScoreXPos,"next time sucker! ;-)"," "+&80
endif
endif
	db 0
ChibikoReview1:
if BuildLang='j'
	db ScoreXPos,151,121,132,159,120,144,125,129,"!",132,159,148," ",255
;	       	     123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,122,159,113,146,103," ",139,125,159,147,154,144,117,135,255
	db ScoreXPos,123,158,133,156,113,152,138," ",127,158,103," ",115,155,129,152,255
	db ScoreXPos,148,112,133," ",116,144,121," ",114,128,142,159,144,126,"!",255
else
ifdef CPC320
	db ScoreXPos,"Good Job","!"+&80
	db ScoreXPos,"Now try plugging the controlle","r"+&80
	db ScoreXPos,"in first before starting th","e"+&80
	db ScoreXPos,"game","!"+&80
else 
;	       	      12345678901234567890123
	db ScoreXPos,"Good Job","!"+&80
	db ScoreXPos,"Now try plugging the"," "+&80
	db ScoreXPos,"controller in first"," "+&80
	db ScoreXPos,"before starting the"," "+&80
	db ScoreXPos,"game!"," "+&80
endif
endif
	db 0

ChibikoReview2:
if BuildLang='j'
	db ScoreXPos,126,123,159,115,"!",255
	db ScoreXPos,134,135,148," ",157,119,112,132,134,115,138,135,101,255
	db ScoreXPos,132,120,133,116,135," ",143,159,129,158,103," ",118,125,132,255
	db ScoreXPos,151,121," ",123,123,144,132,159," ",132,159,120,144,125,129,"!",255
else
ifdef CPC320
	db ScoreXPos,"Amazing!!","!"+&80
	db ScoreXPos,"You survived SUCH a long tim","e"+&80
	db ScoreXPos,"by aimlessly hitting button","s"+&80
	db ScoreXPos,"at random","!"+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"Amazing!!","!"+&80
	db ScoreXPos,"You survived SUCH a"," "+&80
	db ScoreXPos,"long time by aimlessly"," "+&80
	db ScoreXPos,"hitting buttons at"," "+&80
	db ScoreXPos,"random!"," "+&80
endif
endif
	db 0

ChibikoReview3:
if BuildLang='j'
	db ScoreXPos,123,159,121,156,116,124,144,".",".",".",115,131,119,255
	db ScoreXPos,125,111,125,158,125,109,134,145,138," ",126,120,154,119,159,255
	db ScoreXPos,145,135,131,115,129,152," ",114,134,129,148," ",122,159,113,146,103,255
	db ScoreXPos,130,109,158,133," ",114,128,142,159,154,132,159,125,111,116,"!",255
else
ifdef CPC320
	db ScoreXPos,"Superb Performace","!"+&80
	db ScoreXPos,"Imagine how good you'll b","e"+&80
	db ScoreXPos,"when you actually learn ho","w"+&80
	db ScoreXPos,"to play","!"+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"Superb Performace","!"+&80
	db ScoreXPos,"Imagine how good you'll"," "+&80
	db ScoreXPos,"be when you actually"," "+&80
	db ScoreXPos,"learn how to play","!"+&80
endif
endif
	db 0
ChibikoReview4:
if BuildLang='j'
	db ScoreXPos,119,159,158,139,159,112,129,137,"!",114,134,129,151,153,255
	db ScoreXPos,148,112,133," ",142,129,134," ",140,133,119,159," ",115,144,126,"!",255
	db ScoreXPos,130,120,110,116,138," ",134,134,118,121,144,158,138," ",255
;	       	     123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,135,158,122,159,158,138,134,119,135,".",".","."," ",129,141,159,158," ",255
	db ScoreXPos,140,133,153,149," ",141,129,153,132,159,125,111,116,122,133,159,"!",255
else
ifdef CPC320
	db ScoreXPos,"Well Done","!"+&80
	db ScoreXPos,"I'm sure there's worse player","s"+&80
	db ScoreXPos,"out there, I mean, the worl","d"+&80
	db ScoreXPos,"population is 7 billio","n"+&80
	db ScoreXPos,"....There MUST be, right","?"+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"Well Done","!"+&80
	db ScoreXPos,"I'm sure there's worse"," "+&80
	db ScoreXPos,"players out there,"," "+&80
	db ScoreXPos,"I mean, the world"," "+&80
	db ScoreXPos,"population is 7 billion"," "+&80
	db ScoreXPos,"There MUST be, right","?"+&80
endif
endif
	db 0


ChibikoReview5:
if BuildLang='j'
	db ScoreXPos,114,134,129,112,132," ",134,158,119," ",147,126,159,152,125,115,098,255
;	       	     123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,138,116,125," ",139,158,132,115,123,159,132,159,148," ",255
	db ScoreXPos,122,159,113,146,119,159," ",114,128,142,159,154,134,158,132,"?",255
	db ScoreXPos,141,125,120,159,121,158,137,"!",255
else
ifdef CPC320
;	       	      12345678901234567890123
	db ScoreXPos,"You're really something, afte","r"+&80
	db ScoreXPos,"all, It's rare to see someon","e"+&80
	db ScoreXPos,"CLINICALLY BRAINDEAD still abl","e"+&80
	db ScoreXPos,"to play computer games","!"+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"You're really something"," "+&80
	db ScoreXPos,"after all, It's rare to"," "+&80
	db ScoreXPos,"see someone CLINICALLY"," "+&80
	db ScoreXPos,"BRAINDEAD still able to"," "+&80
	db ScoreXPos,"play computer games!"," "+&80
endif
endif
	db 0
ChibikoReview6:
if BuildLang='j'
;	       	     123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,139,114,"?"," ",135,140,109,121,144,158,137,158,138,255
	db ScoreXPos,135,158,122,159,158,138," ",125,158,119,138," ",122,112,119,119,159,255
	db ScoreXPos,114,134,129,"?"," ",135,158,122,159,158,138," ",255
	db ScoreXPos,125,159,129,159,115,138," ",118,157,153,132,159,126,137,"!",255
		     
else
ifdef CPC320
;	       	      12345678901234567890123
	db ScoreXPos,"If YOU are the result of 2"," "+&80
	db ScoreXPos,"million years of human"," "+&80
	db ScoreXPos,"evolution I'd say the species"," "+&80
	db ScoreXPos,"is seriously fucked","!"+&80

else
;	       	      12345678901234567890123
	db ScoreXPos,"If YOU are the result"," "+&80
	db ScoreXPos,"of 2 million years of"," "+&80
	db ScoreXPos,"human evolution I'd say"," "+&80
	db ScoreXPos,"the species is"," "+&80
	db ScoreXPos,"seriously fucked","!"+&80
endif
endif
	db 0
ChibikoReview7:
if BuildLang='j'
;	       	     123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,124,159,158,137,158,"!",132,159,148," ",115,131,119,255
	db ScoreXPos,114,134,129,138," ",125,159,158,127,115,148," ",115,145,119,159,255
	db ScoreXPos,116,144,155,154,119,148,".",".",".",255
	db ScoreXPos,138,116,125,138, 128,159,116,120,132,115,120,111,116,125,109,255
	db ScoreXPos,133,125,132,"!",255
else
ifdef CPC320
	db ScoreXPos,"Never mind","!"+&80
	db ScoreXPos,"Maybe you will manage to serv","e"+&80
	db ScoreXPos,"some purpose one day!?","!"+&80
	db ScoreXPos,"You DO own an organ donor"," "+&80
	db ScoreXPos,"card don't you","?"+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"Never mind","!"+&80
	db ScoreXPos,"Maybe you will manage"," "+&80
	db ScoreXPos,"to serve some purpose"," "+&80
	db ScoreXPos,"one day!?!"," "+&80
	db ScoreXPos,"You DO own an organ"," "+&80
	db ScoreXPos,"donor card don't you","?"+&80
endif
endif
	db 0
ChibikoReview8:
if BuildLang='j'
;	       	     12345678901234567890123123456789012345678901231234567890123456789012312345678901234567890123
	db ScoreXPos,141,131,116,138," ",129,159,147,135,158,122,159,158,138," ",125,114,157,127,138,129,147,135,255
	db ScoreXPos,099,135,158,122,159,158,125,112,119,121,138," ",133,159,158,128,159,123,103," ",132,115,120,159,126,154,100,255
	db ScoreXPos,123,155,119,159," ",120,145,138," ",150,115,115,131,138," ",149,121,147,"!",255
else
ifdef CPC320
	db ScoreXPos,"I'd say the purpose of you","r"+&80
	db ScoreXPos,"existance is to defin","e"+&80
	db ScoreXPos,"utter failure so the res","t"+&80
	db ScoreXPos,"of the population can fee","l"+&80
	db ScoreXPos,"superior","!"+&80
else
;	       	      12345678901234567890123
	db ScoreXPos,"I'd say the purpose"," "+&80
	db ScoreXPos,"of your existance is"," "+&80
	db ScoreXPos,"to define utter failure"," "+&80
	db ScoreXPos,"so the rest of the"," "+&80
	db ScoreXPos,"population can feel"," "+&80
	db ScoreXPos,"superior!"," "+&80
endif
endif
	db 0
endif

ifdef CompileEP2

ChibikoReviewWin:

	db 10,"Well, you won","!"+&80
	db 10,"But I'm still giving you a F","!"+&80
	db 10,"Haven't you learned yet","?"+&80
	db 10,"The only way to win is not "," "+&80
	db 10,"to play!"," "+&80
	db 0
ChibikoReview1:
	db 10,"Well done","!"+&80

	db 10,"You played the game"," "+&80
	db 10,"ALL BY YOURSELF!"," "+&80
	db 10,"Won't your mommy be proud","!"+&80
	db 0

ChibikoReview2:
	db 10,"Amazing!!","!"+&80
	db 10,"Maybe one day you'll eve","n"+&80
	db 10,"Be able to tie your shoe","e"+&80
	db 10,"without drooling all over"," "+&80
	db 10,"Yourself firs","t"+&80
	db 0

ChibikoReview3:
	db 10,"Superb Performance","!"+&80
	db 10," "," "+&80
	db 10,"Nah! I'm humoring you",","+&80
;	       123456789012345678901234567890
	db 10,"Really, you were just awful","!"+&80
	db 0
ChibikoReview4:
	db 10,"You call that playing","?"+&80
	db 10,"I've seen things on fir","e"+&80
	db 10,"Move better than that","!"+&80
	db 0

ChibikoReview5:

	db 10,"Whoa! What happened there","!"+&80
	db 10,"I'd call you a complete an","d"+&80
	db 10,"utter waste of life, bu","t"+&80
	db 10,"You'd take it as a compliment","!"+&80
	db 0
ChibikoReview6:
	db 10,"Sooo! you're as useless as "," "+&80
	db 10,"You are stupid and ugly!!"," "+&80
	db 10,"Well, at least you're","!"+&80
	db 10,"consistent","!"+&80
	db 0
ChibikoReview7:

	db 10,"Well..","."+&80

	db 10,"After seeing you in actio","n"+&80
	db 10,"I think we can rule out"," "+&80
	db 10,"'Intelligent Design' as th","e"+&80
	db 10,"source of your species","!"+&80
	db 0


ChibikoReview8:
	db 10,"That's the best you can do","?"+&80
	db 10,"I'd say you best bet is to kil","l"+&80
	db 10,"yourself and hope that","t"+&80
	db 10,"reincarnation is a thing","!"+&80
	db 0

endif


GameOverWin:


	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)
	;Achievements (Wxx54321)	-10
	or            %10000000
	ld (iy-10),a
	pop iy

	call GameOverDoLoad

	xor a
	ld (ReviewFilter_Plus1-1),a
	ld hl,ChibikoReviewsWin
	ld (ReviewBank_Plus2-2),hl
	ld (NewScoreBank_Plus2-2),hl	

	jp GameOverWinB
ifdef buildCPC

ifdef CompileEP2
	GameoverColors1:
		defb 1
		defb 0				
		defb &54,&58,&5B,&4B	
	GameoverColors2:
		defb 1
		defb 0				
		defb &54,&58,&5B,&4B	
	GameoverColors3:
		defb 1
		defb 48
		defb &54,&4C,&52,&4B
	GameoverColors4:
		defb 1
		defb 0				
		defb &54,&4C,&52,&4B
endif
ifdef CompileEP1

	GameoverColors1:
		defb 1
		defb 0				
		defb &54,&4C,&4E,&43	
	GameoverColors2:
		defb 1
		defb 0				
		defb &54,&4C,&4E,&43	
	GameoverColors3:
		defb 1
		defb 215
		defb &54,&5D,&5F,&4B
	GameoverColors4:
		defb 1
		defb 0				
		defb &54,&5D,&5F,&4B

endif

;	RasterColors_ColorArray1x:
;		defb 1
;		defb 1
;		defb 64+20,64+24,64+29,64+11
;	RasterColors_ColorArray2x:
;		defb 5
;;		defb 1
;
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+24,64+29,64+11
;		defb 12
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+24,64+29,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;	RasterColors_ColorArray3x:
;		defb 1
;		defb 1
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;	RasterColors_ColorArray4x:
;		defb 1
;		defb 1 
;		defb 64+20,64+31,64+14,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+31,64+14,64+11
;		defb 0
;		defb 64+20,64+12,64+13,64+11
;		defb 0
;		defb 64+20,64+31,64+14,64+11
endif


ifdef BuildMSX
MSXGameoverPalette:
;defw &08F0;0  -GRB
;defw &0000;1  -GRB
;defw &0555;2  -GRB
;defw &0AAA;3  -GRB
;defw &0FFF;4  -GRB
;defw &0088;5  -GRB
;defw &0F0F;6  -GRB
;defw &00F0;7  -GRB
;defw &0F04;8  -GRB
;defw &07FC;9  -GRB
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %01000100,%00000100;2  -RRR-BBB,-----GGG
defb %10101010,%00001010;3  -RRR-BBB,-----GGG
defb %11101110,%00001110;4  -RRR-BBB,-----GGG
defb %10001000,%00000000;5  -RRR-BBB,-----GGG
defb %00001110,%00001110;6  -RRR-BBB,-----GGG
defb %11100000,%00000000;7  -RRR-BBB,-----GGG
defb %00000100,%00001110;8  -RRR-BBB,-----GGG
defb %11101100,%00000110;9  -RRR-BBB,-----GGG
defb %11000000,%00001010;10  -RRR-BBB,-----GGG
defb %10000010,%00000110;11  -RRR-BBB,-----GGG
defb %11100000,%00001110;12  -RRR-BBB,-----GGG
defb %00101110,%00001100;13  -RRR-BBB,-----GGG
defb %00101110,%00001000;14  -RRR-BBB,-----GGG
defb %00100110,%00000000;15  -RRR-BBB,-----GGG

endif


Ifdef BuildENT
	EntBlackoutPalette:
	defb 25	;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 50	;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 75	;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 100	;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 125		;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 150		;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 175		;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 200	;next split
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 0		;next split
endif


Ifdef BuildENT
	EntSunsetPalette:
	defb 25	;next split
	defw &0000
	defw &00A0
	defw &08F0
	defw &0FFA
	defb 50	;next split
	defw &0000
	defw &00A0
	defw &08F0
	defw &0FFA
	defb 75	;next split
	defw &0000
	defw &00A0
	defw &08F0
	defw &0FFA
	defb 100	;next split
	defw &0000
	defw &00A0
	defw &08F0
	defw &0FFA
	defb 125		;next split
	defw &0000
	defw &00A0
	defw &08F0
	defw &0FFA
	defb 150		;next split
	defw &0000
	defw &008F
	defw &0A0F
	defw &0FFF
	defb 175		;next split
	defw &0000
	defw &008F
	defw &0A0F
	defw &0FFF
	defb 200	;next split
	defw &0000
	defw &008F
	defw &0A0F
	defw &0FFF
	defb 0		;next split
endif


ifdef CompileEP2
	txtGameOver2aMsg:
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	 db 1,"The Yuushas restored"," "+&80
	 db 1,"Chibiko and Bochan"," "+&80
	 db 3,"to humanity..."," "+&80
	db  1," "," "+&80
	 db 1,"Chibiko was sent to"," "+&80
	 db 3,"Sunday School"," "+&80
	db  2,"to repent for her"," "+&80
	db  7,"Sins!"," "+&80
	db  0

	txtGameOver2bMsg:
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	 db 22+2,"And Bochan was"," "+&80
	 db 22+1,"Forced on an all"," "+&80
	 db 22+1,"vegetable detox!"," "+&80
	db  0

	txtGameOver2cMsg:
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	 db 15,"No Bochan,"," "+&80
	 db 5,"That's a common misconception!"," "+&80
	 db 1,"In fact the toaster makes an excellent"," "+&80
	 db 15,"Bath toy!"," "+&80
	 db 1," "," "+&80
	 db 1,"Now you take your bath, I'm going to"," "+&80
	 db 1,"spend the afternoon playing with this"," "+&80
	 db 6,"dangerously sharp crucifix!"," "+&80
	 db 1," "," "+&80
	 db 3,"Once we're dead and cursed, we'll"," "+&80
	 db 3,"get our magic powers back and be"," "+&80
	 db 1,"able to get revenge for this outrage!"," "+&80
	db  0
endif



GameOverDoLoad:
ifdef BuildCPC
	call TurnOffPlusRaster
endif
	Call Cls

ifdef BuildCPC
	ld a,CSprite_Loading		; 
	call Akuyou_ShowCompiledSprite
endif

	ld a,3
	ld (ReviewFilter_Plus1-1),a	
	
	ld hl,ChibikoReviewsMehScore
	ld (ReviewBank_Plus2-2),hl	
	ld hl,ChibikoReviewsNewScore 
	ld (NewScoreBank_Plus2-2),hl	

	di
	call Akuyou_Music_Stop 


ifdef buildCPC
	call Firmware_Restore
	ld a,&C0			;; bank number
	ld de,&4000		;; load address
	ld hl,DiskMap_GameOver
	ld b,DiskMap_GameOver_Size
	ld c,DiskMap_GameOver_Disk
	ld ix,&4000+&4000
	call Akuyou_LoadDiscSectorz
	call Firmware_Kill


	ld de,RasterColors_Black_ForInterrupt
	call BootsStrap_BasicColors

endif


ifdef buildENT
	call Firmware_Restore

	ld a,Akuyou_LevelStart_Bank	;; bank number
	ld de,&4000			;; load address
	ld hl,DiskMap_GameOver
	ld b,DiskMap_GameOver_Size
	ld c,DiskMap_GameOver_Disk
	ld ix,&4000+&4000
	call Akuyou_LoadDiscSector;z

	call Firmware_Kill


	ld de,EntBlackoutPalette
	call ENT_UpdatePlusRastersAlt

;	ld de,RasterColors_Black_ForInterrupt
;	call BootsStrap_BasicColors

endif

ifdef buildMSX
	call Firmware_Restore
	ld a,	Akuyou_LevelStart_Bank 
	ld de,Akuyou_LevelStart
	ld hl,DiskMap_GameOver
	ld b,DiskMap_GameOver_Size
	ld c,DiskMap_GameOver_Disk
	ld iy,Akuyou_LevelSprites_Y
;	ld ix,0
;	call VDP_rleProcessor
	call LoadLZ48RLE


	call Firmware_Kill
	
	ld hl,MSXGameoverPalette
	call Akuyou_VDP_SetPalette


endif


ifdef buildZXS

	call Firmware_Restore
	ld a,	Akuyou_LevelStart_Bank 
	ld de,Akuyou_LevelStart
	ld hl,DiskMap_GameOver
	ld b,DiskMap_GameOver_Size
	ld c,DiskMap_GameOver_Disk
	ld ix,Akuyou_LevelStart+&4000
	call Akuyou_LoadDiscSectorz

	call Firmware_Kill
	di

;	call &4000
endif



	call INT_Init
	ei
	call Akuyou_Music_Play 


	
	;DiskMap_GameOver    		equ &22C2	;T34-SC2.D01
;	DiskMap_GameOver_Size	equ 12
;	DiskMap_GameOver_Disk 	equ 1


;	call restoremusic
;	ld hl,(MusicRestore)
;	call CallHL
ifdef buildCPC
;	ld a,1
;	ld bc,RasterColors_ColorArray1x
;	ld de,RasterColors_ColorArray2x
;	ld hl,RasterColors_ColorArray3x
;	ld ix,RasterColors_ColorArray4x
;	ld iy,null
;	call Akuyou_RasterColors_SetPointers

	ld bc,GameoverColors1
	ld de,GameoverColors2
	ld hl,GameoverColors3
	ld ix,GameoverColors4
	ld iy,null
	ld a,1
	call RasterColors_SetPointers
	call RasterColors_RestoreInterrupt	
endif



	ei
ifdef buildCPC
	ld hl,Font_RegularSizePos;&4000
	call	Akuyou_ShowSprite_SetBankAddr
else 

	ld a,2
	call SpriteBank_Font

endif

ret


GameOver:
	call GameOverDoLoad

	
ifdef CompileEP2
		;ep 2 ver
		ld l,&2				
		call Akuyou_DrawText_LocateSprite	
		ld bc,txtGameOver2aMsg
		call ShowTextLines
	
		ld l,17				
		call Akuyou_DrawText_LocateSprite	
		ld bc,txtGameOver2bMsg
		call ShowTextLines

		Call WaitForFire
	ifdef buildCPC
		ld de,RasterColors_Safe_ForInterrupt
		call BootsStrap_BasicColors
	endif
	call akuyou_cls

	ifdef buildCPC
		call &4003
	endif

	ld l,13				
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtGameOver2cMsg
endif

ifdef CompileEP1


ifdef buildZXS
	ld de,Akuyou_LevelStart
	ld a,Akuyou_LevelStart_Bank
	ld hl,Rle_FromPointers
	call Akuyou_Bankswapper_CallHL
	ld iy,&5C3A	;Do this - or suffer the concequences! - should always be set when firmware interrupts may run!
endif


ifdef buildMSX
	ld hl,256
	ld (VDP_MyHMMM_NX),hl
	ld hl,192
	ld (VDP_MyHMMM_NY),hl
	ld hl,0
	ld (VDP_MyHMMM_SX),hl
	ld (VDP_MyHMMM_DX),hl
	ld (VDP_MyHMMM_DY),hl

	ld hl,Akuyou_LevelSprites_Y
	ld (VDP_MyHMMM_SY),hl

	ld hl,VDP_MyHMMM
	call VDP_HMMM_BusyCheck
endif


	ifdef buildENT
		call &4000
		ld hl,EntSunsetPalette
		call Plus_SetPlusRasters
	endif

	ifdef buildCPC
		call &4000
	endif
	ld l,16				
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtGameOver1Msg
endif

	call ShowTextLines
	Call WaitForFire


GameOverWinB:
;see if we have a highscore
	ld de,Player_ScoreBytes+7
	ld (ShownScore_Plus2-2),de		;Show Player 1's score, unless player 2 did better
	call HighScoreCheck
	ld de,Player_ScoreBytes2+7
	call HighScoreCheck
jr ScoreCheckDone


HighScoreCheck:
push de
		ld hl,HighScoreBytes+7
		ld b,8
	NewScoreNextDigit:
		ld c,(hl)
		ld a,(de)
		cp c
		jr c,NewScoreNotHigher
		jr z,NewScoreDigitEqual
		jr NewScoreHigher
	NewScoreDigitEqual:
		dec hl
		dec de
		djnz NewScoreNextDigit

NewScoreNotHigher:
	pop hl
	ret
NewScoreHigher:
pop hl
	ld (ShownScore_Plus2-2),hl
	ld de,HighScoreBytes+7
	ld bc,8
	lddr

	ld hl,ChibikoReviewsNewScore :NewScoreBank_Plus2
	ld (ReviewBank_Plus2-2),hl
ret



ScoreCheckDone:


;;;;;;;;;;;;;;;;;;;;Show Chibiko Scoring System ;;;;;;;;;;;;;;;;;;;;

ifdef CompileEP1
	ifdef buildCPC
		ld de,RasterColors_Safe_ForInterrupt
		call BootsStrap_BasicColors
	endif
endif

ifdef buildENT
	ifdef CompileEP1
		call &4003
		ld hl,EntSafePalette
		call Plus_SetPlusRasters
	else
		call &4006
	endif
endif
ifdef buildCPC
	ifdef CompileEP1
		call &4003
	else
		call &4006
	endif
endif
ifdef buildZXS
	ld de,Akuyou_LevelStart+6
	ld a,Akuyou_LevelStart_Bank
	ld hl,Rle_FromPointers
	call Akuyou_Bankswapper_CallHL
	ld iy,&5C3A	;Do this - or suffer the concequences! - should always be set when firmware interrupts may run!
	ei
endif
ifdef BuildMSX

	ld hl,256
	ld (VDP_MyHMMM_NX),hl
	ld hl,192
	ld (VDP_MyHMMM_NY),hl
	ld hl,0
	ld (VDP_MyHMMM_SX),hl
	ld (VDP_MyHMMM_DX),hl
	ld (VDP_MyHMMM_DY),hl

	ld hl,Akuyou_LevelSprites_Y+192
	ld (VDP_MyHMMM_SY),hl

	ld hl,VDP_MyHMMM
	call VDP_HMMM_BusyCheck
endif



	ld a,2
	call SpriteBank_Font

if BuildLang='j'
	ld hl,&0A00				; Show the Continue message
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtYourScoreMsg
	ld a,255
	ldia
	call Akuyou_DrawText_PrintString	

	ld hl,&0C02				; Show the Continue message
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtHighScoreMsg
	ld a,255
	ldia
	call Akuyou_DrawText_PrintString	
else
	ld hl,&0700				; Show the Continue message
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtYourScoreMsg
	ld a,255
	ldia
	call Akuyou_DrawText_PrintString	

	ld hl,&0A02				; Show the Continue message
	call Akuyou_DrawText_LocateSprite	
	ld bc,txtHighScoreMsg
	ld a,255
	ldia
	call Akuyou_DrawText_PrintString
endif

if BuildLang='j'
		ld hl,&1C00
else
		ld hl,&2000
endif
		call DrawText_LocateSprite

		ld hl, Player_ScoreBytes+7	:ShownScore_Plus2
		ld bc,-7
		add hl,bc
		ld b,8	
		call GameOverScore_NextDigit

if BuildLang='j'
		ld hl,&1C02
else
		ld hl,&2002
endif
		call DrawText_LocateSprite

		ld hl,HighScoreBytes	
		ld b,8
		call GameOverScore_NextDigit

ifdef CPC320
	ld l,&07				
else
	ld l,&05
endif
	call Akuyou_DrawText_LocateSprite	
	ld bc,RankText
	call ShowTextLines



	call Akuyou_Music_Stop 

	call Firmware_Restore
	call Bootstrap_SaveSettings

	call Firmware_Kill
	call INT_Init

	call Akuyou_Music_Play 

ifdef buildCPC
	call RasterColors_RestoreInterrupt	
endif
	ei





	ifdef CPC320
		ld l,&0A
	else
		ld l,&09
	endif

				
	call Akuyou_DrawText_LocateSprite	
	ld bc,RankF
	call ShowTextLines



	;Show Highscore Message
	ifdef CPC320
		ld l,&11				;
	else
		ld l,&0F
	endif
	call Akuyou_DrawText_LocateSprite	
	ld bc,ChibikoReview
	call ShowTextLines


	ld hl,ChibikoReviewsNewScore :ReviewBank_Plus2
	ld a,r
	rrca
	rrca
 	and %00000011 :ReviewFilter_Plus1
	ld b,0
	ld c,a
	add hl,bc
	add hl,bc
	ld c,(hl)
	inc hl
	ld b,(hl)

	ifdef CPC320
	ld l,&13				
	else
	ld l,&11
	endif
	call Akuyou_DrawText_LocateSprite	
	


	call ShowTextLines


	Call WaitForFire
GameOverReloadMenu:
	Call StartANewGame
	di
ifdef buildCPC
	ld de,RasterColors_Black_ForInterrupt
	call BootsStrap_BasicColors
	call Akuyou_RasterColors_Blackout
endif


	call Akuyou_Music_Stop ;Put before firmware restore - corrupts BC
	call Firmware_Restore

	jp Bootstrap_Level_0Again
	

GameOverScore_NextDigit:
	push bc
	push hl

		ld a,(hl)		
			add 48 ; Move to the correct digit (first 32 are not in font)
			 ;add 8 
if BuildCPCv+BuildENTv
			ld b,-2 ; we are drawing backwards!
endif
ifdef BuildZXS
			ld b,-1 ; we are drawing backwards!
endif
ifdef BuildMSX
			ld b,-8 ; we are drawing backwards!
endif
			call DrawText_CharSpriteDirect;DrawText_DigitSprite

	pop hl
	pop bc
	inc hl
	dec b
	jp nz,GameOverScore_NextDigit
	ret
if BuildLang='j'
	txtYourScoreMsg:
		db 114,134,129,138," ",133,121,132,158,":",255
	txtHighScoreMsg:
		db 123,116,133,121,132,158,":",255
else
	txtYourScoreMsg:
		db "Your Score was",":"+&80
	txtHighScoreMsg:
		db "HighScore",":"+&80
endif
WaitForFire:
	call PauseASec


WaitForFire_Continue:
	push bc
		call AkuYou_Player_ReadControls
	pop bc
	ld a, ixl	; read the keymap
	and ixh
	or Keymap_AnyFire
	cp 255
	jp z,WaitForFire_Continue
ret

;DrawText_Decimal:
;	ld c,0
;DrawText_DecimalSub100:
;	cp 100
;	jp c,DrawText_DecimalLessThan100
;	inc c
;	sub 100
;	jp DrawText_DecimalSub100
;DrawText_DecimalLessThan100:
;	ld b,a
;	ld a,c
;	or a
;	jp z,SkipDigit100
;	add 48
;	push bc
;		call Akuyou_DrawText_CharSprite
;	pop bc

;SkipDigit100:
;	ld a,b
;	ld c,0
;DrawText_DecimalSubTen:
;	cp 10
;	jp c,DrawText_DecimalLessThanTen
;	inc c
;	sub 10
;	jr DrawText_DecimalSubTen
;DrawText_DecimalLessThanTen:
;	ld b,a
;	ld a,c
;	or a
;	jp z,SkipDigit10
;	add 48
;	push bc
;		call Akuyou_DrawText_CharSprite
;	pop bc
;SkipDigit10:
;	ld a,b
;	add 48
;	push bc
;		call Akuyou_DrawText_CharSprite
;	pop bc
;	ret


FireMode_Normal:
	ld hl,null
	ld (FireUpHandler_Plus2-2),hl
	ld (FireDownHandler_Plus2-2),hl
	ld (FireLeftHandler_Plus2-2),hl
	ld (FireRightHandler_Plus2-2),hl
	ld hl,SetFireDir_RIGHTsave 
	ld (Fire2Handler_Plus2-2),hl
	ld hl,SetFireDir_LEFTsave 
	ld (Fire1Handler_Plus2-2),hl
jr FireMode_Both
FireMode_4D:
	ld hl,SetFireDir_UP  
	ld (FireUpHandler_Plus2-2),hl
	ld hl,SetFireDir_DOWN	  
	ld (FireDownHandler_Plus2-2),hl
	ld hl,SetFireDir_LEFT	  
	ld (FireLeftHandler_Plus2-2),hl
	ld hl,SetFireDir_RIGHT	  
	ld (FireRightHandler_Plus2-2),hl

	ld hl,SetFireDir_FireAndSaveRestore  
	ld (Fire2Handler_Plus2-2),hl

	ld hl,SetFireDir_Fire	 
	ld (Fire1Handler_Plus2-2),hl
FireMode_Both:
	ld a,255
	ld (DroneFlipFireCurrent_Plus1-1),a
ret

templateFire1:	bit Keymap_F1,a
templateFire2:	bit Keymap_F2,a


StartANewGame:

	;reset the core
ifdef SupportPlus
	ld a,&C9 ;ret
	ld (PlusToggle1),a
endif 
	xor a
	ld (ShowContinueCounter_Plus1-1),a


	ld hl,&00c6	;add 0 - faster than nop nop
ifdef buildCPC
	ld (JR64K_1),hl
	ld (JR64K_2),hl
endif
	ld a,(CPCVer)
	and %00000001
	jr z,StartANewGameNotPlus
;;;;;;;;;;;;;;;; PLUS code ;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef SupportPlus
		xor a
		ld (PlusToggle1),a	
endif 
ifdef buildCPC
		ld hl,EnablePlusPalette
		ld (EnablePlusPalette_Plus2-2),hl
endif
StartANewGameNotPlus:


;;;;;;;;;;;;;;;;64k code ;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	ld a,(CPCVer)
	and 128
	jr nz,StartANewGameNot64k

	ld l,&18
	ld h,JR64K_To1-JR64K_From1
	ld (JR64K_1),hl
	ld h,JR64K_To2-JR64K_From2
	ld (JR64K_2),hl	
	ld h,JR64K_To3-JR64K_From3
	ld (JR64K_3),hl	
endif
StartANewGameNot64k:

	ld bc,&3E0D		;Split Continues
	ld de,&2ADD
	ld a,(ContinueMode)
	or a
	jr nz,ContinueModeSet

	ld de,&21FD
;ifdef CPC320
	ld bc,&C90E		;Shared Continues
;else
;	ld bc,&C90B		;Shared Continues
;endif
ContinueModeSet:
	ld a,b
	ld (ShowContinuesSelfMod),a
	ld a,c
	ld (ContinuesScreenpos_Plus1-1),a
	ld (SpendCreditSelfMod),de
	ld (SpendCreditSelfMod2),de
	; set our standard Left-Right Firemode


	call FireMode_Normal


	;reset all the scores n stuff
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-15)
	and %10000000
	call nz,FireMode_4D

	ld a,1
	ld (iy-7),a ;live players


ifdef buildCPC
	;multiplay support
	ld hl,&003E ;ld a,0
	ld a,(MultiplayConfig)
	bit 0,a
	jr z,StartANewGame_NoMultiplay
	ld bc,&F990
	in a,(c)		;Test if the multiplay is really there!
	inc a
	jr z,StartANewGame_NoMultiplay
	ld hl,&78ED	;in (c),a
StartANewGame_NoMultiplay:
	ld (multiplaysupport_Plus2-2),hl
endif
 

	; we can swap Fire 1 and 2 for Multiplay joysticks - as redefine doesn't work
	ld hl,(templateFire1)
	ld de,(templateFire2)

	ld a,(MultiplayConfig)
	bit 1,a
	jr z,StartANewGame_NoControlFlip
	ex hl,de
StartANewGame_NoControlFlip:
	ld (SelfModifyingFire1),hl
	ld (SelfModifyingFire1b),hl
	ld (SelfModifyingFire2),de



	call AkuYou_Player_GetPlayerVars
	call StartANewGamePlayer
	ld de,Akuyou_PlayerSeparator
	add iy,de
	call StartANewGamePlayer

ifndef buildCPC
	ld a,8
	ld (iy+8),a	;Bochan sprite on MSX and ZXS
endif

	ld hl,Player_ScoreBytes
	ld b,8*2
	xor a
ScoreWipeNext:
	ld (hl),a
	inc hl
	djnz ScoreWipeNext

	call AkuYou_Player_GetPlayerVars



	ld de,&00C6
	bit 6,(iy-11)
	jr nz,NoBulletSlowdown
	ld de,&2FCB
NoBulletSlowdown:
	ld (StarSlowdown_Plus2-2),de

	ld de,Stars_AddBurst_Top
	ld bc,BulletConfigHeaven_End-BulletConfigHeaven
	ld hl,BulletConfigHeaven
	ld a,2
	bit 7,(iy-11)
	jr nz,useheaven
	ld hl,BulletConfigHell
	ld a,1
useheaven:

	ld (BurstSpacing_Plus1-1),a

	ldir 


	

	ld a,(iy-11)
	and %00000011
;	or a
	jp z,Difficulty_Normal
	cp 1
	jp z,Difficulty_Easy
	cp 2
	jp z,Difficulty_Hard
ret


endif



StartANewGamePlayer:


	;player fire directions
	xor a
	ld (iy+2),a	;Fire Delay
	ld (iy+4),a	;drones
	ld (iy+8),a	;spritenum
	ld (iy+10),a	;burst fire xfire
	ld (iy+13),a	;Points to add
	ld (iy+14),a	;player shoot power
	ld (iy+9),a	;Player Lives (default both players to dead)
	ld a,16
	ld (iy+6),a	;drone pos

	ld a,%00000100				:PlayerDefaultShootSpeed_Plus1
	ld (iy+11),a	;Fire Speed

	ld a,&67
	ld (iy+15),a	;Fire Dir


	;init player lives
;	ld a,3;3
;	ld (iy+9),a
	ld a,(SmartbombsReset)
	ld (iy+3),a

	ld a,(ContinuesReset)
	ld (iy+5),a

;	ld a,(iy+5)
;	dec a
;	ld (iy+5),a

	;invincibility
	ld a,%00000111
	ld (iy+7),a
ret

Difficulty_Easy:
	ld a,%00100000	
	jr Difficulty_Generic
	;ld (FireFrequencyA_Plus1-1),a
	;ld a,%00010000	
	;ld (FireFrequencyB_Plus1-1),a
	;ld a,%00010000	
	;ld (FireFrequencyC_Plus1-1),a
	;ld a,%00001000;	
	;ld (FireFrequencyD_Plus1-1),a
	;ld a,%00000100;	
	;ld (FireFrequencyE_Plus1-1),a
	;ret
Difficulty_Normal:
	ld a,%00010000	
	jr Difficulty_Generic
	;ld (FireFrequencyA_Plus1-1),a
	;ld a,%00001000	
	;ld (FireFrequencyB_Plus1-1),a
	;ld a,%00001000	
	;ld (FireFrequencyC_Plus1-1),a
	;ld a,%00000100;	
	;ld (FireFrequencyD_Plus1-1),a
	;ld a,%00000010;	
	;ld (FireFrequencyE_Plus1-1),a
	;ret
Difficulty_Hard:
	ld a,%00001000	
	jr Difficulty_Generic
	;ld (FireFrequencyA_Plus1-1),a
	;ld a,%00000100	
	;ld (FireFrequencyB_Plus1-1),a
	;ld a,%00000100	
	;ld (FireFrequencyC_Plus1-1),a
	;ld a,%00000010;	
	;ld (FireFrequencyD_Plus1-1),a
	;ld a,%00000001;	
	;ld (FireFrequencyE_Plus1-1),a
	;ret
Difficulty_Generic:
	;ld a,%00001000	
	ld (FireFrequencyA_Plus1-1),a
	rrca;ld a,%00000100	
	ld (FireFrequencyB_Plus1-1),a
	;ld a,%00000100	
	ld (FireFrequencyC_Plus1-1),a
	rrca;	ld a,%00000010;	
	ld (FireFrequencyD_Plus1-1),a
	rrca;ld a,%00000001;	
	ld (FireFrequencyE_Plus1-1),a
ret

LevelReset0000:
ifdef buildMSX_V9K
	ld hl, LoadRLE_WithPushesV9K	
	ld (V9K_Part_Plus2-2),hl

	ld de,ParticleArrayPointer+1
	ld hl,ParticleArrayPointer
	ld bc,256*3-1
	ld (hl),0
	ldir 
endif 

ifdef BuildCPC
	call TurnOffPlusRaster
endif


	; wipe our memory, to clear out any junk from old levels
	ld de,StarArrayPointer+1
	ld hl,StarArrayPointer
	ld bc,&700-1
	ld (hl),0
	ldir 

ifdef BuildMSX
	ld de,LevelData128kpos_C+1
	ld hl,LevelData128kpos_C
	ld (hl),0
	ld bc,&C00-1
	ldir
endif


;This resets anything the last level may have messed with during play so we can start
;a new level with everything back to normal
ResetCore:

	ld a,1

	call Akuyou_ShowSpriteReconfigureEnableDisable


	ld a,&69 
	ld (Timer_CurrentTick_Plus1-1),a
	ld (DroneFlipCurrent_Plus1-1),a
	ld (DroneFlipFireCurrent_Plus1-1),a

	xor a
ifdef BuildZXS
	ld (SpriteSizeConfig6_Plus1-1),a
endif
	ld (EventObjectAnimatorToAdd_Plus1-1),a
	ld (EventObjectSpriteSizeToAdd_Plus1-1),a
	ld (EventObjectProgramToAdd_Plus1-1),a
	ld (Timer_TicksOccured_Plus1-1),a
	ld (Sfx_Sound_Plus1-1),a

	or a
	call DroneFlipFire
;	ld (Event_LevelTime),a
;	ld a,(hl)
;	ld (Event_NextEventTime_Plus1-1),a
;	inc hl
;	ld (Event_NextEventPointer_Plus2-2),hl



	; reset reporgrammable stuff  - I AM USING EXX in these, so make sure that EX af and EXX are not used 	
	;at this point!!!
	ld hl,Object_DecreaseLifeShot	
	ld (ObjectShotOverride_Plus2-2),hl


	; set stuff that happens every level
ifdef CPC320
	ld hl,&2064	;x,y
else
	ld hl,&3264	;x,y
endif
	ld (Player_Array),hl
	ld l,&96
	ld (Player_Array2),hl

	ld hl,domoves
	ld (ObjectDoMovesOverride_Plus2-2),hl

	ld hl,null
	ld (SmartBombSpecial_Plus2-2),hl
	ld (CustomSmartBombEnemy_Plus2-2),hl
	ld (customPlayerHitter_Plus2-2),hl
	ld (CustomShotToDeathCall_Plus2-2),hl
;	defb 100;Y
;	defb 64 ;X

;	ld bc,Background_ShiftNow
;	call set_BackgroundScrollDirection
	;ld a,&05	;Dec B	;04 - INC B



	xor a
	ld (Sfx_CurrentPriority_Plus1-1),a	; clear the to-do
	ld (Sfx_Sound_Plus1-1),a	; clear the note

	call DoMovesBackground_SetScroll

	call DoCustomRsts

	call AkuYou_Player_GetPlayerVars

;	ld a,(iy-8)
;	and %00010000
;	ld a,&AF ; Xor a
;	jr z,Turbo_ShowBackgroundSprites
	;ld a,&C9	; Disabled for now
;Turbo_ShowBackgroundSprites
;	ld (BackgroundNoSpritesTurbo_Plus1-1),a

ifdef BuildENT
	read "..\AkuENT\Bootstrap_ReconfigureCore_ENT.asm"
endif
ifdef BuildCPC
	read "..\AkuCPC\Bootstrap_ReconfigureCore_CPC.asm"
endif
ifdef BuildZXS
	read "..\AkuZX\Bootstrap_ReconfigureCore_ZX.asm"
endif
ifdef BuildMSX
	read "..\AkuMSX\Bootstrap_ReconfigureCore_MSX.asm"
endif
	jp AkuYou_Player_GetPlayerVars


BootsStrap_ConfigureControls:
	ei
;	ld hl,RasterColors_InitColors
;	call SetColors
ifdef buildCPC
	call TurnOffPlusRaster

	ld e,1
	ld hl,RasterColors_Safe
	call RasterColors_NoDelay
else
	call Firmware_Kill
endif
;	ld de,RasterColors_Safe_ForInterrupt
;	call BootsStrap_BasicColors
call PauseASec;call KeyboardScanner_Flush ; flush the key buffer

	ld a,2
	call SpriteBank_Font
	
	ld b,8*2

ConfigureControls_Nextkey:
	push bc
		ld hl,KeyName
		ld a,b
		add b
		sub 2
		ld d,0
		ld e,a
		add hl,de

		ld c,(hl)	; get the description of the key
		inc hl
		ld b,(hl)	; get the description of the key

		push de
			ld a,255
			ldia	;show 255 chars
			push bc
				call cls
				ld hl,&0D05
				ld bc,KeyMapString0

				call Akuyou_DrawText_LocateSprite
				call Akuyou_DrawText_PrintString
			pop bc
			ld hl,&0F0C
			call Akuyou_DrawText_LocateSprite
			call Akuyou_DrawText_PrintString

			call KeyboardScanner_WaitForKey
ifdef BuildCPC			
			ld b,200
else
			ld b,30
endif
ConfigureControls_Delay
			halt
			djnz ConfigureControls_Delay

	
		pop de
			ld hl,KeyMap2
			add hl,de
		push de
			ld (hl),a
			inc hl
			ld (hl),c

			;call DrawText_PrintHex	
			;ld a,"-"
			;call DrawText_PrintChar	
			;ld a,c
			;call DrawText_PrintHex	
		pop de
;		inc de
;		inc de
	pop bc
	djnz ConfigureControls_Nextkey

;	ld hl,(MusicRestore)
;	call CallHL

ret
 
 
KeyName: 

	defw KeyMapString8b
	defw KeyMapString7b
	defw KeyMapString6b
	defw KeyMapString5b
	defw KeyMapString4b
	defw KeyMapString3b
	defw KeyMapString2b
	defw KeyMapString1b

	defw KeyMapString8
	defw KeyMapString7
	defw KeyMapString6
	defw KeyMapString5
	defw KeyMapString4
	defw KeyMapString3
	defw KeyMapString2
	defw KeyMapString1

;We use - rather than space so the old text is overwritten - remember our
;spritefont has no space!
if BuildLang =''
		     ;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
 	     	     ;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	KeyMapString0: db  "Press Key For",":"+&80
	KeyMapString8: db  "--P1-Pause","-"+&80
	KeyMapString7: db  "-P1-SBomb-","-"+&80
	KeyMapString6: db  "-P1-FireR-","-"+&80
	KeyMapString5: db  "-P1-FireL-","-"+&80
	KeyMapString4: db  "-P1-Right-","-"+&80
	KeyMapString3: db  "--P1-Left-","-"+&80
	KeyMapString2: db  "--P1-Down-","-"+&80
	KeyMapString1: db  "--P1-Up---","-"+&80

	KeyMapString8b: db  "--P2-Pause","-"+&80
	KeyMapString7b: db  "-P2-SBomb-","-"+&80
	KeyMapString6b: db  "-P2-FireR-","-"+&80
	KeyMapString5b: db  "-P2-FireL-","-"+&80
	KeyMapString4b: db  "-P2-Right-","-"+&80
	KeyMapString3b: db  "--P2-Left-","-"+&80
	KeyMapString2b: db  "--P2-Down-","-"+&80
	KeyMapString1b: db  "--P2-Up---","-"+&80
else
if BuildLang =''
	KeyMapString0: db  143,159,129,158,103," ",127,158,129,121,125,132,255
else
	KeyMapString0: db  "PRESS KEY FOR",":",255
endif
	KeyMapString8: db  "--P1-PAUSE","-",255
	KeyMapString7: db  "-P1-SBOMB-","-",255
	KeyMapString6: db  "-P1-FIRER-","-",255
	KeyMapString5: db  "-P1-FIREL-","-",255
	KeyMapString4: db  "-P1-RIGHT-","-",255
	KeyMapString3: db  "--P1-LEFT-","-",255
	KeyMapString2: db  "--P1-DOWN-","-",255
	KeyMapString1: db  "--P1-UP---","-",255

	KeyMapString8b: db  "--P2-PAUSE","-",255
	KeyMapString7b: db  "-P2-SBOMB-","-",255
	KeyMapString6b: db  "-P2-FIRER-","-",255
	KeyMapString5b: db  "-P2-FIREL-","-",255
	KeyMapString4b: db  "-P2-RIGHT-","-",255
	KeyMapString3b: db  "--P2-LEFT-","-",255
	KeyMapString2b: db  "--P2-DOWN-","-",255
	KeyMapString1b: db  "--P2-UP---","-",255
endif



ClearC000:
di
ld hl,&FFFF
ld b,256
ld de,&0000
call SpFill
ei
ifdef buildCPC
	ld e,1
	ld hl,RasterColors_Safe
	call RasterColors_NoDelay
endif
ret



SpFill:
ld (SpRestoreFill_Plus2-2),sp

SpFillContinue:
ld sp,hl
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
ld hl,&0000
add hl,sp
ld sp,&0000:SpRestoreFill_Plus2
ei
di
djnz SpFillContinue
ei
ret

BulletConfigHeaven:
;Starbust code - we use RST 6 as an 'add command' to save memory - RST 6 calls IY
;See EventStreamDefinitions for details of how the 'Directions' work
;Stars_AddBurst_Top
defw &FFFF;defw &0705
defw &FFFF;defw &0F0d
defw &FFFF;defw &1715
defw &1F1D
;Stars_AddBurst_TopLeft
defw &FFFF;defw &0301
defw &FFFF;defw &0b09
defw &FFFF;defw &1311
defw &1b19
defb 0

;Stars_AddBurst_Right;
defw &2725
defw &FFFF;defw &2f2D
defw &FFFF;defw &3735
defw &FFFF;defw &3f3D
;Stars_AddBurst_TopRight
defw &FFFF;defw &0705
defw &FFFF;defw &0F0d
defw &FFFF;defw &1715
defw &1F1D
defb 0
;Stars_AddBurst_Left
defw &FFFF;defw &0301
defw &FFFF;defw &0b09
defw &FFFF;defw &1311
defw &1b19
;Stars_AddBurst_BottomLeft
defw &2321
defw &FFFF;defw &2b29
defw &FFFF;defw &3331
defw &FFFF;defw &3b39
defb 0
;Stars_AddBurst_Bottom
defw &2321
defw &FFFF;defw &2b29
defw &FFFF;defw &3331
defw &FFFF;defw &3b39
;Stars_AddBurst_BottomRight
defw &2725
defw &FFFF;defw &2f2D
defw &FFFF;defw &3735
defw &FFFF;defw &3f3D
defb 0

;Stars_AddBurst_Outer
defw &FFFF;defw &3737
defw &FFFF;defw &2727
defw &FFFF;defw &1717
defw &FFFF;defw &3131
defw &FFFF;defw &2121
defw &FFFF;defw &1111
;OuterBurstPatternMini
defw &2F2F
defw &1F1F
defw &2929
defw &1919
defw &3F39
defw &0F09
;Stars_AddObjectOne
defb 0

;Stars_AddBurst
defw &FFFF
defb &FF,&FF
;Stars_AddBurst_Small
defw &3632
defw &2e2A
defw &2622
defw &1e1A
defw &1612
defb 0
defw &1d1b
defw &FFFF;defw &1513
defw &FFFF;defw &0d0b
defb 0
defw &2726
defw &FFFF;defw &2f2d
defw &FFFF;defw &1f1d
defb 0
defw &2221
defw &FFFF;defw &1b19
defw &FFFF;defw &2b29

defb 0
defw &2d2b
defw &FFFF;defw &3533
defw &FFFF;defw &3d3b
defb 0
BulletConfigHeaven_End:
BulletConfigHell:
;Stars_AddBurst_Top
defw &0705
defw &0F0d
defw &1715
defw &1F1D
;Stars_AddBurst_TopLeft
defw &0301
defw &0b09
defw &1311
defw &1b19
defb 0

;Stars_AddBurst_Right
defw &2725
defw &2f2D
defw &3735
defw &3f3D
;Stars_AddBurst_TopRight
defw &0705
defw &0F0d
defw &1715
defw &1F1D
defb 0
;Stars_AddBurst_Left
defw &0301
defw &0b09
defw &1311
defw &1b19
;Stars_AddBurst_BottomLeft
defw &2321
defw &2b29
defw &3331
defw &3b39
defb 0
;Stars_AddBurst_Bottom
defw &2321
defw &2b29
defw &3331
defw &3b39
;Stars_AddBurst_BottomRight
defw &2725
defw &2f2D
defw &3735
defw &3f3D
defb 0

;Stars_AddBurst_Outer
defw &3737
defw &2727
defw &1717
defw &3131
defw &2121
defw &1111
;OuterBurstPatternMini
defw &2F2F
defw &1F1F
defw &2929
defw &1919
defw &3F39
defw &0F09
;Stars_AddObjectOne
defb 0

;Stars_AddBurst
defw &3f08
defb 0,0 
;Stars_AddBurst_Small
defw &3632
defw &2e2A
defw &2622
defw &1e1A
defw &1612
defb 0
;Stars_AddBurst_TopWide
defw &1d1b
defw &1513
defw &0d0b
defb 0
;Stars_AddBurst_RightWide
defw &2726
defw &2f2d
defw &1f1d
defb 0
;Stars_AddBurst_LeftWide
defw &2221
defw &1b19
defw &2b29

defb 0
;Stars_AddBurst_BottomWide
defw &2d2b
defw &3533
defw &3d3b
defb 0
BulletConfigHell_End:
;the commands we have to send to turn on a plus!
PlusInitSequence:
defb &ff,&00,&ff,&77,&b3,&51,&a8,&d4,&62,&39,&9c,&46,&2b,&15,&8a,&cd,&ee

PlusPaletteGame:
defw &0000			;; colour for sprite pen 1
defw &0555			;; colour for sprite pen 2
defw &0AAA				;; colour for sprite pen 3
defw &0FFF			;; colour for sprite pen 4
defw &0066			;; colour for sprite pen 5
defw &00AA			;; colour for sprite pen 6
defw &0808			;; colour for sprite pen 7
defw &0F0F			;; colour for sprite pen 8
defw &0FAC			;; colour for sprite pen 9
defw &00F0			;; colour for sprite pen 10
defw &06F7			;; colour for sprite pen 11
defw &0F00			;; colour for sprite pen 12
defw &0800			;; colour for sprite pen 13
defw &0373			;; colour for sprite pen 14
defw &0333			;; colour for sprite pen 15

;***************************************************************************************************

BootStrap_EntTitlePalette:	;The 'Normal' level palette
	defb 15
	defw &0000
	defw &000F
	defw &08F8
	defw &0FFB
	defb 30
	defw &0000
	defw &003F
	defw &02F2
	defw &0EEB
	defb 45
	defw &0000
	defw &006B
	defw &00D0
	defw &0DDF
	defb 100
	defw &0000
	defw &0077
	defw &0F4F
	defw &0EEE
	defb 140
	defw &0000
	defw &0420
	defw &0A66
	defw &0EEE
	defb 200-16-2
	defw &0000
	defw &0800
	defw &0E66
	defw &FFFF
	defb 200-8-2
	defw &0000
	defw &0800
	defw &0E66
	defw &FFFF
	defb 200
	defw &0000
	defw &0800
	defw &0E66
	defw &FFFF



;***************************************************************************************************

;					Bootstrap Disk Loader

;***************************************************************************************************
ifdef buildCPC
.cas_out_open equ &bc8c
.cas_out_direct equ &bc98
.cas_out_close equ &bc8f

BootStrap_LoadDiskFile:	

; HL - pointer to disk file
; DE - Destination to write to

	push de
	ld de,&C000	;; address of 2k buffer, 
	ld b,12		;12 chars
	call cas_in_open	

	pop hl
	jr nc,LoadGiveUp
	call cas_in_direct
LoadGiveUp:
	jp cas_in_close

endif


ifdef buildCPC
BootStrap_SaveDiskFile:
	;ld hl,filename ;; HL = address of the start of the filename
	;bc lengh of file
	;de source mem pos

	ifdef ReadOnly	
		ret
	endif 
	

	push bc
	push de
		ld a,255
		ld (&BE78),a ;bios_set_message

		ld b,12 ;; B = length of the filename in characters
		ld de,&C000 ; Address of Buffer
		call cas_out_open ;; firmware function to open a file for writing

	pop hl  ;ld hl,&c000;; HL = load address
	pop de	;	ld de,&4000;; DE = length
	ld bc,&0000;; BC = execution address

	ld a,2 ;; A = file type (2 = binary)

	call cas_out_direct	;; write file
	call cas_out_close 	;; firmware function to close a file opened for writing

	ld bc,&FA7E            ; FLOPPY MOTOR OFF
        out (c),c      
endif
ret

;Mini continue compiles sprite for 64k
ifdef BuildMSX
RleContinue:
	incBin "..\ResMSX\Continue.RLE"
RleContinue_End:
endif
ifdef BuildZXS
			read "..\ResZX\Rle_Continue.asm"
endif
ifdef BuildCPC
	CompiledSpriteContinue:
	ifdef Support64k
		ifdef CompileEP1
			read "ContinueCompiled64k.asm"
		endif 
		ifdef CompileEP2
			read "ContinueCompiled64k_Ep2.asm"
		endif
	endif
endif

list
lastbyte defb 0
nolist

FileEndBootStrap:

ifdef buildCPC
	save direct "BootStrp.AKU",Akuyou_BootStrapStart,FileEndBootStrap-Akuyou_BootStrapStart	;address,size...}[,exec_address]
endif
