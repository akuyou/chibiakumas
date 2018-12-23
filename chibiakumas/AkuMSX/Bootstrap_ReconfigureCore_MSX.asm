ifdef buildMSX_V9K

	ld a,(CPCVer)
	bit 2,a
	jr nz, ConfigTurboR
	bit 1,a
	jr nz, ConfigWX
	jp TurboReconfigDone

	ConfigTurboR:
		ld a,1
		ld (PlayerMoveSpeedSlow2_Plus1-1),a
		ld (PlayerMoveSpeedSlow1_Plus1-1),a
		ld a,4
		ld (PlayerMoveSpeedFast_Plus1-1),a
		ld a,%00001000				
		ld (PlayerDefaultShootSpeed_Plus1-1),a
	
		ld a,0;%00001000	;%00000010	
		ld (SlowdownFreq_Plus1-1),a
	
		ld a,%11111110
		ld (SpecialMoveSlowdown_Plus1-1),a

		ld hl,&27CB	; SLAA
		ld (GradientSlowdown_Plus2-2),hl

		ld a,&25
		ld (SecondStoppedStarFix_Plus1-1),a

		ld a,&17	;RLA
		ld (BackgroundMoveSpeed_Plus1-1),a

		xor a
		ld (TwoHaltsReenable_Plus1-1),a
		ld (ParticleFallDoubleSpeed_Plus1-1),a
		ld (BackgroundSlowdownB_Plus1-1),a

		ld a,&B7
		ld (BackgroundSlowdownA_Plus1-1),a

		ld hl,&2FCB ;SRA A
		ld (MovesSlowdownB_Plus2-2),hl
		ld (MovesSlowdownA_Plus2-2),hl

		ld hl,&22CB ; SLA D
		ld (FireSpeedTweak_Plus2-2),hl


		ld a,%00001000;%00000100
		ld (Event_LevelSpeed_Plus1-1),a	; how often ticks occur

		ld hl,&3FCB ;SRLA
		ld (SpriteAnimSlowdownB_Plus2-2),hl
		ld (TimerShiftB_Plus2-2),hl
		ld (TimerShiftA_Plus2-2),hl

		ld a,%00000100 ;%00000010 
;		ld (SpriteAnimSlowdownA_Plus1-1),a
;		ld (SpriteAnimSlowdownB_Plus1-1),a
		ld (PlayerSpriteAnim_Plus1-1),a




		ld hl,&3FCB ;SRLA
		ld (SpriteAnimSlowdownB_Plus2-2),hl
		ld (SpriteAnimSlowdownC_Plus2-2),hl


		;player star speed
		ld hl,&2FCB
		ld (StarSlowdownC_Plus2-2),hl
		ld a,%00000010
		ld (SlowdownFreqC_Plus1-1),a 
		ld (TurboRCustomProgSlowdown_Plus1-1),a
		jp TurboReconfigDone

	ConfigWX:

		jp TurboReconfigDone
	TurboReconfigDone:
	endif


ifdef BuildMSX
	ld hl,&4444
	ld (StarArrayColors_Plus2-2),hl
endif


ifdef buildMSX_V9K
	ld de,ParticleArrayPointer+1
	ld hl,ParticleArrayPointer
	ld bc,256*3
	ld (hl),0
	ldir 
endif 
