
		bit 0,b
	ex af,af'
			;	call GetMemPos		

;GetMemPos:
		; Input  BC= XY (x=bytes - so 80 across)
		; output HL= screen mem pos
			ld h,0
			ld a,c
			sub 24	
			cp 199			;we are at the bottom of the screen
			jr NC,DoMoves_Kill	;over the page
			ld l,a
	
			add hl,hl 		; table is two bytes so double hl

			ld de,&6969 :scr_addr_tablePos_Plus2	; get table
			add hl,de		;add line num
			ld sp,hl
			pop de
			pop hl			
			ld a,b	;get the X col
			sub 24
			cp 160			;we are at the bottom of the screen
			jr NC,DoMoves_Kill	;over the page
			srl a
			ld c,a

			ld b,0:GetMemPos_ScreenOffset_Plus1 ; screen offset

			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
			ex de,hl

			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
	
		ex af,af'

			jr z,Stars_DrawDot_B2
			ld a,(hl)
			or &33
			ld (hl),a
			ex de,hl
			ld (hl),a

		jp StarArray_Next

Stars_DrawDot_B2:

			ld a,(hl)
			or &CC
			ld (hl),a
			ex de,hl
			ld (hl),a
