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


	ld de,&1000
	ld hl,filename
	push de
		call DiskReader_LoadFile
		di
		call Bankswapper_FullRam
	pop de
	ld a,(de)	;File format
	inc de
	push af
		ld hl,&0000
		ld (VDP_MyHMMC_DX),hl
		ld (VDP_MyHMMC_DY),hl
		ld a,(de)
		ld (BmpWidth_Plus1-1),a
		ld l,a
		inc de

		or a 
		jr nz,NotWidZero	;256 rolls over to 0 - so if width=0 width=256
			inc hl
NotWidZero:
		ld (VDP_MyHMMC_NX),hl
		ld h,0
		ld a,(de)
		ld (BmpHeight_Plus1-1),a
		ld l,a
		inc de
		ld (VDP_MyHMMC_NY),hl

	pop af 

	or a
	jr z,BmpNoPalette
	ex hl,de
		call VDP_SetPalette
	ex hl,de
BmpNoPalette:
	


		ld hl,VDP_MyHMMC
		call VDP_HMMC_Generated

MoreBytesHMMC:
	ld c,0 :BmpHeight_Plus1
MoreBytesHMMC_NextLine:
	ld b,0 :BmpWidth_Plus1
MoreBytesHMMC_NextByte:
	inc de
	ld a,(de)
	out (VdpOut_Indirect),a

	djnz,MoreBytesHMMC_NextByte
	
	dec c
	jp nz,MoreBytesHMMC_NextLine





di
	halt




	ei


ret
;	      12345678123
filename: db "MSX     BIN"	

read "Akuyou_MSX_BankSwapper.asm"
read "Akuyou_MSX_DiskReader.asm"
read "Akuyou_MSX_VDP.asm"
FileEnd: