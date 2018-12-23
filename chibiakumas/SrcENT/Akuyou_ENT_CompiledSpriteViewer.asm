

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
	ld BC,80*200-1
	xor a
	ld l,a
	ld (hl),a
	ldir
ret
;ShowCompiledSpriteLoading
;ld a,CSprite_Loading 	;Loading
ShowCompiledSprite:	; show compiled sprite A

		ld l,a

 
	push hl
	call CLS
	ld de,EntSafePalette
	call ENT_UpdatePlusRastersAlt


	pop hl

		ld a,CSprite_Bank			;Compiled sprites are in bank 6
		ld h,CSprite_PosByte
		call BankSwitch_C0_CallHL
		ret
		;call CallHL
