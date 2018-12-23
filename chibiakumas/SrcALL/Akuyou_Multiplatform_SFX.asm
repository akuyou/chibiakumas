; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			 Music & SFX
;***************************************************************************************************
;--------------------------------------------------------------------------------------------

;
; Note - the version of ArkosTracker has had many of its functions removed,
; if this SFX function can't do what you want, neither can this arkostracker!
;

SFX_PlaySfx:				

	ld a,&00 :Sfx_Sound_Plus1
	or a	
	ret z
	ld l,a
ifdef buildZXS
	di
	ld a,Akuyou_Music_Bank
	call Bankswapper_Set
endif


	ld a,&00 :Sfx_Note_Plus1
	call PLY_SFX_Play
	;ei
	xor a
	ld (Sfx_CurrentPriority_Plus1-1),a	; clear the to-do
	ld (Sfx_Sound_Plus1-1),a	; clear the note
ifdef buildZXS
	call Bankswapper_Reset
	ei
endif
ret

;This is our quick 'make a sound' function
SFX_QueueSFX_GenericHighPri:
	ifdef Debug
		call Debug_NeedEXX
	endif

	di
	exx
		ld d,20	; Priority Low
		jr SFX_QueueSFX_GenericPriCustom
SFX_QueueSFX_Generic:
	ifdef Debug
		call Debug_NeedEXX
	endif

	di
	exx
		ld d,10	; Priority Low
SFX_QueueSFX_GenericPriCustom:
		ld b,a	;sfx A
		ld c,70	; pitch 70
		call SFX_QueueSFX
	exx
	ei
	ifdef Debug
		call Debug_ReleaseEXX
	endif

ret

SFX_QueueSFX:
	; D= priority , zero = low, 1=high (replace pending)
	; B = Sfx
	; C = Pitch (70 = middle)

;A = No Channel (0,1,2)
;L = SFX Number (>0)
;H = Volume (0...F)
;E = Note (0...143) (0 is the lowest, 143 the highest)
;D = Speed (0 = As original, 1...255 = new Speed (1 is the fastest))
;BC = Inverted Pitch (-&FFFF -> &FFFF). 0 is no pitch (=the original sound). The higher the pitch, the lower the sound.

	ld a,&00:Sfx_CurrentPriority_Plus1
	;jp z,SFX_PlaySFX_NothingPlaying
	cp d
	ret nc ; we're have queued something already, and this sound is low priority
	ld a,b
	ld (Sfx_Sound_Plus1-1),a
	ld a,c
	ld (Sfx_Note_Plus1-1),a		; queue up the sfx for the playloop
	ld a,d
	ld (Sfx_CurrentPriority_Plus1-1),a
	ret
