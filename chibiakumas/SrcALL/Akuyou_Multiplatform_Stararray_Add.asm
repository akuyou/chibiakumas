
;Starbust code - we use RST 6 as an 'add command' to save memory - RST 6 calls IY
;See EventStreamDefinitions for details of how the 'Directions' work
Stars_AddBurst_Top:
defw &0705
defw &0F0d
defw &1715
defw &1F1D
Stars_AddBurst_TopLeft:
defw &0301
defw &0b09
defw &1311
defw &1b19
defb 0

Stars_AddBurst_Right:
defw &2725
defw &2f2D
defw &3735
defw &3f3D
Stars_AddBurst_TopRight:
defw &0705
defw &0F0d
defw &1715
defw &1F1D
defb 0
Stars_AddBurst_Left:
defw &0301
defw &0b09
defw &1311
defw &1b19
Stars_AddBurst_BottomLeft:
defw &2321
defw &2b29
defw &3331
defw &3b39
defb 0
Stars_AddBurst_Bottom:
defw &2321
defw &2b29
defw &3331
defw &3b39
Stars_AddBurst_BottomRight:
defw &2725
defw &2f2D
defw &3735
defw &3f3D
defb 0

Stars_AddBurst_Outer:
defw &3737
defw &2727
defw &1717
defw &3131
defw &2121
defw &1111
OuterBurstPatternMini:
defw &2F2F
defw &1F1F
defw &2929
defw &1919
defw &3F39
defw &0F09
Stars_AddObjectOne:
defb 0

Stars_AddBurst:
defw &3f08
defb 0,0 
Stars_AddBurst_Small:
defw &3632
defw &2e2A
defw &2622
defw &1e1A
defw &1612
defb 0
Stars_AddBurst_TopWide:
defw &1d1b
defw &1513
defw &0d0b
defb 0
Stars_AddBurst_RightWide:
defw &2726
defw &2f2d
defw &1f1d
defb 0
Stars_AddBurst_LeftWide:
defw &2221
defw &1b19
defw &2b29

defb 0
Stars_AddBurst_BottomWide:
defw &2d2b
defw &3533
defw &3d3b
defb 0

	
;	ld hl,OuterBurstPatternMini;OuterBurstPattern
;	ld iy,Stars_AddBurstStartOne	; Change RST6 call
OuterBurstPatternLoop:
	ld a,(hl)
	or a
	ret z
	push hl
		ld h,a
		RstSix
	pop hl
	inc hl
	jr OuterBurstPatternLoop

Stars_AddObjectBatchDefault:
call Stars_AddToDefault
Stars_AddObjectBatch:
	;ld iy,Stars_AddBurstStart

	; B= pattern (0-15)
	; C = Y pos, D= X pos
	ld a,b
	cp 16			;radial blast!
	jp nc,Stars_AddObjectBatch2

	;push hl			;
	ld hl,Stars_VectorArray

	Call VectorLookup

Stars_AddBurstsLoop
	ld a,(hl)
	or a
	ret z
	push hl
		inc hl
		ld h,(hl)
		ld l,a
		inc a	;only run if two vals aren't the same!
		call nz,Stars_AddBurstStart
		;RstSix
	pop hl

	inc hl
	inc hl

jr Stars_AddBurstsLoop
VectorLookup:
	push bc
		ld b,0
		ld c,a
		add hl,bc	;add twice for a two byte address
		add hl,bc
	pop bc
	ld a,(hl)		; read the two bytes in		
	inc hl
	ld h,(hl)
	ld l,a		; hl now is the memory loc of the line
ret
VectorJump_PushHlFirst:	;Jump to address No A at HL  - MUST PUSH HL Before Jumping here!
	call VectorLookup


	ld (VectorJump_Plus2-2),hl
	pop hl
	jp &0000 :VectorJump_Plus2

Stars_VectorArray:
defw	Stars_AddObjectOne		;0 = just one - obsolete
defw	Stars_AddBurst_TopLeft		;1
defw	Stars_AddBurst_BottomLeft	;2
defw	Stars_AddBurst_TopRight		;3
defw	Stars_AddBurst_BottomRight	;4
defw	Stars_AddBurst_Top		;5
defw	Stars_AddBurst_Bottom		;6
defw	Stars_AddBurst_Left		;7
defw	Stars_AddBurst_Right		;8
defw	Stars_AddBurst_TopWide		;9
defw	Stars_AddBurst_BottomWide	;10
defw	Stars_AddBurst_LeftWide		;11
defw	Stars_AddBurst_RightWide	;12
defw	Stars_AddBurst			;13
defw	Stars_AddBurst_Small		;14
defw	Stars_AddBurst_Outer		;15



ifdef buildMSX_V9K
Stars_AddToParticles:
	xor a
	ld (StarArrayFullMarker_Plus1-1),a
	ld a,StarArraySize
	ld hl,ParticleArrayPointer
jr Stars_AddToDefaultB
endif

Stars_AddToPlayer:
	xor a
	ld (StarArrayFullMarker_Plus1-1),a
	ld a,PlayerStarArraySize;(StarArraySize_Player) 
	ld hl,PlayerStarArrayPointer;(StarArrayMemloc_Player)	   
jr Stars_AddToDefaultB
Stars_AddToDefault:
	ld a,StarArraySize;(StarArraySize_Enemy) 
	ld hl,StarArrayPointer;(StarArrayMemloc_Enemy)	   
Stars_AddToDefaultB:
	ld (StarsAddObjectStarArraySize_Plus1-1),a
	ld (StarsAddObjectStarArrayPointer_Plus2-2),hl
	xor a
	ld (StarArrayStartPoint_Plus1-1),a
	ret

;Stars_AddBurst
;	ld hl,&3f08 ; FROM - TO
;	jr Stars_AddBurstStart
Stars_AddBurstStartOne:
	;ld a,h
	;dec a
	;ld l,a
	ld l,h
;	dec l
Stars_AddBurstStart:
	
	push hl
;Stars_AddBurstOneOnly

;	ld l,h
;	dec l
	ld a,h
Stars_AddBurstStart2:
	pop ix
Stars_AddBurstLoop:
	
	push de
		push bc

			;ld (StarObjectMoveToAdd_Plus1-1),a
			;call Stars_AddObject
			call Stars_AddObjectFromA
		pop bc
	pop de

	ld a,ixh
	sub 2 :BurstSpacing_Plus1	;alter to reduce fire
	ret c
	cp ixl
	ret c
ifdef buildMSX_V9K	
	cp &24	:SecondStoppedStarFix_Plus1
	jr nz,Stars_AddBurstNOk	; dont add a static star!
	dec a
	Stars_AddBurstNOk:
endif
	cp &24 
	jr nz,Stars_AddBurstOk	; dont add a static star!

	dec a
Stars_AddBurstOk:
	ld ixh,a
	jr Stars_AddBurstLoop

Stars_AddObjectFromA:
	ld (StarObjectMoveToAdd_Plus1-1),a
Stars_AddObject:
	; C = Y pos, D= X pos
	ld a,0 :StarArrayFullMarker_Plus1
	or a
	ret nz	; If A>0 we cannot add any stars as the loop is full!

	ld b,0		   :StarArrayStartPoint_Plus1
	ld hl,&6969	   :StarsAddObjectStarArrayPointer_Plus2
	
	ld a,l
	add b
	ld l,a

Stars_SeekLoop:	
	ld a,(hl)	; Y check
	or a	
	jp NZ,Stars_SeekLoopNext		; if Y<>0 then this slot is in use
	ld a,b
	ld (StarArrayStartPoint_Plus1-1),a

	;found a free slot!


	ld (hl),c	;Y
	;ld c,d 
	;ld d,0
	;ld e,0 StarsAddObjectStarArraySize_Plus1
	inc h	;add hl,de

	ld (hl),d	;X

	
	inc h	;add hl,de
	ld (hl),&0  	:StarObjectMoveToAdd_Plus1	;**** THIS SHOULD BE THE MOVE - need to finish coding!
;	add hl,de

	ret
Stars_SeekLoopNext:
	inc l;inc hl
	inc b
	ld a,0 :StarsAddObjectStarArraySize_Plus1
	cp b 
	jr nz,Stars_SeekLoop
;	ld a,1 A must be non zeroo
	ld (StarArrayFullMarker_Plus1-1),a
	ret



Stars_AddObjectBatch2:
	; a= pattern (16+)
	; C = Y pos, D= X pos
	sub 16
	ld hl,StarsOneByteDirs

	add l
	ld l,a

;	push de
;		ld d,0
;		ld e,a
;		add hl,de
;	pop de
	ld a,(hl)	
	;ld (StarObjectMoveToAdd_Plus1-1),a
	jr Stars_AddObjectFromA;jr Stars_AddObject

;    16   17  18 19   20  21  22 23   24, 25 ,26, 27,28 , 29,30 , 31

