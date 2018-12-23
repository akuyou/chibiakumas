write "..\BldZX\spectest.bin"
StackPointerAlt equ &8181
buildZXS equ 1
buildZXS_DSK equ 1
;buildZXS_TRD equ 1
;buildZXS_TAP equ 1

Akuyou_MusicPos equ &E000
Akuyou_SfxPos equ &E000

org &8000
FileStart:
jp LetsGo
defs 387-3

LetsGo:


ld sp,StackPointerAlt	; DO THIS FIRST!




di
ld hl,&01C8
ld de,&D000
ld c,1
ld a,6
ld IX,&FFFF;B000
call LoadDiscSector			; This was all structured assuming amsdos would be replaced with 
	; H = Track  (41)		; a sector based disk reader however with the success of M4
	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
	; B = Size - size is not used at all , no need to pass it
	; C = disk
	;  A  = 128 k memory bank
	;; DE = load address 

di
;halt
ld a,6
call Bankswapper_ZXBank_SetCurrent

ld hl,&D000
ld de,&e000
ld BC,&FF0
;call Bankswapper_Swap
call Bankswapper_FastCopy
	;HL=Source Pos
	;DE=Dest Post
	;IXL= Source Bank
	;IXH= Dest Bank
	;BC= ByteCount

;ld hl,&C000
;ld de,&C000
;ld BC,&4000
;ld IXL,7
;ld IXH,6
;call Bankswapper_Swap
;call Bankswapper_MemSwap

ld hl,PlayAgain
call INT_Enable
call Music_Restart
ei
im 2

pauser:
jp pauser


PlayAgain:

call PLY_Play
	ld a,&80
	ld i,a
	ei
reti


read "..\SrcALL\Akuyou_Multiplatform_FileLoader.asm"
read "Akuyou_Spectrum_Bankswapper.asm"
read "Akuyou_Spectrum_DiskDriver.asm"
read "Akuyou_Spectrum_TextFont.asm"
read "Akuyou_Spectrum_ScreenMemory.asm"
read "Akuyou_Spectrum_Keyreader.asm"
read "..\SrcALL\Akuyou_Multiplatform_ArkosTrackerLite.asm"
read "Akuyou_Spectrum_InterruptHandler.asm"
SprShow_X: db 0
SprShow_Y: db 0
SprShow_TempX: db 0
SprShow_TempY: db 0
SprShow_SprNum: db 0
