buildMSX equ 1
write "..\RelMSX\disk\msxtest"

; MSX HEADER BLOAD header, before the ORG so that the header isn't counted
	db &FE     ; magic number
	dw FileBegin    ; begin address
	dw FileEndB - 1  ; end address
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


Akuyou_MusicPos equ &E000
Akuyou_SfxPos equ &E000


VScreen_MinY equ 32
VScreen_MinX equ 40

VScreen_MaxY equ 224
VScreen_MaxX equ 168





; Compilation address, somewhere out of the way of small basic programs
	org &8100
FileBegin:

; Program code entry point
Execute:




di
	call Bankswapper_Init
	call Bankswapper_FullRam
	ld a,&C9
	ld (&38),a


ld hl,&F3FC
ld (hl),255
ld de,&F3FC+1
ld bc,&FA75-&F3FC-1
ldir

ld hl,&E000
ld (hl),255
ld de,&E001
ld bc,&1000
ldir



ld hl,&F000
ld de,&7000
ld bc,&1000
call SimpleCompress_Compress



;DoCompressTest
;	di
;	ld hl,&C000
;	ld bc,&4000
;
;	ld de,&6000
;	call  SimpleCompress_Compress
;ret
;DoRestoreTest
;	ld de,&C000
;	ld hl,&6000
;	call SimpleCompress_Restore
;ret




;xor a
;ld (&F355),a
;ld (&F356),a
;ld (&F340),a
;	call Bankswapper_RestoreFirmware
;	ld sp,&F086;F0A0;F377;XF1C9
;	ld (&F674),sp
;	ld ix,&57A9
;	call &015F
;ld hl,Continue
;ld (&f1e6),hl
;call &F1E2

Continue:
	call Bankswapper_FullRam

	call VDP_SetScreenMode4
	
di
;di
;halt



ld hl,&01C8
ld de,&C000
ld c,1
ld a,6
ld IX,&CFFF;B000
;di
;halt
call LoadDiscSectorz			; This was all structured assuming amsdos would be replaced with 
	; H = Track  (41)		; a sector based disk reader however with the success of M4
	; L = Sector (C1)		; and C4CPC - and the fact KL_WALK_ROM seems to restore the
	; I = Disk   (00)		; A600-BF00 block so well, it was never needed
	; B = Size - size is not used at all , no need to pass it
	; C = disk
	;  A  = 128 k memory bank
	;; DE = load address 

;di
;halt
di
ld a,0
ld de,&1000
ld bc,&1000
ld hl,&C000
call VDP_LDIR_ToVDP
;ld a,0
;ld hl,&0000
;call VDP_SetWriteAddress
;ld hl,&D000
;ld de,&1000

;ld b,e
;ld e,0
;Repeater:
;otir
;dec d
;jr nz,Repeater
ld a,0
ld hl,&1000
ld de,&E000
ld bc,&1000
call VDP_LDIR_FromVDP

;skip

;ld hl,&D000
;ld de,&E000
;ld bc,&1000
;ldir
;di
;ld a,0
;ld hl,&0000
;call VDP_SetReadAddress
;ld hl,&E000
;ld de,&1000
;ld b,e
;ld e,0
;Repeaterb:
;inir
;dec d
;jr nz,Repeaterb

;ld hl,128 ; Bytes*2 (half byte per pixel)
;ld (VDP_MyHMMC_NX),hl
;ld hl,64
;ld (VDP_MyHMMC_NY),hl
;ld hl,&D000
;ld a,(hl)
;inc hl
;ld (VDP_MyHMMCByte),a
;ld hl,VDP_MyHMMC
;call VDP_HMMC_Generated
;ld b,255
;ld d,4
;Repeater:
;otir
;dec d
;jr nz,Repeater
;di

call Music_Restart

di
ld a,&C3
ld (&38),a
ld hl,PlayAgain
ld (&39),hl
ei

pauser:
nop
nop

jp pauser


PlayAgain:
	;need to read Status register 0 to reset the timer
	xor a;	ld a,0
	out (VdpOut_Control),a
	ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
	out (VdpOut_Control),a
	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2

call PLY_Play
	;ld a,&80
	;ld i,a
	ei
ret



SprShow_TempH:	defb 0
SprShow_TempW:	defb 0
SprShow_W:	defb 0
SprShow_Yoff:	defb 0
SprShow_Xoff:	defb 0


SpriteBank_NextMem:defw SpriteBank
SpriteBank_NextY:defw 256
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
read "Akuyou_MSX_DiskDriver.asm"
;read "Akuyou_MSX_VDP.asm"
read "Akuyou_MSX_VDP_9K.asm"
read "Akuyou_MSX_TextDriver.asm"
read "Akuyou_MSX_Monitor.asm"
read "Akuyou_MSX_Gradient.asm"
read "..\SrcAll\Akuyou_Multiplatform_FileLoader.asm"
read "..\SrcALL\Akuyou_Multiplatform_ArkosTrackerLite.asm"
read "..\SrcALL\Akuyou_Multiplatform_SimpleCompress.asm"
FileEndB: