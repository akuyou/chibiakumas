ld a,%01000111
ld (ZXFontColor_Plus1-1),a	
call SetKempson

Jp ReconfigureZXDone


	SetKempson:
	ld a,(MultiplayConfig)
	ld hl,&003E	;ld a,0
	or a
	jr z,SetKempsonApply
	ld hl,&78ED 	;in a,(c)
SetKempsonApply:
        ld (KempsonSelfMod_Plus2-2),hl
ret


ReconfigureZXDone: