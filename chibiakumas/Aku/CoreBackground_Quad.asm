;Quad Renderer - all lines are identical, so this is only useful for tree trunks, tower blocks, |||||| etc

;Note, you must inject the correct Nextline code into this function with code like:
;call Akuyou_ScreenBuffer_Init
;ld (BackgroundFloodFillQuad_Minus1-1),hl


;call Akuyou_ScreenBuffer_Flip
;ld (BackgroundFloodFillQuad_Minus1+1),hl


; To add some lines to your background
;
;	ld b,16
;	call BackgroundFloodFillQuad
;	

; where B is the number of lines, and HL is the right hand side of the area to fill





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Quad Test;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BackgroundFloodFillQuad:
	di
	;EXX and DI should be executed before now!
	push ix
	pop af
	ex af,af'
	exx
	ld (BackgroundFloodFillQuadSpRestore_Plus2-2),sp




	
BackgroundFloodFillQuadAgain:
	ld sp,hl
	ld iyl,b
	exx
	ex af,af'


push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
	
ex af,af'
exx

ld sp,&0000 :BackgroundFloodFillQuadSpRestore_Plus2
;call Akuyou_ScreenBuffer_GetNxtLin
;call getnxtlin
	ld a,h
	add a,&08
	ld h,a

BackgroundFloodFillQuad_Minus1:
	bit 7,h
	jp nz,BackgroundFloodFillQuadNextLineDone

	ld de,&c050
	add hl,de


BackgroundFloodFillQuadNextLineDone:




push hl
ex af,af'
ei
exx
di

exx
ex af,af'
pop hl

ld b,iyl
djnz BackgroundFloodFillQuadAgain
ld sp,(BackgroundFloodFillQuadSpRestore_Plus2-2)
ei

ret




