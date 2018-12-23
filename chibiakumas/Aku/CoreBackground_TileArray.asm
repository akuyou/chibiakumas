














; ***************************************************************************************************************************

; 			Background - Tile Array

; ***************************************************************************************************************************





Background_TileOffsetV1:
	ld de,Background_TileEndSkip1
	ld hl,Background_TileStartSkip4
	jp Background_TileDoLineStart
Background_TileOffsetV2:
	ld de,Background_TileEndSkip2
	ld hl,Background_TileStartSkip3
	jp Background_TileDoLineStart
Background_TileOffsetV3:
	ld de,Background_TileEndSkip3
	ld hl,Background_TileStartSkip2
	jp Background_TileDoLineStart
Background_TileOffsetV4:
	ld de,Background_TileEndSkip4
	ld hl,Background_TileStartSkip1
	jp Background_TileDoLineStart
Background_TileNeedCarry:
	ld hl,Background_TileDoLastHalf

	ld de,(Background_FirstActionJump_Plus2-2)
	ld (Background_TileStartCarryReturnPoint_Plus2-2),de
	ld de,Background_TileStartCarry
	ld (Background_FirstActionJump_Plus2-2),de
	jp Background_TileNeedCarryRet
BackgroundTile_Draw:
	ld (Background_TileStripMemposA_Plus2-2),de
	xor a
	ld (Background_LineNo_Plus1-1),a

	ld a,c
	ld (Background_LeftShift_Plus1-1),a
        or a ; only done to clear carry flag
	rra
	push hl
		push af	

			or a
			jr z,Background_TileOffsetV1
			dec a
			jr z,Background_TileOffsetV2
			dec a
			jr z,Background_TileOffsetV3
			dec a
			jr z,Background_TileOffsetV4

			ld de,Background_TileEndSkip0
			ld hl,Background_TileStartSkip0
Background_TileDoLineStart:
			ld (Background_LastActionJump_Plus2-2),de
			ld (Background_FirstActionJump_Plus2-2),hl
		pop af

		ld hl,Background_NoLastCarry
		;ld de,TileStartCarryReturn 
		jr c,Background_TileNeedCarry
Background_TileNeedCarryRet:
		ld (Background_TileDoLastHalfJump_Plus2-2),hl
		;ld (TileFirstCarryJump_Plus2-2),de
	pop hl


Background_TileDoLine:

	ld (Background_TileSPrestore_Plus2-2),sp
Background_TileDoLineAgain:
	di
	ld sp,hl

	exx
	ld (Background_BCRestore_Plus2-2),bc


	ld a,00:Background_LineNo_Plus1
	ld b,a
	add 8
	ld (Background_LineNo_Plus1-1),a



	ld hl,&0000 :Background_TileStripMemposA_Plus2
	ld a,(hl)
	add b
	add 0 :Background_LeftShift_Plus1
	ld e,a
	inc l
	ld d,(hl)
	inc l
	ex hl,de
		
;	jp TileStartCarryReturn TileFirstCarryJump_Plus2
	jp Background_TileStartSkip0:Background_FirstActionJump_Plus2
;TileStartCarryReturn


Background_TileStartSkip0:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
Background_TileStartSkip1:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
Background_TileStartSkip2:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
Background_TileStartSkip3:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc

Background_TileStartSkip4:

	ld a,9
Background_TileAgain:
	ex hl,de
		ld c,(hl)
		inc l
		ld b,(hl)
		inc l
	ex hl,de
	add hl,bc
Background_TileAgainFirst:
	ld b,(hl)
	dec l
	ld c,(hl)
	dec l
	push bc
	ld b,(hl)
	dec l
	ld c,(hl)
	dec l
	push bc
	ld b,(hl)
	dec l
	ld c,(hl)
	dec l
	push bc
	ld b,(hl)
	dec l
	ld c,(hl)
	
	push bc
Background_TileDone:
	dec a
	jp nz,Background_TileAgain



	ex hl,de
		ld c,(hl)
		inc l
		ld b,(hl)
		inc l
	ex hl,de
	add hl,bc


	jp Background_TileEndSkip0 :Background_LastActionJump_Plus2
Background_TileEndSkip0:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)
	push bc
Background_TileEndSkip1:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)
	push bc
Background_TileEndSkip2:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
Background_TileEndSkip3:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc



Background_TileEndSkip4:
jp Background_TileDoLastHalf :Background_TileDoLastHalfJump_Plus2
Background_TileDoLastHalf:
	pop bc
	dec sp
	ld b,c
	dec l
	ld c,(hl)
	push bc
	jp Background_NoLastCarryDone
Background_NoLastCarry:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)
	push bc


Background_NoLastCarryDone:

	ld bc,&0000 :Background_BCRestore_Plus2
	exx


ld sp,&0000:Background_TileSPrestore_Plus2

;jp LineDouble
Background_LineDoubleReturn:
ei
	;call getnxtlin
	ld a,h
	add a,&08
	ld h,a

GetNextLineTileLoopCheckB_Minus1:
	bit 7,h
	jp nz,Background_LineDoubleReturnB

	ld de,&c050
	add hl,de

Background_LineDoubleReturnB:
	dec b
	jp nz,Background_TileDoLineAgain
	;ld sp,(Background_TileSPrestore_Plus2)
ret

Background_TileStartCarry:
	dec l
	ld b,(hl)
	push bc
	inc sp
jp Background_TileStartCarry	:Background_TileStartCarryReturnPoint_Plus2


; We need to encode the tiledata before drawing - this is to make the tiles fast!

BackgroundTile_Encode:
	ld (Background_TileStripMemposB_Plus2-2),bc
	;ld de,TileStrip
	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl

	ex hl,de	; First pair is a memory literal
	ld (hl),c
	inc hl
	ld (hl),b
	inc hl
	ex hl,de
	
	ld iyl,10


Background_TileStripDataEncodeLoop:
	ld a,b
	cpl
	ld b,a
	ld a,c		;Negate BC
	cpl
	ld c,a
	inc bc
	ld ixh,b
	ld ixl,c

	ld c,(hl)	; load next tile pointer
	inc hl
	ld b,(hl)
	inc hl

	ld a,b
	or c
	jp nz,Background_TileStripDataEncodeValOK
	;0000 = repeat loop


	ld hl,&0000:Background_TileStripMemposB_Plus2


	ld c,(hl)	; load next tile pointer
	inc hl
	ld b,(hl)
	inc hl
Background_TileStripDataEncodeValOK:
	add ix,bc
	push bc
	ld bc,&0007	; need to add 7 to reset read cursor to right hand pixel
	add ix,bc
	pop bc

	ex hl,de	; First pair is a memory literal
	ld a,ixl
	ld (hl),a
	inc hl
	ld a,ixh
	ld (hl),a
	inc hl
	ex hl,de

	dec iyl
	jp nz,Background_TileStripDataEncodeLoop	
ret



