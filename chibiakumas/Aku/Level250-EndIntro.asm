
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
		write "..\BldENT\T38-SC1.D02"
endif
ifdef buildZXS
	write "..\BldZX\Level250.bin"
endif 
ifdef buildMSX
	if BuildLang=''
		write "..\ResMSX\T38-SC1.D02"
	endif
	if BuildLang='j'
		write "..\ResMSXj\T38-SC1.D02"
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








Compiledsprites:
if buildCPCv+buildENTv
	read "..\AkuCPC\Level250_Screens.asm"
endif

ifdef BuildZXS
	read "..\AkuZX\Level250_Screens.asm"
endif
ifdef BuildMSX
MSXTiles:
	incbin "..\ResMSX\Level250Screens.RLE"
MSXTiles_End:
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




charChibiko: defw &0000
charNecromancer: defw &0000



;incbin "Sprites\LEVEL1A.SPR"

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

; 				Start of fade in block 

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
	defb &54,&5C,&56,&4B	



	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 100	;delay			
;	defb &54,&58,&5F,&4B	
	defb &54,&58,&56,&4B
	defb 50	;delay			
	defb &54,&58,&5F,&4B

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

defb 50,evtCallAddress			;Call a memory location
defw	ShowText2Init

defb 90,evtCallAddress			;Call a memory location
defw	ShowText3Init

defb 115,evtCallAddress			;Call a memory location
defw	ShowText4Init



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeOutStartPoint equ 140
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



defb 144,%10001001			;Call a memory location
	defw	EndLevel
EndLevel:
	pop hl	;
EndLevelFire:
	ld hl,	&0109 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

if BuildCPCv+BuildEntv
ScreenFirmwareReset:
	call Akuyou_RasterColors_Blackout

	call Akuyou_Firmware_kill


	call Akuyou_ScreenBuffer_Reset
	ld a,&C0
	call ScreenPosReset
	jp RasterColorsSetPalette1
endif

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


		ld a,5						;get TilePos for MSX2 tiles
		call Akuyou_VDP_CommandNum
		ld (MSX_MainTilepos_Plus2-2),hl

		push hl
		pop iy

		ld hl,MSXTiles					;Copy the background tiles into vram
		ld de,MSXTiles_End
		ld bc,MSXTiles_End-MSXTiles	
		ld ix,&0000
		call Akuyou_VDP_RLEProcessorFromMemory	


	endif
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericIntroTypeInit.asm"

ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif
	call ShowRLE
 

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
	endif

	djnz PauseLoopB
;	call Akuyou_ScreenBuffer_Flip


ifdef Debug_ShowLevelTime
	call ShowLevelTime
endif

	call null :FadeCommand_Plus2




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

ifdef BuildZXS
SetSpectrumDisableText:
	push hl	
		ld hl,null
		ld (ShowBossTextCommand_Plus2-2),hl
	pop hl
	ret
endif



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










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Level specific code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
NoSpeech:
	ld a,1
	ld hl,(charNecromancer)
	call SetObjectSprite

	ld a,0
	ld hl,(charChibiko)
	jp SetObjectSprite


ShowText2:

ifdef BuildZXS
		ld a,1
		ld c,64+5
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld a,1+TwoFrameSprite
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,0
		ld hl,(charChibiko)
		call SetObjectSprite

		ld hl,Subtitles2
		ld(OnscreenTextPointer_Plus2-2),hl
		push hl
			call Clear4000
			call ShowRLE
		pop hl


ifdef CPC320
		ld a,&10-3
else
		ld a,&10-4
endif
		ld (OnscreenTextPos_Plus1-1),a
		jp ResetText
ShowText3:
ifdef BuildZXS
		ld a,1
		ld c,64+3
		call Akuyou_ZXSGPU_CommandNum	;SetFontColor
endif

		ld hl,Subtitles3
		jr ShowTextChibiko
		

ShowText4:
		ld hl,Subtitles4
		jr ShowTextChibiko
		
ShowText1:
		ld hl,Subtitles1
		jp ShowTextChibikoNotClear
ShowTextChibiko:
		push hl
			call Clear4000
			call ShowRLE
		pop hl
ShowTextChibikoNotClear:
		ld(OnscreenTextPointer_Plus2-2),hl

		;pop hl
		ld a,1
		ld hl,(charNecromancer)
		call SetObjectSprite

		ld a,0+TwoFrameSprite
		ld hl,(charChibiko)
		call SetObjectSprite

	
ifdef CPC320
		ld a,&14
		ld (OnscreenTextPos_Plus1-1),a
else
		ld a,&12
		ld (OnscreenTextPos_Plus1-1),a
endif


ResetText:
		ld a,1
		ld (BossCharNum_Plus1-1),a
		ld a,0
		ld(ShowTextUpdate_Plus1-1),a
		ld a,15
		ld (OnscreenTimer_Plus1-1),a
	
		jp levelloop
	

SubtitlesEmpty: 
if BuildLang =''
	db  4," "," "+&80
else
	db  4," ",255
endif 
db &0

Subtitles1: 
	;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
ifdef CPC320
	db  4,"You're the one sending all thi","s"+&80
	db  4,"Shit?   Who the hell even are you?"," "+&80
	db  4,"You weren't in the intro, on th","e"+&80
	db  4,"web site or the title screen!!","!"+&80
else
if BuildLang =''
	db  8,"You're the one sending all"," "+&80
	db  8,"this Shit? Who the hell"," "+&80
	db  8,"even are you? You weren't"," "+&80
	db  8,"in the intro, on the web"," "+&80
	db  8,"site or the title screen!!","!"+&80
endif
if BuildLang ='j'
	db  8,139,114,101,123,138," ",119,115,141,159,131,119,159," ",120,124,144,138," ",125,157,124,159,"?",255
	db  8,118,144,117," ",129,159,155,"?"," ",127,159,158,127,159,158," ",145,129,123,133,119,159," ",134,115,"!",255
	db  8,122,159,113,146,138," ",115,158,133,156,133," HP",126,152," ",128,158,124,159,115,255
	db  8,125,134,115," ",125,159,158,141,159,131,139," ",132,159,132,115,112,132,"!",255
endif
endif
db &0


Subtitles2: 
ifdef CPC320
	db  4,"So you've come for me at last?"," "+&80 
	db  4,"Be Gone Foul Monster!       "," "+&80
	db  4,"I shall banish you fro","m"+&80
	db  4,"this land once and for all","!"+&80
else
if BuildLang =''
	db  4,"So you've come for me at"," "+&80 
	db  4,"last? Be Gone Foul Monster!"," "+&80
	db  4,"I shall banish you fro","m"+&80
	db  4,"this land once and for"," "+&80
	db  4,"all!!!"," "+&80
endif
if BuildLang ='j'
           ;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
	db  9,149,112,133," ",120,144,125,129,119,".",".",".",144,130,144,125,129,"!",255
	db  9,114,134,129," ",145,129,115,134," ",139,159,122,148,138,139," ",118,115,129,159,126,"!",255
endif
endif
db &0


Subtitles3: 
ifdef CPC320
	db  4,"Yeah, yeah! whatever you say...","."+&80
	db  4,"You better pray they hav","e"+&80
	db  4,"haemorrhoid cream in th","e"+&80
	db  4,"afterlife..","."+&80
else
if BuildLang =''
	db  8,"Yeah, yeah! whatever you"," "+&80
	db  8,"say! You better pray they"," "+&80
	db  8,"have haemorrhoid cream in"," "+&80
	db  8,"the afterlife..","."+&80
endif
if BuildLang ='j'
	db  8,139,115,139,115,".",".",".",123,159,130,109,123,159,130,109," ",116,154,124,115,"!",255
	db  8,120,124,144,139," ",125,123,159,135," ",115,143,159,125,159,149,121,119,159," ",114,154,123,133,103,255
	db  8,115,138,153,134,124,115,"!",255
endif
endif

db &0
Subtitles4: 
ifdef CPC320

	db  4,"Cos' I'm gonna kick your ass so har","d"+&80
	db  4,"It'll hurt for a millennium!!","!"+&80
else
if BuildLang =''
	db  8,"Cos' I'm gonna kick your "," "+&80
	db  8,"ass so hard it'll hurt for"," "+&80
	db  8,"a millennium!!"," "+&80
endif
if BuildLang ='j'
	db  8,134,158,144,158,137,158,148," ",115,129,145," ",131,131,159,122,154,151,116,135,255
	db  8,120,124,144,138," ",118,125,153,103," ",122,133,139,159,125,132," ",149,154,"!",255
endif
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
ifdef buildCPC
		call Akuyou_RasterColors_Blackout
		call Compiledsprites	:CompiledSprite_Plus2

endif
ifdef buildENT
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



Clear4000:

	push hl
	push bc
	push de
	;	ld hl,null;Clear4000
	;	ld (ClearScreenPoint_Plus2-2),hl

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
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 50
defw &0000;0  -GRB
defw &0080;1  -GRB
defw &0B00;2  -GRB
defw &0FFF;3  -GRB
	defb 85
defw &0000;0  -GRB
defw &0085;1  -GRB
defw &0B0E;2  -GRB
defw &0FFF;3  -GRB
	defb 100
defw &0000;0  -GRB
defw &008C;1  -GRB
defw &0D0F;2  -GRB
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
defw &0000;1  -GRB
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

if buildCPCv+buildENTv	;MUST PUT AFTER PALETTEDEST
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
endif

ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	



FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
if BuildMSXv+BuildCPCv+BuildENTv
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
	save direct "T38-SC1.D02",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif


