BuildLevel equ 1	;We're building a level - this tells the 'Build.asm' not to build the whole game
	Read "..\Aku\Build.asm"
	read "Eventstreamdefinitions.asm"	;Level event stream actions
	read "CoreDefs.asm"			;Core function definitions.
	
	nolist

ZXS_CopiedBlockStart equ &F300
NoV9kBack equ 1
UseBackgroundHoriz equ 2 ;1 for h and V
UseBackgroundVert equ 2 ;1 for h and V
UseBackgroundSurround equ 2 ;1 for h and V
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				 Name of the file we're saving to

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	ifdef buildZXS
		write "..\BldZX\Level98.bin"
	endif 
	ifdef buildMSX
		write "..\ResMSX\T98-SC1.D01"
	endif
	ifdef buildENT
		write "..\BldENT\T98-SC1.D01"
	endif
	ifdef BuildCPC 
		write direct	"T98-SC1.D01"		;Build straight to the disk on the CPC
	endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;		 Sprite data must be at top of level code block (also MSX2 tiles)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	org Akuyou_LevelStart
FileBeginLevel:
	if buildCPCv+buildENTv
		incbin "..\ResCPC\LEVEL98.SPR"		;The ENT and CPC share sprites
	endif
	ifdef buildZXS
		incbin "..\ResZX\LEVEL98.SPR"		;Speccy format sprites
	endif
	ifdef buildMSX
		incbin "..\ResMSX\LEVEL98.MAP"		;Map file of the sprites on the mSX (Sprite locations in vram)
	endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;			Animators - these handle snazzy movement and sprite changes

;			the TC-Singlelevel code has 4 sets, one each for U D L R scrolling 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; Right Animators



AnimatorPointersR:
	defw Animator1DataR	
	defw Animator2DataR	
	defw Animator3DataR	
	defw Animator4DataR	
	defw Animator5DataR	
	defw Animator6DataR	
	defw Animator7DataR	
	defw Animator8DataR	
	defw Animator9_PowerUpR	
	defw Animator10_Boss
	defw Animator11_MultiDir
Animator1DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&1B,0,0		
	defb anmMove,&1B,0,0
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&2B,0,0		
	defb anmMove,&2B,0,0
	defb anmLoop 

Animator2DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&1A,0,0		
	defb anmMove,&1C,0,0
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&2A,0,0		
	defb anmMove,&2C,0,0
	defb anmLoop 

Animator3DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&22,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&22,0,0		
	defb anmLoop 
Animator4DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&21,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&1D,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&21,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&2D,0,0		
	defb anmLoop 
Animator5DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&23,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&23,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&24,0,0		
	defb anmLoop 
Animator6DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&21,0,0		
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&1D,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&23,0,0
	defb anmMove,&21,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&2D,0,0		
	defb anmLoop
Animator7DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&1B,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0		
	defb anmMove,&2B,0,0
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmLoop  
Animator8DataR:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&22,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&22,0,0		
	defb anmLoop 
Animator9_PowerUpR:
	defb %00000001		;Anim Freq
	defb anmMove,&24,0,0
	defb anmMove,&23,0,0
	defb anmMove,&24,0,0
	defb anmMove,&23,0,0
	defb anmLoop 
Animator10_Boss:
	defb %00000100		;Anim Freq
	defb anmMove,&1B,0,0
	defb anmMove,&23,0,0
	defb anmMove,&1B,0,0
	defb anmMove,&23,0,0
	defb anmMove,&1B,0,0
	defb anmMove,&23,0,0
	defb anmMove,&2B,0,0
	defb anmMove,&23,0,0
	defb anmMove,&2B,0,0
	defb anmMove,&23,0,0
	defb anmMove,&2B,0,0
	defb anmMove,&23,0,0
	defb anmLoop 

Animator11_MultiDir:
	defb %00000010		;Anim Freq
;	defb anmProgram,prgFireMid2+fireSingleNorthEast,0,0		
;	defb anmProgram,prgFireMid2+fireSingleEast,0,0		
;	defb anmProgram,prgFireMid2+fireSingleSouthEast,0,0		
;	defb anmProgram,prgFireMid2+fireSingleSouth,0,0		
;	defb anmProgram,prgFireMid2+fireSingleSouthWest,0,0		
;	defb anmProgram,prgFireMid2+fireSingleWest,0,0		
;	defb anmProgram,prgFireMid2+fireSingleNorthWest,0,0		
;	defb anmProgram,prgFireMid2+fireSingleNorth,0,0		




	defb anmProgram,prgFireFast+fireSingleNorthEast,0,0		
	defb anmProgram,prgFireFast+fireSingleSouthWest,0,0		
	defb anmProgram,prgFireFast+fireSingleEast,0,0		
	defb anmProgram,prgFireFast+fireSingleWest,0,0		
	defb anmProgram,prgFireFast+fireSingleSouthEast,0,0		
	defb anmProgram,prgFireFast+fireSingleNorthWest,0,0		
	defb anmProgram,prgFireFast+fireSingleSouth,0,0		
	defb anmProgram,prgFireFast+fireSingleNorth,0,0		
	defb anmProgram,prgFireFast+fireSingleSouthWest,0,0		
	defb anmProgram,prgFireFast+fireSingleNorthEast,0,0		
	defb anmProgram,prgFireFast+fireSingleWest,0,0		
	defb anmProgram,prgFireFast+fireSingleEast,0,0		
	defb anmProgram,prgFireFast+fireSingleNorthWest,0,0		
	defb anmProgram,prgFireFast+fireSingleSouthEast,0,0		
	defb anmProgram,prgFireFast+fireSingleNorth,0,0		
	defb anmProgram,prgFireFast+fireSingleSouth,0,0		
	defb anmLoop 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; Down Animators

AnimatorPointersD:
	defw Animator1DataD
	defw Animator2DataD
	defw Animator3DataD
	defw Animator4DataD
	defw Animator5DataD
	defw Animator6DataD
	defw Animator7DataD
	defw Animator8DataD
	defw Animator9_PowerUpD
	defw Animator10_Boss
	defw Animator11_MultiDir
Animator1DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0		
	defb anmMove,&1B,0,0		
	defb anmMove,&1B,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0		
	defb anmMove,&1D,0,0		
	defb anmMove,&1D,0,0
	defb anmLoop 

Animator2DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&15,0,0		
	defb anmMove,&25,0,0
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&13,0,0		
	defb anmMove,&23,0,0
	defb anmLoop 

Animator3DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&14,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&14,0,0		
	defb anmLoop 
Animator4DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&0C,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&22,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&0C,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&2B,0,0		
	defb anmLoop 
Animator5DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&1C,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&1C,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&24,0,0		
	defb anmLoop 
Animator6DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&0C,0,0		
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&2D,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&1C,0,0
	defb anmMove,&0C,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&2B,0,0		
	defb anmLoop
Animator7DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&1D,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0		
	defb anmMove,&1B,0,0
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmLoop  
Animator8DataD:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&14,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&14,0,0		
	defb anmLoop 
Animator9_PowerUpD:
	defb %00000001		;Anim Freq
	defb anmMove,&24,0,0
	defb anmMove,&1C,0,0
	defb anmMove,&24,0,0
	defb anmMove,&1C,0,0
	defb anmLoop 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; Up Animators

AnimatorPointersU:
	defw Animator1DataU
	defw Animator2DataU
	defw Animator3DataU
	defw Animator4DataU
	defw Animator5DataU
	defw Animator6DataU
	defw Animator7DataU
	defw Animator8DataU
	defw Animator9_PowerUpU
	defw Animator10_Boss
	defw Animator11_MultiDir
Animator1DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleSouth,0,0		
	defb anmMove,&2B,0,0		
	defb anmMove,&2B,0,0
	defb anmProgram,prgFireSnail+fireSingleSouth,0,0		
	defb anmMove,&2D,0,0		
	defb anmMove,&2D,0,0
	defb anmLoop 

Animator2DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&35,0,0		
	defb anmMove,&25,0,0
	defb anmProgram,prgFireSnail+fireSingleWest,0,0		
	defb anmMove,&33,0,0		
	defb anmMove,&23,0,0
	defb anmLoop 

Animator3DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&34,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&34,0,0		
	defb anmLoop 
Animator4DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&3C,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&1B,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&3C,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&1D,0,0		
	defb anmLoop 
Animator5DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&2C,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&2C,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&24,0,0		
	defb anmLoop 
Animator6DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&3C,0,0		
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&1B,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&23,0,0
	defb anmMove,&3C,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&1D,0,0		
	defb anmLoop
Animator7DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleSouth,0,0	
	defb anmMove,&2B,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleSouth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleSouth,0,0		
	defb anmMove,&2D,0,0
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSnail+fireSingleSouth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmLoop  
Animator8DataU:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleSouthEast,0,0		
	defb anmMove,&34,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&34,0,0		
	defb anmLoop 
Animator9_PowerUpU:
	defb %00000001		;Anim Freq
	defb anmMove,&24,0,0
	defb anmMove,&2C,0,0
	defb anmMove,&24,0,0
	defb anmMove,&2C,0,0
	defb anmLoop 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; Left Animators

AnimatorPointersL:
	defw Animator1DataL
	defw Animator2DataL
	defw Animator3DataL
	defw Animator4DataL
	defw Animator5DataL
	defw Animator6DataL
	defw Animator7DataL
	defw Animator8DataL
	defw Animator9_PowerUpL
	defw Animator10_Boss
	defw Animator11_MultiDir
Animator1DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleEast,0,0		
	defb anmMove,&1D,0,0		
	defb anmMove,&1D,0,0
	defb anmProgram,prgFireSnail+fireSingleEast,0,0		
	defb anmMove,&2D,0,0		
	defb anmMove,&2D,0,0
	defb anmLoop 

Animator2DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleEast,0,0		
	defb anmMove,&1E,0,0		
	defb anmMove,&1C,0,0
	defb anmProgram,prgFireSnail+fireSingleEast,0,0		
	defb anmMove,&2E,0,0		
	defb anmMove,&2C,0,0
	defb anmLoop 

Animator3DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&26,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&26,0,0		
	defb anmLoop 
Animator4DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&27,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&1B,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&27,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&2B,0,0		
	defb anmLoop 
Animator5DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorth,0,0		
	defb anmMove,&25,0,0		
	defb anmProgram,prgFireSlow+fireSingleWest,0,0		
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouth,0,0		
	defb anmMove,&25,0,0		
	defb anmProgram,prgFireSlow+fireSingleEast,0,0		
	defb anmMove,&24,0,0		
	defb anmLoop 
Animator6DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&27,0,0		
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&1D,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&23,0,0
	defb anmMove,&27,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthEast,0,0		
	defb anmMove,&24,0,0
	defb anmMove,&2D,0,0		
	defb anmLoop
Animator7DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00001000		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&1D,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0		
	defb anmMove,&2D,0,0
	defb anmMove,&24,0,0		
	defb anmProgram,prgFireSnail+fireSingleNorth,0,0	
	defb anmMove,&24,0,0
	defb anmMove,&24,0,0
	defb anmLoop  
Animator8DataL:
	; First byte is the 'Tick map' which defines when the animation should update
	defb %00000100		;Anim Freq
	; all remaining bytes are anim frames in the form Command-Var-Var-Var
	defb anmProgram,prgFireSlow+fireSingleNorthWest,0,0		
	defb anmMove,&26,0,0		
	defb anmProgram,prgFireSlow+fireSingleSouthWest,0,0		
	defb anmMove,&26,0,0		
	defb anmLoop 
Animator9_PowerUpL:
	defb %00000001		;Anim Freq
	defb anmMove,&24,0,0
	defb anmMove,&25,0,0
	defb anmMove,&24,0,0
	defb anmMove,&25,0,0
	defb anmLoop 

Animator9_PowerUp:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Data Allocations - Don't mess with these!
;				These are used by the core, but there was no ram left for them!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Event_SavedSettingsB:	
	defs 128,&00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					EVENT STREAM (level layout)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EventStreamArray:

	defb 0,evtCallAddress			;Call a memory location
	defw	SetScrollRight			;Initialise the scrolling direction

	defb 0,evtSetAnimatorPointers
	defw	AnimatorPointersR		;Initilise the animators



defb 0,evtReprogram_PowerUpSprites,128+11,128+12,128+13,128+10	; Define powerup sprites+ Coin

;Background (slow)	
defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000001,0	; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,0					; Save Object settings to Bank 0

;Background (faster)
defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000010,0	; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,1					; Save Object settings to Bank 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Define Enemies

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Shard Attacker
defb 0,evtMultipleCommands+5				; 5 commands at the same timepoint
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1	; Program & Move will be defined by animator... life may also be changed by wave.
defb 	evtSetSprite,TwoFrameSprite+	14		; Animation uses 2 frames - Sprite 14
defb 	evtSetAnimator,1				; Use animator No 1 (0= no animator)
defb 	evtAddToForeground				; Sprite is in the foreground 
defb 	evtSettingsBank_Save,2				; Save Object settings to Bank 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Globules
defb 0,evtMultipleCommands+5				
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1	
defb 	evtSetSprite,TwoFrameSprite+	15		
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,3		

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Skelibird
defb 0,evtMultipleCommands+5			
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1	
defb 	evtSetSprite,TwoFrameSprite+	16	
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,4		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BatGob
defb 0,evtMultipleCommands+5			
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1
defb 	evtSetSprite,TwoFrameSprite+	17		
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,5			

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Electrodes
defb 0,evtMultipleCommands+5				
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+2	
defb 	evtSetSprite,TwoFrameSprite+	18	
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,6			

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Noize Cloud
defb 0,evtMultipleCommands+5			
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1	
defb 	evtSetSprite,TwoFrameSprite+	19		
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,7			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GanKyuu
defb 0,evtMultipleCommands+5		
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+3
defb 	evtSetSprite,TwoFrameSprite+	20	
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,8		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; HeliMuncher
defb 0,evtMultipleCommands+5		
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1	
defb 	evtSetSprite,TwoFrameSprite+	21	
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,9		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PowerUp
defb 0,evtMultipleCommands+5			
defb 	evtSetProgMoveLife,3,&22,lifDeadly+63	
defb 	evtSetSprite,TwoFrameSprite+	11			
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,10			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Electric Balls!
defb 0,evtMultipleCommands+6		
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+2	
defb 	evtSetSprite,TwoFrameSprite+	11		
defb 	evtSetAnimator,11
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,11		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mouthers
defb 0,evtMultipleCommands+6			
defb 	evtSetProgMoveLife ,prgNothing,&24,lifEnemy+1
defb 	evtSetSprite,TwoFrameSprite+	26	
defb 	evtSetAnimator,11
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,12	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Fireball
defb 0,evtMultipleCommands+6			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&72,lifEnemy+1	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+	27			; Sprite 1 Frame animater
defb 	evtSetAnimator,0
defb 	evtSetObjectSize,16
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,13				; Save Object settings to Bank 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Boss (Satoki)
defb 0,evtMultipleCommands+6			; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+15	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb 	evtSetSprite,TwoFrameSprite+	25			; Sprite 1 Frame animater
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetObjectSize,64
defb 	evtSettingsBank_Save,14				; Save Object settings to Bank 2



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ifdef buildZXS
	defb 0,evtCallAddress
	defw	 setSpectrumFadeBlue	;Set Fade to blue (dark) on the speccy
endif

StartNewWave:

	defb 1,evtCallAddress			;Call a memory location
	defw	NewWave				;Decide what wave to show

defb 2,evtJumpToNewTime			; followed by address of next command (Word) and new time (byte)... new time must be before first in the new address
	dw FadeIn	:FadeInCommand_Plus2	;jump to the correct fade command
	db 0




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FadeIn:
FadeStartPoint equ 1	;Start of fade point
			; Fade lasts two timers - ends FadeStartPoint+2





ifdef buildZXS						;Speccy fade procedure
	defb FadeStartPoint+0,evtCallAddress
	defw	 setSpectrumFadeBlue

	defb FadeStartPoint+1,evtCallAddress
	defw	 SetSpectrumFadeDark

	defb FadeStartPoint+2,evtCallAddress
	defw	 SetSpectrumFadeOff
endif


ifdef buildMSX
	defb FadeStartPoint+1,evtCallAddress
	defw	 EnableFader				;Start the MSX fader
endif

if BuildCPCv+BuildENTv
	defb FadeStartPoint+1,evtCallAddress
	defw	 EnablePlusPalette			;Start the CPC+/EP128 fader



	;These are the non plus colors - note, the EP128 has them too for compatibility
	;BLUE COLORS - 6128 
	defb FadeStartPoint+1,evtMultipleCommands+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1		;switches
	defb 1		;delay
	defb &54,&54,&44,&40		;These are hardware color numbers

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&44,&40	

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&44,&40		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40			


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				REAL LEVEL PALETTE (Change this if you want to change colors)

;				In the TC level code, color 1 is self modified, but colors 0 and 2,3 are constant
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	defb FadeStartPoint+2,evtMultipleCommands+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1	;Switches
	defb 1	;delay
CPCPal1:defb &54,&55,&4A,&4B		;These are hardware color numbers


	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 1	;delay			
CPCPal2:defb &54,&5D,&59,&4B


	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 1	;delay			
CPCPal3:defb &54,&5D,&59,&4B


	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 1	;delay			
CPCPal4:defb &54,&5D,&59,&4B
		

; 	*** 	Turn on the second palette (Flipped every other raster redraw on CPC ***
	defb FadeStartPoint+2,evtCallAddress
	defw RasterColorsStartPalleteFlip  ;This isn't actually used by this level! (just here for compatibility)

endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;							End of fade in block

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	This is the set of direction changes, first we execute a command which will queue a new scroll change 
; 	(it happens during the main loop, where register protection isn't needed - here is too risky)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; Time	,No of commands at thistime
;defb 10		,evtMultipleCommands+3
;;;;;	Disable Animators
;defb 	evtSetAnimator ,0

;;;;;	evtSetProgMoveLife ,Firemode	,Move Direction	,Enemy Life
;defb 	evtSetProgMoveLife ,prgNothing	,%10001001		,lifEnemy+1	

;;;;; 	evtSingleSprite,sprite number		,Xpos	,Ypos
;defb 	evtSingleSprite,TwoFrameSprite+15	,24+80	,24+150

defb 15,evtJumpToNewTime
	dw NewEnemyBatch
	db 28


ESDirectionRight:
	defb 1,evtCallAddress			
	defw	SetScrollRight

	defb 1,evtJumpToNewTime
	dw FadeIn
	db 0


ESDirectionUp:
	defb 1,evtCallAddress			
	defw	SetScrollUp

	defb 1,evtJumpToNewTime
	dw FadeIn
	db 0


ESDirectionLeft:
	defb 1,evtCallAddress			
	defw	SetScrollLeft

	defb 1,evtJumpToNewTime
	dw FadeIn
	db 0


ESDirectionDown:
	defb 1,evtCallAddress			
	defw	SetScrollDown

	defb 1,evtJumpToNewTime
	dw FadeIn
	db 0


ESDirectionCenter:
	defb 1,evtCallAddress			
	defw	SetScrollCenter

	defb 1,evtJumpToNewTime
	dw FadeIn
	db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Wave Batch definitions

	;Batches should start at time 10

	;Batches can be any length

	;batches should always end with a call to "NewEnemyBatch" with the new time as 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;			 These will start a direction change
;	 They are formated in the same way as a 'wave section' - allowing for midwave direction changes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetDirU:				
defb 10,evtCallAddress			;Call a memory location
	defw	DoSetDirU

defb 10,evtJumpToNewTime
	dw NewEnemyBatch
	db 28


SetDirD:
defb 10,evtCallAddress			;Call a memory location
	defw	DoSetDirD
defb 10,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

SetDirL:
defb 10,evtCallAddress			;Call a memory location
	defw	DoSetDirL
defb 10,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

SetDirR:
defb 10,evtCallAddress			;Call a memory location
	defw	DoSetDirR
defb 10,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;			Below are the four 'object direction changes'
;These will reprogram the Animators and event stream so new objects will appear in the correct place
;and Movement (caused by animators) will also change... notice this does not change the background 
;gradient


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DoSetDirU:
	push hl
	push bc
	push de
		ld a,3
		call Akuyou_Background_SetScroll		;This command no longer changes gradient direction (It used to a long time ago!)

		ld a,6
		ld de,AnimatorPointersU
		call Akuyou_Aku_CommandNum	;Set Animators
	pop de
	pop bc
	pop hl
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DoSetDirD:
	push hl
	push bc
	push de
		ld a,4
		call Akuyou_Background_SetScroll

		ld a,6
		ld de,AnimatorPointersD
		call Akuyou_Aku_CommandNum	;Set Animators
	pop de
	pop bc
	pop hl
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DoSetDirL:
	push hl
	push bc
	push de
		ld a,1
		call Akuyou_Background_SetScroll

		ld a,6
		ld de,AnimatorPointersL
		call Akuyou_Aku_CommandNum	;Set Animators
	pop de
	pop bc
	pop hl
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DoSetDirR:
	push hl
	push bc
	push de
		ld a,0
		call Akuyou_Background_SetScroll

		ld a,6
		ld de,AnimatorPointersR
		call Akuyou_Aku_CommandNum	;Set Animators
	pop de
	pop bc
	pop hl
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SetStrengthX2:				;This will double the strength of the enemies (so make sure they are weak by default
defb 10,evtCallAddress			
	defw	DoSetStrength

defb 10,evtJumpToNewTime
	dw NewEnemyBatch
	db 28


DoSetStrength:

	push bc	
	push hl

		ld b,13
		ld hl,8*2+Event_SavedSettings+2	;We're modifying the enemy definitions in the core ram - this is cheeky!
DoSetStrengthAgain:	
		ld a,(hl)
		and %11000000		;The top two bits have special purposes, so leave them intact
		ld c,a
		ld a,(hl)
		and %00011111		;these six bits are the actual strength
		cp 8
		jr c,DoSetStrengthLow
		rlca			;Double the strenght
		or  %00000001		;If the strength is over 8, start setting the lowest bit to 1... eventually the strength is 63
		jr DoSetStrengthDone
DoSetStrengthLow:
		rlca			;Double the strength (less than 8)
DoSetStrengthDone:
		or c			;Bring back the top two bits
		ld (hl),a		;update the strength
		ld a,8
		add l
		ld l,a
		djnz DoSetStrengthAgain
	pop hl	
	pop bc

	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	The 'Set Color Cycle' commands will rotate the RGB background definitons, to make it look like we have 3x 
;					the number of waves we actually do.	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SetColorCycle:
defb 10,evtCallAddress			
	defw	DoSetColorCycle

defb 10,evtJumpToNewTime
	dw NewEnemyBatch
	db 28


DoSetColorCycle:
	push hl
		ld a,0 :CycleNum_Plus1
		inc a
		cp 3
		jr c,DoSetColorCycleValOK
		xor a
DoSetColorCycleValOK:
		ld (CycleNum_Plus1-1),a
		ld hl,DoTwoShifts
		cp 2
		jr z,DoSetColorCycleReady
		ld hl,DoOneShift
		cp 1
		jr z,DoSetColorCycleReady
		ld hl,Null
DoSetColorCycleReady:		
		ld (ShiftCommand_Plus2-2),hl
	pop hl
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	The wave has ended prematurely, Tragical Chase needs a marker (255 at Player2+14) to tell the engine the level ended

; 	This is used for waves that the player does not need to reach the debt target to complete

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EndWave:				

defb 10,evtCallAddress			;Call a memory location
	defw	DoForceEnd

defb 50,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

DoForceEnd
	push hl
	push iy
ifdef CompileTC
	call AkuYou_Player_GetPlayerVars
	ld a,255
	ld (iy+14+Akuyou_PlayerSeparator),a
else
	ld hl,LevelTimeFinish	
	ld (LevelSpecial_Plus2-2),hl
endif
	pop iy
	pop hl
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	Powerups - The game engine recognises powerups by their sprite number - they were defined at the start of the event stream

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


PowerUpDrone:	;Batch starts at time 10

;	Drone Powerup
defb 10,evtMultipleCommands+3			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+10			; Load Settings from bank 10
defb 	evtSetSprite,TwoFrameSprite+	11	; Sprite 11
defb 	evtSingleSprite+7			; Sprite at edge of screen - position 7 (Middle)

defb 18,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PowerUpRate:	;Batch starts at time 10

;	Drone Powerup
defb 10,evtMultipleCommands+3			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+10			; Load Settings from bank 10
defb 	evtSetSprite,TwoFrameSprite+	12	; Sprite 12
defb 	evtSingleSprite+7			; Sprite at edge of screen - position 7 (Middle)

defb 18,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PowerUpStrength:	;Batch starts at time 10

;	Drone Powerup
defb 10,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+10			; Load Settings from bank 2
defb 	evtSetSprite,TwoFrameSprite+	13			; Sprite 1 Frame animater
defb 	evtSingleSprite+7				; Row 16, last Column, Last Sprite

defb 18,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EnemyBatchNone:		;Batch starts at time 10

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;		Enemy batch definitions


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


EnemyBatchShards_Lite:	;Batch starts at time 10

; Shards
defb 10,evtMultipleCommands+4		; 4 commands at the same timepoint
defb 	evtSettingsBank_Load+2		; Load Settings from bank 2
defb 	evtSingleSprite+10		
defb 	evtSingleSprite+6		; 3 enemies at the edge of the screen	
defb 	evtSingleSprite+2				

defb 20,evtMultipleCommands+4		; 4 commands at the same timepoint
defb 	evtSettingsBank_Load+2		; Load Settings from bank 2
defb 	evtSingleSprite+12+1				
defb 	evtSingleSprite+8+1		; 3 enemies at the edge of the screen	
defb 	evtSingleSprite+4+1				

defb 28,evtJumpToNewTime		; End of the batch
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



EnemyBatchShards:	;Batch starts at time 10

; Shards
defb 10,evtMultipleCommands+7		; 7 commands at the same timepoint
defb 	evtSettingsBank_Load+2		; Load Settings from bank 2
defb 	evtSingleSprite+12		
defb 	evtSingleSprite+10		
defb 	evtSingleSprite+8		; 6 enemies at the edge of the screen
defb 	evtSingleSprite+6			
defb 	evtSingleSprite+4			
defb 	evtSingleSprite+2			

defb 20,evtMultipleCommands+7		; 7 commands at the same timepoint
defb 	evtSettingsBank_Load+2		; Load Settings from bank 2
defb 	evtSingleSprite+12+1		
defb 	evtSingleSprite+10+1		
defb 	evtSingleSprite+8+1		; 6 enemies at the edge of the screen
defb 	evtSingleSprite+6+1			
defb 	evtSingleSprite+4+1			
defb 	evtSingleSprite+2+1			

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EnemyBatchGlobules:	;Batch starts at time 10

; Globules
defb 10,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+3		; Load Settings from bank 3
defb 	evtSingleSprite+8		
defb 	evtSingleSprite+6		

defb 25,evtMultipleCommands+5		; 5 commands at the same timepoint
defb 	evtSettingsBank_Load+3		
defb 	evtSingleSprite+10			
defb 	evtSingleSprite+8		
defb 	evtSingleSprite+6		
defb 	evtSingleSprite+4		


defb 40,evtMultipleCommands+7		; 7 commands at the same timepoint
defb 	evtSettingsBank_Load+3			
defb 	evtSingleSprite+12+1		
defb 	evtSingleSprite+10+1		
defb 	evtSingleSprite+8+1			
defb 	evtSingleSprite+6+1			
defb 	evtSingleSprite+4+1			
defb 	evtSingleSprite+2+1			

defb 55,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EnemyBatchSkeliburd:	;Batch starts at time 10

; Skelibird
defb 10,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+4		; Load Settings from bank 4
defb 	evtSingleSprite+9			
defb 	evtSingleSprite+4			

defb 15,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+4				
defb 	evtSingleSprite+9			
defb 	evtSingleSprite+4			

defb 20,evtMultipleCommands+3	
defb 	evtSettingsBank_Load+4		
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 25,evtMultipleCommands+3	
defb 	evtSettingsBank_Load+4		
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EnemyBatchBatGob:	;Batch starts at time 10

; BatGob
defb 10,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+5		; Load Settings from bank 5
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+5		

defb 15,evtMultipleCommands+5		; 5 commands at the same timepoint
defb 	evtSettingsBank_Load+5		
defb 	evtSingleSprite+10			
defb 	evtSingleSprite+8				
defb 	evtSingleSprite+6				
defb 	evtSingleSprite+4				

defb 20,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+5		
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+5		

defb 25,evtMultipleCommands+5		; 5 commands at the same timepoint
defb 	evtSettingsBank_Load+5	
defb 	evtSingleSprite+10		
defb 	evtSingleSprite+8			
defb 	evtSingleSprite+6			
defb 	evtSingleSprite+4			

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EnemyBatchElectrode:	;Batch starts at time 10

; Electrode
defb 10,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+6		; Load Settings from bank 6
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 15,evtMultipleCommands+3			
defb 	evtSettingsBank_Load+6				
defb 	evtSingleSprite+11		
defb 	evtSingleSprite+6	

defb 20,evtMultipleCommands+3		
defb 	evtSettingsBank_Load+6			
defb 	evtSingleSprite+9			
defb 	evtSingleSprite+4	
		
defb 25,evtMultipleCommands+3	
defb 	evtSettingsBank_Load+6		
defb 	evtSingleSprite+11		
defb 	evtSingleSprite+6			

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EnemyBatchNoiseCloud:	;Batch starts at time 10

; Noise Cloud
defb 10,evtMultipleCommands+3			; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 7
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 15,evtMultipleCommands+3		
defb 	evtSettingsBank_Load+7			
defb 	evtSingleSprite+12		
defb 	evtSingleSprite+7			

defb 20,evtMultipleCommands+3		
defb 	evtSettingsBank_Load+7	
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 25,evtMultipleCommands+3		
defb 	evtSettingsBank_Load+7			
defb 	evtSingleSprite+12			
defb 	evtSingleSprite+7				

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EnemyBatchEyeballsandHellimunchers:	;Batch starts at time 10

; Gankyuu and helimuncher
defb 10,evtMultipleCommands+2		; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+8		; Load Settings from bank 8
defb 	evtSingleSprite+2		

defb 10,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+9		; Load Settings from bank 9
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 15,evtMultipleCommands+2		; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+8		; Load Settings from bank 8
defb 	evtSingleSprite+5		

defb 15,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+9		; Load Settings from bank 9
defb 	evtSingleSprite+8		
defb 	evtSingleSprite+2		

defb 20,evtMultipleCommands+2		; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+8		; Load Settings from bank 8
defb 	evtSingleSprite+7		

defb 20,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+9		; Load Settings from bank 9
defb 	evtSingleSprite+10		
defb 	evtSingleSprite+5			

defb 25,evtMultipleCommands+2		; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+8		; Load Settings from bank 8
defb 	evtSingleSprite+12		

defb 25,evtMultipleCommands+3		; 3 commands at the same timepoint
defb 	evtSettingsBank_Load+9		; Load Settings from bank 9
defb 	evtSingleSprite+9		
defb 	evtSingleSprite+4		

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



EnemyBatchBoss:	;Batch starts at time 10

				; Row 16, last Column, Last Sprite
; Shards
defb 10,evtMultipleCommands+7		; 7 commands at the same timepoint
defb 	evtSettingsBank_Load+2		; Load Settings from bank 2
defb 	evtSingleSprite+12		
defb 	evtSingleSprite+10		
defb 	evtSingleSprite+8			
defb 	evtSingleSprite+6			
defb 	evtSingleSprite+4			
defb 	evtSingleSprite+2			

; Boss
defb 15,evtMultipleCommands+2		; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+14		; Load Settings from bank 14
defb 	evtSingleSprite+7

;shards
defb 20,evtMultipleCommands+7		; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2		; Load Settings from bank 2
defb 	evtSingleSprite+12+1		
defb 	evtSingleSprite+10+1		
defb 	evtSingleSprite+8+1			
defb 	evtSingleSprite+6+1			
defb 	evtSingleSprite+4+1			
defb 	evtSingleSprite+2+1			

defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


EnemyBatchFireballs:	

; Fireball - these come from the top of the screen at an angle


defb 10,evtMultipleCommands+5			; 5 commands at the same timepoint
defb 	evtSettingsBank_Load+13			; Load Settings from bank 13
defb 	evtSingleSprite,27+128,144+24,24
defb 	evtSingleSprite,27+128,112+24,24
defb 	evtSingleSprite,27+128,80+24,24
defb 	evtSingleSprite,27+128,48+24,24

defb 12,evtSingleSprite,27+128,160+24-8,24+64	;Have to manually position these 
defb 14,evtSingleSprite,27+128,160+24,24+64+32+32

defb 15,evtMultipleCommands+6			; 6 commands at the same timepoint
defb 	evtSettingsBank_Load+13			; Load Settings from bank 13
defb 	evtSingleSprite,27+128,160+24,24
defb 	evtSingleSprite,27+128,128+24,24
defb 	evtSingleSprite,27+128,96+24,24
defb 	evtSingleSprite,27+128,64+24,24
defb 	evtSingleSprite,27+128,32+24,24

defb 18,evtSingleSprite,27+128,160+24-4,24+64+32 ;have to manually position this

;Same as above

defb 20,evtMultipleCommands+5			
defb 	evtSettingsBank_Load+13			
defb 	evtSingleSprite,27+128,144+24-8,24
defb 	evtSingleSprite,27+128,112+24-8,24
defb 	evtSingleSprite,27+128,80+24-8,24
defb 	evtSingleSprite,27+128,48+24-8,24

defb 22,evtSingleSprite,27+128,160+24-8-8,24+64
defb 24,evtSingleSprite,27+128,160+24-8,24+64+32+32

defb 25,evtMultipleCommands+6			
defb 	evtSettingsBank_Load+13			
defb 	evtSingleSprite,27+128,160+24-8,24
defb 	evtSingleSprite,27+128,128+24-8,24
defb 	evtSingleSprite,27+128,96+24-8,24
defb 	evtSingleSprite,27+128,64+24-8,24
defb 	evtSingleSprite,27+128,32+24-8,24

defb 28,evtSingleSprite,27+128,160+24-4-8,24+64+32

defb 30,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EnemyBatchElectroballs:	

defb 10,evtMultipleCommands+3		
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&2B
defb 	evtSingleSprite,23+128,80+40+24,24

defb 15,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&1D
defb 	evtSingleSprite,23+128,80-40+24,200+24

defb 20,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&1B
defb 	evtSingleSprite,23+128,80+40+24,200+24

defb 25,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&2D
defb 	evtSingleSprite,23+128,80-40+24,24

defb 30,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&2D
defb 	evtSingleSprite,23+128,24,100+24-70

defb 35,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&1B
defb 	evtSingleSprite,23+128,160+24,100+24+70

defb 40,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&1D
defb 	evtSingleSprite,23+128,24,100+24+70

defb 45,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&2B
defb 	evtSingleSprite,23+128,160+24,100+24-70

defb 50,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&23
defb 	evtSingleSprite,23+128,160+24,100+24-16-32

defb 55,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&25
defb 	evtSingleSprite,23+128,24,100+24-16+32

defb 60,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&2C
defb 	evtSingleSprite,23+128,24+80-32,24

defb 65,evtMultipleCommands+3
defb 	evtSettingsBank_Load+11
defb 	evtSetMove,&1C
defb 	evtSingleSprite,23+128,24+80+32,199+24

defb 70,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EnemyBatchMouthers:

defb 10,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&32
defb 	evtSingleSprite,26+128,80+40+24,24

defb 12,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&16
defb 	evtSingleSprite,26+128,80-40+24,200+24

defb 14,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&12
defb 	evtSingleSprite,26+128,80+40+24,200+24

defb 16,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&36
defb 	evtSingleSprite,26+128,80-40+24,24

defb 18,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&36
defb 	evtSingleSprite,26+128,24,100+24-70

defb 20,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&12
defb 	evtSingleSprite,26+128,160+24,100+24+70

defb 22,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&16
defb 	evtSingleSprite,26+128,24,100+24+70

defb 24,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&32
defb 	evtSingleSprite,26+128,160+24,100+24-70

defb 26,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&22
defb 	evtSingleSprite,26+128,160+24,100+24-16-32

defb 28,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&26
defb 	evtSingleSprite,26+128,24,100+24-16+32

defb 30,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&34
defb 	evtSingleSprite,26+128,24+80-32,24

defb 32,evtMultipleCommands+3
defb 	evtSettingsBank_Load+12
defb 	evtSetMove,&14
defb 	evtSingleSprite,26+128,24+80+32,199+24

defb 34,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

EnemyBatch0:	;Batch starts at time 10
defb 28,evtJumpToNewTime
	dw NewEnemyBatch
	db 28

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NewEnemyBatch:
	defb 29,evtCallAddress		;Call a memory location
	defw	SetNextEnemyBatch	

	defb 30,evtJumpToNewTime
	dw EnemyBatchShards	:NextEnemyBatch_Plus2	;This will start the new batch - but this will be selfmodded to point to a batch
	db 9



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These are just some old test code...



	defb 15,evtCallAddress			;Call a memory location
	defw	SetScrollUP

	defb 22,evtCallAddress			;Call a memory location
	defw	SetScrollCenter


	defb 30,evtCallAddress			;Call a memory location
	defw	SetScrollLeft


	defb 30,evtCallAddress			;Call a memory location
	defw	SetScrollRight

	defb 40,evtCallAddress			;Call a memory location
	defw	SetScrollLeft



	defb 50,evtCallAddress			;Call a memory location
	defw	SetScrollDown

	defb 60,evtCallAddress			;Call a memory location
	defw	SetScrollUP

	defb 70,evtCallAddress			;Call a memory location
	defw	SetScrollCenter



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Generic end level (this isn't actually used by the Tragical Chase levelcode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LevelEndSeq:

defb 5,evtCallAddress				;Call a memory location
defw	ClearBadguys				;Smart bomb

LevelEndAnim:
;This code would move the players to the edge of the screen
;defb 5,evtMultipleCommands+2			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb 	0,128+	47,140+24,100+24	; 	; Single Object sprite 11 (animated)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Start of fade out block (Don't mess!)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

FadeOutStartPoint equ 5

ifdef buildZXS							;Spectrum fadeout
	defb FadeOutStartPoint+1,evtCallAddress
	defw	 SetSpectrumFadeDark

	defb FadeOutStartPoint+2,evtCallAddress
	defw	 setSpectrumFadeBlue
endif

ifdef BuildMSX							;MSX fadeout
	defb FadeOutStartPoint,evtCallAddress
	defw 	FadeOut
endif

if BuildCPCv+BuildENTv						;CPC+Enterprise fadeout
	;CPC Plus
	defb FadeOutStartPoint,evtCallAddress
	defw 	FadeOut

	defb FadeOutStartPoint+1,evtMultipleCommands+4		;Blue 6128 (non plus)
	defb 240,0,6						; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1			;definitions
	defb 1			;Delay
	defb &54,&54,&44,&40	;These are hardware color numbers

	defb 240,26*0+6,6					; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&44,&40	

	defb 240,26*1+6,6					; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&44,&40		

	defb 240,26*2+6,6					; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40			

	defb FadeOutStartPoint+2,evtMultipleCommands+4		;Black 6128
	defb 240,0,6						
	defb 1
	defb 1				
	defb &54,&54,&54,&54	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54		
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				End of fade out block

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	defb 8,evtCallAddress			;Call a memory location
;	defw	EndLevel

defb 8,evtJumpToNewTime
	dw StartNewWave			;Fadeout done, lets show a new wave!
	db 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	This code will start a new wave, including redefining the plaette, and doing any other junk!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NewWave:
	push hl
		ld hl,DoNewWave
		ld (LevelSpecial_Plus2-2),hl		;We do the wavechange in the main level loop (as all registers are available there)
	pop hl
ret

DoNewWave:

	ld hl,ShowWaveText				;Show the 'wave text' to the screen
	ld (ShowWaveTextCall_Plus2-2),hl

	ld hl,WaveNumber_Plus1-1			;Increase the wave number
	inc (hl)

	ld a,50
	ld (showtextTimeout_plus1-1),a			;Timer for how long to show the message

	ld hl,null
	ld (LevelSpecial_Plus2-2),hl			;Clear the call that ran this routine
ifdef CompileTC
	call akuyou_Player_GetHighscore
	ld bc,-8
	add hl,bc
	ld (hl),0					; Clear the 'debt counter'
	ld d,h
	ld e,l
	inc de
	ld bc,7
	ldir

	ld hl,LevelTimeFinish	
	ld (levelTimeAction_Plus2-2),hl			;The command to call when the level end occurs (we disable this when the level end hasn't been processed yet)
endif
	call AkuYou_Player_GetPlayerVars	;Get playervars in IY

	ld hl,waves	:nextWave_plus2	;Address of next wave
 
	ld a,h		;Wave 0000 means we've run out of waves, and need to repeat
	or l
	jr nz,DoNewWaveNoReset
	ld hl,waves
DoNewWaveNoReset:
	ld e,(hl)		;Get the wave details,and move up the wave
	inc hl
	ld d,(hl)
	inc hl

	ld a,d			;See if wave is 0000
	or e
	jr nz,NewWaveOK
	ld hl,waves		;Get the first wave entry
	ld e,(hl)
	inc hl
	ld d,(hl)
	inc hl


NewWaveOK:
	ld (nextWave_plus2-2),hl;Save the address of the next wave

;	ld de,Wave1

	ld a,(de)
	ld (iy+14+Akuyou_PlayerSeparator),a	;Timelimit
	inc de
	xor a
	ld (iy+13+Akuyou_PlayerSeparator),a	;Pending score

	ld (BatchSequenceNext_Plus2-2),hl	;Set the next wave batch to the first one
	ld (WaveLoopLoc_Plus2-2),hl		;Set the first batch as the loop point

	call akuyou_Player_GetHighscore
	ld bc,-8				;Get the position of the debt target
	add hl,bc

	ld b,3
DebtTargetLoop:
	ld a,(de)				;Copy 3 bytes from the wave definition to the debt target
	inc de
	inc hl
	ld (hl),a
	djnz DebtTargetLoop
	ex hl,de

	call DoColorShift			;Get color, and Do any color changes

ifdef BuildZXS
	push de		;Speccy version works differently
;	pop iy
else
	ld (NewPal1),de				;Update the palettes
ifndef buildMSX
	ld (NewPal1b),de
	ld (NewPal1c),de
endif
endif
	call DoColorShift			;Get color and Do any color changes

ifdef BuildZXS
	push de		
	pop ix
else

	ld (NewPal2),de				;Set the next palette
ifndef buildMSX
	ld (NewPal2b),de
endif
endif
	call DoColorShift

ifdef BuildZXS
	push de
	pop iy
else
	ld (NewPal3),de
ifndef buildMSX
	ld (NewPal3b),de
	ld (NewPal3c),de
endif
endif
	ld e,(hl)			;Get the address of the fade in command start
	inc hl
	ld d,(hl)
	inc hl
	ld (FadeInCommand_Plus2-2),de

	ld (BatchSequenceNext_Plus2-2),hl;Store the address of the next batch sequence
	ld (WaveLoopLoc_Plus2-2),hl	;Store the address as the loop as well


ifdef buildZXS
	pop de
							;Draw player UI 
	ld a,7	
	ld hl,SetBackgroundColorMap
	call Akuyou_Bankswapper_CallHL
endif


ifdef BuildCPC
	jp PlusPal2Cpc			;Convert the CPC+ palette to the regular CPC!
else



	ret
endif
DoColorShift:
	ld e,(hl)	;Read in the color from the wave definition
	inc hl
	ld d,(hl)
	inc hl

	jp null	:ShiftCommand_Plus2	;Do any palette switches

DoTwoShifts:
	Call OneShift		;Two colorshifts
	call OneShift
	jp EndShift

DoOneShift:
	call OneShift		;One colorshift
	jp EndShift


EndShift:
	ld a,d			;Fix up D
	and %00001111
	ld d,a
	ret
	;Do a shift
OneShift:		;Our palette definition is in CPC+ format so -GRB, so we need to shift B 8 bits into G's position, and shift all the others 4 bits
	ld a,d
	and %00001111
	ld d,a
	ld a,e
	and %00001111
	rrca
	rrca
	rrca
	rrca
	or d
	ld d,a	

	rr d
	rr e
	rr d
	rr e
	rr d
	rr e
	rr d
	rr e
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Load in the next Batch pointer, if the batch pointer is 0000 then we've reached the end, and need to loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetNextEnemyBatch:
	push hl
	push de
		ld hl,Wave1		:BatchSequenceNext_Plus2
SetNextEnemyBatchAgain:
		ld e,(hl)
		inc hl
		ld d,(hl)
		inc hl
		ld a,d
		or e
		jr z,SetNextEnemyBatchReset
		ld (NextEnemyBatch_Plus2-2),de
		ld (BatchSequenceNext_Plus2-2),hl
	pop de
	pop hl
	ret
SetNextEnemyBatchReset:
	ld hl,Wave1			:WaveLoopLoc_Plus2		
	jr SetNextEnemyBatchAgain

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;		These are the pointers to the wave definitions, effectively this is the order of the 'levels' in our minigame

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

waves:

	dw Wave1
;	dw Wave2
;	dw Wave3
;	dw Wave4
	dw WavePowerUpDrone


	dw Wave6
;	dw Wave7
;	dw Wave8
;	dw Wave9
	dw WaveMouthers
	dw WavePowerUpRate

;	dw Wave14
	dw Wave15
;	dw Wave16
;	dw Wave17
	dw WaveElectroBalls
	dw WavePowerUpDrone

	dw Wave10
	dw Wave11
;	dw Wave12
;	dw Wave13
	dw WaveBoss
	dw WavePowerUpStrength

	dw &0000			;Loop the wave definitions

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	This is the definitions of our levels

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Wave1:
	db 200			;TimeTarget
	db 0,1,0		;Backwards BCD Target xxx00 so 3,2,1 = 0000012300
	dw &0309		;Pal1
	dw &0909		;Pal2
	dw &0503		;Pal3
	dw ESDirectionRight	;First command must be an EventStream direction instruction (to set the background)
	dw EnemyBatchShards_Lite	; Shards
	dw EnemyBatchNone		; Wait
	dw EnemyBatchGlobules		;Globules
	dw EnemyBatchNone		;Wait
	dw EnemyBatchShards_Lite
	dw EnemyBatchNone
	dw EnemyBatchGlobules
	dw EnemyBatchNone
	dw EnemyBatchShards
	dw EnemyBatchGlobules
	dw EnemyBatchNone
	dw EnemyBatchShards
	dw EnemyBatchGlobules
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchNone
	dw EnemyBatchGlobules
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchSkeliburd
	dw EnemyBatchBatGob
	dw EnemyBatchSkeliburd
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000


Wave6:
	db 190		;TimeTarget
	db 5,2,0	;Backwards BCD Target xxx00
	dw &0390	;Pal3
	dw &0903	;Pal2
	dw &0309	;Pal1
	dw ESDirectionLeft
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchElectrode
	dw EnemyBatchBatGob
	dw EnemyBatchElectrode
	dw EnemyBatchNoiseCloud
	dw EnemyBatchElectrode
	dw EnemyBatchShards
	dw EnemyBatchShards
	dw EnemyBatchShards
	dw EnemyBatchNoiseCloud
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchNoiseCloud
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchNoiseCloud
	dw EnemyBatchBatGob
	dw EnemyBatchShards
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000

Wave10:
	db 180		;TimeTarget
	db 0,4,0	;Backwards BCD Target xxx00
	dw &0939	;Pal1
	dw &0090	;Pal2
	dw &0939	;Pal3
	dw ESDirectionCenter
	dw EnemyBatchShards
	dw SetDirU			;This level repeatedly changes enemy direction mid wave
	dw EnemyBatchGlobules
	dw SetDirL
	dw EnemyBatchElectrode
	dw SetDirD
	dw EnemyBatchBatGob
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw SetDirU
	dw EnemyBatchSkeliburd
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw SetDirD
	dw EnemyBatchSkeliburd
	dw SetDirR
	dw EnemyBatchShards
	dw SetDirU			;This level repeatedly changes enemy direction mid wave
	dw EnemyBatchGlobules
	dw SetDirL
	dw EnemyBatchElectrode
	dw SetDirD
	dw EnemyBatchBatGob
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw SetDirU
	dw EnemyBatchSkeliburd
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw SetDirD
	dw EnemyBatchSkeliburd
	dw SetDirR
	dw EnemyBatchShards
	dw SetDirU			;This level repeatedly changes enemy direction mid wave
	dw EnemyBatchGlobules
	dw SetDirL
	dw EnemyBatchElectrode
	dw SetDirD
	dw EnemyBatchBatGob
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw SetDirU
	dw EnemyBatchSkeliburd
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw SetDirD
	dw EnemyBatchSkeliburd
	dw SetDirR
	dw EnemyBatchShards
	dw SetDirU			;This level repeatedly changes enemy direction mid wave
	dw EnemyBatchGlobules
	dw SetDirL
	dw EnemyBatchElectrode
	dw SetDirD
	dw EnemyBatchBatGob
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw SetDirU
	dw EnemyBatchSkeliburd
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw SetDirD
	dw EnemyBatchSkeliburd
	dw SetDirR
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000



Wave11:
	db 140		;TimeTarget
	db 0,4,0	;Backwards BCD Target xxx00
	dw &0F3F	;Pal1
	dw &0F38	;Pal2
	dw &083F	;Pal3
	dw ESDirectionUp
	dw SetDirU
	dw EnemyBatchBatGob
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchShards
	dw SetDirD
	dw EnemyBatchBatGob
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchShards
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchSkeliburd
	dw EnemyBatchSkeliburd
	dw SetDirD
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchSkeliburd
	dw EnemyBatchSkeliburd
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw EnemyBatchBatGob
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw EnemyBatchBatGob
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw EnemyBatchElectrode
	dw EnemyBatchGlobules
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw EnemyBatchElectrode
	dw EnemyBatchGlobules
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000


Wave15:  ;UDUD Fast
	db 100		;TimeTarget
	db 5,4,0	;Backwards BCD Target xxx00
	dw &0F3F	;Pal1
	dw &0A4A	;Pal2
	dw &0858	;Pal3
	dw ESDirectionUp
	dw SetDirU
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchBatGob
	dw SetDirD
	dw EnemyBatchSkeliburd
	dw EnemyBatchGlobules
	dw EnemyBatchBatGob
	dw SetDirU
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchNoiseCloud
	dw EnemyBatchShards
	dw SetDirD
	dw EnemyBatchEyeballsandHellimunchers
	dw EnemyBatchNoiseCloud
	dw EnemyBatchShards
	dw SetDirU
	dw EnemyBatchGlobules
	dw SetDirL
	dw EnemyBatchElectrode
	dw SetDirD
	dw EnemyBatchBatGob
	dw SetDirR
	dw EnemyBatchSkeliburd
	dw SetDirU
	dw EnemyBatchSkeliburd
	dw SetDirL
	dw EnemyBatchSkeliburd
	dw SetDirD
	dw EnemyBatchSkeliburd
	dw SetDirR
	dw EnemyBatchEyeballsandHellimunchers
	dw SetDirU
	dw EnemyBatchEyeballsandHellimunchers
	dw SetDirL
	dw EnemyBatchEyeballsandHellimunchers
	dw SetDirD
	dw EnemyBatchEyeballsandHellimunchers
	dw SetDirR
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000


WavePowerUpRate:
	db 100		;TimeTarget
	db 5,0,0	;Backwards BCD Target xxx00
	dw &0999	;Pal1
	dw &0999	;Pal2
	dw &0999	;Pal3
	dw ESDirectionDown
	dw SetStrengthX2				;Make the enemies tougher
	dw PowerUpRate					;Powerup
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000
WavePowerUpDrone:
	db 100		;TimeTarget
	db 5,0,0	;Backwards BCD Target xxx00
	dw &0999	;Pal1
	dw &0999	;Pal2
	dw &0999	;Pal3
	dw ESDirectionUp
	dw PowerUpDrone
;	dw SetStrengthX2
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EndWave
	dw 0000
WavePowerUpStrength:
	db 100		;TimeTarget
	db 5,0,0	;Backwards BCD Target xxx00
	dw &0999	;Pal1
	dw &0999	;Pal2
	dw &0999	;Pal3
	dw ESDirectionUp
	dw PowerUpStrength
	dw SetColorCycle
	dw SetStrengthX2
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EnemyBatchShards_lite
	dw EnemyBatchNone
	dw EndWave
	dw 0000


WaveBoss:
	db 200		;TimeTarget
	db 0,5,0	;Backwards BCD Target xxx00
	dw &00F0	;Pal1
	dw &08F0	;Pal2
	dw &0FF0	;Pal3
	dw ESDirectionRight
	dw EnemyBatchFireballs
;	dw EnemyBatchShards
	dw EnemyBatchFireballs
	dw EnemyBatchBoss
	dw EnemyBatchFireballs
;	dw EnemyBatchShards
	dw EnemyBatchFireballs
	dw EndWave
	dw 0000

WaveElectroBalls:
	db 100		;TimeTarget
	db 5,0,0	;Backwards BCD Target xxx00
	dw &080F	;Pal1
	dw &088F	;Pal2
	dw &008F	;Pal3
	dw ESDirectionCenter
	dw EnemyBatchElectroballs
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000

WaveMouthers:
	db 100		;TimeTarget
	db 5,0,0	;Backwards BCD Target xxx00
	dw &00F0	;Pal1
	dw &08F0	;Pal2
	dw &0FF0	;Pal3
	dw ESDirectionCenter
	dw EnemyBatchMouthers
	dw EndWave					;End the wave early (we can't loop, or the player would get another powerup!)
	dw 0000


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Setscroll Commands

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SetScrollUP:
	push hl
		ld hl,DoSetScrollUP
		jr SetScrollAll

SetScrollDown:
	push hl
		ld hl,DoSetScrollDOWN
		jr SetScrollAll
SetScrollLeft:
	push hl
		ld hl,DoSetScrollLEFT
		jr SetScrollAll
SetScrollRight:
	push hl
		ld hl,DoSetScrollRIGHT
		jr SetScrollAll

SetScrollCenter:
	push hl
		ld hl,DoSetScrollCenter
SetScrollAll:
		ld (BackgroundChange_Plus2-2),hl
	pop hl
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Level Init

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LevelInit:

	call akuyou_Player_GetHighscore
	ld a,1
	dec hl
	dec hl
	ld (hl),a			;Make sure the debt is nonzero (so the level doesn't end!)

	ifdef BuildMSX
		call MSXTilesRL		;Set a default background layout
	endif

if buildCPCv+buildENTv
	di
	call Akuyou_Interrupt_Init
	ifdef BuildCPC
		call EnablePlusPalette	;Start the CPC raster palette
		call RasterColorsStartPalleteFlip
	endif
endif



	call AkuYou_Player_GetPlayerVars

	ld a,200				;INIT level time remaining
	ld (iy+14+Akuyou_PlayerSeparator),a
	

	ld a,100+24				;Center player
	ld (iy+0),a

	ld a,80+24
	ld (iy+1),a

;	ld a,0	;R
;	ld a,1 	;L
;	ld a,2	;D
;	ld a,3  ;U
;	call Akuyou_Background_SetScroll

	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericInit.asm"
ifdef BuildMSX
		push iy
			call AkuYou_Player_GetPlayerVars
			bit 0,(iy-1)
			jr z,SetBackRegularUD				;INit the UD and Center backgroundds on the MSX
			xor a
			ld (Background_UD_VDP_MyHMMV_DX),a
			ld (Background_CT_VDP_MyHMMV_DX),a

			ld hl,&0100
			ld (Background_UD_VDP_MyHMMV_NX),hl
			ld (Background_CT_VDP_MyHMMV_NX),hl
		
SetBackRegularUD:
		pop iy
		endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Level Loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelLoop:

ifdef BuildZXS
	ld c,64+3					;Set the font color (magenta)
	ld a,1
	call Akuyou_ZXSGPU_CommandNum
endif
ifdef CompileTC;Tragical chase Debt counter
	call AkuYou_Player_GetPlayerVars		;See if the core has set the level end marker
	ld a,(iy+14+Akuyou_PlayerSeparator)
	cp 255 
	jp z,LevelTimeFinish	:levelTimeAction_Plus2



	call Akuyou_Timer_GetTimer
	and %01000000
	jr z,LevelTimeNoUpdate


	ld a,(iy+14+Akuyou_PlayerSeparator)
	or a						;See if player has run out of time
	jr nz,LevelTimeUpdate

LevelTimeOver
	call AkuYou_Player_Hit_Injure_1			;If they have, take a life, and give them another 50 ticks to do better!
	ld a,51
LevelTimeUpdate:	
	dec a
	ld (iy+14+Akuyou_PlayerSeparator),a
endif ;Tragical chase Debt counter

LevelTimeNoUpdate:	

	read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_PreFlip.asm"

ifdef BuildZXS
	call Akuyou_INT_Force				;Try to keep the music OK on Speccy
endif

	call null	:ShowWaveTextCall_Plus2

	read "..\SrcALL\Akuyou_Multiplatform_Level_Levelloop_Flip.asm"


ifdef buildZXS
	ld a,7	
	ld hl, null :BackgroundChange_Plus2			
	call Akuyou_Bankswapper_CallHL
else
	call null :BackgroundChange_Plus2		;This is selfmodded to point to new background code
endif
	ld hl,null
	ld (BackgroundChange_Plus2-2),hl



	call null	:LevelSpecial_Plus2		;This is Selfmodded to point to new wave code


	jp LevelLoop




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Level Shutdown code - Never used in TC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelTimeFinish:
ifdef CompileTC
	ld hl,LevelTimeNoUpdate			;Endlevel (Debt version)
	ld (levelTimeAction_Plus2-2),hl
else
	ld hl,null				;Endlevel (Automatic version)
	ld (LevelSpecial_Plus2-2),hl
endif
	ld hl,LevelEndSeq			
	ld a,4
	call Akuyou_SetLevelTime


jr LevelTimeNoUpdate


ClearBadguys:
	ifdef buildCPC
		ld a,64
		ld (PaletteNo_Plus1-1),a	; turn off the alternate palette
	endif

	ld a,1
	ldia
	push hl
;	push de
;	push bc
	call Akuyou_DoSmartBombCall		;Kill all the enemies
;	pop bc
;	pop de
	pop hl
	
	
	ret

EndLevel:
	pop hl	;
	ld hl,	&0102 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return
	ret
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			Level specific code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef Debug_ShowLevelTime
	read "..\SrcALL\Akuyou_Multiplatform_Level_GenericDebuggingTools.asm"	;Onscreen level time
endif	

ifdef BuildMSX
	read "..\SrcMSX\Akuyou_MSX_Level_GenericFader.asm"
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 		This block is copied to bank 7 on the speccy, and contains graphics for the background

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if BuildCPCv+BuildENTv
	align 256
	LevelTiles:
	incbin "..\ResCPC\SingleLevelTiles.SPR"
endif
ifdef BuildZXS
AlignedBlock:						;Align the file to the position copied into bank 7 (Second screen)
	defs ZXS_CopiedBlockStart-AlignedBlock;FileBeginLevel+&3800-AlignedBlock
LevelTiles:
	incbin "..\ResZX\SingleLevelTiles.TSP"
	read "..\SrcZX\Akuyou_Spectrum_Level_GenericFader.asm"		;Must be within the copied block
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Generic Background Begin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Background_Draw: 

	call Akuyou_Timer_UpdateTimer			;This returns the 'smarbomb color in AF (0=no smartbomb)

ifndef BuildMSX
	push af	; need to keep the smartbomb color

		if BuildCPCv+BuildENTv
			ifdef UseBackgroundHoriz
				call Akuyou_Timer_GetTimer		;Get the timer ticks (for background scroll)
				ld (BitshifterTicksOccured_Plus1-1),a
				ld (BitshifterRTicksOccured_Plus1-1),a	;Bitshifter Reverse
			endif
		endif
		ifdef BuildZXS
			ifdef UseBackgroundHoriz
				call Akuyou_Timer_GetTimer
				ld (BitshifterRTicksOccured_Plus1-1),a	;Bitshifter Reverse
			endif
		endif

		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a

		if BuildCPCv+BuildENTv
			ifdef CPC320
				ld l,&4F+1	;Right-hand side of the screen
			else
				ld l,&40	
			endif
		endif
		ifdef buildZXS
			ld l,&1F	;intentionaly one too low - to avoid problems with nextline on byte boundaries
		endif 
	pop af

endif

	or a				;See if we're doing a background flash
	jp nz,Background_SmartBomb

	ifdef BuildMSX
		ld (Background_DrawForegroundV9990),a	;nop to disable 2nd background
	endif
ifdef BuildZXS
	call AkuYou_Player_GetPlayerVars
	bit 2,(iy-8)
	jp nz,Background_Black

endif
	jp Background_LR_Background_DrawB :BackgroundRender_Plus2	;Call current background routine

	read "Level_Single-BackgroundLR.asm"

	read "Level_Single-BackgroundCT.asm"

	read "Level_Single-BackgroundUD.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;				Smartbomb flash
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Background_DrawB:

	jp Background_LR_Background_DrawB

Background_DrawForegroundV9990:
	nop
	ret
MSX2V9990:
;	jp Background_CT_MSX2V9990
Background_DrawMsx2:
;	jp Background_CT_Background_DrawMsx2
	ret

Background_SmartBomb:
ifdef buildMSX
	ld a,d
	and &44
	ld d,a
	ld e,d
	ld (MSxSmartBombV9990),de
	ld (MSxSmartBombV9990+2),de
	ld (MSxSmartBombColor_Plus1-1),a
	ld a,&C9
	ld (Background_DrawForegroundV9990),a	;nop to disable 2nd background	

		ld iyl,0	;For MSX2 gradient
		ld ix,NewGradientMSX2
		ld de,MSxSmartBomb			;Use the smartbomb definition for the background routine
		ld hl,MSxSmartBombV9990
		ld b,192
;		ld c,%11111111
		jp Akuyou_Background_Gradient
endif
ifndef 	buildMSX
	ld e,d
	jr Background_Fill	;Do a flood fill
Background_Black:
	ld de,&0000
Background_Fill:
	ifdef CPC320
		ld b,200	;200 lines in screen
	else
		ld b,192	;192 lines in screen
	endif

	ifdef buildZXS
		call Akuyou_BackgroundSolidFill
		ld de,SmartBombColorMap
		jp Akuyou_Background_Color	;We are already in the right place as this is copied to screen ram
	else
		jp BackgroundSolidFill
	endif
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					CPC Background Data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if BuildCPCv+BuildENTv			;Definitions of the gradients (in native bitmaps)
					;LineNum,Gradient byte
GradientTop:
	defb &F0,&F0			;1; first line... byte pair 


	defb GradientTopStart-10,&D0	;2; line num, New byte
	defb GradientTopStart-16,&70	;3
	defb GradientTopStart-20,&A0	;4
	defb GradientTopStart-26,&50	;5
	defb GradientTopStart-30,&80	;6
	defb GradientTopStart-36,&20	;7
	defb GradientTopStart-40,&00	;8
	defb GradientTopStart-46,&00	;9
	defb 255			;End Marker

GradientBottom:
	defb &0,&0	;1; first line
	defb 26,&20	;10
	defb 22,&80	;11
	defb 18,&50	;12
	defb 14,&A0	;13
	defb 10,&70	;14
	defb 6,&D0	;15
	defb 4,&F0	;15
	defb 2,&F0	;15
	defb 255
endif 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Spectrum Background Data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef buildZXS					;Definitions of the gradients (in native bitmaps)
GradientTop:
	defb %11111111,%11111111		;1; first line
	defb GradientTopStart-10,%11101110	;2; line num, New byte
	defb GradientTopStart-16,%01010101
	defb GradientTopStart-20,%10100010	
	defb GradientTopStart-26,%01001000
	defb GradientTopStart-34,%00000001
	defb GradientTopStart-40,&00		
	defb GradientTopStart-46,&00		
	defb 255

GradientBottom:
	defb &0,&0		;1; first line
	defb 26,%00010000
	defb 20,%01000100	
	defb 16,%10100010	
	defb 10,%01010101	
	defb 6, %11101110	
	defb 4, %11111111;
	defb 2, %11111111	
	defb 255

SmartBombColorMap:		;Smartbomb colors (all white)
	defs 24,64+7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					Spectrum Background Colors

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetBackgroundColorMap:			;Convert CPC plus colors (in DE,IX,IY) into Speccy colors
	push de
	pop hl

	ld de,BackgroundColorMap+23
	;hl
	push de
		call GetPalette		;Do conversion
	pop de
	ld (SpeccyBackgroundStrip),a	;Mod result into map
	ld (SpeccyBackgroundStrip+1),a
	ld (SpeccyBackgroundStrip+31),a
	ld (SpeccyBackgroundStrip+30),a
	call DoPalBatch
	push ix 
	pop hl
	push de
		call GetPalette
	pop de
	call DoPalBatch
	push iy
	pop hl
	push de
		call GetPalette
	pop de
	ld (SpeccyBackgroundStrip+2),a
	ld (SpeccyBackgroundStrip+3),a
	ld (SpeccyBackgroundStrip+29),a
	ld (SpeccyBackgroundStrip+28),a
	call DoPalBatch
	ret
DoPalBatch:
	ld b,8
DoPalBatchb:
	ld (de),a
	dec de
	djnz DoPalBatchb
	ret	


BackgroundColorMap:		;Spectrum background colors (64=bright) (horizontal version)
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 64+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+2
	defb 00+1
	defb 64+1
	defb 64+1
	defb 64+1
	defb 64+1
	defb 64+1
	defb 64+1

Background_CT_SpeccyBackgroundStrip:	;Spectrum background colors (Vertical version)
	defb 7,7
	defb 2,2
	defs 32-8,5
	defb 2,2
	defb 7,7


PaletteDest:	;The 'Normal' level palette
	     ;0GRB
	defb 25
	defw &0000
NewPal1:	defw &004C
	defw &0CC0
	defw &0F00
	defb 50
	defw &0000
NewPal1b:	defw &000F
	defw &0FF0
	defw &0FFD
	defb 75
	defw &0000
NewPal1c:	defw &002B
	defw &0BB4
	defw &0FFF
	defb 100
	defw &0000
NewPal2:	defw &0059
	defw &0998
	defw &0EFF
	defb 125
	defw &0000
NewPal2b:	defw &0077
	defw &088F
	defw &0EFF
	defb 150
	defw &0000
NewPal3:	defw &0088
	defw &090F
	defw &0EFF
	defb 175
	defw &0000
NewPal3b:	defw &00B4
	defw &0A0A
	defw &0FCF
	defb 200
	defw &0000
NewPal3c:	defw &00F4
	defw &0A0B
	defw &0FBF
	     ;0GRB

endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					MSX Background Data

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef BuildMSX				;Smartbomb palette
MSxSmartBombV9990:
	defb &FF,&FF,&FF,&FF
	defb 255
MSxSmartBomb:
	defb 0,192	,%00000000,&FF :MSxSmartBombColor_Plus1
	defb 0,0

MSXTileListBackgroundV9990:
	defb 0,0

NewGradientMSX2:				
	defb 0				;Position of gradient (must be 8 lines)
	defb &DD,&DD	,%00000000
	defb &DD,&0D	,%11111100	;Twobytes for gradient, bitmask for tick scrolling time
	defb &0D,&DD	,%11111100
	defb &DD,&0D	,%11111100
	defb &D0,&D0	,%11111100
	defb &0D,&0D	,%11111100
	defb &D0,&00	,%11111100
	defb &00,&D0	,%11111100

	defb 152			;Position of gradient (must be 8 lines)


	Defb &00,&F0	,%11111100
	Defb &F0,&00	,%11111100
	Defb &0F,&0F	,%11111100
	Defb &F0,&F0	,%11111100
	Defb &FF,&0F	,%11111100
	Defb &0F,&FF	,%11111100
	Defb &FF,&0F	,%11111100
	Defb &FF,&FF	,%00000000
NewGradientMSX2_SB:
	defb 255,255,255			;255=end of gradients

MsxTilesPos equ 0;

	MSXTileList_LR:					;Tile areas
		defb 32,16
		defw 	MsxTilesPos
MSXTileList_LR1:defb 	%11111000,0			;Tick bitmask,0 (0 is used by code to store counter)
		defb 80,16
		defw 	MsxTilesPos+16
MSXTileList_LR2:defb 	%11111100,0
		defb 184,8
		defw 	MsxTilesPos+16+16
MSXTileList_LR3:defb 	%11111110,0
		defb 0,0
	MSX2SolidFill_LR:
	defb 48,32	,%00000000,&00
	defb 96,56	,%00000000,&00

	defb 0,0



Background_UD_MSXTileList:

	defb 0,32;Start,Width
	defw 	0 ;Tile-ypos (in bitmap data)
	defw 	0 ;Tile-xpos (in bitmap data)
MSXTileList_UD1:defb 	%11111100,0	;ScrollSpeed,ScrollPos (autocalc)
	defb 256-32,32;40
	defw 	0 ;Tile-ypos
	defw 	32;Tile-xpos
MSXTileList_UD2:defb 	%11111100,0
	defb 0,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef UseBackgroundSurround

Background_CT_NewGradientMSX2V:				
	defb 255,255,255
Background_CT_MSXTileListV:					;These are the Vertical tile definitions for the 'surround' layount
;0-32=gradient
	defb 0,16		;Xpos,Width
	defw 	0 		;ypos
	defw 	0 		;xpos
	defb 	%00000000,0	;Change frequency (%11111100,0)
	defb 256-16,16		;Xpos,Width
	defw 	0 		;ypos
	defw 	16 		;xpos
	defb 	%00000000,0	
	defb 0,0

Background_CT_MSXTileListH:					;Horizontal tile definitions
	defb 0,16	;Pos,Height
	defw 	MsxTilesPos	;Vmem Ypos
	defb 	%00000000,0	;ScrollSpeed, 0 (0 is used by code to store counter)
	defb 192-16,16
	defw 	MsxTilesPos+32
	defb 	%00000000,0
	defb 0,0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;							The V9990 Tiles

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MSXTileListForegroundV9990:				;Foreground
	defb 192-64,64
	defw 	MsxTilesPos;+16+16+8
	defb 	%11111111,0
	defb 0,0

MSXTileListV9990:
Background_CT_MSXTileListV9990:					;Background
;0-32=gradient
	defb 0,16		;Xpos,Width
	defw 	0 		;ypos
	defw 	0 		;xpos
	defb 	%00000000,0	;Change frequency (%11111100,0)
	defb 256-16,16		;Xpos,Width
	defw 	0 		;ypos
	defw 	16 		;xpos
	defb 	%00000000,0	
	defb 0,0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;							The V9990 Gradient

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NewGradientV9990:
	gradstart equ 192

	defb &DD,&DD,&DD,&DD	;1; first line (4 gradient bytes)
	defb gradstart-06, &DD,&0D	,%11111100	;Nextline start, 2 gradient bytes,Shift timer
	defb gradstart-10, &0D,&DD	,%11111100
	defb gradstart-16, &DD,&0D	,%11111100
	defb gradstart-20 ,&D0,&D0	,%00000000

	defb gradstart-26, &0D,&0D	,%11111100
	defb gradstart-30, &00,&D0	,%11111100
	defb gradstart-36, &D0,&00	,%11111100
	defb gradstart-40 ,&00,&00	,%00000000
	defb gradstart-50 ,&00,&00	,%00000000

	defb 50, 		&00,&0F	,%11111111
	defb 46, 		&F0,&00	,%11111111
	defb 40, 		&0F,&0F	,%11111111
	defb 36	,		&F0,&F0	,%11111111

	defb 30, 		&FF,&0F	,%11111111
	defb 26, 		&0F,&FF	,%11111111
	defb 20, 		&FF,&0F	,%11111111
	defb 16	,		&FF,&FF	,%11111111
	defb 12	,		&FF,&FF	,%11111111
	defb 255

endif
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 							CPC Raster Pallete
;				The core is full, so this is now stored in the level block
;				Don't change these directly, they are modded by the event stream

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if BuildCPCv+BuildENTv
RasterColors_ColorArray1:	
	defb 1
	defb 1				
	defb &54,&54,&54,&54	;First strip can only have one color change because it's mostly in the border area
RasterColors_ColorArray2:
	defb 1			;Count (we're only using the first one)
	defb 1			;Delay
	defb &54,&54,&54,&54	;Hardware colors (used)
	defb 0			;Delay
	defb &54,&54,&54,&54	;Hardware colors (unused)
	defb 12
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54	;Note using more subsplits makes things slower, only really useful for menus/intro
RasterColors_ColorArray3:
	defb 1
	defb 1				
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
RasterColors_ColorArray4:
	defb 1
	defb 1				
	defb &54,&54,&54,&54	
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54
	defb 0
	defb &54,&54,&54,&54

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					2nd page flipped palette used on regular CPC
;					These are not used by TC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RasterColors_ColorArray1Alt:
	defb 1
	defb 1				
	defb &54,&55,&4A,&4B		;Black,DkBlue,LtYellow,White
RasterColors_ColorArray2Alt:
	defb 2	; Switches
	defb 16	;delay			
	defb &54,&5D,&59,&4B
	defb 16	;delay			
	defb &54,&58,&5F,&4B
RasterColors_ColorArray3Alt:
	defb 0
;	defb 1
;	defb &54,&54,&54,&54		 :IlluminatedPaletteCAlt_Plus2
RasterColors_ColorArray4Alt:
	defb 2 ; no of switches
	defb 0	;delays			
	defb &54,&58,&51,&4B		;Black,Red,Grey,White
	defb 32
	defb &54,&4C,&51,&4B	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					CPC Plus Palette (Black for before the fadein)
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PaletteInit:		;INIT palette - all colors black.
	     ;0GRB
	defb 25
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 50
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 75
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 100
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 125
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 150
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 175
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	defb 200
	defw &0000
	defw &0000
	defw &0000
	defw &0000
	     ;0GRB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;							CPC Plus Palette Main Level

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PaletteDest:	;The 'Normal' level palette
	     ;0GRB
	defb 25
	defw &0000
NewPal1:	defw &004C		;these NewPal labels are pointers for our wave to shange the palette
	defw &08FF
	defw &0FFF
	defb 50
	defw &0000
NewPal1b:	defw &000F
	defw &08FF
	defw &0FFF
	defb 75
	defw &0000
NewPal1c:	defw &002B
	defw &08EF
	defw &0FFF
	defb 100
	defw &0000
NewPal2:	defw &0059
	defw &08EF
	defw &0EFE
	defb 125
	defw &0000
NewPal2b:	defw &0077
	defw &08CF
	defw &0EFE
	defb 150
	defw &0000
NewPal3:	defw &0088
	defw &08CF
	defw &0EFE
	defb 175
	defw &0000
NewPal3b:	defw &00B4
	defw &08BF
	defw &0EFE
	defb 200
	defw &0000
NewPal3c:	defw &00F4
	defw &08BF
	defw &0EFE
	     ;0GRB

	FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
	FadeOut:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteInit
			call SetFader
		pop hl
	ret
endif


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;					MSX Palette

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef buildMSX
PaletteInit:					;Level start palette (Black)
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG
	defb %00000000,%00000000;0  -RRR-BBB,-----GGG

PaletteDest:						;Normal level palette
	defw &0000;0  -GRB
	defw &0000;1  -GRB
	defw &0555;2  -GRB
	defw &0AAA;3  -GRB
	defw &0FFF;4  -GRB
	defw &00AA;5  -GRB
	defw &0F0F;6  -GRB
	defw &00F0;7  -GRB
	defw &0F04;8  -GRB
	defw &06FC;9  -GRB
	defw &0080;10  -GRB
	defw &000B;11  -GRB
	defw &080F;12  -GRB
NewPal1:	defw &0800;13  -GRB
NewPal2:	defw &07E0;14  -GRB
NewPal3:	defw &0EF0;15  -GRB



FadeDone:
		ld hl,null
		ld (FadeCommand_Plus2-2),hl
	ret
FadeOut:	;Need to protect everything - as this is called from the main Event loop
		push hl
			ld hl,PaletteInit
			call SetFader
		pop hl
	ret
endif
	;Palette converters for non plus CPC and Speccy... ENT uses the plus palette!
ifdef BuildCPC
	read "..\SrcCPC\CPC_V1_Palette.asm"	
endif
ifdef BuildZXS
	read "..\SrcZX\ZX_V1_Palette.asm"
endif

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Plus Palette to CPC regular

;	Convert the CPC plus colors to the regular CPC...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ifdef BuildCPC
PlusPal2Cpc:
	ld hl,PaletteDest

	ld c,4
nextpalb:
	inc hl

	push hl
		ld hl,PalMap		;The positions in the palette we want to change
		ld a,c
		dec a
		add a
		add l			;Get the memory address of the entry we're going to change
		ld l,a
		ld a,(hl)
		ld ixl,a		;Store the dest address in IX
		inc hl
		ld a,(hl)
		ld ixh,a
	pop hl
	ld b,4		;4 palettte entries to change
NextPal:
	ld e,(hl)	;Get the CPC plus format -GRB definition
	inc hl
	ld d,(hl)
	inc hl
	push hl
	push bc
		ex de,hl
		call GetPalette	;Convert it to a CPC def
		ld (ix),a	;Save the CPC def
		inc ix
	pop bc
	pop hl
	djnz NextPal	;do next color in 4 color block
	inc hl
	inc hl	;The CPC plus def has more colors than we can use so
	inc hl	;Skip over the definition bytes we don't use
	inc hl	;Move to the next palette entry we need to change

	inc hl
	inc hl
	inc hl
	inc hl

	inc hl
	dec c
	jp nz,nextpalb ;do next group of colors
	ret
align 16
PalMap:			;Pointers to the destination palette definitons
	dw CPCPal4
	dw CPCPal3
	dw CPCPal2
	dw CPCPal1
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Plus Palette to ZX regular

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifdef BuildZXS_Disabled			;This code will covert the CPC plus paletetmap to the speccy
PlusPal2ZX:				;However it was never actually needed!
	ld hl,PaletteDest
	ld ix,BackgroundColorMap+24
	ld c,8
nextpalb:
	inc hl

	inc hl
	inc hl
NextPal:


	ld e,(hl)
	inc hl
	ld d,(hl)
	inc hl

	inc hl
	inc hl

	inc hl
	inc hl


	push hl
	push bc
		ex de,hl
		call GetPalette
		ld (ix),a
		dec ix
		ld (ix),a
		dec ix
		ld (ix),a
		dec ix
	pop bc
	pop hl

	dec c
	jp nz,nextpalb
	ret
endif




DoSetScrollUP:

	ld a,4
	call Akuyou_Aku_CommandNum		;Change player direction

	ld a,3
	call Akuyou_Background_SetScroll	;Set scroll to UP for 

	ld a,6
	ld de,AnimatorPointersU
	call Akuyou_Aku_CommandNum	;Set Animators



	ifdef BuildMSX
		call MSXTilesUD
		ld b,%01111111
		ld c,%00000000		;Topbit 0 = Background moves up (player going down)
		call SetTileDirUD
		ld a,190			;Used to reverse the scroll on MSX
		ld (MSX_Vert_Reverse_Plus1-1),a
		ld a,0
		ld (VerticalStrip_YHeightC_Plus1-1),a
	endif
	ifndef BuildMSX
		ld a,-1						;Need to reprogram the Inc/Dec of the direction of the MSX background
		ld (Background_UD_VertMoveSpeed_Plus1-1),a

	endif
		ld hl,Background_UD_Background_DrawB
		ld (BackgroundRender_Plus2-2),hl
	jp DoSetScrollFinish

DoSetScrollDown:

	ld a,4
	call Akuyou_Aku_CommandNum		;Change player direction

	ld a,4
	call Akuyou_Background_SetScroll	;Background gradient direction

	ld a,6
	ld de,AnimatorPointersD
	call Akuyou_Aku_CommandNum	;Set Animators

	ifdef BuildMSX
		call MSXTilesUD
		ld b,%01111111
		ld c,%10000000		;Topbit 1 = Background moves up (player going down)
		call SetTileDirUD
		ld a,0
		ld (MSX_Vert_Reverse_Plus1-1),a
		ld a,192				;Hight of the Tilemap
		ld (VerticalStrip_YHeightC_Plus1-1),a
	endif
	ifndef BuildMSX
		ld a,1
		ld (Background_UD_VertMoveSpeed_Plus1-1),a	;Need to reprogram the Inc/Dec of the direction of the MSX background

	endif
		ld hl,Background_UD_Background_DrawB
		ld (BackgroundRender_Plus2-2),hl

	jp DoSetScrollFinish

DoSetScrollLEFT:

		ld a,3
		call Akuyou_Aku_CommandNum		;Change player direction


		ld a,1	;0=left 1=right ;2=static
		call Akuyou_Background_GradientScroll	;Background gradient direction

		ld a,1
		call Akuyou_Background_SetScroll	;Game Engine direction for new objects and background

		ld a,6
		ld de,AnimatorPointersL
		call Akuyou_Aku_CommandNum	;Set Animators

		ld hl,Background_LR_Background_DrawB
		ifdef BuildMSX
		push iy
			call AkuYou_Player_GetPlayerVars	;We need to use a different background for the V9K
			bit 0,(iy-1)				;bottom bit will be 1 if V9k is present
			jr z,SetBackRegularLR
			ld hl,Background_LR_MSX2V9990	
SetBackRegularLR:
		pop iy
		endif

		ld (BackgroundRender_Plus2-2),hl

	ifndef BuildMSX
		ld hl,BitShifterReverse
		ld (BitShifterA_Plus2-2),hl
		ld (BitShifterB_Plus2-2),hl
		ld (BitShifterC_Plus2-2),hl
	endif
	ifdef BuildMSX
		call MSXTilesRL
		ld b,%01111111
		ld c,%00000000			;topbit=1 of scroll movement on MSX means scroll LEFT
		call SetTileDir
	endif
	jr DoSetScrollFinish


DoSetScrollCenter:
	ld a,5
	call Akuyou_Aku_CommandNum		;Change player direction

	ld a,3
	call Akuyou_Background_SetScroll

	ld a,6
	ld de,AnimatorPointersU
	call Akuyou_Aku_CommandNum	;Set Animators

	ifdef BuildMSX
		call MSXTilesCT
	endif
		ld hl,Background_CT_Background_DrawB
		ld (BackgroundRender_Plus2-2),hl

	jr DoSetScrollFinish

DoSetScrollRIGHT:

	ld a,3
	call Akuyou_Aku_CommandNum		;Change player direction

	ld a,6
	ld de,AnimatorPointersR
	call Akuyou_Aku_CommandNum		;Set Animators

	ld a,0	;0=left 1=right ;2=static
	call Akuyou_Background_GradientScroll  	;Background gradient direction

		ld a,0
		call Akuyou_Background_SetScroll ;Game Engine direction for new objects and background

		ld hl,Background_LR_Background_DrawB
		ifdef BuildMSX
			push iy
				call AkuYou_Player_GetPlayerVars	;We need to use a different background for the V9K
				bit 0,(iy-1)
				jr z,SetBackRegularLR2
				ld hl,Background_LR_MSX2V9990
SetBackRegularLR2:
			pop iy
		endif
		ld (BackgroundRender_Plus2-2),hl	
	ifndef BuildMSX

		ifdef BuildZXS
			ld hl,Akuyou_BitShifter		;Speccy bitshifter is built into the core
		else
			ld hl,BitShifter		;CPC/ENT one is not!
		endif
		ld (BitShifterA_Plus2-2),hl		;Bitshifter handles the scrolling of mountains and other tile bitmaps
		ld (BitShifterB_Plus2-2),hl
		ld (BitShifterC_Plus2-2),hl
	endif
	ifdef BuildMSX
		call MSXTilesRL
		ld b,%01111111
		ld c,%10000000			;topbit=1 of scroll movement on MSX means scroll RIGHT
		call SetTileDir
	endif
DoSetScrollFinish:
ret

ScrollChangeUp:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;******************************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;******************************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;******************************************************************************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;******************************************************************************************
ifdef BuildMSX

:
SetTileDirUD:
	ld a,(MSXTileList_UD1)	;Modify the scrolling if requred (allows reverse scroll)
	and b
	or c
	ld (MSXTileList_UD1),a
	ld a,(MSXTileList_UD2)
	and b
	or c
	ld (MSXTileList_UD2),a

	ret

SetTileDir:
	ld a,(MSXTileList_LR1)	;Left right version of the above
	and b
	or c
	ld (MSXTileList_LR1),a
	ld a,(MSXTileList_LR2)
	and b
	or c
	ld (MSXTileList_LR2),a
	ld a,(MSXTileList_LR3)
	and b
	or c
	ld (MSXTileList_LR3),a
	ret

MSXTilesUD:
	ld a,9
	ld d,0
	call Akuyou_VDP_CommandNum	;Get Sprite Bank

	;ld (TileYOffset_Plus2-2),hl



		ld a,0
		ld (VerticalStrip_YOffset_Plus1-1),a

		ld a,191				;Program vertical background Vertical strip code
		ld (VerticalStrip_YHeight_Plus1-1),a	;This code is also used by the 'surround' background, so we need to tweak it a bit.
		ld (VerticalStrip_YHeightB_Plus1-1),a


		ld hl,Akuyou_LevelStart
		ld b,7
		ld a,8
		call Akuyou_VDP_CommandNum	;Get Sprite Pos
		ld (TileXOffset_Plus2-2),ix	;XYPos of the tiles in Vram
		ld (TileYOffset_Plus2-2),iy

	ret
MSXTilesRL:
		ld a,9
		ld d,0
		call Akuyou_VDP_CommandNum	;Get Sprite Bank
		ld hl,Akuyou_LevelStart
		ld b,0
		ld a,8
		call Akuyou_VDP_CommandNum			;Get Sprite Pos
		ld (Background_LR_MSX_MainTilepos_Plus2-2),iy
	ret
MSXTilesCT:
	ld a,9
	ld d,0
	call Akuyou_VDP_CommandNum	;Get Sprite Bank

		ld hl,Akuyou_LevelStart
		ld b,3
		ld a,8
		call Akuyou_VDP_CommandNum	;Get Horiz Sprite Pos
		push iy
		pop hl
		ld (Background_CT_MSX_MainTilepos_Plus2-2),hl		;Source position of the tiles in VRAM
		ld (Background_CT_MSX_MainTileposB_Plus2-2),hl


		ld a,16
		ld (VerticalStrip_YOffset_Plus1-1),a


		ld hl,Akuyou_LevelStart		;MemAddr
		ld b,8				;sprnum
		ld a,8				;Command
		call Akuyou_VDP_CommandNum	;Get Sprite Pos


		ld (TileYOffset_Plus2-2),iy	;Store the Vert  tile position in Tile code
		ld (TileXOffset_Plus2-2),ix
	
		ld a,192-33				;Program the surround background Vertical strip code (MSX)
		ld (VerticalStrip_YHeight_Plus1-1),a
		ld (VerticalStrip_YHeightB_Plus1-1),a
		ld (VerticalStrip_YHeightC_Plus1-1),a

	ret


endif

list
null: ret					;Need a null definition for selfmodding code!
ShowWaveText:


ifdef BuildZXS

	ld a,64+3 :WaveFlash_Plus1			;Toggle the speccy flash color
	inc a
	and %00001111
	cp 8
	jr c, FlashOK
	ld a,3
FlashOK:
	ld c,a
	ld (WaveFlash_Plus1-1),a			;Set the text color
	ld a,1
	call Akuyou_ZXSGPU_CommandNum



	ld hl,Akuyou_DrawText_PrintString		;We're in the &C000 range, and we have to swap the screen into that area, 
	ld a,7						;so we use 'Calldefined' to do it
	call Akuyou_Bankswapper_CallDefined_Set


endif


	ld a,50 :showtextTimeout_plus1			;Countdown of time to show the message
	dec a
	jr z,ShowWaveTextOFF
	ld (showtextTimeout_plus1-1),a

	ld a,255
	ldia

	ld a,2
	call Akuyou_SpriteBank_Font
	ld hl,&100A
	call Akuyou_DrawText_LocateSprite ; set location
	ld bc,WaveText

	ifdef BuildZXS
		call Akuyou_Bankswapper_CallDefined	;We're in the &C000 range, and we have to swap the screen into that area, 
		ld hl,Akuyou_DrawText_Decimal		;so we use 'Calldefined' to do it
		ld a,7
		call Akuyou_Bankswapper_CallDefined_Set

	else
		call Akuyou_DrawText_PrintString	;Print wave message
	endif





	ld a,0		:WaveNumber_Plus1

	ifdef BuildZXS
		call Akuyou_Bankswapper_CallDefined
	else
		call Akuyou_DrawText_Decimal		;Show digits
	endif
	ret



ShowWaveTextOFF:					;Turn off the wave message
	ld hl,null
	ld (ShowWaveTextCall_Plus2-2),hl
	ret
ifdef CompileTC
WaveText: db "Wave:",&80				;Wave text... change to level if you prefer
else
WaveText: db "Level:",&80				;Wave text... change to level if you prefer
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 			LEVEL JUMPBLOCK - Don't mess with anything here!
;		This is where the bootstrap starts the game... note only &3FF0 is actually used.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelJumpBlock:
	defs FileBeginLevel+&3FF0-LevelJumpBlock
		jp LevelInit; - Level Start &3ff0
		jp LevelLoop; - Level loop &3ff3
	FileEndLevel:
limit &FFFF


 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Notes on converting a EP1 level to V1.666 core
;


;Level fixes
; get rid of ORG statements
; apply new Init
;		call Akuyou_Interrupt_Init	instead of 	call Akuyou_RasterColors_Init
;replace ldia 
