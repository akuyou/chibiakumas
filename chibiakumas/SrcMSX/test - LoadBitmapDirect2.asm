write "..\RelMSX\disk\msxtest"


buildMSX equ 1


; MSX HEADER BLOAD header, before the ORG so that the header isn't counted
	db &FE     ; magic number
	dw FileBegin    ; begin address
	dw FileEnd - 1  ; end address
	dw Execute  ; program execution address (for ,R option)





; Compilation address, somewhere out of the way of small basic programs
	org &C000
FileBegin:

; Program code entry point
Execute:




	di

 


	call Bankswapper_Init
	call Bankswapper_FullRam

	ld a,&C9
	ld (&38),a

	call VDP_SetScreenMode4


	ld hl,MyPalette
	Call VDP_SetPalette

di

;ld a,6
;ld IX,&FFFF;B000
			; This was all structured assuming amsdos would be replaced with 
	; H = Track  (41)		; a sector based disk reader however with the success of M4
	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
	; B = Size - size is not used at all , no need to pass it
	; C = disk
	;  A  = 128 k memory bank
	;; DE = load address 

;	ld hl,&01C1
;	ld de,&4000
;	ld c,1
;	ld ix,0
;	ld iy,192
;	call VDP_bmpProcessor




	ld hl,&01C2
	ld de,&4000
	ld c,1
	ld ix,0
	ld iy,0
	call VDP_bmpProcessor


	di
	halt

	ld a,2
	call SpriteBank_Font
	ld hl,&0414;14
	ld bc,txtPressButtonMsg2
	call DrawText_LocateAndPrintStringUnlimited

	ld a,1
	call SpriteBank_Font


	ld hl,&0416;14
	ld bc,txtPressButtonMsg2
	call DrawText_LocateAndPrintStringUnlimited


call	Monitor

SpriteTest:
	call Timer_UpdateTimer
;	call Akuyou_ScreenBuffer_GetActiveScreen
;	ld a,&40
;	ld h,a
;	ld l,&1F ;&4F+1 ; Had to remove 1 for Speccy layout!


;	ld hl,0
;	ld de,NewGradient
;	ld b,192
;	ld c,%11111111
;	call Background_Gradient


	ld hl,VDP_MyHMMV
	call VDP_HMMV_BusyCheck

	call Monitor
jp SpriteTest






	ei


ret



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

txtPressButtonMsg2: db "AacdefghABCDEFGHIJK","!"+&80

read "Akuyou_MSX_BankSwapper.asm"
read "..\SrcAll\Akuyou_Multiplatform_FileLoader.asm"
read "Akuyou_MSX_KeyboardDriver.asm"
read "Akuyou_MSX_DiskDriver.asm"
;read "Akuyou_MSX_VDP.asm"
read "Akuyou_MSX_VDP_9K.asm"
read "Akuyou_MSX_BMP.asm"
read "Akuyou_MSX_TextDriver.asm"
read "Akuyou_MSX_Monitor.asm"
read "Akuyou_MSX_Gradient.asm"

FileEnd: