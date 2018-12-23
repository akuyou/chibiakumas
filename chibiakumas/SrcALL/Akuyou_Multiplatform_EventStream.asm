

;***************************************************************************************************

;				Object Event Array

;***************************************************************************************************
Event_LevelTime equ Event_LevelTime_Plus1-1
Event_LevelSpeed equ Event_LevelSpeed_Plus1-1
Event_NextEventPointer equ Event_NextEventPointer_Plus2-2
Event_NextEventTime equ Event_NextEventTime_Plus1-1
LdAFromHLIncHL:
	ld a,(hl)
	inc hl
ret

DoMovesBackground_ScrollUp:

	ld bc,&790D	;Move Up ; DEC C  (OD)      LD a,C (79)	
	ld de,&F7FE	; CP (FE) F7 (199+24+24=247)
	push de
	ld de,&7A57		;ld a,d// ld d,a
	ld ixl,&57	;ld D,a
	ld hl,&DF0E	;ld C,199+24	;DF


	cp 3
	jr nz, DoMovesBackground_SetScroll2
DoMovesBackground_ScrollDown:
	ld c,&0C	;INC C
	jr DoMovesBackground_SetScroll2_V2
DoMovesBackground_SetScroll:	;A=Direction 0-Left 1-Right 2-Up 3-Down
	push hl
	push ix

		cp 2
		jr nc,DoMovesBackground_ScrollUp


		ld bc,&7805	;Move Left ; INC B  (05)      LD a,B (78)	
		ld de,&D0FE	; CP (FE)  D0 (160+24+24=208)
		push de
	
		ld de,&794F		;ld a,c // ld c,a

		ld ixl,&4F	;ld C,a
		ld hl,&B816	;ld D,160+24

		or a
		jr z,DoMovesBackground_SetScroll2
	
		ld c,&04	;Move Right
DoMovesBackground_SetScroll2_V2:
		ld h,&12	;Start far left

DoMovesBackground_SetScroll2:
		ld a,d
		ld (OBjectStripReprogram_Plus1-1),a
		ld a,e
		ld (OBjectStripReprogram_Plus1+1),a
		ld (DoMovesBGShift_Plus1-1),bc
		pop de
		ld (DoMovesBGShift_Plus1+1),de
		ld a,ixl
		ld (OneObjectQuick_Program),a
		ld (OneObjectQuick_Program+1),hl

	pop ix
	pop hl

ret
SetLevelTime: ; This is used for jumping around the event stream
	; Make sure level time is LOWER than the first event, otherwise run Event_GetEventsNow
	ld (Event_LevelTime),a
	ld a,(hl)
	ld (Event_NextEventTime_Plus1-1),a

	inc hl
	ld (Event_NextEventPointer_Plus2-2),hl

	ret
GetLevelTime:		; Return the current level time
	ld a,(Event_NextEventTime)
	ld b,a
	ld a,(Event_LevelTime)
	ld hl,(Event_NextEventPointer)
	dec hl
	ret






;Restart the event stream for a new level
Event_StreamInit:
	ld (Event_SavedSettings_Plus2-2),de	;Store the address of our 2nd setting buffer (1st is contained in core)
	xor a
	ld (Event_MultipleEventCount_Plus1-1),a
	call SetLevelTime

	jr Event_GetEventsNow	; process the first batch of events

Event_MoreEventsDec:			;multiple events at the same timepoint
	dec a
	ld (Event_MultipleEventCount_Plus1-1),a
	ld (Event_NextEventPointer),hl
	jr Event_GetEventsNow

;Process the event stream - the eventstream is basically the level map, rather than a
;bitmap which would waste memory, it is a bytestream based around a Time,Event structure.
; Multiple events can be at the same time, and the length of each event varies depending
;upon the event, for this reason, it is only intended that the stream is read forwards
; not backwards.
Event_Stream:
	ld a,(Timer_TicksOccured)
	and %00000100:Event_LevelSpeed_Plus1	; how often ticks occur
	ret z		; no ticks occured
Event_Stream_ForceNow:
;	call StarArrayWarp

	ld a,&0 :Event_LevelTime_Plus1
	inc a
	ld (Event_LevelTime),a
	ld b,a


Event_MoreEvents:				
	ld a,1 :Event_NextEventTime_Plus1		;The time the event should occur
	cp b
	ret nz	; event does not happen yet
Event_GetEventsNow:

	ld iy,LdAFromHLIncHL	; Set RST 6 to do our bidding
	ld hl,Event_LoadNextEvt
	push hl			;We do a dirty trick to save space, all these actions end in a RET

	ld hl,6969:Event_NextEventPointer_Plus2		; mem pointer of next byte
	ld a,(hl)
	inc hl
	ld d,a
	and %00001111
	ld b,a
	ld a,d 
	and %11110000
	rrca
	rrca
	rrca
	rrca
	push hl			;
	ld hl,Event_VectorArray
	jp VectorJump_PushHlFirst



Event_StarBust:
	ld d,(hl)	;X
	inc hl
	ld C,(hl)	;Y
	inc hl
	push hl
;	call Stars_AddToDefault
	push iy
		call Stars_AddObjectBatchDefault;Stars_AddObjectBatch
	pop iy
	pop hl
	ret ;jp Event_LoadNextEvt


;By default each time can only have ONE event, but we can use this commend to declare
;XX events will occur at this time to save memory!
Event_CoreMultipleEventsAtOneTime:
	ld a,b
	ld (Event_MultipleEventCount_Plus1-1),a
	ret;jp Event_LoadNextEvt




Event_SpriteSwitch_0101:			;Set the next sprite
	ld de,EventObjectSpriteToAdd_Plus1-1
	jr Event_CoreReprogram_ByteCopy

Event_ProgramSwitch_0001:			;Set the next program
	ld de,EventObjectProgramToAdd_Plus1-1
	jr Event_CoreReprogram_ByteCopy

Event_AnimatorSwitch_1110:
	ld de,EventObjectAnimatorToAdd_Plus1-1
	jr Event_CoreReprogram_ByteCopy
Event_SpriteSizeSwitch_1101:
	ld de,EventObjectSpriteSizeToAdd_Plus1-1
	jr Event_CoreReprogram_ByteCopy

Event_MoveSwitch_0011:				;Set the next move
	ld de,EventObjectMoveToAdd_Plus1-1
	jr Event_CoreReprogram_ByteCopy


Event_ProgramMoveLifeSwitch_0100:		;Set Prog,MoveLife
	RstSix;rst 6	; Jp (IY)
	;ld a,(hl)	;Program Type
	ld (EventObjectProgramToAdd_Plus1-1),a
	;inc hl						;Fall into Move Life code
Event_MoveLifeSwitch_0000:
	RstSix;rst 6	; Jp (IY)
	;ld a,(hl)	;Move Type
	ld (EventObjectMoveToAdd_Plus1-1),a
	;inc hl						; Fall into Life code

Event_LifeSwitch_0010:
	ld de,EventObjectLifeToAdd_Plus1-1

Event_CoreReprogram_ByteCopy:			
	RstSix;rst 6	; Jp (IY)			
	;ld a,(hl)	;read in a byte
	ld (de),a		; put it at DE
	;inc hl
	ret;jp Event_LoadNextEvt

; Reconfigure the core for custom actions this level
Event_CoreReprogram:	;1111????
	ld a,b
;	cp 16
;	ret nc;jp nc,Event_LoadNextEvt	; our array only has 6 entries
	
	push hl
	ld hl,Event_ReprogramVector
	jp VectorJump_PushHlFirst

;Powerup objects are defined by their sprite, which changes each level
; OK so I didn't think this through very well!
Event_CoreReprogram_PowerupSprites:
	RstSix;	rst 6	; Jp (IY)
	;ld a,(hl)
	ld (DroneSprite_Plus1-1),a
	;inc hl
	;ld a,(hl)
	RstSix;	rst 6	; Jp (IY)
	ld (ShootSpeedSprite_Plus1-1),a
	;inc hl
	;ld a,(hl)
	RstSix;	rst 6	; Jp (IY)
	ld (ShootPowerSprite_Plus1-1),a
	;inc hl
	;ld a,(hl)
	RstSix;	rst 6	; Jp (IY)
	ld (PointsSprite_Plus1-1),a
	ld (PointsSpriteB_Plus1-1),a
	ld (PointsSpriteC_Plus1-1),a
	;inc hl
	ret;jp Event_LoadNextEvt


Event_ReprogramObjectBurstPosition:
	ld de,BurstPosition_Plus2-2
	jr SetCustMove
Event_CoreReprogram_CustomMove1:
	ld de,LevelSpecificMove_Plus2-2
	jr SetCustMove
Event_CoreReprogram_CustomMove2:
	ld de,LevelSpecificMoveB_Plus2-2
	jr SetCustMove
Event_SmartBombSpecial:
	ld de,SmartBombSpecial_Plus2-2 		; Custom smartbomb handler - needed to wipe Omega array during final boss
	jr SetCustMove
Event_ObjectFullCustomMoves:			; Override whole move handler
	ld de,ObjectDoMovesOverride_Plus2-2
	jr SetCustMove
Event_CoreReprogram_CustomMove3:
	ld de,LevelSpecificMoveC_Plus2-2
	jr SetCustMove
Event_CoreReprogram_CustomMove4:
	ld de,LevelSpecificMoveD_Plus2-2
	jr SetCustMove
Event_CoreReprogram_AnimatorPointer:
	ld de,AnimatorPointers_Plus2-2
	jr SetCustMove
Event_CustomProgram1:
	ld de,CustomProgram1_Plus2-2
	jr SetCustMove
Event_CustomProgram2:
	ld de,CustomProgram2_Plus2-2
	jr SetCustMove
Event_CustomPlayerHitter:
	ld de,customPlayerHitter_Plus2-2
	jr SetCustMove
Event_CustomSmartBomb:
	ld de,CustomSmartBombEnemy_Plus2-2
	jr SetCustMove
SetCustMove:
	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl
	ld a,c
	ld (de),a
	inc de
	ld a,b
	ld (de),a
	ret;	jp Event_LoadNextEvt
Event_CoreReprogram_ShotToDeath:
	ld de,CustomShotToDeathCall_Plus2-2
	jr SetCustMove
Event_CoreReprogram_ObjectHitHandler:
	ld de,ObjectShotOverride_Plus2-2
	jr SetCustMove

;Event_CoreReprogram_PlusPalette			; Set background (41 byte max)
;	ld de,PlusRasterPalette
;di 
;halt ;this is deprecated
;	jr Event_CoreReprogram_DataCopy

; Program raster palette - careful - this can cause all nasty crashes if you
; do it wrong, as you have to specify bytes, offsets and loop counters,
; it's best to copy existing ones from levels and modify them
	
Event_CoreReprogram_Palette:
	;push bc
	;push de

	ld de,RasterColors_ColorArray1 :RasterColors_ColorArray1PointerB_Plus2
Event_CoreReprogram_DataCopy:
	;reads in Offset then Bytecount from (HL) and dumps to destination DE
	xor a
	push hl
		ld b,a
		ld c,(hl)	;Byte offset
		ld h,d
		ld l,e
		add hl,bc
		ld d,h
		ld e,l
	pop hl
	inc hl


	ld b,a
	ld c,(hl)	;bytecount
	inc hl

	ldir
	;pop de 
	;pop bc
	ret;jp Event_LoadNextEvt



Event_MoveSwitch:
	ld a,b
;	cp 15
;	ret nc;jp nc,Event_LoadNextEvt	; our array only has 6 entries

	push hl
	ld hl,Event_MoveVector
	jp VectorJump_PushHlFirst



Event_LoadLastAddedObjectToAddress_1010:		
; Used to remember boss objects and apply custom animation etc by hacking the 
; object array.
	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl
	push hl
		ld h,b
		ld l,c

		ld bc, &6969:Objects_LastAdded_Plus2

		ld (hl),c
		inc hl
		ld (hl),b	
	pop hl
	ret;jp Event_LoadNextEvt

; call a function - be very careful what you do, as registers must be pretty
; much untouched otherwise a crash will occur on return. it's best to set a flag
; and do some action in your level loop, as that won't corrupt any registers.
Event_Call_1001:
	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl
	call CallBC
	ret;jp Event_LoadNextEvt


Event_ClearPowerups:		; used at the start of each level to take the users powerups
	call ResetPowerup
	ret;jp Event_LoadNextEvt
CallBC:
	push bc
	ret
	
; alter stream time 
Event_ChangeStreamTime_1000:
	;push bc

	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl
	ld a,(hl)

	ld h,b
	ld l,c	

	call SetLevelTime

	pop hl ; we didn't use up the Event_LoadNextEvt on the stack
	jp Event_MoreEvents

; Add to the foreground (top of the object array)
Event_AddFront_0110:	
	ld a,1
	jr Event_AddXX
	;ld (Event_AddObject_StartOfLoop_Plus1-1),a
	;ret;jp Event_LoadNextEvt

; Add to the background (bottom of the object array)
Event_AddBack_0111:
	xor a

Event_AddXX:
	ld (ObjectAddToForeBack_Plus1-1),a
	ret;jp Event_LoadNextEvt

; Change time between events, used on water level when waterlevel changes - it was
; too slow by default
Event_ChangeStreamSpeed_1100:
	RstSix;	rst 6	; Jp (IY)
	ld (Event_LevelSpeed_Plus1-1),a
	ret;jp Event_LoadNextEvt

; we don't have a tile array - this does spikes in stage 7 and 8 - this can work
; horiz or vert depending on scroll
Event_ObjStrip:
	ld d,(hl)	;X
	inc hl
	ld C,(hl)	;Y
	inc hl
	ld E,(hl)	;S space
	inc hl
	;fall into next event
Event_ObjStrip_Next:
	RstSix;	rst 6	; Jp (IY)
	;ld a,(hl)	; sprnum
	;inc hl
	ld (EventObjectSpriteToAdd_Plus1-1),a
	
	push bc
	push de
		call EventoneObjectStrip
	pop de
	pop bc

	ld a,c	:OBjectStripReprogram_Plus1
	add e
	ld c,a
	
	djnz Event_ObjStrip_Next
	ret;jp Event_LoadNextEvt

;
Event_ObjColumn:
	ld d,(hl)	;X
	ld e,b
	inc hl
    Event_ObjColumn_Next:
	RstSix;	rst 6	; Jp (IY)
	;ld a,(hl)	; sprnum
	;inc hl
	ld (EventObjectSpriteToAdd_Plus1-1),a

	push de
	call EventoneObjectColumn
	pop de
	dec e
	jr nz,Event_ObjColumn_Next
	ret;jp Event_LoadNextEvt

Event_MultiObj:		; Type 16 - multiple objects
	push bc
	call EventoneObject
	pop bc
	djnz Event_MultiObj
	ret;jp Event_LoadNextEvt

Event_OneObj:		; Type 0 - one Obj
	ld a,b	

	cp 1
	jr z,Event_OneObjYOnly
	cp 14
	jr NC,Event_OneObjectBurst	;>=14
	or a
	jr nz,Event_OneObjQuick 
	jr EventoneObject
Event_OneObjectBurst:
;Burst Object
	;ld a,b
	ld bc,&0000 :BurstPosition_Plus2
	ld d,b
;	ld b,a
	jr EventoneObjectStrip

	;ret;jr Event_LoadNextEvt
	
Event_OneObjYOnly:		; Type 1 - Read in Y and dump the same sprite to far right
	ld c,(hl)	;Y
	inc hl
	jr Event_OneObjQuick_GO

Event_OneObjQuick:	; one sprite, same as last time Y * 16 (Y 2-13)
	rla
	rla
	rla
	rla
	sub 8

OneObjectQuick_Program:
	ld C,a		

Event_OneObjQuick_GO:
	ld D,160+24	
	jr EventoneObjectStrip

; Read in the next object
Event_LoadNextEvt:
	ld a,0 :Event_MultipleEventCount_Plus1
	or a
	jp nz,Event_MoreEventsDec		; there are multiple events at this point
	RstSix;	rst 6	; Jp (IY)
	;ld a,(hl)
	;inc hl
	ld (Event_NextEventTime),a
	ld (Event_NextEventPointer),hl
	ld a,(Event_LevelTime)
	ld b,a
	jp Event_MoreEvents
EventoneObject:
	RstSix;	rst 6	; Jp (IY)
	;ld a,(hl)	; sprnum
	ld (EventObjectSpriteToAdd_Plus1-1),a
	;inc hl
	ld d,(hl)	;X
	inc hl
    EventoneObjectColumn:
	ld c,(hl)	;Y
	inc hl
    EventoneObjectStrip:
	;look for a space in the object array
	push hl
	call Event_AddObject	
	pop hl
	ret

Event_AddObject:
	ld hl,Event_AddObject_MoveDirection_Plus1-1
	ld a,0	:ObjectAddToForeBack_Plus1
	or a
	jr z,Event_AddObjectBack

	;add object to the front
	ld a,&23	; INC HL
	ld (hl),a
	xor a	:BackgroundNoSpritesTurbo_Plus1
	jr Event_AddObjectStart

Event_AddObjectBack:
	ld a,&2B	; Dec HL

	ld (hl),a
	ld a,ObjectArraySize ;(ObjectArray_Size)
	dec a

Event_AddObjectStart:
;	ld (Event_AddObject_StartOfLoop_Plus1-1),a
	; D=X C=Y

	ld b,ObjectArraySize;a
	ld hl,ObjectArrayPointer;(ObjectArrayAddress)
;	ld a,l
;	add 0		Event_AddObject_StartOfLoop_Plus1
	add l		; add l to a (start of loop)
	ld l,a

Event_Objectloop:	
	ld a,(hl)	; Y check
	or a	
	jp NZ,Event_ObjectLoopNext

	;found a free slot!
	ld (Objects_LastAdded_Plus2-2),hl

ifndef buildZXS
	ld (hl),c	;Y
else
	ld a,c
	and %11111000
	ld (hl),a
	;align Y to 8 pixel block to avoid color problems
endif 
;	ld c,d
	;ld de,0000ObjectArray_Size_Plus2
	;add hl,de
	inc h;
	ld (hl),d	;X

	
	inc h;	add hl,de
	ld (hl),&0  	:EventObjectMoveToAdd_Plus1	;Move
	inc h;	add hl,de
	ld (hl),&0	:EventObjectSpriteToAdd_Plus1	;sprite


	set 6,l ;inc h;	add hl,de

	ld a,&0	:EventObjectLifeToAdd_Plus1 ; life
	push af
		ld a,(LivePlayers)
		dec a
		jr z,AddObjectOnePlayer
	pop af
	cp %11000000
	jr c,AddObjectTwoPlayer
	cp 255	;lifCustom
	jr z,AddObjectTwoPlayer
	push bc
		ld b,a
		sla a

		or %11000000
		cp b
	pop bc
	jr NC,AddObjectTwoPlayer
	ld a,%11111110
	jr AddObjectTwoPlayer

AddObjectOnePlayer:
	pop af
AddObjectTwoPlayer:
	ld (hl),a
	dec h;inc h;	add hl,de
	ld (hl),&0	:EventObjectProgramToAdd_Plus1 ; Program code
	dec h;inc h;	add hl,de
	ld (hl),&0	:EventObjectSpriteSizeToAdd_Plus1 ; Sprite size for collisions
	dec h;inc h;	add hl,de
	ld (hl),&0	:EventObjectAnimatorToAdd_Plus1 ; Animator
	ret
Event_ObjectLoopNext:
	;inc l
	inc hl		:Event_AddObject_MoveDirection_Plus1


	djnz,Event_Objectloop
	ret


Event_CoreSaveLoadSettings2: ;     1001XXXX Save/Load object settings XXXX bank (0-15 = load . 16 = Save (to bank marked by next byte))
	push hl
		ld hl,&6969 :Event_SavedSettings_Plus2
	jr Event_CoreSaveLoadSettingsStart
Event_CoreSaveLoadSettings: ;     1001XXXX Save/Load object settings XXXX bank (0-15 = load . 16 = Save (to bank marked by next byte))
	push hl
		ld hl,Event_SavedSettings ;Event_SavedSettings_Plus2

Event_CoreSaveLoadSettingsStart: ;     1001XXXX Save/Load object settings XXXX bank (0-15 = load . 16 = Save (to bank marked by next byte))
		ld (Event_SavedSettingsFinal_Plus2-2),hl
	pop hl
	ld a,d 
	and %00001111	; bank no
	cp  %00001111
	jr nz,Event_CoreSaveLoadSettings_Load1	;15 means save
	RstSix;	rst 6	; Jp (IY)
	;ld a,(hl)	;Bank no is next byte when saving
	;inc hl
	jr Event_CoreSaveLoadSettings_Part2
Event_CoreSaveLoadSettings_Load1:
	ld d,b
Event_CoreSaveLoadSettings_Part2:
	push hl
		call SettingsGetLocation		
		bit 7,d		; This will only be 1 if we are saving
		jr nz,Event_CoreSaveLoadSettings_Save ;----1--- = save
Event_CoreSaveLoadSettings_Load:
		Call DoSettingsLoad
		;inc hl
		jr Event_CoreSaveLoadSettings_Done
SettingsGetLocation:
		add a
		add a	; 4 bytes per bank
		add a	; 8 bytes per bank
;		ld b,0
;		ld c,a
		ld hl,6969 :Event_SavedSettingsFinal_Plus2
;		add hl,bc
		add l
		ld l,a
ret


DoSettingsLoad:
	RstSix;		rst 6	; Jp (IY)
		ld (EventObjectProgramToAdd_Plus1-1),a
	RstSix;		rst 6	; Jp (IY)
		ld (EventObjectMoveToAdd_Plus1-1),a
	RstSix;		rst 6	; Jp (IY)
		ld (EventObjectLifeToAdd_Plus1-1),a
	RstSix;		rst 6	; Jp (IY)
		ld (EventObjectSpriteToAdd_Plus1-1),a
	RstSix;		rst 6	; Jp (IY)
		ld (EventObjectSpriteSizeToAdd_Plus1-1),a
	RstSix;		rst 6	; Jp (IY)
		ld (EventObjectAnimatorToAdd_Plus1-1),a
	RstSix;		rst 6	; Jp (IY)
		ld (ObjectAddToForeBack_Plus1-1),a
ret

Event_CoreSaveLoadSettings_Save:
		ld a,(EventObjectProgramToAdd_Plus1-1)
		ld (hl),a
		inc hl

		ld a,(EventObjectMoveToAdd_Plus1-1)
		ld (hl),a
		inc hl

		ld a,(EventObjectLifeToAdd_Plus1-1)
		ld (hl),a
		inc hl

		ld a,(EventObjectSpriteToAdd_Plus1-1)
		ld (hl),a
		inc hl

		ld a,(EventObjectSpriteSizeToAdd_Plus1-1)
		ld (hl),a
		inc hl

		ld a,(EventObjectAnimatorToAdd_Plus1-1)
		ld (hl),a
		inc hl

		ld a,(ObjectAddToForeBack_Plus1-1)
		ld (hl),a
		;inc hl

Event_CoreSaveLoadSettings_Done:
	pop hl	;reload the stream pointer
	ret;jp Event_LoadNextEvt






; --------------------------------------------------

; Reset Powerup

; --------------------------------------------------
ResetPowerup:				; used by levelcode to take our bonuses 
	push iy
		ld iy,Player_Array
		call ResetPlayerPowerup
		ld iy,Player_Array2
		call ResetPlayerPowerup
	pop iy
ret
ResetPlayerPowerup:
		;ld a,(iy+4)
		;and %11100111
		ld (iy+4),0
ifdef BuildCPC
		ld a,&06
		ld (PlayerStarColor_Plus1-1),a
endif
ifdef BuildMSX
		ld a,&77
		ld (PlayerStarColor_Plus1-1),a
endif
		xor a
		ld (iy+14),a	;(PlayerShootPower_Plus1
		ld a,%00000100
		ld (iy+11),a ;ld (PlayerShootSpeed_Plus1-1),a
ret