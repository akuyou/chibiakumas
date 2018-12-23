
nolist

BuildLevel equ 1	;We're building a level!
Read "..\Aku\Build.asm"

NoPaletteDest equ 1


read "Eventstreamdefinitions.asm"
read "CoreDefs.asm"

LevelDataStart equ &0000 ;Start of the data which is stored on disk

ifdef buildENT
	write "..\BldENT\T08-SC1.D01"
endif


ifdef buildZXS
	if BuildLang='r'
		write "..\BldZXr\Level00.bin"
	endif
	if BuildLang=''
		write "..\BldZX\Level00.bin"
	endif

endif 


ifdef buildMSX
	if BuildLang =''
		write "..\ResMSX\T08-SC1.D01"
	else
		write "..\ResMSXj\T08-SC1.D01"
	endif

;	db &FE     ; magic number
;	dw FileBeginLevel    ; begin address
;	dw FileEndLevel - 1  ; end address
;	dw FileBeginLevel;Execute  ; program execution address (for ,R option)
endif






org Akuyou_LevelStart
;LevelOrigin
FileBeginLevel:
if buildCPCv+buildENTv
	incbin "Sprites\TITLETEX.SPR"
endif
ifdef buildZXS
	incbin "..\ResZX\TITLETEX-ZX.SPR"
endif
ifdef buildMSX
	incbin "..\ResMSX\LEVEL0.MAP"
MSXTiles:
;	incbin "..\ResMSX\Level01-Tiles.RLE"
MSXTiles_End:

MsxTilesPos equ 1024-64
endif

;limit &4000



;incbin "Sprites\LEVEL1A.SPR"


;align 256,&00
;StarArraySize equ 255
;StarArrayPointer: 	
;defs StarArraySize*3,&00


;ObjectArraySize equ 60
;PlayerStarArraySize equ 36

;align 256,&00
;PlayerStarArrayPointer
;defs 64,&00
;ObjectArrayPointer
;defs 64,&00
;align 256,&00
;defs 255*5,&00

;defs ObjectArraySize*6,&00
;defs PlayerStarArraySize*3,&00

;align 256,&00

	

;Event_SavedSettings
;defs 4*16,&00



CustomRam:
defs 64 ;  Pos-Tick-Pos-Tick ; enough memory for 16 enemies!



ifdef CompileEP2
EventStreamArray_EP2:

; Load Palette

	defb 0,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&4F,&59,&4B	


	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 190;delay			
	defb &54,&58,&5F,&4B
	defb 88;90;delay			
	defb &54,&47,&5F,&4B

	defb 240,26*1+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2
	defb 22
	defb &54,&58,&5F,&4B
	defb 215
	defb &54,&47,&4D,&4B



	defb 240,26*2+6,5*3+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 3 ; no of switches
	defb 0	;delays			
	defb &54,&47,&4D,&4B
	defb 255	;delays			
	defb &54,&47,&4D,&4B
	defb 50		;delays			
	defb &54,&47,&4A,&4B
	
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60					; new time

endif

EventStreamArray_EP1:



; Load Palette

	defb 0,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&55,&4C,&4B	


	defb 240,26*0+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2	; Switches
	defb 0	;delay			
	defb &54,&55,&4C,&4B	
	defb 64+16;delay			
	defb &54,&58,&5F,&4B



	defb 240,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 48
	defb &54,&56,&5B,&4B



	defb 240,26*2+6,5*3+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 3 ; no of switches
	defb 0	;delays			
	defb &54,&56,&5B,&4B
	defb 255	;delays			
	defb &54,&4C,&4D,&4B
	defb 36	;delays			
	defb &54,&56,&5B,&4B



	
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60					; new time












;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			CPC Raster Pallete
;	The core is full, so this is now stored in the level block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if buildCPCv+buildENTv


PaletteInit:		;The palette when the level starts (black)
	     ;0GRB
	defb 15
	defw &0000
	defw &000F
	defw &08F8
	defw &0FFB
	defb 30
	defw &0000
	defw &003F
	defw &02F2
	defw &0EEB
	defb 45
	defw &0000
	defw &006B
	defw &00D0
	defw &0DDF
	defb 100
	defw &0000
	defw &0077
	defw &0F4F
	defw &0EEE
	defb 140
	defw &0000
	defw &0420
	defw &0A66
	defw &0EEE
	defb 200-16-2
	defw &0000
	defw &0800
	defw &0E66
	defw &FFFF
	defb 200-8-2
	defw &0000
	defw &00F0
	defw &0FF0
	defw &FFFF
	defb 200
	defw &0000
	defw &0800
	defw &0E66
	defw &FFFF

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

endif




endif





ifdef CompileEP2
YumiYume_Menu_EP2:

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


;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0


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



defb 0,128+4,0,&24,0				; Static object
defb 0,%10010000+15,2				; Save Object settings to Bank 2



;Title
defb 0,%01110000+7			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,6+12,12*0+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+13,12*1+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+14,12*2+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+15,12*3+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+16,12*4+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+17,12*5+ 24+44,24+16	; 	; Single Object sprite 11 (animated)

;Yumi
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,4,12*0+ 24,24+64+8	; 	; Single Object sprite 11 (animated)
defb 	0,5,12*1+ 24,24+64+8	; 	; Single Object sprite 11 (animated)

;Yume
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,6,12*0+ 24+160-24,24+200-64	; 	; Single Object sprite 11 (animated)
defb 	0,7,12*1+ 24+160-24,24+200-64	; 	; Single Object sprite 11 (animated)


;Palette Change
defb 1,%01110000+4			; 4 Commands
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






; Load Palette

	defb 2,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&43,&47,&4B		;Black,DkBlue,LtYellow,White


	defb 240,26*0+6,5*4+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 4	; Switches
	defb 16	;delay			
	defb &54,&4A,&4F,&4B
	defb 96;delay			
	defb &54,&5E,&4F,&4B
	defb 64;delay			
	defb &54,&47,&5F,&4B
	defb 100;delay
	defb &54,&47,&5F,&4B

	defb 240,26*1+6,5*2+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 2
	defb 32;delay
	defb &54,&47,&5F,&4B
	defb 245
	defb &54,&47,&4D,&4B


	defb 240,26*2+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0 ; no of switches
	defb 0	;delays			
	defb &54,&47,&4D,&4B

	
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60	


EventStreamArray_Menu_EP2:

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


;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0


; Background L
defb 0,128+4,1,%11000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,%10010000+15,0				; Save Object settings to Bank 0

defb 0,128+4,1,%11000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,%10010000+15,1				; Save Object settings to Bank 1

defb 0,128+4,0,&24,0				; Static object
defb 0,%10010000+15,2				; Save Object settings to Bank 2



;Title
defb 0,%01110000+7			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,6+12,12*0+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+13,12*1+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+14,12*2+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+15,12*3+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+16,12*4+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,6+17,12*5+ 24+44,24+16	; 	; Single Object sprite 11 (animated)

;Chibiko
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,0,12*0+ 24+12,24+65	; 	; Single Object sprite 11 (animated)
defb 	0,1,12*1+ 24+12,24+65	; 	; Single Object sprite 11 (animated)

;Bochan!
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,2,12*0+ 24+160-24-12,24+200-64	; 	; Single Object sprite 11 (animated)
defb 	0,3,12*1+ 24+160-24-12,24+200-64	; 	; Single Object sprite 11 (animated)


;Palette Change
defb 1,%01110000+4			; 4 Commands
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












; Load Palette

	defb 2,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&43,&47,&4B		;Black,DkBlue,LtYellow,White


	defb 240,26*0+6,5*4+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 4	; Switches
	defb 16	;delay			
	defb &54,&4A,&4F,&4B
	defb 128;delay			
	defb &54,&5E,&4F,&4B
	defb 24;delay			
	defb &54,&58,&4C,&4B
	defb 110;140;delayw
	defb &54,&58,&5B,&4B

	defb 240,26*1+6,5*4+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 4
	defb 18
	defb &54,&58,&5B,&4B
	defb 72
	defb &54,&40,&5B,&4B
	defb 60
	defb &54,&40,&5F,&4B
	defb 70
	defb &54,&40,&47,&59		;Black,Red,Grey,White

	defb 240,26*2+6,5*3+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 3 ; no of switches
	defb 0	;delays			
	defb &54,&40,&47,&59		;Black,Red,Grey,White
	defb 255
	defb &54,&40,&47,&59
	defb 32
	defb &54,&40,&4E,&4A	;defb &54,&4C,&4E,&49		
	
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60	
endif

ifdef CompileEP1

EventStreamArray_Menu_EP1:

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

	defb 0,evtCallAddress
	defw SetFaderEP1Menu



;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0


; Background L
defb 0,128+4,1,%11000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,%10010000+15,0				; Save Object settings to Bank 0

defb 0,128+4,1,%11000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb 0,%10010000+15,1				; Save Object settings to Bank 1

defb 0,128+4,0,&24,0				; Static object
defb 0,%10010000+15,2				; Save Object settings to Bank 2



;Title
defb 0,%01110000+7			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
defb 	0,12,12*0+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,13,12*1+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,14,12*2+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,15,12*3+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,16,12*4+ 24+44,24+16	; 	; Single Object sprite 11 (animated)
defb 	0,17,12*5+ 24+44,24+16	; 	; Single Object sprite 11 (animated)

;Chibiko
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
if buildCPCv+buildENTv
	defb 	0,0,12*0+ 24,24+64	; 	; Single Object sprite 11 (animated)
	defb 	0,1,12*1+ 24,24+64	; 	; Single Object sprite 11 (animated)
else
	defb 	0,0,12*0+ 24+18,24+64-8	; 	; Single Object sprite 11 (animated)
	defb 	0,1,12*1+ 24+18,24+64-8	; 	; Single Object sprite 11 (animated)
endif

;Bochan!
defb 0,%01110000+3			; 3 commands at the same timepoint
defb 	%10010000+0+2				; Load Settings from bank 2
if buildCPCv+buildENTv
	defb 	0,2,12*0+ 24+160-24,24+200-64	; 	; Single Object sprite 11 (animated)
	defb 	0,3,12*1+ 24+160-24,24+200-64	; 	; Single Object sprite 11 (animated)

endif
ifdef BuildMSX
	defb 	0,2,12*0+ 24+160-24-18,24+200-64	; 	; Single Object sprite 11 (animated)
	defb 	0,3,12*1+ 24+160-24-18,24+200-64	; 	; Single Object sprite 11 (animated)
endif

ifdef BuildZXS
	defb 	0,2,12*0+ 24+160-24-18,24+200-72	; 	; Single Object sprite 11 (animated)
	defb 	0,3,12*1+ 24+160-24-18,24+200-72	; 	; Single Object sprite 11 (animated)
endif

;Palette Change
defb 1,%01110000+4			; 4 Commands
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

endif


; Load Palette

	defb 2,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&4D,&4A,&4B		;Black,DkBlue,LtYellow,White


	defb 240,26*0+6,5*4+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 4	; Switches
	defb 16	;delay			
	defb &54,&4C,&5B,&4B
	defb 128;delay			
	defb &54,&5C,&5B,&4B
	defb 32;delay			
	defb &54,&58,&4C,&4B
	defb 100;delay
	defb &54,&58,&5B,&4B

	defb 240,26*1+6,5*3+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 3
	defb 18
	defb &54,&58,&5B,&4B
	defb 72
	defb &54,&40,&5B,&4B
	defb 60
	defb &54,&40,&5F,&4B


	defb 240,26*2+6,5*3+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 3 ; no of switches
	defb 0	;delays			
	defb &54,&40,&47,&59		;Black,Red,Grey,White
	defb 255
	defb &54,&40,&47,&59
	defb 32
	defb &54,&40,&4E,&4A	;defb &54,&4C,&4E,&49		

defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60					; new time




Safepalette:
;Safepalette

defb 1,%01110000+4			; 4 Commands
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


	defb 1,evtCallAddress
	defw SetFaderRegular


;Palette Change
defb 2,%01110000+4			; 4 Commands
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









defb 3,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&5D,&5B,&4B

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&5D,&5B,&4B

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&5D,&5B,&4B		

	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&5D,&5B,&4B			
	
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60					; new time


PauseLoop:
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60					; new time


EventStreamFadeOut:

;Palette Change
defb 1,%01110000+4			; 4 Commands
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


if buildCPCv+buildENTv+BuildMSXv
	defb 1,evtCallAddress
	defw SetFaderBlack
endif



defb 2,%01110000+4			; 4 Commands
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


defb 8,%10001001			;Call a memory location
	defw	EndLevel
EndLevel:
	call &6969 :FadeOutJump_Plus2

ResetEventStream:
	push hl

		ld de,StarArrayPointer+1
		ld hl,StarArrayPointer
		ld bc,256*4
		ld (hl),0
	ldir 
	pop hl

	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit
	

ret











EventStreamArray_ContentWarning:

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

defb 1,%01110000+4			; 4 Commands
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

defb 2,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&47,&4D,&4B

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&47,&4D,&4B	

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 64				
;	defb &54,&47,&4D,&4B
	defb &54,&55,&5F,&4B		

	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
;	defb &54,&47,&4D,&4B
	defb &54,&55,&5F,&4B	
	
defb 4	
	defb 136				; Jump to a different level point
	defw PauseLoop				; pointer
	defb 60	












ifdef CompileEP2




	ContentWarning0:


	db  3,""," "+&80
;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  2,"Welcome to Chibi Akumas Episode 2!"," "+&80
	db  3,""," "+&80

	db  5,"This game is an ADULT COMEDY,"," "+&80
	db  3,""," "+&80
	db  253,"It contains Explicit language, Violence"," "+&80
	db  253,"Black Comedy, and all kinds of Nastiness!"," "+&80
	db  3,""," "+&80
	db  1,"It is suitable for those over 18 years"," "+&80
	db  13,"of age only"," "+&80
	db  3,""," "+&80
	db 8, "Press Fire to Continu","e"+&80
	db &0




	ContentWarning1:
;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  4,"As it's your first time playing,"," "+&80
	db  253,"To confirm you are over 18 years of age"," "+&80

	db  4,"We have prepared the latest in"," "+&80
	db  253,"Psychometric testing to ensure you are"," "+&80
	db  1,"of the maturity and mental acumen to"," "+&80
	db  1,"handle the challenging themes of this"," "+&80
	db  11,"game responsibly!"," "+&80
;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  3,""," "+&80
	db  12,"Are you ready?"," "+&80

	db  4,"Answer the following Questions!"," "+&80
	db  3,""," "+&80
	db 8, "Press Fire to Continu","e"+&80
	db &0
	ContentWarning2:
	;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
	;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  3,"1. The meaning of life is..."," "+&80
	db  3,"   "," "+&80
	db  3," "," "+&80
;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  1,"A. Be nice to people... So you can get"," "+&80
	db  1,"   close enough to see their shock"," "+&80
	db  1,"   as you stab them in the back","!"+&80
	db  1,"B. There is only happiness in the"," "+&80
	db  1,"   afterlife! So you must collect souls"," "+&80
	db  1,"   who will be your slaves for eternity","!"+&80
	db  1,"C. ME! you are all puny puppets in my"," "+&80
	db  1,"   presence, who should dance and"," "+&80
	db  1,"   die for my amusement!"," "+&80
	db &0
	ContentWarning3:

	db  3,"2. Killing someone, and Drinking "," "+&80
	db  3,"   their Blood is... "," "+&80
	db  3," "," "+&80
	db  1,"A. The reason I have to take my my"," "+&80
	db  1,"   laundry to the Chinese laundrette"," "+&80
	db  1,"   across town"," "+&80
	db  1,"B. Something I would NEVER do again"," "+&80
	db  1,"   your honor!"," "+&80
	db  1,"   Not now I done found religion!"," "+&80
	db  1,"C. Stupid! everyone knows your victims"," "+&80
	db  1,"   need to be alive for the blood to"," "+&80
	db  1,"   give you eternal life!"," "+&80
	db &0

	ContentWarning4:
;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db  3,"3. If someone betrayed me,"," "+&80
	db  3,"   I would... "," "+&80
	db  3," "," "+&80
	db  1,"A. Kill them, and put their head on"," "+&80
	db  1,"   a spike as a warning to others"," "+&80
	db  1,"   not to fuck with me"," "+&80
	db  1,"B. Take them apart an inch at a time"," "+&80
	db  1,"   so they feel as much pain as life"," "+&80
	db  1,"   could offer before they saw Hell"," "+&80
	db  1,"C. Spare them... So they could live to"," "+&80
	db  1,"   see me take out my brutal revenge"," "+&80
	db  1,"   on those they care about","!"+&80
	db &0
	

	ContentWarning5:


	db  3,""," "+&80
	db  1,"Uh, you got all those questions wrong!"," "+&80

	db  3,""," "+&80

	db  6,"Oh my god! you're a monster!"," "+&80
	db  4,"I'm glad you don't live near me."," "+&80

	db  1,""," "+&80
	db  7,"Seriously, You need help!"," "+&80
	db  1,""," "+&80

	db  1,"Well, I guess this game can't do YOU"," "+&80
	db  6,"any harm, so what the heck!"," "+&80
	db  3,""," "+&80
;      	       .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	       .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	db 6, "Press Fire to play the game","!"+&80
	db &0

ContentWarning:

	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)
	or %01000000
	ld (iy-10),a

	call Akuyou_RasterColors_Disable
	call Akuyou_ScreenBuffer_Reset	
	call Akuyou_Firmware_Restore

	ld a,&C0
	ld hl,&08C8
	ld c,1
	ld de,&8000
	ld ix,&8000+&2000
	call Akuyou_LoadDiscSectorZ

	call Akuyou_Firmware_kill
	call Akuyou_RasterColors_Init
	call Akuyou_Music_Restart


	ld hl,EventStreamArray_ContentWarning		;Event Stream
	call ResetEventStream

ContentWarningAgain:

	ld a,0	:ContentWarningVer_Plus1
	
	ld hl,null
	ld bc,ContentWarning0
	cp 0 
	jr z,ContentWarningApply

	ld bc,ContentWarning1
	cp 1
	jr z,ContentWarningApply

	ld hl,onscreencursor
	ld bc,ContentWarning2
	cp 2
	jr z,ContentWarningApply

	ld bc,ContentWarning3
	cp 3
	jr z,ContentWarningApply

	ld bc,ContentWarning4
	cp 4
	jr z,ContentWarningApply

	ld hl,&8003
	ld (ContentWarningShowScreen_Plus2-2),hl
	ld hl,null

	ld bc,ContentWarning5
	cp 5
	jr z,ContentWarningApply

;	ld bc,ContentWarning6


;	cp 6
;	jr z,ContentWarningApply


	jp SaveShowMenu


ContentWarningApply:
	inc a
	ld (ContentWarningVer_Plus1-1),a
	ld (ContentWarning_ShowCursor_Plus2-2),hl
	push bc	
		call Akuyou_Cls
		call &8000	:ContentWarningShowScreen_Plus2
		
		ld l,13
	pop bc
	call ShowText


	ld hl,&0010	;hl = startpos
	ld bc,&0003	;bc = movespeed
	ld ix,&2604	;ix = MinX,MaxX
	ld iy,&1610	;iy = MinY,MaxY
	call OnscreenCursorDefine
ContentWarning_Loop:
	

	call Akuyou_Timer_UpdateTimer

	call Akuyou_EventStream_Process
	ei
	halt
	call AkuYou_Player_ReadControls

	ld a,ixl
	and ixh
	or Keymap_AnyFire;%11110001
	cp 255
	jp nz,ContentWarningAgain

	push hl
		call Null :ContentWarning_ShowCursor_Plus2;OnscreenCursor
	pop ix




	;call Akuyou_ScreenBuffer_Flip
	jp ContentWarning_Loop
endif


LevelInit:


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
		ld a,&C0
		call Akuyou_BankSwitch_C0_SetCurrent
	endif

endif 


	ld a,2
	call Akuyou_SpriteBank_Font



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


ifdef CompileEP2
	ld hl,EventStreamArray_Ep2		;Event Stream
else
	ld hl,EventStreamArray_Ep1		;Event Stream
endif
	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit

ifdef buildZXS
	ld a,6
	ld hl,Akuyou_Music_Restart
	call Akuyou_Bankswapper_CallHL
else
	call Akuyou_Music_Restart
endif
	
	call Akuyou_ScreenBuffer_Reset
	call Akuyou_Interrupt_Init	;	call Akuyou_RasterColors_Init

jp ShowTitlePic



LevelInit_Old:

	call Akuyou_Music_Restart

	;load player setting for color flipping
	call AkuYou_Player_GetPlayerVars

ifdef CompileEP2
		ld a,(iy-1)	;cpcver
		and 128
		jr z,systemis64k
		ld a,&C4
		ld (EyeCatchBankA_Plus1-1),a
		ld (EyeCatchBankB_Plus1-1),a
		ld hl,&4000
		ld (EyeCatchMemA_Plus2-2),hl
		ld (EyeCatchMemB_Plus2-2),hl
		ld hl,&4000+&3F00
		ld (EyeCatchMem2A_Plus2-2),hl
	systemis64k:
endif

if buildCPCv+buildENTv
	;ld a,(iy-5)
	ld a,1
	ld (PaletteNo_Plus1-1),a
	call RasterColorsSetPalette1
endif




ShowTitlePic:


ifdef BuildMSX
	call EnableFader
endif


if buildCPCv+buildENTv
	call EnablePlusPalette
	call RasterColorsStartPalleteFlip
endif




ifdef CompileEP2
	ld hl,EventStreamArray_Ep2		;Event Stream
else
	ld hl,EventStreamArray_Ep1		;Event Stream
endif
	ld de,Event_SavedSettings	;Saved Settings
	call ResetEventStream

;ifdef BuildCPC
;	ld a,&C0
;	call Akuyou_BankSwitch_C0_SetCurrent
;endif


	ld a,2
	call Akuyou_SpriteBank_Font




ifdef BuildZXS
	push hl
		ld a,1
		ld c,64+6
		call Akuyou_ZXSGPU_CommandNum
	pop hl
endif


;	ld hl,Font_RegularSizePos
;	call Akuyou_ShowSprite_SetBankAddr
	
	ld a,255
	ldia		; show up to 255 chars
	
;ep1	ld l,&17
if buildCPCv+buildENTv
ifdef CompileEP2
	ld l,&18	;ep2
else
	ld l,&17
endif
else
	ld l,&16
endif
	ld bc,TitleText1
	call ShowText

	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw


	call Keys_WaitForRelease
ShowTitlePic_Loop:
	

	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	ei
	halt
	call AkuYou_Player_ReadControls

	ld a,ixl
	or Keymap_AnyFire ;%11110001
	cp 255
	jr nz,ShowMenu		; Check for any of the 3 fires being pressed (1UP)

	ld a,ixh
	or Keymap_AnyFire ;%11110001
	cp 255
	jr nz,ShowMenu		; Check for any of the 3 fires being pressed (2UP)

	call CallFade

	jr ShowTitlePic_Loop

	
ShowMenu:


ifdef CompileEP2
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)
	and %01000000
	jp z,ContentWarning
endif

ifdef BuildZXS
	push hl
		ld a,1
		ld c,64+2
		call Akuyou_ZXSGPU_CommandNum
	pop hl
endif


ifdef buildMSX
	ld hl,PlusPalette_Regular
	call Akuyou_VDP_SetPalette
endif
 
if buildCPCv+buildENTv+BuildMSXv
	ld hl,PlusPalette_Black
	call PlusPaletteSet
endif

if buildCPCv+buildENTv
	call Akuyou_RasterColors_Init

	ifdef BuildCPC
		ld a,1			;Turn on Plus raster switch
		call Akuyou_CPCGPU_CommandNum
	endif

	ld a,64
	ld (PaletteNo_Plus1-1),a
endif
	call Keys_WaitForRelease
ifdef CompileEP2
	ld hl,EventStreamArray_Menu_EP2		;Event Stream
else
	ld hl,EventStreamArray_Menu_EP1		;Event Stream
endif
	call ResetEventStream




	call Akuyou_CLS
	

	ld a,2
	call Akuyou_SpriteBank_Font

	ld a,255
	ldia		; show up to 255 chars
	
	ld l,10
	ld bc,MenuText1
	call ShowText
	
	Call CallFade

if buildCPCv+buildENTv
		ld hl,&1518
else
		ld hl,&1517
endif
		call Akuyou_DrawText_LocateSprite
		call Akuyou_Player_GetHighscore
		ld de,7
		add hl,de
		ld b,8
		call MenuScore_NextDigit


	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw


;	ld hl,&0010	;hl = startpos
;	ld bc,&0003	;bc = movespeed
;	ld ix,&2604	;ix = MinX,MaxX
;	ld iy,&1610	;iy = MinY,MaxY

	ld hl,&090C
	ld bc,&0001
	ld ix,&2602
ifdef CompileEP2
	ld iy,&120C
else
	ld iy,&110C
endif
	call OnscreenCursorDefine
ShowMenu_Loop:
	

	call Akuyou_Timer_UpdateTimer

	call Akuyou_EventStream_Process
	ei
	halt
	call AkuYou_Player_ReadControls

	ld a,ixl
	and ixh
	or Keymap_AnyFire;%11110001
	cp 255
	jp nz,MainMenuSelection

	push hl
		call OnscreenCursor
	pop ix
ifdef buildENT
	ld a,(ix+3)
	bit 7,a
endif
ifdef buildCPC
	ld a,(ix+8)
	bit 2,a
endif
ifdef BuildZXS
	ld a,(ix+4)
	bit 0,a
endif
ifdef BuildMSX
	ld a,(ix+7)
	bit 2,a
endif
	jp z,ConfigureControls







ifdef Debug_ShowLevelTime
	call ShowLevelTime
endif
	call CallFade


	;call Akuyou_ScreenBuffer_Flip
	jp ShowMenu_Loop

ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"
endif	
ifndef BuildZXS
	CallFade:
		jp null :FadeCommand_Plus2

	FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
	

	SetFaderRegular:
	push hl
		ld hl,PlusPalette_Regular
		call SetFader
	pop hl
	ret

	SetFaderBlack:
	push hl
		ld hl,PlusPalette_Black
		call SetFader
	pop hl
	ret

	SetFaderEP1Menu:
	push hl
		ld hl,PlusPalette_EP1Menu
		call SetFader
	pop hl
	ret
else
	SetFaderRegular:
	SetFaderEP1Menu:
	CallFade:
	ret
endif
if buildCPCv+buildENTv

PlusPalette_Black:
	defb 30
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 50
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 65
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 85
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 132
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 160
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 200-8-3
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB
	defb 200
defw &0000;1  -GRB
defw &0000;5  -GRB
defw &0000;6  -GRB
defw &0000;4  -GRB

PlusPalette_Regular:
	defb 25
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 50
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 75
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 100
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 125
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 150
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 175
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB
	defb 200
defw &0000;1  -GRB
defw &0088;5  -GRB
defw &0F8F;6  -GRB
defw &0FFF;4  -GRB


PlusPalette_EP1Menu:
	defb 30
	defw &0000
	defw &03F8
	defw &0FF0
	defw &0FFF
	defb 50
	defw &0000
	defw &00F0
	defw &02F2
	defw &0FFF
	defb 65
	defw &0000
	defw &00B4
	defw &0F0F
	defw &0FFF
	defb 85
	defw &0000
	defw &0077
	defw &00F0
	defw &0FFF
	defb 132
	defw &0000
	defw &0077
	defw &0F0C
	defw &0FFF
	defb 160
	defw &0000
	defw &0666
	defw &03F3
	defw &0F44
	defb 200-8-3
	defw &0000
	defw &0666
	defw &08E8
	defw &0F44
	defb 200
	defw &0000
	defw &0666
	defw &06F0
	defw &0FF0
	     ;0GRB

endif





ifdef buildMSX
PaletteInit:
PaletteDest:
PlusPalette_Default:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0FFF;4  -GRB
defw &00DD;5  -GRB
defw &0F0F;6  -GRB
defw &00F0;7  -GRB
defw &0F04;8  -GRB
defw &09EF;9  -GRB
defw &0090;10  -GRB
defw &044F;11  -GRB
defw &0FF0;12  -GRB
defw &000C;13  -GRB
defw &0AE0;14  -GRB
defw &0900;15  -GRB




PlusPalette_Regular:
PlusPalette_EP1Menu:
defw &0000;0  -GRB
defw &0000;1  -GRB
defw &0555;2  -GRB
defw &0AAA;3  -GRB
defw &0FFF;4  -GRB
defw &0088;5  -GRB
defw &0F0F;6  -GRB
defw &00F0;7  -GRB
defw &0F04;8  -GRB
defw &07FC;9  -GRB
defw &0FC0;10  -GRB
defw &0FBF;11  -GRB
defw &0800;12  -GRB
defw &0EB6;13  -GRB
defw &00F8;14  -GRB
defw &0EEE;15  -GRB




PlusPalette_Black:
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
endif

;	or Keymap_AnyFire;%11110001
;	cp 255
;	jp nz,StartGame		; Check for any of the 3 fires being pressed 
;	jp nz,StartGameEp2_1UP


;	ld a,ixh
;	or Keymap_AnyFire;%11110001
;	cp 255
;	jp nz,StartGame		; Check for any of the 3 fires being pressed 
;	jp nz,StartGameEp2_2UP


MainMenuSelection:
	ld a,(CursorCurrentPosXY_Plus2-2)
	cp &0C
	jp z,StartGame_1UP
	cp &0D
	jp z,StartGame_2UP
	cp &0E
	jp z,StartGame_2P
	cp &0F
	jp z,Introduction
	cp &10
	jp z,doGameplaySettings
ifdef CompileEP2
	cp &11
	jp z,EyeCatches
	cp &12
	jp z,DoShowCredits
else
	cp &11
	jp z,DoShowCredits
endif

ShowMenu_NoCredits:


	ld a,(ix+7)
	bit 4,a
	jp z,GameplaySettings

	ld a,(ix+4)
	bit 3,a
	jp z,Introduction
DoShowCredits:
ifdef BuildZXS
	jp ShowCredits
endif

;ld hl,PlusPalette_Regular
;call PlusPaletteSet

	;ShowCredits
ifdef BuildZXS
	jp ShowCredits
else
	ld hl,ShowCredits
	ld (FadeOutJump_Plus2-2),hl
	ld hl,EventStreamFadeOut
	call ResetEventStream
	jp ShowMenu_Loop
endif
OnscreenCursorDefineTest:
	ld hl,&0F0F
	ld bc,&0101
	ld ix,&2602
	ld iy,&1802
OnscreenCursorDefine:
		;hl = startpos
		;bc = movespeed
		;ix = MinX,MaxX
		;iy = MinY,MaxY
		ld (CursorCurrentPosXY_Plus2-2),hl
		ld (CursorMoveSpeedXY_Plus2-2),bc

		ld a,ixl
		ld (CursorMinX_Plus1-1),a
		ld a,ixh
		ld (CursorMaxX_Plus1-1),a

		ld a,iyl
		ld (CursorMinY_Plus1-1),a
		ld a,iyh
		ld (CursorMaxY_Plus1-1),a
	ret
OnscreenCursor:


		ld hl,&0101	:CursorCurrentPosXY_Plus2	;current pos
		push hl

			call ClearChar
		pop hl
		
		ld bc,&0202	:CursorMoveSpeedXY_Plus2
		ld a,ixh	
		and ixl
		ld e,a


		bit Keymap_D,e
		jr nz,OnscreenCursorNotDown
		
		ld a,l

		cp 24 		:CursorMaxY_Plus1
		jr nc,OnscreenCursorAbandon
		add c
		ld l,a
OnscreenCursorNotDown:
		bit Keymap_U,e
		jr nz,OnscreenCursorNotUp
		
		ld a,l
		sub c
		cp 2		:CursorMinY_Plus1
		jr c,OnscreenCursorAbandon

		ld l,a
OnscreenCursorNotUp:
		bit Keymap_R,e
		jr nz,OnscreenCursorNotRight
		
		ld a,h

		cp 39		:CursorMaxX_Plus1
		jr nc,OnscreenCursorAbandon
		add b
		ld h,a
OnscreenCursorNotRight:
		bit Keymap_L,e
		jr nz,OnscreenCursorNotLeft
		
		ld a,h
		sub b
		cp 2		:CursorMinX_Plus1
		jr c,OnscreenCursorAbandon

		ld h,a
OnscreenCursorNotLeft:
OnscreenCursorAbandon:
		ld (CursorCurrentPosXY_Plus2-2),hl

		push hl
			ld a,2
			call Akuyou_SpriteBank_Font
		pop hl

		call ShowCursorPos

	
		call Akuyou_DrawText_LocateSprite

		ld hl,OnscreenCursor_anim :OnscreenCursor_animNext_Plus2
		ld a,(hl)
		or a
		jr nz,OnscreenCursorOK
		ld hl,OnscreenCursor_anim
		ld a,(hl)
OnscreenCursorOk:
		inc hl
		ld (OnscreenCursor_animNext_Plus2-2),hl
		call Akuyou_DrawText_CharSprite
		ei
		halt
		halt
		halt
ifdef BuildCPC
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt		
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt
		halt
endif
		ret

OnscreenCursor_anim:
;ifdef BuildZXS
;	defb '/','|','\','-',0
;else
	if BuildLang =''
		defb 129,130,131,130,0
	else
		defb 94,95,96,95,0
	endif
;endif
ClearChar:

ifdef BuildMSX
	ld d,0
	ld a,l
	add a
	add a
	add a
	ld e,a
	ld (VDP_MyHMMV_DY),de
	ld a,h
	sub 4	;TextScreen_MinX

	add a
	add a
	add a
	ld e,a
	ld (VDP_MyHMMV_DX),de



	ld hl,VDP_MyHMMV
	ld a,1
	call	Akuyou_VDP_CommandNum
	ret



VDP_MyHMMV:	
VDP_MyHMMV_DX:	defw &0000 ;DX 36,37
VDP_MyHMMV_DY:	defw &0000 ;DY 38,39
VDP_MyHMMV_NX:	defw &0008 ;NX 40,41
VDP_MyHMMV_NY:	defw &0008 ;NY 42,43
VDP_MyHMMV_Byte:defb &11   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	

endif

ifndef BuildMSX

		ld a,l
		add a
		add a
		add a
		ld c,a
		ld a,h
if buildCPCv+buildENTv
		add a
endif
ifdef BuildZXS
		sub 4	;TextScreen_MinX
endif
		ld b,a
		
;		ld bc,&0408
		call Akuyou_GetMemPos
		ld b,8

	ClearCharMoreLines:
		ld (hl),0
if buildCPCv+buildENTv
		inc hl
		ld (hl),0
		dec hl
endif
		call Akuyou_ScreenBuffer_GetNxtLin
		djnz ClearCharMoreLines
	ret
endif




ShowCursorPos: ;for debugging
ret
ifdef Debug_ShowLevelTime
;	ld a,2		;Remember to set the font!
;	call Akuyou_SpriteBank_Font
	push hl
		ld hl,&1002
		call Akuyou_DrawText_LocateSprite
	pop hl
	ld a,h
	push hl
		call ShowHex
	pop hl
	ld a,l
	push hl
		call ShowHex
	pop hl
ret
endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;










MenuScore_NextDigit:
	push bc
	push hl

		ld a,(hl)		
		add 48 
		call Akuyou_DrawText_CharSprite

	pop hl
	pop bc
	dec hl
	dec b
	jp nz,MenuScore_NextDigit
	ret


	TitleText1:
	if BuildLang =''
		db 8, "Press Fire to Continu","e"+&80
	else
		;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
		db 10, 099,141,104,115,149,143,159,129,158,100,103,118,125,132,121,129,159,124,115,255
	endif
	db &0
	MenuText1:
 	if BuildLang =''
		db  10,"Hit ESC to set control","s"+&80

	else
		;      19      18      17      16      15      14      13      12      11      10       9       8       7       6       5       4       3       2       1   0
		db  9,143,159,129,158,103,127,112,132,115,126,154,134,152,099,"E","S","C",100,103,118,125,132,255
	endif
	ifdef BuildZXS
		db  10," Hit 0 to set control","s"+&80
	endif

if BuildLang =''
	db  10,""," "+&80
	db  11,"Start Game as Chibik","o"+&80
	db  11,"Start Game as Bocha","n"+&80
	db  11,"Start 2 Player gam","e"+&80
	db  11,"Watch the Intr","o"+&80
	db  11,"Configure Setting","s"+&80
	ifdef CompileEP2
		db  11,"Special Conten","t"+&80
	endif
	db  11,"Credits & Thank","s"+&80
else
	db  10,"",255
	db  11,099,130,140,159,123,100,133,125,132,139,125,159,147,154,255
	db  11,099,143,159,130,109,158,100,133,125,132,139,125,159,147,154,255
	db  11,141,129,153,132,159,139,125,159,147,154,255
	db  11,115,158,133,156,103,145,154,255
	db  11,122,159,113,146,138,127,112,132,115,255
	ifdef CompileEP2
		db  11,143,159,113,134,126,123,158,132,158,133,255
	endif
	db  11,124,121,125,109,119,152,138,147,112,127,113,125,159,255
endif

;	db  4,"This Game is Free & Open Sourc","e"+&80
;	db  5,"Written 2017 by Keith Sea","r"+&80
	if BuildLang =''
		ifdef CompileEP1
			db  11,""," "+&80
		endif
		db  10,""," "+&80
		db  10," "," "+&80
if buildCPCv+buildENTv
			db  10," "," "+&80
		endif
	else
	ifdef CompileEP1
			db  11,"",255
		endif
		db  10,"",255
		db  10," ",255
if buildCPCv+buildENTv
			db  10," ",255
		endif
	endif

;      		.1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	        .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
	if BuildLang =''
		db  10, "www.chibiakumas.com"," "+&80
		db  10,""," "+&80
		db  9,"HighScore",":"+&80
	else
		db  10, "WWW.CHIBIAKUMAS.COM",255
		db  10,"",255
		db  9,"HIGHSCORE",":",255
	endif
	;b  "12345678901234567890123456789","0"+&80
	db &0
	
CheatsOn: db &0
Introduction:
	call Akuyou_CLS
ifdef CompileEP1
	ld hl,	&01FC 				;load Intro
endif
ifdef CompileEP2
	ld hl,	&01F0 				;load Intro
endif
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return






lstContinueMode:
	defb 0	
	defw txtContinueMode0
	defb 1
	defw txtContinueMode1
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstContinueMode
if BuildLang ='j' 

TXTMAINMENU:  DB "  ",147,135,110,113,142," ",148,133,159,154,ENDCHAR
TXTCONFIGTITLE:DB "GAMEPLAY OPTIONS"," ",ENDCHAR

TXTRASTERCOLOR: DB "RASTERCOLOR FLICKER",":",ENDCHAR
TXTPLUSSPRITE: DB "PLUSSPRITE FLICKER",":",ENDCHAR
TXTPLUSSPRITE0:DB "ON"," ",ENDCHAR
TXTPLUSSPRITE1:DB "OFF"," ",ENDCHAR


ifdef BuildZXS
	TXTMULTIPLAY: DB "USE KEMPSON",":",ENDCHAR
	TXTMULTIPLAY0:DB "OFF"," ",ENDCHAR
	TXTMULTIPLAY1:DB "ON"," ",ENDCHAR
else
	TXTMULTIPLAY: DB "USE TOTO MULTIPLAY",":",ENDCHAR
	TXTMULTIPLAY0:DB "OFF"," ",ENDCHAR
	TXTMULTIPLAY1:DB "ON"," ",ENDCHAR
	TXTMULTIPLAY3:DB "ON+SWAPFIRES"," ",ENDCHAR
endif
TXTGAMEOPTIONS: DB "SCREENSHAKE",":",ENDCHAR
TXTGAMEOPTIONS0:DB "OFF"," ",ENDCHAR
TXTGAMEOPTIONS1:DB "ON"," ",ENDCHAR


TXTDIFFICULTY: DB 146,126,159,119,125,124,":",ENDCHAR
TXTDIFFICULTY0:DB 130,140,159,114,121,144,ENDCHAR
TXTDIFFICULTY0B:DB 139,115,139,160,113,114,121,144,ENDCHAR
TXTDIFFICULTY1:DB 139,159,119," ",119,159,115,125,159,158,ENDCHAR
TXTDIFFICULTY1B:DB "BABY AKUM","A",ENDCHAR
TXTDIFFICULTY2:DB 118,155,139," ",125,135,119,159,145,"!",ENDCHAR

TXTGAMEPLAYMODE: DB 122,159,113,146,148,113,133,159,":",ENDCHAR
TXTGAMEPLAYMODE0: DB 141,131,116," ",ENDCHAR
TXTGAMEPLAYMODE128: DB "4",143,116," ",ENDCHAR
TXTGAMEPLAYMODE128B: DB 131,119,117,134,115,ENDCHAR

TXTCONTINUES:     DB 123,158,132,105,135,110,113,":",ENDCHAR
TXTSMARTBOMBS:    DB 126,144,113,133,143,159,146,":",ENDCHAR
IFDEF CPC320
	TXTCONTINUEMODE:  DB "2P CONTINUE MODE",":",ENDCHAR
ELSE
	TXTCONTINUEMODE:  DB "2P",148,113,133,159,":",ENDCHAR
ENDIF
TXTCONTINUEMODE0: DB 134,119,151,125,ENDCHAR

TXTCONTINUEMODE1: DB 123,156,125,114,115," ",ENDCHAR;FRATRICIDE

else

TXTMAINMENU:  DB "BACK TO MAIN MENU"," ",ENDCHAR
TXTCONFIGTITLE:DB "GAMEPLAY OPTIONS"," ",ENDCHAR

TXTRASTERCOLOR: DB "RASTERCOLOR FLICKER",":",ENDCHAR
TXTPLUSSPRITE: DB "PLUSSPRITE FLICKER",":",ENDCHAR
TXTPLUSSPRITE0:DB "ON"," ",ENDCHAR
TXTPLUSSPRITE1:DB "OFF"," ",ENDCHAR


ifdef BuildZXS
	TXTMULTIPLAY: DB "USE KEMPSON",":",ENDCHAR
	TXTMULTIPLAY0:DB "OFF"," ",ENDCHAR
	TXTMULTIPLAY1:DB "ON"," ",ENDCHAR
else
	TXTMULTIPLAY: DB "USE TOTO MULTIPLAY",":",ENDCHAR
	TXTMULTIPLAY0:DB "OFF"," ",ENDCHAR
	TXTMULTIPLAY1:DB "ON"," ",ENDCHAR
	TXTMULTIPLAY3:DB "ON+SWAPFIRES"," ",ENDCHAR
endif
TXTGAMEOPTIONS: DB "SCREENSHAKE",":",ENDCHAR
TXTGAMEOPTIONS0:DB "OFF"," ",ENDCHAR
TXTGAMEOPTIONS1:DB "ON"," ",ENDCHAR


TXTDIFFICULTY: DB "DIFFICULTY",":",ENDCHAR
TXTDIFFICULTY0:DB "CHIBI AKUM","A",ENDCHAR
TXTDIFFICULTY0B:DB "HYPER AKUM","A",ENDCHAR
TXTDIFFICULTY1:DB "GRINGO PUSS","Y",ENDCHAR
TXTDIFFICULTY1B:DB "BABY AKUM","A",ENDCHAR
TXTDIFFICULTY2:DB "I AM DEATH","!",ENDCHAR

TXTGAMEPLAYMODE: DB "GAMEPLAY MODE",":",ENDCHAR
TXTGAMEPLAYMODE0: DB "NORMAL"," ",ENDCHAR
TXTGAMEPLAYMODE128: DB "4-DIRECTION"," ",ENDCHAR
TXTGAMEPLAYMODE128B: DB "WIN FIRST",".",ENDCHAR

TXTCONTINUES:     DB "CONTINUES",":",ENDCHAR
TXTSMARTBOMBS:    DB "SMARTBOMBS",":",ENDCHAR
IFDEF CPC320
	TXTCONTINUEMODE:  DB "2P CONTINUE MODE",":",ENDCHAR
ELSE
	TXTCONTINUEMODE:  DB "2P MODE",":",ENDCHAR
ENDIF
TXTCONTINUEMODE0: DB "CO-EXISTANCE"," ",ENDCHAR

TXTCONTINUEMODE1: DB "BROOD REDUCTION"," ",ENDCHAR;FRATRICIDE
endif

lstGameplayMode:
	defb 0	
	defw txtGameplayMode0
	defb 1
	defw txtGameplayMode128b
	defb 128
	defw txtGameplayMode128
	defb 0	
	defw 00 
	defw lstGameplayMode
lstGameplayModeC:
	defb 0	
	defw txtGameplayMode0
	defb 128
	defw txtGameplayMode128
	defb 0	
	defw 00 
	defw lstGameplayModeC


lstGameplayModeN:
	defb 0	
	defw txtGameplayMode0
	defb 1
	defw txtGameplayMode128b
	defb 0	
	defw 00 
	defw lstGameplayModeN


lstDifficulty:
	defb 0	
	defw txtDifficulty0
	defb 0+64
	defw txtDifficulty0b
	defb 2+64
	defw txtDifficulty2
	defb 1+128
	defw txtDifficulty1
;	defb 1
;	defw txtDifficulty1b
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstDifficulty



lstGameOptions:
	defb 0	
	defw txtGameOptions0
	defb 1
	defw txtGameOptions1
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstGameOptions

ifdef BuildZXS

lstMultiplay:
	defb 0	
	defw txtMultiplay0
	defb 1
	defw txtMultiplay1
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstMultiplay

else


lstMultiplay:
	defb 0	
	defw txtMultiplay0
	defb 1
	defw txtMultiplay1
	defb 3
	defw txtMultiplay3
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstMultiplay
endif


lstPlusSprite:
	defb 0	
	defw txtPlusSprite0
	defb 64
	defw txtPlusSprite1
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstPlusSprite

AddAndLocate:
	add h
	ld h,a

	ld a,255
	ldia		; show up to 255 chars
	;ld l,0

	jp Akuyou_DrawText_LocateSprite
DrawTextFromLookup:
	ld b,a
DrawTextFromLookupAgain:
	ld a,(hl)
	inc hl
	cp b
	jr z,DrawTextFromLookupFound
	ld d,(hl)
	inc hl 
	ld a,(hl)
	inc hl
	or d
	ret z	; 0 0 lookup means couldn't find a match
	jr DrawTextFromLookupAgain
DrawTextFromLookupFound:
	ld c,(hl)
	inc hl
	ld b,(hl)
	jp Akuyou_DrawText_PrintString



ToggleFromLookup:
	ld b,a
ToggleFromLookupAgain:
	ld a,(hl)
	inc hl
	cp b
	jr z,ToggleFromLookupFound
	ld d,(hl)
	inc hl 
	ld a,(hl)
	inc hl
	or d
	ret z	; 0 0 lookup means couldn't find a match
	jr ToggleFromLookupAgain
ToggleFromLookupFound:
	inc hl
	inc hl
	ld b,(hl)
	inc hl
	;ld d,(hl)
;	inc hl 
;	ld a,(hl)
;	inc hl
;	or d
zzxpxc;	jp z,DrawTextReset
	ld a,b
	ret
	;jp Akuyou_DrawText_PrintString


;ret
if buildCPCv+buildENTv
	posMultiplay equ  &09
	posPlusSprite equ &11
	posRasterFlicker equ &13
	posGameOptions equ &0F

	posConfigTitle equ &02
	posContinues equ &05
	posDifficulty equ &07
	posContinueMode equ &0B
	posGameMode equ &0D
	posSmartBomb equ &15
	posMainMenu equ &17
endif

ifdef BuildMSX
	posConfigTitle equ 2
	posContinues equ 7
	posDifficulty equ 9
	posContinueMode equ 11
	posGameMode equ 13
	posSmartBomb equ 15
	posMainMenu equ 17
endif

ifdef BuildZXS
	posConfigTitle equ 2
	posContinues equ 5
	posDifficulty equ 7
	posMultiplay equ  9
	posContinueMode equ 11
	posGameMode equ 13
	posSmartBomb equ 15
	posMainMenu equ 17
endif





doGameplaySettings:
ifdef BuildZXS
	jp GameplaySettings
else
	ld hl,GameplaySettings
	ld (FadeOutJump_Plus2-2),hl
	ld hl,EventStreamFadeOut
	call ResetEventStream
	jp ShowMenu_Loop
endif

GameplaySettings:
ifdef BuildZXS
	push hl
		ld a,1
		ld c,64+6
		call Akuyou_ZXSGPU_CommandNum
	pop hl
endif


	call AkuYou_Player_GetPlayerVars
	ld a,(IY-15)
	and %10000000
	ld (IY-15),a

	ld a,(IY-4)
	cp 64
	jr z,ResetPlusSprite
	xor a
ResetPlusSprite:
	ld (IY-4),a

	ld a,(IY-5)
	cp 64
	jr z,ResetFlickerColors
	xor a
ResetFlickerColors:
	ld (IY-5),a
	

	

	call Keys_WaitForRelease

;	ld hl,PlusPalette_Regular
;	call PlusPaletteSet


	ld hl,Safepalette
	call ResetEventStream

;	ld hl,&0010	;hl = startpos
;	ld bc,&0003	;bc = movespeed
;	ld ix,&2604	;ix = MinX,MaxX
;	ld iy,&1610	;iy = MinY,MaxY

	ld bc,&0002
	ld ix,&2602
if buildCPCv+buildENTv
	ld hl,&0305
	ld iy,&1705
endif
ifdef BuildMSX
	ld hl,&0407
	ld iy,&1107
endif

ifdef BuildZXS
	ld hl,&0405
	ld iy,&1105
endif

	call OnscreenCursorDefine;test
GameplaySettingsRedraw:
ifdef CPC320
	
else

endif


	call Akuyou_CLS
ifdef CPC320
	TxtMidpoint equ 20
else
	TxtMidpoint equ 16
endif
	ld a,2
	call Akuyou_SpriteBank_Font

	ld a,255
	ldia		; show up to 255 chars
	;ld l,0

	;Smartbombs
	ld hl,&0A00+posConfigTitle
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtConfigTitle
		call Akuyou_DrawText_PrintString
	pop hl





	;Continues
	ld hl,&0500+posContinues 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtContinues
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-12)
	call Akuyou_DrawText_Decimal


	;Difficulty
	ld hl,&0500+posDifficulty 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtDifficulty
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-11)
;	call Akuyou_DrawText_Decimal
	ld hl,lstDifficulty
	call DrawTextFromLookup

ifdef posMultiplay
	;Multiplay
	ld hl,&0500+posMultiplay 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtMultiplay
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-9)
;	call Akuyou_DrawText_Decimal
	ld hl,lstMultiplay
	call DrawTextFromLookup
endif


	ld hl,&0500+posContinueMode 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtContinueMode
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-14)
;	call Akuyou_DrawText_Decimal
	ld hl,lstContinueMode
	call DrawTextFromLookup


ifdef posGameOptions
	;GameplayOptions
	ld hl,&0500+posGameOptions 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtGameOptions
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-16)
;	call Akuyou_DrawText_Decimal
	ld hl,lstGameOptions
	call DrawTextFromLookup
endif


	;Gameplay Mode Regular / 4D
	ld hl,&0500+posGameMode 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtGameplayMode
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-15)
	ld hl,lstGameplayMode
	call DrawTextFromLookup



ifdef posPlusSprite
	;Plus Sprite Flicker
	ld hl,&0500+posPlusSprite 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtPlusSprite
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-4)
	ld hl,lstPlusSprite
	call DrawTextFromLookup
endif

ifdef posRasterFlicker
	;RasterColor
	ld hl,&0500+posRasterFlicker 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtRasterColor
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-5)
	ld hl,lstPlusSprite
	call DrawTextFromLookup
endif


	;Continues
	ld hl,&0500+posSmartBomb  
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtSmartbombs
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,TxtMidpoint
	call AddAndLocate
	call AkuYou_Player_GetPlayerVars
	ld a,(IY-13)
	call Akuyou_DrawText_Decimal




;MainMenu
	ld hl,&0A00+posMainMenu 
;	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtMainMenu
		call Akuyou_DrawText_PrintString
;	pop hl



;	ld bc,GameplayText 
;	call ShowText

;	ld a,255
;	ld i,a		; show up to 255 chars
;	ld l,24
;	ld bc,BlankMsgGamePlaySettingsMessage_Plus2
;	call ShowText

GameplaySettings_Loop:
	

	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw

	call AkuYou_Player_ReadControls
	ld a,ixl
	and ixh
	or Keymap_AnyFire;%11110001
	cp 255
	jp nz,GameplaySettings_Apply

	call OnscreenCursor
	
	call CallFade
	jp GameplaySettings_Loop
GameplaySettings_Apply:

	call AkuYou_Player_GetPlayerVars

	ld a,(CursorCurrentPosXY_Plus2-2)
	cp posContinues ;&05
	jp z,GameplaySettings_ApplyContinues
	cp posDifficulty;&07
	jr z,GameplaySettings_ApplyDifficulty
ifdef posMultiplay
	cp posMultiplay ;&09
	jp z,GameplaySettings_ApplyMultiplay
endif
	cp posContinueMode;&0B
	jp z,GameplaySettings_ApplyContinueMode
	cp posGameMode;&0D
	jr z,GameplaySettings_ApplyGameMode
ifdef posPlusSprite
	cp posPlusSprite;&0F
	jr z,GameplaySettings_ApplyPlusSprite
endif
ifdef posRasterFlicker
	cp posRasterFlicker;&11
	jr z,GameplaySettings_ApplyRasterFlicker
endif
	cp posSmartBomb; &13
	jp z,GameplaySettings_ApplySmartbombs
ifdef posGameOptions
	cp posGameOptions 
	jp z,GameplaySettings_GameOptions
endif
	cp posMainMenu 
	jp nc,GameplaySettings_ShowMenu
	jp GameplaySettingsRedraw
GameplaySettings_ShowMenu:
	jp SaveShowMenu
GameplaySettings_ApplyGameMode:
	ld a,(iy-10)
	and            %10000000
	jr nz,GameplaySettings_ApplyGameModeComplete

	ld a,(IY-15)
	ld hl,lstGameplayModeN
	call ToggleFromLookup
	ld (IY-15),a
	jp GameplaySettingsRedraw
GameplaySettings_GameOptions:
	ld a,(IY-16)
	ld hl,lstGameOptions
	call ToggleFromLookup
	ld (IY-16),a
	jp GameplaySettingsRedraw
GameplaySettings_ApplyRasterFlicker:
	ld a,(IY-5)
	ld hl,lstPlusSprite
	call ToggleFromLookup
	ld (IY-5),a
	jp GameplaySettingsRedraw
GameplaySettings_ApplyPlusSprite:
	ld a,(IY-4)
	ld hl,lstPlusSprite
	call ToggleFromLookup
	ld (IY-4),a
	jp GameplaySettingsRedraw


GameplaySettings_ApplyGameModeComplete:
	ld a,(IY-15)
	ld hl,lstGameplayModeC
	call ToggleFromLookup
	ld (IY-15),a
	jp GameplaySettingsRedraw

GameplaySettings_ApplyDifficulty:
	ld a,(IY-11)
	ld hl,lstDifficulty
	call ToggleFromLookup
	ld (IY-11),a
	jp GameplaySettingsRedraw
GameplaySettings_ApplyContinueMode:
	ld a,(IY-14)
	ld hl,lstContinueMode
	call ToggleFromLookup
	ld (IY-14),a
	jp GameplaySettingsRedraw
GameplaySettings_ApplyMultiplay:
	ld a,(IY-9)
	ld hl,lstMultiplay
	call ToggleFromLookup
	ld (IY-9),a
	jp GameplaySettingsRedraw
GameplaySettings_ApplySmartbombs:
	ld a,(IY-13)
	inc a
	cp 4
	jr nz,GameplaySettings_ApplyContinuesB
	xor a
GameplaySettings_ApplyContinuesB:
	ld (IY-13),a
	jp GameplaySettingsRedraw
GameplaySettings_ApplyContinues:
	ld a,(IY-12)
	cp 250
	jr c,GameplaySettings_ApplyContinuesZero
	xor a
GameplaySettings_ApplyContinuesZero:
	add 10
	ld (IY-12),a
	jp GameplaySettingsRedraw
;	jp GameplaySettings_Loop	


;Continues10
;	ld a,10
;	ld bc,Continues10Text
;	jr SetContinues
;Continues20
;	ld a,20
;	ld bc,Continues20Text
;	jr SetContinues
;Continues255
;	ld a,255
;	ld bc,Continues255Text
;	jr SetContinues


;Difficulty1
;	ld a,1
;	ld bc,DifficultyEText
;	jr SetDifficulty
;Difficulty0
;	xor a
;	ld bc,DifficultyMText
;	jr SetDifficulty
;Difficulty2
;	ld a,2
;	ld bc,DifficultyHText
;	jr SetDifficulty

;TogglePlusFlicker
;	ld a,(iy-4)
;	xor 64
;	ld (iy-4),a
;CheckToggle
;	jr z,SetToggleOn
;	cp 255
;	jr z,SetToggleOn
;jr SetToggleOff

;ToggleRasterFlicker
;	ld a,(iy-5)
;	xor 64
;	ld (iy-5),a
;;	jr CheckToggle

;SetDifficulty
;	ld (iy-11),a
;jr ShowGameplaySetting
;SetToggleOff
;	ld bc,ToggleOffText
;	jr ShowGameplaySetting
;SetToggleOn
;	ld bc,ToggleOnText
;	jr ShowGameplaySetting
;SetContinues
;	ld (iy-12),a
;ShowGameplaySetting

;	ld (GamePlaySettingsMessage_Plus2-2),bc
;	jp GameplaySettingsRedraw




BlankMsg:db  4,""," "+&80,0


StartGame_1UP:	
	call Akuyou_CLS
	ld hl,	&0005;7;5 				;load level 11 (Episode 2 start)
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return
StartGame_2UP:	
	call Akuyou_CLS
	ld hl,	&0006 				;load level 11 (Episode 2 start)
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

StartGame_2P:	
	call Akuyou_CLS
	ld hl,	&0007 				;load level 11 (Episode 2 start)
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return


;StartGame
;	call clsB
;	ld hl,	&0101 				;load level 1
;	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

ShowCredits:	

ifdef BuildZXS
	push hl
		ld a,1
		ld c,64+6
		call Akuyou_ZXSGPU_CommandNum
	pop hl
endif

	call Keys_WaitForRelease
	call Akuyou_CLS
	xor a
	ld (CheatsOn),a

	ld hl,Safepalette
	call ResetEventStream


	ld a,2
	call Akuyou_SpriteBank_Font

	ld a,255
	ldia		; show up to 255 chars
	
	ld l,2
	ld bc,Credits_TextString
	call ShowText


ShowCredits_Loop:
	

	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw
	ei
	halt
ifdef BuildCPC
	halt
	halt
	halt
	halt
endif
	call CallFade


	call AkuYou_Player_ReadControls
	ld a,ixl
	and ixh
	or Keymap_AnyFire;%11110001
	cp 255
	jp nz,ShowMenu

	; Cheatmenu, Press F6 on credits, then 6 twice
	push hl
	pop ix

	ld a,(CheatsOn)
	cp 0
	jr z,cheatStage0	; cheating isnt armed
	cp 1
	jr z,cheatStage1	; cheating isnt armed
	cp 2
	jr z,cheatStage2	; cheating isnt armed
	cp 3
	jp z,ShowCheats		; Cheat!

ifdef BuildMSX
	cheatStage0:
		ld a,(ix+10)
		bit 1,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage1:
		ld a,(ix+0)
		bit 6,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage2:
		ld a,(ix+10)
		bit 1,a
		call z,Cheater
		jr ShowCredits_Loop
endif
ifdef BuildENT
	cheatStage0:
		ld a,(ix+3)
		bit 2,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage1:
		ld a,(ix+4)
		bit 3,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage2:
		ld a,(ix+3)
		bit 2,a
		call z,Cheater
		jr ShowCredits_Loop
endif

 ;EP keyboard matrix &B5

 ;        b7    b6    b5    b4    b3    b2    b1    b0
 ;Row    80H   40H   20H   10H   08H   04H   02H   01H
 ; 0   L.SH.     Z     X     V     C     B     \     N
 ; 1    CTRL     A     S     F     D     G  LOCK     H
 ; 2     TAB     W     E     T     R     Y     Q     U
 ; 3     ESC     2     3     5     4     6     1     7
 ; 4      F1    F2    F7    F5    F6    F3    F8    F4
 ; 5         ERASE     ^     0     -     9           8
 ; 6             ]     colon L     ;     K           J
 ; 7     ALT ENTER   LEFT  HOLD   UP   RIGHT DOWN  STOP
 ; 8     INS SPACE R.SH.     .     /     ,   DEL     M
 ; 9                   [     P     @     0           I


ifdef buildZXS
	cheatStage0:
		ld a,(ix+4)
		bit 4,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage1:
		ld a,(ix+4)
		bit 1,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage2:
		ld a,(ix+4)
		bit 4,a
		call z,Cheater
		jr ShowCredits_Loop
endif
ifdef BuildCPC
	cheatStage0:
		ld a,(ix+0)
		bit 4,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage1:
		ld a,(ix+6)
		bit 0,a
		call z,Cheater
		jr ShowCredits_Loop
	cheatStage2:
		ld a,(ix+0)
		bit 4,a
		call z,Cheater
		jr ShowCredits_Loop
endif
Cheater:
	call Keys_WaitForRelease
	ld a,(CheatsOn)
	inc a
	ld (CheatsOn),a
	ret


if BuildLang=''
	Credits_TextString: 
			ifdef CompileEP2
				db 8,"Chibi Akumas Episode 2","!"+&80
			else
				db 8,"Chibi Akumas Episode 1","!"+&80
			endif
			db 17,"V1.666"," "+&80
			;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 
			;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
			db 7, "http://www.ChibiAkumas.co","m"+&80
			db 5, " "," "+&80

			db 8, "Written By Keith S. 201","8"+&80
			db 5,""," "+&80
			db 5,""," "+&80
			db 254
			db 4,  "This Game was developed with the following free software",":"+&80
			db 5,  "WinApe, ConvImgCpc, Krita, ArkosTracker, ArnoldEmu, OpenMSX"," "+&80
			;      .1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
			;      .9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0 9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0

			db 7,  "FUSE,EP128 and roudoudou's LZ48Decrunc compresso","r"+&80
			db 5,""," "+&80
			db 4,  "Thanks to My Patreon backers, who's support and encouragement"," "+&80
			db 13,  "made this game possible",":"+&80
			db 4,  "Alejandro Perez, Dimitris Topouzis, Ervin Pajor, Ivar Fiske,"," "+&80
			db 9,  "James Ford, krt17, Laurens Holst, Remax,"," "+&80
			db 5,  "Michael Steil, Peter Jones, Rajasekaran Senthil Kumaran,"," "+&80
			db 7 , "Rob Uttley, Shane O'Brien & Themistocles/Gryzor"," "+&80


			db 5,""," "+&80
			

			;      .1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
			;      .9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0 9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0
			db 252,9,"Press Fire to Continu","e"+&80
			db &00
else
	Credits_TextString: 
			IFDEF COMPILEEP2
				DB 8,"CHIBI AKUMAS EPISODE 2","!",255
			ELSE
				DB 8,"CHIBI AKUMAS EPISODE 1","!",255
			ENDIF
			DB 17,"V1.666"," ",255
			DB 7, "HTTP://WWW.CHIBIAKUMAS.CO","M",255
			DB 5, " "," ",255

			DB 8, "WRITTEN BY KEITH S. 201","8",255
			DB 5,""," ",255

			DB 254
			DB 4,  "THANKS TO MY PATREON BACKERS, WHO'S SUPPORT AND ENCOURAGEMENT",255
			DB 13,  "MADE THIS GAME POSSIBLE",":",255
			;      .1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0
			;      .9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0 9 9 8 8 7 7 6 6 5 5 4 4-----------
;			db 4,  "Alejandro Perez,Barry White,Benny Damsgaard,Brainslave,Blastar,"," "+&80
;			db 6,  "DavidB,Dean Howell, Dimitris Topouzis, Ervin Pajor,"," "+&80
;			db 4,  " Hamlet440,Ivar Fiske, James Ford, Laurens Holst,Richard Farrell"," "+&80
;			db 5 , "Oleg Tcymbaliuk,Paul Barrick,Remax, Michael Steil,robsoft,"," "+&80
;			db 10 , "sal gunduz, Shane O'Brien & Themistocles/Gryzor"," "+&80
			DB 4,  "ALEJANDRO PEREZ,BARRY WHITE,BENNY DAMSGAARD,BRAINSLAVE,BLASTAR,",255
			DB 4,  DAVIDB,DEAN HOWELL, DIMITRIS TOPOUZIS, ERVIN PAJOR,",255
			DB 4,  "HAMLET440,IVAR FISKE,JAMES FORD,LAURENS HOLST,RICHARD FARRELL,",255
			DB 5 , "OLEG TCYMBALIUK,PAUL BARRICK,REMAX, MICHAEL STEIL,ROBSOFT,",255
			DB 7 , "SAL GUNDUZ, SHANE O'BRIEN & THEMISTOCLES/GRYZOR",255
			DB 5,""," ",255

			DB 252,7,"SPECIAL THANKS TO N.I FOR",255
			DB 252,9,"JAPANESE TRANSLATIONS",255
			;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 
			;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
			DB 252,11,"HTTP://NI.X0.COM",255

			DB 5, " ",255

			;      .1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
			;      .9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0 9 9 8 8 7 7 6 6 5 5 4 4 3 3 2 2 1 1 0 0
			DB 252,9,"PRESS FIRE TO CONTINU","E",255
			DB &00
endif 
Keys_WaitForRelease:
ifdef BuildMSX
	ld b,13
else
	ld b,10
endif

	push bc
	call AkuYou_Player_ReadControls
	pop bc
Keys_WaitForRelease_More:
	ld a,(hl)
	inc hl
	cp 255
	jr c,Keys_WaitForRelease
	djnz Keys_WaitForRelease_More
ret

	;call RasterColors_Reset
LevelLoop:
	;jp ShowCheats
	jp ShowMenu
	

LevelShutdown:

ret


;---------------------------------------------------------------------------------------------


; 					Cheat For Victory!


;---------------------------------------------------------------------------------------------



INTCHEAT: DB 0
TXTCHEAT: DB "CHEAT","S",endchar
TXTCHEAT1: DB "O","N",endchar
TXTCHEAT0: DB "OF","F",endchar


INTPLAYERSNUM: DB 0
TXTPLAYERSNUM: DB "PLAYER","S",endchar

TXTPLAYERS0: DB "CHIBIK","O",endchar
TXTPLAYERS1: DB "BOCHA","N",endchar
TXTPLAYERS2: DB "TWO PLAYE","R",endchar

INTGAMEENGINEMODE: DB 0

TXTGAMEENGINEMODE: DB "GAME ENGIN","E",endchar
TXTENGINE0:  DB "464"," ",endchar
TXTENGINE1:  DB "464+"," ",endchar
TXTENGINE2:  DB "6128"," ",endchar
TXTENGINE3:  DB "6128+"," ",endchar
TXTENGINE4:  DB "7256"," ",endchar
TXTENGINE5:  DB "7256+"," ",endchar

TXTGAMEENGINEAPPLY: DB "APPLY GAME ENGINE","E",endchar



TXTCHEATMAINMENU: DB "MAIN MEN","U",endchar


lstGameEngineMode:
	defb 0
	defw txtEngine0
	defb 1
	defw txtEngine1
	defb 0+128
	defw txtEngine2
	defb 1+128
	defw txtEngine3
	defb 0+128+64
	defw txtEngine4
	defb 1+128+64
	defw txtEngine5
	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstGameEngineMode

lstPlayers:
	defb 0
	defw txtPlayers0
	defb 1
	defw txtPlayers1
	defb 2
	defw txtPlayers2

	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstPlayers

lstCheats:
	defb 0
	defw txtCheat0
	defb 1
	defw txtCheat1


	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstCheats


intJumpToLevel: db 0

TXTLEVELJUMP: DB "JUMP TO LEVEL","L",endchar
TXTLEVELJUMPAPPLY: DB "MAKE LEVEL JUM","P",endchar
TXTLEVEL0: DB "0 - MEN","U",endchar


IFDEF COMPILEEP1
TXTLEVEL1: DB "1.1 - EP","1",endchar
TXTLEVEL2: DB "1.2 - EP","1",endchar
TXTLEVEL3: DB "2.1 - EP","1",endchar
TXTLEVEL4: DB "2.2 - EP","1",endchar
TXTLEVEL5: DB "3.1 - EP","1",endchar
TXTLEVEL6: DB "3.2 - EP","1",endchar
TXTLEVEL7: DB "4.1 - EP","1",endchar
TXTLEVEL8: DB "4.2 - EP","1",endchar
TXTLEVEL9: DB "4.3 - EP","1",endchar

TXTLEVEL250: DB "ENDINTRO - EP","1",endchar
TXTLEVEL251: DB "ENDOUTRO - EP","1",endchar
TXTLEVEL252: DB "INTRO - EP","1",endchar
ENDIF


TXTLEVEL11: DB "1.1 - EP","2",endchar
TXTLEVEL12: DB "1.2 - EP","2",endchar
TXTLEVEL13: DB "2.1 - EP","2",endchar
TXTLEVEL14: DB "2.2 - EP","2",endchar
TXTLEVEL15: DB "3.1 - EP","2",endchar
TXTLEVEL16: DB "3.2 - EP","2",endchar
TXTLEVEL17: DB "4.1 - EP","2",endchar
TXTLEVEL18: DB "4.2 - EP","2",endchar
TXTLEVEL19: DB "5.1 - EP","2",endchar
TXTLEVEL20: DB "5.2 - EP","2",endchar

TXTLEVEL240: DB "INTRO - EP","2",endchar
TXTLEVEL241: DB "ENDINTRO - EP","2",endchar
TXTLEVEL242: DB "ENDOUTRO - EP","2",endchar


posLevelJump equ 7
posPlayersNum equ 9
posCheats equ 11
posLevelJumpApply equ 13
posGameEngineMode equ 15
posGameEngineApply equ 17
posCheatMainMenu equ 19

lstLevelJump:
	defb 0
	defw txtLevel0

ifdef CompileEP1

	defb 1
	defw txtLevel1
	defb 2
	defw txtLevel2
	defb 3
	defw txtLevel3
	defb 4
	defw txtLevel4
	defb 5
	defw txtLevel5
	defb 6
	defw txtLevel6
	defb 7
	defw txtLevel7
	defb 8
	defw txtLevel8
	defb 9
	defw txtLevel9
	defb 250
	defw txtLevel250
	defb 251
	defw txtLevel251
	defb 252
	defw txtLevel252
endif

ifdef CompileEP2
	defb 11
	defw txtLevel11
	defb 12
	defw txtLevel12
	defb 13
	defw txtLevel13
	defb 14
	defw txtLevel14
	defb 15
	defw txtLevel15
	defb 16
	defw txtLevel16
	defb 17
	defw txtLevel17
	defb 18
	defw txtLevel18
	defb 19
	defw txtLevel19
	defb 20
	defw txtLevel20
	defb 240
	defw txtLevel240
	defb 241
	defw txtLevel241
	defb 242
	defw txtLevel242
endif


	defb 0	;First one again - this is the loop
	defw 00 ;Command to show end of list
	defw lstLevelJump

ShowCheats:
;	ld hl,BlankMsg
;	ld (CheatsSettingsMessage_Plus2-2),hl

	ld hl,&0407		;hl = startpos
	ld bc,&0002		;bc = movespeed
	ld ix,&2602		;ix = MinX,MaxX
	ld iy,&1206		;iy = MinY,MaxY
	call OnscreenCursorDefine;test


ShowCheatsAgain:
	ei
	halt
	halt
	halt
	halt
	halt
	halt
	ld a,255
	ldia		; show up to 255 chars
	call Akuyou_CLS
	ld l,4
	ld bc,CheatsText
	call ShowText


;	ld a,255
;	ld i,a		; show up to 255 chars
;	ld l,24
;	ld bc,BlankMsgCheatsSettingsMessage_Plus2
;	call ShowText



	;LevelJump
	ld hl,&0600+posLevelJump
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtLevelJump
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,20
	call AddAndLocate
	ld a,(intJumpToLevel)
;	call Akuyou_DrawText_Decimal
	ld hl,lstLevelJump
	call DrawTextFromLookup



	;PlayerNum
	ld hl,&0600+posPlayersNum
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtPlayersNum
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,20
	call AddAndLocate
	ld a,(intPlayersNum)
;	call Akuyou_DrawText_Decimal
	ld hl,lstPlayers
	call DrawTextFromLookup




	;Cheats
	ld hl,&0600+posCheats
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtCheat
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,20
	call AddAndLocate
	ld a,(intCheat)
	ld hl,lstCheats
	call DrawTextFromLookup



	;LevelJump
	ld hl,&0600+posLevelJumpApply 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtLevelJumpApply
		call Akuyou_DrawText_PrintString
	pop hl








	;GameEngine
	ld hl,&0600+posGameEngineMode
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtGameEngineMode
		call Akuyou_DrawText_PrintString
	pop hl
	ld a,20
	call AddAndLocate
	ld a,(intGameEngineMode)
;	call Akuyou_DrawText_Decimal
	ld hl,lstGameEngineMode
	call DrawTextFromLookup



	;GameEngineApply
	ld hl,&0600+posGameEngineApply 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtGameEngineApply
		call Akuyou_DrawText_PrintString
	pop hl

	;GameEngineApply
	ld hl,&0600+posCheatMainMenu 
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtCheatMainMenu
		call Akuyou_DrawText_PrintString
	pop hl




	;MainMenu
	ld hl,&0600+posCheatMainMenu  
	push hl
		call Akuyou_DrawText_LocateSprite
		ld bc,txtCheatMainMenu
		call Akuyou_DrawText_PrintString
	pop hl



ShowCheats2:


	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw

	call AkuYou_Player_ReadControls

	ld a,ixl
	and ixh
	or Keymap_AnyFire;%11110001
	cp 255
	jp nz,Cheats_Apply

	call OnscreenCursor

jp ShowCheats2
Cheats_Apply:
	ld a,(CursorCurrentPosXY_Plus2-2)
	cp posLevelJump
	jr z,Cheats_ApplyLevel
	cp posLevelJumpApply
	jr z,Cheats_LevelJump
	cp posPlayersNum
	jr z,Cheats_ApplyPlayersNum
	cp posCheats
	jr z,Cheats_Cheats


	cp posGameEngineMode
	jr z,Cheats_ChangeGameEngineMode
	cp posGameEngineApply 
	jr z,Cheats_ApplyGameEngineMode

	cp posCheatMainMenu  
	jp z,showmenu


jp ShowCheats2

Cheats_ChangeGameEngineMode:
	ld a,(intGameEngineMode)
	ld hl,lstGameEngineMode
	call ToggleFromLookup
	ld (intGameEngineMode),a
jp ShowCheatsAgain

Cheats_ApplyGameEngineMode:
	call AkuYou_Player_GetPlayerVars
	ld a,(intGameEngineMode)
	ld (iy-1),a
jp ShowCheatsAgain

Cheats_ApplyPlayersNum:
	ld a,(intPlayersNum)
	ld hl,lstPlayers
	call ToggleFromLookup
	ld (intPlayersNum),a
jp ShowCheatsAgain

Cheats_Cheats:
	ld a,(intCheat)
	ld hl,lstCheats
	call ToggleFromLookup
	ld (intCheat),a
jp ShowCheatsAgain

Cheats_ApplyLevel:
	ld a,(intJumpToLevel)
	ld hl,lstLevelJump
	call ToggleFromLookup
	ld (intJumpToLevel),a
jp ShowCheatsAgain

Cheats_LevelJump:
	
	;level

	ld a,1
	ld h,a
	ld a,(intJumpToLevel)
	ld l,a
	push hl

	;cheats n bits
	ld a,(intPlayersNum)
	ld h,a		
	ld a,(intCheat)
	ld l,a
	push hl

	ld hl,	&0008 				;load EndSetquence
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

Turbomode:
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-8)
	inc a
	ld (iy-8),a




CheatsText: 
db  6,"TOOLS FOR CHEATING BASTARDS","!",endchar

db &0



;---------------------------------------------------------------------------------------------




ShowText:
	call SetFont2b

ShowText_MoreText:
	ld a,255
	ldia	; show up to 255 chars

	ld a,(bc)
	cp 252
	call z,SetFont2
	cp 254
	call z,SetFont1
	cp 253	
	call z,ZeroPos ;bugfix!
	
	ld h,a
	inc bc

	push hl
		call Akuyou_DrawText_LocateSprite
	ifdef BuildMSX
		di
	endif
		call Akuyou_DrawText_PrintString
	ifdef BuildMSX
		ei
	endif
	pop hl

	inc l
	ldai
	dec a
	ldia
	inc bc

	ld a,(bc)
	or a
	jp nz,ShowText_MoreText

	
ret
ZeroPos:	
	xor a
	ret

SetFont1:

	ld a,1
	call SetFontA
	jr SetFontFinish

SetFont2:
	call SetFont2b
SetFontFinish:
	inc bc
	ld a,(bc)
	ret
	
SetFont2b:
	ld a,2
SetFontA:
	push bc
	push hl
		call Akuyou_SpriteBank_Font
	pop hl
	pop bc
ret

;***************************************************************************************************

;					Eye Catches

;***************************************************************************************************

ifdef CompileEP2



EyeCatches_Menu:
	db  12,"Unlocked Bonuses","!"+&80
	db  10,""," "+&80
;      		.1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;   	        .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
Eyecatch0text_minus3:
	db  15,"1.Chibiko"," "+&80
Eyecatch1text_minus3:
	db  15,"2.Bochan "," "+&80
Eyecatch2text_minus3:
	db  15,"3.Yumi   "," "+&80
Eyecatch3text_minus3:
	db  15,"4.Yume   "," "+&80
Eyecatch4text_minus3:
	db  15,"5.Sakuya "," "+&80
	db  15,"Main Menu"," "+&80
	db &0
EyeCatchesKill:	
	push af
		ld bc,EyeCatches_Loop
		ld (hl),c
		inc hl
		ld (hl),b
		ex hl,de
		ld a,'?'
		ld b,7
EyeCatchQwipe:
		ld (hl),a
		inc hl
		djnz EyeCatchQwipe

	pop af
	ret
EyeCatches:

	call Akuyou_CLS

	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)

	bit 0,a
	ld hl,Eyecatch0Jump_Plus2-2
	ld de,Eyecatch0text_minus3+3
	call z,EyeCatchesKill

	bit 1,a
	ld hl,Eyecatch1Jump_Plus2-2
	ld de,Eyecatch1text_minus3+3
	call z,EyeCatchesKill

	bit 2,a
	ld hl,Eyecatch2Jump_Plus2-2
	ld de,Eyecatch2text_minus3+3
	call z,EyeCatchesKill

	bit 3,a
	ld hl,Eyecatch3Jump_Plus2-2
	ld de,Eyecatch3text_minus3+3
	call z,EyeCatchesKill

	bit 4,a
	ld hl,Eyecatch4Jump_Plus2-2
	ld de,Eyecatch4text_minus3+3
	call z,EyeCatchesKill

	

	call Keys_WaitForRelease
	ld hl,YumiYume_Menu_EP2		;Event Stream
	call ResetEventStream


	call Akuyou_CLS
	ld a,2
	call Akuyou_SpriteBank_Font

	ld a,255
	ldia		; show up to 255 chars
	
	ld l,10
	ld bc,EyeCatches_Menu
	call ShowText

	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call Akuyou_ObjectArray_Redraw






	ld hl,&0D0C		;hl = startpos
	ld bc,&0001		;bc = movespeed
	ld ix,&2602		;ix = MinX,MaxX
	ld iy,&110C		;iy = MinY,MaxY
	call OnscreenCursorDefine;test
EyeCatches_Loop:
	

	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	ei
	halt
	call AkuYou_Player_ReadControls

	ld a,ixl
	and ixh
	or Keymap_AnyFire;%11110001
	cp 255
	jp nz,EyeCatches_Selection
	call OnscreenCursor

	jp EyeCatches_Loop
EyeCatches_Selection:
	ld a,(CursorCurrentPosXY_Plus2-2)
	cp &0C
	jp z,EyeCatches_Chibiko	:Eyecatch0Jump_Plus2
	cp &0D
	jp z,EyeCatches_Bochan	:Eyecatch1Jump_Plus2
	cp &0E
	jp z,EyeCatches_Yumi	:Eyecatch2Jump_Plus2
	cp &0F
	jp z,EyeCatches_Yume	:Eyecatch3Jump_Plus2
	cp &10
	jp z,EyeCatches_Sakuya	:Eyecatch4Jump_Plus2
	cp &11
	jp z,ShowMenu


EyeCatches_Chibiko:
	ld hl,&33C1
	ld c,2
	push bc
	push hl
		ld hl,TimeColorsChibiko
		jr EyeCatchesExecute

EyeCatches_Bochan:
	ld hl,&33C2
	ld c,2
	push bc
	push hl
		ld hl,TimeColorsBochan
		jr EyeCatchesExecute

EyeCatches_Yumi:
	ld hl,&33C3
	ld c,2
	push bc
	push hl
		ld hl,TimeColorsYumi
		jr EyeCatchesExecute

EyeCatches_Yume:
	ld hl,&33C4
	ld c,2
	push bc
	push hl
		ld hl,TimeColorsYume
		jr EyeCatchesExecute

EyeCatches_Sakuya:
	ld hl,&33C5
	ld c,2
	push bc
	push hl
		ld hl,TimeColorsSakuya
		jr EyeCatchesExecute

EyeCatchesExecute:
;	ld de,TimeColorsEyeCatches
;	ld (EyecatchSecondColor_Plus2-2),de

	ld a,0
	call Akuyou_SetLevelTime

	ld b,10
EyeCatches_ColorRefresh:
	push bc
		call Akuyou_Timer_UpdateTimer
		call Akuyou_EventStream_Process
	pop bc
	djnz EyeCatches_ColorRefresh


			call Akuyou_RasterColors_Disable
			call Akuyou_ScreenBuffer_Reset	
			call Akuyou_CLS
			call Akuyou_Firmware_Restore

			ld a,&C0		:EyeCatchBankA_Plus1
			ld de,&C000		:EyeCatchMemA_Plus2
			ld ix,&FF00		:EyeCatchMem2A_Plus2
		pop hl
		pop bc
		call Akuyou_LoadDiscSectorZ
	
		call Akuyou_Firmware_kill
		ld de,&8000
		ld hl,&C000			:EyeCatchMemB_Plus2
		ld bc,&3F00
		ld a,&C0			:EyeCatchBankB_Plus1
		call Akuyou_BankSwitch_C0_BankCopy

		call Akuyou_RasterColors_Init
		call Akuyou_Music_Restart
		ei

		Call &8000			


EyeCatches_Pause:
	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call AkuYou_Player_ReadControls
	ld a,ixl
;	or iyl
	or Keymap_AnyFire
	cp 255
	jp nz,EyeCatches_ShowBio
	jr EyeCatches_Pause
EyeCatches_ShowBio:
		call Akuyou_CLS
		Call &8003
		ld l,0
	call ShowText
	ei
	halt
	call Keys_WaitForRelease
	ld hl,TimeColorsEyeCatches :EyecatchSecondColor_Plus2
	ld a,0
	call Akuyou_SetLevelTime
EyeCatches_Pause2:
	call Akuyou_Timer_UpdateTimer
	call Akuyou_EventStream_Process
	call AkuYou_Player_ReadControls
	ld a,ixl
;	or iyl
	or Keymap_AnyFire
	cp 255
	jp nz,EyeCatches
	jr EyeCatches_Pause2


endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			CPC Raster Switcher

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if buildCPCv+buildENTv
	read "..\SrcCPC\Akuyou_CPC_Level_GenericRasterSwitcher.asm"
endif






ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
endif








ConfigureControls:
	ld hl,	&0002 				;Set Controls
	call	Akuyou_ExecuteBootStrap	; Start the game, no return
SaveShowMenu:
	call Akuyou_CLS
	ld hl,	&0003 				;Save Settings
	call	Akuyou_ExecuteBootStrap	; Start the game, no return
ifdef BuildZXS
	call Akuyou_Interrupt_Init
endif
jp ShowMenu




	; clear the screen
;	ld a,&C0
;	ld d,a
;	ld h,a
;	ld e,&01
;	ld BC,&3FFF
;	ld l,&00
;	xor a
;	ld (hl),a
;	ldir
;ret




TimeColorsYumi:
	defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&47,&5F,&4B

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
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
defw PauseLoop
defb 100



TimeColorsSakuya:
	defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&59,&4B

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
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
defw PauseLoop
defb 100


TimeColorsYume:
	defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&47,&4D,&4B

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
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
defw PauseLoop
defb 100




TimeColorsChibiko:
	defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5F,&4B	

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
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
defw PauseLoop
defb 100

TimeColorsBochan:
	defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&47,&52,&40

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
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
defw PauseLoop
defb 100




TimeColorsEyeCatches:
	defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&57,&5B,&4B

	defb 240,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
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
defw PauseLoop
defb 100


null:ret




LevelJumpBlock:
;ifdef buildCPC
;	org Akuyou_LevelStart+ &3ff0
;else
	defs FileBeginLevel+&3FF0-LevelJumpBlock
;endif



jp LevelInit; - Level Start &3ff0
jp LevelLoop; - Level loop &3ff3
FileEndLevel:
limit &FFFF
ifdef  buildCPC
	save "Z:\ResCPC\T08-SC1.D01",FileBeginLevel,FileEndLevel-FileBeginLevel	;address,size...}[,exec_address]
endif




;save direct "T08-SC1.D01",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]



