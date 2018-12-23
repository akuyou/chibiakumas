ExecuteBootStrap:
	push hl			;ALL Disk ops are done through the bootstrap!
	di

;	call RasterColors_Disable	
	call ply_stop

	ld a,%01000111 
	ld (ZXFontColor_Plus1-1),a
	
	call ScreenBuffer_Reset	; Screenbuffer reset messes with EXX vars!
	call Firmware_Restore
	call CLS
;	call RasterColors_Blackout



	pop hl 
;	ei

	ld a,(Bankswapper_ZXBank_Current_Plus1-1)
	push af

		ld a,Akuyou_BootStrapStart_Bank
		call Bankswapper_SetCurrent		
		call  Akuyou_BootStrapStart+&6 ;Bootstrap_FromHL 

	di
	call Firmware_Kill

	pop af
	call Bankswapper_SetCurrent


;	call DoCustomRsts ;does nothing on speccy


ret