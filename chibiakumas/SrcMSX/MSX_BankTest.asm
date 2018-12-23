nolist

;UNREM ONLY ONE OF THESE

;BuildCPC equ 1	; Build for Amstrad CPC
BuildMSX equ 1 ; Build for MSX
;BuildTI8 equ 1 ; Build for TI-83+
;BuildZXS equ 1  ; Build for ZX Spectrum
;BuildENT equ 1 ; Build for Enterprise
 
read "..\SrcALL\V1_Header.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			Start Your Program Here
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	Call DOINIT	; Get ready

	di

	in a,(&A8)
	ld (SlotRestoreA),a
	ld a,(&FFFF)	
	cpl
	ld (SlotRestoreB),a

	ld hl,&8000
	call Memtest

	ld h,0	; H=Page
	ld l,2	; L=Slot
	ld d,3	; D=subslot

	call BankTest

	di
	halt




SlotRestoreA: db 0
SlotRestoreB: db 0
;   %DDCCBBAA

BankTest:
; H=Page
; L=Slot
; D=subslot
di
	;Check the slot expansion vars FCC1H-FCC4H - bit 7 is set if expanded
	ld b,&FC
	ld a,&C1
	add l
	ld c,a
	ld a,(bc)
	bit 7,a
	jr z,SlotNotExpanded

	;PageIn the subslot selection register &FFFF 
	ld b,L;3;	Load B with 3
	ld c,3;	Load C with Slot
	call GetSlotMask

	ld a,(SlotRestoreA)
	and B
	or c
	out (&A8),a

	;Set the subslot selection register &FFFF 
	ld b,H;1;	Load B with Page
	ld c,D;2;	Load C with Subslot
	call GetSlotMask
	ld a,(&FFFF)
	cpl
	and B
	or c
;	and %11110011
;	or  %00001100
	ld (&FFFF),a

	;Page in the bank we want
SlotNotExpanded:
	ld a,(SlotRestoreA)
	ld b,H;1;	Load B with Page
	ld c,L;3;	Load C with Slot
	call GetSlotMask
	and B
	or c
;	and %11110011
;	or  %00001100
	out (&A8),a

ret

GetSlotMask:
;Set
;	Load B with Page
;	Load C with Bank
;Returns
	;Load B with Mask
	;Load C with Bank
push af
	ld a,%11111100
	GetSlotMaskB:
	rlc c
	rlca
	rlc c
	rlca
	djnz GetSlotMaskB
	ld b,a
pop af
ret
Memtest:
	ld a,(hl)
	ld b,a
	ld (hl),0
	cp (hl)
	ld a,0
	ret z
	ld (hl),b
	inc a
ret


	ld a,0:ModTest_Plus1
	ld a,1
	ld (ModTest_Plus1-1),a
	di
halt
	



	ld hl,Message
	call PrintString
	call NewLine

	call WaitChar
	push af
		ld hl,Message2
		call PrintString
	pop af
	call PrintChar
	call NewLine


	CALL SHUTDOWN ; return to basic or whatever
ret


Message: db 'HellO WOrld!',255
Message2: db 'You Pressed:',255



PrintString:
	ld a,(hl)
	cp 255
	ret z
	inc hl
	call PrintChar
jr PrintString
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;			End of Your program
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

read "..\SrcALL\V1_Functions.asm"
read "..\SrcALL\V1_Footer.asm"
