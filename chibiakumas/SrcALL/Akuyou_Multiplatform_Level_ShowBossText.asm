

ifdef ShowBossText2
	ShowBossText:
		ld a,15 :OnscreenTimer_Plus1
		cp 10
		jp C,ShowBossText2
		ld bc,BossText
	ShowBossText_StartText:

else

	ShowBossText:

	ld a,5 :OnscreenTimer_Plus1
	or a
	ret z
	ld bc,BossText :OnscreenTextPointer_Plus2
endif


push bc
	;ld hl,&4000
	;call Akuyou_ShowSprite_SetBankAddr
	ld a,2
	call Akuyou_SpriteBank_Font
pop bc

	ld l,4
	ld a,1:BossCharNum_Plus1
	ldia	; show up to 255 chars

ShowBossText_MoreText:
ifdef buildZXS

	push hl
	push bc

		ld a,0	:ShowBossText_ForceInt_Plus1
		inc a
		ld (ShowBossText_ForceInt_Plus1-1),a
		and %0000001
		call z,Akuyou_INT_Force
	pop bc
	pop hl
endif


	ld a,(bc)
ifdef ShowBossText2
	or a
	jr z,ShowBossText_AllOnscreen ; See if we have reached the end of the string
endif
	ld h,a
	inc bc

	push hl
		call Akuyou_DrawText_LocateSprite
ifdef BuildMSX
		di
endif
		call Akuyou_DrawText_PrintString
ifdef BuildMSX
		ei
endif
	pop hl
	inc l
	inc l
	inc l
	ldai
	dec a
	inc bc
	jp nz,ShowBossText_MoreText




	ld a,(bc)
	or a
	jp z,ShowBossText_AllOnscreen ; See if we have reached the end of the string



	call Akuyou_Timer_GetTimer
	and %00000001
	ret z		;Only run every two ticks on v9990



	ld a,(BossCharNum_Plus1-1)
	inc a

ifdef ShowBossText2
		cp 20
		jp c,ShowBossTextNoSpeedup
		inc a
	ShowBossTextNoSpeedup:
else
	nop
	nop :ShowTextSpeedup_Plus1
endif
	ld (BossCharNum_Plus1-1),a

ret
ShowBossText_AllOnscreen:
	ld a,(OnscreenTimer_Plus1-1)
	dec a
	ld (OnscreenTimer_Plus1-1),a

ifdef ShowBossText2

	cp 10
	ret nz
	ld a,9
	ld (OnscreenTimer_Plus1-1),a
;	ld a,BossText2End-BossText2-20
	ld a,1
	ld (BossCharNum_Plus1-1),a

endif

ret