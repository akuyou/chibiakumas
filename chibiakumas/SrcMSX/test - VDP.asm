buildMSX equ 1
write "..\RelMSX\disk\msxtest"

; MSX HEADER BLOAD header, before the ORG so that the header isn't counted
	db &FE     ; magic number
	dw FileBegin    ; begin address
	dw FileEnd - 1  ; end address
	dw Execute  ; program execution address (for ,R option)


;WRTVDP (012DH)
  ;Function	writes data in the VDP register
  ;Input	C for the register number, B for data
  ;Output	none
  ;Registers	AF, BC


;VDPSTA (0131H)
  ;Function	reads the VDP register
  ;Input	A for the register number (0 to 9)
  ;Output	A for data
  ;Registers	F


;SETPAG (013DH)
  ;Function	switches the page
  ;Input	DPPAGE (FAF5H) for the display page number
		;ACPAGE (FAF6H) for the active page number
  ;Output	none
  ;Registers	AF

;WRTVDP equ &012D
;VDPSTA equ &0131
;SETPAG equ &013D
CHPUT  equ &00A2




VScreen_MinY equ 32
VScreen_MinX equ 40

VScreen_MaxY equ 224
VScreen_MaxX equ 168

SprShow_SprNum equ SprShow_SprNum_Plus1-1




; Compilation address, somewhere out of the way of small basic programs
	org &8100
FileBegin:

; Program code entry point
Execute:
	di

	call Bankswapper_Init
	call Bankswapper_FullRam
	call VDP_SetScreenMode4
;	call DiskDriverInit	



	ld hl,MyPalette
	Call VDP_SetPalette




	
	ld a,0
	Call ReadSpriteIntoBank
	ld a,0
	Call ReadSpriteIntoBank
	ld a,1
	Call ReadSpriteIntoBank
	ld a,1
	Call ReadSpriteIntoBank
	ld a,2
	Call ReadSpriteIntoBank
	ld a,2
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,6
	Call ReadSpriteIntoBank
	ld a,3
	Call ReadSpriteIntoBank
	ld a,3
	Call ReadSpriteIntoBank
	ld a,5
	Call ReadSpriteIntoBank
	ld a,5
	Call ReadSpriteIntoBank
	ld a,5
	Call ReadSpriteIntoBank
	ld a,5
	Call ReadSpriteIntoBank
	ld a,7
	Call ReadSpriteIntoBank
	ld a,7
	Call ReadSpriteIntoBank


di
ld a,&C3
ld (&38),a
ld hl,InterruptHandler
ld (&39),hl
ei

again:
	di
	call Timer_UpdateTimer
	call ScreenBuffer_Flip

;	call Akuyou_ScreenBuffer_GetActiveScreen
;	ld a,&40
;	ld h,a
;	ld l,&1F ;&4F+1 ; Had to remove 1 for Speccy layout!


	ld hl,(ScreenBuffer_YY)
	ld de,NewGradient
	ld b,192
	ld c,%11111111
	call Background_Gradient








	ld hl,134 :MyX_PLus2
	ld (VDP_MyLMMM_DX),hl
	ld hl,112 :MyY_PLus2

	ld (VDP_MyLMMM_DY),hl

call VDP_Wait

	ld a,0
	ld (SprShow_SprNum),a
	call ShowSprite

call VDP_Wait


	call KeyboardScanner_Read
	call Player_ReadControls
;	di
;	halt
	ld a,ixl
	bit Keymap_U,a
	jp nz,SpriteTest2
	ld a,(MyY_PLus2-2)
	dec a
	ld (MyY_PLus2-2),a
SpriteTest2:
	ld a,ixl
	bit Keymap_D,a
	jp nz,SpriteTest3
	ld a,(MyY_PLus2-2)
	inc a
	ld (MyY_PLus2-2),a
SpriteTest3:
	ld a,ixl
	bit Keymap_L,a
	jp nz,SpriteTest4
	ld a,(MyX_Plus2-2)
	dec a
	ld (MyX_Plus2-2),a
SpriteTest4:
	ld a,ixl
	bit Keymap_R,a
	jp nz,SpriteTest5
	ld a,(MyX_Plus2-2)
	inc a
	ld (MyX_Plus2-2),a
SpriteTest5:
ei
halt



jp again




InterruptHandler:
	;need to read Status register 0 to reset the timer
	xor a;	ld a,0
	out (VdpOut_Control),a
	ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
	out (VdpOut_Control),a
	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2


	ld a,2
	out (VdpOut_Control),a
	ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
	out (VdpOut_Control),a
	ei
ret




NewGradient:
gradstart equ 192

defb &FF,&FF,&FF,&FF	;1; first line
defb gradstart-10, &FF,&F0	;4
defb gradstart-20, &0F,&0F	;4
defb gradstart-30, &F0,&00	;4
defb gradstart-40,&00,&00
defb gradstart-50,&00,&00


defb 40, &F0,&00	;4
defb 30, &0F,&0F	;4
defb 20, &FF,&F0	;4
defb 10	,&FF,&FF	;20
defb 02	,&FF,&FF	;20
defb 255





ld hl,&0000
	ld hl,0;255
	LD (VDP_MyHMMM_SX),hl
	ld hl,192
	LD (VDP_MyHMMM_SY),hl
	LD (VDP_MyHMMM_DY),hl
	ld hl,4;255-4
	LD (VDP_MyHMMM_DX),hl

	ld hl,256-4
	ld (VDP_MyHMMM_NX),hl	
	ld hl,192
	ld (VDP_MyHMMM_NY),hl
	;     ----YX--
	ld a,%00001000		;[ 0 ] [ - ] [MXD] [ - ] [DIY] [DIX] [ - ] [ - ]
	ld (VDP_MyHMMM_MV),a

	ld hl,VDP_MyHMMM
	call VDP_HMMM

	call VDPWait
halt





halt






	ld hl,&0000
	ld (VDP_MyHMMC_DX),hl
	ld (VDP_MyHMMC_DY),hl
	ld hl,4
	ld (VDP_MyHMMC_NX),hl
	ld hl,192
	ld (VDP_MyHMMC_NY),hl
	ld a,192
	push af
		ld hl,VDP_MyHMMC
		call VDP_HMMC_generated
	pop af
MoreBytesHMMC:
		out (VdpOut_Indirect),a
	dec a
		out (VdpOut_Indirect),a
	jp nz,MoreBytesHMMC




	ld hl,&0000
	LD (VDP_MyHMMM_SX),hl
	LD (VDP_MyHMMM_SY),hl
	LD (VDP_MyHMMM_DY),hl
	ld hl,4
	LD (VDP_MyHMMM_DX),hl

	ld hl,256-4
	ld (VDP_MyHMMM_NX),hl	
	ld hl,192
	ld (VDP_MyHMMM_NY),hl
	
	ld a,0
	ld (VDP_MyHMMM_MV),a

	ld hl,VDP_MyHMMM
	call VDP_HMMM
halt

fillagain:
	ld a,r
	ld (MyHMMV_Byte),a
	call HMMVtest
	call VDPWait
jp fillagain

	ld hl,256
	ld (MyHMMV_DY),hl
	ld a,128
	ld (MyHMMV_Byte),a

	call HMMVtest
	call VDPWait


	call VdpResetStatus

	ld a,0









;	ld hl,MyPalette
;	Call SetPalette


	;Call MemFillTest	
;	Call HMMCTest
;	call YMMMtest
;	call HMMMtest
;	call LMMMtest
di 
halt






	XOR	A
	OUT	(VdpOut_Control),A
	LD	A,&80+15				; R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
	OUT	(VdpOut_Control),A			; select vdp statusregister 0
	ei
Loop:
	
	ld a,(hl)
	and a
	ret z
	call CHPUT
	inc hl
	jr Loop

; Data
helloWorld:
	db "Hello world!",0



SetScreenMode4:
	ld a,%00000110		;6 - set graphics screen mode bits
	out (VdpOut_Control),a
	ld a,128+0		;[ 0 ] [DG ] [IE2] [IE1] [M5] [M4] [M3] [ 0 ]
	out (VdpOut_Control),a
	
	ld a,%01100000  ; Enable Screen - Enable Retrace Interrupt
	out (VdpOut_Control),a
	ld a,128+1	;R#1  [ 0 ] [BL ] [IE0] [M1 ] [ M2] [ 0 ] [SI ] [MAG] 
	out (VdpOut_Control),a
	
	
	
	ld a,31
	out (VdpOut_Control),a
	ld a,128+2		;Pattern layout table
	out (VdpOut_Control),a
	
	ld a,239
	out (VdpOut_Control),a
	ld a,128+5		; Sprite Attrib Table Low
	out (VdpOut_Control),a
	
	ld a,%11110001	;7
	out (VdpOut_Control),a
	ld a,128+7		;Text and screen margin color
	out (VdpOut_Control),a
	
	ld a,128
	out (VdpOut_Control),a
	ld a,128+10		;Color Table High (Shrug)
	out (VdpOut_Control),a
	
	ld a,%00001010		;Set up Vram (Shrug!) [VR=1] [SPD=SpriteDisable] 
	out (VdpOut_Control),a
	ld a,128+8		;R#8  [MS ] [LP ] [TP ] [CB ] [VR ] [ 0 ] [SPD] [BW ] 
	out (VdpOut_Control),a

	ld a,%00000000 	;[LN ]=1 212 lines / [LN ]=0 = 192 lines
	out (VdpOut_Control),a
	ld a,128+9	        ;R#9  [LN ] [ 0 ] [S1 ] [S0 ] [IL ] [E0 ] [*NT] [DC ]
	out (VdpOut_Control),a
ret



 
MemFillTest:


;
;Set VDP address counter to read from address AHL (17-bit)
;Enables the interrupts

;SetVdp_Read:
;	rlc	h
;	rla
;	rlc	h
;	rla
;	srl	h
;	srl	h
;	di
;	out	(#99),a
;	ld	a,14+128
;	out	(#99),a
;	ld	a,l
;	nop
;	out	(#99),a
;	ld	a,h
;	ei
;	out	(#99),a
;	ret



;R#14  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [ 0 ] [A16] [A15] [A14] - Set Address counter (#00000-#1FFFF)
;set Address Reg Pointer

	ld a,0			
	out (VdpOut_Control),a
	ld a,128+14		;R#14     [ 0 ] [ 0 ] [ 0 ] [ 0 ] [ 0 ] [A16] [A15] [A14] - Set Address counter (#00000-#1FFFF)
	out (VdpOut_Control),a
	ld a,0			;Port #1  [A7 ] [A6 ] [A5 ] [A4 ] [A3 ] [A2 ] [A1 ] [A0 ]	
	out (VdpOut_Control),a
	ld a,%01000000+0	;Port #1  [ 0 ] [RW ] [A13] [A12] [A11] [A10] [A9 ] [A8 ] 
	out (VdpOut_Control),a
	
	ld c,255
	ld b,32
DoSomeMore:
	ld a,c
	out (VdpOut_Data),a
	djnz DoSomeMore
	dec c
	jp nz,DoSomeMore
	
ret 

HMMVtest:	
	ld hl,MyHMMV		;HMMV (High speed move VDP to VRAM) (Flood Fill Byte)


VdpOutFrom36:
	ld a,36				;AutoInc From 36
	out (VdpOut_Control),a		
	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
	out (VdpOut_Control),a

	ld c,VdpOut_Indirect
	defb &ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3
ret



MyHMMV:	
MyHMMV_DX:	defw &0000 ;DX 36,37
MyHMMV_DY:	defw &0000 ;DY 38,39
	defw &0100 ;NX 40,41
	defw &00C0 ;NY 42,43
MyHMMV_Byte:
	defb 64   ;Color 44
	defb 0     ;Move 45
	defb %11000000 ;Command 46	






;HMMMtest	;(High speed move VRAM to VRAM) (Blit Bytes)
;	ld hl,MyHMMM
;
;	;Set the autoinc for more data
;	ld a,32				;AutoInc From 36
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
;	out (VdpOut_Control),a



;	ld c,VdpOut_Indirect
	;outi x 15
;	defb &ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3
;ret
;MyHMMM
;MyHMMM_SX	defw &0000 ;SY 32,33
;MyHMMM_SY	defw &0000 ;SY 34,35
;MyHMMM_DX	defw &0060 ;DX 36,37
;MyHMMM_DY	defw &0060 ;DY 38,39
;MyHMMM_NX	defw &0040 ;NX 40,41 
;MyHMMM_NY	defw &0040 ;NY 42,43
;		defb 0     ;Color 44 - unused
;MyHMMM_MV	defb 0     ;Move 45
;		defb %11010000 ;Command 46	





;LMMMtest:	
;	;Copy an area of Vram from one place to another - with Logical conditions (Transparency)
;
;	;Set the autoinc for more data
;	ld a,32				;AutoInc From 36
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
;	out (VdpOut_Control),a
;
;
;
;	ld c,VdpOut_Indirect
;	;outi x 15
;	defb &ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3
;ret
;MyLMMM:
;MyLMMM_SX	defw &0000 ;SY 32,33
;MyLMMM_SY	defw &0000 ;SY 34,35
;MyLMMM_DX	defw &0060 ;DX 36,37
;MyLMMM_DY	defw &0060 ;DY 38,39
;MyLMMM_NX	defw &0040 ;NX 40,41 
;MyLMMM_NY	defw &0040 ;NY 42,43
;		defb 0     ;Color 44 - unused
;MyLMMM_MV	defb 0     ;Move 45
;		defb %10011000 ;Command 46	
;

YMMMtest:	; (High speed move VRAM to VRAM, Y coordinate only) (Blit with paralell X co-ords)
	ld hl,MyYMMM

	;Set the autoinc for more data
	ld a,34				;AutoInc From 36
	out (VdpOut_Control),a		
	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
	out (VdpOut_Control),a



	ld c,VdpOut_Indirect
	outi
	outi
	outi
	outi
	outi
	outi
	outi
	outi
	outi
	outi
	outi
	outi
	outi
ret


VdpResetStatus
	;Reset Status for interrupts
	ld a,0
	out (VdpOut_Control),a
	ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
	out (VdpOut_Control),a
ret

VDPWait:

	;Get The status register - Disable interrupts!
	ld a,2			;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	out (VdpOut_Control),a
	ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
	out (VdpOut_Control),a
	ld hl,&0000
VDPWait_Wait:
	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	bit 0,a
	ret z
	inc hl
	jp VDPWait_Wait



MyYMMM:
	defw &0000 ;SY 34,35
	defw &0000 ;DX 36,37
	defw &0001 ;DY 38,39
	defw &0100 ;NX 40,41 - unused 
	defw &00C0 ;NY 42,43
	defb 0     ;Color 44 - unused
	defb 0     ;Move 45
	defb %11100000 ;Command 46	

;HMMCgenerated			;Fill ram from calculated values (first in A)
;;	ld hl,MyHMMC		 (High speed move CPU to VRAM) (Blit Bytes from OUTI)
;	ld (MyHMMCByte),a
;
;	;Set the autoinc for more data
;	ld a,36				;AutoInc From 36
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
;	out (VdpOut_Control),a
;
;
;	ld c,VdpOut_Indirect
;;	outi X 11
;	defb &ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3
;
;	;Set the autoinc for more data
;	ld a,128+44			;128 = NO Increment ;R#44    Color byte
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register
;	out (VdpOut_Control),a
;ret





HMMCTest:
	ld a,(de)
	ld (MyHMMCByte),a
	inc de
	call VDP_GetStatusRegister


	call VDP_HMMC_Generated

	;Set the autoinc for more data
;	ld a,36				;AutoInc From 36
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
;	out (VdpOut_Control),a
;
;
;	ld c,VdpOut_Indirect
	;outi
;	outi
;	outi
;	outi
;	outi
;;	outi
;	outi
;	outi
;	outi
;	outi
;	outi

	;Get The status register - Disable interrupts!
;	ld a,2			;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
;	out (VdpOut_Control),a
;	ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
;	out (VdpOut_Control),a

	;Set the autoinc for more data
;	ld a,128+44			;128 = NO Increment ;R#44    Color byte
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register
	;out (VdpOut_Control),a
;
	ex hl,de
;	ld c,VdpOut_Indirect
	jp HMMCWait2
HMMCWait:
	outi
HMMCWait2:

	ifndef Vdp9k_Status
		in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	else
		in a,(Vdp9k_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2

	endif 

	bit 7,a
	jp nz,HMMCWait

	bit 0,a
	ret z
	jp HMMCWait


MyHMMC:
MyHMMC_DX:	defw &0000 ;DX 36,37
MyHMMC_DY:	defw &0000 ;DY 38,39
MyHMMC_NX:	defw &0032 ;NX 40,41
MyHMMC_NY:	defw &0032 ;NY 42,43
MyHMMCByte:	defb 255   ;Color 44
	defb 0     ;Move 45
	defb %11110000 ;Command 46	



MyPalette:	;16 byte pairs
defb %00010000,%00000000;0  -RRR-BBB,-----GGG
defb %00000000,%00000000;1  -RRR-BBB,-----GGG
defb %00100010,%00000010;2  -RRR-BBB,-----GGG
defb %01010101,%00000101;3  -RRR-BBB,-----GGG
defb %01110111,%00000111;4  -RRR-BBB,-----GGG
defb %01000100,%00000000;5  -RRR-BBB,-----GGG
defb %00000111,%00000111;6  -RRR-BBB,-----GGG
defb %01110000,%00000000;7  -RRR-BBB,-----GGG
defb %00000010,%00000111;8  -RRR-BBB,-----GGG
defb %01110110,%00000011;9  -RRR-BBB,-----GGG
defb %01000111,%00000100;10  -RRR-BBB,-----GGG
defb %00000111,%00000000;11  -RRR-BBB,-----GGG
defb %00000000,%00000100;12  -RRR-BBB,-----GGG
defb %01010011,%00000111;13  -RRR-BBB,-----GGG
defb %01110100,%00000000;14  -RRR-BBB,-----GGG
defb %01110010,%00000011;15  -RRR-BBB,-----GGG


	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG	
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG
	db %00000000,%00000000 ;-RRR-BBB,-----GGG
	db %01110111,%00000111 ;-RRR-BBB,-----GGG	
;;;;;;;;;;;;;;;;;;;;;;;;;;;












; Sprite Test






ShowSprite_ReadInfoMSX:

	ld c,a
	
	ld b,0
        or a ; only done to clear carry flag
	rl b
	rl c

	ld hl,SpriteTest	:SprShow_BankAddr_Plus2
	ld d,h
	ld e,l
	add hl,bc
	add hl,bc	; 6 bytes per sprite
	add hl,bc


	ld a,(hl)
;	ld (SprShow_H),a
;	ld a,&18 SprShow_H_Plus1		;(Sprite Height)
	or a
	jr z,SpriteGiveUp
	ld (SprShow_TempH),a

	inc hl

	ld a,(hl)
	ld (SprShow_TempW),a
	ld (SprShow_W),a
	ld b,a

	inc hl
	ld a,(hl)
	ld (SprShow_Yoff),a
	inc hl

	ld a,(hl)
	ld (SprShow_Xoff),a		; Note Xoffset is never actually used for x-coords
					; the mem pos is actually sprite attribs
					; such as PSet, Doubleheight and trans color
	inc hl
	
ret
SpriteGiveUp:
	pop af ;Forcably quit not just getting info - but showing the sprite
ret


ReadSpriteIntoBank:
;	ld (SprShow_SprNum_Plus1-1),a	;Get Sprite info
	call ShowSprite_ReadInfoMSX
	ld c,(hl)
	inc hl
	ld b,(hl)
	ex de,hl			;Get Ram Pos of sprite Data into DE
	add hl,bc
	ex de,hl




	ld h,0

	ld a,(SprShow_TempH)
	ld l,a
	ld (MyHMMC_NY),hl
	
	ld a,(SprShow_TempW)
	rlca
	ld l,a
	ld (MyHMMC_NX),hl

	ld b,h
	ld c,l


	ld hl,(SpriteBank_NextX)
	ld (MyHMMC_DX),hl
	add hl,bc
	ld bc,&0000
	ld a,h
	or a
	jp z,RSI_NotOverWidth		;each line is 256 wide - if we're over jump down a line
	ld (MyHMMC_DX),bc
	ld bc,(SpriteBank_Ymax)
	ld hl,&0000
	ld (SpriteBank_Ymax),hl 
	ld HL,(MyHMMC_NX)
RSI_NotOverWidth:
	ld (SpriteBank_NextX),hl




	ld hl,(SpriteBank_NextY)
	add hl,bc
	ld (MyHMMC_DY),hl
	ld (SpriteBank_NextY),HL



push de
	ld bc,(SpriteBank_Ymax)

;	ld de,(MyHMMC_NY)
;	add hl,de
	ld hl,(MyHMMC_NY)
	ld a,b
	cp h
	jr c,RSI_Tallest
	ld a,c
	cp l
	jr c,RSI_Tallest

	jr RSI_NotTallest
RSI_Tallest:
	ld (SpriteBank_Ymax),hl
RSI_NotTallest:


	ld hl,SpriteBank	:NextSpriteBank_Plus2

	ld a,(SprShow_TempH)
	ld (hl),a
	inc hl

	ld a,(SprShow_TempW)
	ld (hl),a
	inc hl

	ld a,(SprShow_Yoff)
	ld (hl),a
	inc hl

	ld a,(SprShow_Xoff)
	ld (hl),a
	inc hl

	ld de,(MyHMMC_DX)
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl

	ld de,(MyHMMC_DY)
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl

	ld a,(MyHMMC_NX)
	ld (hl),a
	inc hl

 
	ld a,(MyHMMC_NY)
	ld (hl),a
	inc hl
	ld (NextSpriteBank_Plus2-2),hl

pop de
	ld hl,MyHMMC
	call HMMCTest
ret


;***************************************************************************************************
; Virtual Screen pos

	; Input 	B=VitrualX ;C=VirtualY

	; output 	B=ScreenByteX ;C=ScreenY	Y=255 if ofscreen
	;		H X bytes to skip	L	X bytes to remove
	;		D Y lines to skip	E	Y lines to remove
;***************************************************************************************************


; The virtual screen has a resolution of 160x200, with a 24 pixel border, which is used for clipping
; Y=0 is used by the code to denote a 'dead' object which will be deleted from the list
VirtualPosToScreenByte:


	ld HL,&0000
	ld D,h
	ld e,h

	; we use a virtual screen size
	; X width is 208	(160 onscreen - 2 per byte)
	; Y height is  248	(200 onscreen - 1 per line)

	; this is to allow for partially onscreen sprites	
	; and to keep co-ords in 1 byte
	; X<24 or x>=184 is not drawn
	; Y<24 or Y>=224 is not drawn
	;
	; only works with 24 pixel sprites
	ld a,B	;Check X
	cp VScreen_MinX 
	jp NC,VirtualPos_1	; jp is faster if we expect it to be true!
; X<24
	ld a,VScreen_MinX
	sub a,B

;	RRA
;	SRL A	; Extra for spectrum screen
	RLA	; MSX

	ld H,A	;move the sprite A left
	ld L,A	;need to plot A less bytes

	ld B,VScreen_MinX 	 ;B was offscreen, so move it back on
	jp VirtualPos_2
VirtualPos_1:
	;ld a,B	;Check X
	cp VScreen_MaxX -12 :SpriteSizeConfig184less12_Plus1
	jp C,VirtualPos_2
; X>184
	;push B
	ld a,B
	sub VScreen_MaxX -12 :SpriteSizeConfig184less12B_Plus1

;	RRA	; Extra for spectrum screen
;	SRL A	; Extra for spectrum screen
	RLA	; MSX
;	pop B

	add L	;	X pos is ok, but plot A less bytes
	ld L,A
	;ld a,B	;Check X
VirtualPos_2:
	ld a,B	;Check X
	sub VScreen_MinX  ;SpriteSizeConfig24C_Plus1
;	RRA	; halve the result, as we have 80 bytes, but 160 x co-ords
;	SRL A	; Extra for spectrum screen
	RLA	; MSX
	ld B,a	
;-------------------------------------------------------------------------
	ld a,C	;Check Y
	cp VScreen_MinY  ;SpriteSizeConfig24D_Plus1
	jp NC,VirtualPos_3
; Y<24
	ld a,VScreen_MinY  ;SpriteSizeConfig24E_Plus1
	sub a,C
	ld D,A	;move the sprite A up
	ld E,A	;need to plot A less lines
	ld C,VScreen_MinY  ;SpriteSizeConfig24F_Plus1
	jp VirtualPos_4
VirtualPos_3:
	;ld a,C	;Check Y
	cp VScreen_MaxY -24 :SpriteSizeConfig224less24_Plus1
	jp C,VirtualPos_4
; Y>224
	ld a,C
	sub VScreen_MaxY -24 :SpriteSizeConfig224less24B_Plus1
	ld E,A
VirtualPos_4:
	ld a,C	;Check Y
	sub VScreen_MinY  ;SpriteSizeConfig24G_Plus1
	ld C,a
	ret	



;---------------------------------------------------------------------------


ShowSpriteReconfigureEnableDisable:
;	ld hl,null
	or a
	jr z,ShowSpriteReconfigureEnableDisableB
;	ld hl,ShowSpriteReconfigure	
ShowSpriteReconfigureEnableDisableB:
;	ld (ShowSpriteReconfigureCommand_Plus2-2),hl
	jr ShowSpriteReconfigure_24px
ShowSpriteReconfigure:
	ld (SpriteSizeConfig6_Plus1-1),a

	;Akuyou was designed for 24x24 sprites, but this module can 'reconfigure' it for other sizes
	cp 12;3;6 ;24px
	jp z,ShowSpriteReconfigure_24px
	cp 16;4;8 ;32px
	jp z,ShowSpriteReconfigure_32px
	cp 24;6;12 ;48px
	jp z,ShowSpriteReconfigure_48px
	cp 32;8;16 ;64px
	jr z,ShowSpriteReconfigure_64px
	cp 40;10;20 ;80px
	jr z,ShowSpriteReconfigure_80px
	cp 48;12;24 ;96px
	jr z,ShowSpriteReconfigure_96px
	cp 64;16;32 ;128px
	jr z,ShowSpriteReconfigure_128px
	cp 4;1;2 ;8px
	jr z,ShowSpriteReconfigure_8px
	cp 8;2;4 ;16px
	jr z,ShowSpriteReconfigure_16px
ret

ShowSpriteReconfigure_128px:			;Not actually used!
	ld a,VScreen_MaxX-64
	ld b,VScreen_MaxY-24;	ld b,224-128
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_104px:			;Not actually used!
	ld a,VScreen_MaxX-52
	ld b,VScreen_MaxY-96
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_96px:			;Used by Boss 1
	ld a,VScreen_MaxX-48
	ld b,VScreen_MaxY-24;	ld b,224-96
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_80px:			;Not actually used!
	ld a,VScreen_MaxX-40
	ld b,VScreen_MaxY-80
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_48px:
	ld a,VScreen_MaxX-24
	ld b,VScreen_MaxY-48
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_32px:
	ld a,VScreen_MaxX-16
	ld b,VScreen_MaxY-32
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_64px:			;not actually used
	ld a,VScreen_MaxX-32
	ld b,VScreen_MaxY-64
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_16px:
	ld a,VScreen_MaxX-8
	ld b,VScreen_MaxY-16
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_8px:
	ld a,VScreen_MaxX-4
	ld b,VScreen_MaxY-8
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_24px:
	ld a,VScreen_MaxX-12
	ld b,VScreen_MaxY-24

ShowSpriteReconfigure_all:

;	ld a,c
	;Right X
	ld (SpriteSizeConfig184less12_Plus1-1),a
	ld (SpriteSizeConfig184less12B_Plus1-1),a
	ld a,B
	;Bottom Y
	ld (SpriteSizeConfig224less24_Plus1-1),a
	ld (SpriteSizeConfig224less24B_Plus1-1),a
ret
GetSpriteXY
	ld a,(VDP_MyLMMM_SX)
	ld b,a
	ld a,(VDP_MyLMMM_SY)
 	ld c,a
ret

;---------------------------------------------------------------------------

ShowSprite:


	ld hl,SpriteBank

	ld c,0 :SprShow_SprNum_Plus1
	
	ld b,0
        or a ; only done to clear carry flag
	rl b
	rl c
	rl b
	rl c



	add hl,bc
	add hl,bc	; 10 bytes per sprite
	add hl,bc
	add hl,bc
	add hl,bc


	ld a,(hl)	;h
	inc hl
	ld a,(hl)	;w
	inc hl
;	di
;	halt
	cp 0 :SpriteSizeConfig6_Plus1
	call nz,ShowSpriteReconfigure

	ld b,(hl)	;Yoff
	inc hl

	ld a,(hl)	;Xoff
	inc hl

	push hl
	pop ix

	ld a,(VDP_MyLMMM_DX)
	ld b,a
	ld a,(VDP_MyLMMM_DY)
	ld c,a
	call VirtualPosToScreenByte


	;		H X bytes to skip	L	X bytes to remove
	;		D Y bytes to skip	E	Y bytes to remove
	
	push hl
	pop iy

	ld a,c
	ld (VDP_MyLMMM_DY),a

	ld a,(ScreenBuffer_YY+1)
	ld (VDP_MyLMMM_DY+1),a
	ld a,b
	ld (VDP_MyLMMM_DX),a



	ld b,0

	ld a,iyh
;	cpl
;	inc a
	ld c,a
		
	ld l,(ix)
	inc ix
	ld h,(ix)
	inc ix
	add hl,bc
	ld (VDP_MyLMMM_SX),hl


	ld c,d

	ld l,(ix)
	inc ix
	ld h,(ix)
	inc ix
	add hl,bc
	ld (VDP_MyLMMM_SY),hl

	ld a,(ix)
	sub iyl
	ret c
	ret z
	inc ix
	ld (VDP_MyLMMM_NX),a

	ld a,(ix)
	sub e
	ret z
	inc ix
	ld (VDP_MyLMMM_NY),a


;	ld hl,128
;	ld (MyLMMM_DX),hl
;	ld (MyLMMM_DY),hl

	ld hl,VDP_MyLMMM
	call VDP_LMMM
ret




SprShow_TempH:	defb 0
SprShow_TempW:	defb 0
SprShow_W:	defb 0
SprShow_Yoff:	defb 0
SprShow_Xoff:	defb 0

SpriteTest:
incbin "MSX.SPR"

SpriteBank_NextMem:defw SpriteBank
SpriteBank_NextY:defw 512
SpriteBank_NextX:defw 0
SpriteBank_Ymax: defw 0	;Need to remember the tallest sprite on this line
align 256
SpriteBank:
	;db H		1
	;db W		2
	;db Yoff	3
	;db Woff	4
	;DW MyLMMM_SX	6
	;DW MyLMMM_SY	8
	;db MyLMMM_NX	9
	;db MyLMMM_NY	10

defs 256,0
read "Akuyou_MSX_KeyboardDriver.asm"
read "Akuyou_MSX_BankSwapper.asm"
;read "Akuyou_MSX_DiskReader.asm"
read "Akuyou_MSX_VDP.asm"
;read "Akuyou_MSX_VDP_9K.asm"
read "Akuyou_MSX_TextDriver.asm"
read "Akuyou_MSX_Monitor.asm"
read "Akuyou_MSX_Gradient.asm"

FileEnd: