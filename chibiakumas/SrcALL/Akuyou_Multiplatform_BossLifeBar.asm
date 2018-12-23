




ifdef BuildMSX


	LifeBar_MyHMMV:
	LifeBar_MyHMMV_DX:	defw &0040 ;DX 36,37
	LifeBar_MyHMMV_DY:	defw &00BC ;DY 38,39
	LifeBar_MyHMMV_NX:	defw &0080 ;NX 40,41
	LifeBar_MyHMMV_NY:	defw &0004 ;NY 42,43
	LifeBar_MyHMMVByte:	defb 4   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	




	BossColor0:
		ld d,&44
		ld b,&11
	ret
	BossColor1:
		ld d,&33
		ld b,&44
	ret
	BossColor2:
		ld d,&22
		ld b,&33
	ret
	BossColor3:
		ld d,&11
		ld b,&22
	ret
	BossColorFlash:
		ld d,&11
		ld b,&11
		xor a
		ld (BossColorFlashAction_Plus1-1),a
	jr BossLifeBarDisplayB

	BossLifeBarInit:
		ld (barinitcount_Plus1-1),a
		ld d,&00
		ld b,&44
		jr BossLifeBarDisplay

	BossLifeBar:
		call Akuyou_ScreenBuffer_GetActiveScreen
		ld (LifeBar_MyHMMV_DY+1),a


		ld a,0:barinitcount_Plus1
		inc a
		cp 32
		jr c,BossLifeBarInit

		ld a,0 :BossColorFlashAction_Plus1
		or a
		jr nz,BossColorFlash


		ld a,(BossLife)
		and %01100000
		cp  %01100000
		call z,BossColor0
		cp  %01000000
		call z,BossColor1
		cp  %00100000
		call z,BossColor2
		cp  %00000000
		call z,BossColor3

	BossLifeBarDisplayB:
		ld a,(BossLife)
		and %00011111

	BossLifeBarDisplay:
		push bc

			ld b,a
			ld a,32
			sub b
			ld c,a
		pop af
;		ld a,b
		ld (LifeBar_MyHMMVByte),a
		ld a,&40
		ld (LifeBar_MyHMMV_DX),a
		ld e,a
		push de

			ld a,b
			sla a
			sla a
			ld (LifeBar_MyHMMV_NX),a
			or a
			jr z,NoDraw1


			push bc
				ld a,1
				ld hl,LifeBar_MyHMMV
				call Akuyou_VDP_CommandNum	;VDP_HMMV_BusyCheck
			pop bc
NoDraw1:
		pop de
		ld a,(LifeBar_MyHMMV_NX)
		add e
		ld (LifeBar_MyHMMV_DX),a
		ld a,c
		or a
		jr z,NoDraw2
		sla a
		sla a
		ld (LifeBar_MyHMMV_NX),a

		ld a,d
		ld (LifeBar_MyHMMVByte),a
		ld a,1
		ld hl,LifeBar_MyHMMV
		call Akuyou_VDP_CommandNum	;VDP_HMMV_BusyCheck
NoDraw2:
ret

endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 					CPC Ver

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if BuildCPCv+BuildZXSv+BuildENTv

if BuildZXSv
	BossColor0:
		ld de,&FFFF
		ld hl,&FFFF
		ld bc,&0000
		ld iy,&0000
	ret
	BossColor1:
		ld de,%1110111011101110
		ld hl,%1011101110111011
		ld bc,&FFFF
		ld iy,&FFFF
	ret
	BossColor2:
		ld de,%0101010101010101
		ld hl,%1010101010101010

		ld bc,%1110111011101110
		ld iy,%1011101110111011
	ret
	BossColor3:
		ld de,&0000
		ld hl,&0000
		ld bc,%0101010101010101
		ld iy,%1010101010101010
	ret
	BossColorFlash:
		ld de,&0000
		ld hl,&0000
		ld bc,&0000
		ld iy,&0000
		xor a
		ld (BossColorFlashAction_Plus1-1),a
	jr BossLifeBarDisplayB

	BossLifeBarInit:
		ld (barinitcount_Plus1-1),a
		ld de,&0000
		ld hl,&0000
		ld bc,&FFFF
		ld iy,&FFFF
		jr BossLifeBarDisplay
endif
if BuildCPCv+BuildENTv
	BossColor0:
		ld de,&FFFF
		ld bc,&0000
		
	ret
	BossColor1:
		ld de,&0F0F
		ld bc,&FFFF
	ret
	BossColor2:
		ld de,&F0F0
		ld bc,&0F0F
	ret
	BossColor3:
		ld de,&0000
		ld bc,&F0F0
	ret
	BossColorFlash:
		ld de,&0000
		ld bc,&0000
		xor a
		ld (BossColorFlashAction_Plus1-1),a
	jr BossLifeBarDisplayB

	BossLifeBarInit:
		ld (barinitcount_Plus1-1),a
		ld de,&0000
		ld bc,&FFFF
		jr BossLifeBarDisplay
endif
	BossLifeBar:


		di

		call Akuyou_ScreenBuffer_GetActiveScreen
ifdef BuildENT
		ld hl,200-3*&50+72
		add h
endif
ifdef BuildCPC
		ld hl,&2780 +72
		add h
endif
ifdef BuildZXS
	ld hl,&14E0+24
	add h
	;	; Input  BC= XY (x=bytes - so 40 across)

	ld h,a
	push hl
else
	ld h,a
endif



		ld ixl,4

		ld a,31:barinitcount_Plus1
		inc a
		cp 32
		jr c,BossLifeBarInit

		ld a,0 :BossColorFlashAction_Plus1
		or a
		jr nz,BossColorFlash

		ld a,(BossLife)
		and %01100000
		cp  %01100000
		call z,BossColor0
		cp  %01000000
		call z,BossColor1
		cp  %00100000
		call z,BossColor2
		cp  %00000000
		call z,BossColor3

	BossLifeBarDisplayB:
		ld a,(BossLife)
ifdef BuildZXS
		and %00011100
else
		and %00011111
endif


	BossLifeBarDisplay:

		ld (BarFull_Plus2-2),bc

		ld (BarEmpty_Plus2-2),de
ifdef BuildZXS
		ld (BarEmptyAlt_Plus2-2),hl
		ld (BarFullAlt_Plus2-2),iy
	pop hl
endif

		ld b,a
		ld a,32
		sub b
		ld c,a
	BossLifeBarLineLoop:	

		push hl
			di
			ld (SpRestoreFillB_Plus2-2),sp
			ld sp,hl
;ifdef BuildZXS
;	inc sp
;endif
			ld a, b
			cp 32
			jp z,BossLifeBarContinue

if BuildCPCv+BuildENTv
			ld de,pushde32
			ld a,e
			add b
else
			ld de,pushde8
			ld a,b
			srl a
			srl a
			add e

endif

			ld e,a

			push de

				ld de,&0F0F	:BarEmpty_Plus2
				ld hl,BossLifeBarContinue

			ret	;effectively call the pushed DE
	BossLifeBarContinue:
			ld a, c
			cp 32
			jp z,BossLifeBarContinueB
if BuildCPCv+BuildENTv
			ld de,pushde32
			ld a,e
			add c
else
			ld de,Pushde8
			ld a,c
			srl a
			srl a
			add e

endif



			ld e,a

			push de
		
				ld de,&F0F0 	:BarFull_Plus2
				ld hl,BossLifeBarContinueB

			ret	;effectively call the pushed DE

	BossLifeBarContinueB:
			ei
			ld sp,&0000:SpRestoreFillB_Plus2


ifdef BuildCPC
		pop hl
		ld a,8
		add h
		ld h,a
endif

ifdef BuildENT
		pop hl
		ld a,&50
		add l
		ld l,a
		jr nc,BosLineSkip
		inc h
BosLineSkip:

endif
ifdef BuildZXS



;		push hl
		push de
			ld hl,&0000 :BarFullAlt_Plus2
			ld de,(BarFull_Plus2-2)
			ld  (BarFull_Plus2-2),hl
			ld (BarFullAlt_Plus2-2),de

			ld hl,&0000 :BarEmptyAlt_Plus2
			ld de,(BarEmpty_Plus2-2)
			ld  (BarEmpty_Plus2-2),hl
			ld (BarEmptyAlt_Plus2-2),de
		pop de
		pop hl
		inc h
endif

		dec ixl
		jp nz, BossLifeBarLineLoop
	ret
	align 64,&00

	pushde32:
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de

	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
Pushde16:
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
Pushde8:
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de
	jp (hl)





	StartBossLifeBar:
		push hl
			ld hl,BossLifeBar
			ld (BossLifeBarCall_Plus2-2),hl
		pop hl
		ret



endif