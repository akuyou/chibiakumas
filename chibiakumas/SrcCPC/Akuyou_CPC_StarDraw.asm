			ld h,0
			ld b,&C0 :ScreenBuffer_ActiveScreenDirectB_Plus1
			bit 0,a		;*** NO COMMAND AFTER THIS MUST ALTER THE Z FLAG!!!!
			rra		
			ld c,a
			add hl,hl 		; table is two bytes so double hl
			ld de,scr_addr_table	; get table
			add hl,de		;add line num
			ld e,(hl)		; read the two bytes in		
			inc l
			ld d,(hl)
			inc hl
			ld a,(hl)		; read the two bytes in		
			inc l
			ld h,(hl)
			ld l,a	; hl now is the memory loc of the line
			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
			ld a,(hl)
			jr z,Stars_DrawDot_B2
				
			;	ld a,b	;get the X col	
				and &CC
				or &33		:Stars_Color1a_Plus1
				ld (hl),a
				ex de,hl
				add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
				ld (hl),a
				JP StarArray_Next
Stars_DrawDot_B2:	
				and &33
				or &CC		:Stars_Color2a_Plus1
				ld (hl),a
				ex de,hl
				add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
				ld (hl),a
