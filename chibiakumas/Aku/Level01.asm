 ;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
;replace ldia 

nolist

BuildLevel equ 1	;We're building a level!
Read "..\Aku\Build.asm"


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildENT
	write "..\BldENT\T10-SC1.D01"
endif
ifdef buildZXS
	write "..\BldZX\Level01.bin"
endif 
ifdef buildMSX
	write "..\ResMSX\T10-SC1.D01"
;	db &FE     ; magic number
;	dw FileBeginLevel    ; begin address
;	dw FileEndLevel - 1  ; end address
;	dw FileBeginLevel;Execute  ; program execution address (for ,R option)
endif
org Akuyou_LevelStart
list
;;;;;;;;;;;;;;;;;;; Sprite data must be at top of level code block
FileBeginLevel:
	if buildCPCv+buildENTv
		incbin "..\ResCPC\LEVEL1A.SPR"
	endif

	ifdef buildZXS
		incbin "..\ResZX\LEVEL1A.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL1A.MAP"
		MSXTiles:
			incbin "..\ResMSX\Level01-Tiles.RLE"
		MSXTiles_End:

	endif



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Animators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AnimatorPointers:
	defw AnimatorData
AnimatorData:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000010		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb 01,128+01,0,0		;Sprite Anim
	defb 01,128+02,0,0		;Sprite Anim
	defb 00				;End of loop	



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Data Allocations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event_SavedSettingsB:	;2nd bank Saved settings array
	defs 128,&00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					EVENT STREAM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static


;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0

defb 0,evtReprogram_PowerupSprites,128+38,128+39,128+40,128+16	; Define powerup sprites

defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,0	
								; Save Object settings to Bank 0
defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,1				; Save Object settings to Bank 1

; Rock Chick
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%01100000+11,&22,%11000000+1	; Program - Fire Burst... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,128+	1			; Sprite 1 Frame animater
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,2				; Save Object settings to Bank 2


;defb 0,evtMultipleCommands+3			; 3 commands at the same timepoint
;defb 	evtSetProgMoveLife ,%01100000+11,&22,%11000000+4	; Program - Burst left slow... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
;defb 	evtSetSprite,128+	1			; Sprite 1 Frame animater
;defb 	evtSettingsBank_Save,2				; Save Object settings to Bank 2

; Skull bomber
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%00100000+22,&23,%11000000+4	; Program - Fire Down Fast... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,128+	37			; Sprite 1 Frame animater
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,3				; Save Object settings to Bank 2

; Ant Attacker
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%01100000+1,&23,%11000000+4	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+	0			; Sprite 1 Frame animater
defb 	evtSettingsBank_Save,4				; Save Object settings to Bank 2

; Skeleton Crawler
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%10000000+11,&22,%11000000+3	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+	36			; Sprite 1 Frame animater
defb 	evtSettingsBank_Save,5				; Save Object settings to Bank 5

; SpliceFace
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%10000000+13,&25,%11000000+4	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+	34			; Sprite 1 Frame animater
defb 	evtSettingsBank_Save,6				; Save Object settings to Bank 6

; BoniBurd
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%10000000+2,&22,%11000000+3	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+	2			; Sprite 1 Frame animater
defb 	evtSettingsBank_Save,7	

; Skull Gang
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%00100000+16,%10100001,%11000000+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+	35			; Sprite 1 Frame animater
defb 	evtSettingsBank_Save,8	

; Eyeclopse
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife ,%01100000+11,%10101100,%11000000+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+	7			; Sprite 1 Frame animater
defb 	evtSettingsBank_Save,9	

;Add To Background
defb 0,134			



;defb 0,128+1,1				; Program / bitshift sprite
;moon
;defb 0,128,%11001000,0			; Move 	  / dir Left Slow ... Life - immortal
defb 0,evtSetProgMoveLife ,1,%11001000,0			; Program - Bitshift Sprite... Move - dir Left Slowest ... Life - immortal
defb 0,0,	3,24+ 160 -16 ,24+ 8		; single sprite


;Castle

ifdef BuildZXS
	defb 0,evtSetMoveLife ,%11000010,0			; Move 	  / dir Left Slow ... Life - immortal
	defb 0,0,	4,24+ 120  ,24+ 60		; single sprite
endif

if BuildCPCv+BuildENTv
	defb 0,evtSetMoveLife ,%11000010,0			; Move 	  / dir Left Slow ... Life - immortal
	defb 0,0,	4,24+ 120  ,24+ 50		; single sprite
endif
ifdef BuildMSX
	defb 0,evtSetMoveLife ,%11000010,0			; Move 	  / dir Left Slow ... Life - immortal
	defb 0,0,	4,24+ 120  ,24+ 40		; single sprite
endif



defb 0,0,	14,24+ 100  ,24+ 40+80		; single sprite
ifndef buildZXS
	defb 0,0,	15,24+ 152  ,24+ 40+80		; single sprite
endif

defb 0,0,	13,24+ 90  ,24+ 40+100		; single sprite
defb 0,0,	13,24+ 162  ,24+ 40+100		; single sprite

;Burning bloke
defb 0,evtMultipleCommands+3			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	129,0					; Change to program 0 (normal)
defb 	0,128+	11,50+24,90+24	; 	; Single Object sprite 11 (animated)





;Clouds (3 wide)
defb 0,evtMultipleCommands+6			; 2 commands at the same timepoint
defb 	evtAddToBackground
defb 	evtSetProgMoveLife ,0,%11000100,0			; Move 	  / dir Left Slow ... Life - immortal
defb 	0, 41,159+24,10+28	; 	; Single Object / 
defb 	0, 42,159+24+12,10+28	; 	; Single Object / 
defb 	0, 43,159+24+24,10+28	; 	; Single Object / 
defb 	evtAddToForeground




;Spikeyrock
defb 0,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank 0
defb 	48+   2   ,24+ 100,24+24+ 128,24,		8,9 ; Three sprites, 
;defb 	0,	8 ,24+ 110  ,24+ 128		; single sprite
;defb 	0,	9 ,24+ 110  ,24+ 128+24		; single sprite
;defb 	0,	10,24+ 110  ,24+ 128+24+24	; single sprite

;defb 1,128,%10000111,0+0+2		; Seeker / Life 60, hurts player (64) and Hit by bullets (128)

;defb 1,0,	128+01,110,110	; 
;defb 3,0,	128+01,100,100

;defb 5,128,&1c,128+64+ 64			; Move dir up


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 				Start of fade in block 

FadeStartPoint equ 0	;Start of fade point
			; Fade lasts two timers - ends FadeStartPoint+2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildZXS
	defb FadeStartPoint+0,evtCallAddress
	defw	 setSpectrumFadeBlue

	defb FadeStartPoint+1,evtCallAddress
	defw	 SetSpectrumFadeDark

	defb FadeStartPoint+2,evtCallAddress
	defw	 SetSpectrumFadeOff
endif


ifdef buildMSX
	defb FadeStartPoint+1,evtCallAddress
	defw	 EnableFader
endif

if BuildCPCv+BuildENTv
	defb FadeStartPoint+1,evtCallAddress
	defw	 EnablePlusPalette


	;BLUE COLORS - 6128
	defb FadeStartPoint+1,evtMultipleCommands+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&44,&40	

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&44,&40		

	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40			




	;REAL LEVEL PALETTE

	defb FadeStartPoint+2,evtMultipleCommands+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&55,&4A,&4B		;Black,DkBlue,LtYellow,White

	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 16	;delay			
	defb &54,&5D,&59,&4B
	defb 16	;delay			
	defb &54,&58,&5F,&4B



	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2 ; no of switches
	defb 0	;delays			
	defb &54,&58,&53,&4B		;Black,Red,Grey,White
	defb 32
	defb &54,&4C,&53,&4B	 ;5b	
		

	defb FadeStartPoint+2,evtCallAddress
	defw RasterColorsStartPalleteFlip
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; rock chick enemy
defb 5,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite

;defb 5,128+1,%00100000+10			; Starbursts
;defb 5,0,	128+01,150,24+180	

;defb 6,128+1,1				; Program / bitshift sprite
;defb 6,128,%11001000,0			; Move 	  / dir Left Slow ... Life - immortal
;defb 6,128,%11100000,0			; Move 	... Life - immortal
;defb 6,0,	04,110,110	; 	; Single Object / 

; Rock Pt 1
defb 10,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank 0
defb 	0,	22,160+24,172+28	; 	; Single Object / 

;Cross
defb 13,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	0,17,160+24,110+24	; 	; Single Object sprite 11 (animated)


; rock chick enemy
defb 15,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite


; Rock Pt 2
defb 16,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank 0
defb 	0,	23,160+24,172+28	; 	; Single Object / 

; Powerup Rate
defb 17,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife ,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	0,128+ 39,160+24,50+24	; 	; Single Object sprite 11 (animated)


;ifdef buildCPC
;	defb 20,evtCallAddress
;	defw FadeOutTest
;endif


; Rock Pt 3
defb 22,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank 0
defb 	0,	24,160+24,172+28	; 	; Single Object / 


; Powerup Fire
;defb 23,evtMultipleCommands+2			; 2 commands at the same timepoint
;defb 	evtSetProgMoveLife ,3,&22,64+8	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
;defb 	0,128+ 40,160+24,50+24	; 	; Single Object sprite 11 (animated)


;animator test

;defb 25,evtSetAnimatorPointers
;defw	AnimatorPointers
;defb 25,evtSetAnimator,1


; rock chick enemy
defb 25,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite

;; rock chick enemy
defb 30,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite

; rock chick enemy
defb 35,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite

;Cross
defb 40,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	0,18,160+24,85+24	; 	; Single Object sprite 11 (animated)




;Skull Bomber
defb 45,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+3				; Load Settings from bank 3
defb 	0+3				; Row 16, last Column, Last Sprite

;Ant
defb 45,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 4
defb 	0+12				; Row 16, last Column, Last Sprite



;Burning bloke
defb 55,evtMultipleCommands+3			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	129,0					; Change to program 0 (normal)
defb 	0,128+	11,160+24,90+24	; 	; Single Object sprite 11 (animated)



; Boniburd
defb 65,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 5
defb 	evtSingleSprite,TwoFrameSprite+	2,160+24-24,24+16

;  SpikyRock
defb 67,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank 0
defb 	48+   3   ,160+24,24+ 128,24,		8,9,10 ; Three sprites, 

; rock enemy
;defb 70,evtMultipleCommands+3			; 2 commands at the same timepoint
;defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
;defb 	0+6				; Row 16, last Column, Last Sprite
;defb 	0+10				; Row 16, last Column, Last Sprite

; rock chick enemy
defb 75,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite

; rock chick enemy
defb 80,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite


; boniburd
defb 84,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 5
defb 	evtSingleSprite,TwoFrameSprite+	2,160+24-24,24+16

;Skeleton walker
defb 85,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+5				; Load Settings from bank 5
defb 	0+13				; Row 16, last Column, Last Sprite



;Cross
defb 88,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	0,18,160+24,85+24	; 	; Single Object sprite 11 (animated)


; Powerup Drone
defb 90,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife ,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	0,128+ 38,160+24,150+24	; 	; Single Object sprite 11 (animated)



;Grave
defb 95,evtMultipleCommands+2		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank
defb 	0,21,160+24,170+24	; 	; Single Object sprite 11 (animated)

; SpliceFace
defb 100,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+6				; Load Settings from bank 6
defb 	0,128+34,24,100+24	; 	; Single Object / 



; rock chick enemy
defb 110,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite

; rock chick enemy
defb 115,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite


;Clouds (3 wide)
defb 120,evtMultipleCommands+4			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife ,0,%11000100,0			; Move 	  / dir Left Slow ... Life - immortal
defb 	0, 41,159+24,10+28	; 	; Single Object / 
defb 	0, 42,159+24+12,10+28	; 	; Single Object / 
defb 	0, 43,159+24+24,10+28	; 	; Single Object / 



; rock chick enemy
defb 120,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite

;Grave
defb 122,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank
defb 	0,21,160+24,170+24	; 	; Single Object sprite 11 (animated)

; rock chick enemy
defb 125,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite

; rock chick enemy
defb 127,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite


;Burning bloke
defb 129,evtMultipleCommands+3			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	129,0					; Change to program 0 (normal)
defb 	0,128+	11,160+24,90+24	; 	; Single Object sprite 11 (animated)


; rock chick enemy
defb 130,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite

; rock chick enemy
defb 135,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite



;Cross
defb 140,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	0,19,160+24,103+24	; 	; Single Object sprite 11 (animated)

; SpliceFace
defb 150,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+6				; Load Settings from bank 6
defb 	0,128+34,24,100+24	; 	; Single Object / 

; Powerup Drone
defb 150,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife ,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	0,128+ 38,160+24,150+24	; 	; Single Object sprite 11 (animated)



; Eyeclopse s
defb 160,evtMultipleCommands+4			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+9				; Load Settings from bank 5
defb 	0+7	
defb 	131,%10101111				; change Move
defb 	0+12	


; rock chick enemy
defb 165,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite



;Grave
defb 167,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank
defb 	0,20,160+24,173+24	; 	; Single Object sprite 11 (animated)


; rock chick enemy
defb 170,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+8				; Row 16, last Column, Last Sprite


; Eyeclopse s
defb 180,evtMultipleCommands+4			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+9				; Load Settings from bank 5
defb 	0+7	
defb 	131,%10101111				; change Move
defb 	0+12	

;Cross
defb 185,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	0,19,160+24,107+24	; 	; Single Object sprite 11 (animated)


; Skull Gang
defb 190,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+8				; Load Settings from bank 5
defb 	0+7	


;Clouds (3 wide)
defb 200,evtMultipleCommands+4			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife ,0,%11000100,0			; Move 	  / dir Left Slow ... Life - immortal
defb 	0, 41,159+24,10+28	; 	; Single Object / 
defb 	0, 42,159+24+12,10+28	; 	; Single Object / 
defb 	0, 43,159+24+24,10+28	; 	; Single Object / 



; rock chick enemy
defb 200,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	0+6				; Row 16, last Column, Last Sprite
defb 	0+10				; Row 16, last Column, Last Sprite


; boniburd
defb 220,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 5
defb 	evtSingleSprite,TwoFrameSprite+	2,160+24-24,24+16

;Skeleton walker
defb 220,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+5				; Load Settings from bank 5
defb 	0+13				; Row 16, last Column, Last Sprite


;Grave
defb 221,evtMultipleCommands+2			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+0				; Load Settings from bank
defb 	0,20,160+24,176+24	; 	; Single Object sprite 11 (animated)


;Skull Bomber
defb 225,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+3				; Load Settings from bank 3
defb 	0+3				; Row 16, last Column, Last Sprite

;Ant
defb 225,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 4
defb 	0+12				; Row 16, last Column, Last Sprite




; SpliceFace
defb 230,evtMultipleCommands+4			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+6				; Load Settings from bank 6
defb    %10000011,&23			; Change Move
defb 	0,128+34,24,50+24	; 	; Single Object / 
defb 	0,128+34,24,150+24	; 	; Single Object / 



; SpliceFace
defb 232,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+6				; Load Settings from bank 6
defb 	0,128+34,24,50+24	; 	; Single Object / 
defb 	0,128+34,24,150+24	; 	; Single Object / 


;Skull Bomber
defb 235,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+3				; Load Settings from bank 3
defb 	0+3				; Row 16, last Column, Last Sprite

;Ant
defb 235,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 4
defb 	0+12				; Row 16, last Column, Last Sprite

;Skull Bomber
defb 245,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+3				; Load Settings from bank 3
defb 	0+3				; Row 16, last Column, Last Sprite

;Ant
defb 245,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 4
defb 	0+12				; Row 16, last Column, Last Sprite



defb 250,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife ,0,%11000100,0			; Move 	  / dir Left Slow ... Life - immortal
defb 	0, 43,160+24,10+28	; 	; Single Object / 



defb 5,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change
LevelEndAnim:
defb 5,evtMultipleCommands+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,128+	47,140+24,100+24	; 	; Single Object sprite 11 (animated)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 5
;				Start of fade out block
;				Fade out ends at FadeutStart+2, eg if FadeOut=5 then ends at 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ifdef buildZXS

	defb FadeOutStartPoint+1,evtCallAddress
	defw	 SetSpectrumFadeDark


	defb FadeOutStartPoint+2,evtCallAddress
	defw	 setSpectrumFadeBlue

endif

ifdef BuildMSX
	defb FadeOutStartPoint,evtCallAddress
	defw 	FadeOut
endif

if BuildCPCv+BuildENTv
	;CPC Plus
	defb FadeOutStartPoint,evtCallAddress
	defw 	FadeOut

	;Blue 6128

	defb FadeOutStartPoint+1,evtMultipleCommands+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&44,&40	

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&44,&40		

	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40			



	;Black 6128
	defb FadeOutStartPoint+2,evtMultipleCommands+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54		
endif



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade out block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




defb 8,evtCallAddress			;Call a memory location
defw	EndLevel





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Level Init

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


LevelInit:



	ifdef buildMSX

		ld a,5						;get TilePos for MSX2 tiles
		call Akuyou_VDP_CommandNum
		ld (MSX_MainTilepos_Plus2-2),hl
		ld (MSX_MainTileposB_Plus2-2),hl
		push hl
		pop iy

		ld hl,MSXTiles					;Copy the background tiles into vram
		ld de,MSXTiles_End
		ld bc,MSXTiles_End-MSXTiles	
		ld ix,&0000
		call Akuyou_VDP_RLEProcessorFromMemory	

		ld hl,PaletteInit
		call Akuyou_VDP_SetPalette
	endif

	call AkuYou_Player_GetPlayerVars
if BuildCPCv+BuildENTv	; Turn on CPC raster flipping if allowed

		ld a,(iy-5)
		ld hl,null
		cp 64
		jp nz,LevelInitUsingRasterFlip
		ld (DisablePaletteSwitcher_Plus2-2),hl
	LevelInitUsingRasterFlip:
		call RasterColorsSetPalette1
	endif 



	ifdef buildMSX	; Find out if we've got a V9990, and choose aproporiate MSX background render
		ld hl,Background_DrawB
		bit 0,(iy-1)
		jr z,SetBackRegular
		ld hl,MSX2V9990
	SetBackRegular:
		ld (BackgroundRender_Plus2-2),hl
	endif


	ifdef buildZXS

		di
		ld hl,ZXS_CopiedBlockStart
		ld d,h
		ld e,l
		ld bc,&0800
		ld IXH,7
		ld IXL,Akuyou_LevelStart_Bank
		call Akuyou_Bankswapper_Copy
		ei
	endif

	ld hl,EventStreamArray		;Event Stream
	ld de,Event_SavedSettingsB	;Saved Settings bank 2
	call AkuYou_Event_StreamInit

	;;;;;;;;;;;;;;;;;;;;;; Restart the Music ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ifdef buildZXS
		ld a,6
		ld hl,Akuyou_Music_Restart
		call Akuyou_Bankswapper_CallHL
	else
		call Akuyou_Music_Restart
	endif
	
	call Akuyou_ScreenBuffer_Init

	ifdef buildCPC				;Must occur after Screenbuffer init - set nextline code for CPC
	;	ld (BackgroundFloodFillQuad_Minus1+1),hl
		ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
		ld (BackgroundSolidFillNextLine_Minus1+1),hl
	endif
	call Akuyou_Interrupt_Init	
	


	

;	push iy
;	pop hl
;	ld de,-6
;	add hl,de
;	ld (TimerPos_Plus2-2),hl



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Level Loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LevelLoop:


ifdef buildZXS
	ld a,7	
	ld hl,Background_Draw
	call Akuyou_Bankswapper_CallHL
else
	call Background_Draw
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



ifdef buildZXS
	ld a,7	
	ld hl,Akuyou_StarArray_Redraw
	call Akuyou_Bankswapper_CallHL
else
	call Akuyou_StarArray_Redraw
endif



ifdef buildMSX
	call Background_DrawMsx2
endif


ifdef buildZXS
	ld a,7	
	ld hl,AkuYou_Player_DrawUI
	call Akuyou_Bankswapper_CallHL
else
	call AkuYou_Player_DrawUI
endif
	call Akuyou_PlaySfx




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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	call Akuyou_ScreenBuffer_Flip
ifdef buildCPC
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl

endif 



ifdef buildZXS
	ei
	xor a
	call Akuyou_INT_Force
endif

	jp LevelLoop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;			Level Shutdown code


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ClearBadguys:
	ifdef buildCPC
		ld a,64
		ld (PaletteNo_Plus1-1),a	; turn off the alternate palette
	endif

	ld a,1
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret


EndLevel:
	pop hl	;
	ld hl,	&0102 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

 ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Level specific code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	


ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
endif
if BuildCPCv+BuildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
	read "CoreBackground_SolidFill.asm"
	read "CoreBackground_QuadSprite.asm"
	read "CoreBackground_bitshifter.asm"
	read "CoreBackground_GetSpriteMemPos.asm"
endif
;read "CoreBackground_Quad.asm"
;read "CoreBackground_TileArray.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 		This block is copied to bank 7 on the speccy, and contains graphics for the background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if BuildCPCv+BuildENTv
		align 256
	LevelTiles:
		incbin "..\ResCPC\Level01-Tiles.SPR"
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level01-Tiles.TSP"

	read "..\SrcZX\Akuyou_Spectrum_Level_GenericFader.asm"		;Must be within the copied block
endif




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Generic Background Begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Background_Draw: 

	ld a,0	;0=left 1=right ;2=static
	call Akuyou_Background_GradientScroll

	call Akuyou_Timer_UpdateTimer


ifndef BuildMSX
	push af	; need to keep the smartbomb color


if BuildCPCv+BuildENTv
			call Akuyou_Timer_GetTimer
			ld (BitshifterTicksOccured_Plus1-1),a
		endif

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
if BuildCPCv+BuildENTv
			ifdef CPC320
				ld l,&4F+1
			else
				ld l,&40
			endif
		endif
		ifdef buildZXS
			ld l,&1F	;intentionaly one too low - to avoid problems with nextline on byte boundaries
		endif 
	pop af

endif
	or a
	jp nz,Background_SmartBomb
	ifdef BuildMSX
		ld (Background_DrawMsx2),a	;nop to disable 2nd background
	endif
ifdef BuildZXS
	call AkuYou_Player_GetPlayerVars
	bit 2,(iy-8)
	jp nz,Background_Black

endif
	jp Background_DrawB :BackgroundRender_Plus2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				MSX2 background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildMSX
Background_DrawB: 		

	di
		ld hl,0000 :MSX_MainTilepos_Plus2
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos



		ld ix,NewGradientMSX2
		ld hl,MSXTileList
		ld de,MSXTileListV9990
		call Akuyou_Background_Tiles


		ld de,NewGradient
		ld hl,NewGradientV9990
		ld b,192
;		ld c,%11111111
		jp Akuyou_Background_Gradient

MSX2V9990:			;V9990 version
di

		ld hl,0000 :MSX_MainTileposB_Plus2
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld de,NewGradient
		ld hl,NewGradientV9990
		ld b,192
;		ld c,%11111111
		call Akuyou_Background_Gradient
ei

		ld ix,NewGradientMSX2
		ld hl,MSXTileList
		ld de,MSXTileListV9990
		call Akuyou_Background_Tiles
ret

Background_DrawMsx2:		;Foreground Paralax layer V9990 only
nop

		ld hl,Akuyou_V9K_Paralax_Y
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld hl,&0000	;V9k only
		ld de,MSXTileListForegroundV9990
		call Akuyou_Background_Tiles
ret
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 				SPECCY and CPC background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifndef buildMSX			
	GradientTopStart equ 48

Background_DrawB: 

	ld de,GradientTop
	ld b,GradientTopStart
	ld c,%11111100		;Shift on Timer Ticks

	call Akuyou_Background_Gradient





	;Bottom
	ld a,0
	ld de,LevelTiles
	ifdef buildZXS
		call Akuyou_GetSpriteMempos
	else
		call GetSpriteMempos	
	endif
	push de

		ld b,16 ;Lines

		ifdef buildZXS
			call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
		else
			call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
		endif
	
			ld de,&0000
			ld b,32
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif

	pop de
	push de

		ex hl,de		;Move down 16 lines
			ld bc,8*16
			add hl,bc
		ex hl,de
		push de

			ld b,16 ;Lines

			ifdef buildZXS
				call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			else
				call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			endif
	
	

				ld de,&0000
			ifdef CPC320
				ld b,200-48-16-32-16-8-32
			else
				ld b,192-48-16-32-16-8-32
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif


			GradientBottomStart equ 32
			ld de,GradientBottom
			ld b,GradientBottomStart
			ld c,%11111111		;Shift on Timer Ticks
			call Akuyou_Background_Gradient


		;	pop de	;Delete this after test

			

		pop de


	ex hl,de		;Move down 16 lines
		ld bc,8*16
		add hl,bc
	ex hl,de


	ld b,8 ;Lines

	ifdef buildZXS
		call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
	else
		call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
	endif
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;				Spectrum & CPC Tile Bitshifts (MSX doesn't need them)
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;ld a,1
	;ld de,LevelTiles
	;call GetSpriteMempos



	pop de ;needed to keep this for the bitshifts


	ld hl,0007 ; shift to the right of the sprite
	add hl,de
	ld a,%11111100 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,16		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif


	;must be byte aligned

	ld a,%11111110 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,16		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif

	;must be byte aligned - otherwise recalc!
;	ld a,2
;	ld de,LevelTiles
;	call GetSpriteMempos	
;	ld hl,0007 ; shift to the right of the sprite
;	add hl,de

	inc h	;Bitshifter wraps on byte align, so manually recalc, or force a move every 32 lines

	ld a,%11111111 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif

	ifdef buildZXS
		ld de,BackgroundColorMap
;		ld a,7	
;		ld hl,Akuyou_Background_Color
		call Akuyou_Background_Color
	endif

ret
endif

Background_SmartBomb:
ifdef buildMSX
	ld a,d
	and &44
	ld d,a
	ld e,d
	ld (MSxSmartBombV9990),de
	ld (MSxSmartBombV9990+2),de
	ld (MSxSmartBombColor_Plus1-1),a
	ld a,&C9
	ld (Background_DrawMsx2),a	;nop to disable 2nd background	

		ld iyl,0	;For MSX2 gradient
		ld ix,NewGradientMSX2
		ld de,MSxSmartBomb
		ld hl,MSxSmartBombV9990
		ld b,192
;		ld c,%11111111
		jp Akuyou_Background_Gradient
endif
ifndef 	buildMSX
	ld e,d
	jr Background_Fill
Background_Black:
	ld de,&0000
Background_Fill:
	ifdef CPC320
		ld b,200
	else
		ld b,192
	endif

	ifdef buildZXS
		call Akuyou_BackgroundSolidFill
		ld de,SmartBombColorMap
		jp Akuyou_Background_Color	;We are already in the right place as this is copied to screen ram
	else
		jp BackgroundSolidFill
	endif

ifdef buildZXS

;		ld a,7	

;		call Akuyou_Bankswapper_CallHL
	endif


endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					CPC Background Data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if BuildCPCv+BuildENTv
GradientTop:
	defb &F0,&F0	;1; first line
	defb GradientTopStart-10,&D0	;2; line num, New byte
	defb GradientTopStart-16,&70	;3
	defb GradientTopStart-20,&A0	;4
	defb GradientTopStart-26,&50	;5
	defb GradientTopStart-30,&80	;6
	defb GradientTopStart-36,&20	;7
	defb GradientTopStart-40,&00	;8
	defb GradientTopStart-46,&00	;9
	defb 255

GradientBottom:
	defb &0,&0	;1; first line
	defb 26,&20	;10
	defb 22,&80	;11
	defb 18,&50	;12
	defb 14,&A0	;13
	defb 10,&70	;14
	defb 6,&D0	;15
	defb 4,&F0	;15
	defb 2,&F0	;15
	defb 255
endif 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Spectrum Background Data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildZXS


GradientTop:
	defb %11111111,%11111111	;1; first line
	defb GradientTopStart-10,%11101110	;2; line num, New byte
	defb GradientTopStart-16,%01010101
	defb GradientTopStart-20,%10100010	;4
	defb GradientTopStart-26,%01001000
	defb GradientTopStart-34,%00000001
	defb GradientTopStart-40,&00	;9
	defb GradientTopStart-46,&00	;9
	defb 255

GradientBottom:
	defb &0,&0	;1; first line
	defb 26,%00010000
	defb 20,%01000100	;16
	defb 16,%10100010	;17
	defb 10,%01010101	;18
	defb 6, %11101110	;19
	defb 4, %11111111;&0F	;20
	defb 2, %11111111	;15
	defb 255


;NewGradient
;gradstart equ 0
;
;	defb %11111111,%11111111	;1; first line
;	defb gradstart-6, %11101110	;4
;	defb gradstart-12,%01010101	;5
;	defb gradstart-18,%10100010	;6
;	defb gradstart-24,%01000100	;7
;	defb gradstart-30,&00
;	defb gradstart-36,&00
;	defb 48,0
;	defb 44,%01000100	;16
;	defb 40,%10100010	;17
;	defb 36,%01010101	;18
;	defb 32,%11101110	;19
;	defb 28,%11111111;&0F	;20
;	defb 24,%11111111	;15
;	defb 20,%11101110	;15
;	defb 16,%01010101	;16
;	defb 12,%10100010	;17
;	defb 08,%01000100	;19
;	defb 04	,0	;20
;	defb 02	,0	;20
;	defb 255


SmartBombColorMap:		;Smartbomb colors (all white)
	defs 24,64+7



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Spectrum Background Colors

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BackgroundColorMap:		;Spectrum background colors (64=bright)
	defb 64+3
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 00+5
	defb 00+5
	defb 00+7
	defb 00+7
	defb 00+5
	defb 00+5
	defb 00+5
	defb 00+5
	defb 00+5
	defb 00+5
	defb 64+1
	defb 64+1
	defb 64+1
	defb 64+1
	defb 64+1
	defb 64+1
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					MSX Background Data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ifdef BuildMSX
MSxSmartBombV9990:
	defb &FF,&FF,&FF,&FF
	defb 255
MSxSmartBomb:
	defb 0,192	,%00000000,&FF :MSxSmartBombColor_Plus1
	defb 0,0

NewGradientMSX2:
defb 0
	defb &BB,&BB	,%00000000
	defb &BB,&B5	,%11111100
	defb &5B,&5B	,%11111100
	defb &B5,&55	,%11111100
	defb &55,&55	,%00000000
	defb &55,&50	,%11111100
	defb &05,&05	,%11111100
	defb &50,&00	,%11111100

defb 152
	defb &A0,&00	,%11111111
	defb &0A,&0A	,%11111111
	defb &AA,&A0	,%11111111
	defb &AA,&AA	,%00000000
	defb &7A,&AA	,%11111111
	defb &A7,&A7	,%11111111
	defb &77,&7A	,%11111111
	defb &77,&77	,%00000000
NewGradientMSX2_SB:
defb 255


NewGradient:
;	defb 0,16	,%11111100,&50
	defb 48,32	,%00000000,&00
	defb 96,56	,%00000000,&00
;	defb 160,24	,%11111111,&A0

	defb 0,0

		MsxTilesPos equ 0;
MSXTileList:
	defb 32,16
	defw 	MsxTilesPos
	defb 	%11111000,0
	defb 80,16
	defw 	MsxTilesPos+16
	defb 	%11111100,0
	defb 184,8
	defw 	MsxTilesPos+16+16
	defb 	%11111110,0
	defb 0,0

MSXTileListForegroundV9990:
	defb 192-64,64
	defw 	MsxTilesPos;+16+16+8
	defb 	%11111111,0
	defb 0,0


MSXTileListV9990:
	defb 70,16
	defw 	MsxTilesPos+16
	defb 	%11111000,0
	defb 80,16
	defw 	MsxTilesPos+16
	defb 	%11111100,0
	defb 184,8
	defw 	MsxTilesPos+16+16
	defb 	%11111110,0
	defb 48,16
	defw 	MsxTilesPos
	defb 	%11111000,0
	defb 0,0



NewGradientV9990:
	gradstart equ 192

	defb &BB,&BB,&BB,&BB	;1; first line
	defb gradstart-06, &BB,&B5	,%11111100
	defb gradstart-10, &5B,&5B	,%11111100
	defb gradstart-16, &B5,&55	,%11111100
	defb gradstart-20 ,&55,&55	,%00000000

	defb gradstart-26, &55,&51	,%11111100
	defb gradstart-30, &15,&15	,%11111100
	defb gradstart-36, &51,&11	,%11111100
	defb gradstart-40 ,&11,&11	,%00000000
	defb gradstart-50 ,&11,&11	,%00000000

	defb 50, 		&A1,&11	,%11111111
	defb 46, 		&1A,&1A	,%11111111
	defb 40, 		&AA,&A1	,%11111111
	defb 36	,		&AA,&AA	,%11111111

	defb 30, 		&7A,&AA	,%11111111
	defb 26, 		&A7,&A7	,%11111111
	defb 20, 		&77,&7A	,%11111111
	defb 16	,		&77,&77	,%11111111
	defb 12	,		&77,&77	,%11111111
	defb 255


;	defb gradstart-10, &FF,&F0	,%11111100
;	defb gradstart-20, &0F,&0F	,%11111100
;	defb gradstart-30, &F0,&00	,%11111100
;	defb gradstart-40,&00,&00	,%00000000
;	defb gradstart-50,&00,&00	,%00000000
;	defb 40, 		&F0,&00	,%11111111
;	defb 30, 		&0F,&0F	,%11111111
;	defb 20, 		&FF,&F0	,%11111111
;	defb 10	,		&FF,&FF	,%11111111
;	defb 02	,		&FF,&FF	,%11111111
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			CPC Raster Pallete
;	The core is full, so this is now stored in the level block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if BuildCPCv+BuildENTv
RasterColors_ColorArray1:
	defb 1
	defb 1				
	defb &54,&54,&54,&54	
RasterColors_ColorArray2:
	defb 1
	defb 1				
	defb &54,&54,&54,&54	
	defb 0
	defb &54,&54,&54,&54
	defb 12
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
RasterColors_ColorArray3:
	defb 1
	defb 1				
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
RasterColors_ColorArray4:
	defb 1
	defb 1				
	defb &54,&54,&54,&54	
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	2nd page flipped palette used on regular CPC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RasterColors_ColorArray1Alt:
	defb 1
	defb 1				
	defb &54,&55,&4A,&4B		;Black,DkBlue,LtYellow,White
RasterColors_ColorArray2Alt:
	defb 2	; Switches
	defb 16	;delay			
	defb &54,&5D,&59,&4B
	defb 16	;delay			
	defb &54,&58,&5F,&4B
RasterColors_ColorArray3Alt:
	defb 0
;	defb 1
;	defb &54,&54,&54,&54		 :IlluminatedPaletteCAlt_Plus2
RasterColors_ColorArray4Alt:
	defb 2 ; no of switches
	defb 0	;delays			
	defb &54,&58,&51,&4B		;Black,Red,Grey,White
	defb 32
	defb &54,&4C,&51,&4B	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					CPC Plus Palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


PaletteInit:		;The palette when the level starts (black)
	     ;0GRB
	defb 25
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 50
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 75
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 100
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 125
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 150
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 175
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 200
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	     ;0GRB

PaletteDest:	;The 'Normal' level palette
	     ;0GRB
	defb 25
	defw &0000
	defw &004C
	defw &0CC0
	defw &0FFB
	defb 50
	defw &0000
	defw &000F
	defw &0FF0
	defw &0FFD
	defb 75
	defw &0000
	defw &002B
	defw &0BB4
	defw &0FFF
	defb 100
	defw &0000
	defw &0059
	defw &0998
	defw &0EFF
	defb 125
	defw &0000
	defw &0077
	defw &088F
	defw &0EFF
	defb 150
	defw &0000
	defw &0088
	defw &090F
	defw &0EFF
	defb 175
	defw &0000
	defw &00B4
	defw &0A0A
	defw &0FCF
	defb 200
	defw &0000
	defw &00F4
	defw &0A0B
	defw &0FBF
	     ;0GRB

	FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
	FadeOut:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteInit
			call SetFader
		pop hl
	ret
endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					MSX Palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildMSX
	PaletteInit:					;Level start palette (Black)
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG

	PaletteDest:						;Normal level palette
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
	defb %10000000,%00000000;10  -RRR-BBB,-----GGG
	defb %10001110,%00000100;11  -RRR-BBB,-----GGG
	defb %11100000,%00001000;12  -RRR-BBB,-----GGG
	defb %01001110,%00001000;13  -RRR-BBB,-----GGG
	defb %11101010,%00001110;14  -RRR-BBB,-----GGG
	defb %10100110,%00001010;15  -RRR-BBB,-----GGG




	FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
	FadeOut:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteInit
			call SetFader
		pop hl
	ret
endif

null:ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			LEVEL JUMPBLOCK - Don't mess with anything here!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelJumpBlock:
	defs FileBeginLevel+&3FF0-LevelJumpBlock
		jp LevelInit; - Level Start &3ff0
		jp LevelLoop; - Level loop &3ff3
	FileEndLevel:
limit &FFFF




ifdef  buildCPC
	save direct "T10-SC1.D01",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif

 