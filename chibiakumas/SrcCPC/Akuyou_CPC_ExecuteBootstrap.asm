

ExecuteBootStrap:		;Run or load the bootstrap - it takes a two part Hex command
	push hl			;ALL Disk ops are done through the bootstrap!
	di
	ifdef SupportPlus
		call Plus_HideSprites
	endif
ExecuteBootStrapSkipPlus:

		call RasterColors_Disable	
		call ply_stop
		
		ifdef Debug
		call Debug_CheckIntOff
		endif 

	
		call ScreenBuffer_Reset	; Screenbuffer reset messes with EXX vars!
		call cls
		call Firmware_Restore
		call RasterColors_Blackout


		;Screenbuffer reset does this already
		;ld a,0			;Reset to normal memory bank
		;call BankSwitch_C0_SetCurrent



		ld a,(CPCVer)
		and 128
		jr nz,BootstrapInram
ifdef Support64k
		;64k version - load into &4000 every time
		ld de,Akuyou_BootStrapStart

		ld hl,null
		ld (DiscDestRelocateCall_Plus2-2),hl

		ld hl, BootStrapFile
		call LoadDiskFileFromHL
		;call &4009 ;Bootstrap_FromHL
		jr StartBootstrap
endif 
BootstrapInram:
		ld a,&C5					;Bootstrap in memory on 128k
		ld hl,&4000
		ld de,&8000
		ld bc,&2500
		call Akuyou_BankSwitch_C0_BankCopy 

StartBootstrap:
	pop hl 
	ei
	call  Akuyou_BootStrapStart+&6 ;Bootstrap_FromHL 
	di
	ld a,&80
	call CLSB

	call DoCustomRsts
	ld a,&C0:BootstrapRamRestore_Plus1
	jp BankSwitch_C0_SetCurrent
