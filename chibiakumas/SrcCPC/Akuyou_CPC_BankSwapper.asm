



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
	ld a,&C0
BankSwitch_C0_SetCurrent:				; This allows us to remember 'current' bank

	LD B,&7F ;Gate array port
	ld (BankSwitch_C0_CurrentB_Plus2-2),a
	OUT (C),A ;Send it
	ret

BankSwitch_C0_BankCopy:
	push bc
		call BankSwitch_C0
	pop bc
	ldir
;	jr BankSwitch_128k_Reset ; Restore the previous bank
BankSwitch_C0_Reset:
	ld a,(BankSwitch_C0_CurrentB_Plus2-2)
BankSwitch_C0:
	;LD BC,&7F00 ;Gate array port
	LD B,&7F ;Gate array port

	OUT (C),A ;Send it
	ret
;-Address-	0	1	2	3	4	5	6	7
;0000-3FFF	RAM_0	RAM_0	RAM_4	RAM_0	RAM_0	RAM_0	RAM_0	RAM_0
;4000-7FFF	RAM_1	RAM_1	RAM_5	RAM_3	RAM_4	RAM_5	RAM_6	RAM_7
;8000-BFFF	RAM_2	RAM_2	RAM_6	RAM_2	RAM_2	RAM_2	RAM_2	RAM_2
;C000-FFFF	RAM_3	RAM_7	RAM_7	RAM_7	RAM_3	RAM_3	RAM_3	RAM_3

	
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			Firmware Switch

;***************************************************************************************************
;--------------------------------------------------------------------------------------------

Firmware_Kill:	; firmwares? we don't need no steenking firmwares!

	di
	
	ld bc,&7f8D	; Reset the firmware to OFF
	out (c),c
	
	
	call RasterColors_Disable

	;wipe the memory the Firmware had
	ld hl,&A500
	ld de,&A501
	ld bc,&1A00-1	;ld bc,&BFF-1	;
	xor a
	ld (hl),a
	ldir


DoCustomRsts:
	ld hl,&0030		; Set RST 6 to Call IY
	ld  de,&e9FD 
LdHlEd:
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl
ret

;	ret
DoRestoreJumpBlock:
Rst #8
defw &08bd :FirmJumpLoc_Plus2                  ;initialise firmware jumpblock entries
DoRestoreJumpBlockEnd:
DoRestoreLowJumpBlock:
	exx
	ld bc,&7f00+%10001000+1  ;initialise lower rom and select mode
	out (c),c                   ;this routine must be located above &4000
	xor a
	exx
	ex af,af'
	call &0044                  ;initialise lower jumpblock (&0000-&0040)
	;ld bc,&7f00+%10001100+1  ;initialise lower rom and select mode
	;out (c),c                   ;this routine must be located above &4000
	Call &F7D0;DoRestoreJumpBlock
	call &bb00 ; km_initialise          ;initialise keyboard manager
	call &b909 ;kl_l_rom_disable       ;disable lower rom
	ld de,&A500	; first usable byte of memory
	ld hl,&b0ff	; last usable byte of memory
	call &bccb ; KL_ROM_WALK
	;ld c,7	DiskRomNumber_Plus1	; number of AMSDOS ROM
	;call &bcce	; initialise AMSDOS ROM; this also resets drive number to 0 (drive A)
	call &b909 ;kl_l_rom_disable       ;disable lower rom

	ret
DoRestoreLowJumpBlockEnd:            ;and high kernal jumpblock (&b800-&bae4)



Firmware_Restore:	; About that firmware...
	di	
	call RasterColors_Disable

	;restore colors
	call RasterColors_DefaultSafe

	;reset our raster events
	ld hl,(RasterColors_PerFrameCall_Plus2-2)
	ld (RasterColors_PerFrameCallRestore_Plus2-2),hl
	;ld hl,&C9FB
	;ld (&FFFE),hl
	;ld hl,&FFFE
	;ld (RasterColors_PerFrameCall_Plus2-2),hl
	ld hl,&A500
	ld de,&A501
	ld bc,&BFD0 -&A501
	xor a
	ld (hl),a
	ldir

	ld hl,DoRestoreLowJumpBlock
	ld de,&FFD0
	ld bc,DoRestoreLowJumpBlockEnd-DoRestoreLowJumpBlock
	ldir
	ld hl,DoRestoreJumpBlock
	ld de,&F7D0
	ld bc,DoRestoreJumpBlockEnd-DoRestoreJumpBlock
	ldir
	call &FFD0


	call &BCB6 ;sound hold
	ei
	;restore Disk operating system Vars here - Please add your own
	;if you have special requirements



	ld hl,&0000:ParadosSettings_Plus2
	ld (&BAFE),hl

	ld a,0:FirwareRestoreDriveNo_Plus1
	ld hl,(&be7d)	; get address where current drive number is held
	ld (hl),a	; set drive number to previous value

	ret