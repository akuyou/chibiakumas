;Debug_ShowLevelTime equ 1
nolist

limit &FFFF
;read "Core.asm"
read "CoreDefs.asm"
read "Eventstreamdefinitions.asm"

LevelDataStart equ &00 ;Start of the data which is stored on disk
org &4000
LevelOrigin:
org LevelOrigin+ LevelDataStart



LevelSprites:
;incbin "Sprites\Attack1.spr"
;incbin "Sprites\LEVEL1A.SPR"
read "SpriteCompiler\ep2_EndSeqIntro.asm"









;Rastercolor buffer - 80 bytes (&50
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




CustomRam:
defs 64 ;  Pos-Tick-Pos-Tick ; enough memory for 16 enemies!



align 256,&00
RasterColors_ColorArray1Alt:
	defb 1
	defb 1				
	defb &54,&55,&4C,&4B	


RasterColors_ColorArray2Alt:
	defb 2	; Switches
	defb 32	;delay			
	defb &54,&58,&5C,&4B	
	defb 64+16-32;delay			
	defb &54,&5D,&53,&4B



RasterColors_ColorArray3Alt:
	defb 2
	defb 48
	defb &54,&46,&5B,&4B
	defb 128
	defb &54,&46,&5a,&4B



RasterColors_ColorArray4Alt:
	defb 3 ; no of switches
	defb 0	;delays			
	defb &54,&46,&5A,&4B
	defb 255	;delays			
	defb &54,&4C,&4D,&4B
	defb 36	;delays			
	defb &54,&46,&5A,&4B



EventStreamArray:

;defb 0,evtSetObjectSize,24
;defb 0,evtSetAnimator,0
;defb 0,evtAddToForeGround

defb 0,128+4,0,&24,0				; Static object
defb 0,%10010000+15,2				; Save Object settings to Bank 2

defb 0,128+4,0,&60,0	
defb 0,%10010000+15,3

defb 0,128+4,0,&32,0			;2b 32 39
defb 0,%10010000+15,4



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


	
InfLoop:
defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100					; new time
			; new time


TimeColorsChibikoBochan:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5B,&40	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 64				
	defb &54,&4C,&52,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsBlues:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&55,&5F,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4C,&52,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100


TimeColorsChibiko:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5B,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5F,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsSakuya:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&59,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5F,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsSakuyaYume:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&59,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5F,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 64				
	defb &54,&47,&4D,&4B

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsSakuyaChibiko:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&59,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5F,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 64				
	defb &54,&58,&5B,&4B

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsVictim:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4C,&4E,&4B	

	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&4C,&4B		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5F,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsBochanNarrator:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&4C,&52,&4B

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 128				
;	defb &54,&44,&5F,&4B	
	defb &54,&55,&5F,&4B	
	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100
TimeColorsNarrator:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&55,&5F,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100


TimeColorsSkyBlue:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&57,&5B,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100
TimeColorsYumiDialog:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&5F,&5B,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100



TimeColorsYumi:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&47,&5F,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100


TimeColorsYume:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&47,&4D,&4B	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsBochanNarratorV2:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&4C,&52,&40	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		
	
	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 128			
;	defb &54,&44,&5F,&4B			
	defb &54,&55,&5F,&4B	
	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsBochan:
TimeColorsBedroom:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&4C,&52,&40	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsBlueout:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100


TimeColorsBlackout:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&54,&54,&54

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

;defb 10,evtCallAddress			;Call a memory location
;defw	ShowText1Init






FadeOut:
defb 60,%01110000+4			; 4 Commands
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





defb 62,%01110000+4			; 4 Commands
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


defb 64,%10001001			;Call a memory location
	defw	EndLevel
EndLevel:
	pop hl	;
EndLevelFire:

	call DoClear4000

	ld hl,	&0114 				;load menu
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


align 256
Banks256k:
defb &CC,&CD,&CE,&CF,&D4,&D5,&D6,&D7

load256k:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db "Please Wait, Loading 256K Sprites..","."+&80
db 0

Do256kLoad:
		ld c,3	;disk
		ld de,&4000
		ld ix,&7FFF
		call Akuyou_LoadDiscSectorz
ret




ScreenFirmwareReset:
	call Akuyou_RasterColors_Blackout
;	ld a,0			;; bank number
;	ld de,&C800		;; load address
;	ld hl,DiskMap_MusicIntro
;	ld c,DiskMap_MusicIntro_Disk
;	call Akuyou_LoadDiscSector	


	call Akuyou_Firmware_kill

	ld a,&C0
	ld hl,&C000
	ld de,&8000
	ld bc,&3F00	; Don't corrupt the stack!
	call Akuyou_BankSwitch_C0_BankCopy


;	call AkuYou_Player_GetPlayerVars
;	ld a,(iy-1)
;	and 128
;	jp z,Detected64k

	ld a,&c0
	call Akuyou_BankSwitch_C0_SetCurrent
;	ld a,&40
;	call Akuyou_ScreenBuffer_Alt
;	jr Detected128k
;Detected64k
	call Akuyou_ScreenBuffer_Reset
;	jr DetectedContinue
;Detected128k
	ld a,&C0
	call ScreenPosReset
;DetectedContinue

;	call RestoreMusic

	ret
	jp RasterColorsSetPalette1

;"T56-SC1.D04"
LevelInit:

	call Akuyou_Music_Restart


;	ld a,ObjectArraySize
;	ld hl,ObjectArrayPointer
;	call AkuYou_ObjectArray_Init


	ld hl,EventStreamArray		;Event Stream
;	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit
;	call AkuYou_RasterColors_StopMusic
	call Akuyou_RasterColors_Init
	
call	Clear4000;call ShowText2






	ld de,DialogScript
	ld hl,null
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SetInsults

	ld de,DialogScriptBochan
	ld hl,null
	ld a,(iy+9)
	or a
	jr z,SetInsults

	ld de,DialogScript
	ld hl,callCallChibikoOnlyBranch

SetInsults:

	ld (ChibikoOnlyBranchToggle_Plus2-2),hl
	ld (OnscreenTextPointer_Plus2-2),de





	ld a,(iy-1)	;cpcver
	and 64
	jr z,systemis128k
systemis256k:




		ld a,2
		call Akuyou_SpriteBank_Font
		ld h,2
		ld l,12
		call Akuyou_DrawText_LocateSprite	
		ld bc,load256k
		ld a,255
		ld i,a
		call Akuyou_DrawText_PrintString	
		call Akuyou_RasterColors_Disable
		call Akuyou_Firmware_Restore


		;256k Banks
		;CC CD CE CF
		;D4 D5 D6 D7

		ld hl,DiskMap_EndSeqIntro_Screens_Bank0
		ld a,&CC
		call Do256kLoad

		ld hl,DiskMap_EndSeqIntro_Screens_Bank1
		ld a,&CD
		call Do256kLoad

		ld hl,DiskMap_EndSeqIntro_Screens_Bank2
		ld a,&CE
		call Do256kLoad

		ld hl,DiskMap_EndSeqIntro_Screens_Bank3
		ld a,&CF
		call Do256kLoad

		ld hl,DiskMap_EndSeqIntro_Screens_Bank4
		ld a,&D4
		call Do256kLoad

		ld hl,DiskMap_EndSeqIntro_Screens_Bank5
		ld a,&D5
		call Do256kLoad


		di
		call Akuyou_Firmware_kill
		call clear4000
		call Akuyou_RasterColors_Init


	ld hl,DrawABackgroundFrame256k
	ld (BackgroundBankHandler_Plus2-2),hl




systemis128k:





;	call WaitForFire

LevelLoop:

	call null :ClearScreenPoint_Plus2 ;Clear4000
	ld hl,null
	ld (ClearScreenPoint_Plus2-2),hl


	ei;disable me

	call Akuyou_Timer_UpdateTimer
	halt


	call ShowDialog	:ShowDialogCall_Plus2
	call ShowDialog	:ShowDialogCallB_Plus2
	call null	:MusicSwitcher_Plus2

	call Akuyou_EventStream_Process		:ProcessCommand_Plus2
	ld hl,Akuyou_EventStream_Process	
	ld (ProcessCommand_Plus2-2),hl

	halt
	call AkuYou_Player_ReadControls
		ld a,ixl
		or Keymap_AnyFire ;%11110001
		cp 255
		jp nz,EndLevelFire
		ld a,ixh
		or Keymap_AnyFire ;%11110001
		cp 255
		jp nz,EndLevelFire
	halt
	call Akuyou_ObjectArray_Redraw



	ld a,(InsultCharNum_Plus1-1)
	ld b,a
	ld a,255
	sub b
	srl a
	srl a
	srl a
	srl a
	ld b,a
	jr z,PauseLoopBskip
PauseLoopB
	halt
	djnz PauseLoopB
PauseLoopBskip

	ifdef Debug_ShowLevelTime

		call ShowLevelTime
	endif




	jp LevelLoop




ShowLevelTime:

	ld a,2		;Remember to set the font!
	call Akuyou_SpriteBank_Font

	ld hl,&1001
	call Akuyou_DrawText_LocateSprite

	call Akuyou_GetLevelTime
	push bc	
	call ShowHex
	pop bc
	ld a,b
	call ShowHex
ret
ShowHex:


	push af         ;store original byte value
		rrca            
		rrca
		rrca
		rrca
		call DrawText_PrintHexDigit
	pop af          ;retrieve original byte value

DrawText_PrintHexDigit:
	and %00001111   ;isolate lower nibble. (This contains the digit value 0...15)
	cp &a           ;Less than 10?  Set carry if so
	sbc a,&69
	daa             ;Because previous instruction was a subtract operation this
                ;is known as 'das' in x86
DrawText_PrintHexDigitNum:
	jp Akuyou_DrawText_CharSprite   ;display digit





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



DrawABackgroundFrame256k:
;---------256k
	ld hl,Banks256k
	ld l,a
	ld a,(hl)
	ld hl,&4000
	ld de,&8000
	ld bc,&3F00	; Don't corrupt the stack!
	di
	call Akuyou_BankSwitch_C0_BankCopy
	ei
;	call Akuyou_ScreenBuffer_Reset
;	ld (ScreenDE_Plus2-2),hl
;	ld a,&C0
;	call ScreenPosReset

	jp DrawABackgroundFrameNoLoad

;---------256k


DrawABackgroundFrame:

	ld a,0:NeededBank_Plus1
	cp 255 :CurrentBank_Plus1
	jp z,DrawABackgroundFrameNoLoad
	ld (CurrentBank_Plus1-1),a



	jp DrawABackgroundFrame128k 	:BackgroundBankHandler_Plus2
DrawABackgroundFrame128k:


	push af
		call clear4000
		di
		call Akuyou_RasterColors_Disable

		call Akuyou_Firmware_Restore
		;Load up the extra data - over the Bootstrap
		call Akuyou_RasterColors_Blackout
		;	ld hl,RasterColors_ZeroColors
		;	call SetColors
	pop af
	ld de,Akuyou_LoadDiscSectorZ
;	ld de,Akuyou_LoadDiscSector
	ld hl,DiskMap_EndSeqIntro_Screens_Bank0 
	cp 0 
	jp z,DrawABackgroundFrame_StartLoad


;	ld de,Akuyou_LoadDiscSector
	ld hl,DiskMap_EndSeqIntro_Screens_Bank1
	cp 1
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_EndSeqIntro_Screens_Bank2
	cp 2
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_EndSeqIntro_Screens_Bank3
	cp 3
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_EndSeqIntro_Screens_Bank4
	cp 4
	jp z,DrawABackgroundFrame_StartLoad


	ld hl,DiskMap_EndSeqIntro_Screens_Bank5
	cp 5
	jp z,DrawABackgroundFrame_StartLoad


;	ld hl,DiskMap_Intro_Screens_Bank6
;	cp 6
;	jp z,DrawABackgroundFrame_StartLoad

;	ld hl,DiskMap_Intro_Screens_Bank7
;	cp 7
;	jp z,DrawABackgroundFrame_StartLoad

;	ld hl,DiskMap_Intro_Screens_Bank8
;	cp 8
;	jp z,DrawABackgroundFrame_StartLoad


DrawABackgroundFrame_StartLoad:
	ld (BankDiskLoader_Plus2-2),de
	ld a,&C0
	;use C4 for extra cahce!
	
;	ld b,DiskMap_Intro_Screens_Size
	ld c,3	;disk
	ld de,&C000
	ld ix,&FFFF
	call Akuyou_LoadDiscSector :BankDiskLoader_Plus2
	di
	call	ScreenFirmwareReset
	call clear4000
;	call Akuyou_Music_Restart
	call Akuyou_RasterColors_Init


DrawABackgroundFrameNoLoad:
	call Clear4000 :ClearScreencls_Plus2
;	ld de,&C27C	;needed for akuyou sprite render
	call null:ClearScreenPointb_Plus2
;	ld de,&C27C	;needed for akuyou sprite render
jp null :ClearScreenPointc_Plus2

MusicCspoof:
	push hl
		ld hl,DoMusicCspoof
		ld (MusicSwitcher_Plus2-2),hl
	pop hl
ret

MusicCrestore:
	push hl
		ld hl,DoMusicRestore
		ld (MusicSwitcher_Plus2-2),hl
	pop hl
ret



DialogScript
db " "," "+&80

defb dlgCommand

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdCall
	defw SetJustCls
	defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR037Chibikovictorsmugpng_Bank 
	defb PicFR037Chibikovictorsmugpng_ParentRef  
	defb PicFR037Chibikovictorsmugpng_Ref  

defb cmdDone

db "Well, here we go!",13
db "I've done all 5 levels,",13
db "it's time for the final",13
db "battle right?"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR064YumiEndsequenceannouncepng_Bank 
	defb PicFR064YumiEndsequenceannouncepng_ParentRef  
	defb PicFR064YumiEndsequenceannouncepng_Ref  


	defb cmdSetLevelTime
	defw TimeColorsYumi
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

defb cmdDone
db "I think not!",13
db "there is no way you",13
db "can fight me..."," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "because...",13
db "you see..."," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I...",13
db"AM YOUR FATHER!"," "+&80
db "          "," "+&80
db "          "," "+&80

defb dlgCommand

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR036Chibikovictorconfusedpng_Bank 
	defb PicFR036Chibikovictorconfusedpng_ParentRef  
	defb PicFR036Chibikovictorconfusedpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

defb cmdDone

db "You what?"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR066YumiEndsequenceSmugpng_Bank 
	defb PicFR066YumiEndsequenceSmugpng_ParentRef  
	defb PicFR066YumiEndsequenceSmugpng_Ref  
	
	defb cmdSetLevelTime
	defw TimeColorsYumi
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

defb cmdDone
db " (smug)"," "+&80
db "       "," "+&80
db "       "," "+&80

defb dlgCommand

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR036Chibikovictorconfusedpng_Bank 
	defb PicFR036Chibikovictorconfusedpng_ParentRef  
	defb PicFR036Chibikovictorconfusedpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

defb cmdDone

db "er? What are you",13
db "looking smug for?"," "+&80


defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone

db "you gotta be kidding me?"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "Do I seriously have",13
db "to explain this?"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR036Chibikovictorconfusedpng_Bank 
	defb PicFR036Chibikovictorconfusedpng_ParentRef  
	defb PicFR036Chibikovictorconfusedpng_Ref  
defb cmdDone

db "Uhh... Ok..."," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone
db "Yumi,",13
db "you're EIGHT years old,",13
db "and I'm NINE and a HALF!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db " How the Fuck can you",13
db "be my father!?",13

defb dlgCommand
	defb cmdCls
defb cmdDone

db "If you had spent even one",13
db "nanosecond paying attention",13
db "in either Maths or bioligy",13
db "class you're realise how",13
db "FUCKING STUPID what",13
db "you just said was!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I mean, you didn't",13
db "just go FULL RETARD here,"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "you cranked the retard dial",13
db "up to 11, broke off the knob,",13
db "and called your retard friends",13
db "around for a month long",13
db "retard block party!"," "+&80
defb dlgCommand
	defb cmdCls
defb cmdDone

db "If you had even one atom of",13
db "self respect you'd be so",13
db "ashamed at what you just",13
db "said You'd CUT OFF YOUR",13
db "OWN FUCKING HEAD to save",13
db "yourself from living with",13
db "the shame of how totally",13
db "utterly, completely..."," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR059YumeEndsequenceShrugpng_Bank 
	defb PicFR059YumeEndsequenceShrugpng_ParentRef  
	defb PicFR059YumeEndsequenceShrugpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "I'm sorry to interrupt this",13
db "combo of worlds lamest",13
db "'Star Bores' joke, and epic",13
db "chibiko rant, but can we get",13
db "on with the final battle?"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR085Chibikovictorsmug2png_Bank 
	defb PicFR085Chibikovictorsmug2png_ParentRef  
	defb PicFR085Chibikovictorsmug2png_Ref  
	
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0
defb cmdDone

db "well, if you want,",13
db "but I've already",13
db "whupped both your",13
db "asses several times,",13
db "so I think you'll",13
db "regret it!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR059YumeEndsequenceShrugpng_Bank 
	defb PicFR059YumeEndsequenceShrugpng_ParentRef  
	defb PicFR059YumeEndsequenceShrugpng_Ref  


	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "well... you won't be fighting us!",13
db "We have brought someone with us",13
db "who's wants revenge on you!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR036Chibikovictorconfusedpng_Bank 
	defb PicFR036Chibikovictorconfusedpng_ParentRef  
	defb PicFR036Chibikovictorconfusedpng_Ref  
	
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0
defb cmdDone

db "someone I've pissed off?...",13
db "Well that just narrows it",13
db "down to every life form on",13
db "the plantet!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR060YumeEndsequenceSmugpng_Bank 
	defb PicFR060YumeEndsequenceSmugpng_ParentRef  
	defb PicFR060YumeEndsequenceSmugpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "remember Sakuya?",13
db "who you beat in level 2?",13
db "we've Level-Up'ed her to the",13
db "MAX! and she's rather angry",13
db "with you!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR085Chibikovictorsmug2png_Bank 
	defb PicFR085Chibikovictorsmug2png_ParentRef  
	defb PicFR085Chibikovictorsmug2png_Ref  
	
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0
defb cmdDone

db "Sakuya? yeah right!",13
db "I totally maimed her!",13
db "they're going to need",13
db "more than dental records",13
db "to ID that mess!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR061YumeEndsequenceTheMachinepng_Bank 
	defb PicFR061YumeEndsequenceTheMachinepng_ParentRef  
	defb PicFR061YumeEndsequenceTheMachinepng_Ref  


	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "Nothing is impossible!",13
db "Thanks to Yumi's technology",13
db "and my powers of Alchemy...",13
db "Behold!...",13
db "The Resurrectifier 5000 PRO!"," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone

db "Hey! You totally ripped",13
db "that machine off from",13 
db "L-fin Lied!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR059YumeEndsequenceShrugpng_Bank 
	defb PicFR059YumeEndsequenceShrugpng_ParentRef  
	defb PicFR059YumeEndsequenceShrugpng_Ref  


	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "No, we ripped it off",13
db "from F.E.I.R ..."," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR061YumeEndsequenceTheMachinepng_Bank 
	defb PicFR061YumeEndsequenceTheMachinepng_ParentRef  
	defb PicFR061YumeEndsequenceTheMachinepng_Ref  


	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone


db "but yeah, they ripped",13
db "it off 'L-fin Lied'"," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR062YumeEndsequenceTheMachineEngagepng_Bank 
	defb PicFR062YumeEndsequenceTheMachineEngagepng_ParentRef  
	defb PicFR062YumeEndsequenceTheMachineEngagepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone
db "Behold!",13
db "We brought Sakuya back!",13
db "and now she is IMMORTAL!"," "+&80


;------------------------------Sakuya anim Start -------------------------


defb dlgCommand

	defb cmdcall 	;Command
	defw MusicCspoof

	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone

db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db "        "," "+&80

db "        "," "+&80
db "        "," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR044Footpng_Bank 
	defb PicFR044Footpng_ParentRef  
	defb PicFR044Footpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db "        "," "+&80

db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80


db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80
defb dlgCommand

	defb cmdShowBackground 	;Command
	defb PicFR049Hippng_Bank 
	defb PicFR049Hippng_ParentRef  
	defb PicFR049Hippng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR050Chestpng_Bank 
	defb PicFR050Chestpng_ParentRef  
	defb PicFR050Chestpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR051Wingspng_Bank 
	defb PicFR051Wingspng_ParentRef  
	defb PicFR051Wingspng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR043Facepng_Bank 
	defb PicFR043Facepng_ParentRef  
	defb PicFR043Facepng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR070TitleCardpng_Bank 
	defb PicFR070TitleCardpng_ParentRef  
	defb PicFR070TitleCardpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db " "," "+&80
defb dlgCommand
	defb cmdcall 	;Command
	defw MusicCrestore
defb cmdDone


;------------------------------Sakuya anim end -------------------------




defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR038Chibikovomitpng_Bank 
	defb PicFR038Chibikovomitpng_ParentRef  
	defb PicFR038Chibikovomitpng_Ref  
defb cmdDone

db "JESUS FUCKING CHRIST!",13
db "That is disgusting!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I just threw up in",13
db "my mouth ...",13
db "How???    ",13
db "I don't even eat!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR044Footpng_Bank 
	defb PicFR044Footpng_ParentRef  
	defb PicFR044Footpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuyaChibiko
	defb 0


	defb cmdLocate	;Command
	defb 2 		;font
	defb 20,0	;x,y
	defb 5		;timer


defb cmdDone
;   01234567890012345678900123456789001234567890
db "                 I mean...",13
db "      what the FUCK have you done?",13
db "           She is a TOTAL mess"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR049Hippng_Bank 
	defb PicFR049Hippng_ParentRef  
	defb PicFR049Hippng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuyaChibiko
	defb 0
defb cmdDone
;   01234567890012345678900123456789001234567890
db "and what's that nasty green shit leaking",13
db "  out of...        well everywhere!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR050Chestpng_Bank 
	defb PicFR050Chestpng_ParentRef  
	defb PicFR050Chestpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuyaYume
	defb 0


defb cmdDone
;   01234567890012345678900123456789001234567890
db "                  Well..",13
db "    I'll admit it wasn't a 100% sucess...",13
db "    and I say Immortal, not Invincible!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR051Wingspng_Bank 
	defb PicFR051Wingspng_ParentRef  
	defb PicFR051Wingspng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuyaChibiko
	defb 0


defb cmdDone


;   01234567890012345678900123456789001234567890
db "          it wasn't a 1% success!         ",13
db "   And whats all those shards of metal",13
db "        sticking out of her body?"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR059YumeEndsequenceShrugpng_Bank 
	defb PicFR059YumeEndsequenceShrugpng_ParentRef  
	defb PicFR059YumeEndsequenceShrugpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "Now, she did that herself!...",13
db "                             ",13
db "Actually I think being brought",13
db "back to life as a rotting living",13
db "corpse has caused her some mental",13
db "problems!"," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone

db "Ya think?                     ",13
db "No Fucking Shit Sherlock!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone


db "I have to say,",13
db "in the long history of",13
db "'yuusha twins' fuckups,",13
db "I think this one takes",13
db "the fucktard biscuit!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR043Facepng_Bank 
	defb PicFR043Facepng_ParentRef  
	defb PicFR043Facepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "Chibiko! you Mother Fucker!",13
db "You think you can Just kill ME",13
db "and get away with it?"," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone

db "Now you watch your lanugage!",13
db "there may be minors playing",13
db "this game!"," "+&80

defb dlgCommand

	defb cmdLocate	;Command
	defb 2 		;font
	defb 20,0	;x,y
	defb 5		;timer

defb cmdDone
;   01234567890123456789012345678901234567890
db "           Developers note:",13
db "       There had better not be!",13
db "          This game is R-18!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR043Facepng_Bank 
	defb PicFR043Facepng_ParentRef  
	defb PicFR043Facepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone



defb dlgCommand
	defb cmdCall
	defw callCallChibikoOnlyBranch		:ChibikoOnlyBranchToggle_Plus2

;	defb cmdCls
defb cmdDone

db "You are a maggot compared to me!",13
db "I am the savior of mankind!",13
db "I will crush you and save humanity!"," "+&80





defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone

db "What the fuck are you talking about?",13
db "your brains must be as rotten",13
db "As the rest of you!                ",13
db "Hey !Are you even listening to me?"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR042SakuyaEyeGougepng_Bank 
	defb PicFR042SakuyaEyeGougepng_ParentRef  
	defb PicFR042SakuyaEyeGougepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "H-E-Y, Bocha-n...     ",13
db "You have such nice sparkly eyes!"," "+&80
defb dlgCommand
	defb cmdCls
defb cmdDone
db "You could lend one to little me,",13
db "couldn't you?"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone


db "I mean, you don't need both do you?",13
db "won't you give one to me?"," "+&80


defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR035Chibikovictorangrypng_Bank 
	defb PicFR035Chibikovictorangrypng_ParentRef  
	defb PicFR035Chibikovictorangrypng_Ref  
defb cmdDone

db "Get your filthy fucking fingers",13
db "OUT of my brothers eye socket!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR045SakuyaFurypng_Bank 
	defb PicFR045SakuyaFurypng_ParentRef  
	defb PicFR045SakuyaFurypng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "You mind your own fucking business!",13
db "You stupid Little bag of rancid shit!"," "+&80



defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR025Chibikoburningrage2framespng_Bank 
	defb PicFR025Chibikoburningrage2framespng_ParentRef  
	defb PicFR025Chibikoburningrage2framespng_Ref  
defb cmdDone



db "You think you can talk to",13,"me like that?",13
db "You watch your fucking mouth!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I hope Yume was right about you",13
db "being immortal, because now I'm",13
db "going to enjoy this!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "One thousand years after I finish",13
db "scortching the infestation of",13
db "stupidity from the planet",13
db "I'm still going to have just",13
db "started going to work torturing you!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "You're going to spend eternity",13
db "begging me to kill you to save",13
db "you from the endless misery",13
db "you'll come to call your existance!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR047Sakuyajokingpng_Bank 
	defb PicFR047Sakuyajokingpng_ParentRef  
	defb PicFR047Sakuyajokingpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone


db "Ooh Chibiko!",13
db "you're so fiesty, buy you can't ",13
db "There's no way you can beat me",13
db "I'm a BIGGER enemy than you think!",13
db "And once your dead... I can start my",13
db "Modelling career!"," "+&80


defb dlgCommand
	defb cmdSetLevelTime
	defw FadeOut
	defb 55

	defb cmdCall
	defw EndofDialog
defb cmdDone
db "     "," "+&80
db 0

DialogChibikoOnlyBranch:
defb cmdDone
db " "+&80


;defb dlgCommand
;	defb cmdCls
;defb cmdDone
;

db "I'm going to rip you to fucking",13
db "shreads you syphalitic little leech"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I'm going to tear the life out of you,",13
db "and then I'm going skin your corpse!"," "+&80





defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR025Chibikoburningrage2framespng_Bank 
	defb PicFR025Chibikoburningrage2framespng_ParentRef  
	defb PicFR025Chibikoburningrage2framespng_Ref  
defb cmdDone



db "Do you have any idea who you're",13
db "fucking with? I'm the biggest",13
db "cause of premature death on this",13
db "continent!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I hope Yume was right about you",13
db "being immortal!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

;db "One thousand years after I finish",13
;db "scortching the infestation of",13
;db "stupidity from the planet",13
;db "I'm still going to have just",13
;db "started going to work torturing you!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "You're going to wish you could die",13
db "to save you from the infinite",13
db "kaliedoscope of suffering",13
db "I'm going to inflict on you!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR047Sakuyajokingpng_Bank 
	defb PicFR047Sakuyajokingpng_ParentRef  
	defb PicFR047Sakuyajokingpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone


db "aww Chibiko!",13
db "don't frown, you'll crease up your",13
db "face... And I'm thinking your",13
db "lifeless decapitated head will look",13
db "good on on the wall of my bedroom!"," "+&80



defb dlgCommand
	defb cmdSetLevelTime
	defw FadeOut
	defb 55

	defb cmdCall
	defw EndofDialog
defb cmdDone
db "     "," "+&80
db 0



;-------------------------------------------------------------

DialogScriptBochan:
;; Dirty init
;	db " "+&80
;	defb dlgCommand
;	defb cmdSetLevelTime
;	defw TimeColorsNarrator
;	defb 0
;	defb cmdDone
;	db " "+&80
;; Dirty init

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR052screenfakeendpng_Bank 
	defb PicFR052screenfakeendpng_ParentRef  
	defb PicFR052screenfakeendpng_Ref  


	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0
defb cmdDone


db "            ",13
db "            ",13
db "            "," "+&80

db "            ",13
db "            ",13
db "            "," "+&80

db "            ",13
db "            ",13
db "            "," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR008BochanendsequenceNOpng_Bank 
	defb PicFR008BochanendsequenceNOpng_ParentRef  
	defb PicFR008BochanendsequenceNOpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone

db "Do what?...",13
db "           ",13
db "NO! I'm not",13
db "doing that!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR065YumiEndsequencechallengepng_Bank 
	defb PicFR065YumiEndsequencechallengepng_ParentRef  
	defb PicFR065YumiEndsequencechallengepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumi
	defb 0
defb cmdDone

db "You must!",13
db "              ",13
db "It's the way",13
db "of things!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR008BochanendsequenceNOpng_Bank 
	defb PicFR008BochanendsequenceNOpng_ParentRef  
	defb PicFR008BochanendsequenceNOpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone

db "It's dumb!",13
db "and this game is",13
db "boring already!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR065YumiEndsequencechallengepng_Bank 
	defb PicFR065YumiEndsequencechallengepng_ParentRef  
	defb PicFR065YumiEndsequencechallengepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumi
	defb 0
defb cmdDone

db "But the developers didn't",13
db "make enough levels...",13
db "so you have to play the",13
db "whole game again."," "+&80



defb dlgCommand
	defb cmdCls
defb cmdDone


db "And get all the big Diamonds...",13
db "And get 100% on each level...",13
db "And buy all the DLC...",13
db "And cut town the tallest tree",13
db "in the forest...  with a herring!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR008BochanendsequenceNOpng_Bank 
	defb PicFR008BochanendsequenceNOpng_ParentRef  
	defb PicFR008BochanendsequenceNOpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone

db "Well I'm not",13
db "doing it!",13
db "So there!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR084YumiEndsequenceconfusedpng_Bank 
	defb PicFR084YumiEndsequenceconfusedpng_ParentRef  
	defb PicFR084YumiEndsequenceconfusedpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumi
	defb 0
defb cmdDone

db "But the players not",13
db "spent enough credits yet,",13
db "and the developer has to",13
db "pay the rent soon!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR008BochanendsequenceNOpng_Bank 
	defb PicFR008BochanendsequenceNOpng_ParentRef  
	defb PicFR008BochanendsequenceNOpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone

db "Er, this isn't an",13
db "arcade game",13
db "it's consumer soft",13
db "the credits aren't",13
db "real!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR084YumiEndsequenceconfusedpng_Bank 
	defb PicFR084YumiEndsequenceconfusedpng_ParentRef  
	defb PicFR084YumiEndsequenceconfusedpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumi
	defb 0
defb cmdDone

db "Hmm,That's a good point...        ",13
db "just a moment...                  ",13
db "I shall have to consult my sister!"," "+&80

defb dlgCommand

	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiDialog
	defb 0

	defb cmdCall
	defw SetJustCls

	defb cmdCls
defb cmdDone
     ;1234567890123456789012345678901234567890
db   "            Mumble mumble"," "+&80

defb dlgCommand

	defb cmdLocate	;Command
	defb 2		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0


	defb cmdCls
defb cmdDone
     ;1234567890123456789012345678901234567890
db   "  I told you he wouldn't fall for it!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone
     ;1234567890123456789012345678901234567890
db   "     I know he's stupid, but damn!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone
     ;1234567890123456789012345678901234567890
db   " Get out of here - let me finish this!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR059YumeEndsequenceShrugpng_Bank 
	defb PicFR059YumeEndsequenceShrugpng_ParentRef  
	defb PicFR059YumeEndsequenceShrugpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "Well, Sorry about that interlude!",13
db "           ",13
db "pay no attention to the hero behind",13
db "the curtain"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "I'm back, and I've brought a 'friend'",13
db "of yours who's just DIEing to meet",13
db "you!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR006Bochanendsequenceconfusedpng_Bank 
	defb PicFR006Bochanendsequenceconfusedpng_ParentRef  
	defb PicFR006Bochanendsequenceconfusedpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone
db "But, I don't have",13
db "any friends :-(",13

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR060YumeEndsequenceSmugpng_Bank 
	defb PicFR060YumeEndsequenceSmugpng_ParentRef  
	defb PicFR060YumeEndsequenceSmugpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "That was sarcasm! Idiot... ",13
db "Anyway, we've brought Sakuya back,",13
db "and this time she'll definately beat",13
db "you cos we've totally powered her up","!"+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR006Bochanendsequenceconfusedpng_Bank 
	defb PicFR006Bochanendsequenceconfusedpng_ParentRef  
	defb PicFR006Bochanendsequenceconfusedpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,21	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone

db "Sakuya, the",13
db "annoying cosplay",13
db "girl who can't",13
db "sing?",13
db "Didn't she die",13
db "in level 2?"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR060YumeEndsequenceSmugpng_Bank 
	defb PicFR060YumeEndsequenceSmugpng_ParentRef  
	defb PicFR060YumeEndsequenceSmugpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone
db "I don't think she's going to like",13
db "you saying she can't sing!" ," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR061YumeEndsequenceTheMachinepng_Bank 
	defb PicFR061YumeEndsequenceTheMachinepng_ParentRef  
	defb PicFR061YumeEndsequenceTheMachinepng_Ref  


	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone


db "And now, Thansks to Yumi and my",13
db "awesome powers, Just being dead",13
db "is no problem!"," "+&80




defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR062YumeEndsequenceTheMachineEngagepng_Bank 
	defb PicFR062YumeEndsequenceTheMachineEngagepng_ParentRef  
	defb PicFR062YumeEndsequenceTheMachineEngagepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0


	defb cmdCall
	defw TurnSpeedSpaceOff
defb cmdDone

db "Behold! We have",13
db "brought her back from the dead!",13
db "and now she's Immortal!"," "+&80


;------------------------------Sakuya anim Start -------------------------


defb dlgCommand

	defb cmdcall 	;Command
	defw MusicCspoof

	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone

db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db "        "," "+&80

db "        "," "+&80
db "        "," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR044Footpng_Bank 
	defb PicFR044Footpng_ParentRef  
	defb PicFR044Footpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db "        "," "+&80

db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80


db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80
defb dlgCommand

	defb cmdShowBackground 	;Command
	defb PicFR049Hippng_Bank 
	defb PicFR049Hippng_ParentRef  
	defb PicFR049Hippng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR050Chestpng_Bank 
	defb PicFR050Chestpng_ParentRef  
	defb PicFR050Chestpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR051Wingspng_Bank 
	defb PicFR051Wingspng_ParentRef  
	defb PicFR051Wingspng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR043Facepng_Bank 
	defb PicFR043Facepng_ParentRef  
	defb PicFR043Facepng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR070TitleCardpng_Bank 
	defb PicFR070TitleCardpng_ParentRef  
	defb PicFR070TitleCardpng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "        "," "+&80
db "        "," "+&80
db "        "," "+&80
db " "," "+&80
defb dlgCommand
	defb cmdcall 	;Command
	defw MusicCrestore
defb cmdDone


;------------------------------Sakuya anim end -------------------------



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR008BochanendsequenceNOpng_Bank 
	defb PicFR008BochanendsequenceNOpng_ParentRef  
	defb PicFR008BochanendsequenceNOpng_Ref  
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer
	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0


	defb cmdCall
	defw TurnSpeedSpaceOn
defb cmdDone

db "er, She's a bit messed up!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR058YumeEndsequencedejectedpng_Bank 
	defb PicFR058YumeEndsequencedejectedpng_ParentRef  
	defb PicFR058YumeEndsequencedejectedpng_Ref  
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer
	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "Yeah, I know...I did the",13
db "best I could! Ressurecting",13
db "people from the dead and",13
db "turning them into superbeings",13
db "isn't easy you know!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone

db "Especially when there's pakurimon",13
db "on half way through the procedure",13
db "and you.. um.. get destracted and",13
db "forget about finishing it until",13
db "the next day and all the",13
db "ingredients have gone kinda soggy"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR007Bochanendsequencesmilepng_Bank 
	defb PicFR007Bochanendsequencesmilepng_ParentRef  
	defb PicFR007Bochanendsequencesmilepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone

db "It's still a good effort!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR058YumeEndsequencedejectedpng_Bank 
	defb PicFR058YumeEndsequencedejectedpng_ParentRef  
	defb PicFR058YumeEndsequencedejectedpng_Ref  
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer
	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone

db "You think so?"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR007Bochanendsequencesmilepng_Bank 
	defb PicFR007Bochanendsequencesmilepng_ParentRef  
	defb PicFR007Bochanendsequencesmilepng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone
db "Yeah!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR058YumeEndsequencedejectedpng_Bank 
	defb PicFR058YumeEndsequencedejectedpng_ParentRef  
	defb PicFR058YumeEndsequencedejectedpng_Ref  
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer
	defb cmdSetLevelTime
	defw TimeColorsYume
	defb 0
defb cmdDone


db "Thanks!",13
db "I try my best,",13
db "but it's hard, and my pocket money",13
db "doesn't stretch far enough to..."," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR045SakuyaFurypng_Bank 
	defb PicFR045SakuyaFurypng_ParentRef  
	defb PicFR045SakuyaFurypng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "Would you two fucking annoying brats",13
db "shut your putrid whining mouths before",13
db "I rip out your spinal columns and use",13
db "them to beat you both to death!"," "+&80



defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR009Bochanendsequenceshockpng_Bank 
	defb PicFR009Bochanendsequenceshockpng_ParentRef  
	defb PicFR009Bochanendsequenceshockpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone



db "Whoa! you really powered up her ego!",13
db "she's now far more annoying!"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR045SakuyaFurypng_Bank 
	defb PicFR045SakuyaFurypng_ParentRef  
	defb PicFR045SakuyaFurypng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone

db "How dare you speak to ME like that,",13
db "You pitiful shit for brains fool!",13
db "I'm going to take great pleasure in",13
db "vivisecting your pathetic corpse",13
db "and harvesting your organs!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR009Bochanendsequenceshockpng_Bank 
	defb PicFR009Bochanendsequenceshockpng_ParentRef  
	defb PicFR009Bochanendsequenceshockpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0
defb cmdDone
db "You're very rude!",13
db "And I'm going to have to shut",13
db "you up!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR048SakuyaSmackpng_Bank 
	defb PicFR048SakuyaSmackpng_ParentRef  
	defb PicFR048SakuyaSmackpng_Ref  
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,11	;x,y
	defb 5		;timer
	defb cmdSetLevelTime
	defw TimeColorsSakuya
	defb 0
defb cmdDone
db "My my! Such threats!",13
db "What a naughty boy!",13
db "    ",13
db "I think I'm going to have",13
db "to give you a spanking!"," "+&80
defb dlgCommand
	defb cmdCls
defb cmdDone
db "And I assure you!",13
db "It's going to hurt you more",13
db "than it hurts me!"," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw FadeOut
	defb 55

	defb cmdCall
	defw EndofDialog
defb cmdDone
db "     "," "+&80
db 0






callCallChibikoOnlyBranch:
	ld bc,DialogChibikoOnlyBranch-1
ret

EndofDialog:
	ld hl,null
	ld (ShowDialogCall_Plus2-2),hl
	ld (ShowDialogCallB_Plus2-2),hl
ret




dlgCommand equ 12
cmdLocate equ 1
cmdShowBackground equ 2
cmdDone equ 0
cmdCls equ 3
cmdCall equ 4
cmdSetLevelTime equ 5
cmdSetDelay equ 6
;13 =newline
;11 =player 3 walk out in a huff
;10 =end of prebattle speech
;12 = Command!
;14 =Special
;9 = new caption
;8 = new caption +stop enenmy speech anim
;1 = Chibiko
;2 = Bochan
;3 = Enemy
;4 = Achievement
;5 = Boss



ShowDialog:
	ld a,5 :OnscreenTimer_Plus1
	or a
	ret z



	call Akuyou_Timer_GetTimer	;ld a,(Timer_TicksOccured)
	or a
	ret z	; see if game is paused (TicksOccurred = 0 )


;InteractiveInsultsText_StartText
	;ld hl,&C000
	;call Akuyou_ShowSprite_SetBankAddr
	
	ld a,1	:OnscreenFont_Plus1
	call Akuyou_SpriteBank_Font	;Remember - This now corrupts BC!

	ld bc,DialogScript :OnscreenTextPointer_Plus2
	ld a,(bc)
	cp dlgCommand
	jp z,DialogCommandStart


	ld hl,&0f01   :OnscreenPosition_Plus2
	ld a,1:InsultCharNum_Plus1
	ld i,a	; show up to 255 chars
	
InteractiveInsultsText_MoreText:
	push hl
		call Akuyou_DrawText_LocateSprite4CR

		call Akuyou_DrawText_PrintString
	pop hl
	inc l
	inc l
	inc l
	ld a,i
	dec a
	inc bc
	jp nz,InteractiveInsultsText_MoreText
	dec bc
	ld a,(bc)
	and %01111111
	cp 33
	jp c,InteractiveInsultsText_NotActualChar

	push bc
		call Akuyou_GetSpriteXY
		call ClearChar
	pop bc
InteractiveInsultsText_NotActualChar:
	inc bc
	ld a,(bc)
	or a
	jp z,InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
	cp dlgCommand
	jp z,DialogCommandStart
	cp ' ' 
	jp z,SpeedSpace	:SpeedSpaceJump_Plus2
SpeedSpaceOff:
	ld a,(InsultCharNum_Plus1-1)
	add 1 :TextSpeedUp_Plus1
InteractiveInsultsTextNoSpeedup:
	ld (InsultCharNum_Plus1-1),a

ret
SpeedSpace:
	ld a,(InsultCharNum_Plus1-1)
	ld d,a
SpeedSpaceAgain:
	inc bc
	inc d
	ld a,(bc)
	cp ' ' 
	jr z,SpeedSpaceAgain
	ld a,d
jr InteractiveInsultsTextNoSpeedup




TurnSpeedSpaceOn:
	ld hl,SpeedSpace
	ld (SpeedSpaceJump_Plus2-2),hl
ret
TurnSpeedSpaceOff:
	ld hl,SpeedSpaceOff
	ld (SpeedSpaceJump_Plus2-2),hl
ret

InteractiveInsultsText_Abandontext:
	xor a
	ld (OnscreenTimer_Plus1-1),a
	ret

InteractiveInsultsText_AllOnscreen:
	ld a,(OnscreenTimer_Plus1-1)
	dec a
	ld (OnscreenTimer_Plus1-1),a
	or a
	ret nz
	ld (OnscreenTimer_Plus1-1),a
;	ld a,InsultText2End-InsultText2-20
	ld a,1
	ld (InsultCharNum_Plus1-1),a
ret

TurnCLSoff:
	ld hl,null
	ld (ClearScreencls_Plus2-2),hl
ret
TurnCLSon:
	ld hl,Clear4000 
	ld (ClearScreencls_Plus2-2),hl
ret




DialogCommandStart:
	ld a,10:OnscreenTimerB_Plus1
	dec a
	ld (OnscreenTimerB_Plus1-1),a
	or a
	ret nz

DialogCommand:
;
;Do magic stuff!
inc bc
ld a,(bc)
cp cmdLocate  
jr z,DialogCommand_Relocate
cp cmdDone
jp z,DialogCommand_Done
cp cmdShowBackground 
jr z,DialogCommand_ShowBackground
cp cmdCls
jp z,DialogCommand_Cls
cp cmdCall 
jp z,DialogCommand_Call
cp cmdSetLevelTime
jp z,DialogCommand_SetLevelTime
cp cmdSetDelay
jp z,DialogCommand_SetDelay

DialogCommand_Relocate:
	inc bc
	ld a,(bc)
	ld (OnscreenFont_Plus1-1),a

	inc bc
	ld a,(bc)
	ld l,a
	inc bc
	ld a,(bc)
	ld h,a
	ld (OnscreenPosition_Plus2-2),hl
DialogCommand_SetDelay:
	inc bc
	ld a,(bc)
	ld (OnscreenTimerB_Plus1-1),a
	ld (OnscreenTimerC_Plus1-1),a
	jp DialogCommand
DialogCommand_SetLevelTime:
	inc bc
	ld a,(bc)
	ld l,a
	inc bc
	ld a,(bc)
	ld h,a
	inc bc
	ld a,(bc)
	call Akuyou_SetLevelTime

	ld hl,Akuyou_Event_Stream_ForceNow
	ld (ProcessCommand_Plus2-2),hl
	jp DialogCommand
DialogCommand_Call:
	ld hl,DialogCommand
	push hl			;Return to DialogCommand
	inc bc
	ld a,(bc)
	ld l,a
	inc bc
	ld a,(bc)
	ld h,a
	push hl 
	ret  ;Return to HL
SetJustCls:
	ld hl,null
	ld (ClearScreenPointb_Plus2-2),hl
	ld (ClearScreenPointc_Plus2-2),hl
	ld hl,Clear4000 
	ld (ClearScreencls_Plus2-2),hl
ret
DialogCommand_Cls:
	ld hl,DrawABackgroundFrame
	ld (ClearScreenPoint_Plus2-2),hl
	jp DialogCommand

DialogCommand_ShowBackground:

	ld hl,DrawABackgroundFrame
	ld (ClearScreenPoint_Plus2-2),hl


	ld hl,null
	ld (ClearScreenPointb_Plus2-2),hl
	ld (ClearScreenPointc_Plus2-2),hl
	
	inc bc
	ld a,(bc)
	ld (NeededBank_Plus1-1),a

	inc bc
	ld a,(bc)
	cp 255
	jp z,DialogCommand_ShowBackground_Skip1
	ld h,&80
	ld l,a
	ld (ClearScreenPointb_Plus2-2),hl
DialogCommand_ShowBackground_Skip1:
	inc bc
	ld a,(bc)
	cp 255
	jp z,DialogCommand_ShowBackground_Skip2
	ld h,&80
	ld l,a
	ld (ClearScreenPointc_Plus2-2),hl
DialogCommand_ShowBackground_Skip2:
	jp DialogCommand


DialogCommand_Done:
	inc bc
	ld (OnscreenTextPointer_Plus2-2),bc






	ld a,1
	ld (InsultCharNum_Plus1-1),a

	ld a,5 :OnscreenTimerC_Plus1
	ld (OnscreenTimerB_Plus1-1),a
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


RasterColorsSetPalette1:
	ld a,1
	ld bc,RasterColors_ColorArray1
	ld de,RasterColors_ColorArray2
	ld hl,RasterColors_ColorArray3
	ld ix,RasterColors_ColorArray4
	ld iy,null;PaletteSwitcher
jp Akuyou_RasterColors_SetPointers

PaletteSwitcher:
	ld a,0:PaletteNo_Plus1
	cpl	
	ld (PaletteNo_Plus1-1),a
	or a
	jp nz,RasterColorsSetPalette1
RasterColorsSetPalette2:
	ld a,1
	ld bc,RasterColors_ColorArray1Alt
	ld de,RasterColors_ColorArray2Alt
	ld hl,RasterColors_ColorArray3Alt
	ld ix,RasterColors_ColorArray4Alt
	ld iy,PaletteSwitcher
jp Akuyou_RasterColors_SetPointers





DoClear4000:
	push hl
	ld hl,Clear4000
	ld (ClearScreenPoint_Plus2-2),hl
	pop hl
ret

Clear4000:

	push hl
	push bc
	push de
		

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
		ld l,0	
		ld de,&3FCF+1;&4000-64
		add hl,de
		ld b,255 ;effectively 256
		ld de,&0000

		call SpFill
		ld d,h
		ld e,l
		inc hl
		ld bc,&11
		lddr
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
null:ret

ClearChar:

;		ld a,l
;		add a
;		add a
;		add a
;		ld c,a
;		ld a,h
;		add a
;		ld b,a
		
;		ld bc,&0408
		call Akuyou_GetMemPos
		ld b,8

ClearCharMoreLines:
		ld (hl),0
;		inc hl
;		ld (hl),0
;		dec hl
		call Akuyou_ScreenBuffer_GetNxtLin
		djnz ClearCharMoreLines
ret

DoMusicCspoof:
	ld de,MusicBakCspoofdata
	ld bc,512
	ld hl,&50
	ldir
	ld hl,MusicCspoofdata
	ld bc,512
	ld de,&50
	ldir
	call Akuyou_Music_Restart
	ld hl,null
	ld (MusicSwitcher_Plus2-2),hl
ret

DoMusicRestore:
	ld hl,MusicBakCspoofdata
	ld bc,512
	ld de,&50
	ldir
	call Akuyou_Music_Restart
	ld hl,null
	ld (MusicSwitcher_Plus2-2),hl
ret



align 256,0
MusicCspoofdata:
incbin "Music\Cspoof.bin"

align 256,0
MusicBakCspoofdata:
defs 512,0

org LevelOrigin+ &3ff0

jp LevelInit; - Level Start &3ff0
jp LevelLoop; - Level loop &3ff3
;jp null     ; - Level resume &3ff6
;jp null     ; - Level Shutdown &3ff9





;save direct "T38-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]
save "lz48\T38-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


