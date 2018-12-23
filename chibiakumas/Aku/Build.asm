;**** rebuild Level 0 and check 
;Richard Farrell is in the patreons



nolist

CompileEP1 equ 1

BuildLang equ 'j' ; J=Japanese
;BuildLang equ 'r' ; Russian

;buildCPC equ 1		;Amstrad CPC 
ifdef BuildCPC
;	DiskMap_SingleDisk equ 1
endif


;buildENT equ 1		;Enterprise 128


buildMSX equ 1		;MSX

ifdef buildMSX
	buildMSX_V9K equ 1 	;V9990 support
endif

;buildZXS equ 1		;ZX Spectrum


ifdef buildZXS
;	buildZXS_DSK equ 1	;- for disksystem
	buildZXS_TRD equ 1	;- for disksystem
;	buildZXS_TAP equ 1	;- for disksystem
endif


;DebugSprite equ 1
;Debug_ShowLevelTime equ 1

;Monitor_Full equ 1
;Debug_Monitor equ 1
;Monitor_Pause equ 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ifndef BuildLang 
	BuildLang equ ''

endif

if BuildLang ='j' 
	endchar equ 255
else
	endchar equ ' '+&80
endif

ifdef BuildCPC

	AdvancedInterrupts equ 1 ;Enable shadow stack so stack abuse can occur during interrupts!

	print " *** CPC Build *** " 
	BuildCPCv equ 1
	Support64k equ 1  ; enable code only needed by 64k
	Support128k equ 1 ; enable code only needed by 128k+ (keep enabled for 256/512k etc)
	SupportPlus equ 1
	CPC320 equ 1	;CPC Screen width=320 (otherwise 256)
else 
	BuildCPCv equ 0
endif

ifdef BuildENT
	AdvancedInterrupts equ 1

	DiskMap_SingleDisk equ 1

	print " *** Enterprise Build *** " 
	BuildENTv equ 1
;	Support64k equ 1  ; enable code only needed by 64k
	Support128k equ 1 ; enable code only needed by 128k+ (keep enabled for 256/512k etc)
	CPC320 equ 1	;CPC Screen width=320 (otherwise 256)
else 
	BuildENTv equ 0
endif

ifdef BuildZXS
	print " *** Spectrum Build *** " 

	ifdef buildZXS_TRD
		DiskMap_SingleDisk equ 1
	endif
	ifdef buildZXS_TAP
		DiskMap_SingleDisk equ 1
	endif


	BuildZXSv equ 1
	;buildCPC equ 1
	Support64k equ 1  ; enable code only needed by 64k
	Support128k equ 1 ; enable code only needed by 128k+ (keep enabled for 256/512k etc)
	;SupportPlus equ 1
else
	BuildZXSv equ 0
endif


ifdef buildMSX
	print " *** MSX Build *** " 
	ifdef buildMSX_V9K
	print " *** V9990 Build *** " 
	endif

	DiskMap_SingleDisk equ 1

	BuildMSXv equ 1
	;buildCPC equ 1
	Support64k equ 1  ; enable code only needed by 64k
	Support128k equ 1 ; enable code only needed by 128k+ (keep enabled for 256/512k etc)
	;SupportPlus equ 1
else 
	BuildMSXv equ 0
endif
	BuildSAMv equ 0
	BuildTI8v equ 0



ifdef BuildCPC
	if BuildMSXv+BuildZXSv+BuildENTv+BuildSAMv+BuildTI8v
		print "Bad Build - Multiple targets selected"
		stop
	endif
endif
ifdef BuildMSX
	if BuildCPCv+BuildZXSv+BuildENTv+BuildSAMv+BuildTI8v
		print "Bad Build - Multiple targets selected"
		stop
	endif
endif
ifdef BuildZXS
	if BuildCPCv+BuildMSXv+BuildENTv+BuildSAMv+BuildTI8v
		print "Bad Build - Multiple targets selected"
		stop
	endif
endif

if BuildLang ='j'
	print " *** Japanese Build *** " 
endif
if BuildLang =''
	chrHeart equ 122+5

	print " *** English Build *** " 
endif
if BuildLang ='r'
	print " *** Russian Build *** " 
endif

ifndef BuildLevel
	Read "..\Aku\Core.asm"
endif