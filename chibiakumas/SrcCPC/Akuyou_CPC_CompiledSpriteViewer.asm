

; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			Compiled Sprive Viewer

;***************************************************************************************************
;--------------------------------------------------------------------------------------------
; Compiled sprites are just machine code programs to render loading/continue etc screens
; we run them from here to allow the 64k override to be standardised

CLS:
	; clear the screen
	;call ScreenBuffer_GetActiveScreen
	ld a,(ScreenBuffer_ActiveScreen)
CLSB:
	ld h,a
	ld d,a
	ld e,&01
	ld BC,&3FCF
	xor a
	ld l,a
	ld (hl),a
	ldir
ret
;ShowCompiledSpriteLoading
;ld a,CSprite_Loading 	;Loading
ShowCompiledSprite:	; show compiled sprite A

		ld l,a
ifdef Support64k	
		ld a,(CPCVer)		; 464 can't do comiled sprites, so just CLS
		and 128
		jr z,cls
		

endif
 
	push hl
	call Akuyou_RasterColors_DefaultSafe
	pop hl

		ld a,&C6			;Compiled sprites are in bank 6
		ld h,&40 
		call BankSwitch_C0_CallHL
		ret
		;call CallHL
