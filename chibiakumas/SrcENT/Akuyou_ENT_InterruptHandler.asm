INT_Init:
	im 1
	di
	ld hl,INT_Execute
INT_Define:	;Jump to HL on interrupt
	ld a,&C3
	ld (&38),a
	ld (&38+1),hl

;	ld a,&0C
;	out (&BF),a

	ei
ret

INT_Execute:
	exx 
	pop hl
	ld (InterruptPlusSPRestore_Plus2-2),sp
	ld (InterruptReturn_Plus2-2),hl
	exx
	push de
;	exx
	ld sp,&0000




	push af
	push bc
	push de
	push hl
	push ix
	push iy

	exx
	ex af,af'
		call PLY_Play
		call null :Int_ColorChange_plus2
ifdef BuildENT
	    ld   a,&30			;The enterprise needs this doing, or the interrupt will not clear
	    out  (&b4),a
endif
	ex af,af'
	exx

	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	pop af
	
	ld sp,&0000	:InterruptPlusSPRestore_Plus2
	ei
	jp &0000	:InterruptReturn_Plus2


;	ei
;ret


RasterColors_SetPointers:			; Pass A, a=0 means reset to defaults
	or a					; A=1 means set to custom mem locations
						; but use a custom Frame event handler
	jr nz,RasterColors_SetPointersCustom
RasterColors_SetPointersCustom2:
	ld bc,RasterColors_ColorArray1
;	ld de,RasterColors_ColorArray2
;	ld hl,RasterColors_ColorArray3
;	ld ix,RasterColors_ColorArray4


 
RasterColors_SetPointersCustom:
;	ld (RasterColors_ColorArray1Pointer_Plus2-2),bc
	ld (RasterColors_ColorArray1PointerB_Plus2-2),bc
;	ld (RasterColors_ColorArray2Pointer_Plus2-2),de
;	ld (RasterColors_ColorArray3Pointer_Plus2-2),hl
;	ld (RasterColors_ColorArray4Pointer_Plus2-2),ix
;	ld (RasterColors_PerFrameCallRestore_Plus2-2),iy
ret