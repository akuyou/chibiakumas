
Align 256,0
WarpRight:
defb &8,&0,&1,&2,&3,&4,&5,&6
defb &10,&11,&9,&a,&b,&c,&d,&e
defb &18,&19,&1A,&12,&13,&14,&15,&f
defb &20,&21,&22,&23,&1B,&1C,&16,&17
defb &28,&29,&2A,&2B,&24,&1D,&1E,&1f
defb &30,&31,&32,&2C,&2D,&25,&26,&27
defb &38,&39,&33,&34,&35,&36,&2E,&2f
defb &38,&3a,&3b,&3c,&3d,&3e,&3f,&37
StarArrayWarpRandomize:
	ld a,r
	and %01110000
	ret nz
	ld a,r
	and %00001100
	rrca
	rrca
	ld (warpmode_plus1-1),a
ret
StarArrayWarp:
	call StarArrayWarpRandomize
	ld a,1:warpmode_plus1
	inc a
	and %00000011
	ld (warpmode_plus1-1),a
	and %00000001
	jr z,StarArrayWarp2
	jp StarArrayWarp3

	ret
StarArrayWarp2:
	ld de,WarpRight
	jr StarArrayWarpStart
StarArrayWarp3:
	ld de,Warpleft
	jr StarArrayWarpStart
;StarArrayWarp4:
;	ld d,%00001001
;ld a,&3D
;jr z,StarArrayWarpB
;dec a	;convert 3d (dec a) to 3c (inc a)!
;StarArrayWarpB
;ld (WarpActionA_Plus1-1),a
;ld a,r
;and %00001000
;ld a,&3D
;jr z,StarArrayWarpC
;dec a	;convert 3d (dec a) to 3c (inc a)!
;StarArrayWarpC
;ld (WarpActionB_Plus1-1),a


StarArrayWarpStart:
	ld hl,StarArrayPointer
	inc h 
	inc h
	ld a,StarArraySize
	srl a
	ld b,a

	ld a,(warpmode_plus1-1)
	and %00000010
	jr z,StarArrayWarpBegin
	ld a,l
	add &80
	ld l,a
StarArrayWarpBegin:


StarArrayWarpRepeat:
	ld a,(hl)
	and %00111111
	ld e,a
	ld a,(de)
	ld (hl),a
	inc l
;	inc l
djnz StarArrayWarpRepeat
ret


;THIS VERSION IS NOT USED
StarArrayWarpAlt:
StarArrayWarpRepeatB:
	ld a,(hl)
	ld c,a
	sub %00000001 ;dec a WarpActionA_Plus1
	or %00000001
	and %00000111
	ld d,a
	ld a,c
	sub %00001000;dec a WarpActionB_Plus1	
	or  %00001000

	and %00111000
	ld e,a
	ld a,c
	and %11000000
	or e
	or d
	ld (hl),a
	inc l
	inc l
djnz StarArrayWarpRepeatB
ret

Align 256,0
WarpLeft:
defb &1,&2,&3,&4,&5,&6,&7,7
defb &0,&a,&b,&c,&d,&e,&f,&17
defb &8,&9,&13,&14,&15,&16,&1e,&1f
defb &10,&11,&12,&1c,&1d,&25,&26,&27
defb &18,&19,&1a,&1b,&24,&2d,&2e,&3f
defb &20,&21,&22,&23,&2b,&2c,&36,&37
defb &28,&29,&2a,&32,&33,&34,&35,&3f
defb &30,&31,&39,&3a,&3b,&3c,&3d,&3e
