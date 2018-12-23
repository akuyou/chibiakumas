;			push af
;			push hl
;				srl a
;				srl a
;				ld b,a
;				ld c,l
;				inc c
;				call GetColMemPos
;				ld a,(hl)
;
;				and %11111000
;				or %01000111	SpeccyStarColor_Plus1
;			pop hl
;			pop af
	
			ld h,0

			ld b,&00 :ScreenBuffer_ActiveScreenDirectB_Plus1

jp smallstar	:StarSizeSelfMod_Plus2

BigStar:


ld d,a

			;rra		
			srl a
			srl a
			ld c,a
			add hl,hl 		; table is two bytes so double hl

ld a,d

			ld de,scr_addr_table	; get table
			add hl,de		;add line num
	
			ex hl,de	;DE is now the the mem pos
		

			and %00000011
			jp z,Stars_DrawDotB_B4
			dec a
			jp z,Stars_DrawDotB_B3
			dec a
			jp z,Stars_DrawDotB_B2

; -....-
; ......
; ..xx..
; ..xx..
; ......
; -....-


Stars_DrawDotB_B1:		
				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc
			

				ld a,(hl)				
				and %1111110
;				or  %0000001
				ld (hl),a
				inc l
				ld a,(hl)				
				and %00011111
;				or  %11000000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc




				ld a,(hl)				
				and %11111100
				;or  %00000000
				ld (hl),a
				inc l
				ld a,(hl)				
				and %00001111
				or  %11000000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11111100
				or  %00000001
				ld (hl),a
				inc l

				ld a,(hl)				
				and %00001111
				or  %11100000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11111100
				or  %00000001
				ld (hl),a
				inc l

				ld a,(hl)				
				and %00001111
				or  %11100000
				ld (hl),a
				
				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %11111100
			;	or  %00000000
				ld (hl),a

				inc l

				ld a,(hl)				
				and %00001111
				or  %11000000
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %11111110
;				or  %00000001
				ld (hl),a
				inc l
				ld a,(hl)				
				and %00011111
;				or  %11100000
				ld (hl),a
		
				JP StarArray_Next


			
Stars_DrawDotB_B4:	

				ld a,(hl)				
				and %1000011
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %00000011
				or  %00110000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				
				ld a,(hl)				
				and %00000011
				or  %01111000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %00000011
				or  %01111000
				ld (hl),a
				inc l
				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				

				and %00000011
				or  %00110000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc

				ld a,(hl)				
				and %10000111
				ld (hl),a

				JP StarArray_Next


Stars_DrawDotB_B3:	
				ld a,(hl)				
				and %1110000
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc

				ld a,(hl)				
				and %11000000
				or  %00001100
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc

				
				ld a,(hl)				
				and %11000000
				or  %00011110
				ld (hl),a
				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %11000000
				or  %00011110
				ld (hl),a
				inc l
				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11000000
				or  %00001100
				ld (hl),a

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11100001
				ld (hl),a
				JP StarArray_Next

Stars_DrawDotB_B2:		;and %11100001

				ld a,(hl)				
				and %1111000
				ld (hl),a
				inc l
				ld a,(hl)				
				and %01111111
				ld (hl),a
	
				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11110000
				or  %00000011
				ld (hl),a
				inc l
				ld a,(hl)				
				and %00111111
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11110000
				or  %00000111
				ld (hl),a
				inc l

				ld a,(hl)				
				and %00111111
				or  %10000000
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc

				ld a,(hl)				
				and %11110000
				or  %00000111
				ld (hl),a
				inc l

				ld a,(hl)				
				and %00111111
				or  %10000000
				ld (hl),a
				


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %11110000
				or  %00000011
				ld (hl),a

				inc l

				ld a,(hl)				
				and %00111111
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %11111000
				ld (hl),a
				inc l
				ld a,(hl)				
				and %01111111
				ld (hl),a


jp StardrawDone



smallStar:
	inc l
	inc l
	inc a
 	inc a
ld d,a

			;rra		
			srl a
			srl a
			ld c,a
			add hl,hl 		; table is two bytes so double hl

ld a,d

			ld de,scr_addr_table	; get table
			add hl,de		;add line num
	
			ex hl,de	;DE is now the the mem pos
		


			and %00000011
			jr z,Stars_DrawDot_B4
			dec a
			jr z,Stars_DrawDot_B3
			dec a
			jp z,Stars_DrawDot_B2
			
Stars_DrawDot_B1:	
;				ld b,%11111000

				ld a,(hl)				
				and %11111000
;				or  %00000010
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %11111000
				or  %00000010		:StarOR1_Plus1	
				ld (hl),a
				ex af,af'


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ex af,af'
				xor %00000011			:StarXOR1_Plus1
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)
				and %11111000
;				or  %00000001
				ld (hl),a				
				JP StarArray_Next
Stars_DrawDot_B4:		
;				ld b,%00011111
				ld a,(hl)				
				and %00011111
;				or  %01000000
				ld (hl),a



				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)				
				and %00011111
				or  %10000000			:StarOR2_Plus1
				ld (hl),a

				ex af,af'


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ex af,af'

				xor %11000000			:StarXOR2_Plus1
				ld (hl),a



				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)
				and %00011111
;				or  %10000000
				ld (hl),a				
				JP StarArray_Next



Stars_DrawDot_B3:		;and %10000111
;				ld b, %10000111
				ld a,(hl)				
				and %10000111
;				or  %00100000
				ld (hl),a



				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %10000111
				or  %00100000			:StarOR3_Plus1
				ld (hl),a
				ex af,af'

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc

				ex af,af'
				xor %00110000			:StarXOR3_Plus1
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc


				ld a,(hl)
				and %10000111
				ld (hl),a				
				JP StarArray_Next

Stars_DrawDot_B2:		;and %11100001
				ld a,(hl)				
				and %11100001
;				or  %00001000
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)				
				and %11100001
				or  %00001000			:StarOR4_Plus1
				ld (hl),a
				ex af,af'

				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc

				ex af,af'
				xor %00001100			:StarXOR4_Plus1
				ld (hl),a


				ld a,(de)
				inc e
				ld l,a
				ld a,(de)
				inc de
				ld h,a
				add hl,bc



				ld a,(hl)
				and %11100001
;				or  %00000100
				ld (hl),a				
StardrawDone: