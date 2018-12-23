; Load V9990 ver in HL, regular ver in DE


ifndef buildMSX_V9K
Background_Gradient:
 
	ld hl,(ScreenBufferMSX_YY)
	ld (VDP_MyHMMV_DY),hl	

	ld hl,&0000
	ld (VDP_MyHMMV_DX),hl
	ld hl,256
	ld (VDP_MyHMMV_NX),hl
Background_GradientAgain:
	ld a,(de)
	inc de
	ld (VDP_MyHMMV_DY),a

	ld a,(de)
	or a
	jr z,Background_GradientFinishUp
	inc de

	ld h,0
	ld l,a
	ld (VDP_MyHMMV_NY),hl

	ld a,(de)
	ld h,a
	inc de
	
	ld a,(Timer_TicksOccured_Plus1-1)


	ld (BusyGradient_TicksOccured_Plus1-1),a
	and h
	jp nz,Background_ShiftNowBasic :Background_ShiftBasicJumpA_Plus2

	ld a,(de)
Background_ShiftNow_return:
	inc de
	ld (VDP_MyHMMV_Byte),a

	ld hl,VDP_MyHMMV

	ld a,(ix+0); Ypos
	inc a;	cp 255
	jr z,VDP_HMMVUseHyper	;if we've finished the memfill gradients, use hyperfill for this

	di
	call BusyGradient
	call VDP_HMMV
	ei
jp Background_GradientAgain

VDP_HMMVUseHyper:
	di
	call VDP_HMMV_Hyper
	ei
jp Background_GradientAgain



; Force the gradient to finish - we've finished the background before the nice gradient

Background_GradientFinishUp:
	ld a,(ix+0); Ypos
	inc a;	cp 255
	ret z
	exx
	call BusyGradient_HyperAgainContinue

jp Background_GradientFinishUp


Background_ShiftNowBasic:
	ld a,(de)
	rrca
	rrca
	rrca
	rrca
	ld (de),a
jp Background_ShiftNow_return


BusyGradient:

	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	bit 0,a
	ret z
di
exx
BusyGradient_HyperAgainContinue:
ld hl,&0000 :BusyGradientHLRestore_Plus2

		

	ld a,iyl
	or a
;	jr z,BusyGradient_HyperDone
	jr nz,BusyGradient_HyperAgain

BusyGradient_HyperDone:



	ld a,(ix+0); Ypos
	ld b,a
	inc a;	cp 255
	jp z,BusyGradient_HyperDonePause
	inc ix



	xor a
	ld c,a

	ld a,(VDP_Tile_MyHMMM_DY+1)	;Get screenbuffer
	rra
	rr b
	rr c

	      rlc     b
              rla
              rlc     b
              rla
              srl     b
              srl     b
              out     (VdpOut_Control),a       ;set bits 15-17
              ld      a,14+128
              out     (VdpOut_Control),a
              ld      a,c           ;set bits 0-7
              out     (VdpOut_Control),a
              ld      a,b           ;set bits 8-14
              or      64            ; 64= write access 0=read
              out     (VdpOut_Control),a 

	ld iyl,32
	ld h,(ix+0)
	ld l,(ix+1)

;	call VDP_DoWait

	ld a,(Timer_TicksOccured_Plus1-1)
	and (ix+2)
	

	call nz,BusyGradient_HyperShift	:HyperDirection_Plus2
	
BusyGradient_HyperAgain:

	ld a,h
	ld b,8
	ld c,VdpIn_Data
BusyGradient_Hyperb:
	di
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
nop
	out(VdpIn_Data),a
	out (c),l;	out(VdpIn_Data),a
	djnz,BusyGradient_Hyperb	;carry on with the fill job



	ld a,l
	ld l,h
	ld h,a

	dec iyl
	jr z,BusyGradient_HyperDoneNext;Pause
	ld a,iyl
	and %00000011
	jp nz,BusyGradient_HyperAgainB
	inc ix
	inc ix
	inc ix	
	ld h,(ix+0)
	ld l,(ix+1)

	ld a,0:BusyGradient_TicksOccured_Plus1
	and (ix+2)
	call nz,BusyGradient_HyperShift 	:HyperDirectionB_Plus2

BusyGradient_HyperAgainB:
	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	bit 0,a
	jr nz,BusyGradient_HyperAgain ;finished waiting
	ld (BusyGradientHLRestore_Plus2-2),hl
	exx
	ei
ret
BusyGradient_HyperDoneNext:
	inc ix
	inc ix
	inc ix	
jp BusyGradient_HyperDone

BusyGradient_HyperDonePause:
exx
ei
jp VDP_DoWait





BusyGradient_HyperShiftRight:	

		ld a,h
		and %00001111 ;and %11110000
		rlca;rrca
		rlca;rrca
		rlca;rrca
		rlca;rrca
		push af
		

			ld a,h
			and %11110000;and %00001111
			ld h,a 

			rr l;rl l
			rr h;rl h

			rr l;rl l
			rr h;rl h

			rr l;rl l
			rr h;rl h

			rr l;rl l
			rr h;rl h
		pop af
		or l
		ld l,a
	ld (ix+0),h
	ld (ix+1),l
ret


BusyGradient_HyperShift:	
		ld a,h
		and %11110000
		rrca
		rrca
		rrca
		rrca
		push af
		

			ld a,h
			and %00001111
			ld h,a 

			rl l
			rl h

			rl l
			rl h

			rl l
			rl h

			rl l
			rl h
		pop af
		or l
		ld l,a
	ld (ix+0),h
	ld (ix+1),l
ret
endif










;;;;;;;;;;;;;;;;;;V990 ver ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildMSX_V9K
Background_Gradient:


;	in a,(Vdp9k_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
;	bit 0,a
;	jr nz,Background_Gradient




	di

	ld de,(ScreenBufferMSX_YY)
	ld (VDP_MyHMMC_DY),de
	LD (VDP_MyHMMM_DY),de

	

	ld a,(hl)				;Load up the first two bytes
	ld ixl,a
	inc hl
	ld a,(hl)
	ld ixh,a
	inc hl

	ld a,(hl)				;Load up the first two bytes
	ld iyl,a
	inc hl
	ld a,(hl)
	ld iyh,a
	inc hl

	
	exx
		ld b,ixh
		ld c,ixl
		ld d,iyh
		ld e,iyl
	exx


;	call VDP_STOP
;	call Monitor



;	ld (Background_LastLine),a

;	push hl
;	pop iy

	ld a,(hl)
	dec a
	ld (ScrollNextLineChange),a
	inc hl


	ex hl,de



	ld hl,&0000
	ld (VDP_MyHMMC_DX),hl
	ld hl,4
	ld (VDP_MyHMMC_NX),hl
	ld h,0
	ld l,b
	ld (VDP_MyHMMC_NY),hl
	ld (VDP_MyHMMM_NY),hl

;	ld a,ixh


	push bc
		ld hl,VDP_MyHMMC
		exx
		ld a,b
		ld (VDP_MyHMMCByte),a
		exx
;		call VDP_STOP
		;di
		call VDP_HMMC_Generated_BusyCheck
		;ei; this doesn't look right!
	pop bc

	exx
	jr Gradient_MoreBytesHMMCb
Gradient_MoreBytesHMMC:
	exx
;	ld a,ixh
		ld a,b
		out (Vdp_SendByteData),a
Gradient_MoreBytesHMMCb:
;	ld a,ixl
		ld a,c
		out (Vdp_SendByteData),a
		;out (VdpOut_Indirect),a
;		out (VdpOut_Indirect),a
;	dec b
;	ld a,iyh
		ld a,d
		out (Vdp_SendByteData),a
;	ld a,iyl
		ld a,e
		out (Vdp_SendByteData),a
;		out (VdpOut_Indirect),a
;		out (VdpOut_Indirect),a
	exx
	dec b

	ld a,128		:ScrollNextLineChange_Plus1
	cp b			; b is lineno
	jp nz, Background_NotNextLine 	;jp is faster when true



;	ld a,&FF	Background_LastLine_Plus1
;	ld c,a
;	or a
;	jp z,Background_NoShift
	ld a,(Timer_TicksOccured_Plus1-1)
	ld c,a
	ld a,%11111111  :ScrollPosRate1_Plus1		; Scroll rate for 'ground'
	nop
	nop:GradientSlowdown_Plus2
	and c
	jp nz,Background_ShiftNow :Background_ShiftJumpA_Plus2






Background_NoShift:		; No shift

	exx
		ld b,d
		ld c,e
	exx

	;push iy
	;pop ix


	ex hl,de
;	ld a,(hl)				;Load up the first two bytes
;	ld ixl,a
;	inc hl
;	ld a,(hl)
;	ld ixh,a
;	inc hl

	ld a,(hl)				;Load up the first two bytes
	ld iyl,a
	inc hl
	ld a,(hl)
	ld iyh,a
	inc hl
	exx
		ld d,iyh
		ld e,iyl
	exx


;	call VDP_STOP
;	call Monitor



;	ld (Background_LastLine),a
;	inc hl
;	push hl
;	pop iy

	ld a,(hl)

	inc hl
	ld (ScrollPosRate1_Plus1-1),a


	ld a,(hl)
	dec a
	ld (ScrollNextLineChange),a
	inc hl


	ex hl,de



Background_NotNextLine:
	djnz Gradient_MoreBytesHMMC


;	call VDP_STOP
;	call Monitor


	;V9990 doesn't seem to work if we only copy a 4 pixel block, so we up it to 16 pixels, then do a ldir copy to fill it over the entire screen area!
	ld hl,&0000
	LD (VDP_MyHMMM_SX),hl
	ld hl,(ScreenBufferMSX_YY)
	LD (VDP_MyHMMM_SY),hl

	ld hl,4
	LD (VDP_MyHMMM_DX),hl
	ld (VDP_MyHMMM_NX),hl	

	ld hl,VDP_MyHMMM
	di
	call VDP_HMMM_BusyCheck
	ei

;	ld hl,8
;	LD (VDP_MyHMMM_DX),hl
;	ld (VDP_MyHMMM_NX),hl	


;	ld hl,VDP_MyHMMM
;	di
;	call VDP_HMMM_BusyCheck
;	ei


	ld hl,8
	LD (VDP_MyHMMM_DX),hl
	ld hl,256-8
	ld (VDP_MyHMMM_NX),hl	

	ld hl,VDP_MyHMMM
	di
	call VDP_HMMM_BusyCheck
	ei
ret




	

;SetNewRate
	;These variables are held direct in the code
;	ld a,100
;	ld (ScrollPos),a
;	ld a,%11111111
;	ld (ScrollPosRate1),a
;	ld a,%00000100
;	ld (ScrollPosRate2),a
Background_LeftScroll:			; Alternate scroll routine for Right->Left
	ld a,c
	and &0F		; Keep leftmost X---
	rlca
	rlca
	rlca
	rlca
	ld e,a
	ld a,c		; backup for later
      	and &F0		; keep -XXX
	rrca
	rrca
	rrca
	rrca
	or e		; add e ---X
	ld (IY+0),a
jp Background_NoShift
Background_ShiftNow:

	ex hl,de
		push iy
		pop de
		ld a,d
		and %11110000

		rrca
		rrca
		rrca
		rrca
		push af
		

			ld a,d
			and %00001111
			ld d,a 

			rl e
			rl d

			rl e
			rl d

			rl e
			rl d

			rl e
			rl d
		pop af
		or e
		ld e,a

		dec hl
		dec hl
		dec hl
		dec hl
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		inc hl
		inc hl
	ex hl,de
jp Background_NoShift
Background_ShiftNowRight:

	ex hl,de
		push iy
		pop de
		ld a,d
		and %00001111

		rlca;rrca
		rlca;rrca
		rlca;rrca
		rlca;rrca
		push af
		

			ld a,d
			and %11110000
			ld d,a 

			rr e;rl e
			rr d;rl d

			rr e;rl e
			rr d;rl d

			rr e;rl e
			rr d;rl d

			rr e;rl e
			rr d;rl d
		pop af
		or e
		ld e,a

		dec hl
		dec hl
		dec hl
		dec hl
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		inc hl
		inc hl
	ex hl,de
jp Background_NoShift
ScrollNextLineChange 	equ ScrollNextLineChange_Plus1-1
endif



Background_GradientScroll:
ifdef buildMSX_V9K
		ld hl,Background_ShiftNow
		or a
		jr z,Background_GradientScrollApply	
	
		ld hl,Background_ShiftNowRight
	
		cp 1
		jr z,Background_GradientScrollApply
		;0=left 1=right ;2=static
		ld hl,null
	Background_GradientScrollApply:
		ld (Background_ShiftJumpA_Plus2-2),hl
else


		ld hl,BusyGradient_HyperShift
		or a
		jr z,Background_GradientScrollApply	
	
		ld hl,BusyGradient_HyperShiftRight
	
		cp 1
		jr z,Background_GradientScrollApply
		;0=left 1=right ;2=static
		ld hl,null
	Background_GradientScrollApply:
		ld (HyperDirection_Plus2-2),hl
		ld (HyperDirectionB_Plus2-2),hl
endif

ret