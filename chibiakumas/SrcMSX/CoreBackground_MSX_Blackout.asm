
;Quad Sprite render - This is MUCH faster than a tilestrip, but all the tiles must be identical!

;Note, you must inject the correct Nextline code into this function with code like:
;call Akuyou_ScreenBuffer_Init
;ld (BackgroundFloodFillQuadSprite_Minus1-1),hl


;call Akuyou_ScreenBuffer_Flip
;ld (BackgroundFloodFillQuadSprite_Minus1+1),hl


; To add some lines to your background
;
;	ld b,16
;	ld de,Tile_Start
;	call BackgroundFloodFillQuadSprite
;	

; where B is the number of lines, DE is the start of a 32px (8 byte) wide sprite and HL is the right hand side of the area to fill


;QuadSprite

Background_DrawBlackout: 
	call Background_Draw

	

	ld a,0
	call Akuyou_VDP_CommandNum
	ld bc,1*2
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a

	ld (VDPBlackout_Plus2-2),hl
	ld (VDPBlackout2_Plus2-2),hl

	ld b,0:Blackout_Count_Plus1
	ld de,&1030	:BlackoutSettings_Plus2
;	jp Background_Blackout
	di

call Akuyou_ScreenBuffer_GetActiveScreen
	ld h,a
	ld l,00
	ld (VDP_BlackoutHMMV_DY),hl

Background_Blackout:


	exx
	ld hl,VDP_BlackoutHMMV
	call null :VDPBlackout_Plus2
	exx

	ei
	dec b
	ret z
	di


	ld a,d
	add l
	cp 192
	jr nc,Fail
	ld l,a
	ld (VDP_Blackout2HMMV_DY),hl

	exx
	ld hl,VDP_Blackout2HMMV
	call null :VDPBlackout2_Plus2
	exx

	ei
	dec b
	ret z
	di



	ld a,e
	add l
	cp 192
	jr nc,Fail
	ld l,a
	ld (VDP_BlackoutHMMV_DY),hl

jp Background_Blackout
Fail:
di
halt

 



Blackout5:
	push hl
	ld a,64	;count
	ld de,&0101	;Blacklines
	ld hl,&0303	;Skips
	jr BlackoutApply
Blackout4:
	push hl
	ld a,96		;count
	ld de,&0101	;Blacklines
	ld hl,&0202	;Skips

	jr BlackoutApply
Blackout3:
	push hl
	ld a,96+32	;count
	ld de,&0101	;Blacklines
	ld hl,&0201	;Skips

	jr BlackoutApply
Blackout2:
	push hl
	ld a,	48	;count
	ld de,&0303	;Blacklines
	ld hl,&0404	;Skips

	jr BlackoutApply
Blackout1:
	push hl
	ld a,1		;count
	ld de,&C0C0	;Blacklines
	ld hl,&0000	;Skips

BlackoutApply:
	ld (Blackout_Count_Plus1-1),a
	ld a,d
	ld (VDP_BlackoutHMMV_NY),a
	ld a,e
	ld (VDP_Blackout2HMMV_NY),a
	ld (BlackoutSettings_Plus2-2),hl
pop hl
ret

;BlackoutApply2
;	ld (BackgroundCall_Plus2-2),hl
;pop hl
;ret




VDP_Blackout2HMMV:	
VDP_Blackout2HMMV_DX:	defw &0000 ;DX 36,37
VDP_Blackout2HMMV_DY:	defw &0000 ;DY 38,39
VDP_Blackout2HMMV_NX:	defw &0100 ;NX 40,41
VDP_Blackout2HMMV_NY:	defw &0001 ;NY 42,43
VDP_Blackout2HMMV_Byte:defb &11   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	


VDP_BlackoutHMMV:	
VDP_BlackoutHMMV_DX:	defw &0000 ;DX 36,37
VDP_BlackoutHMMV_DY:	defw &0000 ;DY 38,39
VDP_BlackoutHMMV_NX:	defw &0100 ;NX 40,41
VDP_BlackoutHMMV_NY:	defw &0001 ;NY 42,43
VDP_BlackoutHMMV_Byte:defb &11   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	
