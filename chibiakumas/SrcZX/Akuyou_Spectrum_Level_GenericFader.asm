
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	Spectrum Color fader program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	setSpectrumFadeOff:
		push hl
			ld hl,null
		jr setSpectrumFadeBlueb
;	setSpectrumFadeBlack
;		push hl
;			ld hl,SpectrumFadeBlack
;		jr setSpectrumFadeBlueb
	setSpectrumFadeDark:
		push hl
			ld hl,SpectrumFadeDark
		jr setSpectrumFadeBlueb
	setSpectrumFadeBlue:
		push hl
			ld hl,SpectrumFadeBlue
	setSpectrumFadeBlueb:
			ld (FadeCommand_Plus2-2),hl
		pop hl

	ret


	SpectrumGetColorArray:
		call Akuyou_ScreenBuffer_GetActiveScreen	
		add &18
		ld h,a
		ld l,0
		ld b,l
		ld c,3
	ret

	SpectrumFadeDark:
		call SpectrumGetColorArray
	SpectrumFadeDarkAgain:
		res 6,(hl)
		inc hl
		djnz,SpectrumFadeDarkAgain
		dec c
		jr nz,SpectrumFadeDarkAgain
	ret

	SpectrumFadeBlue:
		call SpectrumGetColorArray
	SpectrumFadeBlueAgain:
		ld (hl),%00000001
		inc hl
		djnz,SpectrumFadeBlueAgain
		dec c
		jr nz,SpectrumFadeBlueAgain
	ret

;	SpectrumFadeBlack
;		call SpectrumGetColorArray
;	SpectrumFadeBlackAgain
;		ld (hl),%00000000
;		inc hl
;		djnz,SpectrumFadeBlackAgain
;		dec c
;		jr nz,SpectrumFadeBlackAgain
;	ret
endif