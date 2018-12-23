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


MSX_BulletSprites equ 4


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef BuildENT
	write "..\BldENT\T14-SC1.D01"
endif
ifdef buildZXS
	if BuildLang='r'
		write "..\BldZXr\Level02.bin"
	endif
	if BuildLang=''
		write "..\BldZX\Level02.bin"
	endif
endif 
ifdef buildMSX
	if BuildLang = 'j'
		write "..\ResMSXj\T14-SC1.D01"
	else
		write "..\ResMSX\T14-SC1.D01"
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
		incbin "..\ResCPC\LEVEL2A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL2A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL2A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level2-Tiles-MSX.RLE"
		MSXTiles_End:

		MSXBullets:
			incbin "..\ResMSX\Level2Bullets.RLE"
		MSXBullets_End:

	endif















align 256,&00


CustomRam:Defs 128

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
defb 0,evtSetAnimatorPointers
defw	AnimatorPointers

;defb 1,128,&24,128+64+60		; Move Static







defb 0,evtReprogram_PowerupSprites,128+99,128+99,128+99, 21+128+10	; Define powerup sprites

;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0



defb 0,%11110010				;Install a custom hit handler
defw CustomObjectHitHandler


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


; Hand Up
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	128+4,0,&4C,%11000000+6	; Program -None... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb evtSetObjectSize,24
defb 	%10010000+15,3	

; Hand Down
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	128+4,0,&7C,%11000000+6	; Program -None... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb evtSetObjectSize,24
defb 	%10010000+15,4	



; Hand left
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	128+4,0,&61,%11000000+6	; Program -None... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb evtSetObjectSize,24
defb 	%10010000+15,5	

; Hand right
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	128+4,0,&67,%11000000+6	; Program -None... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb evtSetObjectSize,24
defb 	%10010000+15,6	

; start of level
;StartOfLevel

;HandLeft1
defb 0,evtMultipleCommands+6			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+1				; Load Settings from bank 1
defb 	129,%11110101				;Program
defb 	evtSetLife,0
defb evtAddToBackground					;Add To Background
;defb 	0,	18,100+24,90+24+48+8	; 	; Single Object sprite 11 (animated)
defb 	0,	18,160+24,90+24+48+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		HandObject1			; save Object pointer



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
	defb &54,&55,&40,&4B		;Black,DkBlue,LtYellow,White


	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 1	;delay			
	defb &54,&5D,&40,&4B
	defb 16	;delay			
	defb &54,&5D,&40,&4B


	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2 ; no of switches
	defb 0	;delays			
	defb &54,&58,&40,&4B		;Black,Red,Grey,White
	defb 16
	defb &54,&4C,&40,&4B	

endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DummySprite equ 47

	

;HandLeft2
defb 1+12,%01110000+5			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToBackground					;Add To Background
defb 	129,%11110011				;Program    
defb 	0,	19,160+24,90+24+48+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		HandObject2			; save Object pointer


; hit target
defb 20,%01110000+3			; 2 commands at the same timepoint;
;
defb 	128+4,2,%11000010,%11000000+40	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4;
defb 	0,DummySprite,160+27,90+24+24	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		SkullTarget			; save Object pointer



; Fire target 1
defb 20,%01110000+3			; 2 commands at the same timepoint;
;
defb 	128+4,%01100000+7,%11000010,0	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4;
defb 	0,DummySprite,160+27,90+24+48	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		FireTarget1			; save Object pointer

; Fire target 2
defb 20,%01110000+3			; 2 commands at the same timepoint;
;
defb 	128+4,%10000000+13,%11000010,0	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4;
defb 	0,DummySprite,160+27,90+24+48	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		FireTarget2			; save Object pointer

; Fire target 3
defb 20,%01110000+3			; 2 commands at the same timepoint;
;
defb 	128+4,%01100000+7,%11000010,0	; Program - Starburst ... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4;
defb 	0,DummySprite,160+27,90+24	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		FireTarget3			; save Object pointer


;Skull1
defb 20,%01110000+5			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToForeground				;Add To Foreground
defb 	129,0					; Change to program 0 (normal)
defb 	0,128+	0,160+24,90+24	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		SkullObject1			; save Object pointer


;HandLeft3
defb 1+24,%01110000+5			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToBackground					;Add To Background
defb 	129,%11110100				;Program
defb 	0,	20,160+24,90+24+48+8	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		HandObject3			; save Object pointer


;Skull2
defb 20+12,%01110000+5			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToForeground				;Add To Foreground
defb 	129,0					; Change to program 0 (normal)
defb 	0,128+	1,160+24,90+24	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		SkullObject2			; save Object pointer


;HandRight1
defb 20+18,%01110000+5			; 3 commands at the same timepoint

defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToBackground					;Add To Background
defb 	129,%11110011				;Program
defb 	0,	15,160+24,90+24+48	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		HandObject4			; save Object pointer		

;Skull3
defb 20+24,%01110000+5			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToForeground				;Add To Foreground
defb 	129,0					; Change to program 0 (normal)
defb 	0,	2,160+24,90+24	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		SkullObject3			; save Object pointer





;HandRight2
defb 20+18+12,%01110000+5			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb evtAddToBackground					;Add To Background
defb 	129,%11110100				;Program
defb 	0,	16,160+24,90+24+48	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		HandObject5			; save Object pointer

;HandRight3
defb 20+18+24,%01110000+4			; 3 commands at the same timepoint
defb 	%10010000+0+1				; Load Settings from bank 1
defb 	129,%11110101				;Program
defb 	0,	17,160+24,90+24+48	; 	; Single Object sprite 11 (animated)
defb 	138					; save Object pointer
defw 		HandObject6			; save Object pointer

defb 70,%10001001			;Call a memory location
defw	StopBossMovement
;defb 20+18+24	
;defb 136				; Jump to a different level point
;defw StartOfLevel			; pointer
;defb 255					; new time
HandAttack1:
defb 75,%01110000+7
defb 	%10010000+3
defb 	0, 22+128,12*1+24,160	; 	; Single Object / 
defb 	0, 22+128,12*3+24,160	; 	; Single Object / 
defb 	0, 22+128,12*5+24,160	; 	; Single Object / 
defb 	0, 22+128,12*7+24,160	; 	; Single Object / 
defb 	0, 22+128,12*9+24,160	; 	; Single Object / 
defb 	0, 22+128,12*11+24,160	; 	; Single Object / 

defb 77,%01110000+8
defb 	%10010000+4
defb 	0, 22+128+7,12*0+24,24	; 	; Single Object / 
defb 	0, 22+128+7,12*2+24,24	; 	; Single Object / 
defb 	0, 22+128+7,12*4+24,24	; 	; Single Object / 
defb 	0, 22+128+7,12*6+24,24	; 	; Single Object / 
defb 	0, 22+128+7,12*8+24,24	; 	; Single Object / 
defb 	0, 22+128+7,12*10+24,24	; 	; Single Object / 
defb 	0, 22+128+7,12*12+24,24	; 	; Single Object / 

defb 79,%01110000+6
defb 	%10010000+6
defb 	0, 21+128+9,24,24*0+24; 	; Single Object / 
defb 	0, 21+128+9,24,24*2+24; 	; Single Object / 
defb 	0, 21+128+9,24,24*4+24; 	; Single Object / 
defb 	0, 21+128+9,24,24*6+24; 	; Single Object / 
defb 	0, 21+128+9,24,24*8+24; 	; Single Object / 


defb 81,%01110000+6
defb 	%10010000+5
defb 	0, 21+128,160,24*1+24; 	; Single Object / 
defb 	0, 21+128,160,24*3+24; 	; Single Object / 
defb 	0, 21+128,160,24*5+24; 	; Single Object / 
defb 	0, 21+128,160,24*7+24; 	; Single Object / 
defb 	0, 21+128,160,24*9+24; 	; Single Object / 

defb 82	
defb 136				; Jump to a different level point
defw HandAttack1			; pointer
defb 60					; new time




LevelEndAnim:


ifdef BuildMSX
	defb 250,evtCallAddress
	defw 	ParticleBurst
	defb	140+4,110+4,13

	defb 251,evtCallAddress
	defw 	ParticleBurst
	defb	140-4,110-4,13

	defb 252,evtCallAddress
	defw 	ParticleBurst
	defb	140+8,110-8,13

	defb 253,evtCallAddress
	defw 	ParticleBurst
	defb	140-8,110+8,13


endif
	

defb 253,%01110000+2			; 3 commands at the same timepoint
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,21+128+11,140+24,100+24	; 	; Single Object sprite 11 (animated)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 254
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





defb 2,evtCallAddress			;Call a memory location
defw	EndLevel

ifdef BuildMSX
ParticleBurst:
	push bc
	push de
		ld b,(hl)
		inc hl
		ld c,(hl)
		inc hl
		ld d,(hl)
		inc hl


		ld a,1
		call Akuyou_Aku_CommandNum
	pop de
	pop bc
ret
endif


EndLevel:
	pop hl	;
	ld hl,	&0103 				;load level 2
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
	ld a,128+0
	ld hl,(SkullObject1)
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
		incbin "..\ResCPC\Level2-Tiles-CPC.SPR"
endif
ifdef BuildZXS
	AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
		defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
	LevelTiles:
		incbin "..\ResZX\Level02-Tiles-ZX.TSP"

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
				ld b,200-48-16-32-16-8-32-8
			else
				ld b,192-48-16-32-16-8-32-8
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
	defb GradientTopStart-40,&00	;8
	defb GradientTopStart-46,&00	;9
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
	defb 64+6		;BOTTOM
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 00+6
	defb 00+5
	defb 00+5
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
	defb 64+1		;TOP
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
	defb &99,&99	,%00000000
	defb &99,&95	,%11111100
	defb &59,&59	,%11111100
	defb &95,&55	,%11111100
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
	defb 96,48	,%00000000,&00
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
	defb 144,8
	defw 	MsxTilesPos+16+16+8
	defb 	%11111110,0
	defb 184,8
	defw 	MsxTilesPos+16+16
	defb 	%11111111,0
	defb 0,0
MSXTileListBackgroundV9990:
	defb 0,32
	defw 	MsxTilesPos
	defb 	%11000000,0
	defb 0,0

MSXTileListForegroundV9990:
	defb 192-32,32
	defw 	MsxTilesPos+32+32
	defb 	%11111111,0
	defb 0,32
	defw 	MsxTilesPos+32
	defb 	%11111000,0
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
	defb 	%11111111,0
	defb 48,16
	defw 	MsxTilesPos
	defb 	%11111000,0
	defb 144,8
	defw 	MsxTilesPos+16+16+8
	defb 	%11111110,0
	defb 0,0



NewGradientV9990:
	gradstart equ 192

	defb &99,&99,&99,&99	;1; first line
	defb gradstart-06, &99,&95	,%11111100
	defb gradstart-10, &59,&59	,%11111100
	defb gradstart-16, &95,&55	,%11111100
	defb gradstart-20 ,&55,&55	,%00000000

	defb gradstart-26, &55,&50	,%11111100
	defb gradstart-30, &05,&05	,%11111100
	defb gradstart-36, &50,&00	,%11111100
	defb gradstart-40 ,&00,&00	,%00000000
	defb gradstart-50 ,&00,&00	,%00000000

	defb 50, 		&A0,&00	,%11111111
	defb 46, 		&0A,&0A	,%11111111
	defb 40, 		&AA,&A0	,%11111111
	defb 36	,		&AA,&AA	,%11111111

	defb 30, 		&7A,&AA	,%11111111
	defb 26, 		&A7,&A7	,%11111111
	defb 20, 		&77,&7A	,%11111111
	defb 16	,		&77,&77	,%11111111
	defb 12	,		&77,&77	,%11111111
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
	defb 25
	defw &0000
	defw &004C
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 50
	defw &0000
	defw &000F
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 75
	defw &0000
	defw &002B
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 100
	defw &0000
	defw &0059
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 125
	defw &0000
	defw &0077
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 150
	defw &0000
	defw &0088
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 175
	defw &0000
	defw &00B4
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
	defb 200
	defw &0000
	defw &00F4
	defw &0784;14  -GRB
	defw &0EFC;13  -GRB
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
defb %10001110,%00001110;6  -RRR-BBB,-----GGG
defb %11100000,%00000000;7  -RRR-BBB,-----GGG
defb %00000100,%00001110;8  -RRR-BBB,-----GGG
defb %11101110,%00000100;9  -RRR-BBB,-----GGG
defb %10000000,%00000000;10  -RRR-BBB,-----GGG
defb %00000000,%00001000;11  -RRR-BBB,-----GGG
defb %10101110,%00001010;12  -RRR-BBB,-----GGG
defb %11101100,%00001110;13  -RRR-BBB,-----GGG
defb %10000100,%00000110;14  -RRR-BBB,-----GGG
defb %01000010,%00000100;15  -RRR-BBB,-----GGG



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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Show Boss Text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	read "..\SrcAll\Akuyou_Multiplatform_Level_ShowBossText.asm"


BossText: 
if BuildLang=''
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db  11,"W A R N I N G ! ! ","!"+&80
db  06,"A Big Enemy is approaching","!"+&80
db  07,"Skull + Spider = Skullder","!"+&80
db  05,""," "+&80
db  05,""," "+&80
db  06,"(Or Spill, if you prefer!",")"+&80
;b  "12345678901234567890123456789","0"+&80
db &0
endif

if BuildLang='j'
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db  11,"W A R N I N G ! ! ","!",255
	db 10,120,111,129,159,115,134,132,120,119,159,127,144,112,132,115,144,126,"!",255
	db 5,"S","K","U","L","L", 133, "S","P","I","D","E","R", 129,159,119,152, 099,"S","K","U","L","L","D","E","R",100,"!",255
db  05,""," ",255
db  05,""," ",255
	db 7,"(",128,155,119,159,129,159,147,134,152,101,099,"S","P","I","L","L",100,139,133,159,116,"?",")",255

db &0
endif

if BuildLang='r'
     ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db  9,	111," ",112," ",97," ",114," ",110," ",111," ",114," ",115," ",125," ","!"," ","!"," ","!",255
db  6,	110,134,152,147,143," ",143,132,145,143,141,142,143,134," ",144,145,137,130,140,137,135,129,134,147,146,160,"!",255
db  11,	114," ",107," ",116," ",108," ",108," ",101," ",102," ",113," ","!",255
db  05,""," ",255
db  05,""," ",255
db  7,	"(",137,140,137," ",114,139,148,140,140,137,","," ",133,140,160," ",139,143,132,143," ",139,129,139,")",255
db &0
endif



SkullObject1: defw &6969
SkullObject2: defw &6969
SkullObject3: defw &6969
HandObject1: defw &6969
HandObject2: defw &6969
HandObject3: defw &6969
HandObject4: defw &6969
HandObject5: defw &6969
HandObject6: defw &6969
SkullTarget: defw &6969
BossLife: defb 100
BossHurt: defb &0
FireTarget1: defw &6969
FireTarget2: defw &6969
FireTarget3: defw &6969



CustomObjectHitHandler:

ld a,iyl
cp 2
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
	ld a,128+3
	ld hl,(SkullObject1)
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
	cp 80
	jp z,BossLife1
	cp 60
	jp z,BossLife2
	cp 40
	jp z,BossLife3
	cp 20
	jp z,BossLife4
	cp 1
	jp z,BossLife5
	jp UpdateBossLife
BossLife5:
	push af
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
		ld hl,(SkullObject1)
		call SetObjectSprite
		ld a,128+13
		ld hl,(SkullObject2)
		call SetObjectSprite
		ld a,128+14
		ld hl,(SkullObject3)
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
		ld a,128+10
		ld hl,(SkullObject2)
		call SetObjectSprite
		ld a,128+11
		ld hl,(SkullObject3)
		call SetObjectSprite	
	pop af
	jp UpdateBossLife
BossLife3:
push af
		ld a,128+8
		ld hl,(SkullObject2)
		call SetObjectSprite
		ld a,128+9
		ld hl,(SkullObject3)
		call SetObjectSprite	
	pop af
	jp UpdateBossLife
BossLife2:
	push af
		ld a,128+6
		ld hl,(SkullObject2)
		call SetObjectSprite
		ld a,128+7
		ld hl,(SkullObject3)
		call SetObjectSprite	
	pop af
	jp UpdateBossLife
BossLife1:
	push af
		ld a,128+4
		ld hl,(SkullObject2)
		call SetObjectSprite
		ld a,128+5
		ld hl,(SkullObject3)
		call SetObjectSprite	
	pop af
	jp UpdateBossLife
UpdateBossLife:
	ld (BossLife),a

	
	
	pop hl
	pop de
ret


StopBossMovement:
	push hl
	push de
		ld a,&24
		ld hl,(SkullObject1)
		call SetObjectMove

		ld a,&24
		ld hl,(SkullObject2)
		call SetObjectMove

		ld a,&24
		ld hl,(SkullObject3)
		call SetObjectMove	

		ld a,&24
		ld hl,(HandObject1)
		call SetObjectMove	
		ld a,&24
		ld hl,(HandObject2)
		call SetObjectMove	
		ld a,&24
		ld hl,(HandObject3)
		call SetObjectMove	
		ld a,&24
		ld hl,(HandObject4)
		call SetObjectMove	
		ld a,&24
		ld hl,(HandObject5)
		call SetObjectMove	
		ld a,&24
		ld hl,(HandObject6)
		call SetObjectMove	
		ld a,&24
		ld hl,(SkullTarget)
		call SetObjectMove	
		ld a,&24
		ld hl,(FireTarget1)
		call SetObjectMove	
		ld a,&24
		ld hl,(FireTarget2)
		call SetObjectMove
		ld a,&24
		ld hl,(FireTarget3)
		call SetObjectMove		

	pop de
	pop hl
ret
;jp Akuyou_Object_DecreaseLifeShot




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
	save direct "T14-SC1.D01",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif


