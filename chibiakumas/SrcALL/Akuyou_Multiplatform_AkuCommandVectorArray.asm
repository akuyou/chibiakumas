ifdef buildMSX_V9K	
	Aku_ParticleBurst:
		ld a,8
		ld (ParticleVmoveSize_Plus1-1),a

		ld a,d
		call V9K_ParticleBurst
	ret
endif



Aku_VectorArray:
	defw Aku_GetVectorArray		;0
ifdef buildMSX_V9K	
	defw Aku_ParticleBurst		;1
else
	defw null			;1
endif
ifdef BuildMSX 
	defw Aku_GetLZ48FileEnd		;2
else
	defw null			;2
endif


;	defw VDP_GetFreeYPos
Aku_GetVectorArray:
	ld hl,Aku_VectorArray
	ret

Aku_CommandNum:
	push hl			;
	ld hl,Aku_VectorArray
jp VectorJump_PushHlFirst


ifdef BuildMSX
Aku_GetLZ48FileEnd:
	ld hl,0000:LZ48FileEnd_Plus2
	ret
endif

