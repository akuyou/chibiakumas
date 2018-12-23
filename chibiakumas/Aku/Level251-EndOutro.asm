sc;Level fixes
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

ifdef CPC320
	ChibikoY equ &14
	NecroY equ &10-3

else

	ChibikoY equ &12
	NecroY equ &10-4
endif



read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

;LevelDataStart equ &0000 	;Start of the data which is stored on disk

ZXS_CopiedBlockStart equ &F800
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Start writing to disk for ZXS and MSX (Cpc ver is at EOF)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildENT
	write "..\bldENT\T50-SC1.D02"
endif
ifdef buildZXS
	write "..\BldZX\Level251.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T50-SC1.D02"
	else
		write "..\ResMSXj\T50-SC1.D02"
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
			incbin "..\ResCPC\Speech.spr"
	endif
	ifdef buildZXS
		incbin "..\ResZX\Speech-ZX.SPR"
	endif
	ifdef buildMSX
			incbin "..\ResMSX\SpeechA.MAP"
			defs 32*10 ;32 dummy sprites - for hit targets etc!
	endif




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Animators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AnimatorPointers:
Event_SavedSettingsB:	;2nd bank Saved settings array
CustomRam:




if buildCPCv+buildENTv
	Compiledsprites:
	read "..\AkuCPC\Level251_Screens.asm"
	OutroScreen1 equ Compiledsprites
	OutroScreen2 equ Compiledsprites+3
	OutroScreen3 equ Compiledsprites+6
	OutroScreen4 equ Compiledsprites+9
	OutroScreen5 equ Compiledsprites+12
endif
ifdef BuildZXS
	Compiledsprites:
	read "..\AkuZX\Level251_Screens.asm"
	OutroScreen1 equ Compiledsprites
	OutroScreen2 equ Compiledsprites+6
	OutroScreen3 equ Compiledsprites+12
	OutroScreen4 equ Compiledsprites+18
	OutroScreen5 equ Compiledsprites+24
endif
ifdef BuildMSX
	Compiledsprites equ &8000
	OutroScreen1 equ Compiledsprites
	OutroScreen2 equ Compiledsprites+1
	OutroScreen3 equ Compiledsprites+2
	OutroScreen4 equ Compiledsprites+3
	OutroScreen5 equ Compiledsprites+4

endif





;
;Rastercolor buffer - 80 bytes (&50

charChibiko: defw &0000
charNecromancer: defw &0000



EventStreamArray:



; Background L
defb 0,128+4,1,mveBackground+%00000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,evtSettingsBank_Save,0				; Save Object settings to Bank 0

defb 0,128+4,1,mveBackground+%00000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,evtSettingsBank_Save,1				; Save Object settings to Bank 1

defb 0,128+4,0,&24,0				; Static object
defb 0,%10010000+15,2				; Save Object settings to Bank 2



defb 0,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
if BuildCPCv+BuildENTv
defb 	evtSingleSprite,TwoFrameSprite+1 ,24+160-16	,24+104
else
defb 	evtSingleSprite,TwoFrameSprite+1 ,24+160-16-16	,24+104
endif
defb 	evtSaveLstObjToAdd
defw 		charNecromancer


defb 0,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
if BuildCPCv+BuildENTv
	defb 	evtSingleSprite,TwoFrameSprite+2 ,24		,24+160
else
	defb 	evtSingleSprite,TwoFrameSprite+2 ,40		,24+160-8
endif
defb 	evtSaveLstObjToAdd
defw 		charChibiko

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 				Start of fade in block 

FadeStartPoint equ 0	;Start of fade point
			; Fade lasts two timers - ends FadeStartPoint+2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

; Load Palette

	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 200	;delay			
	defb &54,&5C,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				End of fade in block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


defb 10,evtCallAddress			;Call a memory location
defw	ShowText1Init


	defb 25
	defb 136				; Jump to a different level point
	defw SlowDownA				; pointer
	defb 20
SlowDownA:



; Load Palette

	defb 40,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 30	;delay			
	defb &54,&4C,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
	
defb 40,evtCallAddress			;Call a memory location
defw	ShowText2Init

	defb 55
	defb 136				; Jump to a different level point
	defw SlowDownB				; pointer
	defb 50
SlowDownB:

defb 70,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 200	;delay			
	defb &54,&5C,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
	
defb 70,evtCallAddress			;Call a memory location
defw	ShowText3Init


defb 97,%01110000+4			; 4 Commands
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
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
	

defb 97,evtCallAddress			;Call a memory location
defw	ShowText4Init



	defb 130,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 200	;delay			
	defb &54,&5C,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

defb 130,evtCallAddress			;Call a memory location
defw	ShowText5Init

defb 160,%01110000+4			; 4 Commands
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
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B

defb 160,evtCallAddress			;Call a memory location
defw	ShowText6Init



	defb 190,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B
	
	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 200	;delay			
	defb &54,&5C,&5F,&4B	

	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 50
	defb &54,&5C,&56,&4B	

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
TestPos:		
defb 190,evtCallAddress			;Call a memory location
defw	ShowText7Init

defb 210,evtCallAddress			;Call a memory location
defw	ShowText8Init





	defb 235,%01110000+4			; 4 Commands
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
	defb 0
	defb &54,&58,&5F,&4B

	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&58,&5F,&4B
	
defb 235,evtCallAddress			;Call a memory location
defw	ShowText0Init




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 59
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
	ld hl,	&0004 			
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

DiskMap_EndOutro_Screens  	equ &0DC1+&2800	;13 T13-SC1.D03
DiskMap_EndOutro_Screens_Size	equ 24	; &2000
DiskMap_EndOutro_Disk 		equ 2



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

if BuildCPCv+BuildENTv
ScreenFirmwareReset:
	call Akuyou_RasterColors_Blackout

	call Akuyou_Firmware_kill


;	ld a,&C0
;	ld hl,&C000
;	ld de,&8000
;	ld bc,&3E00	; Don't corrupt the stack!
;	call Akuyou_BankSwitch_C0_BankCopy


ifdef BuildCPC
	ld a,&c0
	call Akuyou_BankSwitch_C0_SetCurrent
	call Akuyou_ScreenBuffer_Reset
	ld a,&C0
	call ScreenPosReset
endif
	jp RasterColorsSetPalette1
endif

LevelInit:
ifdef BuildMSX
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-1)
		and %00000101
		cp  %00000101
		jp nz,NoTurboR
		ld hl,Akuyou_EventStream_Process
		ld (DoubleStreamProcess_Plus2-2),hl
NoTurboR:

	call Akuyou_RasterColors_Blackout
	call Akuyou_Firmware_Restore
	ld a,5						;get TilePos for MSX2 tiles
	call Akuyou_VDP_CommandNum
	ld (MSX_MainTilepos_Plus2-2),hl

	push hl
	pop iy
	ld h,50	;Track
	ld l,&C3

	ld c,2	;Disk

	ld ix,&0000
	ld a,10
	call Akuyou_VDP_CommandNum

endif

	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericIntroTypeInit.asm"
	call ShowRLE


ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif


;	call WaitForFire

LevelLoop:


	call Akuyou_Timer_UpdateTimer
	halt
	call Akuyou_EventStream_Process
	call null :DoubleStreamProcess_Plus2

	ifdef BuildCPC
	halt
	endif
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


	call ShowBossText :ShowBossTextCommand_Plus2

	call null :FadeCommand_Plus2


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
	cp 255
	jp z,ShowText0
	jp LevelLoop



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

ifdef BuildZXS
SetSpectrumDisableText:
	push hl	
		ld hl,null
		ld (ShowBossTextCommand_Plus2-2),hl
	pop hl
	ret
endif



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
ShowText0Init:
		ld a,255
		jr UpdateShowText
NoSpeech:
	ld a,5	:NecromancerNospeech_Plus1
	ld hl,(charNecromancer)
	call SetObjectSprite

	ld a,2	:ChibikoNospeech_Plus1
	ld hl,(charChibiko)
	jp SetObjectSprite


ShowText2:

ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,5+TwoFrameSprite
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,2
		ld hl,(charChibiko)
		call SetObjectSprite
if buildCPCv+buildENTv
		ld hl,HauntingPlus
		call PlusPaletteSet
endif
		ld hl,Subtitles2
		ld(OnscreenTextPointer_Plus2-2),hl
	
		ld hl,OutroScreen2
		ld (CompiledSprite_Plus2-2),hl
	
		ld a,NecroY
		jp ResetTextB
ShowText3:


ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,5
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,3+TwoFrameSprite
		ld hl,(charChibiko)
		call SetObjectSprite

if buildCPCv+buildENTv
		ld hl,PaletteDest
		call PlusPaletteSet
endif

		ld hl,OutroScreen1
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles3
		ld(OnscreenTextPointer_Plus2-2),hl
	
	
		ld a,ChibikoY
		jp ResetTextB
		

ShowText4:


ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif
	
		ld a,5+TwoFrameSprite
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,2
		ld hl,(charChibiko)
		call SetObjectSprite

if buildCPCv+buildENTv
		ld hl,PrankPalette
		call PlusPaletteSet
endif


		ld hl,OutroScreen3
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles4
		ld(OnscreenTextPointer_Plus2-2),hl
	
	
		ld a,NecroY
		jp ResetTextB
ShowText5:

ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif


		ld a,5
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,3+TwoFrameSprite
		ld hl,(charChibiko)
		call SetObjectSprite
if buildCPCv+buildENTv
		ld hl,PaletteDest
		call PlusPaletteSet
endif

		ld hl,OutroScreen1
		ld (CompiledSprite_Plus2-2),hl


		ld hl,Subtitles5
		ld(OnscreenTextPointer_Plus2-2),hl

		ld hl,OutroScreen1
		ld (CompiledSprite_Plus2-2),hl
	
		ld a,ChibikoY
		jp ResetTextB
		

ShowText6:
	

ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,5+TwoFrameSprite
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,2
		ld hl,(charChibiko)
		call SetObjectSprite

if buildCPCv+buildENTv
		ld hl,CampingPalette
		call PlusPaletteSet
endif
		ld hl,OutroScreen4
		ld (CompiledSprite_Plus2-2),hl


		ld hl,Subtitles6
		ld(OnscreenTextPointer_Plus2-2),hl
	
	
		ld a,NecroY
		jp ResetTextB
ShowText7:


ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,5
		ld hl,(charNecromancer)
		call SetObjectSprite
		LD A,4
		ld (ChibikoNospeech_Plus1-1),a
		ld a,3+TwoFrameSprite
		ld hl,(charChibiko)
		call SetObjectSprite

		ld hl,OutroScreen1
		ld (CompiledSprite_Plus2-2),hl
if buildCPCv+buildENTv
		ld hl,PaletteDest
		call PlusPaletteSet
endif
		ld hl,Subtitles7
		ld(OnscreenTextPointer_Plus2-2),hl
	
	
		ld a,ChibikoY
		jp ResetTextB
ShowText8:


ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,5
		ld hl,(charNecromancer)
		call SetObjectSprite
		LD A,4
		ld (ChibikoNospeech_Plus1-1),a
		ld a,3+TwoFrameSprite
		ld hl,(charChibiko)
		call SetObjectSprite

		ld hl,OutroScreen1
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles8
		ld(OnscreenTextPointer_Plus2-2),hl
	
	
		ld a,ChibikoY
		jp ResetTextB
ShowText0:

ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,6
		ld hl,(charNecromancer)
		call SetObjectSprite
		LD A,6
		ld (ChibikoNospeech_Plus1-1),a
		ld (NecromancerNospeech_Plus1-1),a
		ld a,6
		ld hl,(charChibiko)
		call SetObjectSprite

if buildCPCv+buildENTv
		ld hl,ThanksPalette
		call PlusPaletteSet
endif


		ld hl,OutroScreen5
		ld (CompiledSprite_Plus2-2),hl

		ld hl,Subtitles0
		ld(OnscreenTextPointer_Plus2-2),hl
	
	
		ld a,NecroY
		jp ResetTextB

ShowText1:
		ld hl,Subtitles1
ShowTextChibiko:
		push hl
			call Clear4000
			call ShowRLE
		pop hl
ShowTextChibikoNotClear:		


		ld(OnscreenTextPointer_Plus2-2),hl
		ld a,2+TwoFrameSprite
		ld hl,(charChibiko)
		call SetObjectSprite

	
		;pop hl
		ld a,5
		ld hl,(charNecromancer)
		call SetObjectSprite

	
		ld a,ChibikoY
ResetTextB:
		ld (OnscreenTextPos_Plus1-1),a


ResetText:
		ld a,1
		ld (BossCharNum_Plus1-1),a
		ld a,0
		ld(ShowTextUpdate_Plus1-1),a
		ld a,15
		ld (OnscreenTimer_Plus1-1),a
		call Clear4000
		call ShowRLE
		jp levelloop
	

SubtitlesEmpty: 
db  4,""," "+&80
db &0

Subtitles1: 
ifdef CPC320

	db  4,"Yeah! Not so mouthy now are you!!","!"+&80
	db  4,"Now, Who the fuck are you","?"+&80
	db  4,"Why are you creating these"," "+&80
	db  4,"monsters and invading my land??","?"+&80
else
	if BuildLang =''
		;      ---------------------------
		db  8,"Yeah! Not so mouthy now are"," "+&80
		db  8,"you! Now, Who the fuck are","?"+&80
		db  8,"you, and Why are you making"," "+&80
		db  8,"these monsters invade my"," "+&80
		db  8,"land??","?"+&80
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db 8,"Y","E","A","H","!", 149,112,133," ",125,126,159,119,135," ",134,112,129,"!",255
	db 8,139,121,125,159,111,116," ",125,134,124,115,"!"," ",118,144,117,139," ",134,135,148,138,"?",255
	db 8,133,159,116,125,132," ",119,115,141,159,131,129,130,135," ",157,129,125,138," ",149,144,103,255
	db 8,118,128,157,127,132," ",115,154,138,"?",255
	endif
endif
db &0


Subtitles2: 
ifdef CPC320
	db  1,"I USED to be the Village elder",","+&80 
	db  1,"but since you raised the villag","e"+&80
	db  1,"and killed all the villager","s"+&80
	db  1,"I fled and hid in this cave!","!"+&80
else
	if BuildLang =''
	;      ---------------------------
	db  4,"I USED to be the Village"," "+&80 
	db  4,"elder but since you raised"," "+&80
	db  4,"the village and killed all"," "+&80
	db  4,"the villagers I fled and"," "+&80
	db  4,"hid in this cave!"," "+&80
	endif
	if BuildLang ='j'
          ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  9,157,125,139," ",148,133," ",128,158,130,111,116," ",132,159,125,129,"!",255
	db  9,132,159,148," ",114,134,129,119,159," ",146,152,103," ",127,159,158,147,131,125,132,255
	db  9,146,152,140,159,133,103," ",127,159,158,115,158," ",123,156,125,129,119,152,255
	db  9,123,138," ",119,159,158,121,131,135," ",119,121,155,129,255
	endif
endif
db &0


Subtitles3: 
ifdef CPC320
	db  4,"er..","."+&80
	db  4,"well..","."+&80
	db  4,"Yes, I did SORT-OF do THAT",","+&80
	db  4,"But what about these monsters?","?"+&80
else
	;      ---------------------------
	if BuildLang =''
	db  8,"er..","."+&80
	db  8,"well..","."+&80
	db  8,"Yes, I did SORT-OF do THAT",","+&80
	db  8,"But what about these"," "+&80
	db  8,"monsters?","?"+&80
	endif
	if BuildLang ='j'
	db  8,144,114,".",".",".",114,114,".",".",255
	db  8,128,155,139," ",125,129,101,119,148,".",".",".",255
	db  8,132,159,148,101,123,138," ",119,115,141,159,131,103," ",127,131,147,115," ",125,134,124,115,"!",255
	endif
endif
db &0

Subtitles4: 
ifdef CPC320
	db  1,"Huh, Monsters? These are th","e"+&80
	db  1,"animals that lived in the forest",","+&80
	db  1,"The river got polluted, and the","y"+&80
	db  1,"got ill and mutated","."+&80
else
	;      ---------------------------
	if BuildLang =''
	db  4,"Huh, Monsters? These are"," "+&80
	db  4,"the animals that lived in"," "+&80
	db  4,"the forest, The river got"," "+&80
	db  4,"polluted, and they got ill"," "+&80
	db  4,"and mutated","."+&80
	endif
	if BuildLang ='j'
          ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  7,119,115,141,159,131,"?",123,155,139," ",148,153,138," ",133,159,116,141,159,131,132,159,126,255
	db  7,132,159,148," ",119,157,119,159," ",118,127,158,125,132,101,140,159,111,116,120,135," ",134,112,132,255
	db  7,120,122,115,135," ",134,112,132," ",125,144,112,129,255
	endif
endif
db &0


Subtitles5: 
	;      ---------------------------
ifdef CPC320
	db  4,"um..","."+&80
	db  4,"that was supposed to be a jok","e"+&80
	db  4,"hmm... But",","+&80
	db  4,"But why are you sending them to me?","?"+&80
else
	;      ---------------------------
	if BuildLang =''
		db  8,"um..","."+&80
		db  8,"that was supposed to be a"," "+&80
		db  8,"joke, hmm... But",","+&80
		db  8,"But why are you sending"," "+&80
		db  8,"them to me?","?"+&80
	endif
	if BuildLang ='j'
		db  8,114,114,".",".",255
		db  8,128,155,139," ",130,111,112,133,125,129," ",115,129,126,159,152,138," ",131,148,153,129,159,112,129,122,133,159,255
		db  8,117,133,101,132,159,148,".",".",".",255
		db  8,133,159,116,125,132," ",157,129,125,138," ",149,144,135," ",120,132,154,138,"?",255
	endif
endif
db &0

Subtitles6: 
ifdef CPC320
	db  1,"I'm not doing that! Fire destroye","d"+&80
	db  1,"their habitat,so now the","y"+&80
	db  1,"are migrating to better lan","d"+&80
	db  1,"like the mountains.","."+&80
else
	;      ---------------------------
	if BuildLang =''
	db  4,"I'm not doing that! Fire"," "+&80
	db  4,"destroyed their habitat,so"," "+&80
	db  4,"now they are migrating to"," "+&80
	db  4,"better land like the"," "+&80
	db  4,"mountains."," "+&80
	endif
	if BuildLang ='j'
          ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  8,128,155,139," ",157,125,135," ",119,158,122,115," ",114,153,144,127,158,101,255
	db  8,124,115,120,158,138," ",148,153,138," ",119,125,159,132,159," ",126,146,133,123,156,119,159,255
	db  8,134,121,134,112,129,119,152,101,119,157,153,135," ",149,144,135,255
	db  8,115,125,159,110,116," ",125,132,115,144,126,255
	endif
endif
db &0




Subtitles7: 
ifdef CPC320
	db  4,"ah...  Er... Um.. ahem!"," "+&80
	db  4,"Well... ah, this is akward        "," "+&80
else
	;      ---------------------------
	if BuildLang =''
	db  8,"ah...  Er... Um.. ahem!"," "+&80
	db  8,"Well... ah, this is akward"," "+&80
	db  8,"       "," "+&80
	endif
	if BuildLang ='j'
	db  8,139,114,"?"," ",114,138,"?"," ",117,133,".",".",255
	db  8,123,155,139," ",130,111,112,133," ",139,126,159,119,125,115,"!",255
	endif
endif
db &0
Subtitles8: 
ifdef CPC320
	db  4,"I suppose I COULD cut down an","d"+&80
	db  4,"ONLY commit massacres ever","y"+&80
	db  4,"other tuesday!!","!"+&80
else
	;      ---------------------------
	if BuildLang =''
		db  8,"I suppose I COULD cut down"," "+&80
		db  8,"and ONLY commit massacres"," "+&80
		db  8,"every other tuesday!!","!"+&80
	endif
	if BuildLang ='j'
		db  8,125,159,109,101,123,155,119,152,139," ",119,151,116,140,159," ",129,159,122,255
		db  8,145,134,123,159,156,125,135," ",126,154,"!",255
	endif
endif
db &0

Subtitles0: 
	if BuildLang =''
	;b  4,"1234567890123456789012345678901234567890
	db  14,"Game Over!!","!"+&80
	db  10,"        "," "+&80
	ifdef CPC320
	db  10,""," "+&80
	endif
	db  4,"I hope you enjoyed playing this"," "+&80
	db  4,"game as much as I did making it","!"+&80
	db  10,""," "+&80
	db  6,"See you again next time in",":"+&80
	db  14,"CHIBI AKUMA","s"+&80
	db  7,"Episode 2: Confrontation","!"+&80
	db  10,""," "+&80
	db  10,"Thanks For Playing!!","!"+&80
	ifdef CPC320
		db  3,"Don't forget to turn off your set","!"+&80
	else

	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  5,"Don't forget to turn off your"," "+&80
	db  17,"Set!"," "+&80
	endif
	endif
	if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  15,122,159,113,146,".",118,113,139,159,113, 255
	db  10,"        ",255
	db  6,157,129,125,119,159," ",123,138,122,159,113,146,103," ",131,121,112,129,133,120,133," ",118,134,125,159,151,116,255
	db  8,114,134,129,119,159," ",129,138,125,158,129,159,123,133,103," ",115,138,112,132,115,144,126,"!",255
	db  17,131,120,159,139,101,255
	db  7,099,"C","H","I","B","I", "A","K","U","M","A","S"," ",129,159,115,"2",129,159,158,":",129,115,122,131,100," ",255
	db  16,132,159,114,115,144,125,111,116,"!",255

	db  12,114,128,158,132,159,121,155,132," ",114,153,119,159,133,116,"!",255
	db  9,139,160,128,123,158,103," ",122,125,157,126,155,134,115,132,159," ",121,129,159,124,115,"!",255

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
	ret z

	ld h,a
	inc bc

	push hl
		call Akuyou_DrawText_LocateSprite

		call Akuyou_DrawText_PrintString
	pop hl
	inc l
	ldai
	dec a
	inc bc
	jp nz,ShowBossText_MoreText

	ld a,(bc)
	or a
	jp z,NoSpeech ; See if we have reached the end of the string
	ld a,(BossCharNum_Plus1-1)
	inc a
	nop
	nop :ShowTextSpeedup_Plus1
ShowBossTextNoSpeedup:
	ld (BossCharNum_Plus1-1),a

ret

;Clear Screen
ifdef BuildMSX
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
endif


ShowRLE:
		ld ixh,0
if buildCPCv+buildENTv
		call Akuyou_RasterColors_Blackout
		call Compiledsprites	:CompiledSprite_Plus2

endif
ifdef BuildZXS


		ld hl,Compiledsprites	:CompiledSprite_Plus2


		ld a,h	
		or a
		jp z,NoBackPic

;		ld de,&4000
;		add hl,de
		ex hl,de

		ld hl,Akuyou_Rle_FromPointers		
		ld a,0	:CompiledSpriteMempos_Plus1
		call Akuyou_Bankswapper_CallHL



endif
ifdef BuildMSX
		ld hl,&8000	:CompiledSprite_Plus2
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
		ld a,ixh
		cp 0

if buildCPCv+buildENTv
		call nz,RLE_Draw
endif
		ei
ret
ifdef BuildENT
read "..\SrcENT\Akuyou_ENT_RLE.asm"
endif
	
ifdef BuildCPC
read "..\SrcCPC\Akuyou_CPC_RLE.asm"
endif

;Clear Screen
Clear4000:

	push hl
	push bc
	push de

ifdef BuildMSX
		call Akuyou_CLS
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
null:ret


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

;					CPC Plus Palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if buildCPCv+buildENTv




DoPaletteDefault:
	push bc
	push de
	push hl

		ld hl,PaletteDest
		call PlusPaletteSet
	pop hl
	pop de
	pop bc
ret






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

defw &0000;0  -GRB
defw &0085;1  -GRB
defw &0D0F;2  -GRB
defw &0FFF;3  -GRB

	defb 50

defw &0000;0  -GRB
defw &0085;1  -GRB
defw &0B0E;2  -GRB
defw &0FFF;3  -GRB

	defb 85
defw &0000;0  -GRB
defw &0085;1  -GRB
defw &0B0E;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0085;1  -GRB
defw &0B0E;2  -GRB
defw &0FFF;3  -GRB
	defb 120
defw &0000;0  -GRB
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &008F;1  -GRB
defw &0D0F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &008F;1  -GRB
defw &0D0F;2  -GRB
defw &0FFF;3  -GRB
	     ;0GRB

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
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 175
defw &0000;0  -GRB
defw &008F;1  -GRB
defw &0D0F;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &008F;1  -GRB
defw &0D0F;2  -GRB
defw &0FFF;3  -GRB
	     ;0GRB

ThanksPalette:
	     ;0GRB
	defb 20
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0C8F;2  -GRB
defw &0FFF;3  -GRB
	defb 45
defw &0000;0  -GRB
defw &00A6;2  -GRB
defw &0C8F;2  -GRB
defw &0FFF;3  -GRB
	defb 75
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0C8F;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &0088;1  -GRB
defw &0C8F;2  -GRB
defw &0FFF;3  -GRB
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
	     ;0GRB



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
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 150
defw &0000;0  -GRB
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 200
defw &0000;0  -GRB
defw &008F;1  -GRB
defw &0D0F;2  -GRB
defw &0FFF;3  -GRB



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
defw &066F;10  -GRB
defw &0BF1;11  -GRB
defw &0915;12  -GRB
defw &011F;13  -GRB
defw &0090;14  -GRB
defw &0CFF;15  -GRB



endif


;Allow objects to be reprogrammed
read "Core_ObjectReprogrammers.asm"

ifdef BuildZXS
	read "..\SrcZX\Akuyou_Spectrum_Level_GenericFader.asm"		;Must be within the copied block
endif
ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
endif

if buildCPCv+buildENTv;MUST PUT AFTER PALETTEDEST
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
endif

ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	



FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
if BuildMSXv+BuildENTv+BuildCPCv
	FadeOut:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteInit
			call SetFader
		pop hl
	ret
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
	save direct "T50-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif



