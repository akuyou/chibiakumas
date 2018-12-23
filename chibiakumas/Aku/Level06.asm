;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
; replace ldia 
; Check NULL is in spectrum copied block

;replace background object definitions
; Replace object reprogrammers



BuildLevel equ 1	;We're building a level!
Read "..\Aku\Build.asm"



;MSX_BulletSprites equ 8


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F600
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildENT
	write "..\BldENT\T14-SC1.D02"
endif
ifdef buildZXS
	write "..\BldZX\Level06.bin"
endif 
ifdef buildMSX
	if BuildLang = 'j'
	write "..\ResMSXj\T14-SC1.D02"
	else
	write "..\ResMSX\T14-SC1.D02"
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
		incbin "..\ResCPC\LEVEL6A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL6A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL6A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level6-Tiles-MSX.RLE"
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

;defb 0,240+1,0,17*2+1				; (Time,Cmd,Off,Bytes) Load 41 bytes into the background - 41 bytes is the limit
;defb &F0,&F0	;1; first line
;defb 196,&D0	;2; line num, New byte
;defb 190,&70	;3
;defb 186,&A0	;4
;defb 180,&50	;5
;defb 176,&80	;6
;defb 170,&20	;7
;defb 166,&00	;8
;defb 160,&00	;9
;defb 36,&20	;10
;defb 30,&80	;11
;defb 26,&50	;12
;defb 20,&A0	;13
;defb 16,&70	;14
;defb 10,&D0	;15
;defb 06,&F0	;16
;defb 02,&F0	;17
;defb 255

;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0

defb 0,evtAddToBackground

defb 0,evtReprogramHitHandler				;Install a custom hit handler
defw CustomObjectHitHandler


defb 0,evtReprogram_PowerupSprites,128+88,128+88,128+88,128+1	; sprites drone,speed,power,coin

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





;  Boss Body
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveCustom2+5,0			; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+17		
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,2		

; Boss Saw
defb 0,evtMultipleCommands+8			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveCustom3+6,lifDeadly+63
defb 	evtSetSprite,TwoFrameSprite+18
defb evtSetObjectSize,24
defb evtAddToForeground
defb 	evtSettingsBank_Save,3	
defb evtAddToBackground
defb    evtSetLife,0
defb 	evtSettingsBank_Save,5	;Saw Arm


; Boss Drone
defb 0,evtMultipleCommands+5			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1,mveCustom1,lifCustom	
defb evtSetObjectSize,32
defb evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSettingsBank_Save,4	


; Drone Move
defb 0,evtReprogramCustomMove1
defw CustomMove1
defb 0,evtReprogramCustomMove2
defw CustomMove2
defb 0,evtReprogramCustomMove3
defw CustomMove3


defb 0,evtReprogramCustomProg1
defw CustomProgram1

; start of level
StartOfLevel:





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
	defb &44,&57,&59,&4B			

	;defb 0,240,6,6			; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 5
	;defb 1				
	;defb &54,&55,&43,&4B		

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &44,&57,&59,&4B			

	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &44,&57,&59,&4B			
		
	



;	defb FadeStartPoint+2,evtCallAddress
;	defw RasterColorsStartPalleteFlip
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









;defb 5,%01110000+2			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,0,&24,10
;defb 	0,128+	0,140+24,170+24	; 	; Single Object sprite 11 (animated)



	;defb 1				
	;defb &54,&4C,&56,&4B


AttackLoop:
;Saw Blade

SawBlade equ 26

ifdef BuildZXS
SawYpos equ 8
SawXpos equ 160+24-12-4
else
SawYpos equ 1
SawXpos equ 160+24
endif


defb 10,evtMultipleCommands+5
defb 	evtSettingsBank_Load+3
defb 	evtSetLife,lifCustom
;defb 	evtSingleSprite ,FourFrameSprite +SawBlade+6,160+24-36,1
defb 	evtSingleSprite ,FourFrameSprite+SawBlade+6,SawXpos-36,SawYpos
defb 	evtSingleSprite ,47,SawXpos-24,SawYpos
defb 	evtSingleSprite ,47,SawXpos-12,SawYpos


defb 13,evtMultipleCommands+7
defb 	evtSettingsBank_Load+5
defb 	evtSetProg,prgFireMid+13
defb 	evtSingleSprite ,TwoFrameSprite +36,SawXpos-24,SawYpos
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite ,FourFrameSprite +SawBlade+3,SawXpos-36,SawYpos
defb 	evtSingleSprite ,47,SawXpos-24,SawYpos
defb 	evtSingleSprite ,47,SawXpos-12,SawYpos


defb 16,evtMultipleCommands+6
defb 	evtSettingsBank_Load+5
;defb evtSetProg,prgFireMid+13
defb 	evtSingleSprite ,TwoFrameSprite+7 :SawArmA
		defb SawXpos-24,SawYpos
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite ,FourFrameSprite +SawBlade+0,SawXpos-36,SawYpos
defb 	evtSingleSprite ,47,SawXpos-24,SawYpos
defb 	evtSingleSprite ,47,SawXpos-12,SawYpos

defb 19,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite ,TwoFrameSprite +7 :SawArmB
	defb SawXpos-24,SawYpos


defb 22,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite ,TwoFrameSprite +7 :SawArmC
	defb SawXpos-24,SawYpos

defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite ,TwoFrameSprite +7 :SawArmD
	defb SawXpos-24,SawYpos

defb 26,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite ,TwoFrameSprite +7 :SawArmE
	defb SawXpos-24,SawYpos




Drones
defb 70,evtMultipleCommands+9
defb 	evtSettingsBank_Load+4
defb 	evtSetMove,mveCustom1+0
defb 	evtSingleSprite ,TwoFrameSprite +0,24,24
defb 	evtSetMove,mveCustom1+1
defb 	evtSingleSprite ,TwoFrameSprite +0,160,24
defb 	evtSetMove,mveCustom1+2
defb 	evtSingleSprite ,TwoFrameSprite +0,24,200
defb 	evtSetMove,mveCustom1+3
defb 	evtSingleSprite ,TwoFrameSprite +0,160,200




if buildCPCv+buildENTv
BossXpos equ 160
BossYPos1 equ 24*5+24+7
BossYPos2 equ 24*6+24+7
BossKeyY equ 24*4+24+7
endif

 
ifdef BuildZXS
	BossXpos equ 144
	BossYPos1 equ 24*5+24+8
	BossYPos2 equ 24*6+24+8
	BossKeyY equ 24*4+24+8
endif


ifdef BuildMSX
	BossXpos equ 144
	BossYPos1 equ 24*5+24+7
	BossYPos2 equ 24*6+24+7
	BossKeyY equ 24*4+24+7
endif

;Big Fish

defb 73,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSetLife,lifCustom
defb 	evtSingleSprite ,TwoFrameSprite +5 :BossSpr5A
	defb BossXpos+24,24*7+24+8	


defb 76,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite ,TwoFrameSprite +6	:BossSpr6A
	defb BossXpos+24,24*7+24+8

defb 79,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+2 ,BossXpos+24,BossYPos2  ,24
	defb	TwoFrameSprite +5 :BossSpr5B
	defb 	TwoFrameSprite +4 :BossSpr4A


defb 82,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+2 ,BossXpos+24,BossYPos2  ,24
	defb	TwoFrameSprite +6 :BossSpr6B
	defb 	TwoFrameSprite +4 :BossSpr4B

defb 85,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +5 :BossSpr5C
	defb 	TwoFrameSprite +4 :BossSpr4C
	defb 	TwoFrameSprite +2 :BossSpr2

defb 88,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +6 :BossSpr6C
	defb	27 :BossSpr4D
	defb	TwoFrameSprite +4 :BossSpr4E

defb 91,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +4 :BossSpr4F
	defb	TwoFrameSprite +3 :BossSpr3A
	defb	TwoFrameSprite +4:BossSpr4G

defb 94,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +4 :BossSpr4H
	defb	TwoFrameSprite +4 :BossSpr4I
	defb	TwoFrameSprite +3 :BossSpr3B

defb 97,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +3 :BossSpr3C
	defb	27 :BossSpr4J
	defb	TwoFrameSprite +4:BossSpr4K

defb 100,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +4 :BossSpr4L
	defb	TwoFrameSprite +4 :BossSpr4M
	defb	TwoFrameSprite +3:BossSpr3D

defb 103,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24
	defb	TwoFrameSprite +3 :BossSpr3E
	defb	TwoFrameSprite +4 :BossSpr4N
	defb	TwoFrameSprite +4:BossSpr4O

defb 103,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb evtSetProg,prgSpecial
defb evtSetLife,%11000000+40
defb 	evtSingleSprite,TwoFrameSprite +8 :BossSpr8
	defb	BossXpos+24,BossKeyY

defb 106,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtTileSprite+3 ,BossXpos+24,BossYpos1  ,24,	TwoFrameSprite +3 ,TwoFrameSprite +4 ,TwoFrameSprite +4

;defb 59,evtMultipleCommands+2
;defb 	evtSettingsBank_Load+2
;defb 	evtTileSprite+3 ,160+24,BossYpos  ,24,	TwoFrameSprite +4 ,TwoFrameSprite +4 ,TwoFrameSprite +3






defb 110	
defb 	evtJumpToNewTime			; Jump to a different level point
defw 	AttackLoop				; pointer
defb	 0					; new time







LevelEndAnim:

defb 250,%10001001			;Call a memory location
defw	ClearBadguys

defb 253,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,128+37,140+24,100+24	; 	; Single Object sprite 11 (animated)







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 255
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







defb 3,evtCallAddress			;Call a memory location
defw	EndLevel

ClearBadguys:
	ld a,2
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret
EndLevel:
	pop hl	;
	ld hl,	&0107 				;load level 2
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



ifdef buildZXS
	ld a,7	
	ld hl,ShowBossText
	call Akuyou_Bankswapper_CallHL
else
	call ShowBossText
endif




read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"

	jp LevelLoop



BossObject1: defw &6969
BossObject2: defw &6969
BossObject3: defw &6969
BossTarget: defw &6969
BossLife: defb 50
FireTarget1: defw &6969
FireTarget2: defw &6969
FireTarget3: defw &6969

ObjectArraySwapSprite:
	; swap sprite D with Sprite E

	ld hl,ObjectArrayPointer
;	ld b,0
;	ld c,ObjectArraySize
		inc h;	add hl,bc ;Y
		inc h;	add hl,bc ;X
		inc h;	add hl,bc ;M
	ld b,c
	;ld c,0

ObjectArraySwapSprite_Next:
	
	ld a,(hl);S
	cp D
	jp nz,ObjectArraySwapSprite_NoMatch
	ld a,E
	ld (hl),a
ObjectArraySwapSprite_NoMatch:
	inc l;inc hl
	
	djnz ObjectArraySwapSprite_Next	
ret
CustomObjectHitHandler:

ld a,iyl
cp prgSpecial
jp nz,Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine

ld a,2
ld (TargetSpritecountdown_Plus1-1),a

	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y
	ld ixl,%11000000+40	; Make object immortal
	di
	exx



	ld a,(BossLife)
	dec a
	ld (BossLife),a
	cp 30
	jp z,BossLife3
	cp 10
	jp z,BossLife4
	cp 1
	jp z,BossLife5		;5 means boss is dead
	jp UpdateBossLife
BossLife5:
		; boss is dead

	ld D,128+2
	LD e,128+2+16
	call ObjectArraySwapSprite
	ld a,e
	ld (BossSpr2-1),a


		ld ixl,0	; Make object immortal

	ld D,128+8
	LD e,128+8+16
	call ObjectArraySwapSprite
	ld a,e
	ld (BossSpr8-1),a
	
	ld a,128+9+16
	ld (HitTargetSprite_Plus1-1),a
	ld a,128+8+16
	ld (ResetTargetSprite_Plus1-1),a
;		ld a,2
;		call Akuyou_DoSmartBombCall

		ld hl,LevelEndAnim
		ld a,249
		call Akuyou_SetLevelTime

	jp UpdateBossLife
BossLife4:


	ld D,28
	LD e,30
	call ObjectArraySwapSprite
	call doBossSpr7

	ld D,128+3+8
	LD e,128+3+16
	call ObjectArraySwapSprite
	call doBossSpr3

	ld D,128+4+8
	LD e,128+4+16
	call ObjectArraySwapSprite
	call doBossSpr4

	ld D,128+5+8
	LD e,128+5+16
	call ObjectArraySwapSprite
	call doBossSpr5

	ld D,128+6+8
	LD e,128+6+16
	call ObjectArraySwapSprite
	call doBossSpr6

	ld D,128+7+8
	LD e,128+7+16
	call ObjectArraySwapSprite
	call DoSawArmSprites


	
	jp UpdateBossLife

BossLife3:
	ld D,128+2
	LD e,128+2+8
	call ObjectArraySwapSprite
	ld a,e
	ld (BossSpr2-1),a

	ld D,27
	LD e,28
	call ObjectArraySwapSprite
	call doBossSpr7

	ld D,128+3
	LD e,128+3+8
	call ObjectArraySwapSprite
	call doBossSpr3

	ld D,128+4
	LD e,128+4+8
	call ObjectArraySwapSprite
	call doBossSpr4

	ld D,128+5
	LD e,128+5+8
	call ObjectArraySwapSprite
	call doBossSpr5

	ld D,128+6
	LD e,128+6+8
	call ObjectArraySwapSprite
	call doBossSpr6

	ld D,128+7
	LD e,128+7+8
	call ObjectArraySwapSprite
	call DoSawArmSprites
	ld D,128+8
	LD e,128+8+8
	call ObjectArraySwapSprite
	ld a,e
	ld (BossSpr8-1),a

	ld a,128+9+8
	ld (HitTargetSprite_Plus1-1),a
	ld a,128+8+8
	ld (ResetTargetSprite_Plus1-1),a

	jp UpdateBossLife
BossLife2:
	
BossLife1:



UpdateBossLife:

	exx
	ei
ret

doBossSpr3:
	ld a,e
	ld (BossSpr3A-1),a
	ld (BossSpr3B-1),a
	ld (BossSpr3C-1),a
	ld (BossSpr3D-1),a
	ld (BossSpr3E-1),a
	ret
doBossSpr5:
	ld a,e
	ld (BossSpr5A-1),a
	ld (BossSpr5B-1),a
	ld (BossSpr5C-1),a
	ret
doBossSpr6:
	ld a,e
	ld (BossSpr6A-1),a
	ld (BossSpr6B-1),a
	ld (BossSpr6C-1),a
;	ld (BossSpr6D-1),a
;	ld (BossSpr6E-1),a
	ret
doBossSpr7:
	ld a,e
	ld (BossSpr4J-1),a
	ld (BossSpr4D-1),a
	ret
doBossSpr4:
	ld a,e
	ld (BossSpr4A-1),a
	ld (BossSpr4B-1),a
	ld (BossSpr4C-1),a
	ld (BossSpr4E-1),a
	ld (BossSpr4F-1),a
	ld (BossSpr4G-1),a
	ld (BossSpr4H-1),a
	ld (BossSpr4I-1),a

	ld (BossSpr4K-1),a
	ld (BossSpr4L-1),a
	ld (BossSpr4M-1),a
	ld (BossSpr4N-1),a
	ld (BossSpr4O-1),a
	ret
DoSawArmSprites:
	ld a,e
	ld (SawArmA-1),a
	ld (SawArmB-1),a
	ld (SawArmC-1),a
	ld (SawArmD-1),a
	ld (SawArmE-1),a
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

if buildCPCv+buildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
	read "CoreBackground_SolidFill.asm"
	read "CoreBackground_QuadSprite.asm"
;	read "CoreBackground_QuadSpriteColumn.asm"
	read "CoreBackground_bitshifter.asm"
;	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_BitShifterReverse.asm"
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
		incbin "..\ResCPC\Level6-Tiles-CPC.SPR"
		align 256	;For safety!
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level06-Tiles-ZX.TSP"

		align 256	;For safety!


	read "..\SrcZX\Akuyou_Spectrum_Level_GenericFader.asm"		;Must be within the copied block
;	read "CoreBackground_QuadSpriteColumn.asm"
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
			ld (BitshifterRTicksOccured_Plus1-1),a
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
			ld de,&0000
			ifdef CPC320
				ld b,16
			else
				ld b,16
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
		pop de
		ex hl,de		;Move down 18 lines
			ld bc,8*8
			add hl,bc
		ex hl,de
		push de
			ld de,&0000
			ifdef CPC320
				ld b,16
			else
				ld b,16
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
				ld b,24
			else
				ld b,16
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif

		pop de

		ex hl,de		;Move down 18 lines
			ld bc,8*8
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
				ld b,16
			endif
			ifdef buildZXS
				call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
			else
				call BackgroundSolidFill ;need pointer to sprite in HL
			endif


		pop de

		ex hl,de		;Move down 18 lines
			ld bc,8*8
			add hl,bc
		ex hl,de


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
				ld b,16
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;				Spectrum & CPC Tile Bitshifts (MSX doesn't need them)
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;ld a,1
	;ld de,LevelTiles
	;call GetSpriteMempos



	pop de ;needed to keep this for the bitshifts


	call Akuyou_Timer_GetTimer
	ld (BitshifterRTicksOccured_Plus1-1),a



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
	ld c,8		;lines
	ifdef buildZXS
		call BitShifterReverse ;need pointer to sprite in HL
	else
		call BitShifterReverse ;need pointer to sprite in HL
	endif

	;must be byte aligned

	ld a,%11111000 ;Shift on Timer Ticks
	ld b,&8		; Bytes
	ld c,8		;lines
	ifdef buildZXS
		call Akuyou_BitShifter ;need pointer to sprite in HL
	else
		call BitShifter;BitShifterReverse ;need pointer to sprite in HL
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
	defb &F0,&F0	;1; first line
	defb GradientTopStart-10,&D0	;2; line num, New byte
	defb GradientTopStart-16,&70	;3
	defb GradientTopStart-20,&A0	;4
	defb GradientTopStart-26,&50	;5
	defb GradientTopStart-30,&80	;6
	defb GradientTopStart-36,&20	;7
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
	defb 64+8+5		;BOTTOM
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
	defb 64+8+5
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
	defb &AA,&AA	,%00000000
	defb &AA,&BA	,%11111110
	defb &BA,&AA	,%11111110
	defb &BA,&BA	,%11111110
	defb &AB,&AB	,%11111110
	defb &BA,&BB	,%11111110
	defb &BB,&BA	,%11111110
	defb &BB,&BB	,%00000000

defb 160
	defb &BB,&BB	,%00000000
	defb &BB,&AB	,%11111110
	defb &AB,&BB	,%11111110
	defb &BA,&BA	,%11111110
	defb &AB,&AB	,%11111110
	defb &AA,&AB	,%11111110
	defb &AB,&AA	,%11111110
	defb &AA,&AA	,%00000000




NewGradientMSX2_SB:
defb 255


MSXFills:
;	defb 0,16	,%11111100,&50
	defb 32,32	,%00000000,&BB
	defb 72,24	,%00000000,&BB
	defb 104,24	,%00000000,&BB
	defb 136,24	,%00000000,&BB
;	defb 160,24	,%11111111,&A0

	defb 0,0

		MsxTilesPos equ 0;
MSXTileList:
;0-32=gradient
	defb 64,8;40
	defw 	MsxTilesPos+8
	defb 	%01111110,0
	defb 96,8;40
	defw 	MsxTilesPos
	defb 	%11111100,0
	defb 128,8;40
	defw 	MsxTilesPos+16
	defb 	%11111000,0
	defb 144,8;40
	defw 	MsxTilesPos+24
	defb 	%01111111,0

	defb 0,0



MSXTileListBackgroundV9990:

	defb 96,8;40
	defw 	MsxTilesPos+192
	defb 	%11111100,0
	defb 128,8;40
	defw 	MsxTilesPos+16+192
	defb 	%11111000,0

	defb 0+48,192-48
	defw 	MsxTilesPos;+224
	defb 	%00000000,0
	defb 64,8;40
	defw 	MsxTilesPos+8+192
	defb 	%01111110,0
	defb 160,8;40
	defw 	MsxTilesPos+24+192
	defb 	%01111111,0

	defb 0,0

MSXTileListForegroundV9990:

	defb 0,0


MSXTileListV9990:

	defb 0,0




NewGradientV9990:
	gradstart equ 192

	defb &AA,&AA,&AA,&AA	;1; first line
	defb gradstart-8, &AA,&AB	,%11111100
	defb gradstart-16, &BA,&BA	,%11111100
	defb gradstart-24, &AB,&B	,%11111100
	defb gradstart-32 ,&BB,&BB	,%00000000
	defb gradstart-40 ,&BB,&BB	,%00000000

;	defb 40, 		&AB,&BB	,%11111100
;	defb 32, 		&BA,&BA	,%11111100
;	defb 24, 		&AA,&AB	,%11111100
;	defb 16	,		&AA,&AA	,%00000000
;	defb 08	,		&AA,&AA	,%00000000
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
	defw &0008
	defw &045D;14  -GRB
	defw &0D1F;14  -GRB
	defw &0FFF;13  -GRB
	defb 40
	defw &0008
	defw &045D;14  -GRB
	defw &0D1F;14  -GRB
	defw &0FFF;13  -GRB
	defb 60
	defw &0007
	defw &034C;14  -GRB
	defw &0c0F;14  -GRB
	defw &0FEF;13  -GRB
	defb 100
	defw &0007
	defw &034C;14  -GRB
	defw &0c0F;14  -GRB
	defw &0FEF;13  -GRB
	defb 125
	defw &0006
	defw &034C;14  -GRB
	defw &0c0F;14  -GRB
	defw &0FDF;13  -GRB
	defb 150
	defw &0006
	defw &034C;14  -GRB
	defw &0c0F;14  -GRB
	defw &0FDF;13  -GRB
	defb 175
	defw &0005
	defw &023B;14  -GRB
	defw &0B0E;14  -GRB
	defw &0FCF;13  -GRB
	defb 200
	defw &0005
	defw &023B;14  -GRB
	defw &0B0E;14  -GRB
	defw &0FCF;13  -GRB
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
defb %01001110,%00001010;10  -RRR-BBB,-----GGG
defb %00001100,%00000010;11  -RRR-BBB,-----GGG
defb %10001110,%00000110;12  -RRR-BBB,-----GGG
defb %10101110,%00001110;13  -RRR-BBB,-----GGG
defb %10100000,%00000010;14  -RRR-BBB,-----GGG
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
;	read "CoreBackground_bitshifterDouble.asm"
	read "CoreBackground_BitShifterReverse.asm"
endif 





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






BossText: 
if BuildLang='j'
db  11,"W A R N I N G ! ! ","!",endchar

db  09,147,130,109," ",132,159,141,159,134," ",132,120,119,159," ",127,144,112,132,144,126,"!",endchar
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db  12,"ANGLER GRINDER","!",endchar
db  05,""," ",endchar
db  05,""," ",endchar

db  13,114,152,"?"," ",130,111,112,133," ",144,112,132,101,endchar
db  06,123,116,115,116," ",132,120,119,159," ","R","O","C","K","M","A","N",135," ",115,129,125,159,109,134,115,"?",endchar
db &0



BossText2: 
db  05,""," ",endchar
db  05,""," ",endchar
db  05,""," ",endchar
db  03,""," ",endchar
db  06,""," ",endchar
 ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db  12,149,112,139,160,153," ",115,129,158," ",125,159,109,134,115,"!",endchar
db  10,144,114,101,142,154,148,158,125,159,109," ",134,115,132,159,125,111,116,"?",endchar
;we are using a speedup, so must be divisible by 3
BossText2End:db &0,&0,&0


else
db  11,"W A R N I N G ! ! ","!"+&80
db  05,"A Unnessasarily Large Enem","y"+&80
db  04,"is approaching: Angler Grinder","!"+&80
db  05,""," "+&80
db  05,""," "+&80
db  05,"Hang on? Was there somethin","g"+&80
db  08,"like this in mega man?!","?"+&80
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
;b  "12345678901234567890123456789","0"+&80
db &0



BossText2: 
db  05,""," "+&80
db  05,""," "+&80
db  05,""," "+&80
db  03,""," "+&80
db  06,""," "+&80
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db  04,"Er.. I kind of think there WAS","!"+&80
db  06,"Oh well, who gives a smeg","!"+&80
;we are using a speedup, so must be divisible by 3
BossText2End:db &0,&0,&0

endif




CustomMove1:
	di
	exx
	ld hl,CustomMovePattern1
	ld de,CustomMovePattern_InitInvincible
	ld bc,CustomMovePattern_Init

jr CustomMovePattern

CustomMove2:
	di
	exx
	ld hl,CustomMovePattern2
	ld de,CustomMovePattern2b
	ld bc,CustomMovePattern_InitImmortal;CustomMovePattern_Init
jr CustomMovePattern
CustomMove3:
	di
	exx
	ld hl,CustomMovePattern3
	ld de,CustomMovePattern3b
	ld bc,CustomMovePattern_InitInvincible

jr CustomMovePattern



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
		call CustomMovePattern1 :CustomPatternJump_Plus2
		exx
		;increment the pos
	

CustomMovePattern_NoTick:
		
		; here is where we make some moves!
		exx
		call null :CustomPatternbJump_Plus2
		exx
		;increment the pos
	


		jp CustomMovePattern_Done

CustomMovePattern_Done:
	ld a,iyl
	cp prgSpecial
	jp nz,CustomMovePattern_NotBossTarget
	ld a,0:TargetSpritecountdown_Plus1
	or a
	jp z,CustomMovePattern_TargetReset
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
	ld a,lifDeadly+62		;New Life
;there seems to be a bug in the code where an object hurts the player, but cannot be shot

ret
CustomMovePattern_Init:

	xor a
	;exx
	;B=X
	;C=Y
	;exx

	ld (ix+0),a
	ld (ix+1),a

	ld a,r

	rrca
	rrca
	and %01111111
	add 24+36
	ld (ix+3),a
	

	ld a,r

	rrca
	rrca
	rrca
	and %01111111
	add 24+16
	ld (ix+2),a

	ld a,lifEnemy+6			;New Life

ret




CustomMovePattern1:
	push ix
	push iy

		;call AkuYou_Player_GetPlayerVars


		ld a,(ix+2)	;Y
		sub 8
		cp C
		jr NC,DoMoves_Seeker_Ylower
		ld a,C
		sub 2
		jp DoMoves_Seeker_CheckX
	DoMoves_Seeker_Ylower:
		ld a,C
		add 2
	DoMoves_Seeker_CheckX:
		ld C,a
		ld a,(ix+3)	;X
		sub 3
		cp B
		jr NC,DoMoves_Seeker_Xlower
		ld a,B
		sub 2
		ld ixh,0+128
		jp DoMoves_Seeker_Done
	DoMoves_Seeker_Xlower:
		ld a,B
		ld ixh,35+128
		add 2
	DoMoves_Seeker_Done:
		ld B,a

	pop iy
		ld a,ixh
		ld iyh,a
	pop ix

	call Akuyou_Timer_GetTimer

		bit 5,a	
		ret z
	exx
	ex af,af'
		call CustomMovePattern_Init
	ex af,af'
	exx

ret
CustomMovePatternKill:
	;ex af,af'
	;xor a
	
	ld b,0
	ld c,b
	ld D,b
	;ex af,af'
ret

CustomMovePattern2: ; big fish

	ld a,(ix+0)
	inc a
	ld (ix+0),a	
ret
CustomMovePattern2b:
	ld a,(ix+0)


	cp 134
	jr C,CustomMovePattern2Left
	
	inc c	;move down
	inc c	;move down
	inc c	;move down
	inc c	;move down

	cp 142
	jr NC,CustomMovePattern2Done


CustomMovePattern2Left:	
	dec b	;move left
	;dec c	;m


CustomMovePattern2Done:
	ld a,c
	cp 199+24
	jp nc,CustomMovePatternKill	;off the bottom of the screen


ret




CustomMovePattern3: ; saw

	ld a,(ix+0)
	inc a
	ld (ix+0),a	
ret
CustomMovePattern3b:
	ld a,(ix+0)
if buildCPCv+buildENTv
	cp 240
else
	cp 253
endif
	jp nc,CustomMovePatternKill	;off the bottom of the screen

	cp 72-8 ;>72
	jr NC,CustomMovePattern3Left
	inc c	
	inc c	
	jr CustomMovePattern3Done

CustomMovePattern3Left:
	cp 72+60-8
	jr NC,CustomMovePattern3Up
	dec b
	dec b
	
	bit 3,a
	jr z,CustomMovePattern3WaveUp
	inc c
	inc c
	jr CustomMovePattern3Done
CustomMovePattern3WaveUp:
	dec c
	dec c
	jr CustomMovePattern3Done

CustomMovePattern3Up:	
	dec c
	dec c


CustomMovePattern3Done:
	ld a,c
	cp 199+24
	jp nc,CustomMovePatternKill	;off the bottom of the screen


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
	save direct "T14-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif







