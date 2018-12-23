buildMSX equ 1
read "..\Aku\CoreDefs.asm"

write "..\RelMSX\disk1\init"
	db &FE     ; magic number
	dw FileBegin    ; begin address
	dw FileEnd - 1  ; end address
	dw Execute  ; program execution address (for ,R option)

CHPUT  equ &00A2




VScreen_MinY equ 32
VScreen_MinX equ 40

VScreen_MaxY equ 224
VScreen_MaxX equ 168

CHGCPU	equ	&0180 ;Turbo R ON



; Compilation address, somewhere out of the way of small basic programs
	org &C000
FileBegin:
	jp Execute
	jp ExecuteV9K
; Program code entry point
ExecuteV9K:
	ld hl,BootStrapFileV9K
	ld (BootStrapFileName_Plus2-2),hl
	ld hl,CoreFileV9K
	ld (CoreFileName_Plus2-2),hl
Execute:


 
	;Kick in the turbo-R 
	ld	A,(CHGCPU)
	push af			  ;Push the turbo-R Detect so we can snag it later
	cp	&0C3
	ld	a,&82              ; can be ld a,81h for R800 ROM if you wish
	call	z,CHGCPU

	;IF PEEK(&H2D)=2 THEN OUT 64,8 IF INP(64)=247 THEN OUT 65,0

;Panasonic FS-A1WX PCB
	ld a,(&2D)
	cp 2
	jr nz,NoWX
	ld a,8
	out (64),a
	in a,(64)
	cp 247
	jr nz,NoWX
	xor a
	out (65),a
	pop af
	ld a,247
	push af
NoWX:

	call DiskDriver_Init
	di

	call Bankswapper_Init
	call Bankswapper_FullRam

	ld hl,BootStrapFile		:BootStrapFileName_Plus2
	ld de,Akuyou_LevelStart
	call DiskDriver_Load

	ld hl,Akuyou_LevelStart
	ld de,Akuyou_BootStrapStart
	call LZ48_decrunch


	ld hl,CoreFile			:CoreFileName_Plus2
	ld de,Akuyou_LevelStart
	call DiskDriver_Load

	ld hl,Akuyou_LevelStart
	ld de,Akuyou_CoreStart
	call LZ48_decrunch



	ld hl,(SlotRestoreA)
	push hl				;Init routine grabs these later for configuring the core
	ld hl,(FullRamA)
	push hl
	ld a,(DefaultDrive_Plus1-1)
	push af

	jp Akuyou_BootStrapStart


null:ret

BootStrapFile: defb "BootStrpAKU"
CoreFile:      defb "Core    AKU"

BootStrapFileV9K: defb "BootStrpV9K"
CoreFileV9K:      defb "Core    V9K"


;read "..\SrcMSX\Akuyou_MSX_KeyboardDriver.asm"
read "..\SrcMSX\Akuyou_MSX_BankSwapper.asm"
read "..\SrcMSX\Akuyou_MSX_DiskDriver.asm"
;read "..\SrcAll\Akuyou_Multiplatform_FileLoader.asm"
read "..\SrcMSX\Akuyou_MSX_VDP.asm"
read "..\SrcALL\LZ48_decrunch.asm"
;read "..\SrcMSX\Akuyou_MSX_VDP_9K.asm"
;read "..\SrcMSX\Akuyou_MSX_RLE.asm"
;read "..\SrcMSX\Akuyou_MSX_TextDriver.asm"
;read "..\SrcMSX\Akuyou_MSX_Monitor.asm"
list
;read "..\SrcMSX\Akuyou_MSX_Gradient.asm"



FileEnd: