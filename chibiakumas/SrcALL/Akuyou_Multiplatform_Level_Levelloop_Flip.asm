
	call Akuyou_ScreenBuffer_Flip
ifdef buildCPC
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

;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl

endif 



ifdef buildZXS
	ei
	xor a
	call Akuyou_INT_Force
endif