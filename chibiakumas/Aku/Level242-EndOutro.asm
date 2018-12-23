;Debug_ShowLevelTime equ 1


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
read "SpriteCompiler\ep2_Outro.asm"









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

TimeColorsDonate:
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


TimeColorsYumiYume:
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
TimeColorsBochanSplat:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&47,&59,&40	

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

TimeColorsChibikoSplat:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&59,&4B	

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

TimeColorsChibikoEnd:
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
	defb 1
	defb 64			
	defb &54,&4C,&4D,&4B		

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


TimeColorsYumiYumeSplat:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&47,&59,&4B	

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
TimeColorsYellow:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &5C,&4E,&4A,&4B
;	defb &4B,&4A,&5C,&4E

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

	ld hl,	&0004			;load menu
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
	ld (ScreenDE_Plus2-2),hl
	ld a,&C0
	call ScreenPosReset
;DetectedContinue

;	call RestoreMusic

	ret
	jp RasterColorsSetPalette1

align 256
Banks256k:
defb &CC,&CD,&CE,&CF,&D4,&D5,&D6,&D7

load256k:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db "Please Wait, Loading 256K Sprites..","."+&80
db 0

Do256kLoad:
		ld c,4	;disk
		ld de,&4000
		ld ix,&7FFF
		call Akuyou_LoadDiscSectorz
ret

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


	ld hl,TwoPlayerBranch-1
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SetInsults
	ld hl,DialogBochanOnlyBranch-1
	ld a,(iy+9)
	or a
	jr z,SetInsults
	ld hl,DialogChibikoOnlyBranch-1
SetInsults:
	ld (DoPlayerBranch_Plus2-2),hl


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

		ld hl,DiskMap_Outro_Screens_Bank0
		ld a,&CC
		call Do256kLoad

		ld hl,DiskMap_Outro_Screens_Bank1
		ld a,&CD
		call Do256kLoad

		ld hl,DiskMap_Outro_Screens_Bank2
		ld a,&CE
		call Do256kLoad

		ld hl,DiskMap_Outro_Screens_Bank3
		ld a,&CF
		call Do256kLoad

		ld hl,DiskMap_Outro_Screens_Bank4
		ld a,&D4
		call Do256kLoad

		ld hl,DiskMap_Outro_Screens_Bank5
		ld a,&D5
		call Do256kLoad


		di
		call Akuyou_Firmware_kill
		call clear4000
		call Akuyou_RasterColors_Init


	ld hl,DrawABackgroundFrame256k
	ld (BackgroundBankHandler_Plus2-2),hl




systemis128k:

	;Outro special!
	call Akuyou_ScreenBuffer_Reset
	ld (ScreenDE_Plus2-2),hl
	ld a,&C0
	call ScreenPosReset

LevelLoop:

	call null :ClearScreenPoint_Plus2 ;Clear4000
	ld hl,null
	ld (ClearScreenPoint_Plus2-2),hl


	ei;disable me

	call Akuyou_Timer_UpdateTimer
	halt


	call ShowDialog	:ShowDialogCall_Plus2
	call ShowDialog	:ShowDialogCallb_Plus2

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
	jp DoPause :Delayer_Plus2

EndAnimFrame1:
	halt
	ld de,&0000:ScreenDE_Plus2
	call &8003
	ld hl,EndAnimFrame2
	ld (Delayer_Plus2-2),hl
	jp PauseLoopBskip

EndAnimFrame2:
	halt
	ld hl,EndAnimFrame3
	ld (Delayer_Plus2-2),hl
	jp PauseLoopBskip

EndAnimFrame3:
	halt
	ld de,(ScreenDE_Plus2-2)
	call &8006
	ld hl,EndAnimFrame4
	ld (Delayer_Plus2-2),hl
	jp PauseLoopBskip

EndAnimFrame4:
	halt
	ld hl,EndAnimFrame1
	ld (Delayer_Plus2-2),hl
	jp PauseLoopBskip

DoPause:
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
	ld hl,DiskMap_Outro_Screens_Bank0
	cp 0 
	jp z,DrawABackgroundFrame_StartLoad


;	ld de,Akuyou_LoadDiscSector
	ld hl,DiskMap_Outro_Screens_Bank1
	cp 1
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Outro_Screens_Bank2
	cp 2
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Outro_Screens_Bank3
	cp 3
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Outro_Screens_Bank4
	cp 4
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Outro_Screens_Bank5
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
	ld c,4	;disk
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
	defw TimeColorsSakuya
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR079SakuyaExplode1png_Bank 
	defb PicFR079SakuyaExplode1png_ParentRef  
	defb PicFR079SakuyaExplode1png_Ref  

defb cmdDone


db "         "," "+&80
db "         "," "+&80


defb dlgCommand

	defb cmdShowBackground 	;Command
	defb PicFR080SakuyaExplode2png_Bank 
	defb PicFR080SakuyaExplode2png_ParentRef  
	defb PicFR080SakuyaExplode2png_Ref  

defb cmdDone


db "         "," "+&80
db "         "," "+&80

defb dlgCommand

	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,17	;x,y
	defb 5		;timer

	defb cmdCall
	defw SetJustCls

	defb cmdCls
defb cmdDone
db "(Splat!)"," "+&80
defb dlgCommand

	defb cmdCall	
	defw CallChibikoOnlyBranch
TwoPlayerBranch:

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkpng_Bank 
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkpng_ParentRef  
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkpng_Ref  

defb cmdDone

db "HA! Take that losers!",13
db "I am so awesome!",13
db "So much for 'Immortal",13
db "Sakuya'!"," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone

db "Well, I think we",13,"can conclusively",13
db "say I beat you!",13
db "Now clear this",13,"mess up!"," "+&80

defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYumeSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR067yumiandyumeendsequencegunkpng_Bank 
	defb PicFR067yumiandyumeendsequencegunkpng_ParentRef  
	defb PicFR067yumiandyumeendsequencegunkpng_Ref  

defb cmdDone

db "Aarg!",13
db "get me the disinfectant,",13
db "there's gunk in my ear!"," "+&80

defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 11,12	;x,y
	defb 5		;timer
defb cmdDone

db "I cannot move!",13


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkpng_Bank 
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkpng_ParentRef  
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkpng_Ref  

defb cmdDone
db "Yeah!",13
db "You deserve all that",13
db "nasty shit!",13
db "I bet you wish that",13
db "was 'shaving foam'"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "That will teach you",13
db "two 'extras!', Since I'm",13
db "the main character,",13
db "there's hardly any",13
db "on me!"," "+&80



defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR068yumiandyumeendsequenceleavepng_Bank 
	defb PicFR068yumiandyumeendsequenceleavepng_ParentRef  
	defb PicFR068yumiandyumeendsequenceleavepng_Ref  

defb cmdDone



db "Come on Yumi,",13
db "lets go!",13
db "we'll take a bath,",13
db "and start making",13
db "new creatures for",13
db "our next battle!"," "+&80
defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

defb cmdDone

db "Yes!",13
db "Do not think you've",13 
db "heard the last of",13
db "this!"," "+&80
defb dlgCommand
	defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

defb cmdDone

db "Yeah!",13
db "we'll be back",13
db "for a rematch",13
db "next weekend!"," "+&80
defb dlgCommand
	defb cmdCls
defb cmdDone

defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR069yumiandyumeendsequenceleavequestionpng_Bank 
	defb PicFR069yumiandyumeendsequenceleavequestionpng_ParentRef  
	defb PicFR069yumiandyumeendsequenceleavequestionpng_Ref  

defb cmdDone


db "I mean...",13
db "we can come right?"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR022ChibikoandbochanendsequenceChibikosurprisepng_Bank 
	defb PicFR022ChibikoandbochanendsequenceChibikosurprisepng_ParentRef  
	defb PicFR022ChibikoandbochanendsequenceChibikosurprisepng_Ref  

defb cmdDone
db "Um, well I guess so...",13
db "it's not like anyone else",13
db "comes to visit."," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone

db "Damn! why can't I get",13
db "any proper friends?"," "+&80
defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 10,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR021ChibikoandbochanendsequenceBochanshrugpng_Bank 
	defb PicFR021ChibikoandbochanendsequenceBochanshrugpng_ParentRef  
	defb PicFR021ChibikoandbochanendsequenceBochanshrugpng_Ref  

defb cmdDone
db "I wonder!!!!"," "+&80


;-------------------------------------------------------------

;DialogScript
; Dirty init
;	db " "+&80
;	defb dlgCommand
;	defb cmdSetLevelTime
;	defw TimeColorsChibikoEnd
;	defb 0
;	defb cmdDone
;	db " "+&80
;; Dirty init






defb dlgCommand


DialogThanksForPlayingBranch:

	defb cmdLocate	;Command
	defb 2 		;font
	defb 15,0	;x,y
	defb 5		;timer

	defb cmdCall
	defw TurnSpeedSpaceOn



	defb cmdSetLevelTime
	defw TimeColorsChibikoEnd
	defb 0

	defb cmdShowBackground 	;Command
	defb PicThanksForPlaying1png_Bank 
	defb PicThanksForPlaying1png_ParentRef  
	defb PicThanksForPlaying1png_Ref  

defb cmdDone
defb " "," "+&80
defb dlgCommand
	defb cmdCall
	defw DoWave
defb cmdDone

db "   Thanks for playing Chibi Akumas!",13
db "",13
db "   it took a total of 16 months of",13
db "  daily work to make Episode 1 & 2",13
db "    If you enjoyed them please",13
db " help spread the word and tell others",13
db "          about my games!"," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone
;   1234567890123456789012345678901234567890
db "    The Chibi Akumas will return if",13
db "         people want them to!",13
db "   so please support my development",13
db "     and retro gaming in general",13
db " "," "+&80
db " "," "+&80

defb dlgCommand
	defb cmdCls
defb cmdDone


db "      Thanks again for playing.",13
db " So long, and thanks for all the fish!",13
db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80


defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBlueout
	defb 0
defb cmdDone
db " "," "+&80
defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBlackout
	defb 0
	defb cmdcall
	defw DontWave
defb cmdDone
db " "," "+&80

defb dlgCommand
	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone

db " "," "+&80
db " "," "+&80
db " "," "+&80
db " "," "+&80



defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBlackout
	defb 0


	defb cmdLocate	;Command
	defb 2 		;font
	defb 6,0	;x,y
	defb 5		;timer

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicEndmessagepng_Bank 
	defb PicEndmessagepng_ParentRef  
	defb PicEndmessagepng_Ref  
defb cmdDone


db " "," "+&80
defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBlueout
	defb 0
defb cmdDone

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
	defb cmdCall
	defw SetClearChar2

	defb cmdSetLevelTime
	defw TimeColorsYellow
	defb 0
defb cmdDone

;   1234567890123456789012345678901234567890
db "            -- Don't forget ",13
db"           Always, everywhere,         ",13
db "    No one gives a shit about you","!"+80
defb dlgCommand

	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdCall
	defw TurnSpeedSpaceOff
defb cmdDone
;   1234567890123456789012345678901234567890
db "-- As long as you keep whining about it",13
db "    you'll never achieve anything","."+&80
db " "+&80
db " "+&80




defb dlgCommand
	defb cmdSetLevelTime
	defw FadeOut
	defb 55

	defb cmdCall
	defw EndofDialog
defb cmdDone
db 0





;/////////////////////////////////////////////


defb dlgCommand


DialogChibikoOnlyBranch:




	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_Bank 
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_ParentRef  
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_Ref  

defb cmdDone

db "And another win",13
db "For Chibiko!!",13
db "    ",13
db "So much for 'Immortal",13
db "Sakuya'!"," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone

db "Now, take your crucifixes,",13
db "your holy water, and ",13
db "stupid battle robots",13
db "and shove off!"," "+&80

defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYumeSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR067yumiandyumeendsequencegunkbpng_Bank 
	defb PicFR067yumiandyumeendsequencegunkbpng_ParentRef  
	defb PicFR067yumiandyumeendsequencegunkbpng_Ref  

defb cmdDone

db "Well I can",13
db "safely say that",13
db "didn't go to plan!"," "+&80

defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 11,12	;x,y
	defb 5		;timer
defb cmdDone

db "Yes,",13
db "that did not go well",13
db "at all!"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_Bank 
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_ParentRef  
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_Ref  

defb cmdDone
db "Yeah!",13
db "You deserve all that",13
db "nasty shit!",13
db "I bet you wish that",13
db "was 'shaving foam'"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "That will teach you",13
db "two 'extras!', Since I'm",13
db "the main character,",13
db "there's hardly any",13
db "on me!"," "+&80



defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR068yumiandyumeendsequenceleavebpng_Bank 
	defb PicFR068yumiandyumeendsequenceleavebpng_ParentRef  
	defb PicFR068yumiandyumeendsequenceleavebpng_Ref  

defb cmdDone



db "Come on Yumi,",13
db "lets go!",13
db "we need to go to the",13
db "laundrette,get some",13
db "WB-40 and start",13
db "planning for ",13
db "our next battle!"," "+&80
defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

defb cmdDone

db "Yes!",13
db "Do not think you've",13 
db "heard the last of",13
db "this!"," "+&80
defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_Bank 
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_ParentRef  
	defb PicFR023ChibikoandbochanendsequenceChibikosmugbochangunkbpng_Ref  

defb cmdDone


db "Yeah?",13
db "Well I'll be waiting",13
db "So bring it on!"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibikoSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR085ChibikoendsequenceChibikoglumpng_Bank 
	defb PicFR085ChibikoendsequenceChibikoglumpng_ParentRef  
	defb PicFR085ChibikoendsequenceChibikoglumpng_Ref  

defb cmdDone
db "uhh, this 'kusareen'",13
db "is sure hard work!"," "+&80

db " "," "+&80
defb dlgCommand
	defb cmdCall
	defw CallThanksForPlayingBranch
defb cmdDone







;/////////////////////////////////////////////


defb dlgCommand


DialogBochanOnlyBranch:



	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochanSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR004bochanendsequencebochansmugpng_Bank 
	defb PicFR004bochanendsequencebochansmugpng_ParentRef  
	defb PicFR004bochanendsequencebochansmugpng_Ref  

defb cmdDone

db "Yeah! I win!",13
db "I R teh awesomeiest!"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYumeSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR067yumiandyumeendsequencegunkcpng_Bank 
	defb PicFR067yumiandyumeendsequencegunkcpng_ParentRef  
	defb PicFR067yumiandyumeendsequencegunkcpng_Ref  

defb cmdDone

db "Well I can",13
db "safely say that",13
db "didn't go to plan!"," "+&80

defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 11,12	;x,y
	defb 5		;timer
defb cmdDone

db "Our strategy was",13
db "rather lacking in",13
db "places it seems!"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochanSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR005bochanendsequencebochancautiouspng_Bank 
	defb PicFR005bochanendsequencebochancautiouspng_ParentRef  
	defb PicFR005bochanendsequencebochancautiouspng_Ref  
defb cmdDone
db "It's sure a mess",13
db "round here!",13
db "your mom is going",13
db "to be angry!"," "+&80



defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR068yumiandyumeendsequenceleavecpng_Bank 
	defb PicFR068yumiandyumeendsequenceleavecpng_ParentRef  
	defb PicFR068yumiandyumeendsequenceleavecpng_Ref  

defb cmdDone



db "Er, yes...",13
db "I didn't think",13
db "of that!"," "+&80
defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

defb cmdDone

db "We shall be",13
db "grounded",13
db "for a century!"," "+&80
defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochanSplat
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR005bochanendsequencebochancautiouspng_Bank 
	defb PicFR005bochanendsequencebochancautiouspng_ParentRef  
	defb PicFR005bochanendsequencebochancautiouspng_Ref  

defb cmdDone


db "Well...",13
db "I can help you",13
db "clean up!"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20;16	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0
	defb cmdShowBackground 	;Command
	defb PicFR072yumiandyumeendsequenceGratitudepng_Bank 
	defb PicFR072yumiandyumeendsequenceGratitudepng_ParentRef  
	defb PicFR072yumiandyumeendsequenceGratitudepng_Ref  

defb cmdDone
db "Really?",13
db "That's a big",13
db "help!"," "+&80

defb dlgCommand
defb cmdCls

	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,12	;x,y
	defb 5		;timer

defb cmdDone

db "for a monster,",13
db "you're quite the",13
db "gentleman!"," "+&80

db " "," "+&80
defb dlgCommand
	defb cmdCall
	defw CallThanksForPlayingBranch
defb cmdDone












CallChibikoOnlyBranch:
;	ld bc,DialogChibikoOnlyBranch-1
	ld bc,DialogBochanOnlyBranch-1	:DoPlayerBranch_Plus2
ret

CallThanksForPlayingBranch:
	ld bc,DialogThanksForPlayingBranch-1
ret

SetClearChar2:
	ld hl,ClearChar2
	ld (ClearCharCommand_Plus2-2),hl
ret

DoWave:
	ld hl,EndAnimFrame1
	ld (Delayer_Plus2-2),hl
ret


DontWave:
	ld hl,DoPause
	ld (Delayer_Plus2-2),hl
ret

EndofDialog:
	ld hl,null
	ld (ShowDialogCall_Plus2-2),hl
	ld (ShowDialogCallb_Plus2-2),hl
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
		call ClearChar		:ClearCharCommand_Plus2
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
	add 1 
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
		call Akuyou_GetMemPos
		ld b,8

ClearCharMoreLines:
		ld (hl),0
;		inc hl
	;	ld (hl),0
;		dec hl

		call Akuyou_ScreenBuffer_GetNxtLin
		djnz ClearCharMoreLines
ret


ClearChar2:
		call Akuyou_GetMemPos
		ld b,8

ClearCharMoreLines2:
		ld (hl),0
;		inc hl
;		ld (hl),0
;		dec hl

		call Akuyou_ScreenBuffer_GetNxtLin
		djnz ClearCharMoreLines2
ret


;halttest
;di
;halt
;ret


org LevelOrigin+ &3ff0

jp LevelInit; - Level Start &3ff0
jp LevelLoop; - Level loop &3ff3
;jp null     ; - Level resume &3ff6
;jp null     ; - Level Shutdown &3ff9




;save direct "T08-SC1.D01",&2000,&2000	;address,size...}[,exec_address]
save direct "T50-SC1.D04",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


