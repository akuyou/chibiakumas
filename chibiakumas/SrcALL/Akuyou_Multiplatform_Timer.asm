Timer_CurrentTick  	equ Timer_CurrentTick_Plus1-1


Timer_SetCurrentTick:
	ld (Timer_CurrentTick_Plus1-1),a
ret
Timer_UpdateTimer: ; The Background also updates the Timer, if you use a custom background
; such as stage 9, you need to do this yourself or nothing will happen!

	ld hl,Timer_TicksOccured


	ld a,0 :Timer_Pause_Plus1
	or a
	jr z,NotPaused

	xor a
	ld (hl),a	
	ret

NotPaused:

	ld a,&69 :Timer_CurrentTick_Plus1
	ld b,a
	inc a
	ld (Timer_CurrentTick),a
	xor b
	ld (hl),a
	
ifdef buildMSX_V9K
	bit 1,a
	ld a,&CE
	jr z,MoveSlowdownFlip
	ld a,&C6
MoveSlowdownFlip:
;	ld (MovesSlowdownADCA_Plus2-2),a
	ld (MovesSlowdownADCB_Plus2-2),a
endif


	ld a,0 :SmartBomb_Plus1			; Make the background flash with the smartbomb
	or a
	ret z

	dec a					; Smartbomb timer down one
	ld (SmartBomb_Plus1-1),a

	push af
	push hl
	ld hl,Background_SmartBombColors	; must be aligned
		add l
		ld l,a
		;ld b,0
		;ld c,a
		;add hl,bc


		ld d,(hl)
		;ld ixl,a
		;ld ixh,a
		;ld a,255
		;ld (ScrollNextLineChange),a		;Trick background into never changin
	pop hl
	pop af

ret
Timer_GetTimer:					;Return current timer in I
	ld a,(Timer_CurrentTick)		; and 'Ticks occured' Xor bitmap
ifdef buildMSX_V9K
	nop
	nop	:TimerShiftA_Plus2
endif
	ldia

	ld a, 0:Timer_TicksOccured_Plus1
ifdef buildMSX_V9K
	nop
	nop:TimerShiftB_Plus2
endif
ret
