write "disk\msxtest"

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
	call VDP_SetScreenMode4

	ld hl,filename
	ld bc,0		;x
	ld de,192	;y
	call VDP_bmpProcessor



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
di
	halt




	ei


ret
;	      12345678123
filename: db "MSXFONT BIN"	

txtPressButtonMsg2: db "AacdefghABCDEFGHIJK","!"+&80

read "Akuyou_MSX_BankSwapper.asm"
read "Akuyou_MSX_DiskReader.asm"
read "Akuyou_MSX_VDP.asm"
read "Akuyou_MSX_TextDriver.asm"

read "Akuyou_MSX_Monitor.asm"
FileEnd: