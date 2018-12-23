

ExecuteBootStrap:		;Run or load the bootstrap - it takes a two part Hex command
	push hl			;ALL Disk ops are done through the bootstrap!
	di

ExecuteBootStrapSkipPlus:

;		call Akuyou_RasterColors_Disable	
		call ply_stop
		
;		ifdef Debug
;		call Debug_CheckIntOff
;		endif 

	
		call ScreenBuffer_Reset	; Screenbuffer reset messes with EXX vars!
		call cls
		call Firmware_Restore
;		call Akuyou_RasterColors_Blackout

		ld a,Akuyou_BootStrap_Bank			;Bootstrap in memory on 128k
		ld hl,&4000
		ld de,&8000
		ld bc,&2500
		call BankSwitch_BankCopy


StartBootstrap:
	pop hl 
	ei
	call  Akuyou_BootStrapStart+&6 ;Bootstrap_FromHL 
	di
	ld a,&80
	call CLSB

	call DoCustomRsts
	ld a,Akuyou_LevelStart_Bank:BootstrapRamRestore_Plus1
	jp BankSwitch_C0_SetCurrent
