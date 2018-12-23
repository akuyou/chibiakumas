;Layout
;defb EVT+V ,b1,b2,b3,b4,b5,b6

; where an event needs to bytes w1 w2 etc will be used

evtSettingsBank_Save equ %10010000+15		;Save settings to bank b1
evtSettingsBank_Load equ %10010000;+V		;Load settings from bank V

evtSettingsBankEXT_Save equ %10110000+15	;Save ExtraBank settings to bank b1
evtSettingsBankEXT_Load equ %10110000;+V	;Load ExtraBank settings from bank V

evtMultipleCommands equ %01110000;+V		;Multiple commands... V commands will follow


evtSetMoveLife     equ 128			;Set Move to b1, Set Life to b2
evtSetProg	   equ 129			;Set Prog to b1
evtSetLife	   equ 130			;set Life to b1
evtSetMove	   equ 131			;set Move to b1
evtSetProgMoveLife equ 132			;Set prog to b1, Set move to b2, set life to b3
evtSetSprite	   equ 133			;set sprite to b1
evtAddToForeground equ 135			;Add oject to foreground (back of object array)
evtAddToBackground equ 134			;Add oject to foreground (back of object array)
evtJumpToNewTime   equ 136			;Change event stream position to w1 , and levetime to b2... time in b2 must be lower than first event at w1
evtCallAddress	   equ 137			;Call a memory address w1... make sure you don't change any registers (other than A)
evtSaveLstObjToAdd equ 138			;Save the memory position of last added object in the object array to memory location w1... used for boss sprites
evtResetPowerup    equ 139			;Take away the player powerups... how mean!
evtSetLevelSpeed   equ 140			;Change the speed of the object array to b1... %00000100 is default.. .%00000010 is faster
evtSetObjectSize   equ 141 			;set Object sprite size to b1... default is 24
evtSetAnimator	   equ 142			;set animator to b1... 0 means no animator
evtSetAnimatorPointers   equ 143 		;set address of array of animators to w1


evtStarburt 		equ %01000000		;0100xxxx X Y   = (64) add stars to X,Y (pattern xxxx) - is this ever used???
evtReprogramPalette 	equ %11110000		;Reprogram the CPC palette - no effect on other systems
evtReprogramPlusPalette 	equ %11110001	;Reprogram the CPC PLUS palette

evtReprogramHitHandler 	equ %11110010		;Define Custom hit handler as call to w1, used for boss battles
evtReprogramShotToDeath	equ %11110011		;Define Custom destroy object event as call to w1, used for nuke satellite, and lasers in Ep2 Tech Noir level
evtReprogramSmartBombed equ %11111100

evtReprogramCustomPlayerHitter equ %11111011 	;Define Custom hit handler for players as call to w1 - used for steaks in Alchemy level of ep2

evtReprogramCustomMove1 equ %11110100		;Define Custom Move handler1 to call w1 each object move
evtReprogramCustomMove2 equ %11110101		;Define Custom Move handler1 to call w2 each object move
evtReprogramCustomMove3 equ %11110111		;Define Custom Move handler1 to call w3 each object move
evtReprogramCustomMove4 equ %11111000		;Define Custom Move handler1 to call w4 each object move

evtReprogramCustomProg1 equ %11111001		;Define Custom Programmer handler1 to call w1 each program tick (custom fire patterns)
evtReprogramCustomProg2 equ %11111010		;Define Custom Programmer handler1 to call w2 each program tick (custom fire patterns)

evtReprogram_PowerupSprites 	  equ 	%11110110	;Define the sprite numbers of the power up objects and coin to b1,b2,b3,b4

evtReprogramObjectBurstPosition	  equ 	%11111101	;Set Burst Animation position to (b1,b2)... used for nuke blasts in Ep2
evtReprogramObjectFullCustomMoves equ	%11111110	;All Move events call to w1

evtReprogramSmartBombSpecial 	  equ	%11111111	;Smart bomb event calls to w1... used by omega array to wipe omega stars

evtSingleSprite equ 0					;Single sprite... multiple options depending on V	
							;0+0 		add one object...sprite b1.. at pos (b2,b3)
							;0+1   		Add one sprite to pos b1 Far right (sprite predefined)
							;0+(2-13)	add one 24 pixel object far right X=160+24 Y=v*16 -8 (sprite predefined)

evtBurstSprite equ 14					;Add an object to the burst position
evtTileSprite equ 48 					;add  V objects... all on column b1 starting at row b2.. Spaced b3 apart vertically


;Time,type,Sprite,XY (16 px precision)

; Types:
;type XXXX----
;     00000000 A X Y = (0)  add one object A=sprnum, X , Y
;     00000001 Y    	Add one sprite to pos Y Far right (Same sprite as last time
;     0000yyyy A	2-13 add one 24 pixel object far right X=160+24 Y*16 -8 (Same sprite as last time
			;14 Add one to ObjectBurst
;     0001xxxx A B = (16) add  xxxx objects
;     0010xxxx X B = (32) add  xxxx objects all on column X
;     0011xxxx X Y S = (48) add  xxxx objects all on column X, Ypos Spaced S apart vertically
;     0100xxxx X Y   = (64) add stars to X,Y (pattern xxxx)
;     0101       Unused
;     0110       Unused
;     0111xxxx  = (112) Read Multiple events at the same time point

;     10000000 M L = (128) Change object movement to M, Life to L
;     10000001 P = (129) Change object Program
;     10000010 L = (130) Change object Life
;     10000011 M = (131) Change object Move
;     10000100 P M L = (132) Change object Program Move and Life
;     10000101 S = (133) Change object Sprite (only works with 0000XXXX )
;     10000110 (134) Add Objects to Front of list first (Background)
;     10000111 (135) Add Objects to Back of list first (Foreground) - Background objects may not be shown in turbo mode!
;     10001000 L H T (136) = Load HL as next event pointer, change time to T
;     10001001 L H   (137) = Call HL 
;     10001010 L H   (138) = Load last added object address to address HL
;     10011111 B = Save to bank B
;     1001XXXX 	Load object settings (Prog, Move,Life,Spritesize,Animator,BG/FG layer) from XXXX bank (0-14 - see above 15 is save command)
;		Use this function to create template enemy moves and background object types
;     1010       Unused
;     1011       Unused	
;     1100XXXX   Unused
;     1101XXXX   Unused
;     1110XXXX   Unused
;     1111XXXX   Reprogram memory chunk

;     1111XXXX   Reprogram memory chunk
;     11110000 O B	X X X  = (240) Reprogram palette (B no of Bytes, O = offset; X X X byte data)
;     11110001 O B	X X X  = (240) Reprogram Background (B no of Bytes (up to 41), O = offset; X X X byte data)
;     11110010 LH 	= when an object is shot jump to HL (Akuyou_Object_DecreaseLifeShot is true hitcounter)
;     11110011 1P2	= Scroll rate 1 before P then 2 (1 must be faster than 2)
;     11110100 LH	= Reprogram Custom Move1
;     11110101 LH	= Reprogram Custom Move2

; Life BPxxxxx 		B=hurt by bullets , P hurts player, xxxxxx = Life ... Life decreases either over time or due to hits %00000000 means an immortal object which will only dissapear if it goes ofscreen

;Domoves
;0MYYYXXX	; Linear move
;11ddXXXX	; Background (Slow) move
;100001XX	; Seek player 1 speed -----XX1
;1010DSPP	D = Depth bit, S= Speed, PP Position


;1 =4 px
;2 = 8 px
;3 = 16 px
;4 = 24 px
;5 = 32 px
;6 = 48 px
;7 = 64 px
;8 = 96 px
;9 = 128 px

prgNothing	equ 0 ;PrgSpare
PrgBitShift	equ 1 ;Change sprite bank according to X
prgSpecial	equ 2
prgBonus 	equ 3
prgMovePlayer	equ 4

prgSpriteBank0	equ 0
prgSpriteBank1	equ 5
prgSpriteBank2	equ 6
prgSpriteBank3	equ 7		;use PrgNothing for Bank 0


prgSpecialHitPlayer equ 2+16

prgSmartBombableSpriteBank0	equ 0+16
prgSmartBombableSpriteBank1	equ 5+16
prgSmartBombableSpriteBank2	equ 6+16
prgSmartBombableSpriteBank3	equ 7+16		;use PrgNothing for Bank 0

prgCustom1Protected 	equ 8				;Custom 1 - protected from smart bomb


;move chibiko to a point - only used by ep 2

;Not programmed in yet
;prgCustom2Protected 	equ 9				;Custom 2 - protected from smart bomb
;prgCustom3Protected 	equ 10				;Custom 3 - protected from smart bomb
;prgCustom4Protected 	equ 11				;Custom 4 - protected from smart bomb


;All under 31 Do not get killed by smartbomb except 0
prgFireSnail	equ %10000000
prgFireSlow	equ %01100000
prgFireMid	equ %01000000
prgFireMid2	equ %11000000
prgFireFast	equ %00100000
prgFireHyper	equ %10100000

; Fire Patterns

;defw	Stars_AddObject			;0 = just one - Special use only

;Quarter bursts
fireTopLeft 	equ	1
fireBottomLeft	equ 	2
fireTopRight	equ	3
fireBottomRight	equ 	4

;half bursts
fireTop		equ 	5
fireBottom	equ	6
fireLeft	equ	7
fireRight	equ	8


;triangle bursts
fireTopWide	equ	9
fireBottomWide	equ	10
fireLeftWide	equ	11
fireRightWide	equ	12

;Omni burst
fireBurst 	equ 	13
fireSmallBurst 	equ 	14
fireOuterBurst 	equ 	15	;Necromancer attack

;single dot
fireSingleWest 		equ 16
fireSingleNorthWest 	equ 17
fireSingleNorth 	equ 18
fireSingleNorthEast 	equ 19
fireSingleEast 		equ 20
fireSingleSouthEast	equ 21
fireSingleSouth		equ 22
fireSingleSouthWest	equ 23

fireSingleFastWest 		equ 16+8;24
fireSingleFastNorthWest 	equ 17+8;25
fireSingleFastNorth 		equ 18+8;26
fireSingleFastNorthEast 	equ 19+8;27
fireSingleFastEast 		equ 20+8;28
fireSingleFastSouthEast		equ 21+8;29
fireSingleFastSouth		equ 22+8;30
fireSingleFastSouthWest		equ 23+8;31

;	Fire W				 16 
;	Fire NW				 17
;	Fire N				 18

prgCustom1 	equ %11111100			;Custom 1
prgCustom2 	equ %11111101			;Custom 2
prgCustom3 	equ %11111110			;Custom 3
prgCustom4 	equ %11111111			;Custom 4
specMoveChibiko  	equ 255


mveMisc		equ 0 ;used for visual clarity!
mveStatic 	equ &24
mveBackground   equ %11000000
mveSeaker_P1	equ %10000100
mveSeaker_P2	equ %10010000
mveSeaker	equ %10001000 ;seek! I can't spel!
mveWave		equ %10100000
;mveWaveSmall	equ %10010000 depricated
mveCustom1	equ %11110000
mveCustom2	equ %11100000
mveCustom3	equ %11010000
mveCustom4	equ %10110000

;	Moves - Regular
;		0	1	2	3	4	5	6	7
;		-4	-3	-2	-1	0	1	2	3
;-4	0	00	01	02	03	 04	05	06	07
;-3	1	08	09	0A	0B	 0C	0D	0E	0F
;-2	2	10	11	12	13	 14	15	16	17
;-1	3	18	19	1A	1B	 1C	1D	1E	1F
 
;0	4	20	21	22	23	[24]	25	26	27

;1	5	28	29	2A	2B	 2C	2D	2E	2F
;2	6	30	31	32	33	 34	35	36	37
;3	7	38	39	3A	3B	 3C	3D	3E	3F
 

mveFast 	equ &40
;	Moves - Fast
;		0	1	2	3	4	5	6	7
;		-4	-3	-2	-1	0	1	2	3
;-4	0	40	41	42	43	 44	45	46	47
;-3	1	48	49	4A	4B	 4C	4D	4E	4F
;-2	2	50	51	52	53	 54	55	56	57
;-1	3	58	59	5A	5B	 5C	5D	5E	5F
 
;0	4	60	61	62	63	[64]	65	66	67

;1	5	68	69	6A	6B	 6C	6D	6E	6F
;2	6	70	71	72	73	 74	75	76	77
;3	7	78	79	7A	7B	 7C	7D	7E	7F


lifCustom       equ 255		; We use 63 as a marker for custom code's INIT - a real life will be set by the custom code
lifEnemy	equ %11000000	;HurtByBullets,Hurts Player
lifTimed	equ %00000000	;Doesnt hurt, dies automatically
lifDeadly	equ %01000000	;Deadly and cant be shot
lifImmortal     equ 0
TwoFrameSprite  equ 128    ; sequence is 1,2 1,2 etc
FourFrameSprite equ 128+64 ; sequence is 1,3,2,4 ,1,3,2,4 etc

;Animators 4 bytes... Animator,X,Y,Z
anmEmpty 	equ 00		;do nothing
anmSprite 	equ 01		;Set object Sprite=X
anmMove 	equ 02		;Set object Move=X
anmProgram 	equ 03		;Set object program=X
anmLoop 	equ 04		;Repeat the animator now
anmSpriteMoveProg equ 05	;Set object Sprite=X,Move=Y,Program=Z
anmSwitchAnimator equ 06	;switch to a different animator
anmCondLoop 	equ 07		;loop until tick AND X is nonzero
anmCondjmp 	equ 08		;if tick AND X is nonzero, jump to frame X*anmFrameNum (eg 7*anmFrameNum = frame 7)
anmSpawnObject 	equ 09		;Spawn a new object based on defined object "X" at current position
anmKill	 	equ 10		;Kill the object
anmCall	 	equ 11		;Call memory location YX
anmHalt	 	equ 12		;End animation without loop


anmFrameNum 	equ 16


