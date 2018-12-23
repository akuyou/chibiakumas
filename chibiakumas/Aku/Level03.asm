;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
; replace ldia 
; Check NULL is in spectrum copied block

;replace background object definitions
; Replace object reprogrammers



;Debug_ShowLevelTime equ 1
nolist

BuildLevel equ 1	;We're building a level!
Read "..\Aku\Build.asm"


;MSX_BulletSprites equ 4
UseBackgroundFloodFillQuadSpriteColumn equ 1



read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildENT
	write "..\BldENT\T20-SC1.D01"
endif 
ifdef buildZXS
	write "..\BldZX\Level03.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T20-SC1.D01"
	else
		write "..\ResMSX\disk1j\T20-SC1.D01"
	endif
;	db &FE     ; magic number
;	dw FileBeginLevel    ; begin address
;	dw FileEndLevel - 1  ; end address
;	dw FileBeginLevel;Execute  ; program execution address (for ,R option)
endif
org Akuyou_LevelStart
;;;;;;;;;;;;;;;;;;; Sprite data must be at top of level code block
FileBeginLevel:
	if buildCPCv+BuildENTv
		incbin "..\ResCPC\LEVEL3A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL3A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL3A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level3-Tiles-MSX.RLE"
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



; Define the background
;defb 0,240+3,%11111111,30,%00000010
;defb 0,240+1,0,2*20+1				; (Time,Cmd,Off,Bytes) Load 41 bytes into the background - 41 bytes is the limit
;defb &0F,&0F	;1; first line
;defb 198,&0D	;2
;defb 196,&07	;3
;defb 190,&0A	;4
;defb 186,&05	;5
;defb 180,&08	;6
;defb 170,&02	;7; line num, New byte
;defb 160,&00	;8
;defb 150,&00	;9
;defb 120,&20	;10; line num, New byte
;defb 110,&80	;11; line num, New byte
;defb 108,&20	;12 line num, New byte
;defb 90,&0	;13 line num, New byte
;defb 80,&0	;14
;defb 24,&20	;15
;defb 20,&80	;16
;defb 16,&A0	;17
;defb 12,&02	;18
;defb 8,&08	;19
;defb 4,&0A	;20
;defb 255


;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					EVENT STREAM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




defb 0,evtReprogram_PowerupSprites,128+27,128+26,128+25,128+24	; Define powerup sprites

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


; Mukadebachi
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveCustom3+4,lifEnemy+9; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+2				; Sprite 1 Frame animater
defb evtAddToForeground
defb evtSetObjectSize,24
defb 	evtSettingsBank_Save,2	

; Kamisagi
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveCustom1,lifEnemy+5; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,0				; Sprite 1 Frame animater
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,3	

; Kamisagi program code
defb 0,evtReprogramCustomMove1
defw CustomMoveBouncer


; GnatPack
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+16,mveWave+%00000001,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+11		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,4		

; Biterfly
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+13,mveWave+%00000000,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+5		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,5		

; Zombie Salaryman
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+1,&23,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+4		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,6		

; Zombie Capybara
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSnail+5,&23,lifEnemy+9	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+6		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,7		

; Shroom Bomber
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+6,&23,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+21		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,8		




;Grass Tuft
defb 0,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +1							; Load Settings from bank 2
defb 	evtSingleSprite,20,70+24,12*16  

;Grass Tuft
defb 0,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +1							; Load Settings from bank 2
defb 	evtSingleSprite,17,30+24,11*16  

;Grass Tuft
defb 0,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +1							; Load Settings from bank 2
defb 	evtSingleSprite,18,110+24,11*16  

;mukadebachi
defb 0,evtReprogramCustomMove3
defw CustomMove3


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

if buildCPCv+BuildENTv
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
	defb &54,&5D,&59,&4B		;Black,DkBlue,LtYellow,White

	;defb 0,240,6,6			; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 5
	;defb 1				
	;defb &54,&55,&43,&4B		;Black,DkBlue,LtYellow,White

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 64	;delay			
	defb &54,&5C,&59,&4B




	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&52,&4B		;Black,Red,Grey,White
	defb 0
	defb &54,&58,&52,&4B		
	

;	defb FadeStartPoint+2,evtCallAddress
;	defw RasterColorsStartPalleteFlip
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









; GnatPack
defb 3,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	


; Zombie Salaryman
defb 9,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite



; Zombie Salaryman
defb 24,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				


; drone
defb 25,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 27,160+24,50+24	; 	; Single Object sprite 11 (animated)


; GnatPack
defb 28,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	

;Grass
defb 30,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,20
defb 	evtSingleSprite+13	



; Shroom Bomber
defb 38,evtMultipleCommands +2
defb 	evtSettingsBank_Load +8	
defb 	evtSingleSprite+3


;Grass
defb 40,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,16
defb 	evtSingleSprite+12	

; Zombie Salaryman
defb 45,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


; GnatPack
defb 50,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	


; Shroom Bomber
defb 60,evtMultipleCommands +2		
defb 	evtSettingsBank_Load +8	
defb 	evtSingleSprite+3


; Zombie Salaryman
;defb 60,evtMultipleCommands +2							; 2 commands at the same timepoint
;defb 	evtSettingsBank_Load +6	
;defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


; Shroom Bomber
;defb 65,evtMultipleCommands +2		
;defb 	evtSettingsBank_Load +8	
;defb 	evtSingleSprite+3


; drone
defb 65,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 27,160+24,50+24	; 	; Single Object sprite 11 (animated)

;Grass
defb 70,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,20
defb 	evtSingleSprite+13	

; Shroom Bomber
;defb 70,evtMultipleCommands +2		
;defb 	evtSettingsBank_Load +8	
;defb 	evtSingleSprite+3


; Zombie Capybara
defb 70,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite



;Grass
defb 80,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,17
defb 	evtSingleSprite+12	


;Grass
defb 90,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,18
defb 	evtSingleSprite+11	

; Zombie Salaryman
defb 95,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


;Grass
defb 100,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,16
defb 	evtSingleSprite+13	



; MukadeBachi1
defb 100,evtMultipleCommands + 5						; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +2							; Load Settings from bank 2
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSetProg,prgFireSlow+11
defb 	evtSingleSprite+7	

; MukadeBachi2
defb 103,evtMultipleCommands+4							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +2							; Load Settings from bank 2
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+2
defb 	evtSingleSprite+7	


; Powerup Rate
defb 105,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 26,160+24,50+24	; 	; Single Object sprite 11 (animated)



; MukadeBachi3
defb 106,evtMultipleCommands+5					
defb 	evtSettingsBank_Load +2						
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+29
defb 	evtSetProg,prgFireSnail+13
defb 	evtSingleSprite+7	

; MukadeBachi4
defb 109,evtMultipleCommands+4							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +2							; Load Settings from bank 2
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+2
defb 	evtSingleSprite+7	

; MukadeBachi5
defb 112,evtMultipleCommands+5
defb 	evtSettingsBank_Load +2						
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+3
defb 	evtSetProg,prgFireSlow+12
defb 	evtSingleSprite+7	

; Shroom Bomber
defb 118,evtMultipleCommands +2		
defb 	evtSettingsBank_Load +8	
defb 	evtSingleSprite+3


;Grass
defb 120,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,17
defb 	evtSingleSprite+12	

; Zombie Salaryman
defb 130,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


;Grass
defb 140,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,19
defb 	evtSingleSprite+11	


; Kamisagi
defb 145,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +3							; Load Settings from bank 2
defb 	evtSetMove,mveCustom1+8
defb 	evtSingleSprite+12	


; Bitterfly
defb 146,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb 	evtSingleSprite+7	


; drone
defb 150,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 27,160+24,50+24	; 	; Single Object sprite 11 (animated)



; Bitterfly
defb 160,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb 	evtSingleSprite+7	



;Grass
defb 170,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0		
defb 	evtSetSprite,16
defb 	evtSingleSprite+12	



; Zombie Capybara
defb 175,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


; GnatPack
defb 190,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	


;Grass
defb 190,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,17
defb 	evtSingleSprite+12	


; Powerup Rate
defb 195,evtMultipleCommands+3			; 2 commands at the same timepoint
defb evtAddToForeground
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSingleSprite,128+ 25,160+24,50+24	; 	; Single Object sprite 11 (animated)

; Zombie Salaryman
defb 198,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


; MukadeBachi1
defb 200,evtMultipleCommands + 5						; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +2							; Load Settings from bank 2
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSetProg,prgFireMid+11
defb 	evtSingleSprite+7	

; GnatPack
defb 201,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	


; Shroom Bomber
defb 202,evtMultipleCommands +2		
defb 	evtSettingsBank_Load +8	
defb 	evtSingleSprite+3

; MukadeBachi2
defb 203,evtMultipleCommands+4							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +2							; Load Settings from bank 2
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+2
defb 	evtSingleSprite+7	


; Kamisagi
defb 205,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +3							; Load Settings from bank 2
defb 	evtSetMove,mveCustom1+8
defb 	evtSingleSprite+12	


; MukadeBachi3
defb 206,evtMultipleCommands+5					
defb 	evtSettingsBank_Load +2						
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+29
defb 	evtSetProg,prgFireSlow+13
defb 	evtSingleSprite+7	


; Shroom Bomber
;defb 207,evtMultipleCommands +2		
;defb 	evtSettingsBank_Load +8	
;defb 	evtSingleSprite+3


; GnatPack
defb 207,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	

; Zombie Salaryman
defb 208,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


; MukadeBachi4
defb 209,evtMultipleCommands+4							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +2							; Load Settings from bank 2
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+2
defb 	evtSingleSprite+7	


; MukadeBachi5
defb 212,evtMultipleCommands+5					
defb 	evtSettingsBank_Load +2						
defb 	evtSetMove,mveCustom3+4
defb 	evtSetSprite,TwoFrameSprite+3
defb 	evtSetProg,prgFireMid+12
defb 	evtSingleSprite+7	

; Zombie Salaryman
defb 214,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


; GnatPack
defb 215,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +4							; Load Settings from bank 2
defb 	evtSingleSprite+7	


;Grass
defb 220,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,20
defb 	evtSingleSprite+13	



; Bitterfly
defb 220,evtMultipleCommands +4							; 2 commands at the same timepoint
defb evtAddToForeground
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb evtSetMove,mveWave+%00000000
defb 	evtSingleSprite+5	


; Bitterfly
defb 225,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb evtSetMove,mveWave+%0000001
defb 	evtSingleSprite+9	



; Zombie Capybara
defb 227,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite




;Grass
defb 230,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,18
defb 	evtSingleSprite+11


; Zombie Salaryman
defb 235,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite


;Grass
defb 240,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +0							; Load Settings from bank 2
defb 	evtSetSprite,19
defb 	evtSingleSprite+11



; Zombie Salaryman
defb 245,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +6	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite





; Bitterfly
defb 250,evtMultipleCommands +4							; 2 commands at the same timepoint
defb evtAddToForeground
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb evtSetMove,mveWave+%00000001
defb 	evtSingleSprite+3	


; Bitterfly
defb 250,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb evtSetMove,mveWave+%00000010
defb 	evtSingleSprite+10	




; Zombie Capybara
defb 254,evtMultipleCommands +2							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +7	
defb 	evtSingleSprite+12				; Row 16, last Column, Last Sprite




; Kamisagi
defb 5,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +3							; Load Settings from bank 2
defb 	evtSetMove,mveCustom1+8
defb 	evtSingleSprite+12	


; Kamisagi
defb 7,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +3							; Load Settings from bank 2
defb 	evtSetMove,mveCustom1+9
defb 	evtSingleSprite+12	


; Bitterfly
defb 10,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb evtSetMove,mveWave+%00000000
defb 	evtSingleSprite+5	


; Bitterfly
defb 15,evtMultipleCommands +3							; 2 commands at the same timepoint
defb 	evtSettingsBank_Load +5							; Load Settings from bank 2
defb evtSetMove,mveWave+%0000001
defb 	evtSingleSprite+9	




LevelEndAnim:
defb 30,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,128+	30,140+24,100+24	; 	; Single Object sprite 11 (animated)

defb 30,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 31
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

if buildCPCv+BuildENTv
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




defb 35,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&0104 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return







LevelInit:
	


	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"


	;call RasterColors_Reset
LevelLoop:





read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"

read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"




	jp LevelLoop

LevelShutdown:
ret



ClearBadguys:
	ld a,1
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Level specific code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;Allow objects to be reprogrammed
read "Core_ObjectReprogrammers.asm"

;Warp the bullet array (for boss battles)
read "Core_StarArrayWarp.asm"


ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	


ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
endif

if buildCPCv+BuildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
	read "CoreBackground_SolidFill.asm"
	read "CoreBackground_QuadSprite.asm"
	read "CoreBackground_QuadSpriteColumn.asm"
	read "CoreBackground_bitshifter.asm"
	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_GetSpriteMemPos.asm"
endif
;read "CoreBackground_Quad.asm"
;read "CoreBackground_TileArray.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 		This block is copied to bank 7 on the speccy, and contains graphics for the background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+BuildENTv
		align 256
	LevelTiles:
		incbin "..\ResCPC\Level3-Tiles-CPC.SPR"
		align 256	;For safety!
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level03-Tiles-ZX.TSP"

		align 256	;For safety!


	read "..\SrcZX\Akuyou_Spectrum_Level_GenericFader.asm"		;Must be within the copied block
	read "CoreBackground_QuadSpriteColumn.asm"
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


if buildCPCv+BuildENTv
			call Akuyou_Timer_GetTimer
			ld (BitshifterTicksOccured_Plus1-1),a
		endif

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
if buildCPCv+BuildENTv
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

ifdef BuildZXS
	call AkuYou_Player_GetPlayerVars
	bit 3,(iy-8)
	jp nz,Background_Black

endif


	ifdef BuildMSX
		ld (Background_DrawMsx2),a	;nop to disable 2nd background
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
		ld de,0000;MSXTileListV9990
		call Akuyou_Background_Tiles


		ld de,MSXFills
		ld hl,0000;NewGradientV9990
		ld b,192
		jp Akuyou_Background_Gradient

	ei
ret

MSX2V9990:			;V9990 version
di

		ld hl,0000 			:MSX_MainTileposB_Plus2
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos

		ld de,0000;MSXFills
		ld hl,NewGradientV9990
		ld b,192
;		ld c,%11111111
		call Akuyou_Background_Gradient
ei

		ld ix,NewGradientMSX2
		ld hl,0000;MSXTileList
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
	GradientTopStart equ 40

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
		push de
			ld b,16/2 ;Lines
			ld a,1 ;(1/1=2) Black lines
			ifdef buildZXS
				call BackgroundFloodFillQuadSpriteColumn ;need pointer to sprite in HL
			else
				call BackgroundFloodFillQuadSpriteColumn ;need pointer to sprite in HL 
			endif

		pop de
		ex hl,de		;Move down 8 lines
			ld bc,8*8
			add hl,bc
		ex hl,de
		push de
	



		push de
			ld de,&0000
			ifdef CPC320
				ld b,4
			else
				ld b,4;192-48-16-32-16-8-32-8-8 ;24
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif
		pop de




		ld b,64/4 ;************ COLUMN WORKS IN MULTIPLES OF 4, so DEVIDE BY 4 and put result in B! ******************
		ld a,3 ;Black lines (3/1=4)
		ifdef buildZXS
			call BackgroundFloodFillQuadSpriteColumn ;need pointer to sprite in HL
		else
			call BackgroundFloodFillQuadSpriteColumn ;need pointer to sprite in HL 
		endif
	
			;ld de,&0000
;			ld b,32
;			ifdef buildZXS
;				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
;			else
;				call BackgroundSolidFill ;need pointer to sprite in HL
;			endif

		
		pop de
		ex hl,de		;Move down 16 lines
			ld bc,8*16
			add hl,bc
		ex hl,de
		push de
			ld de,&0000
			ifdef CPC320
				ld b,4
			else
				ld b,4;192-48-16-32-16-8-32-8-8 ;24
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif
		pop de
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
				ld b,8
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif





			GradientBottomStart equ 40
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
	ld a,%11111110 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif


	;must be byte aligned

	ld a,%11111100 ;Shift on Timer Ticks
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


	ld a,%11111110 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter ;need pointer to sprite in HL
	endif


	inc h	;Bitshifter wraps on byte align, so manually recalc, or force a move every 32 lines


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
if buildCPCv+BuildENTv
GradientTop:
	defb &0F,&0F	;1; first line
	defb GradientTopStart-10,&0D	;2; line num, New byte
	defb GradientTopStart-16,&07	;3
	defb GradientTopStart-20,&0A	;4
	defb GradientTopStart-26,&05	;5
	defb GradientTopStart-30,&08	;6
	defb GradientTopStart-36,&02	;7
	defb GradientTopStart-38,&00	;7
	defb GradientTopStart-40,&00	;7
	defb 255

GradientBottom:
	defb &0,&0	;1; first line
	defb 40,&20	;10
	defb 36,&80	;11
	defb 30,&50	;12
	defb 26,&A0	;13
	defb 20,&70	;14
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


BackgroundColorMap:		;Spectrum background colors (64=bright)
	defb 64+4		;BOTTOM
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 64+4
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+4
	defb 00+4
	defb 00+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4		;TOP
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
	defb &88,&88	,%00000000
	defb &88,&8C	,%11111110
	defb &8C,&8C	,%11111110
	defb &8C,&CC	,%11111110
	defb &CC,&CC	,%00000000
	defb &CC,&CD	,%11111110
	defb &DC,&DC	,%11111110
	defb &CD,&DD	,%11111110

defb 152
	defb &B0,&00	,%11111100
	defb &0B,&0B	,%11111100
	defb &BB,&B0	,%11111100
	defb &BB,&BB	,%00000000
	defb &AB,&BB	,%11111100
	defb &BA,&BA	,%11111100
	defb &AA,&AB	,%11111100
	defb &AA,&AA	,%00000000
NewGradientMSX2_SB:
defb 255


MSXFills:
;	defb 0,16	,%11111100,&50
	defb 40,20	,%00000000,&00
	defb 76,36	,%00000000,&00
	defb 128,16	,%00000000,&00
;	defb 160,24	,%11111111,&A0

	defb 0,0

		MsxTilesPos equ 0;
MSXTileList:
;0-32=gradient
	defb 32,8;40
	defw 	MsxTilesPos
	defb 	%11111100,0
	defb 60,16 ;76
	defw 	MsxTilesPos+8+16+8+8
	defb 	%11111000,0
	defb 112,16;128
	defw 	MsxTilesPos+8
	defb 	%11111000,0
	defb 144,8;152
	defw 	MsxTilesPos+16+8
	defb 	%11111100,0
;152-184=gradient
	defb 184,8
	defw 	MsxTilesPos+16+8+8
	defb 	%11111111,0
	defb 0,0



MSXTileListBackgroundV9990:
	defb 48-2,96
	defw 	MsxTilesPos+64+96+96
	defb 	%11100000,0
	defb 48-1,96
	defw 	MsxTilesPos+64+96
	defb 	%11110000,0

	defb 48,96
	defw 	MsxTilesPos+64	
	defb 	%11111000,0
	defb 0,64
	defw 	MsxTilesPos
	defb 	%11111100,0

	defb 0,0

MSXTileListForegroundV9990:
	defb 0,32
	defw 	MsxTilesPos+64+96+96+96
	defb 	%11111110,0
	defb 192-32,32
	defw 	MsxTilesPos+64+96+96+96+32
	defb 	%11111111,0
	defb 0,0


MSXTileListV9990:
;0-32=gradient
	defb 32,8;40
	defw 	MsxTilesPos
	defb 	%11111100,0
;	defb 60,16 ;76
;	defw 	MsxTilesPos+8+16+8+8
;	defb 	%11111000,0
;	defb 112,16;128
;	defw 	MsxTilesPos+8
;	defb 	%11111000,0
	defb 144,8;152
	defw 	MsxTilesPos+16+8
	defb 	%11111100,0
;152-184=gradient
	defb 184,8
	defw 	MsxTilesPos+16+8+8
	defb 	%11111111,0
	defb 0,0




NewGradientV9990:
	gradstart equ 192

	defb &0,&0,&0,&0	;1; first line
;	defb gradstart-06, &99,&95	,%11111100
;	defb gradstart-10, &59,&59	,%11111100
;	defb gradstart-16, &95,&55	,%11111100
;	defb gradstart-20 ,&55,&55	,%00000000

;	defb gradstart-26, &55,&50	,%11111100
;	defb gradstart-30, &05,&05	,%11111100
;	defb gradstart-36, &50,&00	,%11111100
;	defb gradstart-40 ,&00,&00	,%00000000
;	defb gradstart-50 ,&00,&00	,%00000000

	defb 50, 		&B0,&00	,%11111111
	defb 46, 		&0B,&0B	,%11111111
	defb 40, 		&BB,&B0	,%11111111
	defb 36	,		&BB,&BB	,%11111111

	defb 30, 		&AB,&BB	,%11111111
	defb 26, 		&BA,&BA	,%11111111
	defb 20, 		&AA,&AB	,%11111111
	defb 16	,		&AA,&AA	,%11111111
	defb 12	,		&AA,&AA	,%11111111
	defb 255


endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					CPC Plus Palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+BuildENTv
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
	defb 20
	defw &0000
	defw &02C8
	defw &0C54;14  -GRB
	defw &0FFF;13  -GRB
	defb 40
	defw &0000
	defw &0284
	defw &0B31;14  -GRB
	defw &0FFF;13  -GRB
	defb 60
	defw &0000
	defw &0280
	defw &0911;14  -GRB
	defw &0EEE;13  -GRB
	defb 100
	defw &0000
	defw &0280
	defw &0A00;14  -GRB
	defw &0EFC;13  -GRB
	defb 125
	defw &0000
	defw &0280
	defw &0A00;14  -GRB
	defw &0EFC;13  -GRB
	defb 150
	defw &0000
	defw &0084
	defw &0A00;14  -GRB
	defw &0FFC;13  -GRB
	defb 175
	defw &0000
	defw &0098
	defw &0F84;14  -GRB
	defw &0FFC;13  -GRB
	defb 200
	defw &0000
	defw &008A
	defw &0E84;14  -GRB
	defw &0FFC;13  -GRB
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			CPC Raster Pallete
;	The core is full, so this is now stored in the level block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if buildCPCv+BuildENTv
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
	defb &54,&54,&54,&54		 :IlluminatedPaletteAAlt_Plus2
RasterColors_ColorArray2Alt:
	defb 1
	defb 1
	defb &54,&54,&54,&54		 :IlluminatedPaletteBAlt_Plus2
RasterColors_ColorArray3Alt:
	defb 1
	defb 1
	defb &54,&54,&54,&54		 :IlluminatedPaletteCAlt_Plus2
RasterColors_ColorArray4Alt:
	defb 1
	defb 1 
	defb &54,&54,&54,&54		 :IlluminatedPaletteDAlt_Plus2

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
	defb %00101110,%00001110;6  -RRR-BBB,-----GGG
	defb %11100000,%00000000;7  -RRR-BBB,-----GGG
	defb %00000100,%00001110;8  -RRR-BBB,-----GGG
	defb %11101100,%00000110;9  -RRR-BBB,-----GGG
	defb %10000000,%00000010;10  -RRR-BBB,-----GGG
	defb %01000000,%00000000;11  -RRR-BBB,-----GGG
	defb %01000000,%00001000;12  -RRR-BBB,-----GGG
	defb %01000000,%00000100;13  -RRR-BBB,-----GGG
	defb %10000100,%00000110;14  -RRR-BBB,-----GGG
	defb %11100000,%00001100;15  -RRR-BBB,-----GGG




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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			ZX Spectrum Level specific functions for background (These are copied

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef BuildZXS
	read "CoreBackground_bitshifterDouble.asm"
endif 


CustomMoveBouncer:
	ld c,190
	push hl

		;ld a,d
		;and %00001111
		;ld hl,CustomRam
		;push de
		;	ld d,0
		;	ld e,a
		;	add hl,de
		;pop de
		;ld a,(hl)
		;inc a
		;ld (hl),a

		; B=X C=Y D=Move
		ld a,b
		cp 184
		call z,CustomMoveBouncer_Init

		call Akuyou_Timer_GetTimer
		ld h,a

		;shift the time
		ldai
		ld l,a

		ld a,d
		and %00001111
		add a,l
		ldia


		bit 5,a
		jr z,CustomMoveBouncer_Vert
		dec b
		ld iyl,0			; Program - do nothing
		jr CustomMoveBouncer_Done
CustomMoveBouncer_Vert
		;0000D111
		bit 4,a
		jr z,CustomMoveBouncer_DoJump
		xor %00001111
		jr CustomMoveBouncer_DoJump
CustomMoveBouncer_DoJump
		and %00001111
		rlca
		rlca
		rlca
		cpl
		inc a
		add c
		ld c,a
		
		ldai
		and %00011111
		cp  %00001110
		jp nz,CustomMoveBouncer_FireNormal
		ld iyl,prgFireFast+13		; Program Fire
		jp CustomMoveBouncer_DoSprite

CustomMoveBouncer_FireNormal	
		ld iyl,prgFireFast+16		; Program Fire

CustomMoveBouncer_DoSprite
		ld a,h
		bit 1,a
		jp z,CustomMoveBouncer_Done
		call Akuyou_ObjectProgram_SpriteBankSwitch
CustomMoveBouncer_Done:
	pop hl
ret
CustomMoveBouncer_Init:
	;ld a,0
	;ld (hl),a
	dec b
ret


CustomMove3:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternMiniWave
	ld bc,CustomMovePattern_Init10

jr CustomMovePattern

CustomMovePatternMiniWave:

	;		   
	; WaveSmall pattern  1010SPPP	S= Speed, PPP Position
	ld a,b
	srl a	; unrem for speedup
	srl a	; unrem for speedup
	and %00011111
	cp  %00010000
	jr C,DoMoves_WaveSmallContinue
	xor %00011111
DoMoves_WaveSmallContinue:
	ld C,a
	ld a,%00000011
;	and %00000111
DoMoves_WaveEnd
	rrca
	rrca
	rrca		; equivalent to 5 left shifts
	or %00011100

	add C
	ld C,a

	ld a,B
	sub 1
	ld B,A
	cp 24			;we are at the bottom of the screen
	jp C,CustomMovePatternKill	;over the page
	ret



GetCustomRam:
	and %00001111
		ld hl,CustomRam
			
			ld d,0
			ld e,a
			add hl,de
			add hl,de
			add hl,de
			add hl,de
		push hl
		pop ix
ret

CustomMovePattern:		; B=X C=Y D=Move
	ld (CustomPatternJump_Plus2-2),hl
	ld (CustomPatternbJump_Plus2-2),de
	ld (CustomMovePattern_Init_Plus2-2),bc
	exx



;		ld a,iyl ; Program Code
;		ld a,ixl ;Life  - MOVED INTO af'
;		ld a,iyh ;spr
;		ld (hl),ixh ;Move
;		ld (hl),b ;X
;		ld (hl),c ;Y

		

	ld a,ixl	;lifCustom 
	ex af,af'

	ld a,d
	exx
	push ix


		call GetCustomRam

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
			call nc,CustomMovePattern_Init :CustomMovePattern_Init_Plus2
		ex af,af'


		; here is where we make some moves!
		exx
		call CustomMovePatternGeneric :CustomPatternJump_Plus2
		exx
		;increment the pos
	
CustomMovePattern_NoTick:
		
		; here is where we make some moves!
		exx
		call null :CustomPatternbJump_Plus2

		ld a,b
		cp 160+24
		call NC,CustomMovePatternKill
		exx
		;increment the pos

	;	jp CustomMovePattern_Done

CustomMovePattern_Done:


	ld a,iyl
	cp prgSpecial
	jr nz,CustomMovePattern_NotBossTarget
	ld a,0:TargetSpritecountdown_Plus1
	or a
	jr z,CustomMovePattern_TargetReset
	dec a
	ld (TargetSpritecountdown_Plus1-1),a
CustomMovePattern_TargetSet:
	ld a,128+9	:HitTargetSprite_Plus1
	ld iyh,a
	jr CustomMovePattern_NotBossTarget
CustomMovePattern_TargetReset:
	ld a,128+8 	:ResetTargetSprite_Plus1
	ld iyh,a
CustomMovePattern_NotBossTarget:
	pop ix
	exx

	ex af,af'

	ld ixl,a	;lifCustom 


ei
ret

CustomMovePatternKill:
	;ex af,af'
	;xor a
	
	ld b,0
	ld c,b
	ld D,b
	;ex af,af'
ret

CustomMovePattern_Init10:
	call CustomMovePattern_Init
	ld a,lifEnemy+10		;New Life
ret

CustomMovePattern_Init:

	xor a

	ld (ix+0),a
	ld (ix+1),a
	ld (ix+2),a
	ld (ix+3),a

	ld a,lifEnemy+6			;New Life

ret



CustomMovePatternGeneric: 

	ld a,(ix+0)
	inc a
	ld (ix+0),a	
ret







null:		;NULL COMMAND MUST BE IN SPECTRUM BLOCK!
ret










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
	save direct "T20-SC1.D01",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif
