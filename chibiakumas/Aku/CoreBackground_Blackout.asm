
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

Background_Blackout:

	ld de,0000
	ld a,b
	ld (BlackoutLineStep_Plus1-1),a
	ld a,c
	ld (BlackoutLineStepB_Plus1-1),a

	ld b,h

	call Akuyou_ScreenBuffer_GetActiveScreen
	ld h,a

		if buildCPCv+ buildENTv
			ifdef CPC320
				ld l,&4F+1
			else
				ld l,&40
			endif
		endif
		ifdef buildZXS
			ld l,&1F	;intentionaly one too low - to avoid problems with nextline on byte boundaries
		endif 


	di
	ld (Background_BlackoutSpRestore_Plus2-2),sp

Background_BlackoutAgain:
	ld a,(BlackoutLineStep_Plus1-1)
	ld c,a
	ld a,(BlackoutLineStepB_Plus1-1)
	ld (BlackoutLineStep_Plus1-1),a
	ld a,c
	ld (BlackoutLineStepB_Plus1-1),a
 


	ld sp,hl

ifdef buildZXS
	inc sp
endif
if buildCPCv+ buildENTv
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
if buildCPCv+ buildENTv
	di
endif
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL

if buildCPCv+ buildENTv
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

	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
	push de;push HL
endif

;ex af,af'
;exx
;ei
;ld sp,&0000 Background_BlackoutSpRestore_Plus2
;di



ifdef BuildCPC

	ld a,h
	add a,&08:BlackoutLineStep_Plus1
	ld h,a

Background_Blackout_Minus1:
	bit 7,h
	jp nz,Background_BlackoutNextLineDone
	ld ixh,d	;can't use stack right now
	ld ixl,e
		ld de,&c050
		add hl,de
	ld d,ixh
	ld e,ixl
endif

ifdef buildENT
	ld a,&50	:BlackoutLineStep_Plus1
	add l
	ld l,a
	jp nc,Background_BlackoutNextLineDone
	inc h
endif



ifdef buildZXS
	ld c,&01:BlackoutLineStep_Plus1
Background_Blackout_NextLineAgain:
	inc h
	ld a,h
	and  %00000111;7
	jp nz,Background_Blackout_NextLine
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,Background_Blackout_NextLine
	ld a,h
	sub %00001000;8
	ld h,a
Background_Blackout_NextLine:
dec c
	jp nz,Background_Blackout_NextLineAgain
endif




Background_BlackoutNextLineDone:

;pop de
;pop bc
;ld a,8
;add e
;ld e,a
;push hl

djnz Background_BlackoutAgain
ld sp,&0000 :Background_BlackoutSpRestore_Plus2
ei

ret

defb 8 :BlackoutLineStepB_Plus1




Background_DrawBlackout: 
	call Background_Draw
;	ld b,2*8 ;10
;	ld c,3*8 ;30
if buildCPCv+ buildENTv
		ld h,200/3	:BlackoutSize_Plus1
		ld bc,&1030	:BlackoutSettings_Plus2
	endif
	ifdef BuildZXS
		ld h,32+32	:BlackoutSize_Plus1
		ld bc,&0303	:BlackoutSettings_Plus2

	endif
	jp Background_Blackout

Blackout5:
	push hl
	if buildENTv
		ld hl,&F0F0
		ld a,33+33
	endif

	if buildCPCv
		ld hl,&1818
		ld a,33+33
	endif
	ifdef BuildZXS
		ld hl,&0303
		ld a,32+32
	endif
	jr BlackoutApply
Blackout4:
	push hl
	if buildENTv
		ld hl,&A0F0	;buggy?
		ld a,50+30
	endif
	if buildCPCv
		ld hl,&1018	;buggy?
		ld a,50+30
	endif
	ifdef BuildZXS
		ld hl,&0203	;buggy?
		ld a,48+30
	endif
	jr BlackoutApply
Blackout3:
	push hl

	if buildENTv
		ld hl,&A0A0
		ld a,50+50
	endif
	if buildCPCv
		ld hl,&1010
		ld a,50+50
	endif
	ifdef BuildZXS
		ld hl,&0202
		ld a,48+48
	endif
	jr BlackoutApply

Blackout2:
	push hl

	if buildENTv
		ld hl,&50A0
		ld a,100+33
	endif
	if buildCPCv
		ld hl,&0810
		ld a,100+33
	endif
	ifdef BuildZXS
		ld hl,&0102
		ld a,96+32
	endif
	jr BlackoutApply
Blackout1:
	push hl

	if buildENTv
		ld hl,&5050
		ld a,200
	endif
	if buildCPCv
		ld hl,&0808
		ld a,200
	endif
	ifdef BuildZXS
		ld hl,&0101
		ld a,192
	endif
BlackoutApply:
	ld (BlackoutSize_Plus1-1),a
	ld (BlackoutSettings_Plus2-2),hl
pop hl
ret

;BlackoutApply2
;	ld (BackgroundCall_Plus2-2),hl
;pop hl
;ret


