F;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
; replace ldia 
; Check NULL is in spectrum copied block

;replace background object definitions
; Replace object reprogrammers



;Debug_ShowLevelTime equ 1

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

RightSlow equ &25
ifdef BuildENT
	write "..\BldENT\T20-SC1.D02"
endif
ifdef buildZXS
	write "..\BldZX\Level07.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T20-SC1.D02"
	else
		write "..\ResMSX\disk1j\T20-SC1.D02"
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
		incbin "..\ResCPC\LEVEL7A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL7A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL7A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level7-Tiles-MSX.RLE"
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
	defw AniDekaWooRei
AniDekaWooRei:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00010000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmMove,&1B,0,0		;Sprite Anim
	defb anmMove,&2B,0,0		;Sprite Anim
	defb anmLoop,0,0,0			;End of loop	



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Data Allocations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event_SavedSettingsB:	;2nd bank Saved settings array
	defs 128,&00




EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static

;;
defb 0,evtResetPowerup
;defb 0,evtReprogramScrollDirection,1

defb 0,evtSetAnimatorPointers
defw	AnimatorPointers

defb 0,evtReprogramHitHandler				;Install a custom hit handler
defw CustomObjectHitHandler

defb 0,evtReprogramObjectFullCustomMoves
defw CustomMoveHandler



; Define the background

;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0




defb 0,evtReprogram_PowerupSprites,128+44,128+43,128+42,128+41	; sprites drone,speed,power,coin

defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,RightSlow,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,1	
								; Save Object settings to Bank 0
defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,RightSlow,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,0				; Save Object settings to Bank 1


; KabiKami
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,PrgFireMid+12,mveCustom1,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+0		
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,2

defb 0,evtReprogramCustomMove1
defw CustomMove1

;white spirit
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,PrgFireMid+12,mveCustom2+1,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+30		
defb 	evtSettingsBank_Save,3

defb 0,evtReprogramCustomMove2
defw CustomMove2

;dark spirit
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,PrgFireMid+14,mveCustom3+2,lifCustom; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+33		
defb 	evtSettingsBank_Save,4

defb 0,evtReprogramCustomMove3
defw CustomMove3


; Flamer
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+14,mveWave+%00000000,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+32
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,5

; BlobberL
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+9,&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+31
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,6

; BlobberR
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+10,RightSlow,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+40
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,7

; GhostMan
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+20,&2D,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+27
defb 	evtSettingsBank_Save,8


; Jelly Fishy
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+20,&1D,lifEnemy+15	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+39
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,9


; Fire!,Fly!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+12,mveCustom1+2,lifCustom	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,10

; Lumipede
defb 0,evtMultipleCommands+6					; 3 commandrs at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+3,RightSlow,lifEnemy+5	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+35
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,11



;DekaWooRei
defb 0,evtMultipleCommands +6

defb  evtSetProgMoveLife,prgFireMid+11,&2B,lifEnemy+63
defb 	evtSetSprite,TwoFrameSprite+10
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,12

;
defb 0,evtMultipleCommands+5
ifdef BuildMSX
	defb evtSetProgMoveLife,PrgBitShift,RightSlow,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
endif
ifdef BuildZXS
	defb evtSetProgMoveLife,PrgBitShift,RightSlow,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
endif
if buildCPCv+buildENTv
	defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
endif
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,13				; Save Object settings to Bank 1


if buildCPCv+buildENTv
	;Stone Bottom
	defb 0,evtMultipleCommands +7
	defb 	evtSettingsBank_Load +13
	defb 	evtSingleSprite,TwoFrameSprite+16 ,0+16+0,200	;16 - 17 - 18
	defb 	evtSingleSprite,TwoFrameSprite+17 ,0+16+60,200	;16 - 17 - 18
	defb 	evtSingleSprite,TwoFrameSprite+18 ,0+16+90,200	;16 - 17 - 18
	defb 	evtSingleSprite,TwoFrameSprite+22 ,0+16+50,24	;20 - 22 - 23
	defb 	evtSingleSprite,TwoFrameSprite+20 ,0+16+10,24	;20 - 22 - 23
	defb 	evtSingleSprite,TwoFrameSprite+19 ,0+16+100,24	;20 - 22 - 23
else
	defb 0,evtMultipleCommands +7
	defb 	evtSettingsBank_Load +13
	defb 	evtSingleSprite,16 ,0+16+0,200	;16 - 17 - 18
	defb 	evtSingleSprite,17 ,0+16+60,200	;16 - 17 - 18
	defb 	evtSingleSprite,18 ,0+16+90,200	;16 - 17 - 18
	defb 	evtSingleSprite,22 ,0+16+50,32	;20 - 22 - 23
	defb 	evtSingleSprite,20 ,0+16+10,32	;20 - 22 - 23
	defb 	evtSingleSprite,19 ,0+16+100,32	;20 - 22 - 23
endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 				Start of fade in block 

FadeStartPoint equ 0	;Start of fade point
			; Fade lasts two timers - ends FadeStartPoint+2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildZXS
	defb FadeStartPoint+0,evtCallAddress
	defw	 setSpectrumFadeBlue

;	defb FadeStartPoint+1,evtCallAddress
;	defw	 SetSpectrumFadeDark

;	defb FadeStartPoint+2,evtCallAddress
;	defw	 SetSpectrumFadeOff
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



endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;Torch
defb 2,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb 	evtSetProg,0
defb 	evtSingleSprite,TwoFrameSprite+14 ,0+16,24*3+7


;Phosphor Rock
;defb 2,evtMultipleCommands +2
;defb 	evtSettingsBank_Load +0
;defb 	evtSingleSprite,36 ,0+16,200


;	defb 5 
;	defb 136				; Jump to a different level point
;	defw EndOfLevel				; pointer
;	defb 150


;White Spirit
defb 3,evtMultipleCommands +2
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,TwoFrameSprite+30 ,0+16,24*4-12



;Stone Bottom
defb 3,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+17 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,17 ,0+16,200	;16 - 17 - 18
endif

; Powerup Drone
defb 5,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&1C,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
ifdef builCPC
	defb 	evtSingleSprite,TwoFrameSprite+44,20+24,200+24	; 	; Single Object sprite 11 (animated)
	defb 15, evtSingleSprite,TwoFrameSprite+44,140+24,200+24	; 	; Single Object sprite 11 (animated)

	defb 35, evtSingleSprite,TwoFrameSprite+42,80+24,200+24	; 	; Single Object sprite 11 (animated)

else
	defb 	evtSingleSprite,TwoFrameSprite+44,20+24,192+24	; 	; Single Object sprite 11 (animated)
	defb 15, evtSingleSprite,TwoFrameSprite+44,130+24,192+24	; 	; Single Object sprite 11 (animated)
	defb 35, evtSingleSprite,TwoFrameSprite+42,80+24,192+24	; 	; Single Object sprite 11 (animated)
endif
;




;Stone Top
defb 35,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+20 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,20 ,0+16,32	;20 - 22 - 23
endif


;GhostMan Duo
defb 35,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb 	evtSingleSprite+2
defb 	evtSetMove,&1D
defb 	evtSingleSprite+13

ifdef builCPC
	; Powerup Rate
	defb 45,evtMultipleCommands+2			; 2 commands at the same timepoint
	defb 	evtSetProgMoveLife,3,&1C,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
	defb 	evtSingleSprite,TwoFrameSprite+43,20+24,200+24	; 	; Single Object sprite 11 (animated)
	defb 55, evtSingleSprite,TwoFrameSprite+43,140+24,200+24	; 	; Single Object sprite 11 (animated)
else
	; Powerup Rate
	defb 45,evtMultipleCommands+2			; 2 commands at the same timepoint
	defb 	evtSetProgMoveLife,3,&1C,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
	defb 	evtSingleSprite,TwoFrameSprite+43,20+24,192+24	; 	; Single Object sprite 11 (animated)
	defb 55, evtSingleSprite,TwoFrameSprite+43,130+24,192+24	; 	; Single Object sprite 11 (animated)
endif

;Stone Top
defb 55,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+22 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,22 ,0+16,32	;20 - 22 - 23
endif



;Flamer
defb 55,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite,TwoFrameSprite+32 ,160+24,24*7

;BlobberR
defb 60,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb 	evtSingleSprite+3


;BlobberL
defb 65,evtMultipleCommands +5
defb 	evtSettingsBank_Load +6
defb 	evtSingleSprite,TwoFrameSprite+31 ,160+24,200-16
;rock Down
defb 	evtSettingsBank_Load +0
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,24*1,24,5,6,7,8,9


;White Spirit
defb 70,evtMultipleCommands +2
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,TwoFrameSprite+30 ,0+16,24*8-12



;Stone Bottom
defb 70,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+17 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,17 ,0+16,200	;16 - 17 - 18
endif



;Flamer
defb 75,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite,TwoFrameSprite+32 ,160+24,24*7

;Dark Spirit
defb 80,evtMultipleCommands +2
defb 	evtSettingsBank_Load +4
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


;DekaWooRei
defb 85,evtMultipleCommands +2
defb 	evtSettingsBank_Load +12
defb 	evtSingleSprite,TwoFrameSprite+10 ,160+12,24*6


;BlobberL
defb 90,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb 	evtSingleSprite,TwoFrameSprite+31 ,160+24,200-16

;rock up
defb 95,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,200-120+24,24,0,1,2,3,4

;BlobberR
defb 100,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb 	evtSingleSprite+3



;Stone Top Mid
defb 100,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+20 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,20 ,0+16,32	;20 - 22 - 23
endif




;Phosphor Rock
defb 100,evtMultipleCommands +2
defb 	evtSettingsBank_Load +0
defb 	evtSingleSprite,36 ,0+16,200


;BlobberL
defb 110,evtMultipleCommands +2
defb 	evtSettingsBank_Load +6
defb 	evtSingleSprite,TwoFrameSprite+31 ,160+24,200-16

;BlobberR
defb 115,evtMultipleCommands +2
defb 	evtSettingsBank_Load +7
defb 	evtSingleSprite+3

;DekaWooRei
defb 115,evtMultipleCommands +2
defb 	evtSettingsBank_Load +12
defb 	evtSingleSprite,TwoFrameSprite+10 ,160+12,24*3



;Lumipede
defb 120,evtMultipleCommands +4
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+35 ,24-6,200-16
defb 	evtSetProg,prgFireMid+1
defb 	evtSingleSprite,TwoFrameSprite+34 ,24-12,200-16


;Stone Bottom Mid
defb 120,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+17 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,17 ,0+16,200	;16 - 17 - 18
endif

;Dark Spirit
defb 125,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+5
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


;Dark Spirit
defb 135,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb    evtSetMove,mveCustom3+6
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


; Fire!,Fly!
defb 140,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+5



;Dark Spirit
defb 145,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+7
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


;Dark Spirit
defb 155,evtMultipleCommands +2
defb 	evtSettingsBank_Load +4
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12



;Stone Top
defb 155,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+20 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,20 ,0+16,32	;20 - 22 - 23
endif


;Lumipede
defb 160,evtMultipleCommands +4
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+35 ,24-6,200-16
defb 	evtSetProg,prgFireMid+1
defb 	evtSingleSprite,TwoFrameSprite+34 ,24-12,200-16

;rock Down
defb 165,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,24*1,24,5,6,7,8,9



;White Spirit
defb 170,evtMultipleCommands +2
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,TwoFrameSprite+30 ,0+16,24*8-12


;Stone Bottom
defb 180,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+17 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,17 ,0+16,200	;16 - 17 - 18
endif




;Lumipede
defb 180,evtMultipleCommands +4
defb 	evtSettingsBank_Load +11
defb 	evtSingleSprite,TwoFrameSprite+35 ,24-6,200-16
defb 	evtSetProg,prgFireMid+1
defb 	evtSingleSprite,TwoFrameSprite+34 ,24-12,200-16


; Fire!,Fly!
defb 185,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+10


;GhostMan Duo
defb 190,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb 	evtSingleSprite+2
defb 	evtSetMove,&1D
defb 	evtSingleSprite+13


;rock up
defb 195,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,200-120+24,24,0,1,2,3,4

;Water
defb 206,evtMultipleCommands +7
defb 	evtAddToBackground
defb 	evtSettingsBank_Load +0
defb 	evtSetProg,0
defb 	evtTileSprite+4,16,24,48,128+38,128+38,128+38,128+38
defb 	evtTileSprite+4,16+6,24,48,128+38,128+38,128+38,128+38
defb 	evtTileSprite+4,16-6,24,48,128+38,128+38,128+38,128+38
defb	evtAddToForeground

;Jelly Fishy
defb 206,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb 	evtSingleSprite,TwoFrameSprite+39 ,16,200

;KabiKami
defb 210,evtMultipleCommands +3
defb 	evtSettingsBank_Load +2
defb 	evtSingleSprite,TwoFrameSprite+28 ,0+16,24*3+7
defb 	evtSetLife,lifEnemy+10
defb 211,evtSingleSprite,TwoFrameSprite+29 ,0+16,24*5+7
defb 212,evtSingleSprite,TwoFrameSprite+28 ,0+16,24*7+7


;Jelly Fishy
defb 218,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb 	evtSingleSprite,TwoFrameSprite+39 ,16+48,200

;White Spirit
defb 220,evtMultipleCommands +2
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,TwoFrameSprite+30 ,0+16,24*8-12



;Stone Bottom Mid
defb 220,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+17 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,17 ,0+16,200
endif


;Jelly Fishy
defb 230,evtMultipleCommands +3
defb 	evtSettingsBank_Load +9
defb    evtSetProg,prgFireFast+16
defb 	evtSingleSprite,TwoFrameSprite+39 ,16+96,200

; Fire!,Fly!
defb 235,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+10


;Jelly Fishy
defb 242,evtMultipleCommands +3
defb 	evtSettingsBank_Load +9
defb    evtSetProg,prgFireFast+16
defb 	evtSingleSprite,TwoFrameSprite+39 ,16+144,200

;Stone Top Mid
defb 250,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+20 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,20 ,0+16,32	;20 - 22 - 23
endif


; Fire!,Fly!
defb 250,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+7

; Fire!,Fly!
defb 1,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+3
;evtAddToForeground equ 135
;evtAddToBackground equ 134


;rock Down
defb 1,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,24*1,24,5,6,7,8,9




;Water
defb 6,evtMultipleCommands +7
defb 	evtAddToBackground
defb 	evtSettingsBank_Load +0
defb 	evtSetProg,0
defb 	evtTileSprite+4,16,24,48,128+38,128+38,128+38,128+38
defb 	evtTileSprite+4,16+6,24,48,128+38,128+38,128+38,128+38
defb 	evtTileSprite+4,16-6,24,48,128+38,128+38,128+38,128+38
defb	evtAddToForeground




;Jelly Fishy
defb 6,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb 	evtSingleSprite,TwoFrameSprite+39 ,16,200


;rock up
defb 10,evtMultipleCommands +3
defb 	evtSettingsBank_Load +0
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,200-120+24,24,0,1,2,3,4



; Fire!,Fly!
defb 10,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+10

;White Spirit
defb 15,evtMultipleCommands +2
defb 	evtSettingsBank_Load +3
defb 	evtSingleSprite,TwoFrameSprite+30 ,0+16,24*8-12





;Jelly Fishy
defb 18,evtMultipleCommands +2
defb 	evtSettingsBank_Load +9
defb 	evtSingleSprite,TwoFrameSprite+39 ,16+48,200



;Stone Top
defb 25,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+19 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,19 ,0+16,32	;20 - 22 - 23
endif

;GhostMan Duo
defb 25,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb 	evtSingleSprite+2
defb 	evtSetMove,&1D
defb 	evtSingleSprite+13

;Jelly Fishy
defb 30,evtMultipleCommands +3
defb 	evtSettingsBank_Load +9
defb    evtSetProg,prgFireFast+16
defb 	evtSingleSprite,TwoFrameSprite+39 ,16+96,200

;Flamer
defb 35,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite,TwoFrameSprite+32 ,160+24,24*5


;GhostMan Duo
defb 35,evtMultipleCommands +4
defb 	evtSettingsBank_Load +8
defb 	evtSingleSprite+2
defb 	evtSetMove,&1D
defb 	evtSingleSprite+13


;Stone Bottom
defb 35,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+18 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,18 ,0+16,200	;16 - 17 - 18
endif

;Jelly Fishy
defb 42,evtMultipleCommands +3
defb 	evtSettingsBank_Load +9
defb    evtSetProg,prgFireFast+16
defb 	evtSingleSprite,TwoFrameSprite+39 ,16+144,200


;Dark Spirit
defb 50,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+1
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12

;Dark Spirit
defb 60,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+2
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12

;Flamer
defb 70,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite,TwoFrameSprite+32 ,160+24,24*3

; Fire!,Fly!
defb 70,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+10

;Dark Spirit
defb 80,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+3
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


;Stone Top
defb 85,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+22 ,0+16,24	;20 - 22 - 19
else
	defb 	evtSingleSprite,22 ,0+16,32	;20 - 22 - 19
endif


;Dark Spirit
defb 90,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+4
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12



;Stone Bottom Mid
defb 90,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+16 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,16 ,0+16,200	;16 - 17 - 18
endif


;Flamer
defb 100,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite,TwoFrameSprite+32 ,160+24,24*3

; Fire!,Fly!
defb 100,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+4

;Dark Spirit
defb 105,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+5
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


;Stone Top Mid
defb 110,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+20 ,0+16,24	;20 - 22 - 23
else
	defb 	evtSingleSprite,20 ,0+16,32	;20 - 22 - 23
endif


;DekaWooRei
defb 110,evtMultipleCommands +2
defb 	evtSettingsBank_Load +12
defb 	evtSingleSprite,TwoFrameSprite+10 ,160+12,24*3


;DekaWooRei
defb 110,evtMultipleCommands +2
defb 	evtSettingsBank_Load +12
defb 	evtSingleSprite,TwoFrameSprite+10 ,160+12,24*6





;rock up
defb 110,evtMultipleCommands +4
defb 	evtSettingsBank_Load +0
defb EvtSetMove,RightSlow
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,200-120+24,24,0,1,2,3,4

;Dark Spirit
defb 115,evtMultipleCommands +3
defb 	evtSettingsBank_Load +4
defb   evtSetMove,mveCustom3+6
defb 	evtSingleSprite,TwoFrameSprite+33 ,0+24,24*7-12


;KabiKami
defb 116,evtMultipleCommands +3
defb 	evtSettingsBank_Load +2
defb 	evtSingleSprite,TwoFrameSprite+28 ,0+16,24*3+7
defb 	evtSetLife,lifEnemy+10
defb 117,evtSingleSprite,TwoFrameSprite+29 ,0+16,24*5+7
defb 118,evtSingleSprite,TwoFrameSprite+28 ,0+16,24*7+7


;rock Down
defb 120,evtMultipleCommands +4
defb 	evtSettingsBank_Load +0
defb EvtSetMove,RightSlow
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,24*1,24,5,6,7,8,9



;Flamer
defb 125,evtMultipleCommands +2
defb 	evtSettingsBank_Load +5
defb 	evtSingleSprite,TwoFrameSprite+32 ,160+24,24*3



;Stone Bottom
defb 125,evtMultipleCommands +2
defb 	evtSettingsBank_Load +13
if buildCPCv+buildENTv
	defb 	evtSingleSprite,TwoFrameSprite+18 ,0+16,200	;16 - 17 - 18
else
	defb 	evtSingleSprite,18 ,0+16,200	;16 - 17 - 18
endif



;rock up
defb 130,evtMultipleCommands +4
defb 	evtSettingsBank_Load +0
defb EvtSetMove,RightSlow
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,200-120+24,24,0,1,2,3,4

; Fire!,Fly!
defb 135,evtMultipleCommands +2
defb 	evtSettingsBank_Load +10
defb 	evtSingleSprite+4




;rock Down
defb 140,evtMultipleCommands +4
defb 	evtSettingsBank_Load +0
defb EvtSetMove,RightSlow
defb 	evtSetLife,lifEnemy+50
defb	evtTileSprite+5,0+16,24*1,24,5,6,7,8,9

defb 140,evtMultipleCommands +3
defb	evtTileSprite+2,200-24,24*1,24,26,24
defb	evtTileSprite+2,200-24,24*1,24,26,24
defb	evtTileSprite+2,200-24,24*1,24,26,24

EndOfLevel:

defb 150+8,evtMultipleCommands +4
defb 	evtSettingsBank_Load +1
defb 	evtSetMove,%11000001
defb  	evtSingleSprite,25,4,200
defb 	evtSetProg,0



defb 150+6+9,evtTileSprite+2,4,200-24,24,TwoFrameSprite+26,TwoFrameSprite+24

defb 150+6+9+6,evtTileSprite+2,4,200-24,24,TwoFrameSprite+26,TwoFrameSprite+24

defb 150+6+9+12,evtTileSprite+2,4,200-24,24,TwoFrameSprite+26,TwoFrameSprite+24



defb 150+6+9+18,evtTileSprite+2,4,200-24,24,TwoFrameSprite+26,TwoFrameSprite+24
defb 150+6+9+24,evtTileSprite+2,4,200-24,24,TwoFrameSprite+26,TwoFrameSprite+24
;defb 15,evtTileSprite+2,16,200-24,24,26,24

;defb 18,evtTileSprite+2,16,200-24,24,26,24
defb 150+6+9+30,evtMultipleCommands +3
defb 	evtSettingsBank_Load +1
defb 	evtSetMove,%11000001
defb 	evtSingleSprite,23,4,200

;Torch
defb	150+58,evtMultipleCommands +4
defb 	evtSettingsBank_Load +0
defb 	evtSetProg,0
defb 	evtSetMove,%11000001
defb 	evtSingleSprite,TwoFrameSprite+14 ,0+16,24*3+7


defb 150+68,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,47,80+24,190	; 	; Single Object sprite 11 (animated)




LevelEndAnim:
;defb 150+70,%01110000+2			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb 	0,47,140+24,100+24	; 	; Single Object sprite 11 (animated)

defb 150+70,%10001001			;Call a memory location
defw	ClearBadguys





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 221
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



defb 224,evtCallAddress			;Call a memory location
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
	ld hl,	&0108 				
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return


ClearBadguys:
	ld a,1
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret
LightingChange:
	ld (lightingLast_Plus1-1),a
	or a
	jp z,LightingChange_Dark


	cp 1
	jr z,LightingChange_Red
	cp 2
	jr z,LightingChange_Green
	cp 3
	jr z,LightingChange_Blue

LightingChange_Red:
ifdef BuildZXS
	ld de,BackgroundColorRed
	ld hl,SetSpeccyBackgroundColor
	ld a,7	
	call Akuyou_Bankswapper_CallHL

	call SetSpectrumFadeOff

endif
ifdef BuildMSX
	call FadeRed
endif
if buildCPCv+buildENTv
	call EnableRasterColorFlash

	ld hl,PaletteRed
	call SetFader

	ld h,&47
	call LightingChange_AltGrey



	ld a,&43	;white
	ld hl,&474C	;high,low 5C
	ld (IlluminatedPaletteA_Plus2-3),hl
	ld hl,&474C	;high,low
	
	ld (IlluminatedPaletteB_Plus2-3),hl
	ld (IlluminatedPaletteC_Plus2-3),hl
	ld hl,&474C	;high,low
	jr LightingChange_Part
else
	ret
endif

LightingChange_Green:
ifdef BuildZXS
	ld de,BackgroundColorGreen
	ld hl,SetSpeccyBackgroundColor
	ld a,7	
	call Akuyou_Bankswapper_CallHL

	call SetSpectrumFadeOff

endif
ifdef BuildMSX
	call FadeGreen
endif
if buildCPCv+buildENTv
	call EnableRasterColorFlash

	ld hl,PaletteGreen
	call SetFader

	ld h,&53
	call LightingChange_AltGrey
	ld hl,&5956
	ld (IlluminatedPaletteA_Plus2-3),hl
	ld hl,&5A56
	ld (IlluminatedPaletteB_Plus2-3),hl
	ld a,&5B
	ld hl,&4246
	ld (IlluminatedPaletteC_Plus2-3),hl
	ld hl,&5246
	jr LightingChange_Part
else
	ret
endif


if buildCPCv+buildENTv
	EnableRasterColorFlash:

		ld a,0:PaletteNoRestore_Plus1
		ld (PaletteNo_Plus1-1),a

	ret
endif




LightingChange_Blue:
ifdef BuildZXS
	ld de,BackgroundColorBlue
	ld hl,SetSpeccyBackgroundColor
	ld a,7	
	call Akuyou_Bankswapper_CallHL

	call SetSpectrumFadeOff

endif
ifdef BuildMSX
	call FadeBlue
endif
if buildCPCv+buildENTv

		call EnableRasterColorFlash

		ld hl,PaletteBlue
		call SetFader

		ld h,&57
		call LightingChange_AltGrey
		ld hl,&5F44
		ld (IlluminatedPaletteA_Plus2-3),hl
		ld hl,&5344
		ld (IlluminatedPaletteB_Plus2-3),hl
		ld a,&5B
		ld hl,&5F57
		ld (IlluminatedPaletteC_Plus2-3),hl
	jr LightingChange_Part
else
	ret
endif
setLightingChange_Dark:
	push hl
		call LightingChange_Dark
	pop hl
ret


LightingChange_Dark:
ifdef BuildZXS
;	ld de,BackgroundColorDark
;	ld hl,SetSpeccyBackgroundColor
;	ld a,7	
;	call Akuyou_Bankswapper_CallHL
call setSpectrumFadeBlue
;	call SetSpectrumFadeOff

endif
ifdef BuildMSX
	call FadeDark
endif
if buildCPCv+buildENTv
		ld hl,PaletteDark
		call SetFader

		ld a,64
		ld(PaletteNo_Plus1-1),a
		ld hl,&4454
		ld a,&40
	LightingChange_One:
		ld (IlluminatedPaletteA_Plus2-3),hl
		ld (IlluminatedPaletteB_Plus2-3),hl
		ld (IlluminatedPaletteC_Plus2-3),hl
	LightingChange_Part:
		ld (IlluminatedPaletteD_Plus2-3),hl
	
		ld (IlluminatedPaletteA_Plus2-1),a
		ld (IlluminatedPaletteB_Plus2-1),a
		ld (IlluminatedPaletteC_Plus2-1),a
		ld (IlluminatedPaletteD_Plus2-1),a

endif
ret

LightingChange_AltGrey:
if buildCPCv+buildENTv
	ld l,&40
	ld (IlluminatedPaletteAAlt_Plus2-3),hl
	ld (IlluminatedPaletteBAlt_Plus2-3),hl
	ld (IlluminatedPaletteCAlt_Plus2-3),hl
	ld (IlluminatedPaletteDAlt_Plus2-3),hl
	ld a,&4B
	ld (IlluminatedPaletteAAlt_Plus2-1),a
	ld (IlluminatedPaletteBAlt_Plus2-1),a
	ld (IlluminatedPaletteCAlt_Plus2-1),a
	ld (IlluminatedPaletteDAlt_Plus2-1),a

endif
ret


LevelInit:

	ld a,1
	call Akuyou_Background_SetScroll



	;flip around our play character
	call AkuYou_Player_GetPlayerVars

	ld a,&98
	ld (iy+1),a
	ld (iy+1+Akuyou_PlayerSeparator),a

	ld a,&2
	ld (iy+8),a
ifnot buildCPCv+buildENTv
	ld a,10
endif
	ld (iy+8+Akuyou_PlayerSeparator),a
	;end of character flip




if buildCPCv+buildENTv
	;Fix up the Alt Palette
	ld hl,&0001
	ld (RasterColors_ColorArray1Alt),hl
	ld (RasterColors_ColorArray2Alt),hl
	ld (RasterColors_ColorArray3Alt),hl
	ld (RasterColors_ColorArray4Alt),hl


	call AkuYou_Player_GetPlayerVars
	ld a,(iy-5)
	ld (PaletteNoRestore_Plus1-1),a


endif
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"

LevelLoop:

	ld a,0
	ld (Lighting_Plus1-1),a


	read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"

	read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"

	ld a,&00 :Lighting_Plus1
	ld b,&00 :lightingLast_Plus1
	cp b
	call nz,LightingChange

	jp LevelLoop

LevelShutdown:

ret

CustomMoveHandler:
	ld a,iyh 
	cp 128+39
	jr z,LightUV
	cp 128+32
	jr z,LightFire
	cp TwoFrameSprite+14
	jr z,LightFire
	cp 36
	jr z,LightPhosphor
	cp 37
	jr z,LightPhosphor
	cp 128+35
	jr z,LightPhosphor
	cp 128+34
	jr z,LightPhosphor
	cp 128+15
	jr z,LightPhosphor

jp Akuyou_DoMoves

LightFire:
	ld a,1
LightUpdate:
	ld (Lighting_Plus1-1),a
jp Akuyou_DoMoves

LightPhosphor:
	ld a,2
;	ld (Lighting_Plus1-1),a
;jp Akuyou_DoMoves
jr LightUpdate

LightUV:
	ld a,3
jr LightUpdate
;	ld (Lighting_Plus1-1),a
;jp Akuyou_DoMoves

CustomObjectHitHandler:

	ld a,ixh
	and %11110000
	cp mveCustom4
	jr nz,CustomObjectHitHandler_Finish	; if this object isn't the boss target, just run the normal routine
	

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
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternWaveb
	ld bc,CustomMovePattern_Init10

jr CustomMovePattern



CustomMove4:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternLifeLinkB
	ld bc,CustomMovePattern_InitLifeLink

jr CustomMovePattern

CustomMove2:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternCircleb
	ld bc,CustomMovePattern_Init10
jr CustomMovePattern
CustomMove3:
	di
	exx
	ld hl,CustomMovePatternGeneric
	ld de,CustomMovePatternCircleInfiniteb
	ld bc,CustomMovePattern_Init10

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

CustomMovePattern_InitLifeLink:
	call CustomMovePattern_Init
	ld a,lifEnemy+40		;New Life
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
	dec B
ret

CustomMovePatternWaveB:
	ld a,(ix+0)

	and %00111111
CustomMovePatternWaveContinue
		
	cp 32
	jr C,CustomMovePatternWaveLeft

	inc c
	jr CustomMovePatternWaveDone

CustomMovePatternWaveLeft:
	dec c
	jr CustomMovePatternWaveDone

CustomMovePatternWaveDone:	
	inc b	;
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
endif

if buildCPCv+buildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
	read "CoreBackground_SolidFill.asm"
	read "CoreBackground_QuadSprite.asm"
	read "CoreBackground_QuadSpriteColumn.asm"
	read "CoreBackground_bitshifter.asm"
;	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_GetSpriteMemPos.asm"
	read "CoreBackground_BitShifterReverse.asm"
endif
;read "CoreBackground_Quad.asm"
;read "CoreBackground_TileArray.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 		This block is copied to bank 7 on the speccy, and contains graphics for the background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+buildENTv
		align 256
	LevelTiles:
		incbin "..\ResCPC\Level7-Tiles-CPC.SPR"
		align 256	;For safety!
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level07-Tiles-ZX.TSP"

		align 256	;For safety!


	read "..\SrcZX\Akuyou_Spectrum_Level_GenericFader.asm"		;Must be within the copied block
	read "CoreBackground_QuadSpriteColumn.asm"
endif




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Generic Background Begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Background_Draw: 

	ld a,1	;0=left 1=right ;2=static
	call Akuyou_Background_GradientScroll

	call Akuyou_Timer_UpdateTimer


ifndef BuildMSX
	push af	; need to keep the smartbomb color


;		ifdef buildCPC
;			call Akuyou_Timer_GetTimer
;			ld (BitshifterTicksOccured_Plus1-1),a
;		endif
		
		call Akuyou_Timer_GetTimer
		ld (BitshifterRTicksOccured_Plus1-1),a	;Bitshifter Reverse

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

;		ld ix,NewGradientMSX2
;		ld hl,0000;MSXTileList
;		ld de,MSXTileListV9990
;		call Akuyou_Background_Tiles


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
			ld b,8 ;Lines
			ifdef buildZXS
				call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			else
				call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
			endif

		pop de

		ex hl,de		;Move down 8 lines
			ld bc,8*8
			add hl,bc
		ex hl,de

		ld b,16 ;Lines
		ifdef buildZXS
			call Akuyou_BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
		else
			call BackgroundFloodFillQuadSprite ;need pointer to sprite in HL
		endif


		ld de,GradientTop
		ld b,GradientTopStart
		ld c,%11111100		;Shift on Timer Ticks

		call Akuyou_Background_Gradient

		ld de,&0000
		ifdef CPC320
			ld b,50+22
		else
			ld b,50-8+22
		endif
		ifdef buildZXS
			call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
		else
			call BackgroundSolidFill ;need pointer to sprite in HL
		endif



		GradientBottomStart equ 40
		ld de,GradientBottom
		ld b,GradientBottomStart
		ld c,%11111100		;Shift on Timer Ticks
		call Akuyou_Background_Gradient


		ld a,1
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

		pop de
		ex hl,de		;Move down 8 lines
			ld bc,16*8
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
	push de

		ld hl,0007 ; shift to the right of the sprite
		add hl,de
		ld a,%11111111 ;Shift on Timer Ticks
		ld b,&8		; Bytes
		ld c,8		;lines
		ifdef buildZXS
			call BitShifterReverse ;need pointer to sprite in HL
		else
			call BitShifterReverse ;need pointer to sprite in HL
		endif

	
		;must be byte aligned

		ld a,%11111110 ;Shift on Timer Ticks
		ld b,&8		; Bytes
		ld c,16		;lines
		ifdef buildZXS
			call BitShifterReverse ;need pointer to sprite in HL
		else
			call BitShifterReverse ;need pointer to sprite in HL
		endif

	pop de
	inc d


	ld hl,0007 ; shift to the right of the sprite
	add hl,de
	ld a,%11111110 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,16		;lines
	ifdef buildZXS
		call BitShifterReverse ;need pointer to sprite in HL
	else
		call BitShifterReverse ;need pointer to sprite in HL
	endif


	;must be byte aligned

	ld a,%11111111 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call BitShifterReverse ;need pointer to sprite in HL
	else
		call BitShifterReverse ;need pointer to sprite in HL
	endif



	ifdef buildZXS
		ld de,BackgroundColorMap	:SpeccyBackgroundColor_Plus2
		call Akuyou_Background_Color
	endif

ret

	ifdef buildZXS
	SetSpeccyBackgroundColor:
		ld (SpeccyBackgroundColor_Plus2-2),de
	ret
	endif

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
if buildCPCv+buildENTv
GradientTop:
	defb &F0,&F0	;1; first line
	defb GradientTopStart-06,&D0	;2; line num, New byte
	defb GradientTopStart-10,&70	;3
	defb GradientTopStart-16,&A0	;4
	defb GradientTopStart-20,&50	;5
	defb GradientTopStart-26,&80	;6
	defb GradientTopStart-30,&20	;7
	defb GradientTopStart-36,&00	;7
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
	defb %00000000,%00000000	;1; first line
	defb GradientTopStart-2,%01001000	;2; line num, New byte
	defb GradientTopStart-6,%01010101
	defb GradientTopStart-10,%10100010	;4
	defb GradientTopStart-16,%01001000
	defb GradientTopStart-20,%00000001
	defb GradientTopStart-26,&00	;9
	defb GradientTopStart-32,&00	;9
	defb 255

GradientBottom:
	defb &0,&0	;1; first line
	defb 30,%00010000
	defb 26,%01000100	;16
	defb 20,%10100010	;17
	defb 18,%01010101	;18
	defb 10,%01001000	;19
	defb 6, %00000000;&0F	;20
	defb 2, %00000000	;15
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





BackgroundColorRed:		;Spectrum background colors (64=bright)
	defb 2*8+6+64
	defs 22,2+64
	defb 2*8+6+64
BackgroundColorGreen:		;Spectrum background colors (64=bright)
	defb 4*8+6+64
	defs 22,4+64
	defb 4*8+6+64
BackgroundColorBlue:		;Spectrum background colors (64=bright)
	defb 5*8+7+64
	defs 22,5+64
	defb 5*8+7+64
BackgroundColorDark:
BackgroundColorMap:		;Spectrum background colors (64=bright)
	defb 1*8+3
	defs 22,1
	defb 1*8+3
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
defb 24
	defb &00,00	,%00000000
	defb &02,&00	,%11111000
	defb &20,&22	,%11111000
	defb &02,&02	,%11111000
	defb &20,&20	,%11111000
	defb &02,&00	,%11111000
	defb &00,&02	,%11111000
	defb &00,&00	,%00000000

defb 136
	defb &00,&00	,%00000000
	defb &00,&20	,%11111000
	defb &20,&00	,%11111000
	defb &02,&02	,%11111000
	defb &20,&20	,%11111000
	defb &22,&02	,%11111000
	defb &00,&20	,%11111000
	defb &00,&00	,%00000000

NewGradientMSX2_SB:
defb 255


MSXFills:
;	defb 0,16	,%11111100,&50
	defb 56,80	,%00000000,&00
;	defb 76,36	,%00000000,&00
	;defb 128,16	,%00000000,&00
;	defb 160,24	,%11111111,&A0

	defb 0,0

		MsxTilesPos equ 0;
MSXTileList:
;0-32=gradient
	defb 0,8;40
	defw 	MsxTilesPos
	defb 	%01111110,0
	defb 8,16 ;76
	defw 	MsxTilesPos+8
	defb 	%01111100,0
	defb 168,16;128
	defw 	MsxTilesPos+24
	defb 	%01111100,0
	defb 184,8;152
	defw 	MsxTilesPos+24+16
	defb 	%01111110,0
	defb 0,0



MSXTileListBackgroundV9990:
	defb 0,192
	defw 	MsxTilesPos
	defb 	%01000000,0
	defb 0,192
	defw 	MsxTilesPos+192
	defb 	%01110000,0
	defb 0,80
	defw 	MsxTilesPos+384
	defb 	%01111100,0
	defb 192-72,72
	defw 	MsxTilesPos+464
	defb 	%01111100,0


	defb 0,0

MSXTileListForegroundV9990:
	defb 0,24
	defw 	MsxTilesPos+536
	defb 	%01111111,0
	defb 192-24,24
	defw 	MsxTilesPos+560
	defb 	%01111111,0
	defb 0,0


MSXTileListV9990:
;0-32=gradient
;	defb 32,8;40
;	defw 	MsxTilesPos
;	defb 	%11111100,0
;	defb 60,16 ;76
;	defw 	MsxTilesPos+8+16+8+8
;	defb 	%11111000,0
;	defb 112,16;128
;	defw 	MsxTilesPos+8
;	defb 	%11111000,0
;	defb 144,8;152
;	defw 	MsxTilesPos+16+8;
;	defb 	%11111100,0
;152-184=gradient
;	defb 184,8
;	defw 	MsxTilesPos+16+8+8
;	defb 	%11111111,0
	defb 0,0




NewGradientV9990:
	gradstart equ 192-24

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

;	defb 24+50, 		&B0,&00	,%11111111
;	defb 24+46, 		&0B,&0B	,%11111111
;	defb 24+40, 		&BB,&B0	,%11111111
;	defb 24+36	,	&BB,&BB	,%11111111

;	defb 24+30, 		&AB,&BB	,%11111111
;	defb 24+26, 		&BA,&BA	,%11111111
;	defb 24+20, 		&AA,&AB	,%11111111
;	defb 24+16	,	&AA,&AA	,%11111111
;	defb 24+12	,	&AA,&AA	,%11111111
	defb 255


endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					CPC Plus Palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+buildENTv
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

PaletteDark:
PaletteDest:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 40
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 60
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 100
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 125
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 150
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 175
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG

	defb 200
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000001,%00000000;2  -RRR-BBB,-----GGG
defb %00010010,%00000001;3  -RRR-BBB,-----GGG
defb %00100011,%00000010;4  -RRR-BBB,-----GGG



PaletteRed:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG

	defb 40
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
	defb 60
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
	defb 100
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
	defb 125
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
	defb 150
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
	defb 175
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
	defb 200
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000001,%00000001;2  -RRR-BBB,-----GGG
defb %11000011,%00000011;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG

PaletteGreen:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG

	defb 40
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	defb 60
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	defb 100
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	defb 125
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	defb 150
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	defb 175
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	defb 200
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00010001,%00001000;2  -RRR-BBB,-----GGG
defb %00110011,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
	     ;0GRB



PaletteBlue:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 40
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 60
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 100
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 125
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 150
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 175
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG

	defb 200
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00011000,%00000001;2  -RRR-BBB,-----GGG
defb %00111100,%00000011;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG




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
if buildCPCv+buildENTv
RasterColors_ColorArray1:
	defb 1
	defb 1
	defb 64+20,64+24,64+29,64+11	 :IlluminatedPaletteA_Plus2
RasterColors_ColorArray2:
	defb 1
	defb 1

	defb 64+20,64+12,64+13,64+11	:IlluminatedPaletteB_Plus2
	defb 0
	defb 64+20,64+24,64+29,64+11
	defb 12
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+24,64+29,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
RasterColors_ColorArray3:
	defb 1
	defb 1
	defb 64+20,64+12,64+13,64+11 :IlluminatedPaletteC_Plus2
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
RasterColors_ColorArray4:
	defb 1
	defb 1 
	defb 64+20,64+31,64+14,64+11 :IlluminatedPaletteD_Plus2
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+31,64+14,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+31,64+14,64+11



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



PaletteRed:						;Normal level palette
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %01000000,%00000000;1  -RRR-BBB,-----GGG
defb %10000010,%00000010;2  -RRR-BBB,-----GGG
defb %11000110,%00000110;3  -RRR-BBB,-----GGG
defb %11101010,%00001010;4  -RRR-BBB,-----GGG
defb %10100100,%00000000;5  -RRR-BBB,-----GGG
defb %10101010,%00001010;6  -RRR-BBB,-----GGG
defb %11100000,%00000000;7  -RRR-BBB,-----GGG
defb %01000100,%00001010;8  -RRR-BBB,-----GGG
defb %11101000,%00000100;9  -RRR-BBB,-----GGG
defb %10101010,%00000100;10  -RRR-BBB,-----GGG
defb %01001010,%00000000;11  -RRR-BBB,-----GGG
defb %01000100,%00000110;12  -RRR-BBB,-----GGG
defb %10100000,%00000000;13  -RRR-BBB,-----GGG
defb %11100000,%00000100;14  -RRR-BBB,-----GGG
defb %11100000,%00001000;15  -RRR-BBB,-----GGG

PaletteGreen:						;Normal level palette
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00000000,%00000010;1  -RRR-BBB,-----GGG
defb %00100010,%00001000;2  -RRR-BBB,-----GGG
defb %01100110,%00001100;3  -RRR-BBB,-----GGG
defb %10101010,%00001110;4  -RRR-BBB,-----GGG
defb %01000100,%00000100;5  -RRR-BBB,-----GGG
defb %01001010,%00001110;6  -RRR-BBB,-----GGG
defb %10100000,%00000100;7  -RRR-BBB,-----GGG
defb %00000100,%00001110;8  -RRR-BBB,-----GGG
defb %10101000,%00001010;9  -RRR-BBB,-----GGG
defb %01001010,%00001010;10  -RRR-BBB,-----GGG
defb %00001010,%00000100;11  -RRR-BBB,-----GGG
defb %00000100,%00001010;12  -RRR-BBB,-----GGG
defb %01100000,%00000100;13  -RRR-BBB,-----GGG
defb %10100000,%00001010;14  -RRR-BBB,-----GGG
defb %10100000,%00001100;15  -RRR-BBB,-----GGG

PaletteBlue:
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00000100,%00000000;1  -RRR-BBB,-----GGG
defb %00101000,%00000010;2  -RRR-BBB,-----GGG
defb %01101100,%00000110;3  -RRR-BBB,-----GGG
defb %10101110,%00001010;4  -RRR-BBB,-----GGG
defb %01001010,%00000000;5  -RRR-BBB,-----GGG
defb %01001110,%00001010;6  -RRR-BBB,-----GGG
defb %10100100,%00000000;7  -RRR-BBB,-----GGG
defb %00001000,%00001010;8  -RRR-BBB,-----GGG
defb %10101100,%00000100;9  -RRR-BBB,-----GGG
defb %01001110,%00000100;10  -RRR-BBB,-----GGG
defb %00001110,%00000000;11  -RRR-BBB,-----GGG
defb %00001000,%00000110;12  -RRR-BBB,-----GGG
defb %01100100,%00000000;13  -RRR-BBB,-----GGG
defb %10100100,%00000100;14  -RRR-BBB,-----GGG
defb %10100100,%00001000;15  -RRR-BBB,-----GGG


PaletteDest:						;Normal level palette
PaletteDark:
defb %00000000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00000000,%00000000;2  -RRR-BBB,-----GGG
defb %00000010,%00000000;3  -RRR-BBB,-----GGG
defb %00100010,%00000010;4  -RRR-BBB,-----GGG
defb %00000000,%00000000;5  -RRR-BBB,-----GGG
defb %00000010,%00000010;6  -RRR-BBB,-----GGG
defb %00100000,%00000000;7  -RRR-BBB,-----GGG
defb %00000000,%00000010;8  -RRR-BBB,-----GGG
defb %00100010,%00000000;9  -RRR-BBB,-----GGG
defb %00000010,%00000000;10  -RRR-BBB,-----GGG
defb %00000010,%00000000;11  -RRR-BBB,-----GGG
defb %00000000,%00000000;12  -RRR-BBB,-----GGG
defb %00000000,%00000000;13  -RRR-BBB,-----GGG
defb %00100000,%00000000;14  -RRR-BBB,-----GGG
defb %00100000,%00000010;15  -RRR-BBB,-----GGG



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

	FadeRed:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteRed
			call SetFader
		pop hl
	ret
	FadeGreen:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteGreen
			call SetFader
		pop hl
	ret
	FadeBlue:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteBlue
			call SetFader
		pop hl
	ret
	FadeDark:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteDark
			call SetFader
		pop hl
	ret
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			ZX Spectrum Level specific functions for background (These are copied

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef BuildZXS
;	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_BitShifterReverse.asm"
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
	save "Z:\ResCPC\T20-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif
