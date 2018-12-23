;org &9000
;jp DoCompressTest
;jp DoRestoreTest

; Header Byte 
; 0xxxxxxx = Repeating copies of next byte (If zero, just ignore this header)
; 1xxxxxxx = Following non repeating bytes (If zero, just ignore this header)
; 255 	   = EOF



;DoCompressTest
;	di
;	ld hl,&C000
;	ld bc,&4000
;
;	ld de,&6000
;	call  SimpleCompress_Compress
;ret
;DoRestoreTest
;	ld de,&C000
;	ld hl,&6000
;	call SimpleCompress_Restore
;ret

StartRestore_Different:
;	and %01111111
;	ld b,a
;StartRestore_DifferentAgain
	ld a,(hl)
	inc hl
	ld (de),a
	inc de
	djnz StartRestore_Different;Again
;jr SimpleCompress_Restore
SimpleCompress_Restore:
	ld a,(hl)
	inc hl

	ld c,a
	and %01111111
	ld b,a
	jr z,SimpleCompress_Restore
	ld a,c

	cp 255
	ret z
	bit 7,a
	jr nz,StartRestore_Different


StartRestore_Same:
;	and %01111111
;	ld b,a
	ld a,(hl)
	inc hl
StartRestore_SameAgain:	
	ld (de),a
	inc de
	djnz StartRestore_SameAgain
jr SimpleCompress_Restore





SimpleCompress_Compress:
	;store the first byte
	ld a,128+1
	ld (de),a

	push de
	pop ix
	inc de

	ld a,(hl)
	ld (de),a
	inc de
	ld iyh,a

	dec bc
	ld a,b
	or c
	jr z,Startscan_Finish

	inc hl
StartScanAgain:
	ld a,(hl)	
	cp iyh
	jr z,Startscan_Matching

Startscan_Different:
push af

	ld a,128
	ld (de),a
	push de
	pop ix
	inc de
;	ld a,iyh
;	ld (de),a
;	inc de
pop af
Startscan_DifferentAgain:
	ld iyh,a

	ld a,(ix)
;	and %01111111
	cp  %11111101
	jr z,StartScanAgain
	inc (ix)


	ld a,iyh
	ld (de),a
	inc de


;	ld a,(hl)
	




	dec bc
	ld a,b
	or c
	jr z,Startscan_Finish


	inc hl
	ld a,(hl)
	cp iyh
	jr z,Startscan_MatchingChange
jr Startscan_DifferentAgain


Startscan_MatchingChange:
	dec (ix)
	dec de
	ld iyh,a
push af
	ld a,1
	jr Startscan_MatchingB
Startscan_Matching:
	ld iyh,a
push af
	xor a;ld a,0
Startscan_MatchingB:
	ld (de),a
	push de
	pop ix
	inc de
pop af
;	ld a,(hl)
	ld (de),a
	inc de
Startscan_MatchingAgain:

	ld a,(ix)
;	and %01111111
	cp  %01111101
	jr z,StartScanAgain
	inc (ix)

	dec bc
	ld a,b
	or c
	jr z,Startscan_Finish

	inc hl
	ld a,(hl)

	cp iyh
	jr nz,Startscan_Different
jr Startscan_MatchingAgain


Startscan_Finish:
	ld a,255
;	inc de
	ld (de),a
ret

