
VDP_bmpProcessor:
	;HL/BC = Filename
	;IX = dest Xpos 
	;IY = dest Ypos 
	ld (VDP_MyHMMC_DX),ix
	ld (VDP_MyHMMC_DY),iy

	xor a
	ld (VDP_NotFirstRunFlag_Plus1-1),a
	ld iy,VDP_bmpProcessorAgain
	jp LoadDiscSectorSpecialMSX

VDP_bmpProcessorAgain:
	di


	
	ld a,0 :VDP_NotFirstRunFlag_Plus1
	or a
	jp nz,VDP_bmpProcessor_NotFirstRun	
	inc a
	ld (VDP_NotFirstRunFlag_Plus1-1),a




	ld a,(hl)	;File format
	inc hl
;	push af
;		ld hl,&0000
;		ld (VDP_MyHMMC_DX),hl
;		ld (VDP_MyHMMC_DY),hl

		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl

	
		ld (VDP_BmpWidth_Plus2-2),de
		ld (VDP_MyHMMC_NX),de

		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl

		ld (VDP_BmpHeight_Plus2-2),de		
		ld (VDP_MyHMMC_NY),de

;	pop af 

	or a
	jr z,VDP_bmpProcessor_BmpNoPalette
;	ex hl,de
		call VDP_SetPalette
;	ex hl,de
VDP_bmpProcessor_BmpNoPalette:


		ld a,(hl)
		inc hl
		ld (VDP_MyHMMCByte),a
		ex hl,de
		ld hl,VDP_MyHMMC
		call VDP_HMMC_Generated

push de
	ld ix,DiskBuffer_End
	ld a,d
	cpl
	ld d,a
	ld a,e
	cpl
	ld e,a
	inc de
	add ix,de
pop de
VDP_bmpProcessor_HMMC:
	ld hl,00 :VDP_BmpHeight_Plus2
VDP_bmpProcessor_HMMC_NextLine:
	ld bc,00 :VDP_BmpWidth_Plus2
VDP_bmpProcessor_HMMC_NextByte:

	ld a,(de)
	inc de
		ifndef Vdp9k_Command 
			out (VdpOut_Indirect),a
		else
			out (Vdp9k_Command),a
		endif
	dec ixl
	jp z,VDP_bmpProcessor_Done


	dec bc
	ld a,b
	or c
	jp nz,VDP_bmpProcessor_HMMC_NextByte
	dec hl
	ld a,h
	or l
	jp nz,VDP_bmpProcessor_HMMC_NextLine
ret
VDP_bmpProcessor_NotFirstRun:
	ex hl,de
 ld ixh,b
 ld ixl,c

ld bc,0000 :VDP_bmpProcessor_BCRestore_Plus2
ld hl,0000 :VDP_bmpProcessor_HLRestore_Plus2
jp VDP_bmpProcessor_HMMC_NextByte

VDP_bmpProcessor_Done:
	ld (VDP_bmpProcessor_BCRestore_Plus2-2),bc
	ld (VDP_bmpProcessor_HLRestore_Plus2-2),HL
ret