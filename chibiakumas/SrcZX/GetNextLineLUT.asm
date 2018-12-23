write "..\BldZX\spectest.bin"
;StackPointerAlt equ &8181


SprShow_X equ SprShow_X_Plus1-1
SprShow_Y equ SprShow_Y_Plus1-1
SprShow_BankAddr equ SprShow_BankAddr_Plus2-2   ; 
SprShow_SprNum equ SprShow_SprNum_Plus1-1

SprShow_W equ SprShow_W_Plus1-1

SprShow_Xoff equ SprShow_Xoff_Plus1-1
SprShow_Yoff equ SprShow_Yoff_Plus1-1


SprShow_TempX equ ScreenBuffer_ActiveScreenDirectC_Plus1-2
SprShow_TempY equ SprShow_TempY_Plus2-2
SprShow_TempW equ SprShow_TempW_Plus1-1
SprShow_TempH equ SprShow_TempH_Plus1-1
SprShow_OldX equ SprShow_OldX_Plus1-1



VScreen_MinY equ 32
VScreen_MinX equ 40

VScreen_MaxY equ 224
VScreen_MaxX equ 168



;checksum reset
;defb "PLUS3DOS"
;StackPointerAlt equ &8500 ;need a stackpointer below &C000
;
;defb &1a
;defb &01
;defb &00
;defw EOF-SOF+128,&0000	;LOF
;
;defb &03	     ;basic header
;defw EOF-SOF
;defb &00,&80,&00,&80 ; Basic Header
;
;; all zeros
;defb &00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00
;defb checksum("")

org &8000
SOF:
di

call ScreenBuffer_Init

ld sp,&A000
ld a,7
call Bankswapper_ZXBank_SetCurrent
ld (out7ffdBak),a

SpriteTest:



	;ld sp,StackPointerAlt	; DO THIS FIRST!

	ld hl,&C000
	ld de,&4000
	ld BC,&1B08;FF0
	;call Bankswapper_Swap
	;call Bankswapper_FastCopy
	;HL=Source Pos
	;DE=Dest Post
	;IXL= Source Bank
	;IXH= Dest Bank
	;BC= ByteCount

	call Timer_UpdateTimer
;	call Akuyou_ScreenBuffer_GetActiveScreen
	ld hl,&401F ;&4F+1 ; Had to remove 1 for Speccy layout!
	ld a,(ScreeBuffer_Plus1-1)
	or h
	ld h,a


	ld de,NewGradient
	ld b,192
	ld c,%11111111
	call Background_Gradient

	ld de,BackgroundColorMap
	call BackgroundColor


di
ld a,40+80	:MyX_Plus1
ld (SprShow_X),a
ld a,&60		:MyY_Plus1
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite


di

	call KeyboardScanner_Read
	call Player_ReadControls
;	di
;	halt
	ld a,ixl
	bit Keymap_U,a
	jp nz,SpriteTest2
	ld a,(MyY_Plus1-1)
	dec a
	ld (MyY_Plus1-1),a
SpriteTest2:
	ld a,ixl
	bit Keymap_D,a
	jp nz,SpriteTest3
	ld a,(MyY_Plus1-1)
	inc a
	ld (MyY_Plus1-1),a
SpriteTest3:
	ld a,ixl
	bit Keymap_L,a
	jp nz,SpriteTest4
	ld a,(MyX_Plus1-1)
	dec a
	ld (MyX_Plus1-1),a
SpriteTest4:
	ld a,ixl
	bit Keymap_R,a
	jp nz,SpriteTest5
	ld a,(MyX_Plus1-1)
	inc a
	ld (MyX_Plus1-1),a
SpriteTest5:


call ScreenBuffer_Flip

jp SpriteTest



;ld a,20-4
;ld (SprShow_X),a
;ld a,32-3
;ld (SprShow_Y),a
;ld a,1
;ld (SprShow_SprNum),a
;call ShowSprite

;di
;ret

di
halt

di
ld a,40-4
ld (SprShow_X),a
ld a,32-2
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite


di
ld a,80-4
ld (SprShow_X),a
ld a,32-10
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite


di
ld a,120-4
ld (SprShow_X),a
ld a,32-1
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite



di
ld a,40-4+2
ld (SprShow_X),a
ld a,100
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite




di
ld a,40-8+2
ld (SprShow_X),a
ld a,150
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite



di
ld a,40-12+2
ld (SprShow_X),a
ld a,180
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite



;ld a,40
;ld (SprShow_X),a
;ld a,32
;ld (SprShow_Y),a
;ld a,2
;ld (SprShow_SprNum),a
;call ShowSprite

ld a,40+80
ld (SprShow_X),a
ld a,64
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite

ld a,40+4+80
ld (SprShow_X),a
ld a,96
ld (SprShow_Y),a
ld a,1
ld (SprShow_SprNum),a
call ShowSprite



ld a,168-16+4
ld (SprShow_X),a
ld a,224-32+8
ld (SprShow_Y),a

ld a,1
ld (SprShow_SprNum),a
call ShowSprite




ld a,40-4
ld (SprShow_X),a
ld a,224-32+8
ld (SprShow_Y),a

ld a,1
ld (SprShow_SprNum),a
call ShowSprite




;halt
ret
	
BackgroundColor:
	di
	ld (BackgroundColorSPrestore_Plus2-2),sp
	ld sp,32*24
	ld hl,&5800
	ld a,(ScreeBuffer_Plus1-1)
	or h
	ld h,a
	add hl,sp
	ld sp,hl
;	di
;	halt
	ld h,24


BackgroundColorAgain:
	ld a,(de)
	inc de
	ld b,a
	ld c,a

	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc

	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc
	push bc

	dec h
	jp nz,BackgroundColorAgain
	ld sp,&0000 :BackgroundColorSPrestore_Plus2
	ei
ret
	
NewGradient:
gradstart equ 192

defb %11111111,%11111111	;1; first line
defb gradstart-6, %11101110	;4
defb gradstart-12,%01010101	;5
defb gradstart-18,%10100010	;6
defb gradstart-24,%01000100	;7
defb gradstart-30,&00
defb gradstart-36,&00
defb 48,0
defb 44,%01000100	;16
defb 40,%10100010	;17
defb 36,%01010101	;18
defb 32,%11101110	;19
defb 28,%11111111;&0F	;20
defb 24,%11111111	;15
defb 20,%11101110	;15
defb 16,%01010101	;16
defb 12,%10100010	;17
defb 08,%01000100	;19
defb 04	,0	;20
defb 02	,0	;20
defb 255




BackgroundColorMap:
defb 2*8+1
defb 2*8+1
defb 2*8+1
defb 1
defb 1
defb 1
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb %00000111
defb 4
defb 4
defb 4
defb 4
defb 4
defb 4
defb 4


















align 256
TranspColors:	; Transparent colors are used by the sprite, if the byte matches it is skipped to effect transparency without an 'alpha map'
defb &00,&F0,&0F,&FF,%10101010,%01010101

;***************************************************************************************************
; Virtual Screen pos

	; Input 	B=VitrualX ;C=VirtualY

	; output 	B=ScreenByteX ;C=ScreenY	Y=255 if ofscreen
	;		H X bytes to skip	L	X bytes to remove
	;		D Y lines to skip	E	Y lines to remove
;***************************************************************************************************


; The virtual screen has a resolution of 160x200, with a 24 pixel border, which is used for clipping
; Y=0 is used by the code to denote a 'dead' object which will be deleted from the list
VirtualPosToScreenByte:


	ld HL,&0000
	ld D,h
	ld e,h

	; we use a virtual screen size
	; X width is 208	(160 onscreen - 2 per byte)
	; Y height is  248	(200 onscreen - 1 per line)

	; this is to allow for partially onscreen sprites	
	; and to keep co-ords in 1 byte
	; X<24 or x>=184 is not drawn
	; Y<24 or Y>=224 is not drawn
	;
	; only works with 24 pixel sprites
	ld a,B	;Check X
	cp VScreen_MinX 
	jp NC,VirtualPos_1	; jp is faster if we expect it to be true!
; X<24
	ld a,VScreen_MinX
	sub a,B

	RRA
	SRL A	; Extra for spectrum screen

	ld H,A	;move the sprite A left
	ld L,A	;need to plot A less bytes

	ld B,VScreen_MinX 	 ;B was offscreen, so move it back on
	jp VirtualPos_2
VirtualPos_1:
	;ld a,B	;Check X
	cp VScreen_MaxX -12 :SpriteSizeConfig184less12_Plus1
	jp C,VirtualPos_2
; X>184
	;push B
	ld a,B
	sub VScreen_MaxX -12 :SpriteSizeConfig184less12B_Plus1

	RRA	; Extra for spectrum screen
	SRL A	; Extra for spectrum screen

;	pop B

	add L	;	X pos is ok, but plot A less bytes
	ld L,A
	;ld a,B	;Check X
VirtualPos_2:
	ld a,B	;Check X
	sub VScreen_MinX  ;SpriteSizeConfig24C_Plus1
	RRA	; halve the result, as we have 80 bytes, but 160 x co-ords
	SRL A	; Extra for spectrum screen
	ld B,a	
;-------------------------------------------------------------------------
	ld a,C	;Check Y
	cp VScreen_MinY  ;SpriteSizeConfig24D_Plus1
	jp NC,VirtualPos_3
; Y<24
	ld a,VScreen_MinY  ;SpriteSizeConfig24E_Plus1
	sub a,C
	ld D,A	;move the sprite A up
	ld E,A	;need to plot A less lines
	ld C,VScreen_MinY  ;SpriteSizeConfig24F_Plus1
	jp VirtualPos_4
VirtualPos_3:
	;ld a,C	;Check Y
	cp VScreen_MaxY -24 :SpriteSizeConfig224less24_Plus1
	jp C,VirtualPos_4
; Y>224
	ld a,C
	sub VScreen_MaxY -24 :SpriteSizeConfig224less24B_Plus1
	ld E,A
VirtualPos_4:
	ld a,C	;Check Y
	sub VScreen_MinY  ;SpriteSizeConfig24G_Plus1
	ld C,a
	ret	

;***************************************************************************************************

; 					Show Sprite

;***************************************************************************************************
;SpritePointerInit	; We have two sprite pointers, one for player sprites (which actually never moves!) and one for level sprites
			; Note.. the second bank of sprites (128k only) is always located in &D000 in memory config C1/C3
;	ld (ObjectSpritePointer_Plus2-2),hl
;	ld (PlayerSpritePointer_Plus2-2),de


;SprShow_TempW defw &00


SprShow_TempAddr equ SprShow_TempAddr_Plus2-2 ; defw &0000


SpriteCache: defs 1024

;SprShow_Address  defw &0000


; We can preread a sprite to get the width/height
; This is used for Direct sprites, and was used by the object loop - the object loop now assumes the sprite is 24x24, this was done to save time as 97% of the time - it is
ShowSprite_ReadInfo:
ld a,&0 :SprShow_SprNum_Plus1
	ld c,a
	
	ld b,0
        or a ; only done to clear carry flag
	rl b
	rl c

	ld hl,SpriteMemory :SprShow_BankAddr_Plus2
	ld d,h
	ld e,l
	add hl,bc
	add hl,bc	; 6 bytes per sprite
	add hl,bc

;	add hl,bc
;	add hl,bc
;	add hl,bc

	ld a,(hl)
;	ld (SprShow_H),a
;	ld a,&18 SprShow_H_Plus1		;(Sprite Height)
	or a
	jr z,SpriteGiveUp
	ld (SprShow_TempH),a
;	ld (SprShow_H_Plus1-1),a
	inc hl

	ld a,(hl)
	ld (SprShow_TempW),a
	ld (SprShow_W),a
	ld b,a

	inc hl
	ld a,(hl)
	ld (SprShow_Yoff),a
	inc hl

	ld a,(hl)
	ld (SprShow_Xoff),a		; Note Xoffset is never actually used for x-coords
					; the mem pos is actually sprite attribs
					; such as PSet, Doubleheight and trans color
	inc hl
	;leave with Sprbankaddr in DE 
	;Width in B and Xoff in A
	



ret
SpriteGiveUp:
	pop af ;Forcably quit not just getting info - but showing the sprite
ret
;ShowSpriteDirect is a cruder version of ShowSprite, it does not use the 'virtual' screen res of (160x200) and cannot do clipping - it was designed for the UI objects 
;which never moved and never needed clipping 
ShowSpriteDirect:
	;ld hl,SprDrawChooseRender;pset
	;ld (ShowSprite_Ready_Return_Plus2-2),hl
	;set draw pos into Temp_X and Temp_Y
	call ShowSprite_ReadInfo
	

	ld c,(hl)
	inc hl
	ld b,(hl)
	

	ex de,hl
	add hl,bc
	ld (SprShow_TempAddr),hl
	ex de,hl



	


	;loald (SprShow_TempX),a



	
;		ld A,B
		
		ld a,(SprShow_Yoff)
		ld c,a
		ld a,(SprShow_TempY)
		add c
		ld (SprShow_TempY),A


	;Quick shortcuts for fonts
	ld a,(SprShow_TempW)
	ld (SprShow_W),a
	dec a
	jr z,ShowSpriteDirectOneByteSpecial
	dec a
	jp z,ShowSpriteDirectTwoByteSpecial
	dec a
	dec a
	jr z,ShowSpriteDirectFourByteSpecial

	xor a
	ld (TranspBitA_Plus1-1),a

	ld hl,SprDrawChooseRender;pset	
	ld a,(SprShow_Xoff_Plus1-1)
	bit 7,a
	jp z,ShowSprite_OK_Xoff2
	ld hl,SprDrawChooseRenderpset


	ShowSprite_OK_Xoff2:

	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready

ShowSpriteDirectFourByteSpecial:
	ld (TranspBitA_Plus1-1),a
;	ld (SprShow_Xoff),a
	ld hl,SprDraw16pxInit
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready
ShowSpriteDirectTwoByteSpecial:
	;shortcut for our minifont!
;	ld (SprShow_Xoff),a
	ld hl, SprDrawPset8pxInit
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready

ShowSpriteDirectOneByteSpecial:
	;shortcut for our minifont!
;	ld (SprShow_Xoff),a
	ld hl, SprDrawLnStartBegin
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready


ShowSpriteReconfigureEnableDisable:
	ld hl,null
	or a
	jr z,ShowSpriteReconfigureEnableDisableB
	ld hl,ShowSpriteReconfigure	
ShowSpriteReconfigureEnableDisableB:
	ld (ShowSpriteReconfigureCommand_Plus2-2),hl
	jr ShowSpriteReconfigure_24px
ShowSpriteReconfigure:
	ld (SpriteSizeConfig6_Plus1-1),a

	;Akuyou was designed for 24x24 sprites, but this module can 'reconfigure' it for other sizes
	cp 3;6 ;24px
	jp z,ShowSpriteReconfigure_24px
	cp 4;8 ;32px
	jp z,ShowSpriteReconfigure_32px
	cp 6;12 ;32px
	jp z,ShowSpriteReconfigure_48px
	cp 8;16 ;64px
	jr z,ShowSpriteReconfigure_64px
	cp 10;20 ;80px
	jr z,ShowSpriteReconfigure_80px
	cp 12;24 ;96px
	jr z,ShowSpriteReconfigure_96px
	cp 16;32 ;128px
	jr z,ShowSpriteReconfigure_128px
	cp 1;2 ;8px
	jr z,ShowSpriteReconfigure_8px
	cp 2;4 ;16px
	jr z,ShowSpriteReconfigure_16px
ret

ShowSpriteReconfigure_128px:			;Not actually used!
	ld a,VScreen_MaxX-64
	ld b,VScreen_MaxY-24;	ld b,224-128
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_104px:			;Not actually used!
	ld a,VScreen_MaxX-52
	ld b,VScreen_MaxY-96
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_96px:			;Used by Boss 1
	ld a,VScreen_MaxX-48
	ld b,VScreen_MaxY-24;	ld b,224-96
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_80px:			;Not actually used!
	ld a,VScreen_MaxX-40
	ld b,VScreen_MaxY-80
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_48px:
	ld a,VScreen_MaxX-24
	ld b,VScreen_MaxY-48
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_32px:
	ld a,VScreen_MaxX-16
	ld b,VScreen_MaxY-32
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_64px:			;not actually used
	ld a,VScreen_MaxX-32
	ld b,VScreen_MaxY-64
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_16px:
	ld a,VScreen_MaxX-8
	ld b,VScreen_MaxY-16
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_8px:
	ld a,VScreen_MaxX-4
	ld b,VScreen_MaxY-8
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_24px:
	ld a,VScreen_MaxX-12
	ld b,VScreen_MaxY-24

ShowSpriteReconfigure_all:

;	ld a,c
	;Right X
	ld (SpriteSizeConfig184less12_Plus1-1),a
	ld (SpriteSizeConfig184less12B_Plus1-1),a
	ld a,B
	;Bottom Y
	ld (SpriteSizeConfig224less24_Plus1-1),a
	ld (SpriteSizeConfig224less24B_Plus1-1),a
ret
GetSpriteXY
	ld a,(SprShow_X)
	ld b,a
	ld a,(SprShow_Y)
 	ld c,a
ret


ShowSprite:	
; ShowSprite is the main routine of our program!
	
	;ld hl,SprDrawChooseRender;pset
	;ld (ShowSprite_Ready_Return_Plus2-2),hl


 		; *********  Get Sprite Details *********
	call ShowSprite_ReadInfo
	di

	ex af,af'
	ld a,b
	cp 6 :SpriteSizeConfig6_Plus1
	call  nz,ShowSpriteReconfigure	:ShowSpriteReconfigureCommand_Plus2
;	cp %11000000			; see if our sprite is in bank C000+
;	jp c,ShowSpriteDirectRam
ShowSpriteCacheRam:
	ld a,(hl)
	ld ixl,a
	inc hl
	ld a,(hl)
	ld ixh,a



	ld bc,&0005
	add hl,bc
	ld a,(hl)
	ld iyl,a
	inc hl	
	ld a,(hl)
	ld iyh,a

	ex hl,de
		ld a,ixl
		cpl
		ld e,a
		ld a,ixh
		cpl
		ld d,a
		inc de
		add iy,de
		
		;need to round up to nearest 16 for fastcopy
		ld de,15
		add iy,de
;	ex hl,de


;	di
;	halt



	ex de,hl
	add ix,de
;	ld (SprShow_TempAddr),hl
	push ix
	pop hl

	ld de,SpriteCache
	ld (SprShow_TempAddr),de
	ld b,iyh
	ld a,iyl
	and %11110000
	ld c,a

	di
	call Bankswapper_FastCopy
;	di 
;	halt
;	ldir
	jp ShowSpriteReady
ShowSpriteDirectRam:

	ld c,(hl)
	inc hl
	ld b,(hl)


	ex de,hl
	add hl,bc
	ld (SprShow_TempAddr),hl
;	ex de,hl
ShowSpriteReady:

	ld bc,TranspColors
	ex af,af'
	;ld a,(SprShow_Xoff) - we are relying on this still being in A 
	and %00000111
	add c
	ld c,a
	ld a,(bc)
	ld (TranspBitA_Plus1-1),a

;	ld a,(SprShow_Y)
;	or a
;	ret Z


 		; *********  show a new sprite *********


ShowSprite_OK:

	;ld (SprShow_Y),a
;	ld C,a				; load C for the Screen lookup

	ld a,48: SprShow_Yoff_Plus1
	add 48:SprShow_Y_Plus1
	ld C,a



	;ld (SprShow_TempY),a


	ld B,48 :SprShow_X_Plus1

;	ld B,a				; load B for the Screen lookup

	ld a,48: SprShow_Xoff_Plus1


	bit 6,a
	jp z,ShowSprite_OK_NoDoubler
	ld hl,SprDrawChooseRenderLineDoubler ; Doubler gives an interlacing effect, used for faux big sprites without slowdown
	
	bit 7,a
	jp z,ShowSprite_OK_Xoff
	ld hl,SprDrawChooseRenderLineDoublerPset  ;Double height with Pset (no transparency - much faster)

	jp ShowSprite_OK_Xoff
ShowSprite_OK_NoDoubler:			
	;push hl
	ld hl,SprDrawChooseRender;pset		; Normal sprite	
	bit 7,a
	jp z,ShowSprite_OK_Xoff

;	ld hl,SprDrawChooseRenderPsetAligned - Tested code - incomplete
	ld hl,SprDrawChooseRenderpset		; PSET sprite - deletes background, fast no transp


ShowSprite_OK_Xoff:
	and %00000000 ; Bit 7 forces "pset" - wipes background but faster ; Bit 6 doubles height ;123=transp
	add B
	ld B,a
	
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	;pop hl
	

;	ex af,af'	;	push af 			;store width for later


		call VirtualPosToScreenByte
		;		H X bytes to skip	L	X bytes to remove
		;		D Y bytes to skip	E	Y bytes to remove

		ld a,d
		ld (SpeccyColor_FrontLinesToSkip_Plus1-1),a

		;pixel data we need to skip
		ld a,e
		sub d
		ld (SpeccyColor_EndLinesToSkip_Plus1-1),a



		ld A,B
		ld (SprShow_TempX),A
		ld A,C
		ld (SprShow_TempY),A

		ld a,h
		or l
		or d			; if all are zero, do nothing
		or e
		jp Z,ShowSprite_SkipChanges

	ifdef Debug
		call Debug_NeedEXX
	endif
		exx;push hl
			ld hl,SprDrawLnStartBegin
			ld (ShowSprite_Ready_Return_Plus2-2),hl

		exx;pop hl
	ifdef Debug
		call Debug_ReleaseEXX
	endif

		ld a,h
		ld (SprShow_OldX),a
		push de

			ld a,(SprShow_TempH)
			dec a
			cp E
			jr NC,ShowSprite_HeiNotZero		; check if new width is <0
				;pop af ; use up the pushed val
				pop af
;				ei
				ret
			ShowSprite_HeiNotZero:
			inc a
			sub E
			ld (SprShow_TempH),a



			ld a,(SprShow_TempW)
			ld (SprShow_W),a
			dec a
			cp L
			jr NC,ShowSprite_WidthNotZero		; check if new width is <0
				;pop af ; use up the pushed val
				pop af
;				ei
				ret
			ShowSprite_WidthNotZero:
			inc a
			sub L
			ld (SprShow_TempW),a
	ex af,af'
			ld hl,(SprShow_TempAddr)
	
		pop af 		;restore width
		ld d,0
		ld e,a		; store width for loop

	; we can only use the basic slow render - the others cannot clip

	;pop bc  	; Get the counter out the stack
	ex af,af'
	ld b,a
	;ld a,b
	or a
	jr Z,ShowSprite_AddressOK
 
	ShowSprite_AddressDown:
		add hl,de
	djnz ShowSprite_AddressDown

ShowSprite_AddressOK:	;Address does not need changing
	ld b,0
	ld c,&00 :SprShow_OldX_Plus1
;	ld bc,(SprShow_OldX)
	add hl,bc ; add the width to the address

	ld (SprShow_TempAddr),hl ; save the new start address


	jp ShowSprite_Ready
	;we have messed with the co-ords, so can only use the basic render not supefast ones



ShowSprite_SkipChanges:
	; No co-ord tweaks were needed, all sprite is onscreen
	;pop af 		;restore width
	ex af,af'
;	jp ShowSprite_Ready


ShowSprite_Ready:
;	ld B,&69SprShow_TempX_Plus1		;xpos
;	ld C,&00 SprShow_TempY_Plus1 ;(SprShow_TempY)
;	call GetMemPosQuickA
	ld hl,&0000 :SprShow_TempY_Plus2
	add hl,hl 		; table is two bytes so double hl

	ld de,scr_addr_table	; get table
	add hl,de		;add line num

	ld a,(hl)		; read the two bytes in		
	inc l ;inc hl
	ld h,(hl)
	ld l,a	; hl now is the memory loc of the line
	
;	ld a,b	;get the X col
	ld de,&0020 :ScreenBuffer_ActiveScreenDirectC_Plus1
	add hl,de  	; hl = memory line, bc = X pos = hl is now the location on screen
	

;;;;;;;;;;;;;;;;

	ld c,&00 :SprShow_TempH_Plus1
	ld iy,&0000 :SprShow_TempAddr_Plus2

	

	jp SprDrawLnStartBegin :ShowSprite_Ready_Return_Plus2






SprDrawChooseRenderLineDoubler:
;	ex af,af'
	rlc c
;	ld a,c
;	add c
;	ld c,a

	ld de,Sprdraw24PxVer_Double
;	ex af,af'
	jp SprDrawTurboPrep

SprDrawChooseRender:	; Pick the render based on width
	ld a,(SprShow_TempW)
	cp 6
	jp z,SprDraw24pxInit
	cp 8
	jr z,SprDraw32pxInit
	cp 4
	jr z,SprDraw16pxInit
	cp 2
	jr z,SprDraw8pxInit
	cp 12
	jr z,SprDraw48pxInit
	cp 10
	jr z,SprDraw40pxInit
	cp 24
	jr z,SprDraw96pxInit
	;cp 255
	;jr z,SprDraw24pxInit

SprDrawLnStartBegin:			; This is our most basic render, its slow, but can do any size and clipping



SprDrawLnStartBeginB:
	ld a,(TranspBitA_Plus1-1)	
	ld (TranspBitB_Plus1-1),a
	push hl
	ld hl, SprDrawLnStart2

	ld a,(SprShow_Xoff)
	bit 6,a
	jp z,SprDrawLn_NoDoubler

	ld hl,SprDrawLnDoubleLine
	;ld a,c
	;add c
	;ld c,a

SprDrawLn_NoDoubler:
	ld (SprDrawLnDoubleLineJump_Plus2-2),hl
	pop hl


SprDrawLnStart2:
	;push bc
	push hl
	

		ld d,IYH
		ld e,IYL



		ld b,&00 :SprShow_TempW_Plus1;a	
		SprDrawPixelLoop:
			ld a,(de)
			cp 1 :TranspBitB_Plus1
			jr z,SprDrawSkipPixelLoop
			ifdef DebugSprite
				or %11000000 ; test code, marks slow sprites so we can see they will be slow
			endif
			ld (hl),a
		SprDrawSkipPixelLoop:
			inc hl
			inc de
		djnz SprDrawPixelLoop	

		ld d,0 
		ld e,0 :SprShow_W_Plus1
		add iy,de
	pop hl


;	call GetNxtLin

;	ld a,h
;	add a,&08
;	ld h,a

;GetNextLineBasicSpriteCheck_Minus1
;	bit 7,h
;	jp nz,GetNextLineBasicSpriteCheckDone
;	ld de,&c050
;	add hl,de
;	call GetNxtLin
	inc h
	ld a,h
	and  %00000111;7
	jp nz,GetNextLineBasicSpriteCheckDone
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,GetNextLineBasicSpriteCheckDone
	ld a,h
	sub %00001000;8
	ld h,a


GetNextLineBasicSpriteCheckDone:
	dec c




;	ei
;	ret z
	jp z,SpeccyColorIY
	jp SprDrawLnStart2 :SprDrawLnDoubleLineJump_Plus2
SprDrawLnDoubleLine:
	call GetNxtLin

	jr SprDrawLnStart2

SprDrawLineEnd2:

;--------------------Turbo Version! misuse the stack for faster writes ----------------
SprDraw8pxInit:
	ld de,Sprdraw8PxVer
	jp SprDrawTurboPrep
SprDraw16pxInit:
	ld de,Sprdraw16PxVer
	jp SprDrawTurboPrep
SprDraw32pxInit:
	ld de,Sprdraw32PxVer
	jp SprDrawTurboPrep
SprDraw48pxInit:
	ld de,Sprdraw48PxVer
	jp SprDrawTurboPrep
SprDraw24pxInit:
	ld de,Sprdraw24PxVer
	jp SprDrawTurboPrep
SprDraw40pxInit:
	ld de,Sprdraw40PxVer
	jp SprDrawTurboPrep
SprDraw96pxInit:
	ld de,Sprdraw96PxVer
	jr SprDrawTurboPrep

SprDrawTurboPrep:
	ld (Sprdraw24PxJumpPos_Plus2-2),de
	;ld  	B,0 ;B is ZERO

SprDrawTurboPrep2:
	di
	ld (SprDrawTurbo_StackRestore_Plus2-2),sp
	ld sp,iy
SprDrawTurbo_StartLine:
	ld (SprDrawTurbo_HLrestore_Plus2-2),hl

		Ld a,0	:TranspBitA_Plus1 ; Set A to ZERO / Transp byte
		jp	Sprdraw24PxVer :Sprdraw24PxJumpPos_Plus2	; we change the jump here to alter the width of the sprite quickly

		; ********** A MUST BE the transparent byte for THIS WHOLE LOOP! ***********

Sprdraw24PxVer_Double:	;Line doubler - does two nextlines each time
		
		bit 0,C
		jp z,SprDrawTurbo_LineSkip
		jp Sprdraw24PxVer
Sprdraw96PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipFb
		ld (hl),e
		SprDraw24pxW_SkipFb:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipEb
		ld (hl),d
		SprDraw24pxW_SkipEb:
		inc hl
Sprdraw88PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipCb
		ld (hl),e
		SprDraw24pxW_SkipCb:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipDb
		ld (hl),d
		SprDraw24pxW_SkipDb:
		inc hl
Sprdraw80PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipAb
		ld (hl),e
		SprDraw24pxW_SkipAb:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipBb
		ld (hl),d
		SprDraw24pxW_SkipBb:
		inc hl


Sprdraw72PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip1b
		ld (hl),e

		SprDraw24pxW_Skip1b:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip2b
		ld (hl),d
		SprDraw24pxW_Skip2b:
		inc hl

Sprdraw64PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip3b
		ld (hl),e
		SprDraw24pxW_Skip3b:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_Skip4b
		ld (hl),d
		SprDraw24pxW_Skip4b:
		inc hl

Sprdraw56PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip5b
		ld (hl),e
		SprDraw24pxW_Skip5b:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip6b
		ld (hl),d
		SprDraw24pxW_Skip6b:
		inc hl
Sprdraw48PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipF
		ld (hl),e
		SprDraw24pxW_SkipF:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipE
		ld (hl),d
		SprDraw24pxW_SkipE:
		inc hl
Sprdraw40PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipC
		ld (hl),e
		SprDraw24pxW_SkipC:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipD
		ld (hl),d
		SprDraw24pxW_SkipD:
		inc hl
Sprdraw32PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipA
		ld (hl),e
		SprDraw24pxW_SkipA:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipB
		ld (hl),d
		SprDraw24pxW_SkipB:
		inc hl


Sprdraw24PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip1
		ld (hl),e

		SprDraw24pxW_Skip1:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip2
		ld (hl),d
		SprDraw24pxW_Skip2:
		inc hl

Sprdraw16PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip3
		ld (hl),e
		SprDraw24pxW_Skip3:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_Skip4
		ld (hl),d
		SprDraw24pxW_Skip4:
		inc hl

Sprdraw8PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip5
		ld (hl),e
		SprDraw24pxW_Skip5:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip6
		ld (hl),d
		SprDraw24pxW_Skip6:
SprDrawTurbo_LineSkip:
	dec c
	jr z,SprDrawTurbo_Done

	ld hl,&6969 :SprDrawTurbo_HLrestore_Plus2



;	ld a,h
;	add a,&08
;	ld h,a;
;TurboScreenLoopCheck_Minus1
;	bit 7,h
;	jp nz,SprDrawTurbo_AllowInterrupts
;SprDrawTurbo_AllowInterruptsB
;	ld de,&c050
;	add hl,de
	inc h
	ld a,h
	and  %00000111;7
	jp nz,SprDrawTurbo_AllowInterrupts
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,SprDrawTurbo_AllowInterrupts
	ld a,h
	sub %00001000;8
	ld h,a
SprDrawTurbo_AllowInterrupts:	; We need to allow interrupts every few lines to keep the raster colors consistant
	;bit 0,c
	ld a,c
	and %00000011
	jp nz,SprDrawTurbo_StartLine

	ld (SprDrawTurbo_StackRestoreSprite_Plus2-2),sp
;	ei
	ld sp,&6969 :SprDrawTurbo_StackRestore_Plus2
	di
	ld sp,&6969 :SprDrawTurbo_StackRestoreSprite_Plus2
	jp SprDrawTurbo_StartLine



SprDrawTurbo_Done:
	ld hl,&0000
	add hl,sp
	ld sp,(SprDrawTurbo_StackRestore_Plus2-2)
;	ei
;	ret
jp SpeccyColor







;--------------------Pset Version! no transparentcy, so fast! ----------------
SprDrawChooseRenderLineDoublerPset:
	di
	
	ex af,af';push af
	ld a,c
	add c
	ld c,a
	ex af,af';pop af
	ld de,SprdrawPset_Double
	jp SprDrawPsetPrep


SprDrawChooseRenderPset:		; Can do any size between 8-48 pixels
	ld a,(SprShow_TempW)
	cp 6
	jp z,SprDrawPset24pxInit
	cp 8
	jr z,SprDrawPset32pxInit
	cp 4
	jr z,SprDrawPset16pxInit
	cp 2
	jr z,SprDrawPset8pxInit
	cp 12
	jr z,SprDrawPset48pxInit
	cp 16
	jr z,SprDrawPset64pxInit
	cp 20
	jr z,SprDrawPset80pxInit
	cp 24
	jr z,SprDrawPset96pxInit
	cp 32
	jr z,SprDrawPset128pxInit
	cp 18
	jr z,SprDrawPset72pxInit
	cp 10
	jr z,SprDrawPset40pxInit
	jp SprDrawLnStart2
SprDrawPset8pxInit:
	ld de,SprDrawPset8PxVer
	jr SprDrawPsetPrep
SprDrawPset16pxInit:
	ld de,SprDrawPset16PxVer
	jr SprDrawPsetPrep
SprDrawPset32pxInit:
	ld de,SprDrawPset32PxVer
	jr SprDrawPsetPrep
SprDrawPset40pxInit:
	ld de,SprDrawPset40PxVer
	jr SprDrawPsetPrep
SprDrawPset48pxInit:
	ld de,SprDrawPset48PxVer
	jr SprDrawPsetPrep
SprDrawPset64pxInit:
	ld de,SprDrawPset64PxVer
	jr SprDrawPsetPrep
SprDrawPset72pxInit:
	ld de,SprDrawPset72PxVer
	jr SprDrawPsetPrep
SprDrawPset80pxInit:
	ld de,SprDrawPset80PxVer
	jr SprDrawPsetPrep
SprDrawPset96pxInit:
	ld de,SprDrawPset96PxVer
	jr SprDrawPsetPrep
SprDrawPset128pxInit:
	ld de,SprDrawPset128PxVer
	jr SprDrawPsetPrep
SprDrawPset24pxInit:
	ld de,SprDrawPset24PxVer
SprDrawPsetPrep:

	ld (SprDrawPset24PxJumpPos_Plus2-2),de
	
SprDrawPsetPrep2:

	di
	ld (SprDrawPset_StackRestore_Plus2-2),sp
	ld sp,iy
SprDrawPset_StartLine:
	ld (SprDrawPset_HLrestore_Plus2-2),hl

		ld a,(TranspBitA_Plus1-1) ; Set A to ZERO
		jp	SprDrawPset24PxVer :SprDrawPset24PxJumpPos_Plus2

		; ********** A MUST BE ZERO THIS WHOLE LOOP! ***********

SprdrawPset_Double:				;Line doubler, moves down two lines instead of one
		
		bit 0,C
		jr z,SprDrawPset_LineSkip
		jp SprDrawPset24PxVer
SprDrawPset128PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl

		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset96PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset80PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset72PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset64PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl

		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset48PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset40PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset32PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset24PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset16PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset8PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d

SprDrawPset_LineSkip:
	dec c
	jr z,SprDrawPset_Done
	ld hl,&6969 :SprDrawPset_HLrestore_Plus2


;	ld a,h
;	add a,&08
;	ld h,a

;PsetScreenLoopCheck_Minus1
;	bit 7,h
;	jp nz,SprDrawPset_AllowInterrupts
;SprDrawPset_AllowInterruptsB
;	ld de,&c050
;	add hl,de


	inc h
	ld a,h
	and  %00000111;7
	jp nz,SprDrawPset_AllowInterrupts
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,SprDrawPset_AllowInterrupts
	ld a,h
	sub %00001000;8
	ld h,a


SprDrawPset_AllowInterrupts:		; Let interrupts run once every few lines to keep interrupts stable
	ld a,c
	and %00000111
	jp nz,SprDrawPset_StartLine

	ld (SprDrawPset_StackRestoreSprite_Plus2-2),sp
;	ei
	ld sp,&6969 :SprDrawPset_StackRestore_Plus2
	di
	ld sp,&6969 :SprDrawPset_StackRestoreSprite_Plus2
	jp SprDrawPset_StartLine	



SprDrawPset_Done:
	ld hl,&0000
	add hl,sp
	ld sp,(SprDrawPset_StackRestore_Plus2-2)
;	ei

SpeccyColor:
;	ld hl,&8000	;we have currently the pointer to the color ram
	ld de,&5800 :ScreenBuffer_ActiveScreenDirectB_Plus1
	ld a,1
	ld (XCharColSkips_Plus1-1),a
	ld a,(SprShow_TempX)
	add e
	ld e,a

	ld a,(SprShow_TempY)
	add 4

	push af
		and %11000000
		rlca
		rlca
		ld b,a
	pop af
	and %00111000
	rlca
	rlca

	ld c,a
	ex hl,de
		add hl,bc
	ex hl,de


SpeccyColorFill:
	ld a,(SprShow_TempH)
	add 7
	and %11111000
	rrca
	rrca
	rrca
	ld ixl,a		;Y hei
	ld b,0
NextColLine:
	ld a,(SprShow_TempW)
	ld c,a
;	ld b,a
	push de
;		ldir
NextColLineLoop:
;		ld a,(hl)
;		ld (de),a
;		inc hl
;		inc de
;		djnz NextColLineLoop
		ldir	
	pop de

	ld a,1 :XCharColSkips_Plus1
NextColLineLoop_DoSkips:
	dec a
	jp z,NextColLineLoop_NoSkips
	inc hl
	jp NextColLineLoop_DoSkips
NextColLineLoop_NoSkips:
	ex hl,de
		ld bc,&0020
		add hl,bc
	ex hl,de
	dec ixl
	jp nz,NextColLine
ret






SpeccyColorIY:


	Push IY
	pop HL


	ld a,(SprShow_W_Plus1-1)
	ld d,0 
	ld e,a


	ld a,0 :SpeccyColor_FrontLinesToSkip_Plus1
;	xor a

	and %11111000
	rrca
	rrca
	rrca
	ld b,a

	or a
	jr z,SpeccyColorIY_Skip

SpeccyColorIY_Linemove:	
	add hl,de
	djnz SpeccyColorIY_Linemove
SpeccyColorIY_Skip:	
	




	ld a,0 :SpeccyColor_EndLinesToSkip_Plus1

;	ld a,(SprShow_TempH)
;	xor a
	ld b,a

	or a
	jr z,SpeccyColorIY2_Skip

SpeccyColorIY2_Linemove:	
	add hl,de
	djnz SpeccyColorIY2_Linemove
SpeccyColorIY2_Skip:	
	


	push hl
		ld a,(SprShow_TempX)
		ld b,a


		ld a,(SprShow_TempW)
		ld h,a

		ld a,e
		sub h
		inc a
		ld (XCharColSkips_Plus1-1),a


		ld a,(SprShow_TempY)
		add 4
		ld c,a
		call GetColMemPos
		ex hl,de
	pop hl


	jp SpeccyColorFill
ret

;jr SpeccyColor

null:	ret


nolist
read "Akuyou_Spectrum_Keyreader.asm"
read "Akuyou_Spectrum_Bankswapper.asm"
read "Akuyou_Spectrum_Gradient.asm"
read "Akuyou_Spectrum_ScreenMemory.asm"




ScreenBuffer_Init:	;8036 Init the double buffer
 	ld a,&00
	ld (ScreeBuffer_Plus1-1),a
	ld   a,(out7ffdBak)  ;BANKM (23388)
        and  %11110111
;	 or  %00001000
	jr ScreenBuffer_FlipB
ScreenBuffer_Flip:	;8039 Flip the buffer

        ld   a,(out7ffdBak)  ;BANKM (23388)
	;     --IRSMMM
        xor  %00001000
ScreenBuffer_FlipB:	;8039 Flip the buffer
        ld   (out7ffdBak),a  ;BANKM (23388)       
        ld   bc,&7ffd   ;32765
        out  (c),a

	ld b,&80
	ld a,&00	:ScreeBuffer_Plus1
	xor b
	ld (ScreeBuffer_Plus1-1),a


	ld a,(ScreenBuffer_ActiveScreenDirectC_Plus1-1)
	xor b
	ld (ScreenBuffer_ActiveScreenDirectC_Plus1-1),a

	ld a,(ScreenBuffer_ActiveScreenDirectB_Plus1-1)
	xor b
	ld (ScreenBuffer_ActiveScreenDirectB_Plus1-1),a



ret

ScreenBuffer_Reset: 	;803C






align 256
SpriteMemory:
incbin "speccy.spr"
EOF:
;save "spectest",&8000,EOF-&8000





