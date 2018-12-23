buildZXS_SPUNSAFE equ 1	;StackPointer is above &C000

buildZXS equ 1
;buildZXS_DSK equ 1
;buildZXS_TRD equ 1
buildZXS_TAP equ 1



read "..\Aku\CoreDefs.asm"


ifdef buildZXS_DSK
	write "..\BldZX\init_DSK.bin"
endif
ifdef buildZXS_TRD
	write "..\BldZX\init_TRD.bin"
endif
ifdef buildZXS_TAP
	write "..\BldZX\init_TAP.bin"
endif




VScreen_MinY equ 32
VScreen_MinX equ 40

VScreen_MaxY equ 224
VScreen_MaxX equ 168

StackPointerAlt equ &7000



org &7000


di

	ld bc,&fe00		;border black
	out (c),c

	call SpectrumFadeBlack



	call Bankswapper_Init
	call Firmware_Restore

	ld a,Akuyou_CoreStart_Bank
	ld de,Akuyou_CoreStart
	ld hl,CoreFileName
	ld (DiskLoadBank_Plus1-1),a
	call DiskDriver_Load


	ld a,Akuyou_BootStrapStart_Bank
	ld de,Akuyou_BootStrapStart
	ld hl,BootStrapFileName
	ld (DiskLoadBank_Plus1-1),a
	call DiskDriver_Load

	di
	ld sp,StackPointerAlt







;check we have 128k
	ld	bc,&7FFD
	ld	h,c
	ld	a,17
	out	(c),a
	ld	(hl),a
	dec	a
	out	(c),a
	ld	(hl),a
	inc	a
	out	(c),a
	sub	(hl)


push af ;1=48k 0=128k
ld a,(2899)
push af ;On 128k models, PEEK 2899 is 159 on a 128 or +2, 126 on a +3 or +2a.











;	ld a,1
;	call Bankswapper_set
;	di
;	halt

	ld a,Akuyou_BootStrapStart_Bank
	call Bankswapper_SetCurrent
	jp Akuyou_BootStrapStart
;di 
;halt


SpectrumFadeBlack:

		ld h,&40+&18
		ld l,0
		ld b,l
		ld c,3
SpectrumFadeBlackAgain
		ld (hl),%00000000
		inc hl
		djnz,SpectrumFadeBlackAgain
		dec c
		jr nz,SpectrumFadeBlackAgain
	ret

null:ret

;read "Akuyou_Spectrum_FileLoader.asm"
read "..\srcZX\Akuyou_Spectrum_Bankswapper.asm"
read "..\srcZX\Akuyou_Spectrum_DiskDriver.asm"
;read "Akuyou_Spectrum_TextFont.asm"
;read "Akuyou_Spectrum_ScreenMemory.asm"
;read "Akuyou_Spectrum_Keyreader.asm"




ifdef buildZXS		      ;     12345678
	BootStrapFileName: 	db "BOOTSTRP"	
	ifdef buildZXS_TAP
		db "C",32
	endif
	ifdef buildZXS_TRD
		db "C"
	endif
	ifdef buildZXS_DSK
		db ".C",&ff
	endif
endif


ifdef buildZXS		      ;     12345678
	CoreFileName: 		db "AKUCORE0";"    "	
	ifdef buildZXS_TAP
		db "C",32
	endif
	ifdef buildZXS_TRD
		db "C"
	endif
	ifdef buildZXS_DSK
		db ".C",&ff
	endif
endif

;defb 0ldai_Plus1