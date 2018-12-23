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
;	call BackgroundFloodFillQuadSpriteColumn
;	

; where B is the number of lines, DE is the start of a 32px (8 byte) wide sprite and HL is the right hand side of the area to fill


;QuadSprite

BackgroundFloodFillQuadSpriteColumn:
	ld (ColumnBlackLines_Plus1-1),a

BackgroundFloodFillQuadSpriteColumnb:
	di

	;push bc
;	push de
;	push hl
	ld (BackgroundFloodFillQuadSpriteColumnDeBak_Plus2-2),de
	ld (BackgroundFloodFillQuadSpriteColumnSpRestore_Plus2-2),sp
	ld sp,hl
ifdef buildZXS
	inc sp
endif

	exx
	ld hl,&0000 :BackgroundFloodFillQuadSpriteColumnDeBak_Plus2
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
	push bc
	push ix;push af
	pop af
	dec sp
	Dec sp

push hl
push de
push bc
push af

push hl
push de
push bc
push af

push hl
push de
push bc
push af
if buildCPCv+buildENTv
	push hl
	push de
	push bc
	push af

	push hl
	push de
	push bc
	push af

	push hl
	push de
	push bc
	push af

	push hl
	push de
	push bc
	push af

	push hl
	push de
	push bc
	push af

	push hl
	push de
	push bc
	push af
endif

exx

ifdef buildCPC
	ld a,h
	add a,&08
	ld h,a

BackgroundFloodFillQuadSpriteColumnB_Minus1:
	bit 7,h
	jp nz,BackgroundFloodFillQuadSpriteColumnNextLineDoneB
	push de
		ld de,&c050
		add hl,de
	pop de
endif

ifdef buildENT
	ld a,&50
	add l
	ld l,a
	jp nc,BackgroundFloodFillQuadSpriteColumnNextLineDoneB
	inc h
endif

ifdef buildZXS
;	dec hl

	inc h
	ld a,h
	and  %00000111;7
	jp nz,BackgroundFloodFillQuadSpriteColumnNextLineDoneB
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,BackgroundFloodFillQuadSpriteColumnNextLineDoneB
	ld a,h
	sub %00001000;8
	ld h,a
	jp BackgroundFloodFillQuadSpriteColumnNextLineDoneB
endif

BackgroundFloodFillQuadSpriteColumnNextLineDoneB:

ld c,3	:ColumnBlackLines_Plus1
BackgroundFloodFillQuadSpriteColumn_MoreBlanks:

	ld sp,hl
	ifdef buildZXS
		inc sp
	endif
exx


ld hl,&0000

	; we move IX to AF to save time, so the first tile is differeng
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

if buildCPCv+buildENTv
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



;ex af,af'
;exx
exx
ei
ld sp,&0000 :BackgroundFloodFillQuadSpriteColumnSpRestore_Plus2
di


ifdef buildCPC
	ld a,h
	add a,&08
	ld h,a

BackgroundFloodFillQuadSpriteColumn_Minus1:
	bit 7,h
	jp nz,BackgroundFloodFillQuadSpriteColumnNextLineDone
	push de
		ld de,&c050
		add hl,de
	pop de
endif

ifdef buildENT
	ld a,&50
	add l
	ld l,a
	jp nc,BackgroundFloodFillQuadSpriteColumnNextLineDone
	inc h
endif
ifdef buildZXS
;	dec hl

	inc h
	ld a,h
	and  %00000111;7
	jp nz,BackgroundFloodFillQuadSpriteColumnNextLineDone
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,BackgroundFloodFillQuadSpriteColumnNextLineDone
	ld a,h
	sub %00001000;8
	ld h,a
	jp BackgroundFloodFillQuadSpriteColumnNextLineDone
endif

BackgroundFloodFillQuadSpriteColumnNextLineDone:

dec c
jp nz,BackgroundFloodFillQuadSpriteColumn_MoreBlanks

ld a,8
add e
ld e,a
;push hl
dec b
jp nz, BackgroundFloodFillQuadSpriteColumnb
;ld sp,(BackgroundFloodFillQuadSpriteColumnSpRestore_Plus2-2)
ei

ret





