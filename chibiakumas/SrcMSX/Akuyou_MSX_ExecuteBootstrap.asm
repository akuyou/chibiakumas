ExecuteBootStrap:
	push hl			;ALL Disk ops are done through the bootstrap!

	call ScreenBuffer_Reset	; Screenbuffer reset messes with EXX vars!
	di
	call Akuyou_Music_Stop 



	pop hl 
;	ei
	call  Akuyou_BootStrapStart+&6 ;Bootstrap_FromHL 
	di
	call DoCustomRsts


ret