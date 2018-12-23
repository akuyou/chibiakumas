read "BootStrap.asm"
;Changes you MUST make for a level to work with the new core
; RasterColorsSetPalette1  MUST set IY,null if nothing else
; Player sprites have moved
; Level data must now be at &4000, and start with sprites
; SpriteBank_Font now needs..  ld a,2  ... also note it now corrupts BC
; 128k bank ops are deprecated, now use C0 vers, add &C0 to last A 
; LoadDiscSector also now needs C0
; Structure and size of level vars have changed
; Event_CoreReprogram_Paralax is obsolete
; Event_BackgroundScrollDirection is obsolete use Akuyou_Background_SetScroll
; CustomProgram4_Plus2 is obsolete
; Star and object Array Init is oblsolete
;setting Event_SavedSettings_Plus2 is depricated for Event_StreamInit
;defining backgrounds in the event stream is deprecated
;nolist

;DualChibikoHack equ 1


	;Enable these to alter functions
;DebugSprite equ 1	; mark slow sprites
;Debug equ 1		; enable debugging options
;SingleDisk equ 1 	; Disables Disk messages
;ReadOnly equ 1   	; Disable Disk writes - For Cartridge versions!


;coredefined equ 1

	; Enable Support64k and Support128k for a core that supports everything
	; Support64k or Support128k for a core that supports one
	;but DO NOT UNTICK BOTH OF THESE AT THE SAME TIME, or you will get
	;a core that supports nothing! also and remember
	;the game will crash if run on a 64k machine with no 64k support
	; or 128k mne with no 128k support (unless CPCVer is set to 64 of course!)

;Support64k equ 1  ; enable code only needed by 64k
;Support128k equ 1 ; enable code only needed by 128k+ (keep enabled for 256/512k etc)


	;This can be used with or without the two options above
;SupportPlus equ 1 ; enable code only needed by CPC Plus


;MinimizeCore equ 1 ; Reduce size of the core at the cost of speed - works on 64k or 128k
		    ; If you have spare space, enable this, if you don't disable it!


	;This no-loger works, I had to remove too many files from disk 2 to remove disk 3
;AllowDisk2 equ 1	;skip optional stuff on disk 1 (allowed starting at level 5 for testing - not useful any more)


;CPC320 equ 1	;CPC Screen width=320 (otherwise 256)

;buildCPC equ 1
;buildMSX equ 1
;buildZXS equ 1
;buildZXS_DSK equ 1
;buildZXS_TRD equ 1
;buildZXS_TAP equ 1

Arkos_VarsDefined equ 1

ifdef CPC320
	TextScreen_MaxX equ 39
	TextScreen_MinX equ 0
	TextScreen_MaxY equ 24	
	TextScreen_MinY equ 0	
else
	TextScreen_MaxX equ 36 ;40
	TextScreen_MinX equ 4	;0
	TextScreen_MaxY equ 23	;24
	TextScreen_MinY equ 0	;0
endif

ifndef Support128k		;Check some Obakasan didn't ignore my warning above!
	ifndef Support64k 
		Support64k equ 1
	endif
endif


ScreenBuffer2Pos equ &80



;                                                  ``.......`  ```...;;;;.             
;                                     `#@@@@@@@###++';;;;;;;;;;;.....`                 
;                                      `             ''`     .`                        
;                                                   `+'     ;'.                        
;                                            `'##';`.++`  ;#@@@#@#+';,                 
;                                           +,      .##`    '+.    `;@@;               
;                                          '@'      `++`   `++.,'#@@@@;                
;                                          ,'#@@@@@@@@@@@@@@@@@@@#'.                   
;                                                   #@'    ,#'                         
;                                               ,#@@@; .+@@@#`                         
;                                     .;'#@@@@@@@@@@@@@@@@+;;;,...,;;'+++'.            
;                             `;;;;''+##++'''''''';;;;'';;;;;;,,,,..`                  
;                                             +@@@#.     ,.                            
;                                           '@;`#@;     `;#;         ..                
;                                         `#+` '@@;      ;@+          ,;+.             
;                                        ;@;   ;@@#`    ;@@#.           ;@'            
;                                      ,@'      '@@'    ,',     ,#+`    '@@.           
;                                  `;;.          ;#@@#;..;'#@@@@#.     ,#@+`           
;                       `;,      ;+.              ;'#@@@@+;,,`                         
;                       ,+;     ++,;;;'###+'+###+,                                     
;                       '@;    .+@@@@###',`,#,                                         
;                      ;@+`                '#,                                         
;                 `+@##@@@@@@@@@#`         +@;                                         
;                      ;@'   `+@@,        .@@+`              Akuyou Game Engine                      
;                     `+@;   ,@@@,        ,@@+`              Version 1.5
;                     .@@;  `#@@+'@@@@@@@#'@@+```                                      
;                    `#@;   `#@@;        `;@@#....,.``                     
;                   `#@+    .@@@;         +@@#,                                        
;                   '@#`    '@@#,        ;@@#@+`      Akuyou@ChibiAkumas.com                                 
;                  `+@@@#;`;@@@;         +@@;+@+                                       
;                   ..;'+@@@@@+`        `@@+ .'@@,                                     
;                        `#@@@@@;`      #@#`   ;+@+`                     ````          
;                       .@@@'`.,;,`   .@@#.     `;+@;             .+@@@@#+'+#@@#,';    
;                     `#@@@;       `+@@@;          ;;#;       `#@@@'` .@@@@'``'@++@@@' 
;                 `+@@@@@@#,    ;@@@@;               `,.` `'@@@@;     +@@@#,  `;`;@@@#.
;               `#@@@@@#';....'@@#;                   ,#@@@@;         +@''#@@#@@@@;;##`
;            .;;,.`           `;'+#@@@@@@@@@@##@@@@@@@#'.             +@;  ;'@+`   ,##`
;                                       `........`                    +@;   ;@+`   ,##`
;                                                                     +@@;  ;@+`  ,@@+`
;                                                                      ;+@@@'@##@@@;   
;                                                                        `;+@@@;`      

;The source code to this game is Creative Commons Licenced under 
; "Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)" license
; Please see creativecommons.org/licenses/by-sa/4.0/

;You are free to use or modify the code in any way you wish - provided no charge is ma

;The games main "Hero" characters "Chibiko Akuma" "Bochan Akuma" "Yumi Yuusha" "Yume Yuusha" 
;and "Sakya Chan" are Copyright 2016 Keith Sear 

;You are permitted to use these characters in any of your own works without permission, 
;provided all the following conditions are met

;1. You provide a link in your creative work to the ChibiAkumas.com or ChibiAkuma.com official website
;2. You state that I am the creator of the characters
;3. You state that your work is not officially endorsed

;If you make a Game / Comic etc with the Chibi Akumas characters, you are welcome to send it to me, 
;and I will consider linking it on the official website if I feel it is in keeping with the 'brand 
;image'* of the Chibi Akumas games and the characters contained in them.
;Just to reiterate - you can use the characters without any such endorsement by myself!

;You are welcome to remove the "hero characters" and the "Chibi Akumas" name and distribute your 
;own alternate version of the game if you wish.

;Note this does not apply to the level enemies or boss characters , these are all licensed with the same Creative commons
;license as the source code.

; Akuyou means 'Misuse' in japanese - it refers to a total misuse of time, such as writing games for a 30 year old computer!
; the game engine name should be written in japanese with the Kanji Aku (bad) You (from yousei - fairy spirit)

;* (Is it really possible to do anything WORSE than is already in the official games!! 
;   go on, create a doujinshi nscc-sakuya... I dare ya!)


;ifndef bootstrapdefined

;endif

ifdef buildMSX
	SprShow_X equ SprShow_X_Plus2-2
	SprShow_Y equ SprShow_Y_Plus2-2
else
	SprShow_X equ SprShow_X_Plus1-1
	SprShow_Y equ SprShow_Y_Plus1-1
endif
SprShow_BankAddr equ SprShow_BankAddr_Plus2-2   ; 
SprShow_SprNum equ SprShow_SprNum_Plus1-1

;ObjectArray_Size equ ObjectArray_Size_Plus1-1

;ObjectArrayAddress equ ObjectArrayAddress_Plus2-2

Timer_TicksOccured equ Timer_TicksOccured_Plus1-1


;***************************************************************************************************

;					Main Project Code

;***************************************************************************************************
ifdef buildZXS
	if BuildLang =''
		ifdef buildZXS_DSK
			write "..\BldZX\core_DSK.bin"
		endif
		ifdef buildZXS_TRD
			write "..\BldZX\core_TRD.bin"
		endif
		ifdef buildZXS_TAP
			write "..\BldZX\core_TAP.bin"
		endif
	endif
	if BuildLang ='r'
		ifdef buildZXS_DSK
			write "..\BldZXr\core_DSK.bin"
		endif
		ifdef buildZXS_TRD
			write "..\BldZXr\core_TRD.bin"
		endif
		ifdef buildZXS_TAP
			write "..\BldZXr\core_TAP.bin"
		endif
	endif
endif 

ifdef buildENT
		write "..\BldENT\core.aku"
endif

ifdef buildMSX
	ifndef buildMSX_V9K
		if BuildLang =''
			write "..\ResMSX\core.aku"
		else
			write "..\ResMSXj\core.aku"
		endif
	else
		if BuildLang =''
			write "..\ResMSX\core.V9K"
		else
			write "..\ResMSXj\core.V9K"
		endif
	endif
;	db &FE     ; magic number
;	dw FileBeginCore    ; begin address
;	dw FileEndCore - 1  ; end address
;	dw FileBeginCore;Execute  ; program execution address (for ,R option)
endif

 

;org &A00



;StarArraySize equ 255

;StarY.....,StarX.....,StarMovement.....





;limit &A500

org Akuyou_CoreStart;&8000
FileBeginCore:
ifdef buildZXS
	StackPointerAlt equ &8181
endif 


ifdef Akuyou_BasicSafe
WRITE DIRECT -1,-1,&C2   ; Write into 128k ram to allow basic to use the CORE!
endif


jp ShowSprite		;8000
jp ExecuteBootStrap	;8003
jp LoadDiscSector	;8006
jp StarArray_Redraw     ;8009
jp SetLevelTime ;	;800C
jp Player_Handler	;800F

jp DoMovesBackground_SetScroll	;8012

jp objectArray_Redraw   ;8015
jp Event_Stream		;8018
jp Player_StarArray_Redraw ;801B

jp PLY_Init		;801E
jp PLY_Stop		;8021
jp PLY_Play		;8024
jp PLY_SFX_Init		;8027
jp PLY_SFX_Play 	;802A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	jp RasterColors_Init 	;802D
	jp RasterColors_Reset	;8030
	jp RasterColors_Disable	;8033
endif
ifdef buildMSX
	jp INT_Init		;802D
	jp null			;8030
	jp null			;8033
endif
ifdef buildZXS
	jp INT_Init		;802D
	jp Rle_FromPointers	;8030
	jp ZXSGPU_CommandNum	;8033
endif
ifdef buildENT
	jp INT_Init		;802D
	jp null			;8030
	jp null			;8033
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jp ScreenBuffer_Init	;8036 Init the double buffer
jp ScreenBuffer_Flip	;8039 Flip the buffer
jp ScreenBuffer_Reset 	;803C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	jp BankSwitch_C0       ;803F
	jp BankSwitch_C0_Reset ;8042
	jp BankSwitch_C0_CallHL ;8045
endif
ifdef buildENT
	jp null
	jp null 
	jp null
endif
ifdef buildZXS
	jp Bankswapper_CallDefined_Set	;803F
	jp Bankswapper_CallDefined	;8042
	jp Bankswapper_CallHL  ;8045
endif
ifdef buildMSX
	jp null
	jp null
	jp Bankswapper_CallHL  ;8045
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jp get_scr_addr_table 		;8048
jp CLS;null	 		    	;804B
jp ShowSpriteReconfigureEnableDisable		 	   	;804E
jp Event_StreamInit	   	;8051
jp Player_DrawUI		;8054
jp GetLevelTime 		;8057
jp Firmware_Kill		;805A
jp Firmware_Restore 		;805D
jp DrawText_LocateSprite	;8060
jp DrawText_CharSprite		;8063
ifdef buildCPC
	jp BankSwitch_C0_BankCopy ;8066
endif
ifdef buildENT
	jp BankSwitch_BankCopy 		;8066
endif
ifdef buildZXS
	jp Bankswapper_Copy	;8066
endif
ifdef buildMSX
	jp null			;8066
endif
jp DrawText_PrintString		;8069
ifdef buildCPC
	jp ShowSprite_SetBankAddr	;806C
else
	jp null
endif
jp Player_ReadControlsClassic	;806F
jp Music_Restart 		;8072
jp SFX_PlaySfx  		;8075
jp Object_DecreaseLifeShot 	;8078
jp Event_Stream_ForceNow	;807B
jp DoSmartBombCall		;807E
jp ScreenBuffer_GetActiveScreen	;8081
jp Timer_UpdateTimer		;8084
jp null;Player_CheatMode		;8087
jp Timer_GetTimer		;808A
jp ObjectProgram_SpriteBankSwitch ;808D
jp SpriteBank_Font		 ;8090
jp ObjectProgram_HyperFire	;8093
jp Player_GetPlayerVars		;8096
jp DoMoves			;8099
ifdef buildCPC
	jp RasterColors_SetPointers	;809C
endif
ifdef buildENT
	jp RasterColors_SetPointers	;809C
endif
ifdef buildMSX
	jp VDP_SetPalette		;809C
endif 
ifdef buildZXS
	jp Background_Color		;809C
endif
jp Player_Hit_Injure_1		;809F
ifdef buildCPC
	jp RasterColors_MusicOnly	;80A2
	jp RasterColors_StopMusic	;80A5
else
	jp null
	jp null
endif
jp ShowCompiledSprite		;80A8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef BuildCPC
	jp CPCGPU_CommandNum ;	jp Plus_SetSprite		;80AB  CPCGPU_CommandNum
	jp null			;	jp Plus_CopySpriteCompressed	;80AE	
	jp null			;	jp Plus_SetPalette		;80B1
endif
ifdef BuildENT
	jp ENTGPU_CommandNum	;	jp Plus_SetSprite		;80AB  CPCGPU_CommandNum
	jp null			;	jp Plus_CopySpriteCompressed	;80AE	
	jp null			;	jp Plus_SetPalette		;80B1
endif
ifdef buildMSX
	jp VDP_CommandNum		;80AB
	jp null				;80AE	
	jp null				;80B1
endif
ifdef buildZXS
	jp BackgroundFloodFillQuadSprite;80AB
	jp BackgroundSolidFill		;80AE	
	jp GetSpriteMempos		;80B1
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	jp ScreenBuffer_Alt		;80B4
	jp BankSwitch_C0_SetCurrent  	;80B7
endif
ifdef buildENT
	jp null				;80B4
	jp BankSwitch_C0_SetCurrent  	;80B7
endif
ifdef buildZXS
	jp INT_Force			;80B4
	jp null				;80B7
endif
ifdef buildMSX
	jp Background_Tiles		;80B4
	jp null				;80B7
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jp Player_GetHighscore			;80BA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	jp RasterColors_Blackout	;80BD
	jp RasterColors_DefaultSafe	;80C0
endif
ifdef buildENT
	jp null				;80BD
	jp null				;80C0
endif
ifdef BuildMSX
	jp null				;80BD
	jp null				;80C0
endif
ifdef BuildZXS
	jp Bankswapper_Set		;80BD
	jp Bankswapper_Reset		;80C0
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jp Background_GradientScroll    ;00C3
jp Timer_SetCurrentTick		;00C6
jp Background_Gradient		;00C9
jp DrawText_LocateSprite4CR 	;00CC
jp LoadDiscSectorZ		;00CF
jp GetNxtLin			;00D2
jp DoObjectSpawn		;00D5
jp Player2Start			;00D8
jp Player_Hit_Injure_2		;80DB
jp GetMemPos			;00DE
jp DrawText_Decimal		;00E1
jp GetSpriteXY			;00E4
ifdef BuildCPC
	ifdef SupportPlus
		jp Plus_HideSprites		;00E7
	else
		jp null		;00E7
	endif 
endif
ifdef buildENT
	jp null			;00E7
endif 
ifdef buildMSX
	jp VDP_RLEProcessorFromMemory	;00E7
endif 
ifdef buildZXS
	jp BitShifter			;00E7
endif 
jp SetStarArrayPalette		;00EA
;jp null EnablePlusPalette_Plus2		;
jp Aku_CommandNum ;equ &00ED
;***************************************************************************************************


;***************************************************************************************************
SavedSettings:
defb 255		;spare  -20
defb 0		;spare		-19
defb 0		;spare		-18
defb 0		;spare		-17
defb %00000001		;GameOptions (xxxxxxxS) Screen shake		-16

defb 0			;playmode 0 normal / 128 - 4D  -15
ContinueMode:defb 0		;Continue Sharing (0/1) 	-14
SmartbombsReset:defb 3		;SmartbombsReset		-13
ContinuesReset:defb 60		;-12 - Continues Reset
GameDifficulty:defb 0 		;-11 - Game difficulty (enemy Fire Speed 0= normal, 1=easy, 2=hard) +128 = heaven mode , +64 = star Speedup
defb  %00000000			;Achievements (WPx54321)	-10 (W=Won P=Played)
MultiplayConfig:defb %00000000	;Joy Config       (xxxxxxFM)	-9 
				;M=Multiplay
				;F=Swap Fire 1/2
TurboMode:defb %00000000	;-8 - ------XX = Turbo mode [/////NoInsults/NoBackground/NoRaster/NoMusic]
LivePlayers:defb 1;2;1;0		;-7 Number of players currently active in the game
TimerTicks:defb 0		;-6 ;used for benchmarking
BlockHeavyPageFlippedColors:defb 64; pos -5 0/255=on  64=off
BlockPageFlippedColors:defb 255;64; pos -4 0/255=on  64=off
ScreenBuffer_ActiveScreen:	defb &c0; pos -3
ScreenBuffer_VisibleScreen:	defb &c0; pos -2
CPCVer : defb 00


;CPC 0  =464 , 128=128 ; 129 = 128 plus ; 192 = 128 with 512k; 193 = 128 plus with 512k pos -1
;MSX 1=V9990  4=turbo R
;ZX  0=TAP 1=TRD 2=DSK   128= 128k ;192 = +3 or black +2
Player_Array:
P1_P00:defb 100;Y 	;0
P1_P01:defb 32 ;X	;1
P1_P02:defb 0	;2 shoot delay
P1_P03:defb 2		;3 - smartbombs

P1_P04:defb 0		;4 drones (0/1/2)
P1_P05:defb 60		;5 - continues
P1_P06:defb 0		;6 - drone pos
P1_P07:defb %00000111	;7 - Invincibility
P1_P08:defb 0		;8 - Player SpriteNum
P1_P09:defb 3		;9 - Lives
P1_P10:defb 100		;10 - Burst Fire (Xfire)
P1_P11:defb %00000100	;11 - Fire Speed - PlayerShootSpeed_Plus1 
P1_P12:defb 0		;12 - Player num (0=1, 128=2)
P1_P13: defb 0	;13				; Points to add to player 1 - used to make score 'roll up'
P1_P14:defb 0		;14 - PlayerShootPower_Plus1
P1_P15:defb &67		;15  - FireDir

Player_Array2:			;Player 2 is 16 bytes after player 1 			
P2_P00:defb 150;Y 	;0
P2_P01:defb 32 ;X	;1
P2_P02:defb 0	;2 Shoot delay 
P2_P03:defb 2		;3 - smartbombs

P2_P04:defb 0		;4 Drones (0/1/2)
P2_P05:defb 60		;5 - continues
P2_P06:defb 0		;6 - Drone Pos
P2_P07:defb %00000111	;7 - Invincibility
ifdef buildCPC
	P2_P08:defb 0		;8 - Player SpriteNum
else
	P2_P08:defb 8		;8 - Player SpriteNum
endif
P2_P09:defb 0		;9 - Lives
P2_P10:defb 0		;10 - Burst Fire
P2_P11:defb %00000100	;11 - Fire speed
P2_P12:defb 128	;12 - Player num (0=1,128=2)
P2_P13:Player_ScoreAdd2 defb 0	;13				; Points to add to player 2 - used to make score 'roll up'
P2_P14:defb 0		;14 - PlayerShootPower_Plus1
P2_P15:defb &67		;15 - FireDir


ifdef buildCPC
KeyMap2:
	defb &FF,&00 ;Pause
	defb %01111111,&05 ;Fire3
	defb %10111111,&06 ;Fire2R
	defb %01111111,&06 ;Fire1L
	defb %11011111,&07 ;Right
	defb %11011111,&08 ;Left
	defb %11101111,&07 ;Down
	defb %11110111,&07 ;Up

	KeyMap: 
	defb &F7,&03 ;Pause bit 20
	defb %11111011,&02 ;Fire3	19
	defb %11111011,&04 ;Fire2R
	defb %11110111,&04 ;Fire1L
	defb &FD,&00 ;Right	16
	defb &FE,&01 ;Left	15
	defb &FB,&00 ;Down	14
	defb &FE,&00 ;Up	13

	KeyboardScanner_KeyPresses  ds 10 ;Player1
endif
ifdef buildENT
KeyMap2:
	defb %11101111,&09 ;Pause
	defb %10111111,&08 ;Fire3
	defb %11111011,&00 ;Fire2R
	defb %11101111,&00 ;Fire1L
	defb %11110111,&01 ;Right
	defb %10111111,&01 ;Left
	defb %11011111,&01 ;Down
	defb %10111111,&02 ;Up

	KeyMap: 
	defb %11101111,&09 ;Pause bit 20
	defb %10111111,&07 ;Fire3	19
	defb %11111011,&09 ;Fire2R
	defb %11111110,&09 ;Fire1L
	defb %11111011,&07 ;Right	16
	defb %11011111,&07 ;Left	15
	defb %11111101,&07 ;Down	14
	defb %11110111,&07 ;Up	13

	KeyboardScanner_KeyPresses  ds 12




 ;EP keyboard matrix &B5

 ;        b7    b6    b5    b4    b3    b2    b1    b0
 ;Row    80H   40H   20H   10H   08H   04H   02H   01H
 ; 0   L.SH.     Z     X     V     C     B     \     N
 ; 1    CTRL     A     S     F     D     G  LOCK     H
 ; 2     TAB     W     E     T     R     Y     Q     U
 ; 3     ESC     2     3     5     4     6     1     7
 ; 4      F1    F2    F7    F5    F6    F3    F8    F4
 ; 5         ERASE     ^     0     -     9           8
 ; 6             ]     colon L     ;     K           J
 ; 7     ALT ENTER   LEFT  HOLD   UP   RIGHT DOWN  STOP
 ; 8     INS SPACE R.SH.     .     /     ,   DEL     M
 ; 9                   [     P     @     0           I


endif

ifdef BuildMSX
KeyMap2:
	defb %11011111,&04 ;Pause
	defb %11111110,&08 ;Fire3
	defb %01111111,&02 ;Fire1R
	defb %11110111,&05 ;Fire2L
	defb %01111111,&08 ;Right
	defb %11101111,&08 ;Left
	defb %10111111,&08 ;Down
	defb %11011111,&08 ;Up

KeyMap:
	defb %11011111,&04 ;Pause
	defb %01111111,&07 ;Fire3	19
	defb %11101111,&0C ;Fire1R
	defb %11011111,&0C ;Fire2L
	defb %11110111,&0C ;Right	16
	defb %11111011,&0C ;Left	15		;C=Joy 1 ; B= Joy2
	defb %11111101,&0C ;Down	14
	defb %11111110,&0C ;Up	13
	KeyboardScanner_KeyPresses  ds 13 ;Player1
endif
ifdef buildZXS
	KeyMap2:
	defb %11111110,&05 ;Pause
	defb %11110111,&00 ;Fire3
	defb %11111011,&00 ;Fire2R
	defb %11111101,&00 ;Fire1L
	defb %11111011,&01 ;Right
	defb %11111110,&01 ;Left
	defb %11111101,&01 ;Down
	defb %11111101,&02 ;Up

	KeyMap: 
	defb %11111110,&05 ;Pause
	defb %11101111,&07 ;Fire3	19
	defb %11111011,&07 ;Fire2R
	defb %11110111,&07 ;Fire1L
	defb %11111110,&08 ;Right	16
	defb %11111101,&08 ;Left	15
	defb %11111011,&08 ;Down	14
	defb %11110111,&08 ;Up	13
	;align 16
	KeyboardScanner_KeyPresses  ds 10,&FF ;Player1


;						0   1   2   3   4   5
;Keyboard_Map			0	DB &FE,"#","Z","X","C","V"
;				1	DB &FD,"A","S","D","F","G"
;				2	DB &FB,"Q","W","E","R","T"
;				3	DB &F7,"1","2","3","4","5"
;				4	DB &EF,"0","9","8","7","6"
;				5	DB &DF,"P","O","I","U","Y"
;				6	DB &BF,"#","L","K","J","H"
;				7	DB &7F," ","#","M","N","B" RET
;				8 	Kempson

endif


;bit0 Up
;bit1 Down
;bit2 Left
;bit3 Right
;bit4 1st fire or LMB
;bit5 2nd fire or RMB
;bit6 3rd fire or MMB
;bit7 0

;F990 = Port A Actions bits
;F991 = Port B Actions bits

;Joystick keys
;KeyMap:
;defb &FE,&09 ;Up
;defb &FD,&09 ;Down
;defb &FB,&09 ;Left
;defb &F7,&09 ;Right
;defb %11101111,&09 ;Fire1
;defb %11011111,&09 ;Fire2
;defb %11101111,&00 ;Fire3
;defb &F7,&03 ;Pause bit 20
;KeyMap2: 
;defb %11101111,&07 ;Up	13
;defb %01111111,&07 ;Down	14
;defb %01111111,&08 ;Left	15
;defb %10111111,&07 ;Right	16
;defb %11011111,&05 ;Fire1	17
;defb %11011111,&04 ;Fire2	18
;defb &7F,&05 ;Fire3	19
;defb &FF,&00 ;Pause



;This is the raw keypress data

align 8,0
Player_ScoreBytes defb &00,&00,&00,&00,&00,&00,&00,&00	; Player 2 current score
Player_ScoreBytes2 defb &00,&00,&00,&00,&00,&00,&00,&00	; Player 1 current score
		    ;25
HighScoreBytes defb    &00,&00,&00,&00,&00,&00,&00,&00	; Highscore

;&80 bytes
SavedSettings_Last:

;X,X,Y,Y,S,[0,0,0] - [] not used
PlusSprites_Config1:
;These go at &6030
defb &60-&00,&02,&08,&00
defb &60-&20,&02,&08,&00
defb &60-&40,&02,&08,&00
defb &00+&00,&00,&08,&00
defb &00+&20,&00,&08,&00
defb &00+&40,&00,&08,&00
PlusSprites_Config2:
defb &00+&00,&00,&B4,&00
defb &00+&20,&00,&B4,&00
defb &00+&40,&00,&B4,&00
defb &60-&00,&02,&B4,&00
defb &60-&20,&02,&B4,&00
defb &60-&40,&02,&B4,&00




  ;	  Z change to zero
;MusicRestoredefw 0000					; pointer to the function to call to bring back the music - needed by 64k where music is wiped by firmware

;***************************************************************************************************

;					Rastercolors Aligned Code

;***************************************************************************************************

;Some template rastercolors to use for blackout (when using the screen for temp space) and continue screens and the like with basic colors


align 256,&00
DiskRemap:
ifdef DiskMap_SingleDisk
	defb 1,1,1,1,1
else
	defb 0,1,2,3,4
endif


endif
RasterColors_Safe_ForInterrupt:
	defb 1
	defb 1
RasterColors_Safe:
	defb &54,&58,&5F,&4B
RasterColors_Black_ForInterrupt:
	defb 1
	defb 1
RasterColors_Black:
	defb &54,&54,&54,&54


; These are the default memory locations for the rastercolors - note they are memory aligned - they are often overrided by the Level code
RasterColors_ColorArray1:
RasterColors_ColorArray3:
RasterColors_ColorArray4:
RasterColors_ColorArray2:
	defb 1
	defb 1
	defb 64+20,64+24,64+29,64+11


PlusRasterPalette:
defb 50	;next split
defw &0000
defw &0000
defw &0000
defw &0000
defb 100	;next split
defw &0000
defw &0000
defw &0000
defw &0000
defb 120	;next split
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
defw &0000
defw &0000
defw &0000
defw &0000
defb 0		;next split
defw &0000
defw &0000
defw &0000
defw &0000
defb 0		;next split
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



TranspColors:	; Transparent colors are used by the sprite, if the byte matches it is skipped to effect transparency without an 'alpha map'
ifdef buildZXS
	defb %01010101,%11110000,%00001111,%11001100,%11001100,%00000000
else
	defb &00,&F0,&0F,&FF,&AC,&53
endif
; Smartbomb effect shows a flashing background, these are the bytes used
Background_SmartBombColors:
defb &FF,&0,&FF,&0,&FF




;align 40,&0
; table/array for screen addresses for each scan line
ifdef MinimizeCore 
	scr_addr_tableMajor ; BYTES -XXXX--- %01111000
	defw &0000,&0050,&00A0,&00F0,&0140,&0190,&01E0,&0230,&0280,&02D0,&0320,&0370,&03C0,&0410,&0460,&04B0
	scr_addr_tableMinor ; BYTES -----XXX ; do not need aligning
	defb  &00,&08,&10,&18,&20,&28,&30,&38
endif
;RasterColors_TickerEventBlock
;	defs 10


;These are used by Arkostracker
;There are two holes in the l ist, because the Volume registers are set relatively to the Frequency of the same Channel (+7, always).
;Also, the Reg7 is passed as a register, so is not kept in the memory.
PLY_PSGRegistersArray
PLY_PSGReg0 db 0
PLY_PSGReg1 db 0
PLY_PSGReg2 db 0
PLY_PSGReg3 db 0
PLY_PSGReg4 db 0
PLY_PSGReg5 db 0
PLY_PSGReg6 db 0
PLY_PSGReg8 db 0		;+7
	    db 0
PLY_PSGReg9 db 0		;+9
	    db 0
PLY_PSGReg10 db 0		;+11
PLY_PSGReg11 db 0
PLY_PSGReg12 db 0
PLY_PSGReg13 db 0
PLY_PSGRegistersArray_End



StarsOneByteDirs:
defb &21,&09,&0C,&0F,&27,&3F,&3C,&39,&61,&49,&4c,&4f,&67,&7f,&7c,&79


Event_ReprogramVector:
defw	Event_CoreReprogram_Palette   	;0 		
defw	null;Event_CoreReprogram_PlusPalette	;1		; Obsolete - Reserver for Plus Palette
defw	Event_CoreReprogram_ObjectHitHandler ;2
defw	Event_CoreReprogram_ShotToDeath	;3
defw	Event_CoreReprogram_CustomMove1 ;4
defw	Event_CoreReprogram_CustomMove2 ;5
defw	Event_CoreReprogram_PowerupSprites ;6
defw	Event_CoreReprogram_CustomMove3	;7
defw	Event_CoreReprogram_CustomMove4 ;8
defw    Event_CustomProgram1		;9
defw    Event_CustomProgram2		;10
defw    Event_CustomPlayerHitter		;11
defw    Event_CustomSmartBomb		;12
defw    Event_ReprogramObjectBurstPosition	;13
defw    Event_ObjectFullCustomMoves	;14
defw    Event_SmartBombSpecial		;15



Event_MoveVector:				;128+
defw Event_MoveLifeSwitch_0000		;0
defw Event_ProgramSwitch_0001		;1
defw Event_LifeSwitch_0010		;2
defw Event_MoveSwitch_0011		;3
defw Event_ProgramMoveLifeSwitch_0100	;4
defw Event_SpriteSwitch_0101		;5
defw Event_AddFront_0110		;6
defw Event_AddBack_0111			;7
defw Event_ChangeStreamTime_1000	;8
defw Event_Call_1001			;9
defw Event_LoadLastAddedObjectToAddress_1010;10
defw Event_ClearPowerups		;11
defw Event_ChangeStreamSpeed_1100	;12
defw Event_SpriteSizeSwitch_1101	;13
defw Event_AnimatorSwitch_1110		;14
defw Event_CoreReprogram_AnimatorPointer ;15


; These are the jump-pointes used by the raster color interrupt routine - to try to save time only one byte is altered, so it must be byte aligned!


Event_VectorArray:

defw	Event_OneObj	;0
defw 	Event_MultiObj	;16
defw	Event_ObjColumn	;32
defw 	Event_ObjStrip	;48
defw	Event_StarBust	;64
defw 	null	;80
defw 	null	;96
defw	Event_CoreMultipleEventsAtOneTime	;112
defw	Event_MoveSwitch	;128
defw	Event_CoreSaveLoadSettings	;144
defw 	null;Event_MoveSwitchMore		;160
defw 	Event_CoreSaveLoadSettings2	;176
defw 	null		;192
defw 	null		 ;208
defw 	null		;224
defw	Event_CoreReprogram	;240

ifdef buildCPC
	read "..\srcCPC\Akuyou_CPC_InterruptHandler.asm"
endif
ifdef buildENT	
	read "..\srcENT\Akuyou_ENT_InterruptHandler.asm"
endif
ifdef buildMSX
	read "..\srcMSX\Akuyou_MSX_InterruptHandler.asm"
endif
ifdef buildZXS
	read "..\srcZX\Akuyou_Spectrum_InterruptHandler.asm"
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; End of aligned code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PLY_FrequencyTable
ifdef buildCPC

	dw 3822,3608,3405,3214,3034,2863,2703,2551,2408,2273,2145,2025
	dw 1911,1804,1703,1607,1517,1432,1351,1276,1204,1136,1073,1012
	dw 956,902,851,804,758,716,676,638,602,568,536,506
	dw 478,451,426,402,379,358,338,319,301,284,268,253
	dw 239,225,213,201,190,179,169,159,150,142,134,127
	dw 119,113,106,100,95,89,84,80,75,71,67,63
	dw 60,56,53,50,47,45,42,40,38,36,34,32
	dw 30,28,27,25,24,22,21,20,19,18,17,16
	dw 15,14,13,13,12,11,11,10,9,9,8,8
	dw 7,7,7,6,6,6,5,5,5,4,4,4
	dw 4,4,3,3,3,3,3,2,2,2,2,2
	dw 2,2,2,2,1,1,1,1,1,1,1,1
endif
ifdef buildENT
	dw 4095,4095,4095,4095,4095,3822,3608,3214,2863,2551,2273,2025
;	dw 3822,3608,3405,3214,3034,2863,2703,2551,2408,2273,2145,2025
	dw 1911,1804,1703,1607,1517,1432,1351,1276,1204,1136,1073,1012
	dw 956,902,851,804,758,716,676,638,602,568,536,506
	dw 478,451,426,402,379,358,338,319,301,284,268,253
	dw 239,225,213,201,190,179,169,159,150,142,134,127
	dw 119,113,106,100,95,89,84,80,75,71,67,63
	dw 60,56,53,50,47,45,42,40,38,36,34,32
	dw 30,28,27,25,24,22,21,20,19,18,17,16
	dw 15,14,13,13,12,11,11,10,9,9,8,8
	dw 7,7,7,6,6,6,5,5,5,4,4,4
	dw 4,4,3,3,3,3,3,2,2,2,2,2
	dw 2,2,2,2,1,1,1,1,1,1,1,1
endif
ifdef buildMSX
;	wsx turbo needs this:

;	ld hl,PLY_FrequencyTable+144-12
;	ld de,PLY_FrequencyTable+144
;	ld bc,144-12
;	lddr

	dw 4095,4095,4095,4060,4060,4030,4030,4000,3950,3900,3804,3591
	dw 3389,3199,3019,2850,2690,2539,2397,2262,2135,2015,1902,1795
	dw 1695,1599,1510,1425,1345,1270,1198,1131,1068,1008,951,898
	dw 847,800,755,712,673,635,599,566,534,504,476,449
	dw 424,400,377,356,336,317,300,283,267,252,238,224
	dw 212,200,189,178,168,159,150,141,133,126,119,112
	dw 106,100,94,89,84,79,75,71,67,63,59,56
	dw 53,50,47,45,42,40,37,35,33,31,30,28
	dw 26,25,24,22,21,20,19,18,17,16,15,14
	dw 13,12,12,11,11,10,9,9,8,8,7,7
	dw 7,6,6,6,5,5,5,4,4,4,4,4
	dw 3,3,3,3,3,2,2,2,2,2,2,2
endif

ifdef buildZXS
				ifndef buildZXS_Pentagon
					dw 4095,4095,4095,4095,4095,4095,4095,4095,4095,4030,3804,3591
					dw 3389,3199,3019,2850,2690,2539,2397,2262,2135,2015,1902,1795
					dw 1695,1599,1510,1425,1345,1270,1198,1131,1068,1008,951,898
					dw 847,800,755,712,673,635,599,566,534,504,476,449
					dw 424,400,377,356,336,317,300,283,267,252,238,224
					dw 212,200,189,178,168,159,150,141,133,126,119,112
					dw 106,100,94,89,84,79,75,71,67,63,59,56
					dw 53,50,47,45,42,40,37,35,33,31,30,28
					dw 26,25,24,22,21,20,19,18,17,16,15,14
					dw 13,12,12,11,11,10,9,9,8,8,7,7
					dw 7,6,6,6,5,5,5,4,4,4,4,4
					dw 3,3,3,3,3,2,2,2,2,2,2,2
				else
					dw 4095,4095,4095,4095,4095,4095,4095,4095,4095,3977,3754,3543
					dw 3344,3157,2980,2812,2655,2506,2365,2232,2107,1989,1877,1772
					dw 1672,1578,1490,1406,1327,1253,1182,1116,1053,994,939,886
					dw 836,789,745,703,664,626,591,558,527,497,469,443
					dw 418,395,372,352,332,313,296,279,263,249,235,221
					dw 209,197,186,176,166,157,148,140,132,124,117,111
					dw 105,99,93,88,83,78,74,70,66,62,59,55
					dw 52,49,47,44,41,39,37,35,33,31,29,28
					dw 26,25,23,22,21,20,18,17,16,16,15,14
					dw 13,12,12,11,10,10,9,9,8,8,7,7
					dw 7,6,6,5,5,5,5,4,4,4,4,3
					dw 3,3,3,3,3,2,2,2,2,2,2,2
				endif
endif



ifdef buildCPC
	ifdef CPC320
		read "..\srcCpc\Akuyou_CPC_VirtualScreenPos_320.asm"
	else
		read "..\srcCpc\Akuyou_CPC_VirtualScreenPos_256.asm"
	endif
	read "..\SrcCPC\Akuyou_CPC_ShowSprite.asm"
endif

ifdef buildENT
	ifdef CPC320
		read "..\srcCpc\Akuyou_CPC_VirtualScreenPos_320.asm"
	else
		read "..\srcCpc\Akuyou_CPC_VirtualScreenPos_256.asm"
	endif
	read "..\SrcENT\Akuyou_ENT_ShowSprite.asm"
endif
ifdef buildZXS
	read "..\srcZX\Akuyou_Spectrum_VirtualScreenPos_256.asm"
	read "..\SrcZX\Akuyou_Spectrum_ShowSprite.asm"
	read "..\SrcZX\Akuyou_Spectrum_RLE.asm"
endif
ifdef buildMSX
	read "..\srcMSX\Akuyou_MSX_VirtualScreenPos_256.asm"
ifdef buildMSX_V9K
	read "..\SrcMSX\Akuyou_MSX_VDP_9K.asm"
else
	read "..\SrcMSX\Akuyou_MSX_VDP.asm"
endif

	read "..\SrcMSX\Akuyou_MSX_RLE.asm"
	read "..\SrcMSX\Akuyou_MSX_ShowSprite.asm"
endif

read "..\SrcAll\Akuyou_Multiplatform_Stararray.asm"
read "..\SrcAll\Akuyou_Multiplatform_Stararray_Add.asm"
read "..\SrcAll\Akuyou_Multiplatform_DoMoves.asm"


;;;;;;;;;;;;;;;;;;;;Input Driver;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	read "..\srcCPC\Akuyou_CPC_KeyboardDriver.asm"
endif
ifdef buildENT
	read "..\srcENT\Akuyou_ENT_KeyboardDriver.asm"
endif
ifdef buildMSX
	read "..\srcMSX\Akuyou_MSX_KeyboardDriver.asm"
endif
ifdef buildZXS
	read "..\srcZx\Akuyou_Spectrum_KeyboardDriver.asm"
endif
;;;;;;;;;;;;;;;;;;;;Disk Driver;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildCPC
	read "..\srcCPC\Akuyou_CPC_DiskDriver.asm"
endif
ifdef buildENT
	read "..\srcENT\ENT_V1_DiskDriver.asm"
	read "..\srcALL\Akuyou_Multiplatform_FileLoader.asm"
endif
ifdef buildZXS
	read "..\srcALL\Akuyou_Multiplatform_FileLoader.asm"
	read "..\SrcZX\Akuyou_Spectrum_DiskDriver.asm"
endif
ifdef buildMSX
	read "..\srcALL\Akuyou_Multiplatform_FileLoader.asm"
	read "..\SrcMSX\Akuyou_MSX_DiskDriver.asm"
endif


ifdef buildCPC
	read "..\srcCPC\Akuyou_CPC_ExecuteBootstrap.asm"
endif

ifdef buildENT
	read "..\srcENT\Akuyou_ENT_ExecuteBootstrap.asm"
endif
ifdef buildMSX
	read "..\srcMSX\Akuyou_MSX_ExecuteBootstrap.asm"
endif
ifdef buildZXS
	read "..\srcZX\Akuyou_Spectrum_ExecuteBootstrap.asm"
endif

ifdef buildCPC
	read "..\SrcCPC\Akuyou_CPC_TextDriver.asm"
endif
ifdef buildENT
	read "..\SrcENT\Akuyou_ENT_TextDriver.asm"
endif
ifdef buildZXS
	read "..\SrcZX\Akuyou_Spectrum_TextDriver.asm"
endif
ifdef buildMSX
	read "..\SrcMSX\Akuyou_MSX_TextDriver.asm"
endif

read "..\SrcAll\Akuyou_Multiplatform_SFX.asm"



ifdef buildENT
	read "..\SrcENT\Akuyou_ENT_CompiledSpriteViewer.asm"	;also includes CLS
	read "..\SrcENT\Akuyou_ENT_BankSwapper.asm"
endif
ifdef buildCPC
	read "..\SrcCPC\Akuyou_CPC_CompiledSpriteViewer.asm"	;also includes CLS
	read "..\SrcCPC\Akuyou_CPC_BankSwapper.asm"
endif
ifdef buildZXS
	read "..\srcZX\Akuyou_Spectrum_Bankswapper.asm"
endif
ifdef buildMSX
	read "..\srcMSX\Akuyou_MSX_Bankswapper.asm"
endif

read "..\SrcAll\Akuyou_Multiplatform_PlayerDriver.asm"

read "..\SrcAll\Akuyou_Multiplatform_Timer.asm"


ifdef buildENT
	read "..\SrcENT\Akuyou_ENT_Gradient.asm"
endif
ifdef buildCPC
	read "..\SrcCPC\Akuyou_CPC_Gradient.asm"
endif
ifdef buildZXS
	read "..\SrcZX\Akuyou_Spectrum_Gradient.asm"
endif
ifdef buildMSX
	read "..\SrcMSX\Akuyou_MSX_Gradient.asm"
endif



read "..\SrcAll\Akuyou_Multiplatform_ObjectDriver.asm"
read "..\SrcALL\Akuyou_Multiplatform_EventStream.asm"
ifdef buildCPC
	read "..\SrcCPC\Akuyou_CPC_CpcPlus.asm"
endif
read "..\SrcALL\Akuyou_Multiplatform_ArkosTrackerLite.asm"


ifdef buildZXS
	testloop:
		ld a,7
		call Bankswapper_SetCurrent
	pauser:
		call Akuyou_Timer_UpdateTimer
		call Akuyou_CLS			; Background render
;		call Akuyou_EventStream_Process
;		call Akuyou_ObjectArray_Redraw
		call Akuyou_Player_Handler
		call Akuyou_StarArray_Redraw
		call AkuYou_Player_StarArray_Redraw
		call AkuYou_Player_DrawUI
		call Akuyou_PlaySfx
		call ScreenBuffer_Flip
		ei
		halt

jp pauser
endif


ifdef buildCPC
	read "..\SrcCPC\Akuyou_CPC_ScreenMemory.asm"
endif
ifdef buildZXS
	read "..\SrcZX\Akuyou_Spectrum_ScreenMemory.asm"
endif
ifdef buildMSX
	read "..\SrcMSX\Akuyou_MSX_ScreenMemory.asm"

	read "..\SrcMSX\Akuyou_MSX_BackgroundTile.asm"
endif
	read "..\SrcAll\Akuyou_Multiplatform_AkuCommandVectorArray.asm"



ifdef buildZXS		;These are in the core on the Speccy to avoid contention - the cpc has no room for them!
	read "CoreBackground_SolidFill.asm"
	read "CoreBackground_QuadSprite.asm"
	read "CoreBackground_bitshifter.asm"
	read "CoreBackground_GetSpriteMemPos.asm"
endif

ifdef BuildENT
	read "..\SrcENT\Akuyou_ENT_GPU.asm"
	read "..\SrcENT\ENT_AY_Emulator.asm"
endif

ifdef buildENT
	read "..\SrcENT\Akuyou_ENT_ScreenMemory.asm"
endif
ifdef Debug_Monitor
;	read "..\SrcALL\Multiplatform_Monitor.asm"
;	read "..\SrcALL\Multiplatform_MonitorMemdump.asm"
;	read "..\SrcALL\Multiplatform_MonitorSimple.asm"
endif

list
Null:ret
FileEndCore:
ifdef buildCPC
	save direct "CORE    .AKU",Akuyou_CoreStart,&3000	;address,size...}[,exec_address]
endif