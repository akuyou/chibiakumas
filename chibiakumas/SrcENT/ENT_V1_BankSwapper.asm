; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			Bank Call - Call a location in a different bank then return

;***************************************************************************************************
;--------------------------------------------------------------------------------------------
CallDE
	push de
	ret
CallHL:			
	push hl
	ret





BankSwitch_C0_CallHL:
	push af
		ld a,(BankSwitch_C0_CurrentB_Plus2-2)
		ld (BankSwitch_C0_CallHL_InterruptSafe_MemRestore_Plus1-1),a
	pop af

	call BankSwitch_C0_SetCurrent	; switch to bank A
BankSwitch_C0_CallHLDirect:
	call CallHL
	ld a,0 :BankSwitch_C0_CallHL_InterruptSafe_MemRestore_Plus1
	jr BankSwitch_C0_SetCurrent ; Restore the previous bank

;	jr BankSwitch_C0_Reset ; Restore the previous bank
BankSwitch_C0_SetCurrentToC0:
	ld a,(BankDefault1)
BankSwitch_C0_SetCurrent:				; This allows us to remember 'current' bank

	ld (BankSwitch_C0_CurrentB_Plus1-1),a
	OUT (&B1),A ;Send it
	ret
BankSwitch_BankCopy:
BankSwitch_C0_BankCopy:
	push bc
		call BankSwitch_C0
	pop bc
	ldir af

;	jr BankSwitch_128k_Reset ; Restore the previous bank
BankSwitch_C0_Reset:
	ld a,0:BankSwitch_C0_CurrentB_Plus1
BankSwitch_C0:

	OUT (&B1),A ;Send it
	ret

	;&B0 - Ram page 0 (0000-4000)
	;&B1 - Ram page 1 (4000-8000)
	;&B2 - Ram page 2 (8000-C000)
	;&B3 - Ram page 3 (C000-FFFF)
;BankDefaults
;BankDefault0 db &F8
;BankDefault1 db &F9
;BankDefault2 db &FC
;BankDefault3 db &FD

;BankFirmware0 db &F8
;BankFirmware3 db &00
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			Firmware Switch

;***************************************************************************************************
;--------------------------------------------------------------------------------------------

Firmware_Kill:	; firmwares? we don't need no steenking firmwares!
	di

;	ld a,(BankDefault0)
;	ld (&B0),a

;	ld a,(BankDefault1)
;	ld (&B1),a

;	ld a,(BankDefault2)
;	ld (&B2),a

;	ld a,(BankDefault3)
;	ld (&B3),a

ret


Firmware_Restore:	; About that firmware...
	di	

	ret
