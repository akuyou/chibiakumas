ColorShiftTolerance equ 7	;Amount Colors can move, set to 4 for best sprite - 7 for best background

;***************************************************************************************************

; 					Show Sprite

;***************************************************************************************************
;SpritePointerInit	; We have two sprite pointers, one for player sprites (which actually never moves!) and one for level sprites
			; Note.. the second bank of sprites (128k only) is always located in &D000 in memory config C1/C3
;	ld (ObjectSpritePointer_Plus2-2),hl
;	ld (PlayerSpritePointer_Plus2-2),de

;ret

SprShow_W equ SprShow_W_Plus1-1

SprShow_Xoff equ SprShow_Xoff_Plus1-1
SprShow_Yoff equ SprShow_Yoff_Plus1-1


SprShow_TempX equ ScreenBuffer_ActiveScreenDirectC_Plus1-2
SprShow_TempY equ SprShow_TempY_Plus2-2
SprShow_TempW equ SprShow_TempW_Plus1-1
SprShow_TempH equ SprShow_TempH_Plus1-1
SprShow_OldX equ SprShow_OldX_Plus1-1

SprShow_TempAddr equ SprShow_TempAddr_Plus2-2 ; defw &0000




; We can preread a sprite to get the width/height
; This is used for Direct sprites, and was used by the object loop - the object loop now assumes the sprite is 24x24, this was done to save time as 97% of the time - it is


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

	ld hl,&0000 :SprShow_BankAddr_Plus2
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

	
	ld hl,&B0ED
	ld (NextColLineLoopSelfMod_Plus2-2),hl


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

	ld c,(hl)
	inc hl
	ld b,(hl)


	ld a, &C0	:ScreenBuffer_ActiveScreenDirectE_Plus1 ;or our current screen is below C000
	cp &40
	jr z,ShowSpriteDirectRamB

	ld a,d
	cp &C0			; see if our sprite is in bank C000+
	jr c,ShowSpriteDirectRamB


	ld a,(Bankswapper_ZXBank_Current_Plus1-1)
	cp 7
	jr z,ShowSpriteDirectRamB
;;



	
ShowSpriteCacheRam:



	ld ixh,b
	ld ixl,c
;	ld a,(hl)
;	ld ixl,
;	inc hl
;	ld a,(hl)
;	ld ixh,a



	ld bc,&0005
	add hl,bc
	ld a,(hl)
	ld iyl,a
	inc hl	
	ld a,(hl)
	ld iyh,a
	or iyl
	jr z,NextSpriteZero

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
	ex hl,de
	push iy
	pop bc
NextSpriteZeroReturn:
;	di
;	halt
	push ix
	pop hl

	add hl,de
;	ld (SprShow_TempAddr),hl


	ld de,SpriteCache
	ld (SprShow_TempAddr),de
;	ld b,iyh
;	ld a,iyl
;	and %11110000
;	ld c,a

	ei
	call Bankswapper_FastCopy

	ld a,7
	call Bankswapper_SetCurrent


;	di 
;	halt
;	ldir
	jp ShowSpriteReady
NextSpriteZero:
	ld bc,&0400
jp NextSpriteZeroReturn
ShowSpriteDirectRam:
	ld a,7
	call Bankswapper_SetCurrent
ShowSpriteDirectRamB:
	ex de,hl
	add hl,bc
	ld (SprShow_TempAddr),hl
	
;	ex de,hl
ShowSpriteReady:


	ld bc,TranspColors
	ex af,af';
	;ld a,(SprShow_Xoff) - we are relying on this still being in A 
	and %00000111
	add c
	ld c,a
	ld a,(bc)
	ld (TranspBitA_Plus1-1),a



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





	bit 5,a ;keep background color
	jr nz,ShowSprite_BackColor


	bit 6,a ;No color
	jr nz,ShowSprite_NoColor

	jr ShowSprite_ColorBackApplyNormal

ShowSprite_NoColor:
	ld l,&18
	ld h,NextColLineLoop_NoColor-NextColLineLoopSelfMod_Plus2
	jr ShowSprite_ColorBackApply

ShowSprite_BackColor:
	ld l,&18
	ld h,NextColLineLoop_keepBackgroundColor-NextColLineLoopSelfMod_Plus2
	jr ShowSprite_ColorBackApply

ShowSprite_ColorBackApplyNormal:
	ld hl,&B0ED
ShowSprite_ColorBackApply:
	ld (NextColLineLoopSelfMod_Plus2-2),hl


;	bit 6,a
;	jp z,ShowSprite_OK_NoDoubler
;	ld hl,SprDrawChooseRenderLineDoubler ; Doubler gives an interlacing effect, used for faux big sprites without slowdown
;	
;	bit 7,a
;	jp z,ShowSprite_OK_Xoff
;	ld hl,SprDrawChooseRenderLineDoublerPset  ;Double height with Pset (no transparency - much faster)
;
;	jp ShowSprite_OK_Xoff
;ShowSprite_OK_NoDoubler			
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
				ei
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
				ei
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
;	ld a,(TranspBitA_Plus1-1)	
;	ld (TranspBitB_Plus1-1),a
;	push hl
;	ld hl, SprDrawLnStart2

;	ld a,(SprShow_Xoff)
;	bit 6,a
;	jp z,SprDrawLn_NoDoubler

;	ld hl,SprDrawLnDoubleLine

SprDrawLn_NoDoubler:
;	ld (SprDrawLnDoubleLineJump_Plus2-2),hl
;	pop hl
ei
SprDrawLnStart2:
	;push bc
	push hl
	

		ld d,IYH
		ld e,IYL



		ld b,&00 :SprShow_TempW_Plus1;a	
		SprDrawPixelLoop:
			ld a,(de)
;			cp 1 TranspBitB_Plus1
;			jr z,SprDrawSkipPixelLoop
			ifdef DebugSprite
				or %11000000 ; test code, marks slow sprites so we can see they will be slow
			endif
			ld (hl),a
		SprDrawSkipPixelLoop:
		inc l;			inc hl
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
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipEb
		ld (hl),d
		SprDraw24pxW_SkipEb:
		inc l;		inc hl
Sprdraw88PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipCb
		ld (hl),e
		SprDraw24pxW_SkipCb:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipDb
		ld (hl),d
		SprDraw24pxW_SkipDb:
		inc l;		inc hl
Sprdraw80PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipAb
		ld (hl),e
		SprDraw24pxW_SkipAb:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipBb
		ld (hl),d
		SprDraw24pxW_SkipBb:
		inc l;		inc hl


Sprdraw72PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip1b
		ld (hl),e

		SprDraw24pxW_Skip1b:
		inc l;		inc hl

		cp d
		jr z,SprDraw24pxW_Skip2b
		ld (hl),d
		SprDraw24pxW_Skip2b:
		inc l;		inc hl

Sprdraw64PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip3b
		ld (hl),e
		SprDraw24pxW_Skip3b:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_Skip4b
		ld (hl),d
		SprDraw24pxW_Skip4b:
		inc l;		inc hl

Sprdraw56PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip5b
		ld (hl),e
		SprDraw24pxW_Skip5b:
		inc l;		inc hl

		cp d
		jr z,SprDraw24pxW_Skip6b
		ld (hl),d
		SprDraw24pxW_Skip6b:
		inc l;		inc hl
Sprdraw48PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipF
		ld (hl),e
		SprDraw24pxW_SkipF:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipE
		ld (hl),d
		SprDraw24pxW_SkipE:
		inc l;		inc hl
Sprdraw40PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipC
		ld (hl),e
		SprDraw24pxW_SkipC:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipD
		ld (hl),d
		SprDraw24pxW_SkipD:
		inc l;		inc hl
Sprdraw32PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipA
		ld (hl),e
		SprDraw24pxW_SkipA:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipB
		ld (hl),d
		SprDraw24pxW_SkipB:
		inc l;		inc hl


Sprdraw24PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip1
		ld (hl),e

		SprDraw24pxW_Skip1:
		inc l;		inc hl

		cp d
		jr z,SprDraw24pxW_Skip2
		ld (hl),d
		SprDraw24pxW_Skip2:
		inc l;		inc hl

Sprdraw16PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip3
		ld (hl),e
		SprDraw24pxW_Skip3:
		inc l;		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_Skip4
		ld (hl),d
		SprDraw24pxW_Skip4:
		inc l;		inc hl

Sprdraw8PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip5
		ld (hl),e
		SprDraw24pxW_Skip5:
		inc l;		inc hl

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
	jp SprDrawLnStartBeginB
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
	ei
	ex hl,de
 

	push iy
	pop hl

	ld iyl,c
SprDrawPset_StartLine:
	ld (SprDrawPset_HLrestore_Plus2-2),de

		jp	SprDrawPset24PxVer :SprDrawPset24PxJumpPos_Plus2

		; ********** A MUST BE ZERO THIS WHOLE LOOP! ***********

SprdrawPset_Double:				;Line doubler, moves down two lines instead of one
		ld a,iyl
		bit 0,a
		jr z,SprDrawPset_LineSkip
		jp SprDrawPset24PxVer
SprDrawPset128PxVer:
		ldi 
		ldi

		ldi 
		ldi

		ldi 
		ldi

		ldi 
		ldi
SprDrawPset96PxVer:
		ldi 
		ldi

		ldi 
		ldi
SprDrawPset80PxVer:
		ldi 
		ldi
SprDrawPset72PxVer:
		ldi 
		ldi
SprDrawPset64PxVer:
		ldi 
		ldi

		ldi 
		ldi
SprDrawPset48PxVer:
		ldi 
		ldi
SprDrawPset40PxVer:
		ldi 
		ldi
SprDrawPset32PxVer:
		ldi 
		ldi
SprDrawPset24PxVer:
		ldi 
		ldi
SprDrawPset16PxVer:
		ldi 
		ldi
SprDrawPset8PxVer:
		ldi 
		ldi
SprDrawPset_LineSkip:
	dec iyl
	jr z,SpeccyColor
	ld de,&6969 :SprDrawPset_HLrestore_Plus2
	inc d
	ld a,d
	and  %00000111;7
	jp nz,SprDrawPset_StartLine
	ld a,e
	add a,%00100000;32
	ld e,a
	jp c,SprDrawPset_StartLine
	ld a,d
	sub %00001000;8
	ld d,a

jp SprDrawPset_StartLine





SpeccyColor:
;	di

;	ld hl,&8000	;we have currently the pointer to the color ram
	ld de,&5800 :ScreenBuffer_ActiveScreenDirectD_Plus1
	ld a,1
	ld (XCharColSkips_Plus1-1),a
	ld a,(SprShow_TempX)
	add e
	ld e,a
	ld a,(SprShow_TempY)



	add ColorShiftTolerance	;Lines to shift color map Down
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


	ld a,d
	and %00001111
	cp &B
	jr nc,NextColLineLoop_Abort


SpeccyColorFill:
	ld a,(SprShow_TempY) ;subtract any lines due to color shift
	and ColorShiftTolerance; %00000111
	ld b,a


	ld a,(SprShow_TempH)

	sub b ;subtract any lines due to color shift

;Disabled to avoid color clash
;	add 7		;Lines to add (shift colormap down
	and %11111000
jr z,NextColLineLoop_Abort
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
NextColLineLoop:

	ldir	:NextColLineLoopSelfMod_Plus2
NextColLineLoop_Return:

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
NextColLineLoop_Abort
ei
ret

NextColLineLoop_keepBackgroundColor:
		ld a,(hl)
		and %11000111
		ld b,a
		ld a,(de)
		and %00111000
		or b
		ld (de),a
		inc hl
		inc de
		dec c
		jp nz,NextColLineLoop
NextColLineLoop_NoColor:
	jr NextColLineLoop_Return

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

;ret
