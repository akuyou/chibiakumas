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
read "SpriteCompiler\ep2_intro.asm"









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


TimeColorsChibikoMassacre:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&4C,&4B

	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2
	defb 192				
	defb &54,&58,&4C,&4B
	defb 24 				
	defb &54,&58,&5B,&4B			

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 0				
	defb &54,&58,&5B,&4B		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 0
	defb 0				
	defb &54,&58,&5B,&4B

defb 10
defb evtJumpToNewTime	
defw InfLoop
defb 100

TimeColorsChibikoBochan:
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

TimeColorsChibikoNarrator:
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
	defb &54,&55,&5F,&4B	

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

TimeColorsChibikoBlood:
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5C,&5B,&4B	

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
	defb &54,&4C,&52,&4B	

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

	ld hl,	&0100 				;load menu
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
;	jr DetectedContinue
;Detected128k
	ld a,&C0
	call ScreenPosReset
;DetectedContinue

;	call RestoreMusic

	ret
	jp RasterColorsSetPalette1

;"T56-SC1.D04"


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



	call AkuYou_Player_GetPlayerVars
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

		ld hl,DiskMap_Intro_Screens_Bank0
		ld a,&CC
		call Do256kLoad

		ld hl,DiskMap_Intro_Screens_Bank1
		ld a,&CD
		call Do256kLoad

		ld hl,DiskMap_Intro_Screens_Bank2
		ld a,&CE
		call Do256kLoad

		ld hl,DiskMap_Intro_Screens_Bank3
		ld a,&CF
		call Do256kLoad

		ld hl,DiskMap_Intro_Screens_Bank4
		ld a,&D4
		call Do256kLoad

		ld hl,DiskMap_Intro_Screens_Bank5
		ld a,&D5
		call Do256kLoad

		ld hl,DiskMap_Intro_Screens_Bank6
		ld a,&D6
		call Do256kLoad


		ld hl,DiskMap_Intro_Screens_Bank7
		ld a,&D7
		call Do256kLoad

		di
		call Akuyou_Firmware_kill
		call clear4000
		call Akuyou_RasterColors_Init


	ld hl,DrawABackgroundFrame256k
	ld (BackgroundBankHandler_Plus2-2),hl




systemis128k:




LevelLoop:

	call null :ClearScreenPoint_Plus2 ;Clear4000
	ld hl,null
	ld (ClearScreenPoint_Plus2-2),hl


	ei;disable me

	call Akuyou_Timer_UpdateTimer
	halt


	call ShowDialog	:ShowDialogCall_Plus2
	call ShowDialog	:ShowDialogCallB_Plus2

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
	ld hl,DiskMap_Intro_Screens_Bank0 
	cp 0 
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Intro_Screens_Bank1
	cp 1
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Intro_Screens_Bank2
	cp 2
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Intro_Screens_Bank3
	cp 3
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Intro_Screens_Bank4
	cp 4
	jp z,DrawABackgroundFrame_StartLoad


	ld hl,DiskMap_Intro_Screens_Bank5
	cp 5
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Intro_Screens_Bank6
	cp 6
	jp z,DrawABackgroundFrame_StartLoad

	ld hl,DiskMap_Intro_Screens_Bank7
	cp 7
	jp z,DrawABackgroundFrame_StartLoad

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
	defb 2 		;font
	defb 12,2	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsSkyBlue
	defb 0
defb cmdDone
;   1234567890123456789012345678901234567890
db "Do you know where babies come from?",13,"              ",13
db "       Well, I'll tell you..."," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBlackout
	defb 0
defb cmdDone

db " "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR041childsbedroompng_Bank 
	defb PicFR041childsbedroompng_ParentRef  
	defb PicFR041childsbedroompng_Ref  

	defb cmdSetLevelTime
	defw TimeColorsBlueout
	defb 0
 
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,0	;y,x
	defb 5		;timer
defb cmdDone
db " "+&80


defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBedroom
	defb 0



	defb cmdCall
	defw TurnSpeedSpaceOn
defb cmdDone

;defb dlgCommand
;	defb cmdCls
;defb cmdDone

db "       Well, you see...",13
db "Well, when a Mommy and ",13
db "Daddy love each other",13
db "           very much,"," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone
db " that love becomes",13
db "a seed, which grows",13
db "       into a baby!"," "+&80


defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 10,25	;y,x
	defb 5		;timer
	defb cmdCls
defb cmdDone
db "Umm... 'Kay... ",13
db "but...",13
db "where do BABY VAMPIRES",13
db "come from?"," "+&80

defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,0	;y,x
	defb 5		;timer
	defb cmdCls
defb cmdDone
db "          hm...",13
db "        well..."," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone
db "When a Mommy and Daddy",13
db "who don't really like",13
db "        each other..."," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "Spend all day smoking",13
db "     pot and drinking",13
db "              whiskey"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "And end up fucking",13
db "     without using",13
db "protection because",13
db " they are dumbass",13
db "    trailer-trash"," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR083childsbedroomV2png_Bank 
	defb PicFR083childsbedroomV2png_ParentRef  
	defb PicFR083childsbedroomV2png_Ref  
defb cmdDone
db "and they have a child",13
db "they don't want that",13
db "    grows up ignored",13
db "         and unloved"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "that child will grow",13
db "  up into a sadistic",13
db "         little shit"," "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR084childsbedroomV3png_Bank 
	defb PicFR084childsbedroomV3png_ParentRef  
	defb PicFR084childsbedroomV3png_Ref  
defb cmdDone
db "who never learns empathy",13
db "and only knows jealousy",13
db "              and anger"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "and finally after she's",13
db "    tortured and maimed",13
db "  every creature that's",13
db "   come across her path", " "+&80
defb dlgCommand
defb cmdShowBackground 	;Command
	defb PicFR085childsbedroomV4png_Bank 
	defb PicFR085childsbedroomV4png_ParentRef  
	defb PicFR085childsbedroomV4png_Ref  
defb cmdDone
db "her body will become as",13
db "     dead and corrupted",13
db "         as her soul..."," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db " And do you know what",13
db "you'll end up with?...", " "+&80












defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsBlackout
	defb 0
defb cmdDone

db " "+&80
defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicEp2Intropng_Bank  
	defb PicEp2Intropng_ParentRef   
	defb PicEp2Intropng_Ref   
defb cmdDone

db " "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsChibikoMassacre
	defb 0

	defb cmdLocate	;Command
	defb 2 		;font
	defb 0,0	;y,x
	defb 10		;timer
defb cmdDone

db " "+&80

defb dlgCommand
	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdCall
	defw TurnCLSoff
	
	defb cmdShowBackground 	;Command
	defb PicEp2IntroRedrawpng_Bank  
	defb PicEp2IntroRedrawpng_ParentRef   
	defb PicEp2IntroRedrawpng_Ref   
defb cmdDone


db "Unholy Fucking Shit!",13,"I'm back losers!...",13,"Did you miss me?"," "+&80


defb dlgCommand
defb cmdCls
defb cmdDone

db "No?     ",13,"Well... Fuck you!"," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone

db "Welcome to",13,"Chibi Akumas Episode 2!"," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone
db "I bet you thought the",13,"last game was crazy!",13,"But you ain't seen",13,"nothing yet!"," "+&80

defb dlgCommand
defb cmdCls
defb cmdDone
db "Now I know what",13,"you're thinking!"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "You're wondering what happened",13,"behind me?"," "+&80
nolist
defb dlgCommand
defb cmdCls
defb cmdDone
db "I bet you think I'm",13,"responsible for this!"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "and that I killed all these",13,"people to drink their blood?"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "Well, you're dead fucking WRONG!"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "I did it because I was really bored."," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "I'm not the guilty party here...",13,"piss poor TV scheduling",13,"is to blame for this!"," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "Well, anyway!",13,"No use crying over spilled entrails...",13,"Let's start the show!"," "+&80

db " "," "+&80
defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 5,5	;x,y
	defb 5		;timer
defb cmdDone











defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer


	defb cmdSetLevelTime
	defw	TimeColorsNarrator
	defb 0

	defb cmdCall
	defw SetJustCls

	defb cmdCall
	defw TurnSpeedSpaceOn

	defb cmdCls
defb cmdDone
;     
;   1234567890123456789012345678901234567890
db "Darwin's theory of evolution says that",13
db "     only the strong, and smartest    ",13
db "            will survive"," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR010BochanlickinglollipopV1png_Bank 
	defb PicFR010BochanlickinglollipopV1png_ParentRef  
	defb PicFR010BochanlickinglollipopV1png_Ref  




	defb cmdSetLevelTime
	defw	TimeColorsBochanNarrator
	defb 0

	defb cmdLocate	;Command
	defb 2 		;font
	defb 15,0	;x,y
	defb 5		;timer
defb cmdDone





db "and the lazy and stupid will die out."," "+&80
defb dlgCommand
defb cmdCls
defb cmdDone
db "But sometimes it's not 'What' you know",13
db "              but 'who'"," "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsVictim
	defb 0

	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone
db "                 mmm..."," "+&80
defb dlgCommand
	defb cmdCls

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

defb cmdDone

;   1234567890123456789012345678901234567890
db "    Don't worry, this will just take",13
db "               a moment..."," "+&80
defb dlgCommand
defb cmdCls
	defb cmdSetLevelTime
	defw TimeColorsVictim
	defb 0

defb cmdDone

;   1234567890123456789012345678901234567890
db "                 mmm..."," "+&80
defb dlgCommand
	defb cmdCls


	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0
defb cmdDone

;   1234567890123456789012345678901234567890
db "         now don't exagerate..."," "+&80
defb dlgCommand
	defb cmdCls

	defb cmdSetLevelTime
	defw TimeColorsVictim
	defb 0

defb cmdDone
db "           mnmmm mngm MMMM!!!..."," "+&80
defb dlgCommand
	defb cmdCls

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0
defb cmdDone
db "   Are you kidding? really! grow up!",13
db "      It may hurt for a moment",13
db "        but just put up it!"," "+&80
defb dlgCommand
	defb cmdSetLevelTime
	defw TimeColorsVictim
	defb 0

	defb cmdCls
defb cmdDone
db "              (Splurge!)"," "+&80





defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR020ChibikobydoorCutthroatguypng_Bank 
	defb PicFR020ChibikobydoorCutthroatguypng_ParentRef  
	defb PicFR020ChibikobydoorCutthroatguypng_Ref  

	defb cmdCall
	defw TurnSpeedSpaceOff



	defb cmdSetLevelTime
	defw TimeColorsChibikoBlood;TimeColorsChibiko
	defb 0

	defb cmdLocate	;Command
	defb 1 		;font
	defb 5,30	;y,x
	defb 5		;timer
defb cmdDone
db "What an",13,"exaggeration!",13
db "                      ",13
db "Hmm, a slow one?!",13
db "that's going to take",13,"a while to drain."
db " "+&80


defb dlgCommand

	defb cmdLocate	;Command
	defb 1 		;font
	defb 5,20	;y,x
	defb 5		;timer



	defb cmdSetLevelTime
	defw TimeColorsChibikoBochan
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR026Chibikobydoorpng_Bank 
	defb PicFR026Chibikobydoorpng_ParentRef  
	defb PicFR026Chibikobydoorpng_Ref  
defb cmdDone

db "Bochan.. ",13,"I'm going to update",13,"'The Sign' again",13,"You stay here... OK?",13
db "DON'T go anywhere!"," "+&80
defb dlgCommand

	defb cmdCall
	defw TurnCLSoff

	defb cmdShowBackground 	;Command
	defb PicFR012bochanTVpng_Bank 
	defb PicFR012bochanTVpng_ParentRef  
	defb PicFR012bochanTVpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 17,12	;y,x
	defb 5		;timer

defb cmdDone
db "ooo-kay!",13
db "                    "
db " "+&80

defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 5,20	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR078ChibikobydoorAngrypng_Bank 
	defb PicFR078ChibikobydoorAngrypng_ParentRef  
	defb PicFR078ChibikobydoorAngrypng_Ref  
defb cmdDone

db "I mean it!",13,"DO NOT MOVE",13,"You remember what",13,"happened last time!",&80
defb dlgCommand
	defb cmdCall
	defw TurnCLSoff

	defb cmdShowBackground 	;Command
	defb PicFR012bochanTVpng_Bank 
	defb PicFR012bochanTVpng_ParentRef  
	defb PicFR012bochanTVpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 17,12	;y,x
	defb 5		;timer

defb cmdDone
db "ooo-kay!",13
db "                    "
db " "+&80













defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 5,20	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR078ChibikobydoorAngrypng_Bank 
	defb PicFR078ChibikobydoorAngrypng_ParentRef  
	defb PicFR078ChibikobydoorAngrypng_Ref  
defb cmdDone

db "Well whatever!",13,"If you do something stupid",13,"I'm not coming for you",13
db "So just take the bus",13,"home from the hospital"," "+&80
defb dlgCommand
	defb cmdCall
	defw TurnCLSoff

	defb cmdShowBackground 	;Command
	defb PicFR012bochanTVpng_Bank 
	defb PicFR012bochanTVpng_ParentRef  
	defb PicFR012bochanTVpng_Ref  

	defb cmdLocate	;Command
	defb 1 		;font
	defb 17,12	;y,x
	defb 5		;timer

defb cmdDone
db "ooo-kay!",13
db "                    "
db " "+&80





defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 3,15	;y,x
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR027Chibikoflyingawayfromhousepng_Bank 
	defb PicFR027Chibikoflyingawayfromhousepng_ParentRef  
	defb PicFR027Chibikoflyingawayfromhousepng_Ref  
defb cmdDone

db "Uhh!",13," why do I have to",13,"look after that",13,"retarded idiot!"," "+&80







defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 15,12	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSoff

	defb cmdShowBackground 	;Command
	defb PicFR028Chibikoflyingacrossrockydesertpng_Bank 
	defb PicFR028Chibikoflyingacrossrockydesertpng_ParentRef  
	defb PicFR028Chibikoflyingacrossrockydesertpng_Ref  
defb cmdDone

db "He's got all the",13,"brains of a",13,"single cell amoeba!"," "+&80






defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 3,20	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR033Chibikopaintingtownsignpng_Bank 
	defb PicFR033Chibikopaintingtownsignpng_ParentRef  
	defb PicFR033Chibikopaintingtownsignpng_Ref  
defb cmdDone

db "I'm sick of getting",13,"him out of trouble"," "+&80




defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,20	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR077SignV2png_Bank 
	defb PicFR077SignV2png_ParentRef  
	defb PicFR077SignV2png_Ref  
defb cmdDone
db "Seriously...",13,"trying to eat a",13,"burger made from a",13,"whole fucking cow?"," "+&80



defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 13,20	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSoff

	defb cmdShowBackground 	;Command
	defb PicFR029chibikoFlyingacrossdesertreversepng_Bank 
	defb PicFR029chibikoFlyingacrossdesertreversepng_ParentRef  
	defb PicFR029chibikoFlyingacrossdesertreversepng_Ref  
defb cmdDone


db "and last time he",13,"got his stomach pumped,",13," cos he drank a tanker",13,"of maple syrup"," "+&80



defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 2,13	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR039chibikoWalkingacrosstrainlinepng_Bank 
	defb PicFR039chibikoWalkingacrosstrainlinepng_ParentRef  
	defb PicFR039chibikoWalkingacrosstrainlinepng_Ref  
defb cmdDone

db "This time, He's on...",13," ",13,"Hang on!",13,"What's that?"," "+&80





defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 15,15	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSoff

	defb cmdShowBackground 	;Command
	defb PicFR030chibikoHoldingcollarbigairlinetagNameBochanPropertyofChibikopng_Bank 
	defb PicFR030chibikoHoldingcollarbigairlinetagNameBochanPropertyofChibikopng_ParentRef  
	defb PicFR030chibikoHoldingcollarbigairlinetagNameBochanPropertyofChibikopng_Ref  
defb cmdDone

db "Oh Shit!         "," "+&80



defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 3,12	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR031ChibikoLookingaroundseesgiantbrokenlollipoppng_Bank 
	defb PicFR031ChibikoLookingaroundseesgiantbrokenlollipoppng_ParentRef  
	defb PicFR031ChibikoLookingaroundseesgiantbrokenlollipoppng_Ref  
defb cmdDone

db "You have GOT to be",13,"FUCKING kidding me!",13
db "I think I have an idea",13,"of what happened here"," "+&80







defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsNarrator
	defb 0

	defb cmdCall
	defw TurnSpeedSpaceOn


	defb cmdCall
	defw SetJustCls
	defb cmdCls


defb cmdDone
;     
;   1234567890123456789012345678901234567890
db "         Earlier that Night..."," "+&80







defb dlgCommand
	defb cmdCall
	defw TurnCLSon


	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0


	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR012bochanTVbpng_Bank 
	defb PicFR012bochanTVbpng_ParentRef  
	defb PicFR012bochanTVbpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR014Bochanhandholdingfliermassivelollipopsalepng_Bank 
	defb PicFR014Bochanhandholdingfliermassivelollipopsalepng_ParentRef  
	defb PicFR014Bochanhandholdingfliermassivelollipopsalepng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80




defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR013bochanTVmischivouslookonfacepng_Bank 
	defb PicFR013bochanTVmischivouslookonfacepng_ParentRef  
	defb PicFR013bochanTVmischivouslookonfacepng_Ref  
defb cmdDone

db "         "," "+&80
db "         "," "+&80
db "         "," "+&80

defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0

	defb cmdCall
	defw TurnSpeedSpaceOn


	defb cmdCall
	defw SetJustCls
	defb cmdCls


defb cmdDone
;     
;   1234567890123456789012345678901234567890
db "              'Lets Go!'"," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR018CandyStoreChompaChumpsSignGiantlolipopsalesakuyainbackgrounpng_Bank 
	defb PicFR018CandyStoreChompaChumpsSignGiantlolipopsalesakuyainbackgrounpng_ParentRef  
	defb PicFR018CandyStoreChompaChumpsSignGiantlolipopsalesakuyainbackgrounpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80



defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR073CandyStoreChompaChumpsBochanInsidepng_Bank 
	defb PicFR073CandyStoreChompaChumpsBochanInsidepng_ParentRef  
	defb PicFR073CandyStoreChompaChumpsBochanInsidepng_Ref  
defb cmdDone

db "         "," "+&80
db "         "," "+&80
db "         "," "+&80


defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsBochan
	defb 0

	defb cmdCall
	defw TurnSpeedSpaceOn

	defb cmdCall
	defw TurnCLSon



	defb cmdCall
	defw SetJustCls
	defb cmdCls


defb cmdDone
;     
;   1234567890123456789012345678901234567890
db "            'One Please!'",13,"          "," "+&80




defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR019CandyStoreBochanwalksoutwithgiantlollipoppng_Bank 
	defb PicFR019CandyStoreBochanwalksoutwithgiantlollipoppng_ParentRef  
	defb PicFR019CandyStoreBochanwalksoutwithgiantlollipoppng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR074Bocchanwalksacrosstraintrackpng_Bank 
	defb PicFR074Bocchanwalksacrosstraintrackpng_ParentRef  
	defb PicFR074Bocchanwalksacrosstraintrackpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR017Bocchanwalksacrosstraintrackdropslolipopontrackpng_Bank 
	defb PicFR017Bocchanwalksacrosstraintrackdropslolipopontrackpng_ParentRef  
	defb PicFR017Bocchanwalksacrosstraintrackdropslolipopontrackpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80



defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR081startslickingitwhileitsstucktotrackpng_Bank 
	defb PicFR081startslickingitwhileitsstucktotrackpng_ParentRef  
	defb PicFR081startslickingitwhileitsstucktotrackpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR053traincomingnomovementpng_Bank 
	defb PicFR053traincomingnomovementpng_ParentRef  
	defb PicFR053traincomingnomovementpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80
defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR081startslickingitwhileitsstucktotrackpng_Bank 
	defb PicFR081startslickingitwhileitsstucktotrackpng_ParentRef  
	defb PicFR081startslickingitwhileitsstucktotrackpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR054trainclosernomovementpng_Bank 
	defb PicFR054trainclosernomovementpng_ParentRef  
	defb PicFR054trainclosernomovementpng_Ref  
defb cmdDone

db "   "," "+&80




defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR081startslickingitwhileitsstucktotrackpng_Bank 
	defb PicFR081startslickingitwhileitsstucktotrackpng_ParentRef  
	defb PicFR081startslickingitwhileitsstucktotrackpng_Ref  
defb cmdDone

db "   "," "+&80


defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR055trainUrgentnomovementpng_Bank 
	defb PicFR055trainUrgentnomovementpng_ParentRef  
	defb PicFR055trainUrgentnomovementpng_Ref  
defb cmdDone

db "   "," "+&80

defb dlgCommand
	defb cmdCall
	defw TurnCLSon

	defb cmdCall
	defw TurnSpeedSpaceOff

	defb cmdShowBackground 	;Command
	defb PicFR056TrainSquelchpng_Bank 
	defb PicFR056TrainSquelchpng_ParentRef  
	defb PicFR056TrainSquelchpng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80

defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 3,10	;y,x
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0


	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR031ChibikoLookingaroundseesgiantbrokenlollipoppng_Bank 
	defb PicFR031ChibikoLookingaroundseesgiantbrokenlollipoppng_ParentRef  
	defb PicFR031ChibikoLookingaroundseesgiantbrokenlollipoppng_Ref  
defb cmdDone

db "I suppose I'm going",13,"to have to sort",13,"this shit out!"," "+&80




defb dlgCommand
	defb cmdLocate	;Command
	defb 1 		;font
	defb 7,15	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsChibiko
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR040Chibikowithcartrandomlimbsstickingoutpng_Bank 
	defb PicFR040Chibikowithcartrandomlimbsstickingoutpng_ParentRef  
	defb PicFR040Chibikowithcartrandomlimbsstickingoutpng_Ref  
defb cmdDone

db "Even the Darwin Awards",13,"won't believe something",13,"as fucking stupid as this!"," "+&80





defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdCall
	defw TurnSpeedSpaceOn

	defb cmdSetLevelTime
	defw TimeColorsNarrator
	defb 0

	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone

;   1234567890123456789012345678901234567890
db " And so using Forbidden Black Magic..."," "+&80



defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 15,0	;y,x
	defb 5		;timer

	defb cmdCall
	defw TurnCLSOn

	defb cmdSetLevelTime
	defw TimeColorsChibikoNarrator
	defb 0


	defb cmdShowBackground 	;Command
	defb PicFR034ChibikosewingfootCutfingersFootonbackwardspng_Bank 
	defb PicFR034ChibikosewingfootCutfingersFootonbackwardspng_ParentRef  
	defb PicFR034ChibikosewingfootCutfingersFootonbackwardspng_Ref  
defb cmdDone


db "       (And crap handicraft skills)"," "+&80
defb dlgCommand
	
	defb cmdSetLevelTime
	defw TimeColorsChibikoNarrator
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR024ChibikoBlackmasspng_Bank 
	defb PicFR024ChibikoBlackmasspng_ParentRef  
	defb PicFR024ChibikoBlackmasspng_Ref  
defb cmdDone
db "        Chibiko brought Bochan...",13
defb dlgCommand
	
	defb cmdSetLevelTime
	defw TimeColorsChibikoNarrator
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR016Bochanresurrectedpng_Bank 
	defb PicFR016Bochanresurrectedpng_ParentRef  
	defb PicFR016Bochanresurrectedpng_Ref  
defb cmdDone
db "         Back FROM THE DEAD!!!"," "+&80


defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR010BochanlickinglollipopV1png_Bank 
	defb PicFR010BochanlickinglollipopV1png_ParentRef  
	defb PicFR010BochanlickinglollipopV1png_Ref  



	defb cmdSetLevelTime
	defw	TimeColorsBochanNarrator
	defb 0

	defb cmdLocate	;Command
	defb 2 		;font
	defb 15,0	;x,y
	defb 5		;timer
defb cmdDone
;   1234567890123456789012345678901234567890
db "    But although he was resurrected",13
db "        brain death had set in",13
db "        and his inteligence was",13
db "          greatly reduced..."," "+&80

defb dlgCommand
	defb cmdShowBackground 	;Command
	defb PicFR011BochanlickinglollipopV2png_Bank 
	defb PicFR011BochanlickinglollipopV2png_ParentRef  
	defb PicFR011BochanlickinglollipopV2png_Ref  

	defb cmdSetLevelTime
	defw TimeColorsBochanNarratorV2
	defb 0


	defb cmdLocate	;Command
	defb 2 		;font
	defb 15,0	;x,y
	defb 5		;timer
defb cmdDone
;   1234567890123456789012345678901234567890
db "          well... in theory!"," "+&80



db " "," "+&80


;DialogScript
; Dirty init
;	db " "+&80
;	defb dlgCommand
;	defb cmdSetLevelTime
;	defw TimeColorsNarrator
;	defb 0
;	defb cmdDone
;	db " "+&80
; Dirty init

defb dlgCommand
	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer



	defb cmdSetLevelTime
	defw TimeColorsBlues
	defb 0

	defb cmdCall
	defw TurnCLSon

	defb cmdShowBackground 	;Command
	defb PicFR076newcharactersinshadowpng_Bank 
	defb PicFR076newcharactersinshadowpng_ParentRef  
	defb PicFR076newcharactersinshadowpng_Ref  
defb cmdDone

;   1234567890123456789012345678901234567890
db "         We're here at last!",13
db "    There it is! over in that valley",13
db "          ",13
db " We shall restore justice to this land!" ," "+&80



defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdCall
	defw TurnSpeedSpaceOn


	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone


;   1234567890123456789012345678901234567890
db "It was a typical day in the town of",13
db "               Nikoyama!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsDonate
	defb 0


	defb cmdCall
	defw TurnSpeedSpaceOn


	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR003blooddonationtentwithbloodstainedhandprintspng_Bank 
	defb PicFR003blooddonationtentwithbloodstainedhandprintspng_ParentRef  
	defb PicFR003blooddonationtentwithbloodstainedhandprintspng_Ref  
defb cmdDone
db "         "," "+&80
db "         "," "+&80
db "         "," "+&80
defb dlgCommand
	defb cmdLocate	;Command
	defb 2 		;font
	defb 12,0	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsNarrator
	defb 0


	defb cmdCall
	defw TurnSpeedSpaceOff


	defb cmdCall
	defw SetJustCls
	defb cmdCls
defb cmdDone



db "But something was about to disturb the",13
db "               'peace'"," "+&80


defb dlgCommand


	defb cmdLocate	;Command
	defb 1		;font
	defb 6,5	;x,y
	defb 5		;timer


	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR057Yumechallengefromintroyumibysidepng_Bank 
	defb PicFR057Yumechallengefromintroyumibysidepng_ParentRef  
	defb PicFR057Yumechallengefromintroyumibysidepng_Ref  
defb cmdDone
db "We found you at last! evil being!"," "+&80

defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer

	defb cmdSetLevelTime
	defw TimeColorsDonate
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR032Chibikonurseangrybochanbysidepng_Bank 
	defb PicFR032Chibikonurseangrybochanbysidepng_ParentRef  
	defb PicFR032Chibikonurseangrybochanbysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db "Not the  'shou-2-byou kyoudai' again!'",13
db "   piss off! we're too busy to waste",13
db "         time on you today!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0
	defb cmdLocate	;Command
	defb 1		;font
	defb 6,20	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR063Yumichallengefromintroyumebysidepng_Bank 
	defb PicFR063Yumichallengefromintroyumebysidepng_ParentRef  
	defb PicFR063Yumichallengefromintroyumebysidepng_Ref  
defb cmdDone

;   1234567890123456789012345678901234567890
db "     Begone foul monster! You are not",13
db "           welcome here!",13
db "  I shall banish you from this land!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer


	defb cmdSetLevelTime
	defw TimeColorsDonate
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR032Chibikonurseangrybochanbysidepng_Bank 
	defb PicFR032Chibikonurseangrybochanbysidepng_ParentRef  
	defb PicFR032Chibikonurseangrybochanbysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db "             Yeah Right!",13
db "   My mother said that TEN YEARS AGO!",13
db "She's long gone & I'm STILL FUCKING HERE!"," "+&80



defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0
	defb cmdLocate	;Command
	defb 1		;font
	defb 6,5	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR057Yumechallengefromintroyumibysidepng_Bank 
	defb PicFR057Yumechallengefromintroyumibysidepng_ParentRef  
	defb PicFR057Yumechallengefromintroyumibysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db "I see your CORPSEulent evil has spread",13
db "  to your stupid brother! No matter,",13
db "  I shall exorcise you both with my",13
db "      awesome spiritual powers!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer


	defb cmdSetLevelTime
	defw TimeColorsDonate
	defb 0

	defb cmdShowBackground 	;Command
	defb PicFR032Chibikonurseangrybochanbysidepng_Bank 
	defb PicFR032Chibikonurseangrybochanbysidepng_ParentRef  
	defb PicFR032Chibikonurseangrybochanbysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db " Hey! Don't you call my brother stupid!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0
	defb cmdLocate	;Command
	defb 1		;font
	defb 6,20	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR063Yumichallengefromintroyumebysidepng_Bank 
	defb PicFR063Yumichallengefromintroyumebysidepng_ParentRef  
	defb PicFR063Yumichallengefromintroyumebysidepng_Ref  
defb cmdDone

;   1234567890123456789012345678901234567890
db "I shalt give thee one chance to leave,",13
db "or my sister and I shalt bring the full",13
db "force of our armies upon you and your",13
db "         brainless brother!"," "+&80


defb dlgCommand

	defb cmdSetLevelTime
	defw TimeColorsDonate
	defb 0

	defb cmdCall
	defw TurnCLSon

	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer

	defb cmdShowBackground 	;Command
	defb PicFR032Chibikonurseangrybochanbysidepng_Bank 
	defb PicFR032Chibikonurseangrybochanbysidepng_ParentRef  
	defb PicFR032Chibikonurseangrybochanbysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db "               I said... ",13
db "     DONT call my brother stupid!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon

	defb cmdSetLevelTime
	defw TimeColorsYumiYume
	defb 0

	defb cmdLocate	;Command
	defb 1		;font
	defb 6,5	;x,y
	defb 5		;timer


	defb cmdShowBackground 	;Command
	defb PicFR057Yumechallengefromintroyumibysidepng_Bank 
	defb PicFR057Yumechallengefromintroyumibysidepng_ParentRef  
	defb PicFR057Yumechallengefromintroyumibysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db "A Mini-Vamp and her stupid brother are",13
db "    no match for the 'Hero Twins'!!!",13
db "Once we defeat you two BAKA-BRATS we'll",13
db "be hailed as the saviors of the town!"," "+&80


defb dlgCommand

	defb cmdCall
	defw TurnCLSon



	defb cmdSetLevelTime
	defw TimeColorsDonate
	defb 0


	defb cmdLocate	;Command
	defb 1		;font
	defb 6,10	;x,y
	defb 5		;timer


	defb cmdShowBackground 	;Command
	defb PicFR032Chibikonurseangrybochanbysidepng_Bank 
	defb PicFR032Chibikonurseangrybochanbysidepng_ParentRef  
	defb PicFR032Chibikonurseangrybochanbysidepng_Ref  
defb cmdDone
;   1234567890123456789012345678901234567890
db "  I told you not to call my brother",13
db "                 stupid! ",13

db "    Right! that's it! we're totally",13
db "     going to fuck you up...",13
db "    You and your crappy 'army'!"," "+&80

defb dlgCommand
	defb cmdSetLevelTime
	defw FadeOut
	defb 55

	defb cmdCall
	defw EndofDialog
defb cmdDone
db "     "," "+&80
db 0

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
	;	ld (hl),0
;		dec hl
		call Akuyou_ScreenBuffer_GetNxtLin
		djnz ClearCharMoreLines
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
save "lz48\T56-SC1.D04",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


