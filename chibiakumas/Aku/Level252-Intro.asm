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
		write "..\BldENT\T56-SC1.D02"
endif

ifdef buildZXS
	write "..\BldZX\Level252.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T56-SC1.D02"
	else
		write "..\ResMSXj\T56-SC1.D02"
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
		incbin "..\ResCPC\Level252A.SPR"
	endif
	ifdef buildZXS
		incbin "..\ResZX\Level252A-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\LEVEL252A.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
;		MSXTiles
;			incbin "..\ResMSX\Level3-Tiles-MSX.RLE"
;		MSXTiles_End

;		MSXBullets
;			incbin "..\ResMSX\Level3Bullets.RLE"
;		MSXBullets_End

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









;

DiskMap_Intro       		equ &10C1+&2800	; T56-SC1.D03

;DiskMap_Intro_Screens  		equ &13C1+&2800	; T59-SC1.D03
;DiskMap_Intro_Screens_Size	equ 32	
;DiskMap_Intro_Screens2  	equ &17C1+&2800	; T63-SC1.D03
;DiskMap_Intro_Screens2_Size	equ 32	
DiskMap_Intro_Disk 		equ 2

;
;Rastercolor buffer - 80 bytes (&50



CustomRam:
defs 128 ;  Pos-Tick-Pos-Tick ; enough memory for 16 enemies!



EventStreamArray:

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


defb 0,128+4,0,&24,0				; Static object
defb 0,%10010000+15,2				; Save Object settings to Bank 2

defb 0,128+4,0,&60,0	
defb 0,%10010000+15,3

defb 0,128+4,0,&32,0			;2b 32 39
defb 0,%10010000+15,4

defb 0,evtMultipleCommands+5
defb evtAddToForeground
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite,3 ,24+80-16	,24+80+6
defb 	evtSaveLstObjToAdd
defw 		charnikohime
defb evtAddToBackground

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
	defb &54,&4D,&4F,&4B;defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 255		;delay			
	defb &54,&47,&52,&4B	;	defb &54,&4D,&4F,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 0
	defb &54,&47,&52,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&47,&52,&4B	
	
	;defb 4	
	;defb 136				; Jump to a different level point
	;defw TestPos				; pointer
	;defb 115


endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;TEST;;;;;;;;;;;;;
;	defb 10
;	defb 136				; Jump to a different level point
;	defw SpeedUpI
;	defb 154
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



defb 10,evtCallAddress			;Call a memory location
defw	ShowText1Init



defb 49,evtCallAddress			;Call a memory location
defw	ShowText0Init

ifdef BuildMSX
	defb 49,evtCallAddress
	defw DoPaletteDefault
endif

if BuildCPCv+BuildEntv
	defb 49,evtCallAddress	
	defw DoPaletteChibikoAttacks
endif

	defb 50,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0		;delay			
	defb  &54,&58,&5F,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 20
	defb &54,&47,&52,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&47,&52,&4B	
	

defb 50,evtMultipleCommands+4
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite,TwoFrameSprite+0 ,24+160-24	,24+40-10
defb 	evtSingleSprite,TwoFrameSprite+1 ,24+160-12	,24+40-10
defb 	evtSingleSprite,TwoFrameSprite+2 ,24+160	,24+40-10

defb 51,evtSingleSprite,TwoFrameSprite+6 ,24+160-12-6	,24+40-10
defb 51,evtSingleSprite,TwoFrameSprite+6 ,24+160-12-6	,24+40+24+8-10
defb 51,evtSingleSprite,TwoFrameSprite+6 ,24+160-12	,24+40-10
defb 51,evtSingleSprite,TwoFrameSprite+6 ,24+160-12	,24+40+24+8-10

defb 51,evtSingleSprite,TwoFrameSprite+6 ,24+160-12	,24+40-10+8

;defb 51,evtSingleSprite,TwoFrameSprite+5 ,24+160-12	,24+40-10+20
;defb 21,evtSingleSprite,TwoFrameSprite+6 ,24+160-12-6	,24+40+24+24
;defb 52,evtCallAddress			;Call a memory location
;defw	halttest

	defb 52,%01110000+4			; 4 Commands

	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0		;delay			
	defb &54,&58,&5F,&4B;&54,&4D,&4F,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&4C,&52,&41	
	
	defb 240,26*2+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2 ; no of switches
	defb 0	;delays			
	defb &54,&4C,&52,&41	
	defb 100	;delays			
	defb &54,&5C,&4C,&4D



if BuildCPCv+BuildEntv
	defb 52,evtCallAddress	
	defw DoPaletteChibikoAttacks2
endif



defb 52,evtMultipleCommands+7
defb 	evtSettingsBank_Load+4
defb 	evtAddToBackground
defb 	evtSingleSprite,TwoFrameSprite+6  ,24+80-16	,24+80-4+10
defb 	evtSingleSprite,TwoFrameSprite+6  ,24+80-16+8	,24+80+10
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+5  ,24+80-16	,24+80+10
defb 	evtSaveLstObjToAdd
defw 		charnikohimehead




defb 52,evtCallAddress			;Call a memory location
defw	Decapitate




defb 54,evtCallAddress			;Call a memory location
defw	Decapitateend

defb 55,evtCallAddress			;Call a memory location
defw	DoClear4000

defb 68,evtCallAddress			;Call a memory location
defw	ShowText2Init




	defb 85	
	defb 136				; Jump to a different level point
	defw StartIntroProper				; pointer
	defb 67

StartIntroProper:
defb 68,evtCallAddress			;Call a memory location
defw	ShowText0Init

defb 68,evtCallAddress			;Call a memory location
defw ClearObjects


z; Load Palette

	defb 70,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5D,&40,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&5D,&40,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5D,&40,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5D,&40,&4B
	
defb 72,evtCallAddress			;Call a memory location
defw	ShowText3Init


defb 85,evtCallAddress			;Call a memory location
defw	ShowText4Init
;good

	defb 86,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&53,&5B,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&53,&5B,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&53,&5B,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&53,&5B,&4B


defb 110,evtCallAddress			;Call a memory location
defw	ShowText5Init

;Bad

	defb 111,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5C,&4C,&4D
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&5C,&4C,&4D

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5C,&4C,&4D

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5C,&4C,&4D

defb 140,evtCallAddress			;Call a memory location
defw	ShowText6Init


;alternate

	defb 141,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5D,&4D
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&58,&5D,&4D

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5D,&4D

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5D,&4D

	

;chibiko

	defb 170,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&58,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

defb 170,evtCallAddress			;Call a memory location
defw	ShowText7Init

	defb 175	
	defb 136				; Jump to a different level point
	defw SpeedUpB				; pointer
	defb 190
SpeedUpB:

;Fishing
defb 200,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&55,&5E,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 100	;delay			
	defb &54,&58,&5B,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
defb 200,evtCallAddress			;Call a memory location
defw	ShowText8Init

	defb 205
	defb 136				; Jump to a different level point
	defw SpeedUpC				; pointer
	defb 220
SpeedUpC:

;Forest
	
defb 230,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4C,&4A,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&4C,&4A,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B


defb 230,evtCallAddress			;Call a memory location
defw	ShowText9Init

	defb 235
	defb 136				; Jump to a different level point
	defw SpeedUpD				; pointer
	defb 250
SpeedUpD:

;pollution
defb 5,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 10	;delay			
	defb &54,&52,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
	
defb 5,evtCallAddress			;Call a memory location
defw	ShowText10Init

	defb 10
	defb 136				; Jump to a different level point
	defw SpeedUpE				; pointer
	defb 25
SpeedUpE:

;School

	defb 35,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&58,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B


defb 35,evtCallAddress			;Call a memory location
defw	ShowText11Init

	defb 40
	defb 136				; Jump to a different level point
	defw SpeedUpF				; pointer
	defb 55
SpeedUpF:

defb 65,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 210	;delay			
	defb &54,&56,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

defb 65,evtCallAddress			;Call a memory location
defw	ShowText12Init

	defb 70
	defb 136				; Jump to a different level point
	defw SpeedUpG				; pointer
	defb 85
SpeedUpG:

defb 95,evtCallAddress			;Call a memory location
defw	ShowText13Init

;Fire

	defb 100
	defb 136				; Jump to a different level point
	defw SpeedUpH				; pointer
	defb 115
SpeedUpH:
	
defb 125,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4C,&4A,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&4C,&4A,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

TestPos:	
defb 125,evtCallAddress			;Call a memory location
defw	ShowText14Init

	defb 130
	defb 136				; Jump to a different level point
	defw SpeedUpI				; pointer
	defb 145
SpeedUpI:

;Lightning1

	defb 155,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 255	;delay			
	defb &54,&58,&5F,&4B
	defb 30	;delay			
	defb &54,&56,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B


defb	155,evtCallAddress	;defb 155,evtCallAddress			;Call a memory location
defw	ShowText15Init



	defb 160
	defb 136				; Jump to a different level point
	defw SpeedUpJ				; pointer
	defb 175
SpeedUpJ:

;Lightning2

	defb 185,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&4A,&4B
	
	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 255	;delay			
	defb &54,&56,&4A,&4B
	defb 20	;delay			
	defb &54,&56,&4A,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
defb 185,evtCallAddress			;Call a memory location
defw	ShowText16Init

	defb 190
	defb 136				; Jump to a different level point
	defw SpeedUpK				; pointer
	defb 205
SpeedUpK:

;heaven


	defb 215,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&5B,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&5F,&5B,&4B

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5F,&5B,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5F,&5B,&4B
defb 215,evtCallAddress			;Call a memory location
defw	ShowText17Init

	defb 220
	defb 136				; Jump to a different level point
	defw SpeedUpL				; pointer
	defb 235
SpeedUpL:

;hell


	defb 245,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5C,&4C,&4E
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&5C,&4C,&4E

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&4C,&4E,&43	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&4C,&4E,&43

defb 245,evtCallAddress			;Call a memory location
defw	ShowText18Init
;chibiko

	defb 250
	defb 136				; Jump to a different level point
	defw SpeedUpN				; pointer
	defb 5
SpeedUpN:

	defb 20,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0	;delay			
	defb &54,&58,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

defb 20,evtCallAddress			;Call a memory location
defw	ShowText19Init

;	defb 30
;	defb 136				; Jump to a different level point
;	defw SpeedUpM				; pointer
;	defb 45
;SpeedUpM

defb 50,evtCallAddress			;Call a memory location
defw	DoClear4000

;chibiko

	defb 50,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 0	;delay			
	defb &54,&58,&4C,&4B	
	defb 106	;delay			
	defb &54,&58,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
defb 50,evtCallAddress			;Call a memory location
defw	ShowText20Init

;	defb 60
;	defb 136				; Jump to a different level point
;	defw SpeedUpO				; pointer
;	defb 75
;SpeedUpO

TestHaunt:
;haunting
defb 90,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 95	;delay			
	defb &54,&4C,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&58,&5F,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

defb 90,evtCallAddress			;Call a memory location
defw	ShowText21Init

;defb 110,evtCallAddress			;Call a memory location
;defw	ShowText22Init
defb 120, 136				; Jump to a different level point
defw 	FadeOutB				; pointer
defb 	59





FadeOutB:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 60
;				Start of fade out block
;				Fade out ends at FadeutStart+2, eg if FadeOut=5 then ends at 7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ifdef buildZXS

	defb FadeOutStartPoint+1,evtCallAddress
	defw	 SetSpectrumFadeDark

	defb FadeOutStartPoint+1,evtCallAddress
	defw	 SetSpectrumDisableText


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





defb 64,%10001001			;Call a memory location
	defw	EndLevel
EndLevel:
	pop hl	;
EndLevelFire:

;	call DoClear4000
	ld hl,	&0100 				;load level 2
;	ld hl,	&0100 				;load menu
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

ResetEventStream:
	push hl
		; wipe our memory, to clear out any junk from old levels
		ld de,StarArrayPointer+1
		ld hl,StarArrayPointer
		ld bc,&5FF
		ld (hl),0
		ldir

	pop hl
	;ld hl,EventStreamFadeOut	;Event Stream
	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit
	

ret

DiskMap_EndOutro_Screens  	equ &0DC1	;13 T13-SC1.D03
DiskMap_EndOutro_Screens_Size	equ 24	; &2000
DiskMap_EndOutro_Disk 		equ 3

OutroScreen1 equ &8000
OutroScreen2 equ &8003
OutroScreen3 equ &8006
OutroScreen4 equ &8009

charChibiko: defw &6969
charnikohime: defw &6969
charnikohimeHead:defw &6969
ScreenPosReset:

	 ld      bc,&bc0c			
	 out     (c),c			; select CRTC register 12
	 inc     b				; BC = bd0c
   	 ld a,48
 	 out     (c),a			; set CRTC register 12 data
	 dec     b				; BC = bc0c
	 inc     c				; BC = bc0d
	 out     (c),c			; select CRTC register 13
	 inc     b				; BC = bd0d
	 xor a
	 out     (c),a			; set CRTC register 13 data
ret


DiskMap_MusicIntro 	  		equ &1BC1+&2800 ;T67-SC1.D03
DiskMap_MusicIntro_Size 			equ 2
DiskMap_MusicIntro_Disk 			equ 2

if BuildCPCv+BuildENTv
ScreenFirmwareReset:
	call Akuyou_RasterColors_Blackout
	call Akuyou_Firmware_kill


	ld a,Akuyou_LevelStart_Bank	:LoadBankC_Plus1
	ld hl,&C000	:LoadBankDest3C_Plus2
	ld de,&8000
	ld bc,&3E00	; Don't corrupt the stack!

ifdef BuildCPC
	call Akuyou_BankSwitch_C0_BankCopy
endif
	call	Clear4000


	ld a,Akuyou_LevelStart_Bank
	call Akuyou_BankSwitch_C0_SetCurrent
	call Akuyou_ScreenBuffer_Reset

	ifdef BuildCPC
		ld a,&C0
		call ScreenPosReset
	endif

	jp RasterColorsSetPalette1
endif


LevelInit:
if buildCPCv+buildENTv
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-1)
	and %00000001
	jr z,LevelNotPlus
	ld a,&76
ifdef BuildCPC
	ld (CPCPlusSlowdown),a
endif
LevelNotPlus:

	ld a,(iy-1)


ifdef BuildCPC
	and %10000000
	jr z,Level64k
	ld a,LevelData128kpos_C_Bank
endif
ifdef BuildENT
	ld a,Akuyou_ScreenBufferB
endif


	ld (LoadBankA_Plus1-1),a
	ld (LoadBankB_Plus1-1),a
	ld (LoadBankC_Plus1-1),a
	ld hl,&7F00
	ld (LoadBankDest2A_Plus2-2),hl
	ld (LoadBankDest2B_Plus2-2),hl
	ld hl,&4000
	ld (LoadBankDest3A_Plus2-2),hl
	ld (LoadBankDest3B_Plus2-2),hl
	ld (LoadBankDest3C_Plus2-2),hl
Level64k:
endif
	call Akuyou_Firmware_Restore

	;Load up the extra data - over the Bootstrap
if BuildCPCv+BuildEntv
ifdef BuildCPC
	ld a,Akuyou_LevelStart_Bank	:LoadBankA_Plus1
endif
ifdef BuildENT
	ld a,Akuyou_ScreenBufferB	:LoadBankA_Plus1
endif


	ld hl,DiskMap_Intro
	ld c,DiskMap_Intro_Disk
	ld l,&C3
	ld de,&C000		:LoadBankDest3A_Plus2
	ld ix,&C000+&3F00 	:LoadBankDest2A_Plus2

	call Akuyou_LoadDiscSectorZ

endif
ifdef BuildZXS
	ld a,LevelData128kpos_C_Bank
	ld hl,DiskMap_Intro
	ld c,DiskMap_Intro_Disk
	ld l,&C3
	ld de,&C000
	call Akuyou_LoadDiscSector

endif

ifdef BuildMSX
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-1)
		and %00000101
		cp  %00000101
		jp nz,NoTurboR
		ld hl,Akuyou_EventStream_Process
		ld (DoubleStreamProcess_Plus2-2),hl
NoTurboR:
		ld a,5						;get TilePos for MSX2 tiles
		call Akuyou_VDP_CommandNum
		ld (MSX_MainTilepos_Plus2-2),hl

		push hl
		pop iy

		ld hl,DiskMap_Intro
		ld l,&C3

		ld c,DiskMap_Intro_Disk

		ld ix,&0000
		ld a,10
		call Akuyou_VDP_CommandNum
endif


	di

if BuildCPCv+BuildENTv
	call	ScreenFirmwareReset
endif	
	call Akuyou_Music_Restart


	ld hl,EventStreamArray
	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit

	call Akuyou_RasterColors_Init
	call	Clear4000


;	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"


if buildCPCv+buildENTv
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-5)
		ld hl,null
		cp 64
		jp nz,LevelInitUsingRasterFlip
		ld (DisablePaletteSwitcher_Plus2-2),hl
	LevelInitUsingRasterFlip:
		call RasterColorsSetPalette1
ifdef BuildCPC
		ld a,Akuyou_LevelStart_Bank
		call Akuyou_BankSwitch_C0_SetCurrent
endif
;		call Akuyou_RasterColors_Init	
	endif 
	call Akuyou_Interrupt_Init	;	call Akuyou_RasterColors_Init


	ld a,2
	call Akuyou_SpriteBank_Font

ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum
endif


ifdef buildZXS
	di
	ld hl,&F800
	ld de,&F800
	ld bc,&0800
	ld IXH,7
	ld IXL,Akuyou_LevelStart_Bank
	call Akuyou_Bankswapper_Copy
	ei

endif



ifdef buildZXS
	ld a,6
	ld hl,Akuyou_Music_Restart
	call Akuyou_Bankswapper_CallHL
else
	call Akuyou_Music_Restart
endif
	
	call Akuyou_ScreenBuffer_Reset
	call Akuyou_Interrupt_Init	;	call Akuyou_RasterColors_Init


LevelLoop:
	call null :ClearScreenPoint_Plus2 ;Clear4000

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

	ei;disable me

	call Akuyou_Timer_UpdateTimer
	halt
	call Akuyou_EventStream_Process
	call null :DoubleStreamProcess_Plus2
	halt

	call AkuYou_Player_ReadControls
		ld a,ixl
		and ixh
		or Keymap_AnyFire;%11110001
		cp 255
		jp nz,EndLevelFire

ifdef BuildCPC
	halt
endif

	call Akuyou_ObjectArray_Redraw

	call ShowBossText	:ShowBossTextCommand_Plus2

	ld a,(BossCharNum_Plus1-1)
	ld b,a
	ld a,255
	sub b
	srl a
	srl a
	srl a
	srl a
	ld b,a
PauseLoopB:

ifdef BuildCPC
	halt
CPCPlusSlowdown:	nop
		nop
endif

	djnz PauseLoopB

;	call Akuyou_ScreenBuffer_Flip

	ld a,0 :ShowTextUpdate_Plus1
	or a
	jp z,LevelLoop
	cp 1
	jp z,ShowText1
	cp 2
	jp z,ShowText2
	cp 3
	jp z,ShowText3
	cp 4
	jp z,ShowText4
	cp 5
	jp z,ShowText5
	cp 6
	jp z,ShowText6
	cp 7
	jp z,ShowText7
	cp 8
	jp z,ShowText8
	cp 9
	jp z,ShowText9
	cp 10
	jp z,ShowText10
	cp 11
	jp z,ShowText11
	cp 12
	jp z,ShowText12
	cp 13
	jp z,ShowText13
	cp 14
	jp z,ShowText14
	cp 15
	jp z,ShowText15
	cp 16
	jp z,ShowText16
	cp 17
	jp z,ShowText17
	cp 18
	jp z,ShowText18
	cp 19
	jp z,ShowText19
	cp 20
	jp z,ShowText20
	cp 21
	jp z,ShowText21
	cp 22
	jp z,ShowText22
	cp 255
	jp z,ShowText0
	jp LevelLoop


ifdef BuildZXS
SetSpectrumDisableText:
	push hl	
		ld hl,null
		ld (ShowBossTextCommand_Plus2-2),hl
	pop hl
	ret
endif



Keys_WaitForRelease:
	call AkuYou_Player_ReadControls
	ld b,10
Keys_WaitForRelease_More:
	ld a,(hl)
	inc hl
	cp 255
	jp c,Keys_WaitForRelease
	djnz Keys_WaitForRelease_More
ret
WaitForFire:
	call PauseASec


WaitForFire_Continue:
	push bc
		call AkuYou_Player_ReadControls
	pop bc
	ld a, ixl	; read the keymap
	or %11110001
	cp 255
	jp z,WaitForFire_Continue
ret


PauseASec:
	push bc
	ld b,250
	ld c,4
PauseASecB:
		push bc
			call AkuYou_Player_ReadControls
		pop bc
		
	djnz PauseASecB
	dec c
	ld a,c
	or a
	jp nz,PauseASecB

	pop bc
ret


PauseASecForFire:
	push bc
	ld b,250
	ld c,4
PauseASecForFireB:
		push bc
			call AkuYou_Player_ReadControls
		pop bc
		ld a, ixl	; read the keymap
		or %11110001
		cp 255
		jp nz,PauseASecForFireDone
	djnz PauseASecForFireB
	dec c
	ld a,c
	or a
	jp nz,PauseASecForFireB

PauseASecForFireDone
	pop bc
ret



Decapitateend:
		push hl
			ld a,&24
			ld hl,(charnikohimehead)
			call SetObjectmove
		pop hl
		ret
Decapitate:
		push hl
			ld a,4+128
			ld hl,(charnikohime)
			call SetObjectsprite
		pop hl
		ret

ClearObjects:
	push hl
		xor a
		ld hl,(charnikohime)
		ld (hl),a
		ld hl,(charnikohimehead)
		ld (hl),a
	pop hl
	ret
ShowText1Init:
		ld a,1
UpdateShowText:
		ld(ShowTextUpdate_Plus1-1),a
		ret
ShowText2Init:
		ld a,2
		jr UpdateShowText
ShowText3Init:
		ld a,3
		jr UpdateShowText
ShowText4Init:
		ld a,4
		jr UpdateShowText
ShowText5Init:
		ld a,5
		jr UpdateShowText
ShowText6Init:
		ld a,6
		jr UpdateShowText
ShowText7Init:
		ld a,7
		jr UpdateShowText
ShowText8Init:
		ld a,8
		jr UpdateShowText
ShowText9Init:
		ld a,9
		jr UpdateShowText
ShowText10Init:
		ld a,10
		jr UpdateShowText
ShowText11Init:
		ld a,11
		jr UpdateShowText
ShowText12Init:
		ld a,12
		jr UpdateShowText
ShowText13Init:
		ld a,13
		jr UpdateShowText
ShowText14Init:
		ld a,14
		jr UpdateShowText
ShowText15Init:
		ld a,15
		jr UpdateShowText
ShowText16Init:
		ld a,16
		jr UpdateShowText
ShowText17Init:
		ld a,17
		jr UpdateShowText
ShowText18Init:
		ld a,18
		jr UpdateShowText
ShowText19Init:
		ld a,19
		jr UpdateShowText
ShowText20Init:
		ld a,20
		jr UpdateShowText
ShowText21Init:
		ld a,21
		jr UpdateShowText
ShowText22Init:
		ld a,22
		jr UpdateShowText
ShowText0Init:
		ld a,255
		jr UpdateShowText
NoSpeech:
	ret

ShowText2:
;		ld hl,PaletteNikoHime
;		call PlusPaletteSet	

ifdef BuildMSX
		ld hl,PaletteTextRed
		call PlusPaletteSet
endif

ifdef BuildZXS
		ld a,1
		ld c,64+2
		call Akuyou_ZXSGPU_CommandNum
endif
		ld hl,Subtitles2
		ld a,23
		jp ResetText
ShowText3:

ifdef BuildMSX
		ld hl,PaletteTextGrey
		call PlusPaletteSet
endif
if BuildCPCv+BuildEntv
		ld hl,WhenYouDie
		call PlusPaletteSet
endif
ifdef BuildZXS
		ld a,1
		ld c,7
		call Akuyou_ZXSGPU_CommandNum
endif
		ld hl,Subtitles3
		ld a,12
		jp ResetText
		

ShowText4:
ifdef BuildMSX
		ld hl,PaletteTextCyan
		call PlusPaletteSet
endif
ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum
endif
if BuildCPCv+BuildEntv
		ld hl,IfYoureGood
		call PlusPaletteSet
endif
		ld hl,Subtitles4
		ld a,12
		jp ResetText

ShowText5:
ifdef BuildMSX
		ld hl,PaletteTextRed
		call PlusPaletteSet
endif
ifdef BuildZXS
		ld a,1
		ld c,64+2
		call Akuyou_ZXSGPU_CommandNum
endif
if BuildCPCv+BuildEntv
		ld hl,IfYoureBad
		call PlusPaletteSet
endif
		ld hl,Subtitles5
		ld a,12
		jp ResetText

ShowText6:
ifdef BuildMSX
		ld hl,PaletteTextPurple
		call PlusPaletteSet
endif
ifdef BuildZXS
		ld a,1
		ld c,0+3
		call Akuyou_ZXSGPU_CommandNum
endif
if BuildCPCv+BuildEntv
		ld hl,OtherOption
		call PlusPaletteSet
endif
		ld hl,Subtitles6
		ld a,12
		jp ResetText
ShowText7:

ifdef BuildMSX
		ld hl,PaletteDestDefault
		call PlusPaletteSet
endif
if BuildCPCv+BuildEntv
		ld hl,PhotoChibiko1
		call PlusPaletteSet
endif
ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum
endif

		ld hl,&8000+0 ;chibiko
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles7
		ld a,18
		jp ResetText
ShowText8:
if BuildCPCv+BuildEntv
		ld hl,AnimalsPalette
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+1 ;fishing
endif
ifdef BuildZXS
		ld hl,&8000+6 ;fishing
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+3 ;fishing
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles8
		ld a,18
		jp ResetText

ShowText9:	;Camping
if BuildCPCv+BuildEntv
		ld hl,CampingPalette
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+2 
endif
ifdef BuildZXS
		ld hl,&8000+12
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+6 
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles9
		ld a,18
		jp ResetText

ShowText10:	;prank
if BuildCPCv+BuildEntv
		ld hl,PrankPalette
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+3
endif
ifdef BuildZXS
		ld hl,&8000+18
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+9
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles10
		ld a,18
		jp ResetText


ShowText11:	;school1
if BuildCPCv+BuildEntv
		ld hl,SchoolPalette
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+4
endif
ifdef BuildZXS
		ld hl,&8000+24
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+12
endif
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles11
		ld a,18
		jp ResetText


ShowText12:	;Bulbs
if BuildCPCv+BuildEntv
		ld hl,BigPortableLights
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+5
endif
ifdef BuildZXS
		ld hl,&8000+30
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+15
endif
		ld (CompiledSprite_Plus2-2),hl		

		ld hl,Subtitles12
		ld a,18
		jp ResetText




ShowText13:	;Plane
if BuildCPCv+BuildEntv
		ld hl,PlanePalette
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+6
endif
ifdef BuildZXS
		ld hl,&8000+36
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+18
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles13
		ld a,18
		jp ResetText



ShowText14:	;school1
if BuildCPCv+BuildEntv
		ld hl,CampingPalette
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+7
endif
ifdef BuildZXS
		ld hl,&8000+42
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+21
endif
		ld (CompiledSprite_Plus2-2),hl
		;ld hl,&8000+15 ;school2
		;ld (CompiledSpriteB_Plus2-2),hl

		ld hl,Subtitles14
		ld a,18
		jp ResetText


ShowText15:	;Lightning1
		call LoadScreens2
if BuildCPCv+BuildEntv
		ld hl,LightningPlus1
		call PlusPaletteSet
endif
		ld hl,&8000 ; lightning1
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles15
		ld a,18
		jp ResetText



ShowText16:	;Lightning 2
if BuildCPCv+BuildEntv
		ld hl,LightningPlus2
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+1
endif
ifdef BuildZXS
		ld hl,&8000+6
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+3
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles16
		ld a,18
		jp ResetText



ShowText17:	;Heaven
ifdef BuildZXS
		ld a,1
		ld c,64+7
		call Akuyou_ZXSGPU_CommandNum
endif
if BuildCPCv+BuildEntv
		ld hl,HeavenPlus
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+2
endif
ifdef BuildZXS
		ld hl,&8000+12
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+6
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles17
		ld a,18
		jp ResetText



ShowText18:	;Hell
ifdef BuildZXS
		ld a,1
		ld c,64+2
		call Akuyou_ZXSGPU_CommandNum
endif
if BuildCPCv+BuildEntv
		ld hl,HellPlus
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+3
endif
ifdef BuildZXS
		ld hl,&8000+18
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+9
endif
		ld (CompiledSprite_Plus2-2),hl
		ld hl,Subtitles18
		ld a,18
		jp ResetText



ShowText19:	;Photo1
ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum
endif
if BuildCPCv+BuildEntv
		ld hl,PhotoChibiko1
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+4
endif
ifdef BuildZXS
		ld hl,&8000+24
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+12
endif
		ld (CompiledSprite_Plus2-2),hl
		;ld hl,&8000+15 ; photo1
		;ld (CompiledSpriteB_Plus2-2),hl

		ld hl,Subtitles19
		ld a,16
		jp ResetText



ShowText20:	;Photo2
if BuildCPCv+BuildEntv
		ld hl,PhotoChibiko2
		call PlusPaletteSet
endif
ifdef BuildMSX
		ld hl,&8000+5
endif
ifdef BuildZXS
		ld hl,&8000+30
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+15
endif
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles20
		ld a,16
		jp ResetText


ShowText21:		;Haunting
if BuildCPCv+BuildEntv
		ld hl,HauntingPlus
		call PlusPaletteSet
endif

ifdef BuildMSX
		ld hl,&8000+6
endif
ifdef BuildZXS
		ld hl,&8000+36
endif
if BuildCPCv+BuildENTv
		ld hl,&8000+18
endif
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles21
		ld a,16
		jp ResetText
ShowText22:
		ld hl,Subtitles22
		ld a,16
		jp ResetText







LoadScreens2:


	call clear4000
	di

	call Akuyou_Firmware_Restore
ifdef BuildCPC
;	call Akuyou_RasterColors_Disable
	di
;	ld a,4
;	call Akuyou_CPCGPU_CommandNum
Endif


;	call Akuyou_ScreenBuffer_Reset	

ifdef BuildZXS
	ld a,LevelData128kpos_D_Bank
	ld hl,DiskMap_Intro
	ld c,DiskMap_Intro_Disk
	ld l,&C4
	ld de,&C000
	call Akuyou_LoadDiscSector
	call Akuyou_RasterColors_Init
endif

if BuildCPCv+BuildENTv



	ld a,Akuyou_ScreenBufferA		:LoadBankB_Plus1
	ld ix,&C000+&3F00	:LoadBankDest2B_Plus2
	ld hl,DiskMap_Intro
	ld l,&C4
	ld c,DiskMap_Intro_Disk
	ld de,&C000		:LoadBankDest3B_Plus2

	call Akuyou_LoadDiscSectorZ
	call ScreenFirmwareReset
	call Akuyou_RasterColors_Init
	ld a,1			;Turn on Plus raster switch
	ifdef BuildCPC
		call Akuyou_CPCGPU_CommandNum
	endif
	ifdef BuildENT
		call Akuyou_ENTGPU_CommandNum
	endif
endif

ifdef BuildMSX
		call Akuyou_Music_Stop
		ld IY,(MSX_MainTilepos_Plus2-2)

		ld hl,DiskMap_Intro
		ld l,&C4

		ld c,DiskMap_Intro_Disk
		ld ix,&0000
		ld a,10
		call Akuyou_VDP_CommandNum
		call Akuyou_RasterColors_Init

endif

ret


ShowText0:

		ld hl,SubtitlesEmpty
		ld a,10
		jr ResetText

ShowText1:
		ld hl,Subtitles1
ifdef CPC320
		ld a,&5
else
	ifdef BuildZXS
		ld a,&3
	else
		ld a,&4
	endif

endif
		jr ResetText

VDP_MyHMMM:
VDP_MyHMMM_SX:	defw &0000 ;SY 32,33
VDP_MyHMMM_SY:	defw &0000 ;SY 34,35
VDP_MyHMMM_DX:	defw &0040 ;DX 36,37
VDP_MyHMMM_DY:	defw &0000 ;DY 38,39
VDP_MyHMMM_NX:	defw &0080 ;NX 40,41 
VDP_MyHMMM_NY:	defw &0060 ;NY 42,43
		defb 0     ;Color 44 - unused
VDP_MyHMMM_MV:	defb 0     ;Move 45
		defb %11010000 ;Command 46	


ResetText:
		ld(OnscreenTextPointer_Plus2-2),hl	
		ld (OnscreenTextPos_Plus1-1),a
		ld a,1
		ld (BossCharNum_Plus1-1),a
		ld a,0
		ld(ShowTextUpdate_Plus1-1),a
		ld a,15
		ld (OnscreenTimer_Plus1-1),a
		call Clear4000

		;ld a,&C0
		;di
		;call Akuyou_BankSwitch_C0
		ld ixh,0
ifdef BuildCPC
		call Akuyou_RasterColors_Blackout
endif
if buildCPCv+buildENTv

		call null	:CompiledSprite_Plus2

endif
ifdef BuildZXS


		ld hl,&0000	:CompiledSprite_Plus2
		ld a,h	
		or a
		jp z,NoBackPic

		ld de,&4000
		add hl,de
		ex hl,de

		ld hl,Akuyou_Rle_FromPointers		
		ld a,LevelData128kpos_C_Bank	:CompiledSpriteMempos_Plus1
		call Akuyou_Bankswapper_CallHL



endif
ifdef BuildMSX
		ld hl,&0000	:CompiledSprite_Plus2
		ld a,h
		or a
		jr z,NoBackPic
		ld de,&0000
		ld a,l

		and %00000001
		jr z,FarLeft
		ld e,&80
FarLeft:
		ld (VDP_MyHMMM_SX),de
		ld a,l

		srl a
		ld hl,&0000 :MSX_MainTilepos_Plus2
		ld de,96
		or a
		jr z,DrawBack
FindPosRepeat:
		add hl,de
		dec a
		jr nz,FindPosRepeat
DrawBack:
		ld (VDP_MyHMMM_Sy),hl
		ld hl,VDP_MyHMMM
		ld a,7
		call Akuyou_VDP_CommandNum


endif
NoBackPic:
if buildCPCv+buildENTv
		ld a,ixh
		cp 0
		call nz,RLE_Draw
endif
		jp levelloop
	

SubtitlesEmpty: 
if BuildLang =''
	db  4,"    "," "+&80
	db  4,"    "," "+&80
else
	db  4,"    ",255
	db  4,"    ",255
endif
db &0

Subtitles1: 
ifdef CPC320
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  8,"Once Upon a time..","."+&80
	db  5,"In a land far far away..","."+&80
	db  3,"There was a girl who was kind"," "+&80
	db  1,"to everyone and brought happines","s"+&80
	db  4,"everywhere She went ",chrHeart," ",chrHeart," ",chrHeart," "+&80
	db &0
else
if BuildLang =''
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  8,"Once Upon a time..","."+&80
	db  5,"In a land far far away..","."+&80
	db  4,"There was a girl who was kind"," "+&80
	db  8,"to everyone and brought"," "+&80
	db  9,"happiness everywhere"," "+&80
	db  11,"She went ",chrHeart," ",chrHeart," ",chrHeart," "+&80
endif
if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  15,146,119,125," ",146,119,125,".",".",".",255
	db  16,114,154,133,123,156,135,101,255
	db  14,145,158,134,119,159," ",135,123,135,123,126,154,255
	db  13,123,123,156,119,159," ",149,124,125,115," ",123,119,159,255
	db  17,115,144,125,129,"!",255
endif
	db &0
endif

Subtitles2: 

if BuildLang =''
	db  7,"She isn't in this game!!","!"+&80 
endif
if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  10,123,138," ",122,159,113,146,135," ",128,158,134,123,139," ",115,144,127,158,"!",255
endif
db &0


Subtitles3: 
if BuildLang =''
	db  7,"Do you know what happen","s"+&80
	db 7,"       when you die?","?"+&80
endif
if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 9,125,158,129,159,114,133," ",133,159,116,134,154,119," ",125,112,132,115,144,126,119,"?",255
endif
db &0

Subtitles4: 
ifdef CPC320
db  8,"They say 'if you're goo","d"+&80
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db  3,"You go to a place of wonder wher","e"+&80
db  5,"all your dreams will come true'","'"+&80
else
	if BuildLang =''
		db  5,"They say 'if you're good, yo","u"+&80
		db  6,"go to a place of wonder wher","e"+&80
		db  5,"all your dreams will come true'","'"+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  10,099,115,115,123,135," ",125,129,152,101,132,158,123,159,121,135," ",115,121,255
	db  10,114,134,129,138," ",150,147,119,159," ",127,159,158,141,159," ",119,134,116,100,255
	db  14,133,115,116," ",140,133,119,159," ",115,154,255
	endif
endif
db &0


Subtitles5: 
ifdef CPC320
db  4,"But 'If you're bad, you'll go t","o"+&80
db  4,"the OTHER PLACE Where you'll b","e"+&80
db  1,"punished for the bad things you did!!","'"+&80
else
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  4,"But 'If you're bad, you'll go"," "+&80
	db  4,"to the OTHER PLACE Where you'll"," "+&80
	db  5,"be punished for the bad things"," "+&80
	db  16,"you did!!"," "+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  12,128,125,132," ",099,157,154,115,123,132,159," ",115,129,152,255
	db  5,125,159,123,159,121,135," ",118,130,154,101,157,154,115,123,133,138," ",139,159,131,103," ",116,122,132,148,152,116,"!",100,255

	endif
endif
db &0

Subtitles6: 
ifdef CPC320
db  3,"But what no-one tells you is tha","t"+&80
db  2,"some people are SO bad, they don't"," "+&80
db  12,"go there either.","."+&80
else
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  6,"But what no-one tells you i","s"+&80
	db  6,"that some people are SO bad,"," "+&80
	db  6,"they don't go there either.","."+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
		db  11,132,159,148," ",129,159,155,148," ",115,157,134,115,138,139,255
		db  10,125,159,123,159,121,135,148," ",115,119,134,115,123,148," ",115,154,255
	endif
endif
db &0


Subtitles7: 
ifdef CPC320
	db  2,"Chibiko was a typical cheerful girl.","."+&80
else
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  10,"Chibiko was a typical"," "+&80
	db  13,"cheerful girl.","."+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 11,130,140,159,123,139," ",141,131,116,138," ",122,159,158,120,134," ",123,255
	endif
endif
db &0

Subtitles8: 
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  10,"She loved animals,","!"+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  14,133,159,116,141,159,131,119,159," ",126,120,255
	endif
db &0

Subtitles9: 

ifdef CPC320
db  2,"And enjoyed spending time outdoors!","!"+&80
else
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
		db  7,"And enjoyed spending time"," "+&80
		db  14,"outdoors!","!"+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
 	db  12,128,133,132,159," ",114,128,141,159,138,119,159," ",126,120,101,255
	endif
endif
db &0

Subtitles10: 
ifdef CPC320
db  3,"Sometimes she was 'a bit' naughty","."+&80
else
	if BuildLang =''
	db  8,"Sometimes she was 'a bit'"," "+&80
	db  15,"naughty","."+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 8,133,120,133,159,120," ",130,111,112,133," ",157,154,115,123,133,103," ",126,154,122,133,159,255
	endif
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
endif
db &0

Subtitles11: 
ifdef CPC320
db  1," And she didn't really like to study","."+&80
else
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  7,"And she didn't really like"," "+&80
	db  14,"to study","."+&80
	endif
	if BuildLang ='j'
	db 14,142,159,158,120,111,116,148," ",135,119,159,132,255
	endif
endif
db &0

Subtitles12: 

ifdef CPC320
	db 1, "But one time she was very, very bad","."+&80
else
	if BuildLang =''
	db 7, "But one time she was very",","+&80
	db 15, "very bad","."+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 7,132,159,148,101,115,130,133,159," ",126,123,159,113,121," ",157,154,115,123,133," ",125,130,109,112,129,"!",255
	endif
endif
db &0

Subtitles13: 
	if BuildLang =''
	db  6,"And took a 'prank' too far","."+&80
	endif
	if BuildLang ='j'
	db  9,115,129,126,159,152,132,159," ",130,111,116,125,135," ",138,112,132," ",125,144,112,129,"!",255
	endif
db &0

Subtitles14: 
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
ifdef CPC320
	db  2,"When someone does the unforgivable..","."+&80
else
	if BuildLang =''
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  9,"When someone does the"," "+&80
	db  12,"unforgivable..","."+&80
	endif
	if BuildLang ='j'
	db 14,150,154,127,134,115,123,133,103," ",125,129,152,255
	endif
endif
db &0

Subtitles15: 
	if BuildLang =''
		db  7,"Judgement comes from above!","."+&80
	endif
	if BuildLang ='j'
	db 14,129,119,115,133,123,156,119,152,".",".",".",255
	endif
db &0

Subtitles16: 
ifdef CPC320
db  2,"and strikes them once and for all!","."+&80
else
	if BuildLang =''
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  5,"and strikes them once and for"," "+&80
	db  17,"all!","."+&80
	endif
	if BuildLang ='j'
	db 14,132,158,139,159,131,103," ",114,129,117,144,126,255
	endif
endif
db &0
Subtitles17: 
ifdef CPC320
db  2,"Really bad people don't go to heaven","."+&80
else
	if BuildLang =''
	db  5,"Really bad people don't go to"," "+&80
	db  14,"heaven","."+&80
	endif
	if BuildLang ='j'
	db 6,123,123,156,138," ",118,121,119,159," ",157,154,115,123,139," ",132,158,123,159,121,135," ",115,122,134,115,255
	endif
endif
db &0
Subtitles18: 
ifdef CPC320
db  1,"and even hell has its limit to wh","o"+&80
db  12,"they'll take!!","."+&80
else
	if BuildLang =''
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  5,"and even hell has its limit t","o"+&80
	db  10,"who they'll take!!","."+&80
	endif
	if BuildLang ='j'
	db 7,128,125,132," ",125,159,123,159,121,135,148," ",135,110,116,123,121,120,128,121,119,159," ",114,154,"!",255
	endif
endif
db &0
Subtitles19: 
ifdef CPC320
db  2,"You see, when people die,if they've"," "+&80
db  4,"been 'Really Bad', they dont g","o"+&80
db  10,"'up' or 'down'","'"+&80
else
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  6,"You see, when people die,if"," "+&80
	db  7,"they've been 'Really Bad',"," "+&80
	db  6,"they dont go 'up' or 'down'"," "+&80
	endif
	if BuildLang ='j'
	db 11,129,159,119,152,101,115,130,139,159,158," ",124,115,132,115,134," ",123,139,255
	db 8,132,158,123,159,121,135,148," ",125,159,123,121,135,148," ",115,122,144,127,158,".",".",".",255
	endif
endif
db &0
Subtitles20: 
ifdef CPC320
db  2,"They stay where they were as undea","d"+&80
db  6,"monsters, hated by God, an","d"+&80
db  9,"feared by all mankind","!"+&80
db  1,"with an endless thirst for human blood","!"+&80
else
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
	db  6,"They stay where they were as"," "+&80
	db  6,"undead monsters, hated by God,"," "+&80
	db  7,"and feared by all mankind","!"+&80
	db  6,"with an endless thirst for"," "+&80
	db  13,"human blood!"," "+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  7,133,159,123,148," ",115,119,126,159,101,119,145,124,144,132,159,148," ",145,138,119,159,125,129,101,255
	db  5,115,120,129," ",122,131,117,120,103," ",138,145,129,115," ",118,157,152,134,115," ",119,131,143,159,116,103," ",148,130,255
	db  6,115,122,154," ",125,119,139,159,137," ",133,125,132,101,135,158,122,159,158,138," ",132,158,132,120,132,159,255
	endif
endif
db &0
Subtitles21: 
Subtitles22:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
ifdef CPC320
db  2,"They live out eternity as Nosferatu",","+&80
db  1,"Vampires, cursed to live by feeding o","n"+&80
db  2,"their former friends and companions!","!"+&80
else
	if BuildLang =''
	db  7,"They live out eternity as"," "+&80
	db  5,"Nosferatu... Vampires, cursed"," "+&80
	db  6,"to live by feeding on their"," "+&80
	db  4,"former friends and companions!","!"+&80
	endif
	if BuildLang ='j'
	db 8,120,110,116,122,131,120," ",133,125,132," ",117,115,117,158,103," ",115,120,131,131,159,122,154,255
	db 6,130,103," ",138,158,132,159," ",116,159,104,158,139,160,115,114," ",133,125,132," ",128,158,124,159,115,126,154,255
	db 5,144,117,138," ",133,148,129,159,130,149," ",134,119,144,103," ",117,125,159,120,135,126,154," ",139,159,122,148,138,"!",255

endif
db &0

Subtitles0: 
	if BuildLang =''
		db  10," "," "+&80
	else
		db  10," "," ",255
	endif
db &0
ShowBossText:
	ld a,15 :OnscreenTimer_Plus1
	cp 10
	ret c
	ld bc,SubtitlesEmpty :OnscreenTextPointer_Plus2
ShowBossText_StartText:
	;ld hl,&C000
	;call Akuyou_ShowSprite_SetBankAddr
	push hl
	push bc
		ld a,2
		call Akuyou_SpriteBank_Font
	pop bc
	pop hl

	ld l,&14 :OnscreenTextPos_Plus1
	ld a,1:BossCharNum_Plus1
	ldia	; show up to 255 chars
	
ShowBossText_MoreText:
	ei
	halt

	ld a,(bc)

	or a
	jp z,ShowBossText_AllOnscreen ; See if we have reached the end of the string

	ld h,a
	inc bc

	push hl
		call Akuyou_DrawText_LocateSprite

		call Akuyou_DrawText_PrintString
	pop hl
	;inc l
	;inc l
	inc l
	ldai
	dec a
	inc bc
	jp nz,ShowBossText_MoreText

	ld a,(bc)
	or a
	jp z,ShowBossText_AllOnscreen ; See if we have reached the end of the string
	ld a,(BossCharNum_Plus1-1)
	inc a
	nop
	nop :ShowTextSpeedup_Plus1
ShowBossTextNoSpeedup:
	ld (BossCharNum_Plus1-1),a

ret
ShowBossText_AllOnscreen:
	jp NoSpeech

	;ld a,(OnscreenTimer_Plus1-1)
	;dec a
	;ld (OnscreenTimer_Plus1-1),a

	;cp 10
	;ret nz
	;ld a,0;9; only one page of text
	;ld (OnscreenTimer_Plus1-1),a
;	ld a,BossText2End-BossText2-20
	;ld a,1
	;ld (BossCharNum_Plus1-1),a

ret

DoClear4000:
	push hl
	ld hl,Clear4000
	ld (ClearScreenPoint_Plus2-2),hl
	pop hl
ret



;Clear Screen
Clear4000:

	push hl
	push bc
	push de
		ld hl,null;Clear4000
		ld (ClearScreenPoint_Plus2-2),hl

ifdef BuildMSX
		call Akuyou_CLS
;		ld a,1
;		ld hl,VDP_MyHMMV
;		call Akuyou_VDP_CommandNum	;VDP_HMMV_BusyCheck
endif 
if BuildCPCv+BuildEntv

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
		ld l,0	

ifdef BuildCPC
		ld de,&4000
		add hl,de
		ld b,0 ;256 tiumes
		ld de,&0000
endif
ifdef BuildENT
		ld de,&3F00
		add hl,de
		ld b,250
		ld de,&0000
endif
		call SpFill
endif
ifdef BuildZXS
		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
		ld l,0	
		ld de,&1B00
		add hl,de
		ld b,108
		ld de,&0000

		call SpFill
endif

	pop de
	pop bc
	pop hl
ret
	;ld a,0
	;call Akuyou_BankSwitch_128k
	;call OutroScreen1 CompiledScreen_Plus2;call CompiledScreen1
	;jp Akuyou_BankSwitch_128k_Reset




SpFill:
ld (SpRestoreFill_Plus2-2),sp

SpFillContinue:
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
ld sp,&0000:SpRestoreFill_Plus2
ei
di
djnz SpFillContinue
ei
ret





















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Level specific code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;Allow objects to be reprogrammed
read "Core_ObjectReprogrammers.asm"

;Warp the bullet array (for boss battles)
;read "Core_StarArrayWarp.asm"


ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	


ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
endif

if buildCPCv+buildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
;	read "CoreBackground_SolidFill.asm"
;	read "CoreBackground_QuadSprite.asm"
;	read "CoreBackground_QuadSpriteColumn.asm"
;	read "CoreBackground_bitshifter.asm"
;	read "CoreBackground_bitshifterDouble.asm"
;	read "CoreBackground_GetSpriteMemPos.asm"
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


		;ifdef buildCPC
		;	call Akuyou_Timer_GetTimer
		;	ld (BitshifterTicksOccured_Plus1-1),a
		;endif

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
;		jp BackgroundSolidFill
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
	defb 20
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 40
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 60
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 80
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 110
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 150
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 175
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	defb 200
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
defw &0000;0  -GRB
	     ;0GRB


PaletteDest:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0468;1  -GRB
defw &06FF;2  -GRB
defw &0DFF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0468;1  -GRB
defw &06FF;2  -GRB
defw &0DFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0468;1  -GRB
defw &06FF;2  -GRB
defw &0DFF;3  -GRB
	defb 80
defw &0000;0  -GRB
defw &0468;1  -GRB
defw &06FF;2  -GRB
defw &0DFF;3  -GRB
	defb 110
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	     ;0GRB

DoPaletteChibikoAttacks2:
	push iy
	push ix
	push bc
	push de
	push hl

		ld hl,PaletteChibikoAttacks2
		jr DoPlusPalSetInStream
DoPaletteChibikoAttacks:
	push iy
	push ix
	push bc
	push de
	push hl

		ld hl,PaletteChibikoAttacks
		jr DoPlusPalSetInStream
DoPlusPalSetInStream:
		call PlusPaletteSet
	pop hl
	pop de
	pop bc
	pop ix
	pop iy
ret

PaletteChibikoAttacks:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 80
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 110
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0BE6;1  -GRB
defw &0D27;2  -GRB
defw &0DFF;3  -GRB
	     ;0GRB


PaletteChibikoAttacks2:	;The 'Normal' level palette
	     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 80
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 110
defw &0000;0  -GRB
defw &00C3;2  -GRB;defw &0D27;2  -GRB
defw &0D27;2  -GRB
defw &0888;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &00C3;2  -GRB;defw &0D27;2  -GRB
defw &0D27;2  -GRB
defw &0888;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &00C3;2  -GRB;defw &0D27;2  -GRB
defw &0D27;2  -GRB
defw &0888;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	     ;0GRB

WhenYouDie:	
	     ;0GRB
	defb 25
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 125
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &024A;1  -GRB
defw &077B;2  -GRB
defw &0DDE;3  -GRB
	     ;0GRB

IfYoureGood:	
	     ;0GRB
	defb 25
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 125
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &071E;1  -GRB
defw &0D0F;2  -GRB
defw &0FAF;3  -GRB

IfYoureBad:	
	     ;0GRB
	defb 25
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 125
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0090;1  -GRB
defw &00F0;2  -GRB
defw &08F8;3  -GRB

OtherOption:	
	     ;0GRB
	defb 25
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 125
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &008F;2  -GRB
defw &05BF;3  -GRB




PhotoChibiko2:	
	     ;0GRB
	defb 25
defw &0000;0  -GRB
defw &0099;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 30
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 55
defw &0000;0  -GRB
defw &0077;1  -GRB
defw &00F0;2  -GRB
defw &0EEE;3  -GRB
	defb 80
defw &0000;0  -GRB
defw &0066;1  -GRB
defw &077E;2  -GRB
defw &0DDD;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0055;1  -GRB
defw &088F;2  -GRB
defw &0CCC;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB

PhotoChibiko1:	
	     ;0GRB
	defb 25
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0DFF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0DFF;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0DFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0DFF;3  -GRB
	defb 125
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0DFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB



HauntingPlus:	
	     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0C8F;2  -GRB
defw &0FFF;3  -GRB
	defb 45
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0C8F;2  -GRB
defw &0FFF;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &00D0;1  -GRB
defw &0B7F;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &00D0;1  -GRB
defw &0A6F;2  -GRB
defw &0FFF;3  -GRB
	defb 125
defw &0000;0  -GRB
defw &00D0;1  -GRB
defw &0A6F;2  -GRB
defw &0FFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB

AnimalsPalette:	
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &000F;1  -GRB
defw &0F0F;2  -GRB
defw &0FFF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &000F;1  -GRB
defw &0F0F;2  -GRB
defw &0FFF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &000F;1  -GRB
defw &0F0F;2  -GRB
defw &0FFF;3  -GRB
	defb 78
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0F0F;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0800;1  -GRB
defw &0F0F;2  -GRB
defw &0FFF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB


HellPlus:
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0084;1  -GRB
defw &00D3;2  -GRB
defw &08F0;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0084;1  -GRB
defw &00D3;2  -GRB
defw &08F0;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0084;1  -GRB
defw &00D3;2  -GRB
defw &08F0;3  -GRB
	defb 82
defw &0000;0  -GRB
defw &0084;1  -GRB
defw &00D3;2  -GRB
defw &08F0;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0084;1  -GRB
defw &00D3;2  -GRB
defw &08F0;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB


HeavenPlus:
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0A0C;1  -GRB
defw &0F0F;2  -GRB
defw &0FDF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0A0C;1  -GRB
defw &0F0F;2  -GRB
defw &0FDF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0A0C;1  -GRB
defw &0F0F;2  -GRB
defw &0FDF;3  -GRB
	defb 82
defw &0000;0  -GRB
defw &0A0C;1  -GRB
defw &0F0F;2  -GRB
defw &0FDF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0A0C;1  -GRB
defw &0F0F;2  -GRB
defw &0FDF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB

LightningPlus1:
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0666;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0666;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 82
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0800;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB


LightningPlus2:
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0CCB;1  -GRB
defw &0FF0;2  -GRB
defw &0CDF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0CCB;1  -GRB
defw &0FF0;2  -GRB
defw &0FFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0FF0;2  -GRB
defw &0FFF;3  -GRB
	defb 82
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0FF0;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0800;1  -GRB
defw &0FF0;2  -GRB
defw &0CDF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB


Lightning2:
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0666;1  -GRB
defw &0FF0;2  -GRB
defw &0CDF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0666;1  -GRB
defw &0FF0;2  -GRB
defw &0FFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0FF0;2  -GRB
defw &0FFF;3  -GRB
	defb 85
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0FF0;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0800;1  -GRB
defw &0804;1  -GRB
defw &0CDF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB



BigPortableLights: ;borrowed from batman
     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0666;1  -GRB
defw &068F;2  -GRB
defw &0CDF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 55
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 68
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0800;1  -GRB
defw &0804;1  -GRB
defw &0CDF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB

SchoolPalette:	
	     ;0GRB
	defb 20

defw &0000;0  -GRB
defw &023C;1  -GRB
defw &068F;2  -GRB
defw &0CDF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &023C;1  -GRB
defw &068F;2  -GRB
defw &0CDF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &023C;1  -GRB
defw &068F;2  -GRB
defw &0CDF;3  -GRB
	defb 78
defw &0000;0  -GRB
defw &023C;1  -GRB
defw &068F;2  -GRB
defw &0CDF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &023C;1  -GRB
defw &068F;2  -GRB
defw &0CDF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB



PlanePalette:	
	     ;0GRB
	defb 20

defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &0F00;2  -GRB
defw &0FFF;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &0F00;2  -GRB
defw &0FFF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &0F00;2  -GRB
defw &0FFF;3  -GRB
	defb 78
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &0F00;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &0F00;2  -GRB
defw &0FFF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB



CampingPalette:	
	     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &09F0;2  -GRB
defw &0FFB;3  -GRB
	defb 40
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &09F0;2  -GRB
defw &0FFB;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &09F0;2  -GRB
defw &0FFB;3  -GRB
	defb 78
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &09F0;2  -GRB
defw &0FFB;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &00F0;1  -GRB
defw &09F0;2  -GRB
defw &0FFB;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB


PrankPalette:	
       ;0GRB
	defb 10
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 32
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 60
defw &0000;0  -GRB
defw &0F06;2  -GRB
defw &098F;1  -GRB

defw &0FFF;3  -GRB
	defb 78
defw &0000;0  -GRB
defw &0F06;2  -GRB
defw &098F;1  -GRB

defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0F06;2  -GRB
defw &098F;1  -GRB

defw &0FFF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 160
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &088F;2  -GRB
defw &0FFF;3  -GRB

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

PaletteTextGrey:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0CCC;4  -GRB
defw &0666;5  -GRB
defw &0999;6  -GRB
defw &00F0;7  -GRB
defw &0E06;8  -GRB
defw &07FC;9  -GRB
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB

PaletteTextPurple:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &02FF;4  -GRB
defw &0066;5  -GRB
defw &00BF;6  -GRB
defw &00F0;7  -GRB
defw &0E06;8  -GRB
defw &07FC;9  -GRB
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB



PaletteTextCyan:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0FFF;4  -GRB
defw &088F;5  -GRB
defw &0F0F;6  -GRB
defw &00F0;7  -GRB
defw &0E06;8  -GRB
defw &07FC;9  -GRB
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB


PaletteTextRed:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &09FA;4  -GRB
defw &0080;5  -GRB
defw &00F0;6  -GRB
defw &00F0;7  -GRB
defw &0E06;8  -GRB
defw &07FC;9  -GRB
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB


PaletteDestDefault:						;Normal level palette
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
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB

PaletteDest:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0FFF;4  -GRB
defw &0088;5  -GRB
defw &04FF;6  -GRB
defw &00F0;7  -GRB
defw &0E06;8  -GRB
defw &07FC;9  -GRB
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB


DoPaletteDefault:
	push bc
	push de
	push hl

		ld hl,PaletteDestDefault
		jr DoPlusPalSetInStream
DoPlusPalSetInStream:
		call PlusPaletteSet
	pop hl
	pop de
	pop bc
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			ZX Spectrum Level specific functions for background (These are copied

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef BuildCPC
read "..\SrcCPC\Akuyou_CPC_RLE.asm"
endif
ifdef BuildENT
read "..\SrcENT\Akuyou_ENT_RLE.asm"
endif
ifdef BuildZXS
;	read "CoreBackground_bitshifterDouble.asm"
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
			cp 250
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
	save "..\ResCPC\T56-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif


