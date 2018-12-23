
DiskMap_BootStrap    		equ &05C1
DiskMap_BootStrap_Size 		equ 4
DiskMap_BootStrap_Disk 		equ 0

DiskMap_MusicLevel 	  		equ &05C8 ;T05-SC8.D00
DiskMap_MusicLevel_Size 		equ 2
DiskMap_MusicLevel_Disk 		equ 0

DiskMap_PlayerSprite 		equ &06C1 ;T06-SC1.D00		;Speccy/MSX char sprites
DiskMap_PlayerSprite_Size 	equ 4
DiskMap_PlayerSprite_Disk 	equ 0


DiskMap_PlayerSpriteRLE		equ &06C2 ;T06-SC2.D00		;Speccy/MSX char sprites
DiskMap_PlayerSpriteRLE_Disk 	equ 0


DiskMap_PlayerSpriteBo 		equ &06C2 ;T06-SC2.D00
DiskMap_PlayerSpriteBo_Disk 	equ 0



DiskMap_PlusSprites    		equ &21C1	;T33-SC1.D00	;MSX Icons
DiskMap_PlusSprites_Size	equ 10
DiskMap_PlusSprites_Disk 	equ 0

DiskMap_PlusSpritesRLE 		equ &21C2	;T33-SC2.D00	;MSX Icons RLE
DiskMap_PlusSpritesRLE_Disk 	equ 0



DiskMap_PlusSpritesChibiko 	equ &21C2	;T33-SC2.D00
DiskMap_PlusSpritesChibiko_Disk equ 0

DiskMap_PlusSpritesBo  		equ &21C3	;T33-SC3.D01
DiskMap_PlusSpritesBo_Disk 	equ 0

;DiskMap_PlayerSpriteUD 		equ &06C3 ;T06-SC3.D00

;DiskMap_PlayerSpriteBoUD 	equ &06C4 ;T06-SC4.D00


DiskMap_Sfx	   		equ &06C8 ;T06-SC8.D00
DiskMap_Sfx_Size 		equ 2
DiskMap_Sfx_Disk 		equ 0

DiskMap_Font  	     		equ &07C1  ;T07-SC1.D00
;DiskMap_Font_Size 		equ 8
DiskMap_Font_Disk 		equ 0

DiskMap_MainMenu     		equ &08C1 ; T08-SC1.D01
DiskMap_MainMenu_Size 		equ 16
DiskMap_MainMenu_Disk 		equ DiskMap1

DiskMap_LevelLoadScreens12	equ &03C1	;T03-SC1.D01
DiskMap_LevelLoadScreens12_Size	equ 12
DiskMap_LevelLoadScreens12_Disk equ DiskMap1



DiskMap_LevelTest      		equ &62C1	;10  T98-SC1.D01
DiskMap_LevelTest_Disk 		equ DiskMap1


DiskMap_Level1       		equ &0AC1	;10  T10-SC1.D01
DiskMap_Level1_Disk 		equ DiskMap1


DiskMap_Level2       		equ &0EC1	;14 T14-SC1.D01
DiskMap_Level2_128   		equ &11C1	;17 T17-SC1.D01
DiskMap_Level2_C       		equ &0EC3	;14 T14-SC3.D01
DiskMap_Level2_D       		equ &0EC4	;14 T14-SC4.D01
DiskMap_Level2_Disk 		equ DiskMap1


DiskMap_Level3       		equ &14C1	;20	T20-SC1.D01
DiskMap_Level3_Size		equ 16
DiskMap_Level3_128   		equ &16C1	;22 T22-SC1.D01
DiskMap_Level3_128_Size		equ 16
DiskMap_Level3_Disk 		equ DiskMap1

DiskMap_Level4       		equ &18C1	;24 T24-SC1.D01
DiskMap_Level4_Size		equ 20
DiskMap_Level4_Disk 		equ DiskMap1
DiskMap_Level4_128   		equ &1BC1	;27 T27-SC1.D01
DiskMap_Level4_128_Size		equ 20

;DiskMap_Level4_C		equ &18C3	;27 T24-SC3.D01


DiskMap_Screens	       		equ &1DC1	;T29-SC1.D00
DiskMap_Screens_Size		equ 32
DiskMap_Screens_Disk 		equ 0




;DiskMap_PlusSpritesChibikoUD 	equ &21C4	;T33-SC4.D00
;DiskMap_PlusSpritesBoUD		equ &21C5	;T33-SC5.D00





DiskMap_GameOver    		equ &22C2	;T34-SC2.D01
DiskMap_GameOver_Size		equ 16
DiskMap_GameOver_Disk 		equ DiskMap1


;Note, we are loading this before the CORE, so we load by filename
DiskMap_LoadingScreen     		equ &26C1 ; T38-SC1.D01 
DiskMap_LoadingScreen_Size 		equ 32
DiskMap_LoadingScreen_Disk 		equ DiskMap1


DiskMap_LevelLoadScreens34	equ &03C1	;T03-SC1.D01
DiskMap_LevelLoadScreens34_Size	equ 12
DiskMap_LevelLoadScreens34_Disk equ DiskMap2


DiskMap_Level5       		equ &0AC1	;10 
DiskMap_Level5_Size		equ 16
DiskMap_Level5_128   		equ &0CC1	;12 T12-SC1.D02
DiskMap_Level5_128_Size		equ 16	; &2000
DiskMap_Level5_Disk 		equ DiskMap2


DiskMap_Level6       		equ &0EC1	;14
DiskMap_Level6_Size		equ 20
DiskMap_Level6_128   		equ &11C1	;17  T17-SC1.D02
DiskMap_Level6_128_Size		equ 20	;&2500 - 3 tracks
DiskMap_Level6_Disk 		equ DiskMap2


DiskMap_Level7       		equ &14C1	;20	
DiskMap_Level7_Size		equ 20
DiskMap_Level7_128   		equ &17C1	;23 T23-SC1.D02
DiskMap_Level7_128_Size		equ 16
DiskMap_Level7_Disk 		equ DiskMap2


DiskMap_Level8       		equ &19C1	;2 T25-SC1.D02
DiskMap_Level8_Size		equ 16
DiskMap_Level8_Disk 		equ DiskMap2
DiskMap_Level8_128   		equ &1BC1	;27  T27-SC1.D02
DiskMap_Level8_128_Size		equ 16


DiskMap_Level9       		equ &1DC1	;29 T29-SC1.D02
DiskMap_Level9_Size		equ 16
DiskMap_Level9_Disk 		equ DiskMap2
DiskMap_Level9_128   		equ &1FC1	;31  T31-SC1.D02
DiskMap_Level9_128_Size		equ 16

DiskMap_Stage_19		equ &1EC1	;29 T30-SC1.D02
DiskMap_Stage_19_Disk 		equ DiskMap3

DiskMap_Stage_20		equ &1FC1	;29 T31-SC1.D02
DiskMap_Stage_20_Disk 		equ DiskMap3
DiskMap_Stage_20B		equ &20C1	;29 T32-SC1.D02

DiskMap_EndIntro 	    		equ &26C1 ; T38-SC1.D02
DiskMap_EndIntro_Size 			equ 16
DiskMap_EndIntro_Disk 			equ DiskMap2
DiskMap_EndIntro_128   			equ &29C1 ;T41-SC1.D02
DiskMap_EndIntro_128_Size		equ 8

; Disk 3 - Anims!

DiskMap_EndOutro       		equ &0AC1+&2800	;10 T50-SC1.D03
DiskMap_EndOutro_Size		equ 16
DiskMap_EndOutro_128   		equ &0CC1+&2800	;12 T52-SC1.D03
DiskMap_EndOutro_128_Size	equ 8	
DiskMap_EndOutro_Screens  	equ &0DC1+&2800	;13 T53-SC1.D03
DiskMap_EndOutro_Screens_Size	equ 24	
DiskMap_EndOutro_Disk 		equ DiskMap3





DiskMap_Intro       		equ &10C1+&2800	; T56-SC1.D03
DiskMap_Intro_Size		equ 13
DiskMap_Intro_128   		equ &12C1+&2800	; T58-SC1.D03
DiskMap_Intro_128_Size		equ 8	
DiskMap_Intro_Screens  		equ &13C1+&2800	; T59-SC1.D03
DiskMap_Intro_Screens_Size	equ 32	
DiskMap_Intro_Screens2  	equ &17C1+&2800	; T63-SC1.D03
DiskMap_Intro_Screens2_Size	equ 32	
DiskMap_Intro_Disk 		equ DiskMap2

DiskMap_IntroEp2_Disk 		equ DiskMap4


DiskMap_MusicIntro 	  		equ &1BC1+&2800 ;T67-SC1.D03
DiskMap_MusicIntro_Size 			equ 2
DiskMap_MusicIntro_Disk 			equ DiskMap3



; Common disk entries
	
DiskMap_MusicBoss 	  		equ &24C1 ;36 ;T36-SC1.D00
DiskMap_MusicBoss_Size 			equ 2
DiskMap_MusicBoss_Disk 			equ 0

DiskMap_MusicMenu 	  		equ &24C3 ;36 ;T36-SC3.D00
DiskMap_MusicMenu_Size 			equ 2
DiskMap_MusicMenu_Disk 			equ 0

DiskMap_Core  	     		equ &25C1  	;37
DiskMap_Core_Size 		equ 19
DiskMap_Core_Disk 		equ 0

DiskMap_Core_128  	   	equ &25C8  	;T37-SC8.D00
DiskMap_Core_128_Size 		equ 2
DiskMap_Core_128_Disk 		equ 0


			;&29 is last track

;Size in 512k Sectors
