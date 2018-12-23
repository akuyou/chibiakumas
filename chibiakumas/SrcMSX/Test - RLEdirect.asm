buildMSX equ 1
write "..\RelMSX\disk\msxtest"

; MSX HEADER BLOAD header, before the ORG so that the header isn't counted
	db &FE     ; magic number
	dw FileBegin    ; begin address
	dw FileEnd - 1  ; end address
	dw Execute  ; program execution address (for ,R option)

CHPUT  equ &00A2




VScreen_MinY equ 32
VScreen_MinX equ 40

VScreen_MaxY equ 224
VScreen_MaxX equ 168





; Compilation address, somewhere out of the way of small basic programs
	org &8100
FileBegin:

; Program code entry point
Execute:
	call DiskDriver_Init
	di

	call Bankswapper_Init


	call Bankswapper_FullRam

	ld a,&C9
	ld (&38),a

	call VDP_SetScreenMode4

	di

	ld hl,Palette
	call VDP_SetPalette


	ld hl,&01C9
	ld de,&4000
	ld c,1
	ld ix,0
	ld iy,0
	call VDP_rleProcessor

	di 
	halt





	ld hl,RleDataStart
	ld a,(hl)
	inc hl
	ld (VDP_MyHMMCByte),a
push hl
	ld hl,&0000
	ld (VDP_MyHMMC_DX),hl
	ld (VDP_MyHMMC_DY),hl
	ld hl,256
	ld (VDP_MyHMMC_NX),hl
	ld hl,192
	ld (VDP_MyHMMC_NY),hl
	ld a,192
	ld hl,VDP_MyHMMC
	call VDP_HMMC_Generated
pop hl
MoreBytesHMMC:
	ld a,(hl)
	out (VdpOut_Indirect),a

;ld hl,RleDataStart-1
ld de,RleDataEnd-1
ld b,0
ld ixh,32
ld IXL,31
di
exx 
push bc
exx





;10960









RLE_ImageWidth equ 38







nolist
RleDataStart:



















RleDataEnd:
list
read "Akuyou_MSX_KeyboardDriver.asm"
read "Akuyou_MSX_BankSwapper.asm"
read "Akuyou_MSX_DiskDriver.asm"
read "..\SrcAll\Akuyou_Multiplatform_FileLoader.asm"
read "Akuyou_MSX_VDP.asm"
;read "Akuyou_MSX_VDP_9K.asm"
read "Akuyou_MSX_RLE.asm"
read "Akuyou_MSX_TextDriver.asm"
read "Akuyou_MSX_Monitor.asm"
list
read "Akuyou_MSX_Gradient.asm"

Palette:
defb %01110000,%00000100;0  -RRR-BBB,-----GGG
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
defb %01110000,%00000111;15  -RRR-BBB,-----GGG



FileEnd: