;write "..\spectest.bin"
StackPointerAlt equ &7FFF;&5BFF ;need a stackpointer below &C000

;buildZXS_DSK equ 1
;buildZXS_TRD equ 1
buildZXS_TAP equ 1

org &8000
FileStart:




di
ld hl,&01C1
ld de,&4000
ld c,1
ld a,6
ld IX,&FFFF;B000
call LoadDiscSectorz			; This was all structured assuming amsdos would be replaced with 
	; H = Track  (41)		; a sector based disk reader however with the success of M4
	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
	; B = Size - size is not used at all , no need to pass it
	; C = disk
	;  A  = 128 k memory bank
	;; DE = load address 


di
halt

ret
read "Akuyou_Spectrum_FileLoader.asm"
read "Akuyou_Spectrum_Bankswapper.asm"
read "Akuyou_Spectrum_DiskDriver.asm"
read "Akuyou_Spectrum_TextFont.asm"
read "Akuyou_Spectrum_ScreenMemory.asm"
read "Akuyou_Spectrum_Keyreader.asm"

SprShow_X: db 0
SprShow_Y: db 0
SprShow_TempX: db 0
SprShow_TempY: db 0
SprShow_SprNum: db 0
FileEnd:
defb 0
save "..\BldZX\spectest.bin",FileStart,FileEnd-FileStart	;address,size...}[,exec_address]
