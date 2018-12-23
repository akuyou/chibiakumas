VDP_RLEProcessor_GetLastY:
	;Get the last Y of the last imported batch
	ld IY,(VDP_MyHMMC_DY)
	ld de,(VDP_MyHMMC_NY)
	add iy,de
ret

VDP_RLEProcessorFromMemory:
	call VDP_Wait
	;IX = dest Xpos 
	;IY = dest Ypos 
	ld (VDP_MyHMMC_DX),ix
	ld (VDP_MyHMMC_DY),iy

	xor a
	ld (VDP_RLENotFirstRunFlag_Plus1-1),a
	;BC=Bytecount
	;HL=memory pos
	;DE=EOF
VDP_RLEProcessorFromMemoryAgain:

	push de
		ld bc,128
		push bc
			push hl

				call VDP_RLEProcessorAgain
			pop hl
		pop bc
		add hl,bc
	pop de


	ld a,h
	dec a
	cp d
	jr nz,VDP_RLEProcessorFromMemoryAgain
ret

VDP_RLEProcessor:
	;HL/BC = Filename
	;IX = dest Xpos 
	;IY = dest Ypos 
	ld (VDP_MyHMMC_DX),ix
	ld (VDP_MyHMMC_DY),iy

	xor a
	ld (VDP_RLENotFirstRunFlag_Plus1-1),a
	ld iy,VDP_RLEProcessorAgain
	jp LoadDiscSectorSpecialMSX

VDP_RLEProcessorAgain:
	di


	
	ld a,0 :VDP_RLENotFirstRunFlag_Plus1
	or a
	jp nz,VDP_RLEProcessor_NotFirstRun	
	inc a
	ld (VDP_RLENotFirstRunFlag_Plus1-1),a


	ld (RleStartPos_Plus2-2),hl

	ld a,(hl)	;File format
	inc hl


		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl

;		ld (VDP_RLEWidth_Plus2-2),de
		ld (VDP_MyHMMC_NX),de

		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl

;		ld (VDP_RLEHeight_Plus2-2),de		
		ld (VDP_MyHMMC_NY),de

;	pop af 

	or a
	jr z,VDP_RLEProcessor_BmpNoPalette
;	ex hl,de
		call VDP_SetPalette
;	ex hl,de
VDP_RLEProcessor_BmpNoPalette:


		ld a,(hl)
		inc hl
		ld (VDP_MyHMMCByte),a
		ex hl,de
		ld hl,VDP_MyHMMC
		call VDP_HMMC_Generated


		ld a,(de)
		ifndef Vdp9k_Command 
			out (VdpOut_Indirect),a
		else
			out (Vdp9k_Command),a
		endif

push de

	ld ix,&0000 :RleStartPos_Plus2
	push de
		ld de,128
		add ix,de
	pop de
	ld a,d
	cpl
	ld d,a
	ld a,e
	cpl
	ld e,a
	inc de
	add ix,de

;	ld ix,DiskBuffer_End
;	ld a,d
;	cpl
;	ld d,a
;	ld a,e
;	cpl
;	ld e,a
;	inc de
;	add ix,de
pop hl
ld a,ixl
ld iyh,a
RLE_Draw:
	push hl
;		ld a,d
;		ld (RLE_LastByteH_Plus1-1),a
;		ld a,e
;		ld (RLE_LastByteL_Plus1-1),a
	
		ld a,0
;				ld de,&FFFF NegativeImageWidth_Plus2
		or a


RLE_DrawGetNextLine:
		jr z,RLE_DrawGotLine
;		call RLE_NextScreenLineHL
;		add hl,de
		dec a
		jr RLE_DrawGetNextLine
RLE_DrawGotLine:
;		ld (RLE_ScrPos_Plus2-2),hl
	;	xor a
;				ld iyl,RLE_ImageWidth ImageWidthA_Plus1
		ld a,255
		ld e,a
		;ld (Nibble_Plus1-1),a
	pop hl

RLE_MoreBytesLoop:

	inc hl
	dec iyh
	call z,RLE_SaveState
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
	ld c,a
	rrca
	rrca
	rrca	;Remove these for Left->right
	rrca
	or c
	ld c,a

	ld a,ixl
	cp 15
	jp nz,RLE_NoMoreNibbleBytes

RLE_MoreNibbleBytes:
		inc hl
		dec iyh
		call z,RLE_SaveState
		ld a,(hl)
	push de
		ld d,0
		ld e,a
		add ix,de
	pop de
		cp 255
		jp z,RLE_MoreNibbleBytes


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
;	ld hl,&C050 RLE_ScrPos_Plus2
	ld b,iyl
RLE_MoreBytes:
	ld a,c
;	and %00001111
	and %11110000
	or d
	ld d,a
	dec ix
	ld a,ixl
	or ixh
	jr z,RLE_LastByteFlip


RLE_MoreBytesPart2:
	ld a,c
;	and %11110000
	and %00001111
	or d
	ld d,a

	dec ix
		push af
		ld a,d
		ifndef Vdp9k_Command 
			out (VdpOut_Indirect),a
		else
			out (Vdp9k_Command),a
		endif
		pop af
		;ld (hl),d
		;dec hl
		
		dec b
;		call z,RLE_NextScreenLineHL

	xor a
	ld d,a ;byte for screen

	ld a,ixl
	or ixh
	jr nz,RLE_MoreBytes

RLE_LastByte:
	ld iyl,b
	pop hl
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
	ld a,e
	cpl
	ld e,a
	jp RLE_MoreBytesPart2
RLE_PlainBitmapData:
	;push de
		ld a,(hl)
		rrca
		rrca
		rrca
		rrca
		ld b,0
		ld c,a

		cp 15
		jp nz,RLE_PlainBitmapDataNoExtras
RLE_PlainBitmapDataHasExtras:
		inc hl
		dec iyh
		call z,RLE_SaveState
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
		RLE_PlainBitmapData_More:
		inc hl
		dec iyh
		call z,RLE_SaveState
		ld a,(hl)
		ifndef Vdp9k_Command 
			out (VdpOut_Indirect),a
		else
			out (Vdp9k_Command),a
		endif
		dec iyl
		dec bc
		ld a,b
		or c
		jp nz,RLE_PlainBitmapData_More
	;pop de
	jp RLE_MoreBytesLoop

RLE_OneByteData:
	;push de
		xor a 
		ld b,a
		ld c,a
RLE_OneByteDataExtras:
		inc hl
		dec iyh
		call z,RLE_SaveState
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
		dec iyh
		call z,RLE_SaveState
		ld a,(hl)
		ld (RLE_ThisOneByte_Plus1-1),a
RLE_OneByteData_More:
		ld a,00:RLE_ThisOneByte_Plus1
RLE_OneByteData_More2:
		ifndef Vdp9k_Command 
			out (VdpOut_Indirect),a
		else
			out (Vdp9k_Command),a
		endif
;		dec iyl;Xpos - not needed on V9k
		dec c
		jp nz,RLE_OneByteData_More2
		ld a,b
		or a
		jp z,RLE_MoreBytesLoop
		dec bc
		jp RLE_OneByteData_More
;		ld a,b
;		or c
;		jp nz,RLE_OneByteData_More
	;pop de

RLE_ByteNibbles:
	di
	ld a,c
	exx
	ld b,iyl
	ld c,a
	ld d,ixh
	ld e,ixl
RLE_ByteNibblesMore3:
		ld a,3
RLE_ByteNibblesMore:
		push af
			ld a,c
		ifndef Vdp9k_Command 
			out (VdpOut_Indirect),a
		else
			out (Vdp9k_Command),a
		endif
			dec b;iyl
		pop af					;;;; FIX FIX FIX!
		dec de
		dec de
		cp e
		jp c,RLE_ByteNibblesMore
		ld a,d
		or a
		jp nz,RLE_ByteNibblesMore3
	ld iyl,b
	ld ixh,d
	ld ixl,e
	exx

ret


;VDP_RLEProcessor_HMMC
;	ld hl,00 VDP_RLEHeight_Plus2
;VDP_RLEProcessor_HMMC_NextLine
;	ld bc,00 VDP_RLEWidth_Plus2
;VDP_RLEProcessor_HMMC_NextByte
;
;	ld a,(de)
;	inc de
;	out (VdpOut_Indirect),a
;	dec ixl
;	call z,RLE_SaveState
;
;
;	dec bc
;	ld a,b
;	or c
;	jp nz,VDP_RLEProcessor_HMMC_NextByte
;	dec hl
;	ld a,h
;	or l
;	jp nz,VDP_RLEProcessor_HMMC_NextLine
;ret
VDP_RLEProcessor_NotFirstRun:
	;ex hl,de		;HL=Buffer bc contains bytecount - I'm limiting us to 256!
 ld iyh,c

jp RLE_LoadState

RLE_SaveState:
	di
	ld (RLE_LoadStateSPRestore_Plus2-2),sp
	ld sp,RLE_State
	push af
	push bc
	push de
;	push hl
	push ix
	push iy
	ld (RLE_StatePos_Plus2-2),sp
	ld sp,&0000 :RLE_LoadStateSPRestore_Plus2
	pop hl
	ld (RLE_LoadState_ContinuePoint_Plus2-2),hl
;	ei
ret

RLE_LoadState:
	di
	ld (RLE_LoadStateSPRestoreB_Plus2-2),sp
	ld sp,&0000 :RLE_StatePos_Plus2
	pop de
	ld a,e
	ld iyl,a
	pop ix
;	pop hl
	pop de
	pop bc
	pop af
	ld sp,&0000 :RLE_LoadStateSPRestoreB_Plus2
;	ei
jp &0000 :RLE_LoadState_ContinuePoint_Plus2

Defs 16*2
RLE_State:




