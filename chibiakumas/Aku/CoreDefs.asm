

ifdef buildCPC
	macro exxdi
		di
	mend
	macro exxei
		ei
	mend
	macro RstSix
		rst 6
	mend

	macro ldai
		ld a,i
	mend
	macro ldia
		ld i,a
	mend


	SPReset equ &BFFF
	Akuyou_CoreStart equ &450
	Akuyou_BootStrapStart equ &8000


	Akuyou_GameVars equ &3100 ; Need &700 bytes!
	PlusSprite_ExtBank equ &C7
	Akuyou_PlayerSpritePos equ &3800
	Akuyou_PlusSpritesPos equ &3800;&A800-&8000
	;Akuyou_PlusSpritesPosOneByte equ &38;&A800-&8000
	;Akuyou_PlusSpritesBoPosOneByte equ &F8


	Akuyou_Music_Bank equ &C0
	Akuyou_MusicPos equ &50		;Akuyou only allows &400 bytes for music
	Akuyou_MusicPosAlt equ &7B00		;When music switches during boss battle, store the alternate here
	Akuyou_SfxPos equ &3000		;Akuyou only allows &100 bytes for SFX

	Akuyou_LevelStart equ &4000		;+3-Bank 0
	Akuyou_LevelStart_Bank equ &C0

	LevelData128kpos equ &4000		;+3-Bank 1
	LevelData128kpos_Bank equ &C7

	LevelData128kpos_C equ &4000		;+3-Bank 1
	LevelData128kpos_C_Bank equ &C4

	LevelData128kpos_D equ &6000		;+3-Bank 1
	LevelData128kpos_D_OneByte equ &60
	LevelData128kpos_D_Bank equ &C4

	CSprite_SetDisk equ 2*3
	CSprite_Continue equ 1*3
	CSprite_Loading equ 0*3

	Font_Membank equ &C6
	Font_RegularSizePos equ &7000;&F000
	if BuildLang= ''
		Font_SmallSizePos equ 	&7800;&F800	
	else
		Font_SmallSizePos equ 	&7A00;&F800	
	endif

;Platform Specific Core commands;
	Akuyou_RasterColors_SetPointers	equ 	Akuyou_CoreStart+&009C		;Set the memory location of the CPC raster switching data
	Akuyou_BankSwitch_C0_BankCopy equ 	Akuyou_CoreStart+&0066		;Copy data between banks on CPC (banks numbered C0-C7 etc)
	Akuyou_BankSwitch_C0 equ 		Akuyou_CoreStart+&003F		;Switch Banks for a moment (Disable interrupts first!)
	Akuyou_BankSwitch_C0_Reset equ 	Akuyou_CoreStart+&0042			;Reset to bank that was made current
	Akuyou_BankSwitch_C0_SetCurrent  equ  Akuyou_CoreStart+&00B7		;set a bank as 'Current'

	Akuyou_RasterColors_Reset equ 		Akuyou_CoreStart+&0030		;Reset raster colors
	Akuyou_RasterColors_Disable equ 	Akuyou_CoreStart+&0033		;Disable raster flips

	Akuyou_CPCGPU_CommandNum		equ 	Akuyou_CoreStart+&00AB	;Run a graphics command from the CPC Graphics vector array
endif


ifdef buildENT
	;0=F8 (Zero Page)
	;1=F9
	;2=FA
	;3=FB
	;4=FC  (Screen1)
	;5=FD  (Screen2)
	;6=FE
	;7=FF (System page)

	macro exxdi
		di
	mend
	macro exxei
		ei
	mend
	macro RstSix
;		call Rst6Fake
		rst 5
	mend

	macro ldai
		ld a,i
	mend
	macro ldia
		ld i,a
	mend


	SPReset equ &BFFF
	Akuyou_CoreStart equ &500

	Akuyou_BootStrap_Bank equ &FE
	Akuyou_BootStrapStart equ &8000


	Akuyou_GameVars equ &3100 ; Need &700 bytes!


	PlusSprite_ExtBank equ &FB
	Akuyou_PlusSpritesPos equ &4000
	Akuyou_PlayerSpritePos equ &4000


	Akuyou_ScreenBufferA equ &FD
	Akuyou_ScreenBufferB equ &FC


;	Akuyou_Music_Bank equ &F8
	Akuyou_MusicPos equ &100		;Akuyou only allows &400 bytes for music
	Akuyou_MusicPosAlt equ &7B00		;When music switches during boss battle, store the alternate here
	Akuyou_SfxPos equ &3000		;Akuyou only allows &100 bytes for SFX

	Akuyou_LevelStart equ &4000		;+3-Bank 0
	Akuyou_LevelStart_Bank equ &F9

	LevelData128kpos equ &4000		;+3-Bank 1
	LevelData128kpos_Bank equ &FA

	LevelData128kpos_C equ &6000		;+3-Bank 1
	LevelData128kpos_C_OneByte equ &70
	LevelData128kpos_C_Bank equ &FA

	LevelData128kpos_D equ &7000		;+3-Bank 1
	LevelData128kpos_D_OneByte equ &70
	LevelData128kpos_D_Bank equ &FA

	CSprite_SetDisk equ 2*3
	CSprite_Continue equ 1*3
	CSprite_Loading equ 0*3

	CSprite_Bank equ &FB
	CSprite_Pos equ &6000
	CSprite_PosByte equ &60

	Font_Membank equ &FE
	Font_RegularSizePos equ &7000;&F000
	Font_SmallSizePos equ 	&7800;&F800	
	

;Platform Specific Core commands;
	Akuyou_RasterColors_SetPointers	equ 	Akuyou_CoreStart+&009C		;Set the memory location of the CPC raster switching data
	Akuyou_BankSwitch_C0_BankCopy equ 	Akuyou_CoreStart+&0066		;Copy data between banks on CPC (banks numbered C0-C7 etc)
	Akuyou_BankSwitch_C0 equ 		Akuyou_CoreStart+&003F		;Switch Banks for a moment (Disable interrupts first!)
	Akuyou_BankSwitch_C0_Reset equ 	Akuyou_CoreStart+&0042			;Reset to bank that was made current
	Akuyou_BankSwitch_C0_SetCurrent  equ  Akuyou_CoreStart+&00B7		;set a bank as 'Current'

	Akuyou_RasterColors_Reset equ 		Akuyou_CoreStart+&0030		;Reset raster colors
	Akuyou_RasterColors_Disable equ 	Akuyou_CoreStart+&0033		;Disable raster flips

	Akuyou_ENTGPU_CommandNum		equ 	Akuyou_CoreStart+&00AB	;Run a graphics command from the CPC Graphics vector array
endif





ifdef buildMSX

	macro exxdi
		di
	mend
	macro exxei
		ei
	mend


	macro RstSix
		rst 6
	mend

	macro ldai
		ld a,i
	mend
	macro ldia
		ld i,a
	mend

	SPReset equ &D100

	Akuyou_CoreStart equ &8000  ;&450+
	Akuyou_BootStrapStart equ &1000

	Akuyou_GameVars equ &C000-&700 ; Need &700 bytes!
	PlusSprite_ExtBank equ &C7


	Akuyou_PlayerSpritePos equ &100	 	;Memory pos of Player sprite lookup (160 bytes)
	Akuyou_PlusSpritesPos equ &200		;Memory pos of Icon   sprite lookup (160 bytes)


ifndef buildMSX_V9K
	Akuyou_PlayerSpritePos_Y equ 192	 	;Memory pos of Player sprite lookup (160 bytes)
	Akuyou_PlusSpritesPos_Y  equ 1024-64		;Memory pos of Icon   sprite lookup (160 bytes)
	Akuyou_FontPos_Y	equ 1024-64+16
	Akuyou_LevelSprites_Y	equ 256+192;512
	Akuyou_V9K_Paralax_Y	equ 1024		;For compatibility

else
	Akuyou_CompiledSprites_Y equ 3264
	Akuyou_PlayerSpritePos_Y equ 3840	 	;Memory pos of Player sprite lookup (160 bytes)
	Akuyou_PlusSpritesPos_Y  equ 3840+64		;Memory pos of Icon   sprite lookup (160 bytes)
	Akuyou_FontPos_Y	equ 3840+64+16
	Akuyou_LevelSprites_Y	equ 512
	Akuyou_V9K_Paralax_Y	equ 1024
	ParticleArrayPointer equ &3D00		;FX star array - V9990 only!



endif
	Akuyou_Music_Bank equ 0
	Akuyou_MusicPos    equ &C000;&50+&8000		;Akuyou only allows &400 bytes for music
	Akuyou_SfxPos      equ &C400 ;&3000+&8000	;Akuyou only allows &100 bytes for SFX
	Akuyou_MusicPosAlt equ &C500 ;-&C900		;When music switches during boss battle, store the alternate here

;	Akuyou_LevelStart equ &4000
;	LevelData128kpos equ &C000;&D000	;Note Reffed to C1

	Akuyou_LevelStart equ &4000		;+3-Bank 0
;	Akuyou_LevelStart_FirstByte equ &40
	Akuyou_LevelStart_Bank equ 0

	LevelData128kpos equ &C00		;+3-Bank 1
;	LevelData128kpos_FirstByte equ &C
	LevelData128kpos_Bank equ 1
	;Core is in bank 2
	LevelData128kpos_C equ &400		;+3-Bank 1
;	LevelData128kpos_C_FirstByte equ &4
	LevelData128kpos_C_Bank equ 3

	LevelData128kpos_D equ &800		;+3-Bank 1
;	LevelData128kpos_D_FirstByte equ &8
	LevelData128kpos_D_Bank equ 3




	CSprite_SetDisk equ 2
	CSprite_Continue equ 1
	CSprite_Loading equ 0

	Font_Membank equ &C6
	Font_RegularSizePos equ &7000;&F000
	Font_SmallSizePos equ 	&7800;&F800	



;Platform Specific Core commands;
	Akuyou_VDP_CommandNum			equ 	Akuyou_CoreStart+&00AB	;MSX VDP command Vector Array
	Akuyou_VDP_SetPalette 			equ 	Akuyou_CoreStart+&009C	;Set MSX palette
	Akuyou_VDP_RLEProcessorFromMemory  	equ 	Akuyou_CoreStart+&00E7	;Read an RLE bitmap from standard memory not disk
	Akuyou_Background_Tiles			equ 	Akuyou_CoreStart+&00B4	;Draw MSX background bitmap tiles

endif




ifdef buildZXS
	macro RstSix
		call Rst6Fake
	mend

	macro ldai
		ld a,(ldai_Plus1-1)
	mend
	macro ldia
		ld (ldai_Plus1-1),a
	mend


	ldai_Plus1 equ StarArrayPointer-1
	
	macro exxdi
		;Di should go here
	mend
	macro exxei
		;Ei should go here
	mend


	SPReset equ &8181


	Akuyou_CoreStart equ &8000+&190;	defs &183	; 387 bytes for interrupt handler (and stack!)
	Akuyou_CoreStart_Bank equ 0
	Akuyou_GameVars equ &8000-&700 ; Need &700 bytes!

	Akuyou_BootStrapStart equ &E000		;+3-Bank 6
	Akuyou_BootStrapStart_Bank equ 6


	PlusSprite_ExtBank equ &C7
	Akuyou_PlayerSpritePos equ &6000;&3800+&8000
	Akuyou_PlusSpritesPos equ &6000 ;&3800+&8000



	Akuyou_MusicPos equ    &C000		;Akuyou only allows &400 bytes for music
	Akuyou_SfxPos equ      &C400 ;&3000+&8000		;Akuyou only allows &100 bytes for SFX
	Akuyou_MusicPosAlt equ &C500		;When music switches during boss battle, store the alternate here

	Akuyou_Music_Bank equ 6

	Akuyou_LevelStart equ &C000		;+3-Bank 0
	Akuyou_LevelStart_Bank equ 0

	LevelData128kpos equ &C000		;+3-Bank 1
	LevelData128kpos_Bank equ 1
	;Core is in bank 2
	LevelData128kpos_C equ &C000		;+3-Bank 1
	LevelData128kpos_C_Bank equ 3

	LevelData128kpos_D equ &E000		;+3-Bank 1
	LevelData128kpos_D_Bank equ 3


	CSprite_SetDisk equ 6
	CSprite_Continue equ 12
	CSprite_Loading equ 0

	Font_Membank equ 4
	Font_RegularSizePos equ &C000;&F000
	Font_SmallSizePos equ 	&C400;&F800	
	
	CompiledSprite_Membank equ 4
	CompiledSprite_Pos equ &E000;&F000

	;Platform Specific Core commands;
	Akuyou_Bankswapper_Copy      	 equ 	Akuyou_CoreStart+&0066		;Copy a chunk of memory from one bank to another (ZX bank 0-7)

	Akuyou_Background_Color 	 equ 	Akuyou_CoreStart+&009C		;Color the background
	Akuyou_BackgroundFloodFillQuadSprite equ Akuyou_CoreStart+&00AB		;Tile fill an area of background 
	Akuyou_BackgroundSolidFill	     equ Akuyou_CoreStart+&00AE		;Solid fill an area of background

	Akuyou_GetSpriteMempos		     equ Akuyou_CoreStart+&00B1		;Get sprite memory position (used for tiled backgrounds)
	Akuyou_BitShifter	   	     equ Akuyou_CoreStart+&00E7		;Bitshift background tiles
	Akuyou_INT_Force		     equ Akuyou_CoreStart+&00B4		;Force an interrupt tick

	Akuyou_Bankswapper_CallDefined_Set	equ Akuyou_CoreStart+&003F	;Define a memory location and a bank we will call later
	Akuyou_Bankswapper_CallDefined		equ Akuyou_CoreStart+&0042	;call defined... this allows us to pass all registers
	Akuyou_Bankswapper_Set			equ Akuyou_CoreStart+&00BD	;Set a temporary memory bank (0-7)
	Akuyou_Bankswapper_Reset		equ Akuyou_CoreStart+&00C0	;Restore the previous current memory bank


	Akuyou_Rle_FromPointers		equ Akuyou_CoreStart+&0030

	Akuyou_ZXSGPU_CommandNum	equ Akuyou_CoreStart+&0033
endif
 
;Core Jumpblock definitions

Akuyou_ExecuteBootStrap	equ 		Akuyou_CoreStart+&0003		;Execute a bootstrap command
Akuyou_ShowCompiledSprite	equ	Akuyou_CoreStart+&00A8		;show a 'compiled' sprite (Fullscreen images for loading/insert disk etc)
Akuyou_ShowSprite equ		        Akuyou_CoreStart+&0000		;Show a sprite
Akuyou_ShowSprite_SetBankAddr	equ	Akuyou_CoreStart+&006C		;Set the memory pointer of the sprite to be shown.
Akuyou_GetSpriteXY		equ	Akuyou_CoreStart+&00E4		;Get the current 'XY' location of the last drawn/about to be drawn sprite
Akuyou_ShowSpriteReconfigureEnableDisable equ	Akuyou_CoreStart+&004E	;Disable sprite clipping - used for odd shaped sprites in boss battle
Akuyou_Event_Stream_ForceNow	equ 		Akuyou_CoreStart+&007B	;Eventstream usually processes every few ticks, we can force an immediate update if we need to

Akuyou_Background_SetScroll equ 	Akuyou_CoreStart+&0012		;Define the move direction of objects set to background
Akuyou_Background_GradientScroll equ    Akuyou_CoreStart+&00C3		;Define gradient scroll direction
Akuyou_Background_Gradient equ		Akuyou_CoreStart+&00C9		;Draw background gradient

Akuyou_Music_Init equ 			Akuyou_CoreStart+&001E		;Arkostracker Init Music
Akuyou_Music_Stop equ 			Akuyou_CoreStart+&0021		;Arkostracker Stop Music
Akuyou_Music_Play equ 			Akuyou_CoreStart+&0024		;Arkostracker Play Music
Akuyou_Music_Restart 	equ		Akuyou_CoreStart+&0072		;Restart music
Akuyou_Sfx_Init equ 			Akuyou_CoreStart+&0027		;Arkostracker Init SFX
Akuyou_Sfx_Play equ 			Akuyou_CoreStart+&002A		;Arkostracker Play SFX
Akuyou_PlaySfx  equ			Akuyou_CoreStart+&0075		;Queue an SFX

Akuyou_Interrupt_Init equ 		Akuyou_CoreStart+&002D		;Enable our interrupt handler

Akuyou_RasterColors_MusicOnly	equ 	Akuyou_CoreStart+&00A2		;Disable raster flips, but keep music
Akuyou_RasterColors_StopMusic	equ 	Akuyou_CoreStart+&00A5		;Stop music

Akuyou_RasterColors_Init equ 		Akuyou_CoreStart+&002D		;Init raster color settings

Akuyou_RasterColors_Blackout	equ 	Akuyou_CoreStart+&00BD		;Set all CPC colors to black
Akuyou_RasterColors_DefaultSafe	equ 	Akuyou_CoreStart+&00C0		;Reset CPC colors to black-purple-cyan-white





Akuyou_Bankswapper_CallHL equ 	Akuyou_CoreStart+&0045			; Call HL after setting a different bank


Akuyou_ObjectArray_Redraw equ 		Akuyou_CoreStart+&0015		;Redraw objects


Akuyou_Player_Handler  	equ		Akuyou_CoreStart+&000F		;Draw players, handle input etc
AkuYou_Player_DrawUI	equ 		Akuyou_CoreStart+&0054		;Draw icons and scores

AkuYou_Player_ReadControls equ		Akuyou_CoreStart+&006F		;Read the key/joy input

AkuYou_Player_GetPlayerVars equ		Akuyou_CoreStart+&0096		;Get the start of the player settings memory
Akuyou_Player_GetHighscore equ		Akuyou_CoreStart+&00BA		;Get the current highscore

AkuYou_Player_Hit_Injure_1	    equ Akuyou_CoreStart+&009F		;Player 1 has been hurt (For omega array)
AkuYou_Player_Hit_Injure_2	    equ Akuyou_CoreStart+&00DB		;Player 2 has been hurt	(for omega array)

AkuYou_Player_StarArray_Redraw equ      Akuyou_CoreStart+&001b		;Redraw the player bullets
Akuyou_StarArray_Redraw equ 		Akuyou_CoreStart+&0009		;Redraw the enemy bullets (also redraws particles on V9990)
Akuyou_SetStarArrayPalette 	equ     Akuyou_CoreStart+&00EA		;set the color of the enemy stars (used in EP2 for level 4 boss)
Akuyou_FireStar			equ 	Akuyou_CoreStart+&0093		;Fire a star
Akuyou_DoSmartBombCall		equ 	Akuyou_CoreStart+&007E		;Act as if the player has used a smartbomb, This occurs at the end of a level to kill remaining enemies

AkuYou_Event_StreamInit	  equ 	        Akuyou_CoreStart+&0051		;Init the eventstream
Akuyou_EventStream_Process equ 		Akuyou_CoreStart+&0018		;Process level events
Akuyou_GetLevelTime  equ 		Akuyou_CoreStart+&0057		;Get the current level tick
Akuyou_SetLevelTime  equ 		Akuyou_CoreStart+&000C		;set the current level tick

Akuyou_LoadDiscSector 	 equ		Akuyou_CoreStart+&0006		;Load a disk file
Akuyou_LoadDiscSectorZ	 equ		Akuyou_CoreStart+&00CF		;Load and decompress a diskfile

Akuyou_Firmware_Kill		equ 	Akuyou_CoreStart+&005A		;Disable Remove the firmware from memory (when disk loading is finished)
Akuyou_Firmware_Restore 	equ  	Akuyou_CoreStart+&005D		;Restore the firmware

Akuyou_SpriteBank_Font		equ 	Akuyou_CoreStart+&0090		;Set font (1=small 2=normal)

Akuyou_DrawText_LocateSprite	equ     Akuyou_CoreStart+&0060		;Routine that moves 'cursor' to a screen location (40x25 virtual screen)
Akuyou_DrawText_LocateSprite4CR equ     Akuyou_CoreStart+&00CC		;Same as above, however this one also allows for CarridgeReturn
Akuyou_DrawText_CharSprite	equ	Akuyou_CoreStart+&0063		;Draw a single character
Akuyou_DrawText_PrintString	equ	Akuyou_CoreStart+&0069		;Draw a string (Char+&80 terminated for normal language,&FF terminated for other languages)
Akuyou_DrawText_Decimal		equ 	Akuyou_CoreStart+&00E1		;Print decimal numbers

Akuyou_Object_DecreaseLifeShot  equ	Akuyou_CoreStart+&0078 		;The normal hit-handler for objects - this is here for use if we have overriden the main hit handler



Akuyou_ScreenBuffer_Init equ 		Akuyou_CoreStart+&0036 		;Start the screenbuffer for flipping
Akuyou_ScreenBuffer_Flip equ 		Akuyou_CoreStart+&0039 		;Flip the active and visible screen
Akuyou_ScreenBuffer_Reset  equ 		Akuyou_CoreStart+&003C		;Reset the screen buffers (active and visible are default)
Akuyou_ScreenBuffer_Alt	 equ 		Akuyou_CoreStart+&00B4		;Allows overriding of screen buffer

Akuyou_ScreenBuffer_GetNxtLin	equ	Akuyou_CoreStart+&00D2
Akuyou_get_scr_addr_table 	equ	Akuyou_CoreStart+&0048		;Get the address of the screen memory lookuptable
Akuyou_GetMemPos		equ 	Akuyou_CoreStart+&00DE		;Get screen memory position  from row col (CPC/ZX)
Akuyou_ScreenBuffer_GetActiveScreen equ Akuyou_CoreStart+&0081		;Get screenbuffer mem origin (C0/80 on CPC , 40/C0 on ZX , 0/1 on MSX)
Akuyou_CLS equ	 		    	Akuyou_CoreStart+&004B		;Clear the screen (Slow)

Akuyou_Timer_UpdateTimer	equ  Akuyou_CoreStart+&0084		;Process Timer update
Akuyou_Timer_SetCurrentTick	equ  Akuyou_CoreStart+&00C6		;Set time
Akuyou_Timer_GetTimer		equ 	Akuyou_CoreStart+&008A		;Get current game time

Akuyou_ObjectProgram_SpriteBankSwitch equ Akuyou_CoreStart+&008D	;switch spritebank 0-3)

Akuyou_DoMoves			equ 	Akuyou_CoreStart+&0099		;process moves using standard processor

Akuyou_DoObjectSpawn		equ 	Akuyou_CoreStart+&00D5		;Spawn an object

Akuyou_Plus_HideSprites		equ Akuyou_CoreStart+&00E7	; Hide CPC plus sprite


Akuyou_Aku_CommandNum 		equ Akuyou_CoreStart+&000ED	;Core Vector array - for rare Core commands



;obsolete
;Akuyou_ScreenBuffer_FlipWait	equ 	Akuyou_CoreStart+&00A8



;Levels contain small amounts of executable code
;LevelData_Resume   equ Akuyou_LevelStart+&3ff6 ; Restart Level after being shutdown
;LevelData_MainLoop   equ Akuyou_LevelStart+&3ff3 ; Level Loop - Must have been INIT
LevelData_StartLevel equ Akuyou_LevelStart+&3ff0 ; Start the level with INIT
;LevelData_Shutdown   equ Akuyou_LevelStart+&3ff9 ; Restart Level after being shutdown



;Special one off used for a cheap joke!
ChibiAkumasEp2_Player2Start equ Akuyou_CoreStart+&00D8


Akuyou_PlayerSeparator equ 16 ;-Player 2's data starts XX bytes after player 
	;so you can use IY+XX+1 to get a var from player 2 without changing IY



Keymap_U equ 0
Keymap_D equ 1
Keymap_L equ 2
Keymap_R equ 3
Keymap_F1 equ 4
Keymap_F2 equ 5
Keymap_F3 equ 6
Keymap_Pause equ 7

Keymap_AnyFire equ %11001111









org Akuyou_GameVars ; Need &700 bytes!
StarArraySize equ 255
ObjectArraySize equ 60 ; Must be under 64!
PlayerStarArraySize equ 128


align 256,&00

StarArrayPointer: 	
	defs 256*3,&00

align 256,&00
ObjectArrayPointer:
;first ObjectArraySize*2 of each 256 are used - rest (>128) are spare 
	defs 256*4,&00

PlayerStarArrayPointer  equ  ObjectArrayPointer+128	;First 128 are used by object array
;used		 	equ 256*1+ObjectArrayPointer+128
;used		 	equ 256*2+ObjectArrayPointer+128

Event_SavedSettings 	equ 256*3+ObjectArrayPointer+128;Out the way of the Object array!??

;need to allocate your own ram for these!
;Event_SavedSettingsB 	equ 256*4+ObjectArrayPointer+128;Out the way of the Object array!??
;CustomRam		equ 256*4+ObjectArrayPointer+128

;org 256*4+ObjectArrayPointer


