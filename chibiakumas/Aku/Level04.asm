;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
; replace ldia 
; Check NULL is in spectrum copied block

;replace background object definitions
; Replace object reprogrammers



BuildLevel equ 1	;We're building a level!
Read "..\Aku\Build.asm"



UseBackgroundFloodFillQuadSpriteColumn equ 1


MSX_BulletSprites equ 8


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F600
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildENT
	write "..\BldENT\T24-SC1.D01"
endif 

ifdef buildZXS
	write "..\BldZX\Level04.bin"
endif 
ifdef buildMSX
	if BuildLang='j'
		write "..\ResMSXj\T24-SC1.D01"
	else
		write "..\ResMSX\T24-SC1.D01"
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
		incbin "..\ResCPC\LEVEL4A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL4A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL4A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level3-Tiles-MSX.RLE"
		MSXTiles_End:

		MSXBullets:
			incbin "..\ResMSX\Level4Bullets.RLE"
		MSXBullets_End:

	endif















align 256,&00


CustomRam:
defs 128

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					EVENT STREAM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static




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

defb 0,evtAddToBackground

defb 0,%11110010				;Install a custom hit handler
defw CustomObjectHitHandler


defb 0,evtReprogram_PowerupSprites,128+99,128+99,128+99,128+16	; Define powerup sprites

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




; Lambtron
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+17,&61,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+17		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,2		

; Shoe!
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&7C,%11000000+6	
defb 	evtSetSprite,TwoFrameSprite+18
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,3	

; CHU!
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveSeaker,lifEnemy+6	
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+19
defb 	evtSettingsBank_Save,4	

; CHU! Text 
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mvestatic,lifTimed+3
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+20
defb 	evtSettingsBank_Save,5



; Custom move code
defb 0,evtReprogramCustomMove1
defw CustomMoveYoYo


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
	defb 0				
	defb &54,&5D,&52,&4B			

	;defb 0,240,6,6			; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 5
	;defb 1				
	;defb &54,&55,&43,&4B		

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 32	;delay			
	defb &54,&5D,&52,&4B			

	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5D,&52,&4B			
		
	



	

;	defb FadeStartPoint+2,evtCallAddress
;	defw RasterColorsStartPalleteFlip
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;












; hit target
defb 10,%01110000+3			; 2 commands at the same timepoint;
defb 	128+4,prgSpecial,mveCustom1,%11000000+40	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4;
defb 	0,21,160+27+6,64+24+24-24+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		BossTarget			; save Object pointer



;boss1
defb 10,%01110000+6			; 3 commands at the same timepoint
defb 	evtAddToBackground
defb 	%10010000+0+1				; Load Settings from bank 1
defb 	evtSetMove,mveCustom1
defb 	129,0				; Change to program Custom
defb 	0,128+	0,160+24,64+24-24+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		BossObject1			; save Object pointer

;Boss2
defb 10+3,%01110000+6			; 3 commands at the same timepoint
defb 	evtAddToBackground
defb 	%10010000+0+1				; Load Settings from bank 1
defb 	129,0				; Change to program Custom
defb 	evtSetMove,mveCustom1
defb 	0,128+	1,160+24,64+24-24+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		BossObject2			; save Object pointer


; Fire target 1
defb 10+3,%01110000+3			; 2 commands at the same timepoint;
;
defb 	128+4,%01100000+13,mveCustom1,0	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4;
defb 	0,21,160+27,64+24-24+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		FireTarget1			; save Object pointer


;Boss3
defb 10+6,%01110000+6			; 3 commands at the same timepoint
defb 	evtAddToBackground
defb 	%10010000+0+1				; Load Settings from bank 1
defb 	129,0				; Change to program Custom
defb 	evtSetMove,mveCustom1
defb 	0,128+	2,160+24,64+24-24+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		BossObject3			; save Object pointer

;akanbee
defb 26,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,0,&24,3
defb 	0,128+	15,120+24,170+24	; 	; Single Object sprite 11 (animated)




;defb 70,%10001001			;Call a memory location
;defw	StopBossMovement
;defb 20+18+24	
;defb 136				; Jump to a different level point
;defw StartOfLevel			; pointer
;defb 255					; new time
AttackLoop:



defb 30,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 32,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 34,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 36,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 36,evtMultipleCommands+8					; 3 commands at the same timepoint
defb evtSettingsBank_Load+3
defb 	0, 18,12*1+24,24	; 	; Single Object / 
defb 	0, 18,12*3+24,24	; 	; Single Object / 
defb 	0, 18,12*5+24,24	; 	; Single Object / 
defb 	0, 18,12*7+24,24	; 	; Single Object / 
defb 	0, 18,12*9+24,24	; 	; Single Object / 
defb 	0, 18,12*11+24,24	; 	; Single Object / 
defb 	0, 18,12*13+24,24	; 	; Single Object / 




defb 50,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 52,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 54,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 56,evtMultipleCommands+2					; 3 commands at the same timepoint
defb evtSettingsBank_Load+2
defb 	evtSingleSprite+ 12

defb 56,evtMultipleCommands+8					; 3 commands at the same timepoint
defb evtSettingsBank_Load+3
defb 	0, 18,12*0+24,24	; 	; Single Object / 
defb 	0, 18,12*2+24,24	; 	; Single Object / 
defb 	0, 18,12*4+24,24	; 	; Single Object / 
defb 	0, 18,12*6+24,24	; 	; Single Object / 
defb 	0, 18,12*8+24,24	; 	; Single Object / 
defb 	0, 18,12*10+24,24	; 	; Single Object / 
defb 	0, 18,12*12+24,24	; 	; Single Object / 





defb 80	
defb 	evtJumpToNewTime			; Jump to a different level point
defw 	AttackLoop				; pointer
defb	 20					; new time

ChuAttack:
defb 25,evtAddToForeground

defb 25,evtMultipleCommands+2					; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+4
defb 	0
defb 		128+19	;sprite (Chu Seaker)
defb		140+24	:ChuXa_Plus1
defb 		170+24	:ChuYa_Plus1
	
defb 25,evtMultipleCommands+2					; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+5
defb 	0
defb 		128+20	;sprite (Chu text)
defb		140+24	:ChuXb_Plus1
defb 		170+24	:ChuYb_Plus1

defb 25,evtAddToBackground	

defb 25	
defb 	136					; Jump to a different level point
defw 	AttackLoop	:EndChuPointer_Plus2	; pointer
defb	 20		:EndChuTime_Plus1	; new time




LevelEndAnim:


defb 253,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,21+128+11,140+24,100+24	; 	; Single Object sprite 11 (animated)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 253;31
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




defb FadeOutStartPoint+4,evtCallAddress			;Call a memory location
defw	EndLevel
















defb 253,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,128+	21,140+24,100+24	; 	; Single Object sprite 11 (animated)

;Palette Change
defb 254,%01110000+4			; 4 Commands
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




defb 255,%01110000+4			; 4 Commands
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

defb 0,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&0105
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return





LevelInit:



	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"




LevelLoop:


read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"




	ld a,r
	xor 0 :Randomizer_Plus1
	ld (Randomizer_Plus1-1),a
	and %00001100;%00001110
	call z,StarArrayWarp ; welcome to hell!






	ld a,(BossHurt)
	cp 0
	jp z,DontReset
	dec a
	ld (BossHurt),a

	jp nz,DontReset
	
	;reset the sprites to the non hurt state
	ld a,(BossSpriteNum1)
	add 128
	ld hl,(BossObject1)
	call SetObjectSprite

	ld a,(BossSpriteNum2)
	add 128
	ld hl,(BossObject2)
	call SetObjectSprite

	ld a,(BossSpriteNum3)
	add 128
	ld hl,(BossObject3)
	call SetObjectSprite

DontReset:



ifdef buildZXS
	ld a,7	
	ld hl,ShowBossText
	call Akuyou_Bankswapper_CallHL
else
	call ShowBossText
endif




read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"

	jp LevelLoop


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
	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_GetSpriteMemPos.asm"
endif
;read "CoreBackground_Quad.asm"
;read "CoreBackground_TileArray.asm"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 		This block is copied to bank 7 on the speccy, and contains graphics for the background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+buildENTv
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

ifdef BuildZXS
	call AkuYou_Player_GetPlayerVars
	bit 2,(iy-8)
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
if buildCPCv+buildENTv
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
	defw &0284
	defw &0911;14  -GRB
	defw &0EEE;13  -GRB
	defb 100
	defw &0000
	defw &0284
	defw &0A00;14  -GRB
	defw &0EFC;13  -GRB
	defb 125
	defw &0000
	defw &0284
	defw &0A00;14  -GRB
	defw &0EFC;13  -GRB
	defb 150
	defw &0000
	defw &0086
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
defb %00001110,%00001110;6  -RRR-BBB,-----GGG
defb %11100000,%00000000;7  -RRR-BBB,-----GGG
defb %00000100,%00001110;8  -RRR-BBB,-----GGG
defb %11101100,%00000110;9  -RRR-BBB,-----GGG
defb %10000000,%00000100;10  -RRR-BBB,-----GGG
defb %01000010,%00000000;11  -RRR-BBB,-----GGG
defb %00101000,%00001010;12  -RRR-BBB,-----GGG
defb %01000010,%00000110;13  -RRR-BBB,-----GGG
defb %01001010,%00000110;14  -RRR-BBB,-----GGG
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

; 			Show Boss Text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShowBossText2:	;For Zombichu only
	or a
	ret z

	ld a,(BossCharNum_Plus1-1)
	inc a
	ld (BossCharNum_Plus1-1),a

	ld bc,BossText2
	jp ShowBossText_StartText


	read "..\SrcAll\Akuyou_Multiplatform_Level_ShowBossText.asm"




if BuildLang=''
	BossText: 
	db  11,"W A R N I N G ! ! ","!"+&80
	db  06,"A Big Copyright-Infringemen","t"+&80
	db  07,"Is approaching: ZombiChu!!","!"+&80
	db  05,""," "+&80
	db  05,""," "+&80
	db  05,"(Don't sue - I have no money!",")"+&80
	;b  "12345678901234567890123456789","0"+&80
	db &0

	BossText2: 
	db  05,""," "+&80
	db  05,""," "+&80

	ifdef CPC320
		db  05,""," "+&80
		db  03,"And anyway, Satire is protecte","d"+&80
	else
		db  05,"    "," "+&80
		db  05,"Anyway, Satire is protecte","d"+&80
	endif
	db  06,"according to the TPP an","d"+&80
	db  07,"Freedom of speech law","s"+&80
	db  15,"So bite me!","!"+&80
	;we are using a speedup, so must be divisible by 3
	BossText2End:db &0,&0,&0
endif

if BuildLang='j'
	BossText: 
	db  11,"W A R N I N G ! ! ","!",255
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 11,120,111,129,159,115,130,111,124,121,122,158,125,158,119,159,115,255
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 6,119,159,127,144,112,132,115,144,126,":",139,160,121,153,148,158,"Z","O","M","B","I","C","H","U","!","!","!",255
	db  05,""," ",255
	db  05,""," ",255
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  09,"(",116,112,129,117,134,115,132,159,"!",143,159,121,101,118,119,137,134,115,"!)",255
	;b  "12345678901234567890123456789","0"+&80
	db &0

	BossText2: 
	db  05,""," ",255
	db  05,"                         "," ",255

	db  05,"                         "," ",255
	db  05,""," ",255
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 11,144,114,101,139,160,156,132,159,105,139,099,"T","P","P",100,133,255
	db 9,122,159,158,156,158,138,125,159,150,116,132,159,143,123,159,124,155,154,119,152,255
	db 13,120,135,125,134,115,132,159,"!",139,159,119,"!",255
	;we are using a speedup, so must be divisible by 3
	BossText2End:db &0,&0,&0
endif


BossSpriteNum1 defb 0
BossSpriteNum2 defb 1
BossSpriteNum3 defb 2

BossObject1: defw &6969
BossObject2: defw &6969
BossObject3: defw &6969
;HandObject1 defw &6969
;HandObject2 defw &6969
;HandObject3 defw &6969
;HandObject4 defw &6969
;HandObject5 defw &6969
;HandObject6 defw &6969
BossTarget: defw &6969
BossLife: defb 150
BossHurt: defb &0
FireTarget1: defw &6969
FireTarget2: defw &6969
FireTarget3: defw &6969








CustomObjectHitHandler:

ld a,iyl
cp prgSpecial
jp nz,Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine
	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y
ld ixl,%11000000+40	; Make object immortal
push de
push hl
	ld a,(BossSpriteNum1)
	add 128+3
	ld hl,(BossObject1)
	call SetObjectSprite

	ld a,(BossSpriteNum2)
	add 128+3
	ld hl,(BossObject2)
	call SetObjectSprite

	ld a,(BossSpriteNum3)
	add 128+3
	ld hl,(BossObject3)
	call SetObjectSprite

	ld a,r
	srl a
	srl a
	add 120
	ld hl,(FireTarget1)
	call SetObjectY

	ld a,r
	srl a
	srl a
	add 120
	ld hl,(FireTarget2)
	call SetObjectY

	ld a,r
	srl a
	srl a
	add 120
	ld hl,(FireTarget3)
	call SetObjectY



	ld a,2
	ld (BossHurt),a

	ld a,(BossLife)
	dec a
	;cp 80
	;jp z,BossLife1
	;cp 60
	;jp z,BossLife2
	cp 75
	jp z,BossLife3
	;cp 20
	;jp z,BossLife4
	cp 1
	jp z,BossLife5		;5 means boss is dead
	jp UpdateBossLife
BossLife5:
	push af

		; boss is dead

		ld ixl,0	; Make object immortal

		ld a,0
		ld (BossHurt),a

		ld a,0
		ld hl,(FireTarget1)
		call SetObjectProgram
		ld a,0
		ld hl,(FireTarget2)
		call SetObjectProgram
		ld a,0
		ld hl,(FireTarget3)
		call SetObjectProgram

		


		ld a,12
		ld hl,(BossObject1)
		call SetObjectSprite
		ld a,128+13
		ld hl,(BossObject2)
		call SetObjectSprite
		ld a,128+14
		ld hl,(BossObject3)
		call SetObjectSprite	
		ld a,2
		call Akuyou_DoSmartBombCall

		ld hl,LevelEndAnim
		ld a,249
		call Akuyou_SetLevelTime


	pop af
	jp UpdateBossLife
BossLife4:
push af
	;	ld a,128+10
	;	ld hl,(BossObject2)
	;	call SetSprite
	;	ld a,128+11
	;	ld hl,(BossObject3)
	;	call SetSprite	
	pop af
	jp UpdateBossLife
BossLife3:
	push af
		;ld a,128+8
		;ld hl,(BossObject2)
		;call SetSprite
		;ld a,128+9
		;ld hl,(BossObject3)
		;call SetSprite	

		ld a,0+6
		ld (BossSpriteNum1),a
		ld a,1+6
		ld (BossSpriteNum2),a
		ld a,2+6
		ld (BossSpriteNum3),a

	pop af
	jp UpdateBossLife
BossLife2:
	push af
	;	ld a,128+6
	;	ld hl,(BossObject2)
	;	call SetSprite
	;	ld a,128+7
	;	ld hl,(BossObject3)
	;	call SetSprite	
	pop af
	jp UpdateBossLife
BossLife1:
	push af
	;	ld a,128+4
	;	ld hl,(BossObject2)
	;	call SetSprite
	;	ld a,128+5
	;	ld hl,(BossObject3)
	;	call SetSprite	
	pop af
	jp UpdateBossLife
UpdateBossLife:
	ld (BossLife),a
	pop hl
	pop de
ret


;jp Akuyou_Object_DecreaseLifeShot



;CustomRam:
;defs 8 ;
CustomMoveYoYo:		; B=X C=Y D=Move

	;dont mess with moves if the boss is dead
	ld a,(BossLife)
	cp 1
	ret z

		call Akuyou_Timer_GetTimer
		or a
		ret z		;Only run every two ticks on v9990

	push de
		
	push ix

		ld ix,CustomRam
	


		ld d,a
		ldai	; Level time
		ld e,a


		ld a,(ix+0)

		bit 2,d				; tick
		jr z,CustomMoveYoYo_NoTick	


		;dont update more than once per tick!
		ld a,(ix+1)
		cp e
		jr z,CustomMoveYoYo_NoTick	
		ld a,e
		ld (ix+1),e

		ld a,(ix+0)


		inc a
		ld (ix+0),a	
CustomMoveYoYo_NoTick:
		ld a,(ix+0)
		cp 12
		jp nc,CustomMoveYoYo_AttackRetreat
		dec b
		jp CustomMoveYoYo_Done

CustomMoveYoYo_AttackRetreat		
		cp 32
		jp C,CustomMoveYoYo_NoAttack

		cp 32+16
		jp nC,CustomMoveYoYo_NoAttack

		cp 32+8
		jp nC,CustomMoveYoYo_Retreat
		dec b		
		dec b
		dec b		
		dec b
		jp CustomMoveYoYo_NoAttack
CustomMoveYoYo_Retreat
		inc b
		inc b
		inc b
		inc b
CustomMoveYoYo_NoAttack
		cp 32+16
		jp nz,CustomMoveYoYo_Vert

		push hl
			push bc
				call Akuyou_GetLevelTime
			pop bc
			ld (EndChuPointer_Plus2-2),hl
			ld (EndChuTime_Plus1-1),a
			ld a,b
			ld (ChuXa_Plus1-1),a
			ld (ChuXb_Plus1-1),a
	
			ld a,c
			ld (ChuYa_Plus1-1),a
			ld (ChuYb_Plus1-1),a

	
			ld hl,ChuAttack
			ld a,24
			call Akuyou_SetLevelTime
		pop hl
		ld a,12
		ld (ix+0),a
CustomMoveYoYo_Vert
		

		bit 4,e
		jr z,CustomMoveYoYo_up
		dec c
		dec c
		dec c
		dec c
		dec c
		dec c
		jp CustomMoveYoYo_Done
		;jr z,CustomMoveYoYo_DoJump
		;xor %00001111
		;jr CustomMoveYoYo_DoJump
CustomMoveYoYo_up
		inc c
		inc c
		inc c
		inc c
		inc c
		inc c
		jp CustomMoveYoYo_Done

CustomMoveYoYo_Done:
	pop ix
CustomMoveYoYo_Done2:
	pop de
ret
CustomMoveYoYo_Init:
	ld a,0
	ld (ix+0),a
	dec b
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
	save direct "T24-SC1.D01",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif
