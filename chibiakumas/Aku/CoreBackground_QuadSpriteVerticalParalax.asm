
;Quad Sprite render - This is MUCH faster than a tilestrip, but all the tiles must be identical!

;Note, you must inject the correct Nextline code into this function with code like:
;call Akuyou_ScreenBuffer_Init
;ld (BackgroundFloodFillQuadSpriteV_Minus1-1),hl


;call Akuyou_ScreenBuffer_Flip
;ld (BackgroundFloodFillQuadSpriteV_Minus1+1),hl


; To add some lines to your background
;
;	ld b,16
;	ld de,Tile_Start
;	call BackgroundFloodFillQuadSpriteV
;	

; where B is the number of lines, DE is the start of a 32px (8 byte) wide sprite and HL is the right hand side of the area to fill


;QuadSpriteV

BackgroundFloodFillQuadSpriteVertical:
	di

	;push bc
;	push de
;	push hl
	ld (BackgroundFloodFillQuadSpriteVDeBak_Plus2-2),de
	ld (BackgroundFloodFillQuadSpriteVSpRestore_Plus2-2),sp
	ld sp,hl
ifdef buildZXS
	inc sp
endif
	exx
	ld hl,&0000 :BackgroundFloodFillQuadSpriteVDeBak_Plus2
	ld a,(hl)

	ld ixl,a
	inc l
	ld a,(hl)
	ld ixh,a
	inc l
	ld c,(hl)
	inc l
	ld b,(hl)
	inc l
	ld e,(hl)
	inc l
	ld d,(hl)
	inc l
	ld a,(hl)
	inc l
	ld h,(hl)
	ld l,a




	; we move IX to AF to save time, so the first tile is differeng
	push hl
	push de
	
	ld h,&00	:VertParalaxBit_Plus1
	ld l,h
	push hl
	push hl
	;push bc
;	push ix

push hl
push hl
push hl
push hl
	
push hl
push hl
push hl
push hl
ifndef buildZXS
push hl
push hl
push hl
push hl

push hl
push hl
push hl
push hl

push hl
push hl
push hl
push hl

push hl
push hl
push hl
push hl

push hl
push hl
push hl
push hl

push hl
push hl
push hl
push hl
endif

push hl
push hl
push bc
push ix

ld hl,ThisParalaxLine :ThisParalaxLineUpdate_Plus2
	ld a,(hl)
	ld (VertParalaxBit_Plus1-1),a
	ld a,l
	inc a
	cp LastParalaxLine

jr nz,NoParalaxRepeat
	ld a,ThisParalaxLine
NoParalaxRepeat:
ld (ThisParalaxLineUpdate_Plus2-2),a

;ex af,af'
;exx
exx


ifdef buildZXS
	ei
	ld sp,&0000 :BackgroundFloodFillQuadSpriteVSpRestore_Plus2
	di


	inc h
	ld a,h
	and  %00000111;7
	jp nz,BackgroundFloodFillQuadSpriteVNextLineDone
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,BackgroundFloodFillQuadSpriteVNextLineDone
	ld a,h
	sub %00001000;8
	ld h,a
endif

ifdef BuildCPC

ei
ld sp,&0000 :BackgroundFloodFillQuadSpriteVSpRestore_Plus2
di





;call Akuyou_ScreenBuffer_GetNxtLin
;call getnxtlin
	ld a,h
	add a,&08
	ld h,a

BackgroundFloodFillQuadSpriteV_Minus1:
	bit 7,h
	jp nz,BackgroundFloodFillQuadSpriteVNextLineDone
	push de
		ld de,&c050
		add hl,de
	pop de
endif
BackgroundFloodFillQuadSpriteVNextLineDone:

;pop de
;pop bc
ld a,8
add e
ld e,a
;push hl


djnz BackgroundFloodFillQuadSpriteVertical
;ld sp,(BackgroundFloodFillQuadSpriteVSpRestore_Plus2-2)
ei

ret

align 16,0
ThisParalaxLinePre:
defb 0
ThisParalaxLine:
defb 0
defb %01000000
defb 0
defb 0
defb 0
defb %00010000
defb 0
LastParalaxLinePre:
defb 0
LastParalaxLine:
defb 0




UpdateParalax:
		call Akuyou_Timer_GetTimer
		and %00000100
		jp z,Background_DrawALTParalaxDone

		ld a,(ThisParalaxLineUpdate_Plus2-2)

		dec a
		cp ThisParalaxLinePre
		jr nz,NoParalaxRepeatB


		ld a,LastParalaxLinePre
		NoParalaxRepeatB:
		ld (ThisParalaxLineUpdate_Plus2-2),a
	Background_DrawALTParalaxDone:
ret
UpdateParalaxUp:
		call Akuyou_Timer_GetTimer
		and %00000100
		jp z,Background_DrawALTParalaxDoneU

		ld a,(ThisParalaxLineUpdate_Plus2-2)

		inc a
		cp LastParalaxLine
		jr nz,NoParalaxRepeatBU


		ld a,ThisParalaxLinePre
		NoParalaxRepeatBU:
		ld (ThisParalaxLineUpdate_Plus2-2),a
	Background_DrawALTParalaxDoneU:
ret
