;Level fixes
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


MSX_BulletSprites equ 6
NO_MSX_MainTileposB equ 1

;UseBackgroundFloodFillQuadSpriteColumn equ 1

read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &DB00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildENT
		write "..\BldENT\T29-SC1.D02"
endif
ifdef buildZXS
	write "..\BldZX\Level09.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T29-SC1.D02"
	else
		write "..\ResMSXj\T29-SC1.D02"
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
		incbin "..\ResCPC\LEVEL9A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL9A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL9A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
		MSXTiles:
			incbin "..\ResMSX\Level9-Tiles-MSX.RLE"
		MSXTiles_End:

		MSXOmega:
			incbin "..\ResMSX\Level9Bullets.RLE"
		MSXOmega_End:

		MSXBullets:
			incbin "..\ResMSX\Level9BulletsN.RLE"
		MSXBullets_End:
	endif







if buildCPCv+buildENTv

	screenLeft equ 24
	screenRight equ 184 

else
	screenLeft equ 40
	screenRight equ 168
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









	if buildCPCv+buildENTv
NormalBackbb:
	ifdef BuildCPC
		ld de,(BackgroundSolidFillNextLine_Minus1+1)
	endif
		read "level09_Bk.asm"
	ret
endif

	


EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static
defb 0,evtAddToBackground

;defb 0,evtReprogramScrollDirection,1; 0-Left (Default) 1-Right 2-Up 3-Down

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



FirstPowerupSprite equ  128+1
defb 0,evtReprogram_PowerupSprites,FirstPowerupSprite+53,FirstPowerupSprite+52,FirstPowerupSprite+51,FirstPowerupSprite	; sprites drone,speed,power,coin

;defb 0,evtReprogramScrollDirection,2; 0-Left (Default) 1-Right 2-Up 3-Down

; Background L
defb 0,128+4,1,mveBackground+%00000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,evtSettingsBank_Save,0				; Save Object settings to Bank 0

defb 0,128+4,1,mveBackground+%00000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,evtSettingsBank_Save,1				; Save Object settings to Bank 1



;Coin
defb 0,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,3,%10000111,64+63
;defb 	evtSetProgMoveLife,3,&24,64+63
defb 	evtSetSprite,128+1;16		
defb 	evtSettingsBank_Save,3




;Necromancer
defb 0,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1Protected,mveCustom1,lifEnemy+30; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,128+0;16		
defb 	evtSettingsBank_Save,2

defb 0,evtReprogramCustomMove1
defw CustomMove1


defb 0,evtReprogramCustomProg1
defw CustomProgram1

defb 0,evtReprogramSmartBombSpecial
defw DisableOmegaArray
;Necromancer
;defb 0,evtMultipleCommands+3					; 3 commands at the same timepoint
;defb 	evtSetProgMoveLife,prgCustom1Protected,&24,0; Program - Fire Left... Move - wave... Hurt by bullets, hurts player, life 4
;defb 	evtSetSprite,128+3;16		
;defb 	evtSettingsBank_Save,3



;doors
defb 0,evtMultipleCommands +6

defb 	evtSetProgMoveLife,0,&24,0
defb 	evtSingleSprite,3 ,screenLeft 		,24+16+24
defb 	evtSingleSprite,3 ,screenRight -16	,24+16+24
ifdef BuildZXS
	defb 	evtSingleSprite,5 ,screenLeft 		,200+24-8
	defb 	evtSingleSprite,5 ,screenRight -16	,200+24-8
else
	defb 	evtSingleSprite,5 ,screenLeft 		,200+24-24
	defb 	evtSingleSprite,5 ,screenRight -16	,200+24-24
endif
defb 	evtSingleSprite,3 ,24+80-8		,100+24-16+24





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
	defb &54,&5C,&56,&4B	

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&5C,&56,&4B	


	defb 240,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5C,&56,&4B		


endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;Necromancer
defb 15,evtMultipleCommands +2
defb 	evtSettingsBank_Load +2
defb 	evtSingleSprite,TwoFrameSprite+0 ,24+160,24+100
;defb 	evtSingleSprite,TwoFrameSprite+0 ,0+16,24*3+7



LevelIdleLoop:
defb 100	
defb 	evtJumpToNewTime			; Jump to a different level point
defw 	LevelIdleLoop				; pointer
defb	 0					; new time



LevelEndAnim:

defb 120+9,evtCallAddress			;Call a memory location
defw	ClearBadguys

defb 130,evtCallAddress
defw SetScrollUp

defb  130,evtMultipleCommands+5					; 3 commands at the same timepoint
defb evtSetProgMoveLife,3,%10001011,64+63
defb evtSetObjectSize,16
defb evtSetAnimator,0
defb evtAddToForeground
defb 	evtSetSprite,128+coinnum;15	
	


coinnum equ 1

;screenLeft

defb 130, evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 131,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 132,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 133,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 134,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 135,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 136,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 137,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 138,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 139,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 140,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 141,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 142,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 143,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 144,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum
defb 145,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum


;defb 160,%01110000+2			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb 	0,128+	20,140+24,100+24	; 	; Single Object sprite 11 (animated)

;defb 160,%10001001			;Call a memory location
;defw	ClearBadguys
;Palette Change


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


defb 165,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&01FB 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return


ClearBadguys:
	ld a,1
	ldia
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret


LevelInit:
ifndef BuildMSX
	call Akuyou_get_scr_addr_table
	ld (scr_addr_tablePos_Plus2-2),hl
else

	ld hl,&66
	call Akuyou_SetStarArrayPalette


	call AkuYou_Player_GetPlayerVars

	ld hl,OmegaMSX2
	ld a,(iy-1)
	and %00000001
	jr z,notV9990
	ld hl,OmegaV9990 
notV9990:
ld (OMegaMSXJump_Plus2-2),hl



;	ld a,0
;	call Akuyou_VDP_CommandNum	;get the address of V9k VDP_LMMM_BusyCheck
;	ld bc,7*2
;	add hl,bc
;	ld a,(hl)
;	inc hl
;	ld h,(hl)
;	ld l,a
;	ld (LMMMCall_plus2-2),hl



endif
;	ld a,0
;	call Akuyou_ShowSpriteReconfigureEnableDisable


	call AkuYou_Player_GetPlayerVars
	ld a,100
	ld (iy+0),a
	ld (iy+0+Akuyou_PlayerSeparator),a

	ld a,70+24
	ld (iy+1),a

	ld a,90+24
	ld (iy+1+Akuyou_PlayerSeparator),a
	

	ld de,OmegaArrayPointer1+1

	ld bc,OmegaArraySize*3*4

ifdef buildZXS
	ld a,7	
	ld hl,OmegaWipe
	;call Akuyou_Bankswapper_CallHL
else
	call OmegaWipe
endif


	


	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"
ifdef BuildMSX

		ld a,2				;VDP_RLEProcessor_GetLastY
		call Akuyou_VDP_CommandNum
		ld (VDP_Star_SY),iy

		ld hl,MSXOmega
		ld de,MSXOmega_End
		ld bc,MSXOmega_End-MSXOmega
		ld ix,&0000
		call Akuyou_VDP_RLEProcessorFromMemory	


endif

	ld hl,OmegaArrayPointer1+OmegaArraySize*2


LevelLoop:




	read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"


	ld a,0	:ArrayMode_Plus1
	cp 1
	jp z, NoStarArray
	
NoStarArray:

	cp 2
	jp z, NoOmegaArray


ifdef BuildMSX
	ld a,0	:OmegaBulletSprite_Plus1
	add 6
	cp 6*6
	jr nz,OmegaspriteNoReset
	xor a
OmegaspriteNoReset:
	ld (OmegaBulletSprite_Plus1-1),a
	ld (VDP_Star_SX),a
endif


ifdef buildZXS
	ld a,7	
	ld hl,OmegaArray_Redraw
	call Akuyou_Bankswapper_CallHL
else
	call OmegaArray_Redraw
endif
NoOmegaArray:



ifdef buildZXS
	ld a,7	
	ld hl,ShowBossText
	call Akuyou_Bankswapper_CallHL
else
	call ShowBossText
endif


ifdef buildZXS
	ld a,7	
	ld hl,BossLifeBar	:BossLifeBarCall_Plus2
	call Akuyou_Bankswapper_CallHL
else
	call BossLifeBar	:BossLifeBarCall_Plus2
endif


ei



	ld a,r
	xor 0 :Randomizer_Plus1
	ld (Randomizer_Plus1-1),a
	and %00001100;%00001110
	call z,StarArrayWarp ; welcome to hell!



	read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"
jp LevelLoop


ifdef BuildZXS

ZXLevelend:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl

		ld hl,LevelEndAnim
		ld a,120+7
		call Akuyou_SetLevelTime

ret

endif






CallHL:
	push hl
ret
if buildCPCv+buildENTv

SpFill2:
ld (SpRestoreFill2_Plus2-2),sp

SpFillContinue2:
ld sp,hl
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
ld hl,&0000
add hl,sp
ld sp,&0000:SpRestoreFill2_Plus2
ei
di
djnz SpFillContinue2
ei
ret
endif

;ClearChar
;		call Akuyou_GetMemPos
;		ld b,8
;
;ClearCharMoreLines
;		ld (hl),0
;		call Akuyou_ScreenBuffer_GetNxtLin
;		djnz ClearCharMoreLines
;ret







SetScrollUp:
	push hl
	ld a,3
	call Akuyou_Background_SetScroll
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
	read "..\SrcMSX\Akuyou_MSX_VDP_InterlaceFill.asm"
	
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


ifdef BuildZXS
Boss_DeadZX:
	ld hl,LevelEndAnim
	ld a,120+7
	call Akuyou_SetLevelTime
	ret
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Generic Background Begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Background_Draw: 
ifdef BuildZXS
	ld a,0	:BossDead_Plus1
	or a
	jp z,BossLives

	di
		ld a,Akuyou_LevelStart_Bank
		ld hl,Boss_DeadZX
		call Akuyou_Bankswapper_CallHL	
		xor a
		ld (BossDead_Plus1-1),a
	ei
BossLives:
endif


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
BackgroundPattern1msx:
db 255,254
BackgroundPattern1:
db 255,254
BackgroundPattern2msx:
db &88,&77,&88,&77,&88,&77,&88,&77,&11,&11,254
BackgroundPattern2:
db &88,&77,&88,&77,&88,&77,&88,&77,255,254

Background_DrawB: 

	ld b,h
	ld c,l
	ld hl,BackgroundPattern1 :BackgroundDrawPatternb_Plus2
	ld d,(hl)
	inc hl
	ld a,(hl)
	
	cp 254
	jr z,Background_DrawBUpdateSkipb
	ld (BackgroundDrawPatternb_Plus2-2),hl
Background_DrawBUpdateSkipb: 
;	ld h,b
;	ld l,c

	ld a,d
	cp 255
	jp nz,FillBackMSX


		
	ld hl,0000 :MSX_MainTilepos_Plus2
	ld bc,8
	add hl,bc
	ld (VDP_MyLMMM_SY),hl

	call Akuyou_ScreenBuffer_GetActiveScreen
	ld (VDP_MyLMMM_DY+1),a
	ld (VDP_BrickMiddle_DY+1),a


	ld a,0
Regradient:
	ld (VDP_MyLMMM_DY),a
	push af


		ld hl,VDP_MyLMMM
		call VDP_InterlaceFill_BusyCheck

		ld a,(VDP_MyLMMM_SY)
		inc a
		ld (VDP_MyLMMM_SY),a
	pop af
	inc a
	inc a
	inc a
	cp 16*3
	jp c,Regradient

	ld a,0
Regradient2:

	push af
		add 144
		ld (VDP_MyLMMM_DY),a

		ld hl,VDP_MyLMMM
		call VDP_InterlaceFill_BusyCheck

		ld a,(VDP_MyLMMM_SY)
		inc a
		ld (VDP_MyLMMM_SY),a

	pop af
	inc a
	inc a
	inc a
	cp 16*3
	jp c,Regradient2

	;Fill the middle strip
	ld a,1
	ld hl,VDP_BrickMiddle
	call Akuyou_VDP_CommandNum	;VDP_HMMV_BusyCheck
ret

FillBackMSX:
	di
	
		ld a,d
		ld (VDP_MyHMMVByte),a
		call Akuyou_ScreenBuffer_GetActiveScreen
		ld (VDP_MyHMMV_DY+1),a

		ld a,1
		ld hl,VDP_MyHMMV
		call Akuyou_VDP_CommandNum	;VDP_HMMV_BusyCheck


	ei
ret

VDP_MyLMMM:
VDP_MyLMMM_SX:	defw &0000 ;SY 32,33
VDP_MyLMMM_SY:	defw &0000 ;SY 34,35
VDP_MyLMMM_DX:	defw &0000 ;DX 36,37
VDP_MyLMMM_DY:	defw &0000 ;DY 38,39
VDP_MyLMMM_NX:	defw &0100 ;NX 40,41 
VDP_MyLMMM_NY:	defw &0001 ;NY 42,43
		defb 0     ;Color 44 - unused
VDP_MyLMMM_MV:	defb 0     ;Move 45
VDP_MyLMMM_CM:	defb %10011000 ;Command 46	


VDP_BrickMiddle:
VDP_BrickMiddle_DX:	defw &0000 ;DX 36,37
VDP_BrickMiddle_DY:	defw &0030 ;DY 38,39
VDP_BrickMiddle_NX:	defw &0100 ;NX 40,41
VDP_BrickMiddle_NY:	defw &0060 ;NY 42,43
VDP_BrickMiddleByte:	defb &11   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	






VDP_MyHMMV:
VDP_MyHMMV_DX:	defw &0000 ;DX 36,37
VDP_MyHMMV_DY:	defw &0000 ;DY 38,39
VDP_MyHMMV_NX:	defw &0100 ;NX 40,41
VDP_MyHMMV_NY:	defw &00C0 ;NY 42,43
VDP_MyHMMVByte:	defb &11   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	


MSX2V9990:			;V9990 version
	ld b,h
	ld c,l
	ld hl,BackgroundPattern1 :BackgroundDrawPattern_Plus2
	ld d,(hl)
	inc hl
	ld a,(hl)
	
	cp 254
	jr z,Background_DrawBUpdateSkip
	ld (BackgroundDrawPattern_Plus2-2),hl
Background_DrawBUpdateSkip: 
;	ld h,b
;	ld l,c

	ld a,d
	cp 255
	jp nz,FillBackMSX

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld (VDP_MyHMMV_DY+1),a

		ld hl,Akuyou_V9K_Paralax_Y
		ld a,3
		call Akuyou_VDP_CommandNum	;Set tile pos
		ld ix,NewGradientMSX2
		ld hl,0000;MSXTileList
		ld de,MSXTileListV9990
		call Akuyou_Background_Tiles



ret


Background_DrawMsx2:		;Foreground Paralax layer V9990 only
nop		;For smartbomb call
ret
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 				SPECCY and CPC background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifndef buildMSX			
	GradientTopStart equ 40

BackgroundPattern1:
db 255,254
BackgroundPattern2:
db &F0,&0F,&F0,&0F,&F0,&0F,&F0,&0F,0,0,254


Background_DrawB: 

	ld b,h
	ld c,l
	ld hl,BackgroundPattern1 :BackgroundDrawPattern_Plus2
	ld d,(hl)
	inc hl
	ld a,(hl)
	
	cp 254
	jr z,Background_DrawBUpdateSkip
	ld (BackgroundDrawPattern_Plus2-2),hl
Background_DrawBUpdateSkip: 
	ld h,b
	ld l,c

	ld a,d
	cp 255
	jp z,NormalBackbb
ifdef BuildZXS
	cp &0
	ld bc,BackgroundColorMap
	jr z,SkipBack

	ld de,&FFFF
	ld bc,BackgroundColorMapR
	cp &F0

	jr z,SkipBack
	ld bc,BackgroundColorMapG
	cp &0F
endif
SkipBack:
ifdef BuildZXS
	ld (SpeccyBackground_Plus2-2),bc
endif
		ld e,d
		ifdef CPC320
			ld b,200
		else
			ld b,192
		endif
		ifdef buildZXS
			call Akuyou_BackgroundSolidFill ;need pointer to sprite in HL
		else
			call BackgroundSolidFill ;need pointer to sprite in HL
		endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;				Spectrum & CPC Tile Bitshifts (MSX doesn't need them)
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	ifdef buildZXS
		ld de,BackgroundColorMap :SpeccyBackground_Plus2
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



BackgroundColorMapR:		;Spectrum background colors (64=bright)
	defb 64+2		;BOTTOM
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2		;TOP


BackgroundColorMapG:		;Spectrum background colors (64=bright)
	defb 64+4		;BOTTOM
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4
	defb 64+4		;TOP

BackgroundColorMap:		;Spectrum background colors (64=bright)
	defb 64+7		;BOTTOM
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7
	defb 64+7		;TOP
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
;defb 0
;	defb &88,&88	,%00000000
;	defb &88,&8C	,%11111110
;	defb &8C,&8C	,%11111110
;	defb &8C,&CC	,%11111110
	;defb &CC,&CC	,%00000000
;	defb &CC,&CD	,%11111110
;;	defb &DC,&DC	,%11111110
;	defb &CD,&DD	,%11111110
;
;defb 152
;	defb &B0,&00	,%11111100
;	defb &0B,&0B	,%11111100
;	defb &BB,&B0	,%11111100
;	defb &BB,&BB	,%00000000
;	defb &AB,&BB	,%11111100
;	defb &BA,&BA	,%11111100
;	defb &AA,&AB	,%11111100
;	defb &AA,&AA	,%00000000
;NewGradientMSX2_SB:
defb 255


MSXFills:
;	defb 0,16	,%11111100,&50
;	defb 40,20	,%00000000,&00
;	defb 76,36	,%00000000,&00
;	defb 128,16	,%00000000,&00
;	defb 160,24	,%11111111,&A0

	defb 0,0

		MsxTilesPos equ 0;
MSXTileList:
;0-32=gradient
	defb 32,8;40
;	defw 	MsxTilesPos
;	defb 	%11111100,0
;	defb 60,16 ;76
;	defw 	MsxTilesPos+8+16+8+8
;	defb 	%11111000,0
;	defb 112,16;128
;	defw 	MsxTilesPos+8
;	defb 	%11111000,0
;	defb 144,8;152
;	defw 	MsxTilesPos+16+8
;	defb 	%11111100,0
;;152-184=gradient
;	defb 184,8
;	defw 	MsxTilesPos+16+8+8
;	defb 	%11111111,0
	defb 0,0



MSXTileListBackgroundV9990:
;	defb 48-2,96
;	defw 	MsxTilesPos+64+96+96
;	defb 	%11100000,0
;	defb 48-1,96
;	defw 	MsxTilesPos+64+96
;	defb 	%11110000,0

;	defb 48,96
;	defw 	MsxTilesPos+64	
;	defb 	%11111000,0
;	defb 0,64
;	defw 	MsxTilesPos
;	defb 	%11111100,0

	defb 0,0

MSXTileListForegroundV9990:
;	defb 0,32
;	defw 	MsxTilesPos+64+96+96+96
;	defb 	%11111110,0
;	defb 192-32,32
;	defw 	MsxTilesPos+64+96+96+96+32
;	defb 	%11111111,0
	defb 0,0


MSXTileListV9990:
;0-32=gradient
	defb 0,192
	defw 	MsxTilesPos	:MSX_OmegaTile_Plus2
	defb 	0,0
;	defb 60,16 ;76
;	defw 	MsxTilesPos+8+16+8+8
;	defb 	%11111000,0
;	defb 112,16;128
;	defw 	MsxTilesPos+8
;	defb 	%11111000,0
;	defb 144,8;152
;	defw 	MsxTilesPos+16+8
;	defb 	%11111100,0
;152-184=gradient
;	defb 184,8
;	defw 	MsxTilesPos+16+8+8
;	defb 	%11111111,0
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

;	defb 50, 		&B0,&00	,%11111111
;	defb 46, 		&0B,&0B	,%11111111
;	defb 40, 		&BB,&B0	,%11111111
;	defb 36	,		&BB,&BB	,%11111111
;
;	defb 30, 		&AB,&BB	,%11111111
;	defb 26, 		&BA,&BA	,%11111111
	;defb 20, 		&AA,&AB	,%11111111
;	defb 16	,		&AA,&AA	,%11111111
;	defb 12	,		&AA,&AA	,%11111111
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
	defw &04C4
	defw &0F44;14  -GRB
	defw &0FCF;13  -GRB
	defb 50
	defw &0000
	defw &04C4
	defw &0F44;14  -GRB
	defw &0FBF;13  -GRB
	defb 75
	defw &0000
	defw &03C3
	defw &0F33;14  -GRB
	defw &0FEF;13  -GRB
	defb 100
	defw &0000
	defw &03C3
	defw &0F33;14  -GRB
	defw &0FFF;13  -GRB
	defb 125
	defw &0000
	defw &02C2
	defw &0F22;14  -GRB
	defw &0FFF;13  -GRB
	defb 150
	defw &0000
	defw &02C2
	defw &0F22;14  -GRB
	defw &0FEF;13  -GRB
	defb 175
	defw &0000
	defw &01C1
	defw &0F11;14  -GRB
	defw &0FBF;13  -GRB
	defb 200
	defw &0000
	defw &01C1
	defw &0F11;14  -GRB
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
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0FFF;4  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &00F0;7  -GRB
defw &0E06;8  -GRB
defw &07FC;9  -GRB
defw &0844;10  -GRB
defw &0523;11  -GRB
defw &00A0;12  -GRB
defw &0050;13  -GRB
defw &0BF1;14  -GRB
defw &0BED;15  -GRB



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




null:		;NULL COMMAND MUST BE IN SPECTRUM BLOCK!
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


align 256,&00
OmegaArraySize equ 256
OmegaArrayPointer1: 	
defs OmegaArraySize*3,&0
OmegaArrayPointer2: 	
defs OmegaArraySize*3,&0
OmegaArrayPointer3: 	
defs OmegaArraySize*3,&0
OmegaArrayPointer4: 	
defs OmegaArraySize*3,&0

defs 64,0

BossLife: defb 32*3
BossLifeB: defb 7

read "..\SrcAll\Akuyou_Multiplatform_BossLifeBar.asm"

ifdef BuildMSX

	pushde32:push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	jp (hl)
endif



OmegaBurstGeneral:
		push hl
			push af

				call OmegaArray_GetPointer	
				ld b,32
				call OmegaArray_Engage
			pop af
			ld b,a
			and %00001111
			or a
			pop hl
			ret nz
			ld a,b
			sub %00010000
			and %11110000
			push hl
				call OmegaArray_GetPointer	
;				call OmegaArray_EngageV2


OmegaArray_EngageV2:

	ld b,OmegaArraySize
;	ld de,&8000
;	ld a,r
;	ld e,a
OmegaArray_Engage_LoopV2:

	ld a,(hl)
	or a
	jr z,OmegaArray_EngageV2MoveNext
	and %00001111
	ld c,a

	ld a,1:NextShotB_Plus1
	add %00010000 
	ld (NextShotB_Plus1-1),a
;	ld a,r
;rlca
;rlca
	and %01110000
	or c

	ld (hl),a
OmegaArray_EngageV2MoveNext:
	inc l
	djnz OmegaArray_Engage_LoopV2

	pop hl
ret



OmegaArray_Engage:


	;ld de,&8000
	;ld a,r
	;ld e,a
OmegaArray_Engage_Loop:

	ld a,(hl)
	or a
	jp nz,OmegaArray_Engage_Loop_Skip

	;ld a,(de)
	;ld c,a
	;inc de
	;ld a,(de)
	;inc de
	;xor c
	
	ld a,&0 :NextShot_Plus1
	add %00000010 
	ld (NextShot_Plus1-1),a

	and %01111110
;	inc a
	ld (hl),a
	;ld iyl,a



	;and %00001111
	;inc h
	;ld (hl),a
;	ld a,r
;	rrca
;;	rrca

	ld a,0 :XIncer_Plus1
	inc a
	ld (XIncer_Plus1-1),a
	rrca
	and %00001111

	or &80	:OmegaX_Plus1


	inc h
	ld (hl),a
	inc h

;	ld a,r
	ld a,0 :YIncer_Plus1
	dec a
	ld (YIncer_Plus1-1),a

	and %00011111
	or &80	:OmegaY_Plus1
	ld (hl),a
;	dec h
	dec h
	dec h
OmegaArray_Engage_Loop_Skip:
	inc l
	djnz OmegaArray_Engage_Loop

ret


OmegaArray_GetPointer:
	;000BBPPP
	ld e,a
	and %00110000
	cp  %00000000
	jp z,OmegaBank1
	cp  %00010000
	jp z,OmegaBank2
	cp  %00100000
	jp z,OmegaBank3
	cp  %00110000
	jp z,OmegaBank4
OmegaBank1:
	ld hl,OmegaArrayPointer1
	jr OmegaArray_GetPointer_Finish
OmegaBank2:
	ld hl,OmegaArrayPointer2
	jr OmegaArray_GetPointer_Finish
OmegaBank3:
	ld hl,OmegaArrayPointer3
	jr OmegaArray_GetPointer_Finish
OmegaBank4:
	ld hl,OmegaArrayPointer4
	jr OmegaArray_GetPointer_Finish
OmegaArray_GetPointer_Finish:
	ld d,0
	ld a,e
	and %00001111
	rrca
	rrca
	rrca
	rrca
	ld e,a
	
 
	add hl,de
ret


read "..\SrcALL\Akuyou_Multiplatform_OmegaArray.asm"

read "..\SrcAll\Akuyou_Multiplatform_Level_ShowBossText.asm"
if BuildLang='j'


BossText: 
 ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db  11,"W A R N I N G ! ! ","!",endchar
db  05,""," ",endchar
db  05,""," ",endchar

db  11,130,112,130,109,134," ",132,120,119,159," ",127,112,132,115,144,126,"!",endchar
db  14,155,115,139,159,115,125,":",114,129,159,116,130,endchar
db  05,""," ",endchar
db &0

BossText2: 
db  11,"W A R N I N G ! ! ","!",endchar

db  06,132,120,138," ",129,159,158,144,121,119,159," ",116,125,159,109,116,125,159,109," ",127,112,132,144,126,"!",endchar
db  13," ",endchar
db  05,""," ",endchar

db  11,"THE OMEGA ARRAY","!",endchar
db  05,""," ",endchar
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
 ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
db  10,"Z","8","0",138," ",143,158,120,103," ",145,127,132," ",114,122,159,154,"!",endchar

db &0,&0,&0,&0

else

BossText: 
db  11,"W A R N I N G ! ! ","!"+&80
db  05,""," "+&80
db  05,""," "+&80

db  05,"A Tiny Enemy is approachin","g"+&80
db  8,"Necromancer: Vengeance","!"+&80
db  05,""," "+&80
db &0

BossText2: 
db  11,"W A R N I N G ! ! ","!"+&80

db  05,"A shit load of enemy fire i","s"+&80
db  13,"approaching",":"+&80
db  05,""," "+&80

db  11,"THE OMEGA ARRAY","!"+&80
db  05,""," "+&80
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
ifdef CPC320
	db  2,"Lets see what the Z80 can REALLY do","!"+&80
else
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  7,"Feel the power of the Z80!","!"+&80
endif
db &0,&0,&0,&0

endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SetStarArrays:
	ld (ArrayMode_Plus1-1),a
	ret z
	cp 1
	jp DisableStarArray
DisableOmegaArray:

ifdef BuildZXS
	push af
	push hl	
		ld a,7
		ld hl,DisableOmegaArray_bounced
		call Akuyou_Bankswapper_CallDefined_Set
	pop hl
	pop af
jp Akuyou_Bankswapper_CallDefined
endif

DisableOmegaArray_bounced:
	ld de,&0000

	ld hl,OmegaArrayPointer1+256
	ld b,4
	call SpFill

	ld hl,OmegaArrayPointer2+256
	ld b,4
	call SpFill

	ld hl,OmegaArrayPointer3+256
	ld b,4
	call SpFill

	ld hl,OmegaArrayPointer4+256
	ld b,4
	jp SpFill

DisableStarArray:
	ld hl,StarArrayPointer
	ld b,4
	ld de,&0000
	jp SpFill


BossSprite_Vanish:
BossSprite_Arrive:
	push bc
		ld a,(NextShot_Plus1-1)
		ld b,a
		ld a,r
		xor b
		ld (NextShot_Plus1-1),a


		ld a,(NextShotB_Plus1-1)
		ld b,a
		ld a,r
		rrca
		rrca
		xor b
		ld (NextShotB_Plus1-1),a
	pop bc

	xor a
	;disabled for speccytest;ld (OmegaBack_Plus1-1),a

	ld a,128+4
	jr BossSpriteDone
BossSprite_Fire:
	;disabled for speccytest;	xor a
	;disabled for speccytest;	ld (OmegaBack_Plus1-1),a
	;disabled for speccytest;	ld a,8
	;disabled for speccytest;	ld (OmegaBackB_Plus1-1),a
	push hl
		ld hl,BossSprite_Omega_Background 
		ld (ApplyOmegaBlackReset_Plus2-2),hl

		ld hl,BackgroundPattern1
		ld (BackgroundDrawPattern_Plus2-2),hl
ifdef BuildMSX
		ld (BackgroundDrawPatternb_Plus2-2),hl
		ld hl,MsxTilesPos
		ld (MSX_OmegaTile_Plus2-2),hl
endif

	pop hl

	ld a,%00001000	:BossNormalFireRate_Plus1
	ld(CustomProgram1TimerTick_Plus1-1),a

	ld a,128+0
	jr BossSpriteDone

BossSprite_Omega_Background:
	push hl
		ld hl,null
		ld (ApplyOmegaBlackReset_Plus2-2),hl

		ld hl,BackgroundPattern2
		ld (BackgroundDrawPattern_Plus2-2),hl
ifdef BuildMSX
		ld hl,BackgroundPattern2msx
		ld (BackgroundDrawPatternb_Plus2-2),hl
		ld hl,MsxTilesPos+192
		ld (MSX_OmegaTile_Plus2-2),hl
endif
	pop hl
ret

BossSprite_Omega:
	;disabled for speccytest;	ld a,1
	;disabled for speccytest;	ld (OmegaBack_Plus1-1),a
	
	call BossSprite_Omega_Background :ApplyOmegaBlackReset_Plus2


	ld a,%00001000
	ld(CustomProgram1TimerTick_Plus1-1),a

	ld a,0 :nextOmegaTick_Plus1
	inc a
	and %00000011		:OmegaFireRate_Plus1
	ld (nextOmegaTick_Plus1-1),a
	jp nz,OmegaSkipFrame
	
	push bc
	push de

		ld a,0 :nextOmega_Plus1
		inc a
		inc a
		and %00111111
		ld (nextOmega_Plus1-1),a
		call	OmegaBurstGeneral

	pop de
	pop bc
OmegaSkipFrame:
	ld a,128+2
	jr BossSpriteDone

BossSpriteDone:
	ld iyh,a
	ret


DontShowBoss:
	ld a,(NoMoveCount_Plus1-1)
	dec a
	ld (NoMoveCount_Plus1-1),a
	jr z,MoveBoss
	ret

CustomProgram1:

ifdef BuildZXS
	push af
	push hl	
		ld a,7
		ld hl,CustomProgram1_Bounced
		call Akuyou_Bankswapper_CallDefined_Set
	pop hl
	pop af
jp Akuyou_Bankswapper_CallDefined
endif
CustomProgram1_Bounced:

	;ld a,(BossLife)
	;or a
	ld a,b
	cp 160+24	
	ret z


	call Akuyou_Timer_GetTimer

	and 0:CustomProgram1TimerTick_Plus1
	ret z

	ld a,15 :RegularBurstPower_Plus1
	ld iyl,a
	jp Akuyou_FireStar
BossDead:
	ld a,160+24
	ld b,a
ret
CustomMove1:

ifdef BuildZXS
	push af
	push hl	
		ld a,7
		ld hl,CustomMove1_Bounced
		call Akuyou_Bankswapper_CallDefined_Set
	pop hl
	pop af
jp Akuyou_Bankswapper_CallDefined
endif

CustomMove1_Bounced:
	ld a,(BossLife)
	or a
	jp z,BossDead

	ld a,b
	cp 160+24	
	jr z,DontShowBoss

	ld a,%00001000
	ld(CustomProgram1TimerTick_Plus1-1),a

	ld a,1 :NoMoveCount_Plus1
	dec a

	ld (NoMoveCount_Plus1-1),a
	cp 90
	jp nc,BossSprite_Arrive
	cp 10 :NormalFireEnable_Plus1
	jp nc,BossSprite_Fire
	cp 100 :OmegaEnable_Plus1
	jp nc,BossSprite_Omega
	cp 5 :VanishTime_Plus1
	jp nc,BossSprite_Vanish
	or a
	ret nz

MoveBoss

	ld a,95				:BossMoveSpeed_Plus1
	ld (NoMoveCount_Plus1-1),a

;		ld a,iyl ; Program Code
;		ld a,ixl  ;Life
;		ld a,iyh ;spr
;		ld a,ixh ;Move
;		ld (hl),b ;X
;		ld (hl),c ;Y


;defb 	evtSingleSprite,TwoFrameSprite+3 ,20		,24+16
;defb 	evtSingleSprite,TwoFrameSprite+3 ,24+160-24	,24+16
;defb 	evtSingleSprite,TwoFrameSprite+3 ,20		,200+24-32
;defb 	evtSingleSprite,TwoFrameSprite+3 ,24+160-24	,200+24-32
;defb 	evtSingleSprite,TwoFrameSprite+3 ,24+80-8	,100+24-16
ReRand:
 ld c,%10100000	:BossPos_Plus1

di
exx

ld a,(BossLife)
	ld b,a
	ld a,r
	add b
	xor 1:LastRand_Plus1
	ld (LastRand_Plus1-1),a
exx
ei
ld (BossPos_Plus1-1),a
ld a,c

FindBossPoss:
	and %11100000
	cp  %00100000		
	jr z,Boss1
	cp  %01000000		
	jr z,Boss2
	cp  %01100000		
	jr z,Boss3
	cp  %10000000		
	jr z,Boss4
	cp  %10100000		
	jr z,Boss5
	jp ReRand

BossHide:
	
	ld a,32			:BossMoveSpeedB_Plus1
	ld (NoMoveCount_Plus1-1),a

	ld b,160+24
	ld c,2
	jr BossFinish
Boss1:
	ld b,screenLeft -1	+3
	ld c,24+16
jr BossFinish
Boss2:
	ld b,screenRight -21	+3
	ld c,24+16	
jr BossFinish
Boss3:
	ld b,screenLeft -1	+3
	ld c,200+24-32	
jr BossFinish
Boss4:
	ld b ,screenRight -21	+3
	ld c,200+24-32	
jr BossFinish
Boss5:
	ld b,24+80-8	+3
	ld c,100+24-16	
jr BossFinish

BossFinish:
	ld a,b
	add 4
	ld (OmegaX_Plus1-1),a
	ld a,c
	add 12
	ld (OmegaY_Plus1-1),a
ret

CustomObjectHitHandler:
ifdef BuildZXS
	push af
	push hl	
		ld a,7
		ld hl,CustomObjectHitHandler_Bounced
		call Akuyou_Bankswapper_CallDefined_Set
	pop hl
	pop af
jp Akuyou_Bankswapper_CallDefined
endif

CustomObjectHitHandler_Bounced:
	ld a,(BossLife)
	or a
	jp z,BossDead

	ld a,iyl
	cp 8
	jp nz,CustomObjectHitHandler_Finish
	

	;boss life is more than 256
	ld a,(BossLifeB)
	dec a
	ld (BossLifeB),a
	ret nz
	ld a,7
	ld (BossLifeB),a
	;update the real boss life
	ld a,(BossLife)
	dec a


	;*** test****





	ld (BossLife),a
	cp 90
	jp z,BossMode_EnableOmega
	cp 60
	jp z,BossMode_LongOmega
	cp 30
	jp z,BossMode_OmegaFullPower
	cp 0
	jp z,Boss_Dead
	ret

Boss_Dead:
	push hl
ifdef BuildZXS
	ld a,1
	ld (BossDead_Plus1-1),a
else			
	ld hl,LevelEndAnim
	ld a,120+7
	call Akuyou_SetLevelTime
endif
	pop hl
ret

BossMode_EnableOmega:
	push hl
		ld hl,BossText2
		ld (OnscreenTextPointer_Plus2-2),hl
	pop hl
	ld a,&3c
	ld (ShowTextSpeedup_Plus1-1),a
	ld (ShowTextSpeedup_Plus1-2),a
	ld a,15
	ld (OnscreenTimer_Plus1-1),a


	ld a,1
	ld (BossCharNum_Plus1-1),a

	ld a,70
	ld (NormalFireEnable_Plus1-1),a
	ld a,10
	ld (OmegaEnable_Plus1-1),a
ret

BossMode_LongOmega:


	ld a,%00000001;1
	ld (OmegaFireRate_Plus1-1),a
	
	
	ld a,40
	ld (BossMoveSpeed_Plus1-1),a
	
	ld a,20
	ld (BossMoveSpeedB_Plus1-1),a


	ld a,%00010000	
	ld (BossNormalFireRate_Plus1-1),a

	ld a,13
	ld (RegularBurstPower_Plus1-1),a
	
	ld a,30
	ld (NormalFireEnable_Plus1-1),a
	ld a,10
	ld (OmegaEnable_Plus1-1),a
ret

BossMode_OmegaFullPower:
;	ld a,64
;	ld (OmegaVolume_Plus1-1),a


	ld a,%00001000	
	ld (BossNormalFireRate_Plus1-1),a

	
	ld a,30
	ld (BossMoveSpeed_Plus1-1),a
	ld a,25
	ld (NormalFireEnable_Plus1-1),a

	ld a,%00000000;1
	ld (OmegaFireRate_Plus1-1),a

	ld a,10;1
	ld (BossMoveSpeedB_Plus1-1),a
	ld (VanishTime_Plus1-1),a

ret

CustomObjectHitHandler_Finish:
	jp Akuyou_Object_DecreaseLifeShot

;OmegaBurst
;		ld a,(hl)
;		inc hl



OmegaWipe:
	;wipe the omega array
	ld hl,OmegaArrayPointer1
	ld (hl),0
	ldir 	
ret


SpFill:
	ld (SpRestoreFill_Plus2-2),sp

SpFillContinue:
	di
	ld sp,hl
	ld hl,retpoint

	jp PushDe32
retpoint:
	ld hl,&0000
	add hl,sp
	ei
	ld sp,&0000:SpRestoreFill_Plus2
	di


	djnz SpFillContinue
	ei

	ret

ifdef BuildZXS
	;ld de,(BackgroundSolidFillNextLine_Minus1+1)
list
NormalBackbb:
	read "level09_Bk_ZX.asm"
endif


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
	save direct "T29-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif
