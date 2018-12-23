
RAMAD0 equ	#F341	;Slot address of RAM in page 0 (DOS)
RAMAD1 equ	#F342	;Slot address of RAM in page 1 (DOS)
RAMAD2 equ	#F343	;Slot address of RAM in page 2 (DOS/BASIC)
RAMAD3 equ	#F344	;Slot address of RAM in page 3 (DOS/BASIC)
;CHGCPU	equ	&0180 ;Turbo R ON


BankSwitch_C0_SetCurrentToC0:
BankSwitch_C0_SetCurrent:
Firmware_Kill:

call Bankswapper_RestoreFirmware
;	;Kick in the turbo-R 
;	ld	A,(CHGCPU)
;	cp	&0C3
;	ld	a,&82              ; can be ld a,81h for R800 ROM if you wish
;	call	z,CHGCPU
call Bankswapper_FullRam

ret

Firmware_Restore:
	ld a,&C9		;Note, we really need to clear the VDP flag here too - so can't enable interrupts!
	ld (&0038),a
ret
DoCustomRsts:
	ld hl,&0030		; Set RST 6 to Call IY
	ld  de,&e9FD 
LdHlEd:
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl
ret



CallDE
	push de
	ret
CallHL:			
	push hl
	ret

Bankswapper_CallHL:
;	ldia
;	ld a,(Bankswapper_ZXBank_Current_Plus1-1)
;	push af
;	ldai
;		call Bankswapper_SetCurrent		
		call CallHL
;	pop af
;	jr Bankswapper_SetCurrent


Bankswapper_SetCurrent:		;only currently support base 64k
ret

Bankswapper_Init:

	;Remeber out current slot layout
	in a,(&A8)
	ld (SlotRestoreA),a
	ld a,(&FFFF)	
	cpl
	ld (SlotRestoreB),a
	ld bc,&0000
	ld a,(RAMAD3)
	call ProcessSlotData
	ld a,(RAMAD2)
	call ProcessSlotData
	ld a,(RAMAD1)
	call ProcessSlotData
	ld a,(RAMAD0)
	call ProcessSlotData


;Address   #0024
;Function  Switches indicated slot at indicated page on perpetual
;Input     A  - ExxxSSPP
;                +-?------ see RDSLT
;           H - Bit 6 and 7 must contain the page number (00-11)


	;100% Ram
	;   %DDCCBBAA
;	ld a,%11111111
;	ld (&FFFF),a
;	ld a,%11111111
	ld a,b
	ld (FullRamA),a
	ld a,c
	ld (FullRamB),a
ret

Bankswapper_RestoreFirmware:
			ld a,(SlotRestoreA)
			out (&A8),a
			ld a,(SlotRestoreB)
			ld (&FFFF),a
jp VDP_GetStatusFirwareDefault


Bankswapper_FullRam:
			ld a,(FullRamA)
			out (&A8),a
			ld a,(FullRamB)
			ld (&FFFF),a
jp VDP_GetStatusRegister

ProcessSlotData:
;Input     A  - ExxxSSPP
	push af
		and %00000011
		rlc b
		rlc b
		or b
		ld b,a
	pop af 
	and %00001100
	rrca
	rrca
	rlc c
	rlc c
	or c
	ld c,a
ret

SlotRestoreA: defb &00
SlotRestoreB: defb &00
FullRamA: defb &00
FullRamB: defb &00