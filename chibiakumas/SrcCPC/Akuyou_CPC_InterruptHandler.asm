

RasterColors_DefaultSafe:
	ld hl,RasterColors_Safe
	jr RasterColors_Blackoutb
RasterColors_Blackout:
	ld hl,RasterColors_Black
RasterColors_Blackoutb:
	ld e,1
	jp RasterColors_NoDelay

align 256,&00
RasterColors_Tick:
	jp RasterColors_1 :RasterColors_TickJump_Plus2


RasterColors_TopOfScreen:
	ld a,RasterColors_1	
	ld (RasterColors_TickJump_Plus2-2),a
	ret

RasterColors_2:
	ld a,RasterColors_3
	ld (RasterColors_TickJump_Plus2-2),a
	ret
RasterColors_3:
	;di
	ld a,RasterColors_4 :RasterColors_4Ver_Plus1
	ld hl,RasterColors_ColorArray2 :RasterColors_ColorArray2Pointer_Plus2
	jp RasterColors_All
RasterColors_4_Plus:
	ld hl,PlusSprites_Config2

	ld bc,&7fb8	;turn Plus Asic on
	out (c),c
	ld de,&6030
	ld b,6
PlusSpriteBank1MoreBytes4:
	ldi
	ldi
	ldi
	inc e
	ldi
	inc e
	inc e
	inc e
	djnz PlusSpriteBank1MoreBytes4
	ld bc,&7fa0 ;turn asic off
	out (c),c
RasterColors_4:
	;di
	ld a,RasterColors_5
	ld hl,RasterColors_ColorArray3 :RasterColors_ColorArray3Pointer_Plus2
	jp RasterColors_All
RasterColors_5:
	;di
	ld a,RasterColors_6
	ld hl,RasterColors_ColorArray4 :RasterColors_ColorArray4Pointer_Plus2
	jp RasterColors_All

RasterColors_6:
	

	;di
	ld a,RasterColors_1
	ld (RasterColors_TickJump_Plus2-2),a
nolist

InterruptPlaySound:

	ex af,af'
	exx
	push af
	push bc
	push de
	push hl
	push ix
	push iy

	call PLY_Play :MusicExec_PerFrame_Plus2	; play the music

	call null :RasterColors_PerFrameCall_Plus2
	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	pop af
	exx
	ex af,af'

ifdef SupportPlus 

PlusToggle1:	ret	;self modifying


;Swap our UI sprite locations
	ld hl,PlusSprites_Config1
	ld bc,&7fb8	;turn Plus Asic on
	out (c),c
	ld de,&6030

	ld b,6
PlusSpriteBank1MoreBytes:
	ldi
	ldi
	ldi
	inc e
	ldi
	inc e
	inc e
	inc e
	djnz PlusSpriteBank1MoreBytes
	ld bc,&7fa0 ;turn asic off
	out (c),c
;Swap our UI sprite locations - END



	; The code after this point is only used on the CPC plus
	ld a,0 :FlashPlusSprite_Plus1
	or a
	ret z

	ld hl,BlockPageFlippedColors
	ld a,(hl)
;	ld a,(BlockPageFlippedColors)
	cpl
	ld (hl),a
;	ld (BlockPageFlippedColors),a

	;ex af,af'
	;exx
	ld e,9
	ld d,0
	or a
	jr z,FlashPlayer_On
	ld e,d
FlashPlayer_On:



	ld h,6
	Call Plus_ShowHide
	ld d,12
	ld h,4
	jp Plus_ShowHide
else
	ret
endif

RasterColors_1:
	;di
	ld a,RasterColors_2
	ld hl,RasterColors_ColorArray1 :RasterColors_ColorArray1Pointer_Plus2

	jp RasterColors_All





;***************************************************************************************************

; 					Plus Raster Palette

;***************************************************************************************************
EnablePlusPalette:
	;set a=1 to turn on! not coded yet, but required!
	ld hl,PlusInterruptHandler
	ld (&0039),hl				; Patch in our firmware handler
ret

PlusInterruptHandler:


ifdef AdvancedInterrupts
	exx 
	pop hl
	ld (InterruptPlusSPRestore_Plus2-2),sp
	ld (InterruptReturn_Plus2-2),hl

	exx
	push de
	exx
	ld sp,&0000
	ex af,af'
else
	exx
	ex af,af'
endif


;jp RasterColors_DoneInterrupt	;disable interrputs for testing


;; page-in asic registers to &4000-&7fff
	ld bc,&7fb8					;; [3]
	out (c),c					;; [4]
	ld c,%11000000 +0 ; Reset ram banks
	out (c),c

	ld hl,PlusRasterPalette :NextPlusRasterSetting_Plus2
	ld a,0:ThisPlusRaster_Plus1
	or a
	jr nz,PlusRasterSaveSetting
	ld hl,PlusRasterPalette



;; address of pen 0 in CPC+ ASIC registers

;; start of table


PlusRasterSaveSetting:
	cp 100 :PlusRasterMidPoint_Plus1
	jr nc,InterruptMidScreen
	InterruptMidScreenContinue:

	ld a,(hl)						;; line 100
	inc hl
	ld (ThisPlusRaster_Plus1-1),a

	ld de,&6800
	ld (de),a
	or a
	jr z,InterruptPlaySoundB;PlusRasterFinish

	ld d,&64	;Palette port at &6400
	
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ld (NextPlusRasterSetting_Plus2-2),hl

	;; page-out asic registers
	ld bc,&7fa0
	out (c),c
	jp RasterColors_DoneInterrupt

InterruptPlaySoundB:
	ld a,32
	ld (PlusRasterMidPoint_Plus1-1),a	

	ld bc,&7fa0
	out (c),c

	call InterruptPlaySound
jp RasterColors_DoneInterrupt



InterruptMidScreen:
push hl
	ld hl,PlusSprites_Config2
	ld de,&6030
	ld b,6
PlusSpriteBank1MoreBytes4v2:
	ldi
	ldi
	ldi
	inc e
	ldi
	inc e
	inc e
	inc e
	djnz PlusSpriteBank1MoreBytes4v2
	ld a,255
	ld (PlusRasterMidPoint_Plus1-1),a	

pop hl
jp InterruptMidScreenContinue


RasterColors_SetPointers:			; Pass A, a=0 means reset to defaults
	or a					; A=1 means set to custom mem locations
						; but use a custom Frame event handler
	jr nz,RasterColors_SetPointersCustom
RasterColors_SetPointersCustom2:
	ld bc,RasterColors_ColorArray1
	ld de,RasterColors_ColorArray2
	ld hl,RasterColors_ColorArray3
	ld ix,RasterColors_ColorArray4


 
RasterColors_SetPointersCustom:
	ld (RasterColors_ColorArray1Pointer_Plus2-2),bc
	ld (RasterColors_ColorArray1PointerB_Plus2-2),bc
	ld (RasterColors_ColorArray2Pointer_Plus2-2),de
	ld (RasterColors_ColorArray3Pointer_Plus2-2),hl
	ld (RasterColors_ColorArray4Pointer_Plus2-2),ix
	ld (RasterColors_PerFrameCallRestore_Plus2-2),iy
ret
RasterColors_Disable:			;Turn off our interrupt
	ld hl,null
	ld (&0039),hl
	jp PLY_Stop

RasterColors_Init:				;Set up our interrupt
RasterColors_RestoreInterrupt:

	call RasterColors_DefaultSafe

	ld hl, RasterColors_TickOverrideFirm :RasterColorInterruptHandler_Plus2	; New Custom Interrupt version
;	ld hl,PlusInterruptHandler


	ld (&0039),hl				; Patch in our firmware handler

	ld hl,null:RasterColors_PerFrameCallRestore_Plus2
	ld (RasterColors_PerFrameCall_Plus2-2),hl
RasterColors_Reset:

	ld de,RasterColors_1
	ld (RasterColors_TickJump_Plus2-2),de


INT_Init:
	ret






; These are all due to be deleted, because they no longer do anything
RasterColors_off:
RasterColors_Init_Firmware:
RasterColors_StopMusic:
RasterColors_MusicOnly:
	ifdef debug
		call Debug_ObsoleteCode
	endif
ret

; trying to write an interrupt handler
RasterColors_TickOverrideFirm:

ifdef AdvancedInterrupts
	exx 
	pop hl
	ld (InterruptPlusSPRestore_Plus2-2),sp
	ld (InterruptReturn_Plus2-2),hl

	exx
	push de
	exx
	ld sp,&0000
	ex af,af'
else
	exx
	ex af,af'
endif

	ld bc, &7F00+	%11000000 +0 ; Reset ram banks
	out (c),c

	;; test VSYNC state
	ld      b,&f5
	in      a,(c)
	rra     
;	 jr      nc,RasterColors_TickRun

	call c,RasterColors_TopOfScreen

RasterColors_TickRun:
	call RasterColors_Tick

RasterColors_DoneInterrupt:		; end of our interrupt routine

	;stopwatch timer for benchmarking
	ifdef Debug
		ld a,(TimerTicks)
		inc a
		ld (TimerTicks),a
	endif


	ld bc, &7F00+	%11000000 :BankSwitch_C0_CurrentB_Plus2
	out (c),c

RasterColors_DoneInterruptB:
	exx
	ex af,af'
ifdef AdvancedInterrupts
	ld sp,&0000	:InterruptPlusSPRestore_Plus2
	ei
	jp &0000	:InterruptReturn_Plus2
else
	ret
endif


RasterColors_All:	; Our color handler

	ld (RasterColors_TickJump_Plus2-2),a
	ld e,(hl)            
	ld a,e
	or a
	ret z;jr z,RasterColors_Done
	inc l
 

RasterColors_MoreColors:
	ld b,(hl)            
	inc l
 	ld a,b
	or a	
	jr z, RasterColors_NoDelay
RasterColors_Delay1:
	push af				;Simple delay routine
	pop af
	djnz RasterColors_Delay1
RasterColors_NoDelay:

;; get colour byte from table

	ld bc,&7f00               ;; [3]
	
	out (c),c                 ;; [4]
	outi
	inc b			;Get B back to the way it was before outi messed!
	inc c

	out (c),c                 ;; [4]
	outi
	inc b
	inc c

	out (c),c                 ;; [4]
	outi
	inc b
	inc c

	out (c),c                 ;; [4]
	outi

	dec e     			;Loop if there are more colors
	ret z               
	jp RasterColors_MoreColors
