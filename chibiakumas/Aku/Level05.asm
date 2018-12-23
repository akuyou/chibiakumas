;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
; replace ldia 
; Check NULL is in spectrum copied block

;replace background object definitions
; Replace object reprogrammers


nolist


BuildLevel equ 1	;We're building a level!
Read "..\Aku\Build.asm"




	BuildLang equ '' ; J=Japanese
;	BuildLang equ 'j'



;MSX_BulletSprites equ 4
;UseBackgroundFloodFillQuadSpriteColumn equ 1
UseBlackout equ 1


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildENT
	write "..\BldENT\T10-SC1.D02"
endif 
ifdef buildZXS
	write "..\BldZX\Level05.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T10-SC1.D02"
	else
		write "..\ResMSX\disk1j\T10-SC1.D02"
	endif
;	db &FE     ; magic number
;	dw FileBeginLevel    ; begin address
;	dw FileEndLevel - 1  ; end address
;	dw FileBeginLevel;Execute  ; program execution address (for ,R option)
endif
org Akuyou_LevelStart
;;;;;;;;;;;;;;;;;;; Sprite data must be at top of level code block
FileBeginLevel:
	if buildCPCv+buildENTv
		incbin "..\ResCPC\LEVEL5A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL5A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL5A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level5-Tiles-MSX.RLE"
		MSXTiles_End:

;		MSXBullets
;			incbin "..\ResMSX\Level3Bullets.RLE"
;		MSXBullets_End

	endif















	align 256,&00


CustomRam:	Defs 128

	Defw &FFFF,&FFFF,&FFFF,&FFFF,&FFFF ; Matker for end of data




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



EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static


defb 0,evtResetPowerup

defb 0,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54	;
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



; Define the background

;defb 0,240+1,0,18*2+1				; (Time,Cmd,Off,Bytes) Load 41 bytes into the background - 41 bytes is the limit
;defb &F0,&F0	;1; first line
;defb 196,&D0	;2; line num, New byte
;defb 190,&70	;3
;defb 186,&A0	;4
;defb 180,&50	;5
;defb 176,&80	;6
;defb 170,&20	;7
;defb 166,&00	;8
;defb 160,&00	;9
;defb 80,&20	;10
;defb 76,&80	;11
;defb 70,&50	;12
;defb 66,&A0	;13
;defb 50,&80	;14
;defb 40,&20	;15
;defb 30,&00	;16
;defb 28,&00	;17
;defb 02,&00	;18
;defb 255

;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0


defb 0,evtReprogram_PowerupSprites,128+14,128+13,128+12,128+9	; sprites drone,speed,power,coin

; Background L

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


; Miner Fish
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireHyper+16,mveWave+%00000000,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+8
defb evtSetObjectSize,32
defb evtAddToForeground
defb 	evtSettingsBank_Save,11


; Tentitack
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+13,mveWave+%00000000,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+0	
defb evtSetObjectSize,24
defb evtAddToForeground	
defb 	evtSettingsBank_Save,2


; Tentitack
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+13,mveWave+%00000001,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+0		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,3


; Starfish Bomber
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+10,&23,lifEnemy+7	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+4		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,4		


; LiliFrog
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+7,&23,lifEnemy+5	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+2		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,5		

; SpitFish
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+17,&23,lifEnemy+5	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+3		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,6		


; Bubble
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveCustom2,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+6			; Sprite 1 Frame animater
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,7

; Bubble Move
defb 0,evtReprogramCustomMove1
defw CustomMove1


; Bubble 2
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveCustom1+1,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+7			; Sprite 1 Frame animater
defb evtSetObjectSize,16
defb evtAddToForeground
defb 	evtSettingsBank_Save,8

; bubble Move 2
defb 0,evtReprogramCustomMove2
defw CustomMove2


; Super Fish
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1,mveCustom3+2,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+1			; Sprite 1 Frame animater
defb evtSetObjectSize,32
defb evtAddToForeground
defb 	evtSettingsBank_Save,9

; Super Fish Move
defb 0,evtReprogramCustomMove3
defw CustomMove3

defb 0,evtReprogramCustomProg1
defw CustomProgram1



; Pairanah
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom2,&22,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+5		
defb evtSetObjectSize,32
defb evtAddToForeground
defb 	evtSettingsBank_Save,10		


defb 0,evtReprogramCustomProg2
defw CustomProgram2



; Fish Face
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSnail+13,&22,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+10
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,12


;  Fish Bone
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+11,&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+11
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,13




; Background Grass
defb 0,evtMultipleCommands +9							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +1	
defb 	evtSingleSprite,24,24+70,16*7+24	+16
defb 	evtSingleSprite,25,24+120,16*7+24	+16
defb 	evtSingleSprite,28,24+160,16*6+24+8	+16
defb 	evtSingleSprite,29,24+20,16*6+24+16	+16
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+15,24+50,16*9+24+4
defb 	evtSingleSprite,TwoFrameSprite+16,24+100,16*10+24
defb 	evtSingleSprite,TwoFrameSprite+17,24+150,16*10+24+8


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

if buildCPCv+buildENTv
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
	defb &54,&5D,&4E,&4B		;Black,DkBlue,LtYellow,White

	;defb 0,240,6,6			; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 5
	;defb 1				
	;defb &54,&55,&43,&4B		;Black,DkBlue,LtYellow,White

	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 0	;delay			
	defb &54,&5D,&4A,&4B
	defb 32	;delay			
	defb &54,&57,&5A,&4B



	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &44,&57,&5B,&4B		


;	defb FadeStartPoint+2,evtCallAddress
;	defw RasterColorsStartPalleteFlip
endif
;defb 10
;defb 	evtJumpToNewTime
;defw 		UnderwaterPart
;defb 	184

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;defb 16,evtCallAddress
;	defw BlackoutOn
;
;defb 16,evtCallAddress
;	defw CallBounce
;		defw Blackout5
;defb 18,evtCallAddress
;	defw CallBounce
;		defw Blackout4
;
;defb 20,evtCallAddress
;	defw CallBounce
;	defw Blackout3
;
;defb 22,evtCallAddress
;	defw CallBounce
;		defw Blackout2
;
;defb 24,evtCallAddress
;	defw CallBounce
;		defw Blackout1
;
;defb 50,evtCallAddress
;	defw BlackoutOff
;defb 16,evtCallAddress
;	defw CallBounce
;		defw SetUnderwater
;defb 10
;defb 	evtJumpToNewTime
;defw 		UnderwaterPart
;defb 	184



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Spitfish
defb 10,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite

;wave
defb 15,evtMultipleCommands +3						; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +1	
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+15,24+160,16*12+24


; Lilifrog
defb 20,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite+10				; Row 16, last Column, Last Sprite


; Starfish Bomber
defb 25,evtMultipleCommands+2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+3	

; Lilifrog
defb 30,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite+10				; Row 16, last Column, Last Sprite

; Starfish Bomber
defb 35,evtMultipleCommands+2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+3	


; Lilifrog
defb 40,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite+10				; Row 16, last Column, Last Sprite

; Starfish Bomber
defb 45,evtMultipleCommands+2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+3	

; Lilifrog
defb 50,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite+10				; Row 16, last Column, Last Sprite


; Bubble
defb 50,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+3
defb 	evtSingleSprite,TwoFrameSprite+6,24+40,200+24	; Row 16, last Column, Last Sprite


;; Background Grass
;defb 50,evtMultipleCommands +2						; 2 commands at the same timepoint
;defb 	evtSettingsBank_Load +1	
;defb 	evtSingleSprite,25,24+160,16*7+24
;defb 	evtSetProg,0
;defb 	evtSingleSprite,TwoFrameSprite+15,24+160,16*8+24

; Bubble
;defb 55,evtMultipleCommands +3							; 2 commands at the same timepoint
;defb 	evtSettingsBank_Load +8	
;defb 	evtSetMove,mveCustom1+8
;defb 	evtSingleSprite,TwoFrameSprite+7,24+100,200+24	; Row 16, last Column, Last Sprite



; Bubble
defb 60,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+9
defb 	evtSingleSprite,TwoFrameSprite+6,24+80,200+24	; Row 16, last Column, Last Sprite



; Bubble
defb 65,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+10
defb 	evtSingleSprite,TwoFrameSprite+7,24+60,200+24	; Row 16, last Column, Last Sprite



; Bubble Small
;defb 5,evtMultipleCommands +2							; 2 commands at the same timepoint
;defb 	evtSettingsBank_Load +8
;defb 	evtSingleSprite,TwoFrameSprite+7,24+90,200+24	; Row 16, last Column, Last Sprite

; Bubble
defb 70,evtMultipleCommands +3
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+1
defb 	evtSingleSprite,TwoFrameSprite+6,24+120,200+24	; Row 16, last Column, Last Sprite



; Powerup Rate
defb 70,evtMultipleCommands+4			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 13,160+24,10+24	; 	; Single Object sprite 11 (animated)
defb 	evtSingleSprite,128+ 13,160+24,90+24	; 	; Single Object sprite 11 (animated)
defb 	evtSingleSprite,128+ 13,160+24,170+24	; 	; Single Object sprite 11 (animated)


; Super Fish
defb 75,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+15
defb 	evtSingleSprite,TwoFrameSprite+1,24+80,190+24	; Row 16, last Column, Last Sprite



; Bubble
defb 80,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+2
defb 	evtSingleSprite,TwoFrameSprite+7,24+130,200+24	; Row 16, last Column, Last Sprite

defb 80,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+4
defb 	evtSingleSprite,TwoFrameSprite+6,24+30,200+24	; Row 16, last Column, Last Sprite

; Super Fish
defb 90,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+14
defb 	evtSingleSprite,TwoFrameSprite+1,24+60,190+24	; Row 16, last Column, Last Sprite

; Starfish Bomber
defb 95,evtMultipleCommands+2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+3	


; Super Fish
defb 100,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+13
defb 	evtSingleSprite,TwoFrameSprite+1,24+120,190+24	; Row 16, last Column, Last Sprite

; Super Fish
defb 110,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+12
defb 	evtSingleSprite,TwoFrameSprite+1,24+80,190+24	; Row 16, last Column, Last Sprite

; Lilifrog
defb 115,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite+10				; Row 16, last Column, Last Sprite

; Powerup Rate
defb 120,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&26,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 14,0+24,50+24	; 	; Single Object sprite 11 (animated)
defb 	evtSingleSprite,128+ 14,0+24,150+24	; 	; Single Object sprite 11 (animated)


; Super Fish
defb 120,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+11
defb 	evtSingleSprite,TwoFrameSprite+1,24+120,190+24	; Row 16, last Column, Last Sprite

; Starfish Bomber
defb 125,evtMultipleCommands+2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+3	



; Super Fish
defb 130,evtMultipleCommands +3
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+10
defb 	evtSingleSprite,TwoFrameSprite+1,24+60,190+24	; Row 16, last Column, Last Sprite

; Lilifrog
defb 135,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite+10				; Row 16, last Column, Last Sprite





defb 145,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+9
defb 	evtSingleSprite,TwoFrameSprite+7,24+20,200+24	; Row 16, last Column, Last Sprite


defb 150,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+1
defb 	evtSingleSprite,TwoFrameSprite+6,24+150,200+24	; Row 16, last Column, Last Sprite

defb 155,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+6
defb 	evtSingleSprite,TwoFrameSprite+7,24+25,200+24	; Row 16, last Column, Last Sprite


defb 160,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+2
defb 	evtSingleSprite,TwoFrameSprite+6,24+145,200+24	; Row 16, last Column, Last Sprite

defb 165,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+7
defb 	evtSingleSprite,TwoFrameSprite+7,24+30,200+24	; Row 16, last Column, Last Sprite


defb 170,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+3
defb 	evtSingleSprite,TwoFrameSprite+6,24+140,200+24	; Row 16, last Column, Last Sprite

defb 175,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+8
defb 	evtSingleSprite,TwoFrameSprite+7,24+35,200+24	; Row 16, last Column, Last Sprite


defb 180,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+4
defb 	evtSingleSprite,TwoFrameSprite+6,24+135,200+24	; Row 16, last Column, Last Sprite

defb 185,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+9
defb 	evtSingleSprite,TwoFrameSprite+7,24+140,200+24	; Row 16, last Column, Last Sprite



UnderwaterPart:

defb 185,evtSetLevelSpeed,%00000010

defb 185,evtCallAddress
	defw BlackoutOn
defb 185,evtCallAddress
	defw CallBounce
		defw Blackout5

defb 186,evtCallAddress
	defw CallBounce
		defw Blackout4


ifdef BuildZXS
defb 187,evtCallAddress
	defw CallBounce	;need to do this for speccy screen commands
		defw WaterRiseEnable
endif
ifdef BuildMSX
defb 187,evtCallAddress
	defw CallBounce	;need to do this for speccy screen commands
		defw WaterRiseEnable
endif






if buildCPCv+buildENTv

defb 187,evtCallAddress
	defw CallBounce
		defw Blackout3

defb 187,evtCallAddress
	defw setPaletteSink
	defw PlusSink1






	defb 188;,%01110000+1			; 4 Commands

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 128	;delays			
	defb &44,&57,&5B,&4B		

defb 188,evtCallAddress
	defw CallBounce
		defw Blackout2

	
defb 188,evtCallAddress
	defw setPaletteSink
	defw PlusSink2

defb 189;,%01110000+1			; 4 Commands
	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &44,&57,&5B,&4B	

defb 189,evtCallAddress
	defw CallBounce
		defw Blackout1

defb 189,evtCallAddress
	defw setPaletteSink
	defw PlusSink3

defb 190,%01110000+2			; 4 Commands
	defb 240,0,5*1+1		
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&57,&5B,&4B	

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 128	;delays			
	defb &44,&57,&5B,&4B		


defb 190,evtCallAddress
	defw setPaletteSink
	defw PlusSink4

defb 191;,%01110000+1			; 4 Commands
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &44,&57,&5B,&4B		

defb 191,evtCallAddress
	defw setPaletteSink
	defw PlusSink5

;defb 192,evtCallAddress
;	defw CallBounce
;		defw Blackout1
defb 192,evtCallAddress
		defw setPaletteUnderwater

defb 192,%01110000+4			; 4 Commands


; Load Palette

	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &44,&57,&4E,&4B

	;defb 0,240,6,6			; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 5
	;defb 1				
	;defb &54,&55,&43,&4B		;Black,DkBlue,LtYellow,White

	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 0	;delay			
	defb &44,&57,&49,&4B
	defb 32	;delay			
	defb &44,&57,&5B,&4B




	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &44,&42,&4D,&4B		



endif	;End of CPC block




;



defb 193,evtCallAddress
	defw CallBounce
		defw SetUnderwater


defb 193,evtCallAddress
	defw CallBounce
		defw Blackout2


;CoralAndWeeds 18-21
defb 193,evtMultipleCommands +6	
defb 	evtSettingsBank_Load +1	
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+18,24+40,24+199-24
defb 	evtSingleSprite,TwoFrameSprite+20,24+160,24+190-24
defb 	evtSingleSprite,TwoFrameSprite+19,24+80,24+185-24
defb 	evtSingleSprite,TwoFrameSprite+21,24+120,24+195-24

; Powerup Rate
defb 193,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&26,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 12,0+24,100+24	; 	; Single Object sprite 11 (animated)

defb 194,evtCallAddress
	defw CallBounce
		defw Blackout3
defb 195,evtCallAddress
	defw CallBounce
		defw Blackout4




defb 196,evtCallAddress
	defw CallBounce
		defw Blackout5
defb 197,evtCallAddress
	defw BlackoutOff



defb 197,evtSetLevelSpeed,%00000100


;End palette batch
; 193+

; Miner Fish
defb 197,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+8,24+160-16,100+24	; Row 16, last Column, Last Sprite



defb 200,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+10
defb 	evtSingleSprite,TwoFrameSprite+6,24+50,200+24	; Row 16, last Column, Last Sprite

defb 200,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+11
defb 	evtSingleSprite,TwoFrameSprite+7,24+120,200+24	; Row 16, last Column, Last Sprite

; Miner Fish
defb 205,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+8,24+160-16,100+24	; Row 16, last Column, Last Sprite





defb 210,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+12
defb 	evtSingleSprite,TwoFrameSprite+6,24+130,200+24	; Row 16, last Column, Last Sprite

defb 210,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+13
defb 	evtSingleSprite,TwoFrameSprite+7,24+60,200+24	; Row 16, last Column, Last Sprite

defb 215,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+14
defb 	evtSingleSprite,TwoFrameSprite+6,24+70,200+24	; Row 16, last Column, Last Sprite

defb 215,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+15
defb 	evtSingleSprite,TwoFrameSprite+7,24+120,200+24	; Row 16, last Column, Last Sprite


defb 220,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+1
defb 	evtSingleSprite,TwoFrameSprite+6,24+120,200+24	; Row 16, last Column, Last Sprite

defb 225,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+2
defb 	evtSingleSprite,TwoFrameSprite+7,24+80,200+24	; Row 16, last Column, Last Sprite

; Pairanah
defb 230,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+7


defb 230,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSetMove,mveCustom2+3
defb 	evtSingleSprite,TwoFrameSprite+6,24+90,200+24	; Row 16, last Column, Last Sprite

defb 235,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +8	
defb 	evtSetMove,mveCustom1+4
defb 	evtSingleSprite,TwoFrameSprite+7,24+110,200+24	; Row 16, last Column, Last Sprite


; Miner Fish
defb 250,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+8,24+160-16,100+24	; Row 16, last Column, Last Sprite

;Coral and weeds
defb 250,evtMultipleCommands +3
defb 	evtSettingsBank_Load +1	
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+18,24+160,24+190-24


; Starfish Bomber
defb 5,evtMultipleCommands+3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb	evtSetMove,&25
ifdef BuildZXS
	defb 	evtSingleSprite,128+30,24,8+24
else
	defb 	evtSingleSprite,128+4,24,8+24
endif


; Pairanah
defb 20,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+7

; FishFace
defb 25,evtMultipleCommands +3
defb 	evtSettingsBank_Load +12
defb	evtSetMove,&26
defb 	evtSingleSprite,128+22,24,80+24



; Miner Fish
defb 30,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+8,24+160-16,100+24	; Row 16, last Column, Last Sprite


; Pairanah
defb 35,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+6

;Coral and weeds
defb 35,evtMultipleCommands +3
defb 	evtSettingsBank_Load +1	
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+20,24+160,24+195-24

; Starfish Bomber
defb 35,evtMultipleCommands+3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb	evtSetMove,&25
ifdef BuildZXS
	defb 	evtSingleSprite,128+30,24,8+24
else
	defb 	evtSingleSprite,128+4,24,8+24
endif

; Pairanah
defb 40,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+9


; Pairanah
defb 45,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+7


; Pairanah
defb 50,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+6


; Pairanah
defb 55,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+9


; Miner Fish
defb 60,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+8,24+160-16,100+24	; Row 16, last Column, Last Sprite

; Miner Fish
defb 70,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+8,24+160-16,100+24	; Row 16, last Column, Last Sprite


; FishFace
defb 75,evtMultipleCommands +3
defb 	evtSettingsBank_Load +12
defb	evtSetMove,&26
defb 	evtSingleSprite,128+22,24,80+24


; FishFace
defb 75,evtMultipleCommands +3
defb 	evtSettingsBank_Load +12
defb	evtSetMove,&26
defb 	evtSingleSprite,128+22,24,100+24


;Coral and weeds
defb 75,evtMultipleCommands +3
defb 	evtSettingsBank_Load +1	
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+19,24+160,24+199-24

; Pairanah
defb 80,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+5

; Pairanah
defb 85,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+7


; Pairanah
defb 90,evtMultipleCommands +2	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+9


; Super Fish
defb 100,evtMultipleCommands +3
defb 	evtSettingsBank_Load +9
defb 	evtSetMove,mveCustom3+10
defb 	evtSingleSprite,TwoFrameSprite+1,24+60,190+24	; Row 16, last Column, Last Sprite


; Pairanah
defb 100,evtMultipleCommands +5	
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+7

;Coral and weeds
defb 100,evtMultipleCommands +3
defb 	evtSettingsBank_Load +1	
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+18,24+160,24+195-24


; Fish Bone
defb 110,evtMultipleCommands +4
defb 	evtSettingsBank_Load +13
defb 	evtSingleSprite,128+11,24+160,16*1+24
defb 	evtSingleSprite+7	
defb 	evtSingleSprite+11

; Fish Bone
defb 110,evtMultipleCommands +5
defb 	evtSettingsBank_Load +11
defb	evtSetMove,&25
defb 	evtSetProg,prgFireSlow+12
defb 	evtSingleSprite,128+23,24,16*0+24
defb 	evtSingleSprite,128+23,24,16*6+24

defb 120,evtMultipleCommands +3
defb 	evtSettingsBank_Load +13
defb 	evtSingleSprite+5
defb 	evtSingleSprite+9

; Fish Bone
defb 120,evtMultipleCommands +5
defb 	evtSettingsBank_Load +11
defb	evtSetMove,&25
defb 	evtSetProg,prgFireSlow+12
defb 	evtSingleSprite,128+23,24,16*4+24
defb 	evtSingleSprite,128+23,24,16*10+24


LevelEndAnim:
defb 150,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,128+	32,140+24,100+24	; 	; Single Object sprite 11 (animated)

defb 150,%10001001			;Call a memory location
defw	ClearBadguys





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 152
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

if buildCPCv+buildENTv
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




defb 156,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&0106 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return










LevelInit:
	


	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"


	;call RasterColors_Reset
LevelLoop:
read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"



read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"




	jp LevelLoop
jp LevelShutdown
LevelShutdown:
ret



ClearBadguys:
	ld a,1
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret



CustomMove1:
	di
	exx
	ld hl,CustomMovePattern1
	ld (CustomPatternJump_Plus2-2),hl
	exx
jr CustomMovePattern

CustomMove2:
	di
	exx
	ld hl,CustomMovePattern2
	ld (CustomPatternJump_Plus2-2),hl
	exx
jr CustomMovePattern
CustomMove3:
	di
	exx
	ld hl,CustomMovePattern3
	ld (CustomPatternJump_Plus2-2),hl
	exx
jr CustomMovePattern



CustomMovePattern:		; B=X C=Y D=Move
di

		

	ld a,ixl	;lifCustom 
	ex af,af'

	ld a,d
	exx
	push ix


		and %00001111
		ld hl,CustomRam
			
			ld d,0
			ld e,a
			add hl,de
			add hl,de
		push hl
		pop ix

		call Akuyou_Timer_GetTimer
		ld d,a
		ldai	; Level time
		ld e,a


		;dont update more than once per tick! 
		ld a,(ix+1)
		cp e
		jr z,CustomMovePattern_NoTick	
		ld a,e
		ld (ix+1),e

		;see if this is our first run
		ex af,af'
			cp 255
			call nc,CustomMovePattern_Init
		ex af,af'


		; here is where we make some moves!
		exx
		call CustomMovePattern1 :CustomPatternJump_Plus2
		exx
		;increment the pos
	

CustomMovePattern_NoTick:
		
		jp CustomMovePattern_Done

CustomMovePattern_Done:
	pop ix
	exx

	ex af,af'

	ld ixl,a	;lifCustom 


ei
ret
CustomMovePattern_Init:

	xor a
	ld (ix+0),a
	ld (ix+1),a
	ld a,lifEnemy+6			;New Life

ret


CustomMovePattern1:
	ld a,(ix+0)
	and %00111111
CustomMovePattern1Continue
		
	cp 32
	jr C,CustomMovePattern1Left

	inc b
	jr CustomMovePattern1Done

CustomMovePattern1Left:
	dec b
	jr CustomMovePattern1Done

CustomMovePattern1Done:	
	dec c	;m
	dec c	;m

	ld a,(ix+0)
	inc a
	ld (ix+0),a	



	cp 64
	jp NC,CustomMovePattern1Explode
ret
CustomMovePattern1Explode:
	ld iyl,prgFireFast+14		; Program Fire


	cp 66
	jp NC,CustomMovePatternKill
	;ex af,af'
	;dec a		;reduce our life
	;dec a		;reduce our life
	;push af
	;and %00111111
	;jp z,CustomMovePattern1Kill
	;pop af
	

	;ex af,af'
	



ret
CustomMovePatternKill:
	;ex af,af'
	;xor a
	
	ld b,0
	ld c,b
	ld D,b
	;ex af,af'
ret


CustomMovePattern2:
	ld a,(ix+0)
	and %00111111
CustomMovePattern2Continue
		
	cp 32
	jr C,CustomMovePattern2Left

	inc b
	jr CustomMovePattern2Done

CustomMovePattern2Left:
	dec b
	jr CustomMovePattern2Done


CustomMovePattern2Done:	

	dec c	;m


	ld a,(ix+0)
	inc a
	ld (ix+0),a	

	cp 168
	jp NC,CustomMovePattern2Explode

ret
CustomMovePattern2Explode:
	ld iyl,prgFireFast+13		; Program Fire


	cp 170
	jp NC,CustomMovePatternKill
	


ret

CustomMovePattern3:
	ld a,(ix+0)
	;and %00111111
CustomMovePattern3Continue
		
	cp 64
	jr C,CustomMovePattern3up
	inc c
	inc c
	inc c
	jr CustomMovePattern3Done

CustomMovePattern3up:

	dec c
	dec c
	dec c
	jr CustomMovePattern3Done


CustomMovePattern3Done:	
	ld a,(ix+0)
	inc a
	ld (ix+0),a	

	jr CustomMovePattern3Explode

ret
CustomMovePattern3Explode:
	;and %00011110
	;rrca
	;add prgFireFast+16
	

;	ld iyl,a		; Program Fire


	cp 128
	jr z,CustomMovePatternKill
	


ret
CustomProgram1:
	call Akuyou_Timer_GetTimer
	ldai	; Level time
	and %00000011
	;rrca
	add 16
	ld iyl,a		; Program Fire
	push bc
	push de
	push iy
	call Akuyou_FireStar
	pop iy
	pop de
	pop bc


	ld a,iyl
	add 4
	ld iyl,a
	jp Akuyou_FireStar


CustomProgram2:
	call Akuyou_Timer_GetTimer
	ldai	; Level time
	bit 0,a
	jr z,CustomProgram2_Fire2

	ld a,17
	ld iyl,a
	jp Akuyou_FireStar

CustomProgram2_Fire2:
	ld a,23
	ld iyl,a
	jp Akuyou_FireStar



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Level specific code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	


ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
	read "..\SrcMSX\CoreBackground_MSX_Blackout.asm"


endif
if buildCPCv+buildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
	read "CoreBackground_SolidFill.asm"
	read "CoreBackground_QuadSprite.asm"
	read "CoreBackground_bitshifter.asm"
	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_GetSpriteMemPos.asm"

	read "CoreBackground_Blackout.asm"

endif
;read "CoreBackground_Quad.asm"
;read "CoreBackground_TileArray.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 		This block is copied to bank 7 on the speccy, and contains graphics for the background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+buildENTv
		align 256
	LevelTiles:
		incbin "..\ResCPC\Level5-Tiles-CPC.SPR"
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level5-Tiles-ZX.TSP"

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


		if buildCPCv+buildENTv
			call Akuyou_Timer_GetTimer
			ld (BitshifterTicksOccured_Plus1-1),a
		endif

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
		if buildCPCv+buildENTv
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
;Background_DrawB		;Background_Draw_UnderWater
	jp Background_DrawB :BackgroundRender_Plus2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				MSX2 background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildMSX
SetUnderwater:
	

	push iy

		ld hl,NewGradientMSX2_Underwater		
		ld (SmartBombGradient_Plus2-2),hl

		call AkuYou_Player_GetPlayerVars
		ld hl,Background_DrawB_Underwater
		bit 0,(iy-1)
		jr z,SetBackRegularA
		ld hl,MSX2V9990_Underwater
	SetBackRegularA:
		ld (BackgroundRender_Plus2-2),hl
		ld hl,Background_DrawMsx2_Underwater
		ld (Foreground_CallMSX_Plus2-2),hl
		push bc
			Call MSXTileFlipper
		pop bc
	pop iy
ret



MSXTileFlipper:
	ld hl,MsxTilesPos+48
	ld bc,&0000		:MSXSpriteFlip_Plus2
	ld a,c
	xor 24

	ld(MSXSpriteFlip_Plus2-2),a
	add hl,bc
	ld (MSXUnderwaterTile1),hl
	ld (MSXUnderwaterTile1b),hl
	ld bc,8
	add hl,bc
	ld (MSXUnderwaterTile2),hl
	ld hl,496
	ld bc,0			:MSXSpriteFlipb_Plus2
	ld a,c
	xor 16
	ld (MSXSpriteFlipb_Plus2-2),a
	add hl,bc
	ld (MSXUnderwaterTile2b),hl
	ld hl,MsxTilesPos+32	
	ld bc,0			:MSXSpriteFlipc_Plus2
	ld a,c
	xor 48
	ld (MSXSpriteFlipc_Plus2-2),a
	add hl,bc
	ld (MSXUnderwaterForegroundFrame),hl

ret

Background_DrawB_Underwater: 		
		Call MSXTileFlipper

	di
		ld hl,(MSX_MainTilepos_Plus2-2)
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos



		ld ix,NewGradientMSX2_Underwater
		ld hl,MSXTileList_Underwater
		ld de,MSXTileList_Underwater;MSXTileListV9990_Underwater
		call Akuyou_Background_Tiles


		ld de,MSXSolidFills_Underwater
		ld hl,NewGradientV9990_Underwater
		ld b,192
;		ld c,%11111111
		jp Akuyou_Background_Gradient

MSX2V9990_Underwater:			;V9990 version
		call Akuyou_Timer_GetTimer
		and %0000100
		Call nz,MSXTileFlipper


di

		ld hl,(MSX_MainTileposB_Plus2-2)
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld de,MSXSolidFills_Underwater
		ld hl,NewGradientV9990_Underwater
		ld b,192
;		ld c,%11111111
		call Akuyou_Background_Gradient
ei

		ld ix,NewGradientMSX2_Underwater
		ld hl,MSXTileList_Underwater
		ld de,MSXTileListV9990_Underwater;MSXTileListV9990_Underwater
		call Akuyou_Background_Tiles


		ld hl,Akuyou_V9K_Paralax_Y
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld ix,NewGradientMSX2_Underwater
		ld hl,&0000
		ld de,MSXTileListBackgroundV9990_Underwater
		call Akuyou_Background_Tiles

ret

Background_DrawMsx2_Underwater:		;Foreground Paralax layer V9990 only
nop		;For smartbomb call

		ld hl,Akuyou_V9K_Paralax_Y
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld hl,&0000	;V9k only
		ld de,MSXTileListForegroundV9990_Underwater
		call Akuyou_Background_Tiles
ret











Background_DrawB: 		

	di
		ld hl,0000 :MSX_MainTilepos_Plus2
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos



		ld ix,NewGradientMSX2
		ld hl,MSXTileList
		ld de,MSXTileListV9990
		call Akuyou_Background_Tiles


		ld de,MSXSolidFills
		ld hl,NewGradientV9990
		ld b,192
;		ld c,%11111111
		jp Akuyou_Background_Gradient

MSX2V9990:			;V9990 version
di

		ld hl,0000 :MSX_MainTileposB_Plus2
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld de,MSXSolidFills
		ld hl,NewGradientV9990
		ld b,192
;		ld c,%11111111
		call Akuyou_Background_Gradient
ei

		ld ix,NewGradientMSX2
		ld hl,MSXTileList
		ld de,MSXTileListV9990
		call Akuyou_Background_Tiles


		ld hl,Akuyou_V9K_Paralax_Y
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld ix,NewGradientMSX2
		ld hl,&0000
		ld de,MSXTileListBackgroundV9990
		call Akuyou_Background_Tiles

ret

Background_DrawMsx2:		;Foreground Paralax layer V9990 only
nop		;For smartbomb call

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
				ld b,24;40;200-48-16-32-16-8-32-8
			else
				ld b,16;32;192-48-16-32-16-8-32-8
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif


			pop de
			ex hl,de		;Move down 16 lines
				ld bc,8*16
				add hl,bc
			ex hl,de
			push de

			ld b,8 ;Lines

			ifdef buildZXS
				call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			else
				call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			endif
	

			ld de,&0000
			ifdef CPC320
				ld b,16
			else
				ld b,16;32;192-48-16-32-16-8-32-8
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



			

		pop de


	ex hl,de		;Move down 16 lines
		ld bc,8*8
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


	ld a,%11111111 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines



	ifdef buildZXS
		call BitShifterDouble ;need pointer to sprite in HL
	else
		call BitShifterDouble ;need pointer to sprite in HL
	endif




	ifdef buildZXS
		ld de,BackgroundColorMap
;		ld a,7	
;		ld hl,Akuyou_Background_Color
		call Akuyou_Background_Color
	endif

ret




Background_Draw_UnderWater: 



	;Bottom
	ld a,4
	add 0 :SpriteFlipA_Plus1
	ld de,LevelTiles
	ifdef buildZXS
		call Akuyou_GetSpriteMempos
	else
		call GetSpriteMempos	
	endif



	ld b,8 ;Lines

	ifdef buildZXS
		call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
	else
		call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
	endif




	ld de,GradientTop32
	ld b,32;GradientTopStart
	ld c,%11111100		;Shift on Timer Ticks

	call Akuyou_Background_Gradient






	
			ld de,&0000

			ifdef buildZXS
				ld b,104-8
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				ld b,104
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif


	ld a,6
	add 0 :SpriteFlipB_Plus1
	ld de,LevelTiles
	ifdef buildZXS
		call Akuyou_GetSpriteMempos
	else
		call GetSpriteMempos	
	endif

			ld b,16 ;Lines

			ifdef buildZXS
				call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			else
				call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			endif
	
	




	ld de,GradientBottom
	ld b,GradientBottomStart
	ld c,%11111111		;Shift on Timer Ticks
	call Akuyou_Background_Gradient


	ld a,8
	ld de,LevelTiles
	ifdef buildZXS
		call Akuyou_GetSpriteMempos
	else
		call GetSpriteMempos	
	endif

			ld b,8 ;Lines

			ifdef buildZXS
				call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			else
				call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			endif





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;				Spectrum & CPC Tile Bitshifts (MSX doesn't need them)
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	ld a,4
	ld de,LevelTiles
	ifdef buildZXS
		call Akuyou_GetSpriteMempos
	else
		call GetSpriteMempos	
	endif
	ld hl,0007 ; shift to the right of the sprite
	add hl,de

	ld a,%11111100 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif



	ld a,%11111100 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif

inc h

;	ld a,6
;	ld de,LevelTiles
;	ifdef buildZXS
;		call Akuyou_GetSpriteMempos
;	else
;		call GetSpriteMempos	
;	endif
;	ld hl,0007 ; shift to the right of the sprite
;	add hl,de

	ld a,%11111110 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,16		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif

	ld a,%11111110 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,16		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif



	ld a,8
	ld de,LevelTiles
	ifdef buildZXS
		call Akuyou_GetSpriteMempos
	else
		call GetSpriteMempos	
	endif
	ld hl,0007 ; shift to the right of the sprite
	add hl,de

	ld a,%11111111 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines

	ifdef buildZXS
		call BitShifterDouble ;need pointer to sprite in HL
	else
		call BitShifterDouble ;need pointer to sprite in HL
	endif



	ld a,1		:UnderwaterSpriteFlip_Plus1
	xor %00000001
	ld (UnderwaterSpriteFlip_Plus1-1),a
	ld (SpriteFlipB_Plus1-1),a
	ld (SpriteFlipA_Plus1-1),a




	ifdef buildZXS
		ld de,BackgroundColorWater
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
		ld ix,NewGradientMSX2		:SmartBombGradient_Plus2
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
if buildCPCv+buildENTv
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
GradientTopStartB equ 32
GradientTop32:
	defb &F0,&F0	;1; first line
	defb GradientTopStartB-00,&D0	;2; line num, New byte
	defb GradientTopStartB-06,&70	;3
	defb GradientTopStartB-10,&A0	;4
	defb GradientTopStartB-16,&50	;5
	defb GradientTopStartB-20,&80	;6
	defb GradientTopStartB-26,&20	;7
	defb GradientTopStartB-28,&00	;8
	defb GradientTopStartB-30,&00	;9
	defb 255

GradientBottom:
	defb &0,&0	;1; first line
	defb 30,&20	;10
	defb 26,&80	;11
	defb 20,&50	;12
	defb 18,&A0	;13
	defb 14,&70	;14
	defb 10,&D0	;15
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
GradientTopStartB equ 32
GradientTop32:
	defb %11111111,%11111111	;1; first line
	defb GradientTopStartB-00,%11101110	;2; line num, New byte
	defb GradientTopStartB-06,%01010101
	defb GradientTopStartB-10,%10100010	;4
	defb GradientTopStartB-16,%01001000
	defb GradientTopStartB-20,%00000001
	defb GradientTopStartB-26,&00	;9
	defb GradientTopStartB-30,&00	;9
	defb 255

GradientBottom:
	defb &0,&0	;1; first line
	defb 30,%00010000
	defb 26,%01000100	;16
	defb 20,%10100010	;17
	defb 18,%01010101	;18
	defb 10, %11101110	;19
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

BackgroundColorWater:		;Spectrum background colors (64=bright)
	defb 8*1+64+7
	defb 8*1+64+6
	defb 8*1+64+6
	defb 8*1+64+6
	defb 8*1+64+6
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+3
	defb 8*1+64+5
	defb 8*1+64+5
	defb 8*1+64+5
	defb 8*1+64+5
	defb 8*1+64+7
BackgroundColorMap:		;Spectrum background colors (64=bright)
	defb 8*1+64+4
	defb 8*1+5
	defb 8*1+5
	defb 8*1+5
	defb 8*1+5
	defb 8*1+5
	defb 8*1+5
	defb 64+4
	defb 64+4
	defb 64+4
	defb 00+4
	defb 00+4
	defb 00+4
	defb 00+4
	defb 00+3
	defb 00+3
	defb 00+3
	defb 00+3
	defb 64+3
	defb 64+3
	defb 64+3
	defb 64+3
	defb 64+3
	defb 64+3

BackgroundColorMapLast:


WaterRise:
	ld b,192
	ld de,&0000
	call Akuyou_BackgroundSolidFill


	ld de,BackgroundColorMap
	call Akuyou_Background_Color

	ld hl,BackgroundColorMap :Nextrisepoint_Plus2
	ld a,BackgroundColorMapLast
	cp l
	ret z
	ld (hl),8*1+5
	inc hl
	ld (Nextrisepoint_Plus2-2),hl

ret

endif

ifdef BuildMSX
WaterRiseDummyGradient:
	defb 255

WaterGradientV9990:

	defb &00,00,&00,00
WaterRiseChangePointV9k1:	defb 96, 		&AA,&AA	,%11111111
WaterRiseChangePointV9k2:	defb 94, 		&AA,&AA	,%11111111

	defb 255



WaterRiseMSX:
			defb 0
WaterRiseChangePoint1:		defb 192-8	,%00000000,&00
WaterRiseChangePoint2:	defb 192-8,8	,%00000000,&AA

	defb 0,0



WaterRise:



		ld ix,WaterRiseDummyGradient
		ld hl,&0000
		ld de,&0000
		call Akuyou_Background_Tiles
			

		ld de,WaterRiseMSX
		ld hl,WaterGradientV9990
		ld b,192
		call Akuyou_Background_Gradient

		ld b,192-8	:CurrentWaterRise_Plus1
		ld a,b
		ld (WaterRiseChangePoint1),a
		ld (WaterRiseChangePoint2),a

		ld a,192
		sub b
		ld (WaterRiseChangePoint2+1),a

		ld (WaterRiseChangePointV9k1),a
		sub 2
		ld (WaterRiseChangePointV9k2),a


		ld a,-8
		add b
		cp 8
		ret z

		ld (CurrentWaterRise_Plus1-1),a

	
	

endif

ifnot BuildCPCv+BuildENTv
	WaterRiseEnable:
		push hl
			ld hl,WaterRise
			ld (BackgroundRender_Plus2-2),hl
		pop hl
	ret
endif
ifndef BuildMSX
SetUnderwater:
	push hl
		ld hl,Background_Draw_UnderWater
		ld (BackgroundRender_Plus2-2),hl
	pop hl
ret
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
	defb &CC,&CC	,%00000000
	defb &CC,&C5	,%11111100
	defb &5C,&5C	,%11111100
	defb &C5,&55	,%11111100
	defb &55,&55	,%00000000
	defb &55,&50	,%11111100
	defb &05,&05	,%11111100
	defb &50,&00	,%11111100

defb 152
	defb &A0,&00	,%11111111
	defb &0A,&0A	,%11111111
	defb &AA,&A0	,%11111111
	defb &AA,&AA	,%00000000
	defb &BA,&AA	,%11111111
	defb &AB,&AB	,%11111111
	defb &BB,&BA	,%11111111
	defb &BB,&BB	,%00000000
NewGradientMSX2_SB:
defb 255


MSXSolidFills:
;	defb 0,16	,%11111100,&50
	defb 48,32	,%00000000,&00
	defb 96,28	,%00000000,&00
	defb 132,20	,%11111111,&00

	defb 0,0

		MsxTilesPos equ 0;
MSXTileList:
	defb 32,16
	defw 	MsxTilesPos
	defb 	%11111000,0
	defb 80,16
	defw 	MsxTilesPos+16
	defb 	%11111100,0
	defb 124,8
	defw 	MsxTilesPos+16+16
	defb 	%11111110,0
	defb 184,8
	defw 	MsxTilesPos+16+16+8
	defb 	%11111110,0
	defb 0,0


MSXTileListBackgroundV9990:
	defb 6,32
	defw 	MsxTilesPos+352
	defb 	%11000000,0
	defb 6,32
	defw 	MsxTilesPos+384
	defb 	%11111000,0
	defb 44,80
	defw 	MsxTilesPos+208
	defb 	%11100000,0
	defb 48,80
	defw 	MsxTilesPos+128
	defb 	%11111000,0
	defb 132-16,16
	defw 	MsxTilesPos+288
	defb 	%11111100,0
	defb 0,0


MSXTileListForegroundV9990:
	defb 192-48,48
	defw 	MsxTilesPos+304
	defb 	%11111111,0
	defb 0,0


MSXTileListV9990:



;	defb 70,16
;	defw 	MsxTilesPos+16
;	defb 	%11111000,0
;	defb 80,16
;	defw 	MsxTilesPos+16
;	defb 	%11111100,0
	defb 184,8
	defw 	MsxTilesPos+16+16+8
	defb 	%11111110,0
	defb 124,8
	defw 	MsxTilesPos+16+16
	defb 	%11111100,0

	defb 0,0



NewGradientV9990:
		gradstart equ 192

	defb &CC,&CC,&CC,&CC	;1; first line
	defb gradstart-06, &CC,&C5	,%11111100
	defb gradstart-10, &5C,&5C	,%11111100
	defb gradstart-16, &C5,&55	,%11111100
	defb gradstart-20 ,&55,&55	,%00000000

	defb gradstart-26, &55,&50	,%11111100
	defb gradstart-30, &05,&05	,%11111100
	defb gradstart-36, &50,&00	,%11111100
	defb gradstart-40 ,&00,&00	,%00000000
	defb gradstart-50 ,&00,&00	,%00000000

	defb 60, 		&A0,&00	,%11111111
	defb 56, 		&0A,&0A	,%11111111
	defb 50, 		&AA,&A0	,%11111111
	defb 46	,		&AA,&AA	,%11111111

	defb 40, 		&BA,&AA	,%11111111
	defb 36, 		&AB,&AB	,%11111111
	defb 30, 		&BB,&BA	,%11111111
	defb 26	,		&BB,&BB	,%11111111
	defb 22	,		&BB,&BB	,%11111111
	defb 255














NewGradientMSX2_Underwater:
defb 8
;	defb &CC,&CC	,%00000000
;	defb &CC,&C5	,%11111100
;	defb &5C,&5C	,%11111100
;	defb &C5,&55	,%11111100
	defb &BB,&BB	,%00000000
	defb &BB,&BB	,%00000000
	defb &BB,&BA	,%11111100
	defb &BA,&BB	,%11111100
	defb &AB,&AB	,%11111100
	defb &BA,&BA	,%11111100
	defb &AB,&AA	,%11111100
	defb &AA,&BA	,%11111100

defb 152

	defb &ED,&EE	,%11111111
	defb &EE,&DE	,%11111111
	defb &ED,&ED	,%11111111
	defb &DE,&DE	,%11111111
	defb &DD,&ED	,%11111111
	defb &DE,&DD	,%11111111
	defb &DD,&DD	,%00000000
	defb &DD,&DD	,%00000000
defb 255


MSXSolidFills_Underwater:
;	defb 0,16	,%11111100,&50
;	defb 48,32	,%00000000,&A0
;	defb 96,28	,%00000000,&A0
l	defb 32+8,96	,%11111111,&AA

	defb 0,0

;		MsxTilesPos equ 0;
MSXTileList_Underwater:
	defb 0,8
MSXUnderwaterTile1:	defw 	MsxTilesPos+48+8
	defb 	%11111000,0
	defb 136,16
MSXUnderwaterTile2:	defw 	MsxTilesPos+48+8+8
	defb 	%11111000,0
	defb 184,8
	defw 	MsxTilesPos+48+8+8+16+16
	defb 	%11111110,0
	defb 0,0

MSXTileListBackgroundV9990_Underwater:
	defb 192-40,19
	defw 	MsxTilesPos;+16+16+8
	defb 	%11111100,0
	defb 192-40+19,13
	defw 	MsxTilesPos+19;+16+16+8
	defb 	%11111110,0
	defb 72,80
	defw 	MsxTilesPos+416;+16+16+8
	defb 	%11000000,0
	defb 136,16
MSXUnderwaterTile2b:	defw 	MsxTilesPos+496
	defb 	%11111000,0

	defb 0,0
MSXTileListForegroundV9990_Underwater:

	defb 192-48,48
MSXUnderwaterForegroundFrame:	defw 	MsxTilesPos+32
	defb 	%11111111,0
	defb 0,0


MSXTileListV9990_Underwater:
	defb 0,8
MSXUnderwaterTile1b:	defw 	MsxTilesPos+48+8
	defb 	%11111000,0
;	defb 70,16
;	defw 	MsxTilesPos+16
;	defb 	%11111000,0
;	defb 80,16
;	defw 	MsxTilesPos+16
;	defb 	%11111100,0
;	defb 184,8
;	defw 	MsxTilesPos+16+16+8
;	defb 	%11111110,0
;	defb 124,8
;	defw 	MsxTilesPos+16+16
;	defb 	%11111110,0
;	defb 48,16
;	defw 	MsxTilesPos
;	defb 	%11111000,0
	defb 184,8
	defw 	MsxTilesPos+48+8+8+16+16
	defb 	%11111110,0
	defb 0,0



NewGradientV9990_Underwater:
;		gradstart equ 192

	defb &BB,&BB,&BB,&BB	;1; first line
	defb gradstart-16, &BB,&BA	,%11111100
	defb gradstart-20, &BA,&BB	,%11111100
	defb gradstart-26, &AB,&AB	,%11111100
	defb gradstart-30, &BA,&BA	,%11111100
	defb gradstart-36, &AB,&AA	,%11111100
	defb gradstart-40 ,&AA,&AA	,%00000000
	defb gradstart-46 ,&AA,&AA	,%00000000

;	defb 60, 		&A0,&00	,%11111111
;	defb 56, 		&0A,&0A	,%11111111
;	defb 50, 		&AA,&A0	,%11111111
;	defb 46	,		&AA,&AA	,%11111111

;	defb 40, 		&BA,&AA	,%11111111
;	defb 36, 		&AB,&AB	,%11111111
;	defb 30, 		&BB,&BA	,%11111111
;	defb 26	,		&BB,&BB	,%11111111
;	defb 22	,		&BB,&BB	,%11111111
	defb 255
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			CPC Raster Pallete
;	The core is full, so this is now stored in the level block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if buildCPCv+buildENTv
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
PlusSink6:	defw &0000
	defw &008F
	defw &08F3
	defw &0FFB
	defb 50
PlusSink5:	defw &0000
	defw &006E
	defw &08F3
	defw &0FFD
	defb 75
PlusSink4:	defw &0000
	defw &004D
	defw &0A02
	defw &0FFF
	defb 100
PlusSink3:	defw &0000
	defw &0084
	defw &0C00
	defw &0EFF
	defb 125
PlusSink2:	defw &0000
	defw &00A4
	defw &0E44
	defw &0EFF
	defb 140
PlusSink1:	defw &0000
	defw &040C
	defw &0C4A
	defw &0EFF
	defb 160
	defw &0006
	defw &040A
	defw &0B0A
	defw &0FCF
	defb 200
	defw &0006
	defw &040A
	defw &0F0F
	defw &0FDF
	     ;0GRB

PaletteUnderwater:	;The 'Underwater' level palette
	     ;0GRB
	defb 25
	defw &0006
	defw &070F
	defw &08F0
	defw &0DDF
	defb 50
	defw &0006
	defw &060F
	defw &08F0
	defw &0EEF
	defb 75
	defw &0006
	defw &050F
	defw &0F6C
	defw &0EEF
	defb 100
	defw &0006
	defw &040F
	defw &0F8C
	defw &0EEF
	defb 125
	defw &0006
	defw &084A
	defw &08AC
	defw &0EEF
	defb 150
	defw &0006
	defw &0C76
	defw &04AC
	defw &0EFE
	defb 175
	defw &0006
	defw &0D94
	defw &03CB
	defw &0EFE
	defb 200
	defw &0006
	defw &0DB2
	defw &04EA
	defw &0EFE
	     ;0GRB

setPaletteSink:
	push ix
	push iy
	push hl
		ld a,(hl)
		inc hl
		ld h,(hl)
		ld l,a
		ld (hl),6
	push de
	push bc

		ld hl,PaletteDest
		call PlusPaletteSet

	pop bc
	pop de
	pop hl
	inc hl
	inc hl
	pop iy
	pop ix

ret


setPaletteUnderwater:
	push ix
	push iy
	push de
	push bc
	push hl
		ld hl,PaletteUnderwater
		call PlusPaletteSet
	pop hl
	pop bc
	pop de
	pop iy
	pop ix
ret



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
defb %11101100,%00001010;9  -RRR-BBB,-----GGG
defb %00001110,%00000000;10  -RRR-BBB,-----GGG
defb %10001110,%00001000;11  -RRR-BBB,-----GGG
defb %11101000,%00000010;12  -RRR-BBB,-----GGG
defb %11100000,%00001110;13  -RRR-BBB,-----GGG
defb %11100000,%00001000;14  -RRR-BBB,-----GGG
defb %00100100,%00001000;15  -RRR-BBB,-----GGG




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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Custom level junk
ifdef BuildZXS
	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_Blackout.asm"
endif


;;;;;;;;;;;;;;;;;;;;;;;;


CallBounce:
push hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
ifdef buildZXS
	ld a,7	
	call Akuyou_Bankswapper_CallHL
else
	call CallHL
endif

pop hl
inc hl
inc hl
ret

CallHL:
	push hl
ret
BlackoutOff:
	push hl
	ld hl,Background_Draw
	jr BlackoutApply2
BlackoutOn:
	push hl
	ld hl,Background_DrawBlackout

BlackoutApply2:
	ld (Background_Call_Plus2-2),hl
	pop hl
ret


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
	save direct "T10-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif