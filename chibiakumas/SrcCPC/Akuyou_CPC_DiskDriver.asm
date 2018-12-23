
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			 Super simple Disk reader

;***************************************************************************************************
read "..\SrcAll\LZ48_decrunch.asm"

SectorFileName: 
	db "T00-SC1 ."
SectorFileNameDisk:	db "D"
	db"00":DiskFilePos_Plus1
SetDiskMessage:
	db "Set Disk "
SetDiskMessageDisk:	db  "1"+&80
BootStrapFile:
	db "BootStrp.Aku"

;--------------------------------------------------------------------------------------------


DiskDriver_LoadDirect:
	push hl
		ld hl,null
		ld (DiscDestRelocateCall_Plus2-2),hl
	pop hl
jp DiskDriver_Load

LoadDiscSectorZ: ;Load Compressed Disk sector
	;DE = Destination of decompressed file
	;IX = Temp location of Compressed data
	push af

	ifdef Support64k
		cp &C0
		jr z,LoadDiscSectorZver_BankOk
		ld a,(CPCVer)
		and 128
		jr nz,LoadDiscSectorZver_BankOk		; Told to load a file into 128k memory!
		pop af
		ret
LoadDiscSectorZver_BankOk:
	endif
	pop af
	push af
		push de
			call LoadDiscSectorZver
		pop de
		; hl  compressed data adres
		; de  output adress of dat	
		ld hl,0000 :CompressedDataAddress_Plus2
	pop af
	call BankSwitch_C0	; switch to bank A
	call LZ48_decrunch
	jp BankSwitch_C0_Reset	; switch to bank A

;LoadDiscSectorByEnd
;	push af
;	ld a,'D'
;	jr LoadDiscSectorZverB

LoadDiscSectorZver:

	push af
	ld a,'Z'
	push hl
		push ix		;Use our temp address as the destination
		pop hl
		ld (NewDestination_Plus2-2),hl
		ld hl,DiscDestRelocate
	jr LoadDiscSectorB
LoadDiscSector:				; This was all structured assuming amsdos would be replaced with 
	; H = Track  (41)		; a sector based disk reader however with the success of M4
	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
	; B = Size - size is not used at all , no need to pass it
	; C = disk
	;  A  = 128 k memory bank
	;; DE = load address 


	push af
	ld a,'D'

	push hl
		ld hl,null
LoadDiscSectorB:
		ld (DiscDestRelocateCall_Plus2-2),hl
	pop hl
	ld (SectorFileNameDisk),a
	pop af

	ld (DiskLoadBank_Plus1-1),a	; if asked to load to a mem bank >0 on 64k do nothing
ifdef Support64k
	cp &C0
	jr z,LoadDiscSector_64kOk
	ld a,(CPCVer)
	and 128
	ret z		; Told to load a file into 128k memory!
endif

LoadDiscSector_64kOk:
;push af

	push hl


	ld a,c
	add 48
	ld (DiskFilePos_Plus1-1),a

	ld hl,DiskRemap
	ld a,c
	add l
	ld l,a
	ld c,(hl)


	

	ld a,(SetDiskMessageDisk)
	sub &80+48
	cp c
	ifdef SingleDisk
		jr LoadDiscSector_NoDiskCheck	; The disk is still in
	endif 

	jr z,LoadDiscSector_NoDiskCheck	; Disk Zero means file is assumed to be on 
	;ALL Disks

		ld a,c
		or a
		jr z,DiskZero
		add 48+&80
		ld (SetDiskMessageDisk),a
		Call ShowDiskMessage
		;call CLS
;		jr DiskZero
LoadDiscSector_NoDiskCheck:	;Skip the disk check, just assume the disk is in


DiskZero: ;file common to all disks
	pop hl
;pop af
	; Patch the filename with Sector and track info
	push de
		ld b,h
		ld c,l
		ld a,h
		push bc
			ld a,b
			call SectorFile_Decimal
			ld hl,SectorFileName+1
			ld a,c
			add 48
			ld (hl),a
			inc hl
			ld a,b
			add 48
			ld (hl),a
		pop bc


;		ld bc,&0004
;		add hl,bc

		ld a,c
		sub &C0-48


		ld (SectorFileName+2+4),a
	pop de
	ld hl,SectorFileName
;	jr LoadDiskFileFromHL
DiskDriver_Load:
LoadDiskFileFromHL:	; Load a file from HL memory loc
	push hl	
	push de
		;push hl
	
		push hl
			ld hl,&0A0F		; Move cursor so errors dont wrap I don't hide them
			call txt_set_cursor	; so we can see if a problem happened
;			ld a,1
;			call cas_noisy
			ld a,255
			ld (&BE78),a ;bios_set_message
		pop hl

		ld de,&C000	;; address of 2k buffer, this can be any value if the files have a header
		ld b,12		;12 chars

		call cas_in_open	; carry true if sucess
	pop de

	ld h,d
	ld l,e
	jr nc,DiskError1
	call null :DiscDestRelocateCall_Plus2

DiskRetry2:

	ld a,&C0:DiskLoadBank_Plus1
	push bc
		call BankSwitch_C0	; switch to bank A
	pop bc
	call cas_in_direct	; carry true if sucess

	jr nc,DiskError2
	pop hl
	call BankSwitch_C0_Reset ; Restore the previous bank
	jp cas_in_close
DiskError1:
	;call 	ShowDiskMessage
	;pop hl
	;jr LoadDiskFileFromHL

DiskError2:
	call 	ShowDiskMessage
	pop hl
	jr LoadDiskFileFromHL

ShowDiskMessage:		;Show the error messages
		push bc
		push de



			call RasterColors_DefaultSafe
			ld a,CSprite_SetDisk 		;SetDisk
			call ShowCompiledSprite

			call BankSwitch_C0_Reset ; Restore the previous bank
;			push bc
			call SpriteBank_Font2
;			pop bc
			;ld hl,Font_RegularSizePos 			
;			call ShowSprite_SetBankAddr
		
			ld hl,&160a :SetDiskMessagePos_Plus2
			ld bc,SetDiskMessage
			call DrawText_LocateAndPrintStringUnlimited
			call KeyboardScanner_WaitForKey
			;call CLS

			ld a,CSprite_Loading 	;Loading
			call ShowCompiledSprite

		pop de
		pop bc
ret



	



SectorFile_Decimal:	; Decimal to Ascii converter
	ld c,0
SectorFile_DecimalSubTen:
	cp 10
	jr c,SectorFile_DecimalLessThanTen
	inc c
	sub 10
	jr SectorFile_DecimalSubTen
SectorFile_DecimalLessThanTen:
	ld b,a
	ret

cas_noisy equ &bc6b
cas_in_open equ &bc77
cas_in_direct equ &bc83
cas_in_close equ &bc7a
txt_set_cursor equ &bb75
bios_set_message equ &c033

DiscDestRelocate:
;	push hl
	ld hl,&0000 :NewDestination_Plus2
;	exx hl,de
	    or a   ;ccf
;	    SCF    ; Force carry = 1
;	    CCF    ; Flip carry so it is 0
	    SBC    HL, BC
	ld (CompressedDataAddress_Plus2-2),hl
;	ex hl,de
;	pop hl
ret
