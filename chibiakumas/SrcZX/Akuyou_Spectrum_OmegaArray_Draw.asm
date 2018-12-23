

	ld a,%00000011
	and b
	ex af,af'
			;	call GetMemPos		

;GetMemPos:
		; Input  BC= XY (x=bytes - so 80 across)
		; output HL= screen mem pos
			ld h,0
			ld a,c
ifdef CPC320
			sub 24	
			cp 199			;we are at the bottom of the screen
else
			sub 32
			cp 191			;we are at the bottom of the screen
endif

			jr NC,DoMoves_Kill	;over the page
			ld l,a
	
			add hl,hl 		; table is two bytes so double hl

			ld de,&6969 :scr_addr_tablePos_Plus2	; get table
			add hl,de		;add line num
			ld sp,hl
			pop de
			pop hl			
			ld a,b	;get the X col
ifdef CPC320
			sub 24
			cp 160			;we are at the bottom of the screen
else
			sub 40
			cp 128			;we are at the bottom of the screen
endif
			jr NC,DoMoves_Kill	;over the page
			srl a
			srl a
			ld c,a

			ld b,0:GetMemPos_ScreenOffset_Plus1 ; screen offset

			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
			ex de,hl
			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
	
		ex af,af'
		
		jp z,Stars_DrawDot_B4
		dec a
		jp z,Stars_DrawDot_B3
		dec a
		jp z,Stars_DrawDot_B2


			jr z,Stars_DrawDot_B2
			ld a,(hl)
			or %00000111
			ld (hl),a
			ex de,hl
			ld (hl),a

		jp StarArray_Next

Stars_DrawDot_B2:

			ld a,(hl)
			or %00011100
			ld (hl),a
			ex de,hl
			ld (hl),a
		jp StarArray_Next
Stars_DrawDot_B3:

			ld a,(hl)
			or %01110000
			ld (hl),a
			ex de,hl
			ld (hl),a
		jp StarArray_Next
Stars_DrawDot_B4:

			ld a,(hl)
			or %11100000
			ld (hl),a
			ex de,hl
			ld (hl),a
