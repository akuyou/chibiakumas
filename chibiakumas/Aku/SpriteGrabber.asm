CompileEP1 equ 1
BuildCPC equ 1
BuildMSXv equ 0
BuildZXSv equ 0
BuildCPCv equ 1
BuildENTv equ 0
	Support64k equ 1  ; enable code only needed by 64k
	Support128k equ 1 ; enable code only needed by 128k+ (keep enabled for 256/512k etc)

buildlang equ ''
read "Core.asm"



Akuyou_BasicSafe equ 1
org &8000
WRITE DIRECT -1,-1,&C0   ; Write into 128k ram to allow basic to use the CORE!
;***************************************************************************************************

;					 Testing Suite

;***************************************************************************************************
jp null 	;4000
jp Test_SpriteTest	;4003
jp null			;2006
jp Test_PrintText	;4009
jp null		;200C
jp RasterColors_Init 	;000F
jp RasterColors_Reset	;0012
jp RasterColors_Disable	;0015
jp DefineSprite		;0018
jp null	;001B Gradiant background

jp ScreenBuffer_Init	;001e Init the double buffer
jp ScreenBuffer_Flip	;0021 Flip the buffer
jp DefineSprite_FromBasic ;0024
jp ShowSprite_FromBasic   ;2027
jp null	  ;202a
jp PLY_BasicSoundEffectInterface_PlaySound ;202D
jp ScreenBuffer_Reset 	  ;2030

jp Sprites_Clear          ;2033
jp Test_SpriteTest	  ;2036
jp DefineSprite_FromBasic2 ;2039
jp ShowSprite_FromBasic   ;203C
jp DefineSprite		  ;203F
	;jp ScreenBuffer_Reset	; Use Mode command instead - Remember 464 cannot do text to 4000
	;jp RasterColors_Basic
jp ZeroAlignSprite	  ;2042
jp TileTest		  ;2045
jp CoreCall		  ;2048 - Jump to a command in the CORE by bankswapping out the firmware!





PLY_BasicSoundEffectInterface_PlaySound:
	ld c,(ix+0)	;Get Pitch
	ld b,(ix+1)
	ld d,(ix+2)	;Get Speed
	ld e,(ix+4)	;Get Note
	ld h,(ix+6)	;Get Volume
	ld l,(ix+8)	;Get SFX number
	ld a,(ix+10)	;Get Channel
	jp Akuyou_Sfx_Play


; Test the disk system








Test_PrintText:	; prints the text in BC

	ld bc,Test_TextString
	call DrawText_PrintString
	ld a,&ef
;	call DrawText_PrintHex
	ret
	Test_TextString: db  "hello worl","d"+&80


; Test The Sprite System

; ************ Sprite Testing Code ***************

Test_SpriteTest:
	;call Init_BootStrap
	ld c,224
	ld b,184
	ld a,0
	ld (SprShow_SprNum),a
Test_SpriteTest_Tile:

		ld a,c
		ld (SprShow_Y),a
		ld a,b

		ld (SprShow_X),a
		push bc
		call Akuyou_ShowSprite
		call Akuyou_ShowSprite
		call Akuyou_ShowSprite
		pop bc	
		ld a,b
		sub 12
		ld b,a

		ld a,b
		cp 11
		jp NC,Test_SpriteTest_Tile

	ld b,184
	ld a,c
	sub 24
	ld c,a
	jp NC,Test_SpriteTest_Tile





	ld b,240
	ld c,20

Test_SpriteTest_Movement:

	ld a,b
	add 0
	ld (SprShow_Y),a
	ld a,40
	ld (SprShow_X),a
	push bc
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	pop bc
	push bc
	ld a,b
	ld (SprShow_X),a
	ld a,40
	ld (SprShow_Y),a
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite
	call Akuyou_ShowSprite

	pop bc
	djnz Test_SpriteTest_Movement

	ret
; ----------------------------------------------
l
; Show Sprite from basic

; ----------------------------------------------
ShowSprite_FromBasic:
;cp 3	; Sprite,Xpos,Ypos

	ld a,(IX+0)
	add 24
	ld (SprShow_Y),a

	ld a,(IX+2)
	add 24
	ld (SprShow_X),a

	ld a,(IX+4)
	ld (SprShow_SprNum),a
	jp Akuyou_ShowSprite




Sprites_Clear:
	;specify no of bytes to leave for header
	; 6 bytes per sprite
	;
	cp 1 
	ret nz

	ld a,(IX+0)
	ld (SprGrab_NextSprite),a
	ld (SprGrab_LastLineA),a
	ld a,(IX+1)
	ld (SprGrab_NextSprite+1),a
	ld (SprGrab_LastLineA+1),a

	ld hl,&0000
	ld(SprGrab_NextIndex),hl
	ld(SprGrab_LineStartA),hl
	;ld hl,&00C8
	;ld(SprGrab_NextSprite),hl



	ld hl,(SprGrab_BankAddr)
	ld (hl),&00
	inc hl
	ld d,h
	ld e,l


	ld hl,(SprGrab_BankAddr)
	ld bc,&4000
	ldir




ret
; ----------------------------------------------

; Sprite Grabber

; ----------------------------------------------


; each sprite needs 4 bytes, so 200 is enough for 50 sprites

SprGrab_LastLineA  : defw &00C8 ; 
SprGrab_LineStartA : defw &0000 ; 
SprGrab_LineCount  : defb &00 ; 
SprGrab_FirstLine  : defb &00 ; 
SprGrab_LastLine   : defb &00 ; 

SprGrab_BankAddr   : defw &4000 ; pattern fill &2F0F
SprGrab_NextIndex  : defw &0000 ; 
SprGrab_NextSprite : defw &00C8 ; need to leave space for indexes


SprGrab_W: defw &06
SprGrab_H: defw &18

SprGrab_X: defw &00
SprGrab_Y: defw &00

SprGrab_TempAddr : defw &00C8 ; 
SprGrab_TempY: defw &00

SprGrab_LineNum: defw &00

DefineSprite_FromBasic2:
; Call &2039,X,Y,W,H,MODE,?
; set W+128 for PSET sprite
; set W+64 for DoubleHeight Intelaced sprite (Must be 24 px wide!)
;MODE=0 YCrop, 128=Fixedy
;Mode=5 = Transp Stripe 1, 4 = Transp Stripe 2


	cp 6	; check A came in with 4 params
	ret nz

	ld a,(IX+0)

	ld a,0
	ld(LineCountStart_Plus1-1),a
	ld (LineCountStartB_Plus1-1),a
	ld a,(IX+2)
	bit 7,a
	jp z,DefineSprite_FromBasic2DefaultMode
	
	ld a,1				;Force all lines to be nonezero
	ld(LineCountStart_Plus1-1),a
	ld (LineCountStartB_Plus1-1),a ;newly added
DefineSprite_FromBasic2DefaultMode:
	ld a,(IX+2)
	and %00000111
	ld (SpriteAlpha_Plus1-1),a
	ld (SpriteAlphaB_Plus1-1),a

	ld a,(IX+4)
	ld (SprGrab_H),a

	ld a,(IX+6)
	ld (SprGrab_W),a

	ld a,(IX+8)
	ld (SprGrab_Y),a

	ld a,(IX+10)
	ld (SprGrab_X),a
	jp DefineSprite	

DefineSprite_FromBasic:
; Call &2024,X,Y,W,H
; set W+128 for PSET sprite
; set W+64 for DoubleHeight Intelaced sprite (Must be 24 px wide!)
	cp 4	; check A came in with 4 params
	ret nz

	ld a,(IX+0)
	ld (SprGrab_H),a

	ld a,(IX+2)
	ld (SprGrab_W),a

	ld a,(IX+4)

	ld (SprGrab_Y),a
	ld a,(IX+6)
	ld (SprGrab_X),a

	xor a

	ld(LineCountStart_Plus1-1),a
	ld (LineCountStartB_Plus1-1),a

	ld (SpriteAlpha_Plus1-1),a
	ld (SpriteAlphaB_Plus1-1),a
DefineSprite: 		; Create a new sprite

	ld bc,(SprGrab_BankAddr)
	ld hl,(SprGrab_NextIndex)

	add hl,bc

	ld a,(SprGrab_H)
	ld (hl),a
	inc hl

	ld a,0:SpriteAlphaB_Plus1
	ld (DefineSprite_XOffset_Plus1-1),a

	ld a,(SprGrab_W)
	and %11000000
	ld a,(SprGrab_W)
	jp z,DefineSprite_Normalsprite
	;sprite is PSET not transparent
	and %11000000
	add 0:SpriteAlpha_Plus1
	ld (DefineSprite_XOffset_Plus1-1),a
	ld a,(SprGrab_W)
	and %00111111
	ld (SprGrab_W),a
DefineSprite_Normalsprite:
	ld (hl),a
	inc hl

	

	ld a,0 		;Y offset
	ld (hl),a
	inc hl
	ld a,0 :DefineSprite_XOffset_Plus1 ;X offset	; Byte 7 = Turbo ;
	ld (hl),a
	inc hl

	ld de,(SprGrab_NextSprite)
	ld (hl),e
	inc hl
	ld (hl),d

	;ld hl,(SprGrab_NextIndex)
	;inc hl
	;inc hl
	;inc hl
	;inc hl
	;ld (SprGrab_NextIndex),hl
	
;ld a,(IX+0)
;ld a,(IX+1)

	
	ld a,0	:LineCountStart_Plus1
	ld (SprGrab_FirstLine),a
	ld (SprGrab_LastLine),a
	ld hl,(SprGrab_NextSprite) ;reread the sprite address
	ld bc,(SprGrab_BankAddr)
	add hl,bc

	ld (SprGrab_LineStartA),hl
	ld (SprGrab_TempAddr),hl ; save the new start address
	
	ld a,(SprGrab_Y)
	ld (SprGrab_TempY),a

	ld a,1
	ld (SprGrab_LineNum),a

	ld a,(SprGrab_H)
	ld b,a	
	ld c,0

DefineSpriteLoop:	
   push bc		;b is the number of lines to read

	ld a,0 :LineCountStartB_Plus1
	ld (SprGrab_LineCount),a
	ld A,(SprGrab_X)		;xpos
	ld B,A
	ld A,(SprGrab_TempY)
	ld C,A				; updated ypos
	call GetMemPos
	ld de,(SprGrab_TempAddr)	; de=destination
	ld a,(SprGrab_W)
	ld c,a
	ld b,0				; bc=bytecount


	push bc ; c is the width
		;ldir ;load inc and repeat (inc hl; dec bc) - read from hl until bc is zero
	DefineSpriteLoop_NextByte:
		ld a,(hl)
		ld (de),a
		or a
		jp z,DefineSpriteLoop_Continue
		ld a,(SprGrab_LineCount)
		inc a
		ld (SprGrab_LineCount),a
	DefineSpriteLoop_Continue:
		inc hl
		inc de
		dec c
		jr nz,DefineSpriteLoop_NextByte
		; end of line reader







	pop bc
	
	ld hl,(SprGrab_TempAddr) ;reread the sprite address

	add hl,bc 		 ; add the width to the address
	ld (SprGrab_TempAddr),hl ; save the new start address


	ld a,(SprGrab_LineCount)
	or a
	jp z,	DefineSpriteLoop_LineZeroMem

		ld a,(SprGrab_FirstLine)
		or a
		jp nz,DefineSpriteLoop_FirstLineAlreadyFound
		; we have found the first line with data

		ld a,(SprGrab_LineNum)
		;ld a,(SprGrab_TempY)
		ld (SprGrab_FirstLine),a

		;decrease the number of lines in the sprite
		;pop bc
		;ld c,a
		;ld a,b

		;sub c
		;ld b,a
		;ld c,0
		
		;push bc


DefineSpriteLoop_FirstLineAlreadyFound:
		; remember the last line that actually has data
		ld hl,(SprGrab_NextSprite)
		;ld hl,(SprGrab_LastLineA)
		add hl,bc 		 ;
		ld (SprGrab_LastLineA),hl 

		ld a,(SprGrab_LineNum)
		;ld a,(SprGrab_TempY)
		;inc a
		ld (SprGrab_LastLine),a
		jp DefineSpriteLoop_LineZeroMemUpdate
DefineSpriteLoop_LineZeroMem:
		ld a,(SprGrab_FirstLine)
		or a
		jp nz,DefineSpriteLoop_LineZeroMemUpdate

		ld hl,(SprGrab_LineStartA)
		ld (SprGrab_TempAddr),hl

		jp DefineSpriteLoop_LineZeroMemSkip


DefineSpriteLoop_LineZeroMemUpdate:
	ld hl,(SprGrab_NextSprite)
	add hl,bc 		 ;
	ld (SprGrab_NextSprite),hl ;

DefineSpriteLoop_LineZeroMemSkip:
	ld a,(SprGrab_TempY)
	inc a
	ld (SprGrab_TempY),a

	ld a,(SprGrab_LineNum)
	inc a
	ld (SprGrab_LineNum),a

	pop bc	; get back the number of lines we want to read
	dec b
	jp nz,DefineSpriteLoop ; dec b and if not zero, loop back

	;remember last line which was used
	ld hl,(SprGrab_LastLineA) ;
	;ld hl,(SprGrab_TempAddr) ;

	ld (SprGrab_NextSprite),hl

	ld a, (SprGrab_FirstLine)
	ld d,a
	dec d
	;ld (SprGrab_FirstLine),a
	;ld d,a

	ld bc,(SprGrab_BankAddr)
	ld hl,(SprGrab_NextIndex)
	add hl,bc


	;ld a,(SprGrab_FirstLine)
	;ld b,a
	ld a,(SprGrab_LastLine)
	;add 1
	sub d

	cp 1
	jp nz,NotOneLine	
	di 
;force saving of empty sprites
	;ex af,af'
	;ld (SprGrab_LineCount),a
	;or a
	;jp nz,NotOneLineDone
	;ex af,af'

	xor a	; we found no pixels!
	ld d,a
	;ei
	;jp NotOneLine
NotOneLineDone:
	;ex af,af'	
	ei
NotOneLine:

	;inc a
	ld (hl),a			;H
	inc hl				;W
	inc hl
	ld (hl),d			
	; sprite pointer is relative so reset and work out its new loc
	ld hl,(SprGrab_NextIndex)
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld (SprGrab_NextIndex),hl

	ret

ZeroAlignSprite:	;Required for tile sprites
	;Init for grabbing Tilesprites
	ld a,(SprGrab_NextSprite)
	or a
	ret z

	ld a,&00
	ld (SprGrab_NextSprite),a

	ld a,(SprGrab_NextSprite+1)
	inc a
	ld (SprGrab_NextSprite+1),a
ret
TileTest:
	ld hl,TileStripData:StripDataPos_Plus2
	push hl
		call TileStripDataEncode
		ld hl,(TileStrip)
		ld (TileBitshiftFrame1_Plus2-2),hl
		ld de,4*Tile_Size
		add hl,de
		ld (TileBitshiftFrame2_Plus2-2),hl

	pop hl
	dec hl;inc hl
	dec hl;inc hl
	ld (StripDataPos_Plus2-2),hl	
	ld c,(hl)
	inc hl
	ld b,(hl)	
	ld a,b
	or c
	jp nz,TileTest_Start	; we've hit the end of our tile array!
	ld hl,TileStripDataEnd
	ld (StripDataPos_Plus2-2),hl

TileTest_Start:
ld c,0
TileTest_More:
push bc
	call TileTest2
pop bc

inc c
ld a,c
cp 16
jp nz,TileTest_More
;call TileTest2
;call TileTest2
;call TileTest2
;call TileTest2
;call TileTest2
;call TileTest2
;call TileTest2
;call TileTest2
;call TileTest2
ret


align 256,0
defw &0000

Tile_Start Equ &4100
Tile_Size Equ 16*8

TileStripData:	; Screen can show 10, but some of an 11th will be shown
		; mid scroll
defw 2*Tile_Size+Tile_Start,1*Tile_Size+Tile_Start,0*Tile_Size+Tile_Start

TileStripDataEnd:	
defw 1*Tile_Size+Tile_Start,&0000


TileStrip:
defw 0,0,0,0,0,0,0,0,0,0,0,0


TileTest2:
	
	push hl
	ld hl,Tile_Start :TileBitshiftFrame1_Plus2
	Bit 0,C
	jp z,TileBankDefault
	ld hl,4*Tile_Size+Tile_Start :TileBitshiftFrame2_Plus2
TileBankDefault:
	ld (TileStrip),hl
	pop hl
	SRL C
;	ld a,&00
;	ld (LastCarry_Plus1-1),a
	;ld a,&00
	ld hl,&C04F+1
	ld b,16;16;200
	push bc
	call TileTestInit
;	pop bc

;	ld de,&50
;	add hl,de
;	push bc
;	call TileTestInit
;	pop bc
;	ld de,&50
;	add hl,de
;	push bc
;	call TileTestInit
	pop bc
	ld b,20
	ld de,&FFEE
	call BackgroundFloodFill
	ld b,20
	di
	exx
	ld ix,&F0F0
	ld iy,&0F0F
	ld de,&0000
	ld hl,&FFFF
call BackgroundFloodFillQuad

;	LD B,100
;	call &8012	; gradient fill

;	ld de,&50
;	add hl,de
;	push bc
;	call TileTestInit
;	pop bc
;	ld de,&50
;	add hl,de
;	push bc
;	call TileTestInit
;	pop bc
	ret
OffsetV1:
	ld de,TileEndSkip1
	ld hl,TileStartSkip4
	jr TileTestDoLineStart
OffsetV2:
	ld de,TileEndSkip2
	ld hl,TileStartSkip3
	jr TileTestDoLineStart
OffsetV3:
	ld de,TileEndSkip3
	ld hl,TileStartSkip2
	jr TileTestDoLineStart
OffsetV4:
	ld de,TileEndSkip4
	ld hl,TileStartSkip1
	jr TileTestDoLineStart
TileNeedCarry:
	ld hl,TileDoLastHalf

	ld de,(FirstActionJump_Plus2-2)
	ld (TileStartCarryReturnPoint_Plus2-2),de
	ld de,TileStartCarry
	ld (FirstActionJump_Plus2-2),de
	jr TileNeedCarryRet
TileTestInit:
	xor a
	ld (LineNo_Plus1-1),a

	ld a,c
	ld (LeftShift_Plus1-1),a
        or a ; only done to clear carry flag
	rra
	push hl
		push af	

			or a
			jr z,OffsetV1
			dec a
			jr z,OffsetV2
			dec a
			jr z,OffsetV3
			dec a
			jr z,OffsetV4

			ld de,TileEndSkip0
			ld hl,TileStartSkip0
TileTestDoLineStart:
			ld (LastActionJump_Plus2-2),de
			ld (FirstActionJump_Plus2-2),hl
		pop af

		ld hl,NoLastCarry
		;ld de,TileStartCarryReturn 
		jr c,TileNeedCarry
TileNeedCarryRet:
		ld (TileDoLastHalfJump_Plus2-2),hl
		;ld (TileFirstCarryJump_Plus2-2),de
	pop hl


TileTestDoLine:

	ld (TileTestSPrestore_Plus2-2),sp
TileTestDoLineAgain:
	di
	ld sp,hl

	exx
	ld (BCRestore_Plus2-2),bc


	ld a,00:LineNo_Plus1
	ld b,a
	add 8
	ld (LineNo_Plus1-1),a



	ld hl,TileStrip
	ld a,(hl)
	add b
	add 0 :LeftShift_Plus1
	ld e,a
	inc l
	ld d,(hl)
	inc l
	ex hl,de
		
;	jp TileStartCarryReturn TileFirstCarryJump_Plus2
	jp TileStartSkip0:FirstActionJump_Plus2
;TileStartCarryReturn


TileStartSkip0:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
TileStartSkip1:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
TileStartSkip2:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
TileStartSkip3:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc

TileStartSkip4:

	ld a,9
TileTestAgain:
	ex hl,de
		ld c,(hl)
		inc l
		ld b,(hl)
		inc l
	ex hl,de
	add hl,bc
TileTestAgainFirst:
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
TileTestDone:
	dec a
	jp nz,TileTestAgain



	ex hl,de
		ld c,(hl)
		inc l
		ld b,(hl)
		inc l
	ex hl,de
	add hl,bc


	jp TileEndSkip0 :LastActionJump_Plus2
TileEndSkip0:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)
	push bc
TileEndSkip1:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)
	push bc
TileEndSkip2:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc
TileEndSkip3:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)

	push bc



TileEndSkip4:
jp TileDoLastHalf :TileDoLastHalfJump_Plus2
TileDoLastHalf:
	pop bc
	dec sp
	ld b,c
	dec l
	ld c,(hl)
	push bc
	jr NoLastCarryDone
NoLastCarry:
	dec l
	ld b,(hl)
	dec l
	ld c,(hl)
	push bc


NoLastCarryDone:

	ld bc,&0000 :BCRestore_Plus2
	exx


ld sp,&0000:TileTestSPrestore_Plus2

;jp LineDouble
LineDoubleReturn:
ei
	call getnxtlin
	dec b
	jp nz,TileTestDoLineAgain
	;ld sp,(TileTestSPrestore_Plus2)
ret

TileStartCarry:
	dec l
	ld b,(hl)
	push bc
	inc sp
jp TileStartCarry	:TileStartCarryReturnPoint_Plus2

LineDouble:
	call getnxtlin
	ld sp,hl
	ld de,&0000

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

ld sp,(TileTestSPrestore_Plus2-2)
jp LineDoubleReturn

align 256,&0
TileStripDataEncode:

	ld de,TileStrip
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

TileStripDataEncodeLoop:
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
	jp nz,TileStripDataEncodeValOK
	;0000 = repeat loop
	ld hl,TileStripData;TileStripData
	ld c,(hl)	; load next tile pointer
	inc hl
	ld b,(hl)
	inc hl
TileStripDataEncodeValOK:
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
	jp nz,TileStripDataEncodeLoop
	
ret



BackgroundFloodFill:
	ld (BackgroundFloodFillDERestore_Plus2-2),de
	ld (FloodFillSpRestore_Plus2-2),sp
BackgroundFloodFillAgain:
	di
	ld sp,hl
	ld de,&0000 :BackgroundFloodFillDERestore_Plus2
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
ld sp,0000 :FloodFillSpRestore_Plus2
call getnxtlin
ei
djnz BackgroundFloodFillAgain

ret


push af
push bc
push de
push hl


BackgroundFloodFillQuad:
	;EXX and DI should be executed before now!
	push ix
	pop af
	ex af,af'
	exx
	ld (BackgroundFloodFillQuadSpRestore_Plus2-2),sp
BackgroundFloodFillQuadAgain:
	di
	ld sp,hl
	exx
	ex af,af'
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
push af
push bc
push de
push hl
	exx
	ex af,af'
	xor a
ld sp,0000 :BackgroundFloodFillQuadSpRestore_Plus2
call getnxtlin
ei
djnz BackgroundFloodFillQuadAgain

ret


TileBit:
ld d,(hl)
dec l
ld e,(hl)
dec l
push de
TileBit1:
ld d,(hl)
dec l
ld e,(hl)
dec l
push de
TileBit2:
ld d,(hl)
dec l
ld e,(hl)
dec l
push de
TileBit3:
ld d,(hl)
dec l
ld e,(hl)
dec l
push de
jp (ix)
nolist



; Bitshifter

BitShifter:
	ld hl,&c000	; Sourcemempos
	ld b,&8		; Bytes


	;SCF	;clear the carry flag
	;CCF
	or a   ; Clear carry flag
	ld e,0	; e remembers the overflow from the last byte X---
	push hl
BitShifterloop:	ld a,(hl)	; load memory
		ld d,a		; backup for later

	      	and &EE		; keep XXX-
		RRA		; shift right -XXX
		or e		; add e X---
	 	ld (hl),a	; put it onscreen

		ld a,d		; restore backup
		and &11		; Keep leftmost ---X

		rla		; Shift Left x3 = X---
		rla
		rla

		ld e,a		; store in E for next byte

		inc hl		; screen byte

		djnz BitShifterloop
		pop hl
		ld a,(hl)
		or e
		ld (hl),a
	ret
AkuyouCore_Disable:
;Restore Basic from Bank 5 to 0
di
	LD BC,&7FC5 ;Gate array port
	OUT (C),c ;Send it

	ld bc,&4000
	ld hl,&4000
	ld de,&0000
	ldir
	LD BC,&7FC0 ;Gate array port
	OUT (C),c ;Send it
ei
ret
AkuyouCore_Enable:
; Backup basic from bank 0 into bank 5
; Load the Akuyou Core from bank 4 into 0
	di
	LD BC,&7FC5 ;Gate array port
	OUT (C),c ;Send it

	ld bc,&4000
	ld de,&4000
	ld hl,&0000
	ldir

	LD BC,&7FC4 ;Gate array port
	OUT (C),c ;Send it

	ld bc,&4000-&45
	ld hl,&4000+&45
	ld de,&0000+&45
	ldir

	LD BC,&7FC0 ;Gate array port
	OUT (C),c ;Send it
	ld bc,&C9FB
	ld (&0038),bc
ret
CoreCall:
	; This allows us to call Core commands from basic for testing and spritegrabbing
	; this is needed now the Core is now in the &50-&3000 area rather than the safe &8000+ area
	; Eg Call CoreCall,0,0,8,32,128,0,SpriteGrabber
	; is the new version of
	; Eg Call SpriteGrabber,0,0,8,32,128,0
push af
	call AkuyouCore_Enable

	ld l,(ix+0)
	inc ix
	ld h,(ix+0)
	inc ix
pop af
	dec a
	call DOCallHL
jp AkuyouCore_Disable
DOCallHL:
	push hl
	ret
;read "BootStrap.asm"

