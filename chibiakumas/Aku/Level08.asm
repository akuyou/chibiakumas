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

if BuildCPCv+BuildENTv

	screenLeft equ 24
	screenRight equ 184 

else
	screenLeft equ 40
	screenRight equ 168
endif



;MSX_BulletSprites equ 4
;UseBackgroundFloodFillQuadSpriteColumn equ 1
UseBackgroundVert equ 2 ;1 for h and V


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildENT
	write "..\BldENT\T25-SC1.D02"
endif
ifdef buildZXS
	write "..\BldZX\Level08.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T25-SC1.D02"
	else
		write "..\ResMSX\disk1j\T25-SC1.D02"
	endif
;	db &FE     ; magic number
;	dw FileBeginLevel    ; begin address
;	dw FileEndLevel - 1  ; end address
;	dw FileBeginLevel;Execute  ; program execution address (for ,R option)
endif
org Akuyou_LevelStart
;;;;;;;;;;;;;;;;;;; Sprite data must be at top of level code block
FileBeginLevel:
	if BuildCPCv+BuildENTv
		incbin "..\ResCPC\LEVEL8A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL8A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL8A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
;		MSXTiles
;			incbin "..\ResMSX\Level83-Tiles-MSX.RLE"
;		MSXTiles_End

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
	defw SnapperL
	defw SnapperR
SnapperL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000001		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmSpriteMoveProg,20,mveBackground+%00000001,prgSpriteBank0
	defb anmSpriteMoveProg,20,mveBackground+%00000001,prgSpriteBank2
	defb anmSpriteMoveProg,19,mveBackground+%00000001,prgSpriteBank0
	defb anmSpriteMoveProg,128+19,mveBackground+%00000001,PrgFireFast+12
	defb anmSpriteMoveProg,128+19,mveBackground+%00000001,PrgFireFast+12
	defb anmSpriteMoveProg,128+19,mveBackground+%00000001,PrgFireFast+12
	defb anmSpriteMoveProg,19,mveBackground+%00000001,prgSpriteBank0
	defb anmSpriteMoveProg,20,mveBackground+%00000001,prgSpriteBank2
	defb anmSpriteMoveProg,20,mveBackground+%00000001,prgSpriteBank0
	defb anmLoop 				;End of loop	

SnapperR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000001		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmSpriteMoveProg,14,mveBackground+%00000001,prgSpriteBank0
	defb anmSpriteMoveProg,14,mveBackground+%00000001,prgSpriteBank2
	defb anmSpriteMoveProg,15,mveBackground+%00000001,prgSpriteBank0
	defb anmSpriteMoveProg,128+15,mveBackground+%00000001,PrgFireFast+11
	defb anmSpriteMoveProg,128+15,mveBackground+%00000001,PrgFireFast+11
	defb anmSpriteMoveProg,128+15,mveBackground+%00000001,PrgFireFast+11
	defb anmSpriteMoveProg,15,mveBackground+%00000001,prgSpriteBank0
	defb anmSpriteMoveProg,14,mveBackground+%00000001,prgSpriteBank2
	defb anmSpriteMoveProg,14,mveBackground+%00000001,prgSpriteBank0
	defb anmLoop 				;End of loop	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Data Allocations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event_SavedSettingsB:	;2nd bank Saved settings array
	defs 128,&00




EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static


;defb 0,evtResetPowerup
;defb 0,evtReprogramScrollDirection,2; 0-Left (Default) 1-Right 2-Up 3-Down

defb 0,evtReprogramHitHandler				;Install a custom hit handler
defw CustomObjectHitHandler


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

;defb 0
;defb 240+1,0,12*2+1				; (Time,Cmd,Off,Bytes) Load 41 bytes into the background - 41 bytes is the limit
;defb 0,0
;defb 198,&A0	;1
;defb 190,&50	;2
;defb 176,&80	;3
;defb 170,&20	;4
;defb 166,&00	;5
;defb 160,&00	;6
;defb 36,&20	;7
;defb 30,&80	;8
;defb 26,&50	;9
;defb 20,&A0	;10
;defb 02,&F0	;11
;defb 0

;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0

defb 0,evtSetAnimatorPointers
defw	AnimatorPointers


FirstPowerupSprite equ  128+32
defb 0,evtReprogram_PowerupSprites,FirstPowerupSprite+3,FirstPowerupSprite+2,FirstPowerupSprite+1,FirstPowerupSprite	; sprites drone,speed,power,coin

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



; Side Snapper Left
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&1C,lifEnemy+30; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,19;16
defb 	evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSetAnimator,1
defb 	evtSettingsBank_Save,2

;defb 0,evtReprogramCustomMove1
;defw CustomMove1
;defb 	evtSetAnimator,0




; Side Snapper Right
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&1C,lifEnemy+30; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,14	
defb 	evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSetAnimator,2
defb 	evtSettingsBank_Save,3

;defb 0,evtReprogramCustomMove1
;defw CustomMove1




;Floater
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,PrgFireMid+9,mveCustom2+2,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+19	
defb evtAddToForeground
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,4

defb 0,evtReprogramCustomMove2
defw CustomMove2



; Glider Right
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+10,&29,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+19
defb evtAddToForeground
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,5

; Glider Left
defb 0,evtMultipleCommands+6	
defb 	evtSetProgMoveLife,prgFireMid2+10,&2F,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+22
defb evtAddToForeground
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,7



; Falling Rock
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpriteBank2,&74,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,13			;7b
defb 	evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,6

; BigFlame
defb 0,evtMultipleCommands+5
defb 	evtSetProgMoveLife,0,mveBackground+%00000001,lifDeadly+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb evtAddToBackground
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,8

; VolcaRok
defb 0,evtMultipleCommands+5
defb 	evtSetProgMoveLife,0,mveBackground+%00000001,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,9


; Ball of fire
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&61,lifEnemy+20	; &67
defb 	evtSetSprite,TwoFrameSprite+31		;
defb evtAddToBackground
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtSettingsBank_Save,10


; Ball of fire
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&67,lifEnemy+20	; &67
defb 	evtSetObjectSize,24
defb evtAddToBackground
defb 	evtSetAnimator,0
defb 	evtSetSprite,TwoFrameSprite+10		;
defb 	evtSettingsBank_Save,11



SideSnappers
defb 0,evtMultipleCommands +2
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,128+14,screenRight-12,199






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
	defb 0				
	defb &54,&58,&5F,&4B		;Black,DkBlue,LtYellow,White

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 32	;delay			
	defb &54,&5D,&53,&4B


	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&4D,&5B,&4B			


	defb FadeStartPoint+2,evtCallAddress
	defw RasterColorsStartPalleteFlip
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;	defb 5 
;	defb 136				; Jump to a different level point
;	defw LevelEndAnim				; pointer
;	defb 145

;Floater
defb 8,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24

;VolcaRok
defb 16,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,27,screenRight-12,199+24

;VolcaRok
defb 16,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,26,screenLeft,199+24


;Floater
defb 24,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+5
defb	evtSingleSprite,TwoFrameSprite+16,24*6,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*6+12,199+24

;Glider Right
defb 32,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 32,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4



;Ball of fire
defb 32,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb	evtSingleSprite,TwoFrameSprite+31,screenRight-12,199+24-32

;Falling Rock
defb 48,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+40-3,8

;Ball of fire
defb 48,evtMultipleCommands +2
defb 	evtSettingsBank_Load +11
defb	evtSingleSprite,TwoFrameSprite+9,screenLeft+12,199+24-64


;Glider Left
defb 64,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4

;SideSnappers
defb 64,evtMultipleCommands +2
;defb 	evtSettingsBank_Load +3
;defb 	evtSingleSprite,128+14,160-12+24,199
defb 	evtSettingsBank_Load +2
defb 	evtSingleSprite,128+19,screenLeft,199


;Ball of fire
defb 64,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb	evtSingleSprite,TwoFrameSprite+31,screenRight-12,199+24-96+8

;Spike on Left
defb 64,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb	evtSetLife,lifEnemy+30
defb	evtTileSprite+6,screenLeft,199+24,12,	8,8,0,1,2,3



;Ball of fire
defb 72,evtMultipleCommands +2
defb 	evtSettingsBank_Load +11
defb	evtSingleSprite,TwoFrameSprite+9,screenLeft+12,199+24-128+8

;Falling Rock
defb 72,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+120-3,8

;Floater
defb 72,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb	evtSingleSprite,TwoFrameSprite+16,24*6,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*6+12,199+24


;Floater
defb 88,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+6
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24



;Ball of fire
defb 88,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb	evtSingleSprite,TwoFrameSprite+31,screenRight-12,199+24-160+16


;Spike on Right
defb 88,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb	evtSetLife,lifEnemy+30
defb	evtTileSprite+6,screenRight-72,199+24,12,	4,5,6,7,8,8






;Ball of fire
defb 104,evtMultipleCommands +2
defb 	evtSettingsBank_Load +11
defb	evtSingleSprite,TwoFrameSprite+9,screenLeft+12,199+24-192+16


;VolcaRok
defb 116,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,27,screenRight-12,199+24



;VolcaRok
defb 124,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,26,screenLeft,199+24


;Falling Rock
defb 124,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+40-3,8


;Floater
defb 124,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24



;Floater
defb 148,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+6
defb	evtSingleSprite,TwoFrameSprite+16,24*6,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*6+12,199+24

;BigFlame
defb 148,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+5,screenRight-60-12,199+24-47-16,12,	TwoFrameSprite+28,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+30
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+7,screenLeft +12,199+24-47,12,	TwoFrameSprite+10,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+12


;Glider Left
defb 164,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4




;SideSnappers
defb 164,evtMultipleCommands +4
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,128+14,screenRight-12,199
defb 	evtSettingsBank_Load +2
defb 	evtSingleSprite,128+19,screenLeft ,199


;BigFlame
defb 172,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+7,screenRight -84-12,199+24-96-16,12,	TwoFrameSprite+28,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+30
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+5,screenLeft +12,199+24-96,12,	TwoFrameSprite+10,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+12


;Falling Rock
defb 174,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+120-3,8


;Glider Left
defb 196,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;BigFlame
defb 196,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+5,screenRight -60-12,199+24-141-16,12,	TwoFrameSprite+28,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+30
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+7,screenLeft+12,199+24-141,12,	TwoFrameSprite+10,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+12


;Falling Rock
defb 220,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+80-3,8


;Floater
defb 220,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+5
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24


;Glider Right
defb 220,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 220,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4



;Floater
defb 230,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+7
defb	evtSingleSprite,TwoFrameSprite+16,24*6,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*6+12,199+24

;Glider Right
defb 240,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 240,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Floater
defb 250,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24

;Glider Right
defb 1,evtMultipleCommands +4
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,24,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4




;SideSnappers
defb 8,evtMultipleCommands +4
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,128+14,screenRight -12,199
defb 	evtSettingsBank_Load +2
defb 	evtSingleSprite,128+19,screenLeft ,199



;VolcaRok
defb 16,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,27,screenRight-12,199+24

;Glider Left
defb 16,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4



;VolcaRok
defb 24,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,26,screenLeft ,199+24


;Falling Rock
defb 24,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+40-3,8



;VolcaRok
defb 48,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,27,screenRight-12,199+24

;VolcaRok
defb 48,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb	evtSingleSprite,26,screenLeft,199+24


;BigFlame
defb 48,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+5,screenRight -60-12,199+24-47-16,12,	TwoFrameSprite+28,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+30
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+7,screenLeft +12,199+24-47,12,	TwoFrameSprite+10,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+12


;Ball of fire
defb 64,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb	evtSingleSprite,TwoFrameSprite+31,screenRight-12,199+24-32

;BigFlame
defb 72,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+7,screenRight -84-12,199+24-96-16,12,	TwoFrameSprite+28,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+30
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+5,screenLeft +12,199+24-96,12,	TwoFrameSprite+10,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+12


;Glider Right
defb 74,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 74,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Falling Rock
defb 74,evtMultipleCommands +4
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+120-3,8
defb	evtSingleSprite,13,24+80-3,8
defb	evtSingleSprite,13,24+40-3,8


;Floater
defb 80,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24



;Floater
defb 80,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+6
defb	evtSingleSprite,TwoFrameSprite+16,24*6,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*6+12,199+24

;Falling Rock
defb 80,evtMultipleCommands +4
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+40-3,8
defb	evtSingleSprite,13,24+80-3,8
defb	evtSingleSprite,13,24+120-3,8

;Ball of fire
defb 80,evtMultipleCommands +2
defb 	evtSettingsBank_Load +11
defb	evtSingleSprite,TwoFrameSprite+9,screenLeft +12,199+24-64

;Ball of fire
defb 88,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb	evtSingleSprite,TwoFrameSprite+31,screenRight-12,199+24-96+8


;BigFlame
defb 96,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+5,24+160-60-12,199+24-141-16,12,	TwoFrameSprite+28,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+29,TwoFrameSprite+30
defb 	evtSettingsBank_Load +8
defb	evtTileSprite+7,24+12,199+24-141,12,	TwoFrameSprite+10,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+11,TwoFrameSprite+12

;Glider Right
defb 96,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 96,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4



;Spike on Left
defb 102,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb	evtSetLife,lifEnemy+30
defb	evtTileSprite+6,24,199+24,12,	8,8,0,1,2,3





;Ball of fire
defb 104,evtMultipleCommands +2
defb 	evtSettingsBank_Load +11
defb	evtSingleSprite,TwoFrameSprite+9,screenLeft +12,199+24-128+8

;Spike on Right
defb 116,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb	evtSetLife,lifEnemy+30
defb	evtTileSprite+6,screenRight-72,199+24,12,	4,5,6,7,8,8

;Ball of fire
defb 120,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb	evtSingleSprite,TwoFrameSprite+31,screenRight-12,199+24-160+16


;Floater
defb 120,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb	evtSingleSprite,TwoFrameSprite+16,24*6,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*6+12,199+24

;Falling Rock
defb 120,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb	evtSingleSprite,13,24+80-3,8

;Glider Right
defb 120,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 136,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4




;Ball of fire
defb 136,evtMultipleCommands +2
defb 	evtSettingsBank_Load +11
defb	evtSingleSprite,TwoFrameSprite+9,screenLeft +12,199+24-192+16

;Floater
defb 136,evtMultipleCommands +4
defb 	evtSettingsBank_Load +4
defb evtSetMove,mveCustom2+6
defb	evtSingleSprite,TwoFrameSprite+16,24*3,199+24
defb	evtSingleSprite,TwoFrameSprite+17,24*3+12,199+24



;Glider Right
defb 140,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb	evtSingleSprite,TwoFrameSprite+18,screenRight,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4


;Glider Left
defb 150,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb	evtSingleSprite,TwoFrameSprite+21,screenLeft ,24
;defb 	evtSetLife,LifEnemy+10
;defb	evtSingleSprite,TwoFrameSprite+19,24*4+6,24*4




;Spike on Right
defb 150,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb	evtSetLife,lifEnemy+30
defb	evtTileSprite+6,screenRight-72,199+24,12,	4,5,6,7,8,8





;defb 160,%01110000+2			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb 	0,21,80+24,190	; 	; Single Object sprite 11 (animated)




LevelEndAnim:
;defb 160,%01110000+2			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb 	0,128+	20,140+24,100+24	; 	; Single Object sprite 11 (animated)

defb 160,%10001001			;Call a memory location
defw	ClearBadguys



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 161
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


defb 165,evtCallAddress			;Call a memory location
defw	EndLevel

;Illuminate

;Palette Change
;defb 2,%01110000+5			; 4 Commands
;	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
;	defb 1
;	defb 1				
;	defb &54,&40,&4C,&4B	IlluminatedPaletteA_Plus2

;	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
;	defb 1
;	defb 1				
;	defb &54,&40,&4C,&4B	IlluminatedPaletteB_Plus2

;	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
;	defb 0
;	defb 1				
;	defb &54,&40,&4C,&4B	IlluminatedPaletteC_Plus2	

;	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
;	defb 1
;	defb 1				
;	defb &54,&40,&4C,&4B	IlluminatedPaletteD_Plus2

;defb 	evtJumpToNewTime
;defw 	&6969		EndIlluminatePointer_Plus2	; pointer
;defb	 &69		EndIlluminateTime_Plus1	; new time




EndLevel:
	pop hl	;
	ld hl,	&01FA
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return


ClearBadguys:
	ld a,1
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret



LevelInit:
	

	;flip around our play character
	call AkuYou_Player_GetPlayerVars

	ld a,40+32
	ld (iy+0),a
	ld (iy+0+Akuyou_PlayerSeparator),a

	ld a,80+24-16
	ld (iy+1),a
	ld a,80+24+16
	ld (iy+1+Akuyou_PlayerSeparator),a


	ld a,2
	call Akuyou_Background_SetScroll


	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"


	;call RasterColors_Reset
LevelLoop:





read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"



read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"




	jp LevelLoop

LevelShutdown:

ret












CustomMoveHandlerQuadSpriteYoYo:


	push de
		ld d,mveBackground+1 ; Move
		call Akuyou_DoMoves
	pop de
	;    +          -  
	; 0  1 2  3  4  5   6    7 
	;1a 1b 2a 2b 2b 2a  1b   1a

;	Akuyou_ObjectProgram_SpriteBankSwitch
	call Akuyou_Timer_GetTimer



	ldai
	and %00000111
	ret z
	cp  %00000110 ;bit a,2
	jr z, CustomMoveHandlerQuadSpriteResetSprite	
	cp  %00000010 ;bit a,1
	jr z, CustomMoveHandlerQuadSpriteIncSprite
	

CustomMoveHandlerQuadSpriteContinue:
	cp %00000101
	jr c,CustomMoveHandlerQuadSpriteContinue2
	cpl
CustomMoveHandlerQuadSpriteContinue2:
	bit 0,a
	ret nz
	jp Akuyou_ObjectProgram_SpriteBankSwitch


CustomMoveHandlerQuadSpriteIncSprite:
	ld a,iyh
	inc a
	ld iyh,a
	jr CustomMoveHandlerQuadSpriteContinue

CustomMoveHandlerQuadSpriteResetSprite
	ld a,iyh
	dec a
	ld iyh,a
	jr CustomMoveHandlerQuadSpriteContinue


CustomObjectHitHandler:

	ld a,ixh
	and %11110000
	cp mveCustom2
	jr nz,CustomObjectHitHandler_Finish	
	

	ld a,ixl
	cp lifEnemy+3
	jp nc,CustomObjectHitHandler_Finish
	ld a,ixh
	di 
	exx
	push ix
		call GetCustomRam
		xor a
		ld (ix+3),a
	pop ix
	exx
	ld a,1
	ld ixl,a
	ei
CustomObjectHitHandler_Finish:
	jp Akuyou_Object_DecreaseLifeShot



CustomMove1:
	di
	exx
	ld hl,null
	ld de,CustomMoveHandlerQuadSpriteYoYo
	ld bc,CustomMovePattern_Init30

jr CustomMovePattern


CustomMove2:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternWaveB_With_Lifelink ; need CustomObjectHitHandler 
	ld bc,CustomMovePattern_InitLifeLink

;	ld de,CustomMovePatternLifeLinkB
;	ld bc,CustomMovePattern_InitLifeLink
jr CustomMovePattern

CustomMovePatternWaveB_With_Lifelink:
	call CustomMovePatternWaveB
	jp CustomMovePatternLifeLinkB


CustomMove3:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternCircleInfiniteb
	ld bc,CustomMovePattern_Init10

jr CustomMovePattern


CustomMove4:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternLifeLinkB
	ld bc,CustomMovePattern_InitLifeLink

jr CustomMovePattern

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

CustomMovePattern_InitImmortal:
	call CustomMovePattern_Init
	ld a,0		;New Life
ret
CustomMovePattern_InitInvincible:
	call CustomMovePattern_Init
	ld a,lifDeadly+63		;New Life

ret

CustomMovePattern_Init10:
	call CustomMovePattern_Init
	ld a,lifEnemy+10		;New Life
ret
CustomMovePattern_Init30:
	call CustomMovePattern_Init
	ld a,lifEnemy+30		;New Life
ret

CustomMovePattern_InitLifeLink:
	call CustomMovePattern_Init
	ld a,lifEnemy+10		;New Life
	ld (ix+3),a
ret

CustomMovePattern_Init:

	xor a
	;exx
	;B=X
	;C=Y
	;exx

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



CustomMovePatternLifeLinkB:
	ld a,(ix+3)
	and %00111111
	jp z,CustomMovePatternKill

	ld a,(ix+3)
	exx
	ld b,a
	ex af,af'

	cp b
	jr nc,CustomMovePatternLifeLinkGreater
	ld (ix+3),a
	jr CustomMovePatternLifeLinkDone	
CustomMovePatternLifeLinkGreater:
	ld a,b
;	ld (ix+3),a
CustomMovePatternLifeLinkDone:
	ex af,af'
	exx
ret

CustomMovePatternWaveB:
	ld a,(ix+0)

	and %00111111 ; Size of wave
CustomMovePatternWaveContinue
		
	cp 32 ; Size of wave
	jr C,CustomMovePatternWaveLeft

	inc b ; this happens half the time 
	jr CustomMovePatternWaveDone

CustomMovePatternWaveLeft:
	dec b ; this happens half the time 
	jr CustomMovePatternWaveDone

CustomMovePatternWaveDone:	
	dec c	; this happens every move
ret

CustomMovePatternKill:
	;ex af,af'
	;xor a
	
	ld b,0
	ld c,b
	ld D,b
	;ex af,af'
ret

;CustomMovePatternCircle: ;
;
;	ld a,(ix+0)
;	inc a
;	ld (ix+0),a	
;ret

CustomMovePatternCircleb:
	;ld a,(ix+2)
	;or a
	;jr nz,CustomMovePatternCirclebMoveLeftDone

	call Akuyou_Timer_GetTimer
	bit 2,a
	jr z,CustomMovePatternCirclebMoveLeftDone

	inc b
	;ld a,(ix+0)
	;cp 192
	;jr nz,CustomMovePatternCirclebMoveLeftDone
	;ld a,1
	;ld (ix+2),a

CustomMovePatternCirclebMoveLeftDone:
	ld a,(ix+0)
	cpl
	;and %11110000
	and %00111100
	rrca
	rrca
	jr CustomMovePatternCircleProcess




CustomMovePatternCircleInfiniteb:
	ld a,(ix+2)

	or a
	jr nz,CustomMovePatternCircleInfinitebMoveLeftDone

	call Akuyou_Timer_GetTimer
	bit 2,a
	jr z,CustomMovePatternCircleInfinitebMoveLeftDone

	inc b
	ld a,(ix+0)
	cp 128
	jr NC,CustomMovePatternCircleInfinitebMoveLeftDone
	ld a,1
	ld (ix+2),a

CustomMovePatternCircleInfinitebMoveLeftDone:
	ld a,(ix+0)
	cpl
	and %01111000
	rrca
	rrca
	rrca
	jr CustomMovePatternCircleProcess




CustomMovePatternCircleProcess:
	exx
	;push bc
	;push hl
		ld hl,CustomMovePatternVector
		ld b,0
		ld c,a
		add hl,bc	;add twice for a two byte address
		add hl,bc
		ld a,(hl)		; read the two bytes in		
		inc hl
		ld h,(hl)
		ld l,a		; hl now is the memory loc of the line
		ld (CircleJump_Plus2-2),hl
	;pop hl
	;pop bc
	exx
	jp CustomMovePatternCircle1:CircleJump_Plus2


CustomMovePatternVector:
defw CustomMovePatternCircle1
defw CustomMovePatternCircle2
defw CustomMovePatternCircle3
defw CustomMovePatternCircle4
defw CustomMovePatternCircle5
defw CustomMovePatternCircle6
defw CustomMovePatternCircle7
defw CustomMovePatternCircle8
defw CustomMovePatternCircle9
defw CustomMovePatternCircle10
defw CustomMovePatternCircle11
defw CustomMovePatternCircle12
defw CustomMovePatternCircle13
defw CustomMovePatternCircle14
defw CustomMovePatternCircle15
defw CustomMovePatternCircle16

CustomMovePatternCircle1:	
	
	dec c	
	dec c
	
CustomMovePatternCircle2:	

	dec c	
	dec c	

CustomMovePatternCircle3:	
	dec b	
	dec b
	jr CustomMovePatternCircleDone

CustomMovePatternCircle5:	

	inc c
	inc c

CustomMovePatternCircle4:	
	dec b	
	dec b
	inc c
	inc c
	jr CustomMovePatternCircleDone
CustomMovePatternCircle6:	
	dec b	

CustomMovePatternCircle7:
	inc c
	inc c	

	inc c	
	inc c
	jr CustomMovePatternCircleDone
CustomMovePatternCircle8:
	inc b
	inc c	
	inc c

	inc c	
	inc c
	jr CustomMovePatternCircleDone
CustomMovePatternCircle9:	

	inc c	
	inc c

CustomMovePatternCircle10:	
	inc b
	inc b	
	inc c	
	inc c	
	jr CustomMovePatternCircleDone


CustomMovePatternCircle13:	
	dec c	
	dec c	
CustomMovePatternCircle12:	

	dec c
	dec c	
CustomMovePatternCircle11:	
	inc b
	inc b	
	jr CustomMovePatternCircleDone
CustomMovePatternCircle14:	
	inc b	
CustomMovePatternCircle15:	
	dec c	
	dec c	
	dec c	
	dec c	
	jr CustomMovePatternCircleDone
CustomMovePatternCircle16:	
	dec b
	dec c	
	dec c	
	dec c	
	dec c	
	jr CustomMovePatternCircleDone

CustomMovePatternCircleDone:
;	ld a,b
;	cp 160+24
;	jp NC,CustomMovePatternKill
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



;Allow objects to be reprogrammed
read "Core_ObjectReprogrammers.asm"

;Warp the bullet array (for boss battles)
read "Core_StarArrayWarp.asm"


ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	


ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
	read "..\SrcMSX\Akuyou_MSX_BackgroundTileVertical.asm"
endif

if BuildCPCv+BuildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
	read "CoreBackground_SolidFill.asm"
;	read "CoreBackground_QuadSprite.asm"
;	read "CoreBackground_QuadSpriteColumn.asm"
;	read "CoreBackground_bitshifter.asm"
;	read "CoreBackground_bitshifterDouble.asm"

;	read "CoreBackground_QuadSpriteVerticalParalax.asm"
	read "CoreBackground_QuadSpriteVertical.asm"
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
		incbin "..\ResCPC\Level8-Tiles-CPC.SPR"
		align 256	;For safety!
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level08-Tiles-ZX.TSP"

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


		if BuildCPCv+BuildENTv
			call Akuyou_Timer_GetTimer
			;ld (BitshifterTicksOccured_Plus1-1),a
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


VDP_MyHMMV:
VDP_MyHMMV_DX:	defw &0020 ;DX 36,37
VDP_MyHMMV_DY:	defw &0000 ;DY 38,39
VDP_MyHMMV_NX:	defw &00C0 ;NX 40,41
VDP_MyHMMV_NY:	defw &00C0 ;NY 42,43
VDP_MyHMMVByte:	defb 0   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	


Background_DrawB: 		

	di
		call Akuyou_ScreenBuffer_GetActiveScreen
		ld (VDP_MyHMMV_DY+1),a

		ld a,1
		ld hl,VDP_MyHMMV
		call Akuyou_VDP_CommandNum	;VDP_HMMV_BusyCheck



		ld a,9
		ld d,0
		call Akuyou_VDP_CommandNum	;Get Sprite Bank

		ld hl,Akuyou_LevelStart

		ld b,36
		ld a,8
		call Akuyou_VDP_CommandNum	;Get Sprite Pos
		ld (TileYOffset_Plus2-2),iy
		ld (TileXOffset_Plus2-2),ix




		ld ix,NewGradientMSX2
		ld hl,MSXTileList
;		ld de,MSXTileList
		call Background_Tiles_Vertical
;		call Akuyou_Background_Tiles

;		ld de,MSXFills
;		ld hl,0000;NewGradientV9990
;		ld b,192
;		jp Akuyou_Background_Gradient

	ei
ret

MSX2V9990:			;V9990 version
di




		ld hl,Akuyou_V9K_Paralax_Y

		ld (TileYOffset_Plus2-2),hl
		ld hl,&0000
		ld (TileXOffset_Plus2-2),hl


		ld hl,MSXTileListBackgroundV9990

		call Background_Tiles_Vertical







		ld a,9
		ld d,0
		call Akuyou_VDP_CommandNum	;Get Sprite Bank

		ld hl,Akuyou_LevelStart

		ld b,36
		ld a,8
		call Akuyou_VDP_CommandNum	;Get Sprite Pos
		ld (TileYOffset_Plus2-2),iy
		ld (TileXOffset_Plus2-2),ix

;		ld a,3
;		call Akuyou_VDP_CommandNum	;Set tile pos


		ld ix,NewGradientMSX2
		ld hl,MSXTileList
		ld de,MSXTileList
		call Background_Tiles_Vertical

ei
ret

Background_DrawMsx2:		;Foreground Paralax layer V9990 only
nop		;For smartbomb call



;push iy
;pop hl

;		di 
;		halt

;	defw VDP_GetSpritePos			;8
;	defw VDP_GetBankYpos			;9

;		ld hl,Akuyou_V9K_Paralax_Y
;		ld a,3
;		call Akuyou_VDP_CommandNum	;Set tile pos






		ld hl,&0000	;V9k only
		ld de,MSXTileListForegroundV9990
		call Background_Tiles_Vertical
ret
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 				SPECCY and CPC background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifndef buildMSX			
	GradientTopStart equ 40

TileSprite_Vert1 equ 44
;TileSprite_Vert2 equ 45
;TileSprite_Vert3 equ 46
;TileSprite_Vert4 equ 47
TileSprite_Vert1b equ 44
;TileSprite_Vert2b equ 49
;TileSprite_Vert3b equ 50
;TileSprite_Vert4b equ 51

Background_DrawB: 
ifdef BuildZXS
			push bc
			push hl
			push de
				call Akuyou_INT_Force
			pop de
			pop hl
			pop bc
endif
;	call UpdateParalaxUp
if BuildCPCv+BuildENTv
	ei
endif
	push hl

		;two frame flipper
;		ld b,TileSprite_Vert1b TileSprite_VertNextB_Plus1
;		ld a,TileSprite_Vert1 TileSprite_VertNextAuto_Plus1
;		cp b
;		ld a,TileSprite_Vert1 TileSprite_VertNext_Plus1
;		jr z,TileSprite_VertSwapB
;		ld a,b
;TileSprite_VertSwapB
;		ld (TileSprite_VertNextAuto_Plus1-1),a


		VTileSize equ 32
		ld a,0
		ld de,LevelTiles

		ifdef buildZXS
			call Akuyou_GetSpriteMempos
		else
			call GetSpriteMempos	
		endif	


		;ex hl,de
			;MUST BE BYTE ALIGNED!
	pop hl

		
		
		push de


			;incomplete first bit
			push hl
				ld hl,&0008
				ld a,(FirstTileCount_Plus1-1)
				add 1	:VertMoveSpeed_Plus1
;				jr nc,TileCont - if using sub 1
				cp VTileSize
				jr nz,TileCont
				ld a,0;VTileSize-1
TileCont:

				ld (FirstTileCount_Plus1-1),a
				ld (SecondTileCount_Plus1-1),a
				ld hl,TileskipLookup

				add l
				ld l,a
				ld l,(hl)
				ld h,0
				add hl,de
				ex hl,de
			pop hl
			ld a,VTileSize
			sub 4 :FirstTileCount_Plus1
			ld b,a
			call BackgroundFloodFillQuadSpriteVertical
		pop de


	ld c,192/VTileSize-1
MoreVTiles:
	ld b,VTileSize
;	push bc
		push de
			call BackgroundFloodFillQuadSpriteVertical

		pop de
;	pop bc
	dec c
	jp nz,MoreVTiles


ifdef BuildZXS
			push bc
			push hl
			push de
				call Akuyou_INT_Force
			pop de
			pop hl
			pop bc
endif
	
	;last bit
if BuildCPCv+BuildENTv
	ld a,8		;Extra to fill bottom of screen
else
	xor a
endif
	add 16-4 :SecondTileCount_Plus1
	ld b,a
	cp VTileSize
	call nc,MoreVTilesExtra
	xor a
	cp b
	ret z
	call BackgroundFloodFillQuadSpriteVertical


	ifdef buildZXS


		call Akuyou_ScreenBuffer_GetActiveScreen	
		add &18
		ld d,a
		ld e,0
		push de
			ld bc,32
			ld hl,SpeccyBackgroundStrip
			ldir
		pop hl
		ld bc,&300-32
		ldir

	ret

	endif

x
ret
;ret
MoreVTilesExtra:
	push de
	push bc
		ld b,32
		call BackgroundFloodFillQuadSpriteVertical
	pop bc
	pop de
	ld a,-32
	add b
	ld b,a
	ret

align 32,0
TileskipLookup: 
defb 8*0,8*1,8*2,8*3,8*4,8*5,8*6,8*7,8*8,8*9,8*10,8*11,8*12,8*13,8*14,8*15
defb 8*16,8*17,8*18,8*19,8*20,8*21,8*22,8*23,8*24,8*25,8*26,8*27,8*28,8*29,8*30,8*31


SpeccyBackgroundStrip:
defb 7,7
defb 2,2
defs 32-8,5
defb 2,2
defb 7,7

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
	defb 0,32;40
	defw 	0 ;ypos
	defw 	0 ;xpos
	defb 	%11111100,0
	defb 256-32,32;40
	defw 	0 ;ypos
	defw 	32 ;xpos
	defb 	%11111100,0
	defb 0,0



MSXTileListBackgroundV9990:
	defb 0,255
	defw 	192 ;ypos
	defw 	0 ;xpos
	defb 	%11100000,0
	defb 0,255
	defw 	0 ;ypos
	defw 	0 ;xpos
	defb 	%11110000,0
	defb 0,64
	defw 	192+192 ;ypos
	defw 	0 ;xpos
	defb 	%11111000,0
	defb 256-64,64
	defw 	192+192 ;ypos
	defw 	64 ;xpos
	defb 	%11111000,0
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
	defb 	%11111000,0
;	defb 60,16 ;76
;	defw 	MsxTilesPos+8+16+8+8
;	defb 	%11111000,0
;	defb 112,16;128
;	defw 	MsxTilesPos+8
;	defb 	%11111000,0
	defb 144,8;152
	defw 	MsxTilesPos+16+8
	defb 	%11111000,0
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

if BuildCPCv+BuildENTv
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
	defw &007A
	defw &0DAF;14  -GRB
	defw &0FFF;13  -GRB
	defb 50
	defw &0000
	defw &0069
	defw &0C9F;14  -GRB
	defw &0FFF;13  -GRB


	defb 75
	defw &0000
	defw &0069
	defw &0B8F;14  -GRB
	defw &0EEF;13  -GRB

	defb 100
	defw &0000
	defw &0058
	defw &0A8F;14  -GRB
	defw &0EEF;13  -GRB

	defb 125
	defw &0000
	defw &0058
	defw &0A8F;14  -GRB
	defw &0EEF;13  -GRB

	defb 150
	defw &0000
	defw &0047
	defw &086D;14  -GRB
	defw &0CCD;13  -GRB
	defb 175

	defw &0000
	defw &0036
	defw &064B;14  -GRB
	defw &0AAB;13  -GRB

	defb 200
	defw &0000
	defw &0024
	defw &0429;14  -GRB
	defw &0889;13  -GRB

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
	defb 0			
	defb &54,&5D,&53,&4B		;58

RasterColors_ColorArray2Alt:
	defb 1	; Switches
	defb 32	;delay			
	defb &54,&5D,&53,&4B

RasterColors_ColorArray3Alt:
	defb 0
	defb 1
	defb &54,&54,&54,&54		 :IlluminatedPaletteCAlt_Plus2
RasterColors_ColorArray4Alt:
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5D,&5B,&4B		

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
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0FFF;4  -GRB
defw &00A6;5  -GRB
defw &0D0F;6  -GRB
defw &00F5;7  -GRB
defw &0F05;8  -GRB
defw &07FC;9  -GRB
defw &0333;10  -GRB
defw &0BF0;11  -GRB
defw &0258;12  -GRB
defw &0039;13  -GRB
defw &000E;14  -GRB
defw &081E;15  -GRB





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
;	read "CoreBackground_bitshifterDouble.asm"

;	read "CoreBackground_QuadSpriteVerticalParalax.asm"
	read "CoreBackground_QuadSpriteVertical.asm"
endif 







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
	save direct "T25-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif



