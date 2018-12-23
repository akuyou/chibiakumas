ifdef BuildZXS
Rle_FromPointers:
	ex hl,de
	;use a two part jumpblock to get the RLE settings
	;this is used to show an RLE from a different ram bank.
	; pass jumpblock in DE
	push hl

		ld de,3
		add hl,de
		call callhl
		di
		call RLE_Draw_Color
	pop hl

	call callhl
	jp RLE_Draw




endif

RLE_Draw_Color:



  		ld a,ixh
		ld (ImageWidth2B_Plus2-2),a
		ld (ImageWidth2C_Plus1-1),a
		ld (ImageWidth2D_Plus2-2),a
		ld (ImageWidth2E_Plus1-1),a



		ex af,af'

		push hl
		ld h,&58
		exx
		ld hl,RLENextLineHL
		ld de,RLENextLine

		jr RLE_Draw_ColorStartPoint
	
;		ld a,IXL
;		LD L,a
;		jp RLE_DrawGetNextLine







RLE_Draw:
  		ld a,ixh
		ld (ImageWidthB_Plus2-2),a
		ld (ImageWidthC_Plus1-1),a
		ld (ImageWidthD_Plus2-2),a
		ld (ImageWidthE_Plus1-1),a
		ex af,af'

		push hl
		ld h,&40
		exx

		ld hl,RLE_NextScreenLineHL
		ld de,RLE_NextScreenLine

RLE_Draw_ColorStartPoint:

		ex af,af'
		ld (ImageWidthA_Plus1-1),a
		cpl
		inc a
		ld (NegativeImageWidth_Plus2-2),a

		ld(RLE_NextScreenLineHL_Plus2-2),hl
		ld(RLE_NextScreenLineHLB_Plus2-2),hl
		ld(RLE_NextScreenLineHLC_Plus2-2),hl
		ld(RLE_NextScreenLine_Plus2-2),de
		ld(RLE_NextScreenLineB_Plus2-2),de



		exx

		ld a,d
		ld (RLE_LastByteH_Plus1-1),a
		ld a,e
		ld (RLE_LastByteL_Plus1-1),a


		ld a,IXL
		LD L,a
		ld a,b
				ld de,&FFFF :NegativeImageWidth_Plus2
		or a
RLE_DrawGetNextLine:
		jr z,RLE_DrawGotLine
		push af
			call RLE_NextScreenLineHL  :RLE_NextScreenLineHLC_Plus2
		pop af
		add hl,de
		dec a
		jr RLE_DrawGetNextLine
RLE_DrawGotLine:
		ld (RLE_ScrPos_Plus2-2),hl
	;	xor a
		ld iyl,0 :ImageWidthA_Plus1
		ld a,255
		ld e,a
		;ld (Nibble_Plus1-1),a
	pop hl


RLE_MoreBytesLoop:

	inc hl
	ld a,(hl)
	ld b,a
	or a
	jp z,RLE_OneByteData
	and %00001111
	jp z,RLE_PlainBitmapData
	ld ixh,0
	ld ixl,a

	;we're doing Nibble data, Expand the data into two pixels of Mode 1 and duplicate

	ld a,b
	and %11110000
	rrca
	rrca
	rrca
	rrca
	ld c,a

	ld a,b
	and %11110000
	or c
	ld c,a


	ld a,ixl
	cp 15
	jp nz,RLE_NoMoreNibbleBytes
	push de
RLE_MoreNibbleBytes:
		inc hl
		ld a,(hl)
		ld d,0
		ld e,a
		add ix,de
		cp 255
		jp z,RLE_MoreNibbleBytes
	pop de

RLE_NoMoreNibbleBytes:


	ld a,e
	or a
	jp z,RLE_MoreBytesPart2Flip


	ld a,ixl
	cp 4
	call nc,RLE_ByteNibbles



	xor a
	ld d,a ;byte for screen
	push hl
	ld hl,&4020 :RLE_ScrPos_Plus2
	ld b,iyl
RLE_MoreBytes:
	ld a,c
	and %00001111
	or d
	ld d,a
	dec ix
	ld a,ixl
	or ixh
	jr z,RLE_LastByteFlip


RLE_MoreBytesPart2:
	ld a,c
	and %11110000
	or d
	ld d,a

	dec ix

		ld (hl),d
		dec hl
		dec b
		call z,RLE_NextScreenLineHL	:RLE_NextScreenLineHL_Plus2

	xor a
	ld d,a ;byte for screen

	ld a,ixl
	or ixh
	jr nz,RLE_MoreBytes

RLE_LastByte:
	ld iyl,b
	ld (RLE_ScrPos_Plus2-2),hl
	pop hl
;	ld iyl,b
	ld a,&00:RLE_LastByteH_Plus1
	cp h
	jp nz,RLE_MoreBytesLoop

	ld a,&00:RLE_LastByteL_Plus1
	cp l
	jp nz,RLE_MoreBytesLoop

	ret
RLE_LastByteFlip:
	ld a,e
	cpl
	ld e,a
	jp RLE_LastByte
RLE_MoreBytesPart2Flip:
	push hl
	ld b,iyl
	ld hl,(RLE_ScrPos_Plus2-2)
	ld a,e
	cpl
	ld e,a
	jp RLE_MoreBytesPart2

RLE_NextScreenLineHL:
	push af
	push de
		ld b,0	 :ImageWidthE_Plus1
		ld de,&000+0 :ImageWidthD_Plus2
		add hl,de
		dec hl

		inc h
		ld a,h
		and  %00000111;7
		jp nz,RLE_NextScreenLineHL_Done
		ld a,l
		add a,%00100000;32
		ld l,a
		jp c,RLE_NextScreenLineHL_Done
		ld a,h
		sub %00001000;8
		ld h,a
RLE_NextScreenLineHL_Done:
		inc hl

	pop de
	pop af
	ret

RLE_NextScreenLine:
	push hl
		ld iyl,0 :ImageWidthC_Plus1
		ld hl,&0000 :ImageWidthB_Plus2
		add hl,de

		dec hl

		
		inc h
		ld a,h
		and  %00000111;7
		jp nz,RLE_NextScreenLine_Done
		ld a,l
		add a,%00100000;32
		ld l,a
		jp c,RLE_NextScreenLine_Done
		ld a,h
		sub %00001000;8
		ld h,a


RLE_NextScreenLine_Done:
		inc hl
		ex hl,de
	pop hl
	ret

RLE_PlainBitmapData:
	push de
		ld a,(hl)
		rrca
		rrca
		rrca
		rrca
		ld b,0
		ld c,a

		cp 15
		jp nz,RLE_PlainBitmapDataNoExtras
	;More than 14 bytes, load an extra byte into the count
RLE_PlainBitmapDataHasExtras:
		inc hl
		ld a,(hl)
		or a
		jr z,RLE_PlainBitmapDataNoExtras	; no more bytes
		push hl
			ld h,0
			ld l,a
			add hl,bc
			ld b,h
			ld c,l
		pop hl

		cp 255
		jr z,RLE_PlainBitmapDataHasExtras
RLE_PlainBitmapDataNoExtras:

	
		ld de,(RLE_ScrPos_Plus2-2)
		RLE_PlainBitmapData_More:
		inc hl
		ld a,(hl)
		ld (de),a
		dec de



		dec iyl
		call z,RLE_NextScreenLine :RLE_NextScreenLine_Plus2
		dec bc
		ld a,b
		or c
		jp nz,RLE_PlainBitmapData_More

		ld (RLE_ScrPos_Plus2-2),de

	pop de
	jp RLE_MoreBytesLoop

RLE_OneByteData:
	push de
		xor a 
		ld b,a
		ld c,a
RLE_OneByteDataExtras:
		inc hl
		ld a,(hl)
		push hl
			ld h,0
			ld l,a
			add hl,bc
			ld b,h
			ld c,l
		pop hl

		cp 255
		jp z,RLE_OneByteDataExtras

		inc hl
		ld a,(hl)
		ld (RLE_ThisOneByte_Plus1-1),a


		ld de,(RLE_ScrPos_Plus2-2)
RLE_OneByteData_More:
		ld a,00:RLE_ThisOneByte_Plus1
		ld (de),a
		dec de
		dec iyl
		call z,RLE_NextScreenLine :RLE_NextScreenLineB_Plus2




		dec bc
		ld a,b
		or c
		jp nz,RLE_OneByteData_More

		ld (RLE_ScrPos_Plus2-2),de


	pop de
	jp RLE_MoreBytesLoop
RLE_ByteNibbles:
	di
	ld a,c
	exx
	ld b,iyl
	ld c,a
	ld d,ixh
	ld e,ixl
		ld hl,(RLE_ScrPos_Plus2-2)
RLE_ByteNibblesMore3:
		ld a,3
RLE_ByteNibblesMore:
		ld (hl),c
		dec hl 
		dec b;iyl
		call z,RLE_NextScreenLineHL :RLE_NextScreenLineHLB_Plus2

		dec de
		dec de
		cp e
		jp c,RLE_ByteNibblesMore

		ld a,d
		or a
		jp nz,RLE_ByteNibblesMore3

	ld (RLE_ScrPos_Plus2-2),hl
	ld iyl,b
	ld ixh,d
	ld ixl,e
	exx

ret
RLENextLineHL:
		ld b,0	 :ImageWidth2E_Plus1
	push de
		ld de, 0000: ImageWidth2B_Plus2
		add hl,de
		ld de,32
		add hl,de
	pop de
ret

RLENextLine:
	ld iyl,0 :ImageWidth2C_Plus1
	push hl
		ld hl,0000:ImageWidth2D_Plus2
		add hl,de
		ld de,32
		add hl,de
		ex hl,de
	pop hl
ret
