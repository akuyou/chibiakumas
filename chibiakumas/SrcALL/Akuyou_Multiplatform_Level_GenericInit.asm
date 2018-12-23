
	ifdef buildMSX
	ifdef MSXTiles
		ld a,5						;get TilePos for MSX2 tiles
		call Akuyou_VDP_CommandNum
		ld (MSX_MainTilepos_Plus2-2),hl
ifndef NO_MSX_MainTileposB
		ld (MSX_MainTileposB_Plus2-2),hl
endif
		push hl
		pop iy

		ld hl,MSXTiles					;Copy the background tiles into vram
		ld de,MSXTiles_End
		ld bc,MSXTiles_End-MSXTiles	
		ld ix,&0000
		call Akuyou_VDP_RLEProcessorFromMemory	

	endif

		ld hl,PaletteInit
		call Akuyou_VDP_SetPalette
	endif


;Load custom bullets if this level uses them
ifdef buildMSX
	ifdef MSX_BulletSprites 
		ld a,2				;VDP_RLEProcessor_GetLastY
		call Akuyou_VDP_CommandNum
		ld (CustomStarsY_Plus2-2),iy

		ld hl,MSXBullets					;Copy the background tiles into vram
		ld de,MSXBullets_End
		ld bc,MSXBullets_End-MSXBullets	
		ld ix,&0000
		call Akuyou_VDP_RLEProcessorFromMemory	
	endif
endif





	call AkuYou_Player_GetPlayerVars
	if buildCPCv+buildENTv	; Turn on CPC raster flipping if allowed

		ld a,(iy-5)
		ld hl,null
		cp 64
		jp nz,LevelInitUsingRasterFlip
		ld (DisablePaletteSwitcher_Plus2-2),hl
	LevelInitUsingRasterFlip:
		call RasterColorsSetPalette1
	endif 



	ifdef buildMSX	; Find out if we've got a V9990, and choose aproporiate MSX background render
		ld hl,Background_DrawB
		bit 0,(iy-1)
		jr z,SetBackRegular
		ld hl,MSX2V9990
	SetBackRegular:
		ld (BackgroundRender_Plus2-2),hl
	endif


	ifdef buildZXS

		di
		ld hl,ZXS_CopiedBlockStart
		ld d,h
		ld e,l

		ld bc,&FFFF-ZXS_CopiedBlockStart+1

		ld IXH,7
		ld IXL,Akuyou_LevelStart_Bank
		call Akuyou_Bankswapper_Copy
		ei
	endif


	ld hl,EventStreamArray		;Event Stream
	ld de,Event_SavedSettingsB	;Saved Settings bank 2
	call AkuYou_Event_StreamInit

	;;;;;;;;;;;;;;;;;;;;;; Restart the Music ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ifdef buildZXS
		ld a,6
		ld hl,Akuyou_Music_Restart
		call Akuyou_Bankswapper_CallHL
	else
		call Akuyou_Music_Restart
	endif
	
	call Akuyou_ScreenBuffer_Init

	ifdef buildCPC				;Must occur after Screenbuffer init - set nextline code for CPC
	;	ld (BackgroundFloodFillQuad_Minus1+1),hl
		ld (BackgroundSolidFillNextLine_Minus1+1),hl
		ifndef UseBackgroundVert
			ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
		else
			ld (BackgroundFloodFillQuadSpriteV_Minus1+1),hl
		endif
	
		ifdef UseBackgroundFloodFillQuadSpriteColumn
			ld (BackgroundFloodFillQuadSpriteColumn_Minus1+1),hl
			ld (BackgroundFloodFillQuadSpriteColumnB_Minus1+1),hl
		endif
		ifdef UseBlackout
			ld (Background_Blackout_Minus1+1),hl
		endif
	endif
	call Akuyou_Interrupt_Init	
	


