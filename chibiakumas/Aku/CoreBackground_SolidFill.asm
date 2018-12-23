
;Solid fill render - fill lines with DE

;Note, you must inject the correct Nextline code into this function with code like:
;call Akuyou_ScreenBuffer_Init
;ld (BackgroundSolidFillNextLine_Minus1-1),hl


;call Akuyou_ScreenBuffer_Flip
;ld (BackgroundSolidFillNextLine_Minus1+1),hl


; To add some lines to your background
;
;	ld b,16
;	ld de,&0000
;	call BackgroundFloodFillQuadSprite
;	

; where B is the number of lines, HL is the right hand side of the area to fill


;QuadSprite

BackgroundSolidFill:
di
ld (BackgroundSolidFillSpRestore_Plus2-2),sp
BackgroundSolidFillAgain:
ld sp,hl
ifdef buildZXS
	inc sp
endif
if buildCPCv+buildENTv
	ei
endif
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL

if buildCPCv+buildENTv
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL

	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	di
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
endif


 



;call Akuyou_ScreenBuffer_GetNxtLin
;call getnxtlin
ifdef buildCPC
	ld a,h
	add a,&08
	ld h,a
	
	BackgroundSolidFillNextLine_Minus1:
		bit 7,h
		jp nz,BackgroundSolidFillNextLineDone
		push de
			ld de,&c050
			add hl,de
		pop de
endif
ifdef buildENT
	ld a,&50
	add l
	ld l,a
	jp nc,BackgroundSolidFillNextLineDone
	inc h
endif
ifdef buildZXS
	ei
	ld sp,&0000 :BackgroundSolidFillSpRestore_Plus2



	inc h
	ld a,h
	and  %00000111;7
	jp nz,BackgroundSolidFillNextLineDone
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,BackgroundSolidFillNextLineDone
	ld a,h
	sub %00001000;8
	ld h,a

endif

BackgroundSolidFillNextLineDone:
di
djnz BackgroundSolidFillAgain
;ld sp,(BackgroundFloodFillQuadSpriteSpRestore_Plus2-2)
if buildCPCv+buildENTv
	ld sp,&0000 :BackgroundSolidFillSpRestore_Plus2
	ei
else
;	ld sp,(BackgroundFloodFillQuadSpriteSpRestore_Plus2-2)
	ei
endif

ret
