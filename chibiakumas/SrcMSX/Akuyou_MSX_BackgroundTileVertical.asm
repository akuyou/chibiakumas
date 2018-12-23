VDP_Tile_MyHMMM:
VDP_Tile_MyHMMM_SX:	defw &0000 ;SY 32,33
VDP_Tile_MyHMMM_SY:	defw &0000 ;SY 34,35
VDP_Tile_MyHMMM_DX:	defw &0000 ;DX 36,37
VDP_Tile_MyHMMM_DY:	defw &0060 ;DY 38,39
VDP_Tile_MyHMMM_NX:	defw &0080 ;NX 40,41 
VDP_Tile_MyHMMM_NY:	defw &0000 ;NY 42,43
		defb 0     ;Color 44 - unused
VDP_Tile_MyHMMM_MV:	defb 0     ;Move 45
		defb %11010000 ;Command 46	


;	MSXTileList
;	defb 0,16
;	defw 	MSXTiles
;	defb 	ticks,pos (default 0)
;	defb 0,0
 

Background_Tiles_Vertical:
	call Akuyou_ScreenBuffer_GetActiveScreen
;	ld (TileDestY_Plus2-1),a
	ld (VDP_Tile_MyHMMM_DY+1),a



	ld a,h
	or l
	ret z		;return if given a zero pointer


	ld iyl,0


;	xor a
;	ld (BusyGradientContinue_Plus1-1),a

endif
Background_TilesAgain:

		ld de,0
		ld e,(hl)
		inc hl
		ld (VDP_Tile_MyHMMM_DX),de

		ld a,(hl)
		inc hl
		or a
		ret z ;zero means end of list
		ld (VDP_Tile_MyHMMM_NX),a
		
		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl	
		ld ix,0000:TileYOffset_Plus2
		add ix,de
		ld (TileYOffsetB_Plus2-2),ix

		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl	
		ld ix,&0000:TileXOffset_Plus2
		add ix,de
		LD (VDP_Tile_MyHMMM_SX),ix

;		push hl
;			ld hl,0000 
;			add hl,de
;			LD (VDP_Tile_MyHMMM_SX),hl
;		pop hl

		ld e,(hl)

		bit 7,e
		di
		exx
		ld b,&34	;inc (hl)  // inc a
;		ld bc,&343C	;inc (hl)  // inc a
		jp nz,Background_TilesLeft
		ld b,&35
;		ld bc,&353c	;dec (hl)  // inc a
Background_TilesLeft:
		ld hl,Background_IncHLS
		ld (hl),b
		inc hl
		ld (hl),b	:BackgroundSlowdownB_Plus1

;		ld hl,Background_IncAs
;		ld (hl),c
;		inc hl
;		ld (hl),c	BackgroundSlowdownA_Plus1


		exx
		ei



		inc hl

		call Akuyou_Timer_GetTimer
		;ld a,(Timer_TicksOccured_Plus1-1)
		and e
		ld a,(hl)
		jr z,Background_Tiles_Notick


Background_IncHLs:nop;dec (hl);inc (hl)	;Can only work in whole bytes on MSX2
;endif
		nop;dec (hl);inc (hl)	

		
		cp 192
		jr c,Background_TilesNoReset
		ld a,0					;***** change to 192 for reverse
		ld (hl),a
Background_TilesNoReset:

Background_Tiles_Notick:
		;push bc
			ld ix,&0000:TileYOffsetB_Plus2
			ld b,0
			ld c,a
			add ix,bc
		;pop bc
		ld (VDP_Tile_MyHMMM_SY),ix

		cpl
		sub 64
		inc a
		ld (VDP_Tile_MyHMMM_NY),a
		xor a
		ld (VDP_Tile_MyHMMM_DY),a
		;ld (VDP_Tile_MyHMMM_NY+1),a

		inc hl
		push hl

			ld hl,VDP_Tile_MyHMMM
			push hl
			ld a,(VDP_Tile_MyHMMM_NX)
			;or a
			;call z,Background_ByteUP

			ld a,(VDP_Tile_MyHMMM_NY)
		or a
		jr z,Background_NothingToDrawB

			;call VDP_HMMM_BusyCheck
			ld a,7
			call Akuyou_VDP_CommandNum
endif
Background_NothingToDrawB:
			pop hl
			;	xor a				
		;push bc
			ld ix,(TileYOffsetB_Plus2-2)
			;ld b,0
			;ld c,a
			;add ix,bc
		;pop bc
		ld (VDP_Tile_MyHMMM_SY),ix

				ld a,(VDP_Tile_MyHMMM_NY)
				ld (VDP_Tile_MyHMMM_DY),a		
				cpl
				sub 64
Background_IncAs:		;nop;dec a;inc a
;ifndef buildMSX_V9K
				inc a :BackgroundSlowdownA_Plus1;nop;dec a;inc a		
				jr z,Background_NothingToDraw


				ld (VDP_Tile_MyHMMM_NY),a



			;call VDP_HMMM_BusyCheck
			ld a,7
			call Akuyou_VDP_CommandNum

Background_NothingToDraw:
		pop hl
jp Background_TilesAgain

;Background_ByteUP
;push hl
;	ld hl,&0100
;	ld (VDP_Tile_MyHMMM_NY),hl
;pop hl
;ret