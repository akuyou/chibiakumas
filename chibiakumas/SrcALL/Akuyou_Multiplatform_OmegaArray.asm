Ifdef BuildMSX					;This is used to slow down the omega array on the Turbo-R
	MotionlessOmega:
		ld hl,&0000
		ld (OmegaMoves),hl
		ld hl,OmegaMovesDummy
		ld (OmegaMovesSet_Plus2-2),hl
	ret
endif
OmegaMovesDummy: dw &0000
OmegaArray_Redraw:

ifdef BuildMSX
	ld hl,OmegaMoves 
	ld (OmegaMovesSet_Plus2-2),hl

	call Akuyou_Timer_GetTimer	;ld a,(Timer_TicksOccured)
	and %00000001
	call z,MotionlessOmega	

else
	call Akuyou_Timer_GetTimer	;ld a,(Timer_TicksOccured)
	or a
	ret z
endif






;	ld a,(NextShot_Plus1-1)
;	inc a
;	ld c,a
;	ld a,r
;	xor c 
;	ld (NextShot_Plus1-1),a

call OmegaArray_Init

ld hl,OmegaArrayPointer1
call OmegaArray_RedrawChunk
ld hl,OmegaArrayPointer2
call OmegaArray_RedrawChunk
ld hl,OmegaArrayPointer3
call OmegaArray_RedrawChunk
ld hl,OmegaArrayPointer4
call OmegaArray_RedrawChunk
;call OmegaArray_RedrawChunk
;call OmegaArray_RedrawChunk
ret

OmegaArray_Init:
	call Akuyou_ScreenBuffer_GetActiveScreen 
ifdef BuildMSX
	ld (VDP_Star_DY+1),a
	rrca
endif
ifdef BuildZXS
	and %10000000
endif	
	ld (GetMemPos_ScreenOffset_Plus1-1),a

	;configure the loop for the enemy star array
	;ld hl,&0000

	call AkuYou_Player_GetPlayerVars


ifdef BuildMSX
	and %00000001
	jr z,notV9990Star

ifdef buildMSX_V9K
Vdp9k_Status equ &65	;Status port (read only)

VDP_Star_BusyCheck:
	in a,(Vdp9k_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	bit 0,a
	jr nz,VDP_Star_BusyCheck
	ld a,45
	out (Vdp9k_RegSel),a
	ld a,%00011100		;logical op
	out (Vdp9k_RegData),a

endif


;	ld a,52
;	out (Vdp9k_RegSel),a
;	     ;CCCC----
;	ld a,%01000000;4	LMMM	Rectangle area data is transferred from VRAM to VRAM. 
;	out (c),a

notV9990Star:
endif



	;configure the loop for the enemy star array
	ld hl,Player_Hit_Injure_1
;	ld iy,Player_Array


;	ld a,(iy+4)	;invincibility
	ld a,(iy+4)	;invincibility
	and %11100000	
	jp z,StarArray_PlayerVunrable

	; player invincible
	ld hl,StarLoopP1Skip
StarArray_PlayerVunrable:
	; load player 1 location - do it in advance to save time during the loop

;	ld a,(iy+1)
	ld a,(iy+1)	
	sub 2
	ld (Player1LocX_Plus1-1),a
	add 4
	ld (Player1LocXB_Plus1-1),a
	ld a,(iy+0)	
;	ld a,(iy+0)
	sub 2
	ld (Player1LocY_Plus1-1),a
	add 4
	ld (Player1LocYB_Plus1-1),a


	ld (CurrentStarArrayCollisionsB2_Plus2-2),hl





;;;;;;;;;;;;;;;;;;;;; Player 2 handler



	;configure the loop for the enemy star array
	ld hl,Player_Hit_Injure_2
;	ld iy,Player_Array2
;	ld a,(iy+4)	;invincibility
	ld a,(iy+4+Akuyou_PlayerSeparator)
	
	and %11100000	
	jp z,StarArray_PlayerVunrable2

	; player invincible
	ld hl,StarLoopP2Skip
StarArray_PlayerVunrable2:
	; load player 2 location - do it in advance to save time during the loop
	ld a,(iy+1+Akuyou_PlayerSeparator)
;	ld a,(iy+1)
	dec a
	dec a
	ld (Player2LocX_Plus1-1),a
	add 4
	ld (Player2LocXB_Plus1-1),a
	ld a,(iy+0+Akuyou_PlayerSeparator)
;	ld a,(iy+0)
	dec a
	dec a
	ld (Player2LocY_Plus1-1),a
	add 4
	ld (Player2LocYB_Plus1-1),a


	ld (CurrentStarArrayCollisions2B2_Plus2-2),hl
ret

;	ld a,0:OmegaTick_Plus1
;	inc a
;	ld (OmegaTick_Plus1-1),a
;	ld b,a
;	and %00001111
;	ret nz
;	ld a,b
;
;	and %00110000
;
;	cp  %00110000
;	jp z,OmegaArray_RedrawA
;	cp  %00100000
;	jp z,OmegaArray_RedrawB
;	cp  %00010000
;	jp z,OmegaArray_RedrawC
;OmegaArray_RedrawD:
;	ld hl,OmegaArrayPointer4
;	jp OmegaArray_EngageV2
;OmegaArray_RedrawA:
;	ld hl,OmegaArrayPointer1
;	jp OmegaArray_EngageV2
;OmegaArray_RedrawB:
;	ld hl,OmegaArrayPointer2
;	jp OmegaArray_EngageV2
;OmegaArray_RedrawC:
;	ld hl,OmegaArrayPointer3
;	jp OmegaArray_EngageV2

OmegaArray_RedrawChunk:


	ld bc,OmegaArraySize
	ld (SpRestore_Plus2-2),sp
	di
Starloop2:

	ld a,(hl)	; MX
	or a
;	and %01111111 StarLoopTimeSwitch_Plus1
	jp Z,StarArray_Turbo
	
	ld (Hlrestore_Plus2-2),hl
	inc h

	;ld a,(hl)StarLoopAltMove_Plus1
	;xor 0 
	ld (MovePointer_Plus2-2),a


	;inc h

	ld B,(hl) ; X
	inc h
	ld C,(hl) ; Y
	
Starloop_NotZero:




PlayerCollisions:

		ld a,B
		cp 0:Player1LocX_Plus1
		jr c,StarLoopP1Skip
		cp 0:Player1LocXB_Plus1
		jr nc,StarLoopP1Skip

		ld a,c
		cp 0:Player1LocY_Plus1
		jr c,StarLoopP1Skip
		cp 0:Player1LocYB_Plus1
		;jr nc,StarLoopP1Skip

		jp C,AkuYou_Player_Hit_Injure_1 :CurrentStarArrayCollisionsB2_Plus2
		
StarLoopP1Skip:

		ld a,c
		cp 0:Player2LocY_Plus1
		jr c,StarLoopP2Skip
		cp 0:Player2LocYB_Plus1
		jr nc,StarLoopP2Skip

		ld a,B
		cp 0:Player2LocX_Plus1
		jr c,StarLoopP2Skip
		cp 0:Player2LocXB_Plus1
		;jr nc,StarLoopP2Skip

		jp C,Player_Hit_Injure_2 :CurrentStarArrayCollisions2B2_Plus2
		
StarLoopP2Skip:
StarCollisionsDone:





		ld de,(MoveArray1) :MovePointer_Plus2
;		pop de 
		ld (OmegaMoves),de :OmegaMovesSet_Plus2

OmegaMoves:	nop
		nop

		;add c 
		ld (hl),c
		dec h
		ld (hl),b 

if buildCPCv+buildENTv
	read "..\srcCPC\Akuyou_CPC_OmegaArray_Draw.asm"
endif
ifdef BuildZXS
	read "..\srcZX\Akuyou_Spectrum_OmegaArray_Draw.asm"
endif
ifdef BuildMSX
	read "..\srcMSX\Akuyou_MSX_OmegaArray_Draw.asm"
endif
StarArray_Next:
	

ifdef BuildZXS
	ld sp,&1234 :SpRestore_Plus2

	ld a,1:intrruptForcer_Plus1
	inc a
	and %01111111
	ld (intrruptForcer_Plus1-1),a
	call z,Akuyou_INT_Force
	di

endif



StarArray_Finish:
	ld hl,&0000 :Hlrestore_Plus2
StarArray_Turbo:
if BuildCPCv+BuildMSXv+BuildENTv
	ei
	ld sp,&1234 :SpRestore_Plus2
	di
endif



	inc l


	jp nz,starloop2

	ld sp,(SpRestore_Plus2-2)
	ei
	ret

DoMoves_Kill
	ld hl,(Hlrestore_Plus2-2)

	xor a
	ld (hl),a ;MX

	jp StarArray_Turbo





Player_Hit_Injure_2:
	ld sp,(SpRestore_Plus2-2)
	call AkuYou_Player_Hit_Injure_2
	di
	jp StarLoopP2Skip

Player_Hit_Injure_1:
	ld sp,(SpRestore_Plus2-2)
	call AkuYou_Player_Hit_Injure_1
	di
	jp StarLoopP1Skip



align 256,&00
MoveArray1:
;	inc c ; Zero marks a dead command

	nop	;L
	dec b	;L

	dec c	;UL
	dec b	;DL

	dec c	;U
	nop	;U

	dec c	;UR
	inc b	;UR

	nop	;R
	inc b	;R

	inc c	;DR
	inc b	;DR 

	inc c	;D
	nop	;D

	inc c	;DL
	dec b	;DL

MoveArray4:


	inc c	;DL
	dec b	;DL
	
	nop	;L
	dec b	;L

	dec c	;UL
	dec b	;DL

	dec c	;U
	nop	;U

	dec c	;UR
	inc b	;UR

	nop	;R
	inc b	;R

	inc c	;DR
	inc b	;DR 

	inc c	;D
	nop	;D

;17 bytes later 1

MoveArray6:

	dec c	;UL
	dec b	;DL

	dec c	;U
	nop	;U

	dec c	;UR
	inc b	;UR

	nop	;R
	inc b	;R

	inc c	;DR
	inc b	;DR 

	inc c	;D
	nop	;D

	inc c	;DL
	dec b	;DL

	nop	;L
	dec b	;L

MoveArrayLR:


	dec b	;DL
	dec b	;DL

	nop; dec c   ;defb &18,&3 ;u
	dec b

	inc b	;UR
	inc b	;UR

	inc b	;R
	inc b	;R

	inc b	;DR 
	inc b	;DR 

	nop; inc c ;defb &18,&3 ;d
	inc b

	dec b	;DL
	dec b	;DL

	dec b	;L
	dec b	;L
MoveArrayUD:



	dec c	;UL
	dec c	;UL

	dec c	;U
	dec c	;U

	dec c	;U
	dec c	;U

	dec c ;defb &18,&3 ;R
	nop;dec b

	inc c	;DR
	inc c	;DR

	inc c	;D
	inc c	;D

	inc c	;DL
	inc c	;DL

	nop;inc b ;defb &18,&3 ;d
	inc c

MoveArray2:
	;defb &18,&3
	;defb &18,&3
	;defb &18,&3
	;defb &18,&3
	;defb &18,&3
	;defb &18,&3
	;defb &18,&3
	;defb &18,&3

	nop	;L
	dec b	;L

	dec c	;UL
	dec b	;DL

	dec c	;U
	nop	;U

	dec c	;UR
	inc b	;UR

	nop	;R
	inc b	;R

	inc c	;DR
	inc b	;DR 

	inc c	;D
	nop	;D

	inc c	;DL
	dec b	;DL
MoveArray7:
	inc c	;DL
	dec b	;DL

	nop	;L
	dec b	;L

	dec c	;UL
	dec b	;DL

	dec c	;U
	nop	;U

	dec c	;UR
	inc b	;UR

	nop	;R
	inc b	;R

	inc c	;DR
	inc b	;DR 

	inc c	;D
	nop	;D

MoveArray8:

	dec c	;UL
	dec b	;DL

	dec c	;U
	nop	;U

	dec c	;UR
	inc b	;UR

	nop	;R
	inc b	;R

	inc c	;DR
	inc b	;DR 

	inc c	;D
	nop	;D

	inc c	;DL
	dec b	;DL

	nop	;L
	dec b	;L

