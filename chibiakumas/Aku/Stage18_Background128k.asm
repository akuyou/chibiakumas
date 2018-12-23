
read "CoreDefs.asm"

org &4000
jp PicStage18bmp
jp PicStage18bbmp

PicStage18bmp:

	ld (Background_CompiledSprite_Minus1+1),de
	call Akuyou_ScreenBuffer_GetActiveScreen
	ld h,a
	ld l,&50
	ld (StackRestore_Plus2-2),sp
	di
	ld sp,hl

LD IX,PicStage18bmp_DrawOrder
JP JumpToNextLine


PicStage18bmp_Line_0:
call BitmapPush6
defw BitmapData+5
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
call MultiPushDe8
call BitmapPush6
defw BitmapData+11
Ld D,&80
  PUSH DE
  PUSH DE
LD BC,&1122
  Push BC
LD HL,&4488
  Push HL
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
Ld E,&00
call MultiPushDe8
LD BC,&1100
  Push BC
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_1:
call MultiPushDe6
LD HL,&1100
  Push HL
call MultiPushDe7
call BitmapPush6
defw BitmapData+23
Ld D,&80
  PUSH DE
  PUSH DE
LD BC,&1122
  Push BC
LD HL,&4488
  Push HL
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
Ld E,&00
call MultiPushDe7
LD BC,&0088
  Push BC
jp MultiPushDeLast6


PicStage18bmp_Line_2:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
call MultiPushDe7
call BitmapPush24
defw BitmapData+53
call MultiPushDe7
LD BC,&0044
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_3:
call MultiPushDe6
LD HL,&4400
  Push HL
LD BC,&CCFF
  Push BC
DEC DE

call MultiPushDe6
call BitmapPush24
defw BitmapData+77
call MultiPushDe6
LD HL,&FF33
  Push HL
LD BC,&0022
  Push BC
INC DE

jp MultiPushDeLast6


PicStage18bmp_Line_4:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L


  PUSH DE
  PUSH DE
Ld D,H


call MultiPushDe6
call BitmapPush24
defw BitmapData+101
call MultiPushDe6
Ld E,&11
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_5:
call MultiPushDe6
call BitmapPush30
defw BitmapData+131
call BitmapPush26
defw BitmapData+157
jp MultiPushDeLast6


PicStage18bmp_Line_6:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+167
LD DE,&70F0
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+195
LD DE,&F0E0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+205
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_7:
call MultiPushDe6
call BitmapPush22
defw BitmapData+227
Ld D,&80
  PUSH DE
  PUSH DE
LD HL,&2222
  Push HL
LD BC,&4444
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+249
Ld E,&00
jp MultiPushDeLast6


PicStage18bmp_Line_8:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld E,L

  PUSH DE
  PUSH DE

Ld E,H

call MultiPushDe6
call BitmapPush6
defw BitmapData+255
Ld D,&80
  PUSH DE
  PUSH DE
LD HL,&2222
  Push HL
LD BC,&4444
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+261
Ld E,&00
call MultiPushDe6
Ld D,&11
  PUSH DE
  PUSH DE
Ld D,E
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_9:
call MultiPushDe7
call BitmapPush14
defw BitmapData+275
  PUSH DE
call BitmapPush20
defw BitmapData+295
  PUSH DE
call BitmapPush14
defw BitmapData+309
jp MultiPushDeLast7


PicStage18bmp_Line_10:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&22
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+339
call BitmapPush14
defw BitmapData+353
LD DE,&0044
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_11:
call MultiPushDe7
Ld D,&44
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&CC00
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+373
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&22
  PUSH DE
  PUSH DE

Ld E,B

jp MultiPushDeLast7


PicStage18bmp_Line_12:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+389
  PUSH DE
call BitmapPush16
defw BitmapData+405
  PUSH DE
call BitmapPush16
defw BitmapData+421
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_13:
call MultiPushDe7
Ld E,&11
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+441
LD DE,&4422
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+461
LD DE,&8800
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicStage18bmp_Line_14:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&22
  PUSH DE
  PUSH DE

Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&33
  Push HL
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+477
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&44
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_15:
call MultiPushDe7
call BitmapPush12
defw BitmapData+489
  PUSH DE
LD HL,&3300
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+505
  PUSH DE
LD BC,&00CC
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+517
jp MultiPushDeLast7


PicStage18bmp_Line_16:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE

Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+527
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+543
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+551
  PUSH DE
Ld D,&11
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_17:
call MultiPushDe8
Ld D,&11
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+437
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+567
  PUSH DE
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
LD BC,&3300
  Push BC
  PUSH DE
Ld E,&88
  PUSH DE
  PUSH DE

Ld E,L

jp MultiPushDeLast8


PicStage18bmp_Line_18:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
call BitmapPush8
defw BitmapData+575
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+591
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+599
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_19:
call MultiPushDe8
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+615
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0022
  Push BC
jp MultiPushDeLast8


PicStage18bmp_Line_20:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&CC
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+627
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_21:
call MultiPushDe8
LD HL,&0011
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+639
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8800
  Push BC
jp MultiPushDeLast8


PicStage18bmp_Line_22:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&0022
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+649
LD HL,&0022
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
call MultiPushDe5
LD BC,&8800
  Push BC
LD HL,&1100
  Push HL
 jp NextLinePushDe1


PicStage18bmp_Line_23:
call MultiPushDe8
LD HL,&00CC
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
Call PushDE_0000x
call BitmapPush12
defw BitmapData+661
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
INC DE

jp MultiPushDeLast8


PicStage18bmp_Line_24:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe14
call BitmapPush12
defw BitmapData+673
call MultiPushDe14
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_25:
call MultiPushDe17
call BitmapPush12
defw BitmapData+685
jp MultiPushDeLast17


PicStage18bmp_Line_26:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe14
LD HL,&0044
  Push HL
Ld C,&22
  Push BC
LD DE,&8811
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
LD BC,&2200
  Push BC
Ld D,L
Ld E,L

call MultiPushDe14
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_27:
call MultiPushDe17
call BitmapPush12
defw BitmapData+697
jp MultiPushDeLast17


PicStage18bmp_Line_28:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+705
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_29:
call MultiPushDe18
call BitmapPush8
defw BitmapData+713
jp MultiPushDeLast18


PicStage18bmp_Line_30:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+721
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_31:
call MultiPushDe18
call BitmapPush8
defw BitmapData+729
jp MultiPushDeLast18


PicStage18bmp_Line_32:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+737
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_33:
call MultiPushDe18
call BitmapPush8
defw BitmapData+745
jp MultiPushDeLast18


PicStage18bmp_Line_34:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+753
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_35:
call MultiPushDe18
call BitmapPush8
defw BitmapData+761
jp MultiPushDeLast18


PicStage18bmp_Line_36:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe16
LD HL,&3300
  Push HL
Ld C,&CC
  Push BC
call MultiPushDe16
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_37:
call MultiPushDe19
LD HL,&2200
  Push HL
LD BC,&0044
  Push BC
jp MultiPushDeLast19


PicStage18bmp_Line_38:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe34
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_39:
jp MultiPushDeLast40


PicStage18bmp_Line_38_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_38
PicStage18bmp_Line_39_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_39
PicStage18bmp_Line_72:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&E0F0
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&F070
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_73:
call MultiPushDe8
LD HL,&2000
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
jp MultiPushDeLast8


PicStage18bmp_Line_74:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&2000
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_73_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_73
PicStage18bmp_Line_74_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_74
PicStage18bmp_Line_77:
call MultiPushDe6
LD HL,&0040
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+767
call MultiPushDe18
call BitmapPush6
defw BitmapData+773
  PUSH DE
LD BC,&2000
  Push BC
jp MultiPushDeLast6


PicStage18bmp_Line_78:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&A0
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+779
call MultiPushDe18
call BitmapPush6
defw BitmapData+785
  PUSH DE
LD BC,&5000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_79:
call MultiPushDe6
call BitmapPush10
defw BitmapData+795
call MultiPushDe18
call BitmapPush10
defw BitmapData+805
jp MultiPushDeLast6


PicStage18bmp_Line_80:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+815
call MultiPushDe18
call BitmapPush10
defw BitmapData+825
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_81:
call MultiPushDe6
LD HL,&4000
  Push HL
LD BC,&40E0
  Push BC
  PUSH DE
LD HL,&C080
  Push HL
Ld B,E
Ld C,L

  Push BC
call MultiPushDe18
LD HL,&1000
  Push HL
LD BC,&1030
  Push BC
  PUSH DE
LD HL,&7020
  Push HL
Ld B,E
Ld C,L

  Push BC
jp MultiPushDeLast6


PicStage18bmp_Line_82:
  PUSH DE
call BitmapPush6
defw BitmapData+831
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&8030
  Push BC
  PUSH DE
LD HL,&0070
  Push HL
LD BC,&0040
  Push BC
call MultiPushDe18
LD HL,&2000
  Push HL
LD BC,&E000
  Push BC
  PUSH DE
LD HL,&C010
  Push HL
Ld B,E
Ld C,L

  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+837
 jp NextLinePushDe1


PicStage18bmp_Line_83:
  PUSH DE
  PUSH DE
LD HL,&0010
  Push HL
LD BC,&8000
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C000
  Push HL
  PUSH DE
LD BC,&0040
  Push BC
LD HL,&0020
  Push HL
call MultiPushDe18
LD BC,&4000
  Push BC
LD HL,&2000
  Push HL
  PUSH DE
LD BC,&0030
  Push BC
Ld H,&80
  Push HL
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
  Push HL 
 jp NextLinePushDe2


PicStage18bmp_Line_84:
  PUSH DE
call BitmapPush6
defw BitmapData+843
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+853
call MultiPushDe18
call BitmapPush10
defw BitmapData+863
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+869
 jp NextLinePushDe1


PicStage18bmp_Line_85:
  PUSH DE
  PUSH DE
LD HL,&0010
  Push HL
LD BC,&8000
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+879
call MultiPushDe18
call BitmapPush10
defw BitmapData+889
  PUSH DE
  PUSH DE
LD HL,&0010
  Push HL
LD BC,&8000
  Push BC
 jp NextLinePushDe2


PicStage18bmp_Line_86:
  PUSH DE
call BitmapPush6
defw BitmapData+843
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&1040
  Push BC
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&4000
  Push BC
call MultiPushDe18
LD HL,&0020
  Push HL
LD BC,&0010
  Push BC
  PUSH DE
LD HL,&2080
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+869
 jp NextLinePushDe1


PicStage18bmp_Line_87:
  PUSH DE
call BitmapPush8
defw BitmapData+897
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&1020
  Push BC
  PUSH DE

Ld L,B

  Push HL
LD BC,&4000
  Push BC
call MultiPushDe18
LD HL,&0020
  Push HL
Ld B,&80
  Push BC
  PUSH DE
LD HL,&4080
  Push HL
Ld B,&10
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+897
 jp NextLinePushDe1


PicStage18bmp_Line_88:
  PUSH DE
call BitmapPush8
defw BitmapData+905
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&0010
  Push BC
  PUSH DE
Ld L,&20
  Push HL
LD BC,&4000
  Push BC
call MultiPushDe18
LD HL,&0020
  Push HL
  Push BC
  PUSH DE
Ld B,&80
  Push BC
LD HL,&1000
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+913
 jp NextLinePushDe1


PicStage18bmp_Line_89:
call BitmapPush16
defw BitmapData+929
  PUSH DE
LD HL,&0040
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe18
LD HL,&0020
  Push HL
Ld B,L


  Push BC
  PUSH DE
call FinalBitmapPush16
defw BitmapData+945


PicStage18bmp_Line_90:
call BitmapPush16
defw BitmapData+961
  PUSH DE
LD HL,&0080
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe18
LD HL,&0010
  Push HL
Ld B,L


  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+967
call FinalBitmapPush10
defw BitmapData+977


PicStage18bmp_Line_91:
Ld E,&20
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&0060
  Push BC
LD DE,&4000
  PUSH DE
  PUSH DE
Ld H,E
Ld L,D

  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+983
Ld D,E
call MultiPushDe18
LD BC,&0010
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
Ld C,&20
  Push BC
Ld H,C


  Push HL

Ld E,H

  PUSH DE
  PUSH DE
LD BC,&6000
  Push BC
LD HL,&00E0
  Push HL
LD DE,&4000
 jp NextLinePushDe2


PicStage18bmp_Line_92:
call BitmapPush14
defw BitmapData+997
  PUSH DE
call BitmapPush8
defw BitmapData+1005
Ld D,E
call MultiPushDe16
call FinalBitmapPush24
defw BitmapData+1029


PicStage18bmp_Line_93:
LD HL,&0080
  Push HL
LD BC,&0060
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1039
  PUSH DE
LD HL,&1010
  Push HL
Ld B,E
Ld C,L

  Push BC
call MultiPushDe16
LD HL,&8000
  Push HL
Ld B,H
Ld C,H

  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1049
  PUSH DE
  PUSH DE
LD HL,&6000
  Push HL
LD BC,&1000
 jp NextLinePushBC 


PicStage18bmp_Line_94:
  PUSH DE
call BitmapPush8
defw BitmapData+1057
Ld E,&20
  PUSH DE
  PUSH DE
LD DE,&2000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1063
Ld D,E
call MultiPushDe16
call BitmapPush6
defw BitmapData+1069
Ld E,&40
  PUSH DE
  PUSH DE
LD DE,&4000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1079


PicStage18bmp_Line_95:
call BitmapPush10
defw BitmapData+1089
LD DE,&0020
  PUSH DE
  PUSH DE
LD DE,&2000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1063
Ld D,E
call MultiPushDe16
call BitmapPush6
defw BitmapData+1069
Ld E,&40
  PUSH DE
  PUSH DE
LD DE,&4000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1099


PicStage18bmp_Line_96:
call BitmapPush8
defw BitmapData+1107
LD DE,&0020
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&2000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1063
Ld D,E
call MultiPushDe16
call BitmapPush6
defw BitmapData+1069
Ld E,&40
  PUSH DE
  PUSH DE
LD DE,&4000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1115


PicStage18bmp_Line_97:
call BitmapPush8
defw BitmapData+1123
LD DE,&0020
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&2000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1063
Ld D,E
call MultiPushDe16
call BitmapPush6
defw BitmapData+1069
Ld E,&40
  PUSH DE
  PUSH DE
LD DE,&4000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1131


PicStage18bmp_Line_98:
call BitmapPush10
defw BitmapData+1141
LD DE,&0020
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1151
Ld E,&00
call MultiPushDe16
LD HL,&8000
  Push HL
Ld B,H
Ld C,H

  Push BC
  PUSH DE
LD HL,&1020
  Push HL
LD BC,&0040
  Push BC
Ld D,C


  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1161


PicStage18bmp_Line_99:
Ld H,E
Ld L,E

  Push HL
Ld B,D
Ld C,D

  Push BC
Ld D,L


  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1177
call MultiPushDe16
call BitmapPush16
defw BitmapData+1193
  PUSH DE
  PUSH DE
LD HL,&2020
  Push HL
 jp NextLinePushDe1


PicStage18bmp_Line_100:
  PUSH DE
LD HL,&20A8
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
LD HL,&4040
  Push HL
  PUSH DE

Ld C,L

  Push BC

Ld L,E

  Push HL
  PUSH DE
Ld C,&80
  Push BC
Ld H,C


  Push HL
call MultiPushDe18
Ld C,&10
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
Ld C,&20
  Push BC
Ld H,C


  Push HL
  PUSH DE
Ld B,H


  Push BC
  PUSH DE
Ld H,&88
  Push HL
LD BC,&5140
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_101:
  PUSH DE
LD HL,&2020
  Push HL
  PUSH DE
  PUSH DE
LD BC,&4040
  Push BC
  PUSH DE
Ld H,E
Ld L,C

  Push HL

Ld C,E

  Push BC
  PUSH DE
Ld L,&80
  Push HL
Ld B,L


  Push BC
call MultiPushDe18
LD HL,&0010
  Push HL
Ld B,L


  Push BC
  PUSH DE
Ld L,&20
  Push HL
Ld B,L


  Push BC
  PUSH DE
Ld H,B


  Push HL
  PUSH DE
  PUSH DE
LD BC,&4040
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_102:
call BitmapPush16
defw BitmapData+1209
  PUSH DE
LD HL,&0040
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe18
LD HL,&0020
  Push HL
Ld B,L


  Push BC
  PUSH DE
call FinalBitmapPush16
defw BitmapData+1225


PicStage18bmp_Line_103:
call BitmapPush10
defw BitmapData+1235
Ld E,&80
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1243
Ld E,&00
call MultiPushDe18
LD HL,&0020
  Push HL
LD BC,&4000
  Push BC
  PUSH DE
LD HL,&8000
  Push HL
Ld D,&10
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1253


PicStage18bmp_Line_104:
  PUSH DE
call BitmapPush20
defw BitmapData+1273
Ld D,E
call MultiPushDe18
LD HL,&0040
  Push HL
LD BC,&8000
  Push BC
  PUSH DE
LD HL,&4080
  Push HL
  PUSH DE
call FinalBitmapPush12
defw BitmapData+1285


PicStage18bmp_Line_105:
call BitmapPush10
defw BitmapData+1295
Ld E,&80
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1303
Ld E,&00
call MultiPushDe18
LD HL,&0060
  Push HL
LD BC,&0010
  Push BC
  PUSH DE
LD HL,&2080
  Push HL
Ld D,C


  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1313


PicStage18bmp_Line_106:
  PUSH DE
call BitmapPush20
defw BitmapData+1333
Ld D,E
call MultiPushDe18
call FinalBitmapPush22
defw BitmapData+1355


PicStage18bmp_Line_107:
call BitmapPush22
defw BitmapData+1377
call MultiPushDe18
call FinalBitmapPush22
defw BitmapData+1399


PicStage18bmp_Line_108:
call BitmapPush16
defw BitmapData+1415
  PUSH DE
LD HL,&0040
  Push HL
LD BC,&0020
  Push BC
call MultiPushDe18
LD HL,&4000
  Push HL
LD BC,&2000
  Push BC
  PUSH DE
call FinalBitmapPush16
defw BitmapData+1431


PicStage18bmp_Line_109:
call BitmapPush16
defw BitmapData+1447
  PUSH DE
LD HL,&0070
  Push HL
LD BC,&0040
  Push BC
call MultiPushDe18
LD HL,&2000
  Push HL
LD BC,&E000
  Push BC
  PUSH DE
call FinalBitmapPush16
defw BitmapData+1463


PicStage18bmp_Line_110:
  PUSH DE
LD HL,&20A8
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
LD HL,&4040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
Ld L,&C0
  Push HL
  PUSH DE
LD BC,&C080
  Push BC
Ld H,E
Ld L,C

  Push HL
call MultiPushDe18
LD BC,&1000
  Push BC
LD HL,&1030
  Push HL
  PUSH DE
LD BC,&3020
  Push BC
Ld H,E
Ld L,C

  Push HL
  PUSH DE
Ld B,L


  Push BC
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&5140
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_111:
  PUSH DE
LD HL,&2020
  Push HL
  PUSH DE
  PUSH DE
LD BC,&4040
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+815
call MultiPushDe18
call BitmapPush10
defw BitmapData+825
  PUSH DE
LD HL,&2020
  Push HL
  PUSH DE
  PUSH DE
LD BC,&4040
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_112:
  PUSH DE
LD HL,&40C8
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
LD HL,&2020
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+795
LD BC,&2020
  Push BC
call MultiPushDe18
call BitmapPush10
defw BitmapData+805
  PUSH DE
LD HL,&4040
  Push HL
  PUSH DE
LD BC,&8800
  Push BC
LD HL,&3120
  Push HL
 jp NextLinePushDe1


PicStage18bmp_Line_113:
  PUSH DE
LD HL,&4080
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1020
  Push BC
  PUSH DE
LD HL,&00A0
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+779
call MultiPushDe18
call BitmapPush6
defw BitmapData+785
  PUSH DE
LD BC,&5000
  Push BC
  PUSH DE
LD HL,&4080
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1020
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_114:
  PUSH DE
call BitmapPush8
defw BitmapData+1471
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+767
call MultiPushDe18
call BitmapPush6
defw BitmapData+773
  PUSH DE
LD BC,&2000
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+1479
 jp NextLinePushDe1


PicStage18bmp_Line_115:
  PUSH DE
call BitmapPush8
defw BitmapData+1487
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1487
 jp NextLinePushDe1


PicStage18bmp_Line_116:
  PUSH DE
call BitmapPush8
defw BitmapData+1495
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1503
 jp NextLinePushDe1


PicStage18bmp_Line_117:
  PUSH DE
call BitmapPush8
defw BitmapData+1511
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1511
 jp NextLinePushDe1


PicStage18bmp_Line_118:
call BitmapPush6
defw BitmapData+1517
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1523


PicStage18bmp_Line_119:
call BitmapPush12
defw BitmapData+1535
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe20
LD HL,&0080
  Push HL
LD BC,&F070
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1535
call FinalBitmapPush6
defw BitmapData+1529


PicStage18bmp_Line_120:
call BitmapPush8
defw BitmapData+1543
Ld D,&40
  PUSH DE
  PUSH DE
Ld D,E
call MultiPushDe28
Ld E,&20
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1551


PicStage18bmp_Line_121:
call BitmapPush12
defw BitmapData+1563
Ld E,&00
call MultiPushDe28
call FinalBitmapPush12
defw BitmapData+1563


PicStage18bmp_Line_122:
call BitmapPush12
defw BitmapData+1575
call MultiPushDe28
call FinalBitmapPush12
defw BitmapData+1587


PicStage18bmp_Line_123:
  PUSH DE
call BitmapPush8
defw BitmapData+1595
call MultiPushDe30
call BitmapPush8
defw BitmapData+1595
 jp NextLinePushDe1


PicStage18bmp_Line_124:
  PUSH DE
call BitmapPush8
defw BitmapData+1603
call MultiPushDe30
call BitmapPush8
defw BitmapData+1611
 jp NextLinePushDe1


PicStage18bmp_Line_125:
  PUSH DE
  PUSH DE
LD HL,&0010
  Push HL
LD BC,&8000
  Push BC
call MultiPushDe32
LD HL,&0010
  Push HL
  Push BC
 jp NextLinePushDe2


PicStage18bmp_Line_126:
  PUSH DE
call BitmapPush6
defw BitmapData+843
call MultiPushDe32
call BitmapPush6
defw BitmapData+869
 jp NextLinePushDe1


PicStage18bmp_Line_125_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_125
PicStage18bmp_Line_126_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_126
PicStage18bmp_Line_129:
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe32
Ld H,E
Ld L,B

  Push HL
  Push BC
 jp NextLinePushDe2


PicStage18bmp_Line_133:
call MultiPushDe31
LD DE,&F0F0
call MultiPushDe5
LD HL,&F000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicStage18bmp_Line_134:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe27
LD HL,&00C0
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1617
 jp NextLinePushDe1


PicStage18bmp_Line_135:
call MultiPushDe30
LD HL,&0020
  Push HL
call MultiPushDe5
LD BC,&0040
  Push BC
 jp NextLinePushDe3


PicStage18bmp_Line_136:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe27
LD HL,&0020
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1140
 jp NextLinePushDe1


PicStage18bmp_Line_137:
call MultiPushDe30
LD HL,&0010
  Push HL
call MultiPushDe5
LD BC,&0080
  Push BC
 jp NextLinePushDe3


PicStage18bmp_Line_138:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe27
LD HL,&0010
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1623
 jp NextLinePushDe1


PicStage18bmp_Line_137_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_137
PicStage18bmp_Line_138_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_138
PicStage18bmp_Line_168:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe12
DEC DE

  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Call PushDE_0000x
Ld C,&FF
  Push BC
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD HL,&E010
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1623
 jp NextLinePushDe1


PicStage18bmp_Line_169:
call MultiPushDe12
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
LD HL,&1010
  Push HL
call MultiPushDe5
Ld C,&80
  Push BC
 jp NextLinePushDe3


PicStage18bmp_Line_170:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe8
LD HL,&FFFF
  Push HL
call MultiPushDe5
LD BC,&8800
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1629
call MultiPushDe5
call BitmapPush6
defw BitmapData+1140
 jp NextLinePushDe1


PicStage18bmp_Line_171:
call MultiPushDe10
LD HL,&FFFF
  Push HL
call MultiPushDe6
LD BC,&8800
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
call MultiPushDe6
LD BC,&FFFF
  Push BC
LD HL,&2020
  Push HL
call MultiPushDe5
LD BC,&0040
  Push BC
 jp NextLinePushDe3


PicStage18bmp_Line_172:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe6
LD HL,&00FF
  Push HL
call MultiPushDe7
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8800
  Push BC
call MultiPushDe7
LD HL,&FF40
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1617
 jp NextLinePushDe1


PicStage18bmp_Line_173:
call MultiPushDe9
LD HL,&FF00
  Push HL
call MultiPushDe5
DEC DE

  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
Call PushDE_0000x
LD HL,&8800
  Push HL
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
Ld C,&FF
  Push BC
LD DE,&F0F0
call MultiPushDe5
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicStage18bmp_Line_174:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&00CC
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8888
  Push HL
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1635
Ld D,&40
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1641


PicStage18bmp_Line_175:
Ld D,E
call MultiPushDe8
LD HL,&CC33
  Push HL
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD BC,&1111
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8888
  Push HL
call MultiPushDe5
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1655
INC DE

 jp NextLinePushDe3


PicStage18bmp_Line_176:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
call BitmapPush20
defw BitmapData+1675
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1705
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_177:
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1723
Call PushDE_0000x
call BitmapPush30
defw BitmapData+1753
 jp NextLinePushDe3


PicStage18bmp_Line_178:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&33
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1771
Call PushDE_0000x
call BitmapPush28
defw BitmapData+1799
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_179:
call MultiPushDe7
call BitmapPush22
defw BitmapData+1821
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1849
 jp NextLinePushDe4


PicStage18bmp_Line_180:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+1873
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1901
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_181:
call MultiPushDe6
LD HL,&0033
  Push HL
LD BC,&00CC
  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+1919
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1937
  PUSH DE
call BitmapPush8
defw BitmapData+1945
 jp NextLinePushDe4


PicStage18bmp_Line_182:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EE00
  Push HL
LD BC,&CC33
  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+1963
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1981
  PUSH DE
call BitmapPush8
defw BitmapData+1989
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_183:
call MultiPushDe6
call BitmapPush24
defw BitmapData+2013
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2041
 jp NextLinePushDe4


PicStage18bmp_Line_184:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2063
Call PushDE_0000x
call BitmapPush28
defw BitmapData+2091
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_185:
call MultiPushDe5
call BitmapPush26
defw BitmapData+2117
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2145
 jp NextLinePushDe4


PicStage18bmp_Line_186:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2171
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2199
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_187:
call MultiPushDe5
call BitmapPush26
defw BitmapData+2225
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2253
 jp NextLinePushDe4


PicStage18bmp_Line_188:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2279
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2307
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bmp_Line_189:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2335
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2363
 jp NextLinePushDe4


PicStage18bmp_Line_190:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
Ld E,&33
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+2387
Call PushDE_0000x
call BitmapPush24
defw BitmapData+2411
Ld D,&CC
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2419


PicStage18bmp_Line_191:
Call PushDE_0000x
call BitmapPush28
defw BitmapData+2447
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2475
 jp NextLinePushDe4


PicStage18bmp_Line_192:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+2481
DEC DE

call MultiPushDe10
LD HL,&3388
  Push HL
Call PushDE_0000x
LD BC,&11CC
  Push BC
DEC DE

call MultiPushDe10
call FinalBitmapPush14
defw BitmapData+2495


PicStage18bmp_Line_193:
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2501
call MultiPushDe11
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
call MultiPushDe11
call BitmapPush6
defw BitmapData+2501
 jp NextLinePushDe3


PicStage18bmp_Line_194:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
Ld E,&44
  PUSH DE
  PUSH DE
  Push HL 

Ld E,H

call MultiPushDe11
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
call MultiPushDe11
  Push BC
Ld D,&22
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1641


PicStage18bmp_Line_195:
Ld D,E
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&33
  PUSH DE
  PUSH DE
LD HL,&0044
  Push HL
LD BC,&1100
  Push BC

Ld E,H

call MultiPushDe10
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
call MultiPushDe10
LD BC,&0088
  Push BC
LD HL,&2200
  Push HL
Ld D,&CC
  PUSH DE
  PUSH DE
Ld D,L


 jp NextLinePushDe3


PicStage18bmp_Line_196:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
Ld L,&22
  Push HL
Ld B,L
Ld C,E

  Push BC
Ld D,H


call MultiPushDe10
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&11
  Push BC
call MultiPushDe10
LD HL,&0044
  Push HL
Ld B,L


  Push BC
Ld E,&11
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1641


PicStage18bmp_Line_197:
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2509
call MultiPushDe10
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
call MultiPushDe10
call BitmapPush8
defw BitmapData+2517
 jp NextLinePushDe3


PicStage18bmp_Line_198:
  PUSH DE
call BitmapPush12
defw BitmapData+2529
DEC DE

call MultiPushDe9
call BitmapPush6
defw BitmapData+2535
INC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2541
DEC DE

call MultiPushDe9
call FinalBitmapPush14
defw BitmapData+2555


PicStage18bmp_Line_199:
INC DE

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2565
call MultiPushDe11
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
call MultiPushDe11
call BitmapPush10
defw BitmapData+2575
 jp NextLinePushDe2



PicStage18bmp_DrawOrder: 

  DEFW PicStage18bmp_Line_0
  DEFW PicStage18bmp_Line_1
  DEFW PicStage18bmp_Line_2
  DEFW PicStage18bmp_Line_3
  DEFW PicStage18bmp_Line_4
  DEFW PicStage18bmp_Line_5
  DEFW PicStage18bmp_Line_6
  DEFW PicStage18bmp_Line_7
  DEFW PicStage18bmp_Line_8
  DEFW PicStage18bmp_Line_9
  DEFW PicStage18bmp_Line_10
  DEFW PicStage18bmp_Line_11
  DEFW PicStage18bmp_Line_12
  DEFW PicStage18bmp_Line_13
  DEFW PicStage18bmp_Line_14
  DEFW PicStage18bmp_Line_15
  DEFW PicStage18bmp_Line_16
  DEFW PicStage18bmp_Line_17
  DEFW PicStage18bmp_Line_18
  DEFW PicStage18bmp_Line_19
  DEFW PicStage18bmp_Line_20
  DEFW PicStage18bmp_Line_21
  DEFW PicStage18bmp_Line_22
  DEFW PicStage18bmp_Line_23
  DEFW PicStage18bmp_Line_24
  DEFW PicStage18bmp_Line_25
  DEFW PicStage18bmp_Line_26
  DEFW PicStage18bmp_Line_27
  DEFW PicStage18bmp_Line_28
  DEFW PicStage18bmp_Line_29
  DEFW PicStage18bmp_Line_30
  DEFW PicStage18bmp_Line_31
  DEFW PicStage18bmp_Line_32
  DEFW PicStage18bmp_Line_33
  DEFW PicStage18bmp_Line_34
  DEFW PicStage18bmp_Line_35
  DEFW PicStage18bmp_Line_36
  DEFW PicStage18bmp_Line_37
  DEFW PicStage18bmp_Line_38
  DEFW PicStage18bmp_Line_39
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_72
  DEFW PicStage18bmp_Line_73
  DEFW PicStage18bmp_Line_74
  DEFW PicStage18bmp_Line_73_Reuse
  DEFW PicStage18bmp_Line_74_Reuse
  DEFW PicStage18bmp_Line_77
  DEFW PicStage18bmp_Line_78
  DEFW PicStage18bmp_Line_79
  DEFW PicStage18bmp_Line_80
  DEFW PicStage18bmp_Line_81
  DEFW PicStage18bmp_Line_82
  DEFW PicStage18bmp_Line_83
  DEFW PicStage18bmp_Line_84
  DEFW PicStage18bmp_Line_85
  DEFW PicStage18bmp_Line_86
  DEFW PicStage18bmp_Line_87
  DEFW PicStage18bmp_Line_88
  DEFW PicStage18bmp_Line_89
  DEFW PicStage18bmp_Line_90
  DEFW PicStage18bmp_Line_91
  DEFW PicStage18bmp_Line_92
  DEFW PicStage18bmp_Line_93
  DEFW PicStage18bmp_Line_94
  DEFW PicStage18bmp_Line_95
  DEFW PicStage18bmp_Line_96
  DEFW PicStage18bmp_Line_97
  DEFW PicStage18bmp_Line_98
  DEFW PicStage18bmp_Line_99
  DEFW PicStage18bmp_Line_100
  DEFW PicStage18bmp_Line_101
  DEFW PicStage18bmp_Line_102
  DEFW PicStage18bmp_Line_103
  DEFW PicStage18bmp_Line_104
  DEFW PicStage18bmp_Line_105
  DEFW PicStage18bmp_Line_106
  DEFW PicStage18bmp_Line_107
  DEFW PicStage18bmp_Line_108
  DEFW PicStage18bmp_Line_109
  DEFW PicStage18bmp_Line_110
  DEFW PicStage18bmp_Line_111
  DEFW PicStage18bmp_Line_112
  DEFW PicStage18bmp_Line_113
  DEFW PicStage18bmp_Line_114
  DEFW PicStage18bmp_Line_115
  DEFW PicStage18bmp_Line_116
  DEFW PicStage18bmp_Line_117
  DEFW PicStage18bmp_Line_118
  DEFW PicStage18bmp_Line_119
  DEFW PicStage18bmp_Line_120
  DEFW PicStage18bmp_Line_121
  DEFW PicStage18bmp_Line_122
  DEFW PicStage18bmp_Line_123
  DEFW PicStage18bmp_Line_124
  DEFW PicStage18bmp_Line_125
  DEFW PicStage18bmp_Line_126
  DEFW PicStage18bmp_Line_125_Reuse
  DEFW PicStage18bmp_Line_126_Reuse
  DEFW PicStage18bmp_Line_129
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_133
  DEFW PicStage18bmp_Line_134
  DEFW PicStage18bmp_Line_135
  DEFW PicStage18bmp_Line_136
  DEFW PicStage18bmp_Line_137
  DEFW PicStage18bmp_Line_138
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_168
  DEFW PicStage18bmp_Line_169
  DEFW PicStage18bmp_Line_170
  DEFW PicStage18bmp_Line_171
  DEFW PicStage18bmp_Line_172
  DEFW PicStage18bmp_Line_173
  DEFW PicStage18bmp_Line_174
  DEFW PicStage18bmp_Line_175
  DEFW PicStage18bmp_Line_176
  DEFW PicStage18bmp_Line_177
  DEFW PicStage18bmp_Line_178
  DEFW PicStage18bmp_Line_179
  DEFW PicStage18bmp_Line_180
  DEFW PicStage18bmp_Line_181
  DEFW PicStage18bmp_Line_182
  DEFW PicStage18bmp_Line_183
  DEFW PicStage18bmp_Line_184
  DEFW PicStage18bmp_Line_185
  DEFW PicStage18bmp_Line_186
  DEFW PicStage18bmp_Line_187
  DEFW PicStage18bmp_Line_188
  DEFW PicStage18bmp_Line_189
  DEFW PicStage18bmp_Line_190
  DEFW PicStage18bmp_Line_191
  DEFW PicStage18bmp_Line_192
  DEFW PicStage18bmp_Line_193
  DEFW PicStage18bmp_Line_194
  DEFW PicStage18bmp_Line_195
  DEFW PicStage18bmp_Line_196
  DEFW PicStage18bmp_Line_197
  DEFW PicStage18bmp_Line_198
  DEFW PicStage18bmp_Line_199
  DEFW EndCode
PicStage18bbmp:

	ld (Background_CompiledSprite_Minus1+1),de
	call Akuyou_ScreenBuffer_GetActiveScreen
	ld h,a
	ld l,&50
	ld (StackRestore_Plus2-2),sp
	di
	ld sp,hl


LD IX,PicStage18bbmp_DrawOrder
JP JumpToNextLine


PicStage18bbmp_Line_0:
LD DE,&0000
call MultiPushDe5
LD HL,&0088
  Push HL
call MultiPushDe8
call BitmapPush6
defw BitmapData+11
Ld D,&80
  PUSH DE
  PUSH DE
LD BC,&1122
  Push BC
LD HL,&4488
  Push HL
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
Ld E,&00
call MultiPushDe8
LD BC,&1100
  Push BC
jp MultiPushDeLast5


PicStage18bbmp_Line_1:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,C
Ld L,E

  Push HL
call MultiPushDe7
call BitmapPush6
defw BitmapData+23
Ld D,&80
  PUSH DE
  PUSH DE
LD BC,&1122
  Push BC
LD HL,&4488
  Push HL
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
Ld E,&00
call MultiPushDe7
LD BC,&0088
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,C
Ld L,E

  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_2:
call MultiPushDe6
LD HL,&2200
  Push HL
call MultiPushDe7
call BitmapPush24
defw BitmapData+2599
call MultiPushDe7
LD BC,&0044
  Push BC
jp MultiPushDeLast6


PicStage18bbmp_Line_3:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
LD BC,&CCFF
  Push BC
DEC DE

call MultiPushDe6
call BitmapPush24
defw BitmapData+2623
call MultiPushDe6
LD HL,&FF33
  Push HL
LD BC,&0022
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_4:
call MultiPushDe6
Ld D,&88
  PUSH DE
  PUSH DE
Ld D,E
call MultiPushDe6
call BitmapPush24
defw BitmapData+2647
call MultiPushDe6
Ld E,&11
  PUSH DE
  PUSH DE
Ld E,&00
jp MultiPushDeLast6


PicStage18bbmp_Line_5:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2677
call BitmapPush26
defw BitmapData+2703
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_6:
call MultiPushDe6
call BitmapPush10
defw BitmapData+2713
LD DE,&F0B0
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2741
LD DE,&D0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2751
LD DE,&0000
jp MultiPushDeLast6


PicStage18bbmp_Line_7:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2773
Ld D,&80
  PUSH DE
  PUSH DE
LD HL,&2222
  Push HL
LD BC,&4444
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2795
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_8:
call MultiPushDe6
Ld E,&88
  PUSH DE
  PUSH DE
Ld E,&00
call MultiPushDe6
call BitmapPush6
defw BitmapData+255
Ld D,&80
  PUSH DE
  PUSH DE
LD HL,&2222
  Push HL
LD BC,&4444
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+261
Ld E,&00
call MultiPushDe6
Ld D,&11
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast6


PicStage18bbmp_Line_9:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2809
  PUSH DE
call BitmapPush20
defw BitmapData+295
  PUSH DE
call BitmapPush14
defw BitmapData+2823
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_10:
call MultiPushDe7
LD HL,&2200
  Push HL
LD BC,&E210
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+2831
  PUSH DE
call BitmapPush20
defw BitmapData+2851
  PUSH DE
call BitmapPush8
defw BitmapData+2859
  PUSH DE
LD HL,&8074
  Push HL
LD BC,&0044
  Push BC
jp MultiPushDeLast7


PicStage18bbmp_Line_11:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&44
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&CC00
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+2879
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&22
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_12:
call MultiPushDe7
LD HL,&8800
  Push HL
LD BC,&88F0
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+2889
  PUSH DE
call BitmapPush16
defw BitmapData+2905
  PUSH DE
call BitmapPush10
defw BitmapData+2915
  PUSH DE
LD HL,&F011
  Push HL
Ld B,E
Ld C,L

  Push BC
jp MultiPushDeLast7


PicStage18bbmp_Line_13:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE

Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2935
LD DE,&4422
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2955
LD DE,&8800
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_14:
call MultiPushDe7
Ld E,&22
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+2971
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&44
  PUSH DE
  PUSH DE
Ld D,H


jp MultiPushDeLast7


PicStage18bbmp_Line_15:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+489
  PUSH DE
LD HL,&80F0
  Push HL
LD BC,&FC00
  Push BC
  PUSH DE
LD HL,&3300
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+2987
  PUSH DE
LD BC,&00CC
  Push BC
  PUSH DE
LD HL,&00F3
  Push HL
LD BC,&F010
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+511
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_16:
call MultiPushDe7
Ld E,&88
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2997
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3013
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3021
  PUSH DE
Ld D,&11
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicStage18bbmp_Line_17:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
Ld D,C


  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+437
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3037
  PUSH DE
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
LD BC,&3300
  Push BC
  PUSH DE
Ld E,&88
  PUSH DE
  PUSH DE

Ld E,L

call MultiPushDe5
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_18:
call MultiPushDe8
call BitmapPush8
defw BitmapData+575
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3053
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+599
jp MultiPushDeLast8


PicStage18bbmp_Line_19:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+615
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0022
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_20:
call MultiPushDe8
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00CC
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+627
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
jp MultiPushDeLast8


PicStage18bbmp_Line_21:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3065
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
call MultiPushDe5
Ld B,&88
  Push BC
LD HL,&1100
  Push HL
 jp NextLinePushDe1


PicStage18bbmp_Line_22:
call MultiPushDe8
LD HL,&0022
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+649
LD HL,&0022
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
jp MultiPushDeLast8


PicStage18bbmp_Line_23:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&00CC
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
Call PushDE_0000x
call BitmapPush12
defw BitmapData+661
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
INC DE

call MultiPushDe5
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_24:
call MultiPushDe17
call BitmapPush12
defw BitmapData+3077
jp MultiPushDeLast17


PicStage18bbmp_Line_25:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe14
call BitmapPush12
defw BitmapData+685
call MultiPushDe14
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_26:
call MultiPushDe17
LD HL,&0044
  Push HL
LD BC,&0022
  Push BC
LD DE,&8811
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
LD BC,&2200
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast17


PicStage18bbmp_Line_27:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe14
call BitmapPush12
defw BitmapData+697
call MultiPushDe14
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_28:
call MultiPushDe18
call BitmapPush8
defw BitmapData+705
jp MultiPushDeLast18


PicStage18bbmp_Line_29:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+713
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_30:
call MultiPushDe18
call BitmapPush8
defw BitmapData+721
jp MultiPushDeLast18


PicStage18bbmp_Line_31:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+729
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_32:
call MultiPushDe18
call BitmapPush8
defw BitmapData+737
jp MultiPushDeLast18


PicStage18bbmp_Line_33:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+745
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_34:
call MultiPushDe18
call BitmapPush8
defw BitmapData+753
jp MultiPushDeLast18


PicStage18bbmp_Line_35:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe15
call BitmapPush8
defw BitmapData+761
call MultiPushDe15
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_36:
call MultiPushDe19
LD HL,&3300
  Push HL
LD BC,&00CC
  Push BC
jp MultiPushDeLast19


PicStage18bbmp_Line_37:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe16
LD HL,&2200
  Push HL
Ld C,&44
  Push BC
call MultiPushDe16
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_73:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
LD BC,&8000
  Push BC
call MultiPushDe20
LD HL,&0010
  Push HL
  PUSH DE
Ld B,&20
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_74:
call MultiPushDe7
LD HL,&00B0
  Push HL
  PUSH DE
LD BC,&4030
  Push BC
call MultiPushDe20
LD HL,&C020
  Push HL
  PUSH DE
LD BC,&D000
  Push BC
jp MultiPushDeLast7


PicStage18bbmp_Line_75:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C080
  Push HL
  PUSH DE
LD BC,&40C0
  Push BC
call MultiPushDe20
LD HL,&3020
  Push HL
  PUSH DE
LD BC,&1030
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_76:
call MultiPushDe7
call BitmapPush8
defw BitmapData+3085
call MultiPushDe18
call BitmapPush8
defw BitmapData+3093
jp MultiPushDeLast7


PicStage18bbmp_Line_77:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3099
call MultiPushDe20
call BitmapPush6
defw BitmapData+3105
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_78:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3111
call MultiPushDe20
call BitmapPush6
defw BitmapData+3117
jp MultiPushDeLast7


PicStage18bbmp_Line_79:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3123
call MultiPushDe20
call BitmapPush6
defw BitmapData+3129
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_80:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3135
call MultiPushDe20
call BitmapPush6
defw BitmapData+3141
jp MultiPushDeLast7


PicStage18bbmp_Line_81:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&D0
  Push HL
  PUSH DE
LD BC,&C020
  Push BC
call MultiPushDe20
LD HL,&4030
  Push HL
  PUSH DE
LD BC,&B000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_82:
call MultiPushDe7
LD HL,&0030
  Push HL
  PUSH DE
  Push HL 
call MultiPushDe20
LD BC,&C000
  Push BC
  PUSH DE
  Push BC
jp MultiPushDeLast7


PicStage18bbmp_Line_83:
  PUSH DE
call BitmapPush6
defw BitmapData+3147
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
  PUSH DE
LD BC,&0040
  Push BC
call MultiPushDe20
LD HL,&2000
  Push HL
  PUSH DE
Ld C,&10
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3153
 jp NextLinePushDe1


PicStage18bbmp_Line_84:
  PUSH DE
call BitmapPush8
defw BitmapData+3161
  PUSH DE
call BitmapPush6
defw BitmapData+3167
Ld E,&80
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL

Ld E,L

call MultiPushDe16
LD BC,&00C0
  Push BC
Ld D,&10
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3181
  PUSH DE
Ld H,E
Ld L,E

  jp NextLinePushHl 


PicStage18bbmp_Line_85:
call BitmapPush24
defw BitmapData+3205
Ld D,E
call MultiPushDe16
call BitmapPush12
defw BitmapData+3217
  PUSH DE
call BitmapPush8
defw BitmapData+3225
 jp NextLinePushDe1


PicStage18bbmp_Line_86:
  PUSH DE
call BitmapPush14
defw BitmapData+3239
  PUSH DE
call BitmapPush6
defw BitmapData+3230
call MultiPushDe16
call BitmapPush6
defw BitmapData+3245
  PUSH DE
call BitmapPush14
defw BitmapData+3259
 jp NextLinePushDe1


PicStage18bbmp_Line_87:
  PUSH DE
call BitmapPush10
defw BitmapData+3269
  PUSH DE
LD HL,&1020
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3275
call MultiPushDe16
call BitmapPush6
defw BitmapData+1152
  PUSH DE
LD BC,&4080
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+3285
 jp NextLinePushDe1


PicStage18bbmp_Line_88:
  PUSH DE
call BitmapPush14
defw BitmapData+3299
  PUSH DE
call BitmapPush6
defw BitmapData+3305
call MultiPushDe16
call BitmapPush6
defw BitmapData+3311
  PUSH DE
call BitmapPush14
defw BitmapData+3325
 jp NextLinePushDe1


PicStage18bbmp_Line_89:
  PUSH DE
call BitmapPush14
defw BitmapData+3339
  PUSH DE
call BitmapPush6
defw BitmapData+3345
call MultiPushDe16
call BitmapPush6
defw BitmapData+3351
  PUSH DE
call BitmapPush14
defw BitmapData+3365
 jp NextLinePushDe1


PicStage18bbmp_Line_90:
  PUSH DE
call BitmapPush8
defw BitmapData+3373
Ld E,&40
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3379
LD DE,&8000
  PUSH DE
  PUSH DE
Ld D,E
call MultiPushDe16
Ld E,&10
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3385
LD DE,&2000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3373
  PUSH DE
Ld H,E
Ld L,E

  jp NextLinePushHl 


PicStage18bbmp_Line_91:
call BitmapPush24
defw BitmapData+3409
Ld D,E
call MultiPushDe16
call BitmapPush6
defw BitmapData+3415
  PUSH DE
call BitmapPush14
defw BitmapData+3429
 jp NextLinePushDe1


PicStage18bbmp_Line_92:
  PUSH DE
call BitmapPush8
defw BitmapData+3437
  PUSH DE
call BitmapPush10
defw BitmapData+3447
call MultiPushDe18
call BitmapPush10
defw BitmapData+3457
  PUSH DE
call BitmapPush8
defw BitmapData+3437
 jp NextLinePushDe1


PicStage18bbmp_Line_93:
  PUSH DE
LD HL,&00C8
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
LD HL,&2000
  Push HL
  PUSH DE
Ld C,&30
  Push BC
  Push HL 
LD HL,&4080
  Push HL
  PUSH DE
Ld B,&10
  Push BC
call MultiPushDe18
LD HL,&C080
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3463
  PUSH DE
LD BC,&0040
  Push BC
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&3100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_94:
call BitmapPush14
defw BitmapData+3477
Ld D,&20
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Ld B,H
Ld C,H

  Push BC
Ld D,L


call MultiPushDe18
LD HL,&8080
  Push HL
Ld B,E
Ld C,L

  Push BC
Ld E,&40
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3491


PicStage18bbmp_Line_95:
call BitmapPush14
defw BitmapData+3505
LD DE,&2000
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Ld B,H
Ld C,H

  Push BC
Ld D,L


call MultiPushDe18
LD HL,&8080
  Push HL
Ld B,E
Ld C,L

  Push BC
Ld E,&40
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3519


PicStage18bbmp_Line_96:
call BitmapPush6
defw BitmapData+3525
  PUSH DE
LD HL,&00F0
  Push HL
Ld E,&20
  PUSH DE
  PUSH DE
LD DE,&2000
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld H,B
Ld L,B

  Push HL
Ld D,C


call MultiPushDe18
LD BC,&8080
  Push BC
Ld H,E
Ld L,C

  Push HL
Ld E,&40
  PUSH DE
  PUSH DE
LD DE,&4000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3535


PicStage18bbmp_Line_97:
  PUSH DE
call BitmapPush8
defw BitmapData+1471
LD DE,&0020
  PUSH DE
  PUSH DE
LD DE,&2000
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Ld B,H
Ld C,H

  Push BC
Ld D,L


call MultiPushDe18
LD HL,&8080
  Push HL
Ld B,E
Ld C,L

  Push BC
Ld E,&40
  PUSH DE
  PUSH DE
LD DE,&4000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3545


PicStage18bbmp_Line_98:
LD HL,&2000
  Push HL
LD BC,&4080
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3551
LD HL,&2000
  Push HL
LD BC,&4080
  Push BC
  PUSH DE
LD HL,&1030
  Push HL
call MultiPushDe18
Ld B,&C0
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+3561
  PUSH DE
  PUSH DE
LD HL,&1020
  Push HL
LD BC,&0040
 jp NextLinePushBC 


PicStage18bbmp_Line_99:
call BitmapPush6
defw BitmapData+3567
  PUSH DE
call BitmapPush14
defw BitmapData+3581
call MultiPushDe18
call BitmapPush14
defw BitmapData+3595
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3601


PicStage18bbmp_Line_100:
LD HL,&2000
  Push HL
Ld B,H
Ld C,H

  Push BC
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3609
  PUSH DE
call BitmapPush6
defw BitmapData+3391
call MultiPushDe16
call BitmapPush6
defw BitmapData+3415
  PUSH DE
call BitmapPush8
defw BitmapData+3617
  PUSH DE
  PUSH DE
LD HL,&4040
  Push HL
Ld B,E
Ld C,L

 jp NextLinePushBC 


PicStage18bbmp_Line_101:
call BitmapPush6
defw BitmapData+3623
  PUSH DE
call BitmapPush8
defw BitmapData+3631
  PUSH DE
LD HL,&0080
  Push HL
Ld D,L


  PUSH DE
  PUSH DE
Ld D,H


call MultiPushDe16
Ld E,&10
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+3651


PicStage18bbmp_Line_102:
call BitmapPush24
defw BitmapData+3675
Ld E,&00
call MultiPushDe16
call BitmapPush6
defw BitmapData+3351
  PUSH DE
call FinalBitmapPush16
defw BitmapData+3691


PicStage18bbmp_Line_103:
call BitmapPush16
defw BitmapData+3707
  PUSH DE
call BitmapPush6
defw BitmapData+3305
call MultiPushDe16
call BitmapPush6
defw BitmapData+3311
  PUSH DE
call FinalBitmapPush16
defw BitmapData+3723


PicStage18bbmp_Line_104:
  PUSH DE
call BitmapPush10
defw BitmapData+1313
  PUSH DE
LD HL,&1020
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3275
call MultiPushDe16
call BitmapPush6
defw BitmapData+1152
  PUSH DE
LD BC,&4080
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1295
 jp NextLinePushDe1


PicStage18bbmp_Line_105:
  PUSH DE
call BitmapPush14
defw BitmapData+3737
  PUSH DE
call BitmapPush6
defw BitmapData+3230
call MultiPushDe16
call BitmapPush6
defw BitmapData+3245
  PUSH DE
call BitmapPush14
defw BitmapData+3751
 jp NextLinePushDe1


PicStage18bbmp_Line_106:
  PUSH DE
call BitmapPush8
defw BitmapData+1293
  PUSH DE
call BitmapPush12
defw BitmapData+3193
call MultiPushDe16
call BitmapPush12
defw BitmapData+3217
  PUSH DE
call BitmapPush8
defw BitmapData+1293
 jp NextLinePushDe1


PicStage18bbmp_Line_107:
  PUSH DE
call BitmapPush8
defw BitmapData+1273
  PUSH DE
call BitmapPush6
defw BitmapData+3167
Ld E,&80
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL

Ld E,L

call MultiPushDe16
LD BC,&00C0
  Push BC
Ld D,&10
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+3769


PicStage18bbmp_Line_108:
call BitmapPush10
defw BitmapData+3779
  PUSH DE
call BitmapPush8
defw BitmapData+3787
Ld D,E
call MultiPushDe20
LD HL,&2000
  Push HL
  PUSH DE
LD BC,&0010
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3799


PicStage18bbmp_Line_109:
call BitmapPush12
defw BitmapData+3811
  PUSH DE
LD HL,&0030
  Push HL
  PUSH DE
  Push HL 
call MultiPushDe20
LD BC,&C000
  Push BC
  PUSH DE
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3823


PicStage18bbmp_Line_110:
LD HL,&C010
  Push HL
LD BC,&2020
  Push BC
  PUSH DE
  PUSH DE
LD HL,&4040
  Push HL
LD BC,&8030
  Push BC
  PUSH DE
LD HL,&00D0
  Push HL
  PUSH DE
LD BC,&C020
  Push BC
call MultiPushDe20
LD HL,&4030
  Push HL
  PUSH DE
LD BC,&B000
  Push BC
  PUSH DE
LD HL,&C010
  Push HL
LD BC,&2020
  Push BC
  PUSH DE
  PUSH DE
LD HL,&4040
  Push HL
LD BC,&8030
 jp NextLinePushBC 


PicStage18bbmp_Line_111:
call BitmapPush6
defw BitmapData+3829
  PUSH DE
LD HL,&4040
  Push HL
Ld B,E
Ld C,L

  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3135
call MultiPushDe20
call BitmapPush6
defw BitmapData+3141
  PUSH DE
LD HL,&2000
  Push HL
Ld B,H
Ld C,H

  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3835


PicStage18bbmp_Line_112:
LD HL,&2000
  Push HL
LD BC,&4040
  Push BC
  PUSH DE
  PUSH DE
Ld L,&20
  Push HL
Ld B,&00
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3123
call MultiPushDe20
call BitmapPush6
defw BitmapData+3129
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&4040
  Push BC
  PUSH DE
  PUSH DE
Ld L,&20
  Push HL
Ld B,&00
 jp NextLinePushBC 


PicStage18bbmp_Line_113:
call BitmapPush6
defw BitmapData+3841
  PUSH DE
LD HL,&1020
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3111
call MultiPushDe20
call BitmapPush6
defw BitmapData+3117
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&4080
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3847


PicStage18bbmp_Line_114:
call BitmapPush12
defw BitmapData+3859
  PUSH DE
call BitmapPush6
defw BitmapData+3099
call MultiPushDe20
call BitmapPush6
defw BitmapData+3105
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3859


PicStage18bbmp_Line_115:
call BitmapPush12
defw BitmapData+3871
  PUSH DE
call BitmapPush8
defw BitmapData+3085
call MultiPushDe18
call BitmapPush8
defw BitmapData+3093
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3883


PicStage18bbmp_Line_116:
call BitmapPush12
defw BitmapData+3895
  PUSH DE
LD HL,&C080
  Push HL
  PUSH DE
LD BC,&40C0
  Push BC
call MultiPushDe20
LD HL,&3020
  Push HL
  PUSH DE
LD BC,&1030
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3895


PicStage18bbmp_Line_117:
call BitmapPush12
defw BitmapData+3907
  PUSH DE
LD HL,&00B0
  Push HL
  PUSH DE
LD BC,&4030
  Push BC
call MultiPushDe20
LD HL,&C020
  Push HL
  PUSH DE
LD BC,&D000
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3919


PicStage18bbmp_Line_118:
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
LD BC,&2000
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
LD HL,&8000
  Push HL
call MultiPushDe20
LD BC,&0010
  Push BC
  PUSH DE
LD HL,&2000
  Push HL
  PUSH DE
  PUSH DE
Ld C,&40
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe1


PicStage18bbmp_Line_119:
  PUSH DE
call BitmapPush8
defw BitmapData+3927
call MultiPushDe30
call BitmapPush8
defw BitmapData+3935
 jp NextLinePushDe1


PicStage18bbmp_Line_120:
  PUSH DE
call BitmapPush8
defw BitmapData+3943
call MultiPushDe30
call BitmapPush8
defw BitmapData+3943
 jp NextLinePushDe1


PicStage18bbmp_Line_121:
  PUSH DE
call BitmapPush8
defw BitmapData+3951
call MultiPushDe30
call BitmapPush8
defw BitmapData+3959
 jp NextLinePushDe1


PicStage18bbmp_Line_122:
  PUSH DE
call BitmapPush8
defw BitmapData+3967
call MultiPushDe30
call BitmapPush8
defw BitmapData+3967
 jp NextLinePushDe1


PicStage18bbmp_Line_123:
  PUSH DE
call BitmapPush8
defw BitmapData+3975
call MultiPushDe30
call BitmapPush8
defw BitmapData+3983
 jp NextLinePushDe1


PicStage18bbmp_Line_124:
  PUSH DE
call BitmapPush8
defw BitmapData+3991
call MultiPushDe30
call BitmapPush8
defw BitmapData+3991
 jp NextLinePushDe1


PicStage18bbmp_Line_125:
  PUSH DE
call BitmapPush8
defw BitmapData+3999
call MultiPushDe30
call BitmapPush8
defw BitmapData+4007
 jp NextLinePushDe1


PicStage18bbmp_Line_126:
  PUSH DE
call BitmapPush8
defw BitmapData+857
call MultiPushDe30
call BitmapPush8
defw BitmapData+857
 jp NextLinePushDe1


PicStage18bbmp_Line_127:
  PUSH DE
call BitmapPush8
defw BitmapData+4015
call MultiPushDe30
call BitmapPush8
defw BitmapData+4023
 jp NextLinePushDe1


PicStage18bbmp_Line_128:
  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
LD BC,&0040
  Push BC
call MultiPushDe32
LD HL,&2000
  Push HL
  Push BC
 jp NextLinePushDe2


PicStage18bbmp_Line_133:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe28
LD DE,&F0F0
call MultiPushDe5
call FinalBitmapPush8
defw BitmapData+4031


PicStage18bbmp_Line_134:
LD DE,&0000
call MultiPushDe30
LD HL,&00C0
  Push HL
call MultiPushDe5
LD BC,&0030
  Push BC
 jp NextLinePushDe3


PicStage18bmp_Line_136_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_136
PicStage18bmp_Line_135_Reuse:
LD DE,&0000
JP PicStage18bmp_Line_135
PicStage18bbmp_Line_168:
call MultiPushDe15
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF00
  Push HL
Call PushDE_0000x
LD BC,&00FF
  Push BC
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD HL,&E010
  Push HL
call MultiPushDe5
Ld C,&80
  Push BC
 jp NextLinePushDe3


PicStage18bbmp_Line_169:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe9
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
LD BC,&1010
  Push BC
call MultiPushDe5
call BitmapPush6
defw BitmapData+1623
 jp NextLinePushDe1


PicStage18bbmp_Line_170:
call MultiPushDe11
LD HL,&FFFF
  Push HL
call MultiPushDe5
LD BC,&8800
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1629
call MultiPushDe5
LD BC,&0040
  Push BC
 jp NextLinePushDe3


PicStage18bbmp_Line_171:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe7
LD HL,&FFFF
  Push HL
call MultiPushDe6
LD BC,&8800
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
call MultiPushDe6
LD BC,&FFFF
  Push BC
LD HL,&2020
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+1140
 jp NextLinePushDe1


PicStage18bbmp_Line_172:
call MultiPushDe9
LD HL,&00FF
  Push HL
call MultiPushDe7
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
call MultiPushDe7
LD BC,&FF40
  Push BC
call MultiPushDe5
LD HL,&0030
  Push HL
 jp NextLinePushDe3


PicStage18bbmp_Line_173:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe6
LD HL,&FF00
  Push HL
call MultiPushDe5
DEC DE

  PUSH DE
  PUSH DE
  Push BC
Call PushDE_0000x
LD BC,&8800
  Push BC
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD HL,&00FF
  Push HL
LD DE,&F0F0
call MultiPushDe5
call FinalBitmapPush8
defw BitmapData+4031


PicStage18bbmp_Line_174:
LD DE,&0000
call MultiPushDe8
LD HL,&00CC
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
LD BC,&1111
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8888
  Push HL
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1635
Ld D,&40
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,E
 jp NextLinePushDe3


PicStage18bbmp_Line_175:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
LD HL,&CC33
  Push HL
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8888
  Push HL
call MultiPushDe5
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+1655


PicStage18bbmp_Line_176:
INC DE

call MultiPushDe8
call BitmapPush20
defw BitmapData+4051
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4081
 jp NextLinePushDe3


PicStage18bbmp_Line_177:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+4099
Call PushDE_0000x
call BitmapPush30
defw BitmapData+4129
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_178:
call MultiPushDe7
Ld E,&33
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+4147
Call PushDE_0000x
call BitmapPush28
defw BitmapData+4175
 jp NextLinePushDe4


PicStage18bbmp_Line_179:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+4197
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4225
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_180:
call MultiPushDe6
call BitmapPush24
defw BitmapData+4249
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4277
 jp NextLinePushDe4


PicStage18bbmp_Line_181:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&33
  Push HL
Ld C,&CC
  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+4295
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+4313
  PUSH DE
call BitmapPush8
defw BitmapData+1945
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_182:
call MultiPushDe6
LD HL,&EE00
  Push HL
LD BC,&CC33
  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+4331
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+4349
  PUSH DE
call BitmapPush8
defw BitmapData+1989
 jp NextLinePushDe4


PicStage18bbmp_Line_183:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+4373
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4401
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_184:
call MultiPushDe5
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+4423
Call PushDE_0000x
call BitmapPush28
defw BitmapData+4451
 jp NextLinePushDe4


PicStage18bbmp_Line_185:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+4477
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4505
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_186:
call MultiPushDe5
call BitmapPush26
defw BitmapData+4531
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4559
 jp NextLinePushDe4


PicStage18bbmp_Line_187:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+4585
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4613
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_188:
call MultiPushDe5
call BitmapPush26
defw BitmapData+4639
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4667
 jp NextLinePushDe4


PicStage18bbmp_Line_189:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush28
defw BitmapData+4695
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4723
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_190:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&33
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+4747
Call PushDE_0000x
call BitmapPush24
defw BitmapData+4771
Ld D,&CC
  PUSH DE
  PUSH DE
Call PushDE_0000x
jp NextLine


PicStage18bbmp_Line_191:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush28
defw BitmapData+4799
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4827
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18bbmp_Line_192:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2481
DEC DE

call MultiPushDe10
LD HL,&3388
  Push HL
Call PushDE_0000x
LD BC,&11CC
  Push BC
DEC DE

call MultiPushDe10
call BitmapPush6
defw BitmapData+2495
Call PushDE_0000x
jp NextLine


PicStage18bbmp_Line_193:
  PUSH DE
call BitmapPush10
defw BitmapData+4837
call MultiPushDe11
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
call MultiPushDe11
call BitmapPush10
defw BitmapData+4847
 jp NextLinePushDe1


PicStage18bbmp_Line_194:
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&44
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL

Ld E,H

call MultiPushDe11
LD BC,&0088
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
call MultiPushDe11
LD BC,&1100
  Push BC
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,C


 jp NextLinePushDe3


PicStage18bbmp_Line_195:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
Ld E,&33
  PUSH DE
  PUSH DE
Ld L,&44
  Push HL
LD BC,&1100
  Push BC

Ld E,H

call MultiPushDe10
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
call MultiPushDe10
LD BC,&0088
  Push BC
LD HL,&2200
  Push HL
Ld D,&CC
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1641


PicStage18bbmp_Line_196:
Ld D,E
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&88
  PUSH DE
  PUSH DE
LD HL,&0022
  Push HL
Ld B,L
Ld C,E

  Push BC
Ld D,H


call MultiPushDe10
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&11
  Push BC
call MultiPushDe10
LD HL,&0044
  Push HL
Ld B,L


  Push BC
Ld E,&11
  PUSH DE
  PUSH DE

Ld E,H

 jp NextLinePushDe3


PicStage18bbmp_Line_197:
  PUSH DE
call BitmapPush12
defw BitmapData+4859
call MultiPushDe10
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
call MultiPushDe10
call BitmapPush12
defw BitmapData+4871
 jp NextLinePushDe1


PicStage18bbmp_Line_198:
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+4881
DEC DE

call MultiPushDe9
call BitmapPush6
defw BitmapData+2535
INC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2541
DEC DE

call MultiPushDe9
call BitmapPush10
defw BitmapData+4891
INC DE

 jp NextLinePushDe2


PicStage18bbmp_Line_199:
  PUSH DE
call BitmapPush12
defw BitmapData+4903
call MultiPushDe11
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
call MultiPushDe11
call BitmapPush12
defw BitmapData+4915
 jp NextLinePushDe1



PicStage18bbmp_DrawOrder: 

  DEFW PicStage18bbmp_Line_0
  DEFW PicStage18bbmp_Line_1
  DEFW PicStage18bbmp_Line_2
  DEFW PicStage18bbmp_Line_3
  DEFW PicStage18bbmp_Line_4
  DEFW PicStage18bbmp_Line_5
  DEFW PicStage18bbmp_Line_6
  DEFW PicStage18bbmp_Line_7
  DEFW PicStage18bbmp_Line_8
  DEFW PicStage18bbmp_Line_9
  DEFW PicStage18bbmp_Line_10
  DEFW PicStage18bbmp_Line_11
  DEFW PicStage18bbmp_Line_12
  DEFW PicStage18bbmp_Line_13
  DEFW PicStage18bbmp_Line_14
  DEFW PicStage18bbmp_Line_15
  DEFW PicStage18bbmp_Line_16
  DEFW PicStage18bbmp_Line_17
  DEFW PicStage18bbmp_Line_18
  DEFW PicStage18bbmp_Line_19
  DEFW PicStage18bbmp_Line_20
  DEFW PicStage18bbmp_Line_21
  DEFW PicStage18bbmp_Line_22
  DEFW PicStage18bbmp_Line_23
  DEFW PicStage18bbmp_Line_24
  DEFW PicStage18bbmp_Line_25
  DEFW PicStage18bbmp_Line_26
  DEFW PicStage18bbmp_Line_27
  DEFW PicStage18bbmp_Line_28
  DEFW PicStage18bbmp_Line_29
  DEFW PicStage18bbmp_Line_30
  DEFW PicStage18bbmp_Line_31
  DEFW PicStage18bbmp_Line_32
  DEFW PicStage18bbmp_Line_33
  DEFW PicStage18bbmp_Line_34
  DEFW PicStage18bbmp_Line_35
  DEFW PicStage18bbmp_Line_36
  DEFW PicStage18bbmp_Line_37
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bbmp_Line_73
  DEFW PicStage18bbmp_Line_74
  DEFW PicStage18bbmp_Line_75
  DEFW PicStage18bbmp_Line_76
  DEFW PicStage18bbmp_Line_77
  DEFW PicStage18bbmp_Line_78
  DEFW PicStage18bbmp_Line_79
  DEFW PicStage18bbmp_Line_80
  DEFW PicStage18bbmp_Line_81
  DEFW PicStage18bbmp_Line_82
  DEFW PicStage18bbmp_Line_83
  DEFW PicStage18bbmp_Line_84
  DEFW PicStage18bbmp_Line_85
  DEFW PicStage18bbmp_Line_86
  DEFW PicStage18bbmp_Line_87
  DEFW PicStage18bbmp_Line_88
  DEFW PicStage18bbmp_Line_89
  DEFW PicStage18bbmp_Line_90
  DEFW PicStage18bbmp_Line_91
  DEFW PicStage18bbmp_Line_92
  DEFW PicStage18bbmp_Line_93
  DEFW PicStage18bbmp_Line_94
  DEFW PicStage18bbmp_Line_95
  DEFW PicStage18bbmp_Line_96
  DEFW PicStage18bbmp_Line_97
  DEFW PicStage18bbmp_Line_98
  DEFW PicStage18bbmp_Line_99
  DEFW PicStage18bbmp_Line_100
  DEFW PicStage18bbmp_Line_101
  DEFW PicStage18bbmp_Line_102
  DEFW PicStage18bbmp_Line_103
  DEFW PicStage18bbmp_Line_104
  DEFW PicStage18bbmp_Line_105
  DEFW PicStage18bbmp_Line_106
  DEFW PicStage18bbmp_Line_107
  DEFW PicStage18bbmp_Line_108
  DEFW PicStage18bbmp_Line_109
  DEFW PicStage18bbmp_Line_110
  DEFW PicStage18bbmp_Line_111
  DEFW PicStage18bbmp_Line_112
  DEFW PicStage18bbmp_Line_113
  DEFW PicStage18bbmp_Line_114
  DEFW PicStage18bbmp_Line_115
  DEFW PicStage18bbmp_Line_116
  DEFW PicStage18bbmp_Line_117
  DEFW PicStage18bbmp_Line_118
  DEFW PicStage18bbmp_Line_119
  DEFW PicStage18bbmp_Line_120
  DEFW PicStage18bbmp_Line_121
  DEFW PicStage18bbmp_Line_122
  DEFW PicStage18bbmp_Line_123
  DEFW PicStage18bbmp_Line_124
  DEFW PicStage18bbmp_Line_125
  DEFW PicStage18bbmp_Line_126
  DEFW PicStage18bbmp_Line_127
  DEFW PicStage18bbmp_Line_128
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bmp_Line_38_Reuse
  DEFW PicStage18bmp_Line_39_Reuse
  DEFW PicStage18bbmp_Line_133
  DEFW PicStage18bbmp_Line_134
  DEFW PicStage18bmp_Line_136_Reuse
  DEFW PicStage18bmp_Line_135_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bmp_Line_137_Reuse
  DEFW PicStage18bmp_Line_138_Reuse
  DEFW PicStage18bbmp_Line_168
  DEFW PicStage18bbmp_Line_169
  DEFW PicStage18bbmp_Line_170
  DEFW PicStage18bbmp_Line_171
  DEFW PicStage18bbmp_Line_172
  DEFW PicStage18bbmp_Line_173
  DEFW PicStage18bbmp_Line_174
  DEFW PicStage18bbmp_Line_175
  DEFW PicStage18bbmp_Line_176
  DEFW PicStage18bbmp_Line_177
  DEFW PicStage18bbmp_Line_178
  DEFW PicStage18bbmp_Line_179
  DEFW PicStage18bbmp_Line_180
  DEFW PicStage18bbmp_Line_181
  DEFW PicStage18bbmp_Line_182
  DEFW PicStage18bbmp_Line_183
  DEFW PicStage18bbmp_Line_184
  DEFW PicStage18bbmp_Line_185
  DEFW PicStage18bbmp_Line_186
  DEFW PicStage18bbmp_Line_187
  DEFW PicStage18bbmp_Line_188
  DEFW PicStage18bbmp_Line_189
  DEFW PicStage18bbmp_Line_190
  DEFW PicStage18bbmp_Line_191
  DEFW PicStage18bbmp_Line_192
  DEFW PicStage18bbmp_Line_193
  DEFW PicStage18bbmp_Line_194
  DEFW PicStage18bbmp_Line_195
  DEFW PicStage18bbmp_Line_196
  DEFW PicStage18bbmp_Line_197
  DEFW PicStage18bbmp_Line_198
  DEFW PicStage18bbmp_Line_199
  DEFW EndCode







;Global Code
EndCode:
ld sp,(StackRestore_Plus2-2)
ei
ret

MultiPushDeLast40: ld HL,NextLine
jr MultiPushDe40B 
MultiPushDe40: pop HL
jr MultiPushDe40B 
MultiPushDe34: pop HL
jr MultiPushDe34B 
MultiPushDe32: pop HL
jr MultiPushDe32B 
MultiPushDe31: pop HL
jr MultiPushDe31B 
MultiPushDe30: pop HL
jr MultiPushDe30B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe27: pop HL
jr MultiPushDe27B 
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDeLast19: ld HL,NextLine
jr MultiPushDe19B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDeLast18: ld HL,NextLine
jr MultiPushDe18B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDeLast17: ld HL,NextLine
jr MultiPushDe17B 
MultiPushDe17: pop HL
jr MultiPushDe17B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe15: pop HL
jr MultiPushDe15B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDe11: pop HL
jr MultiPushDe11B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDeLast8: ld HL,NextLine
jr MultiPushDe8B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
MultiPushDeLast7: ld HL,NextLine
jr MultiPushDe7B 
MultiPushDe7: pop HL
jr MultiPushDe7B 
MultiPushDeLast6: ld HL,NextLine
jr MultiPushDe6B 
MultiPushDe6: pop HL
jr MultiPushDe6B 
MultiPushDeLast5: ld HL,NextLine
jr MultiPushDe5B 
MultiPushDe5: pop HL
jr MultiPushDe5B 
MultiPushDe40B: Push DE
MultiPushDe39B: Push DE
MultiPushDe38B: Push DE
MultiPushDe37B: Push DE
MultiPushDe36B: Push DE
MultiPushDe35B: Push DE
MultiPushDe34B: Push DE
MultiPushDe33B: Push DE
MultiPushDe32B: Push DE
MultiPushDe31B: Push DE
MultiPushDe30B: Push DE
MultiPushDe29B: Push DE
MultiPushDe28B: Push DE
MultiPushDe27B: Push DE
MultiPushDe26B: Push DE
MultiPushDe25B: Push DE
MultiPushDe24B: Push DE
MultiPushDe23B: Push DE
MultiPushDe22B: Push DE
MultiPushDe21B: Push DE
MultiPushDe20B: Push DE
MultiPushDe19B: Push DE
MultiPushDe18B: Push DE
MultiPushDe17B: Push DE
MultiPushDe16B: Push DE
MultiPushDe15B: Push DE
MultiPushDe14B: Push DE
MultiPushDe13B: Push DE
MultiPushDe12B: Push DE
MultiPushDe11B: Push DE
MultiPushDe10B: Push DE
MultiPushDe9B: Push DE
MultiPushDe8B: Push DE
MultiPushDe7B: Push DE
MultiPushDe6B: Push DE
MultiPushDe5B: Push DE
MultiPushDe4B: Push DE
MultiPushDe3B: Push DE
MultiPushDe2B: Push DE
MultiPushDe1B: Push DE
jp (hl)

BitmapPush:
ld (BitmapPushDeRestore_Plus2-2),de
pop iy
ld l,(iy)
inc iy
ld h,(iy)
inc iy
BitmapPushRepeat:
ld d,(hl)
dec hl
ld e,(hl)
dec hl
push de
djnz BitmapPushRepeat

ld de,&0000 :BitmapPushDeRestore_Plus2

jp (iy)

BitmapPush30: ld b,&0F
jr BitmapPush
BitmapPush28: ld b,&0E
jr BitmapPush
BitmapPush26: ld b,&0D
jr BitmapPush
BitmapPush24: ld b,&0C
jr BitmapPush
BitmapPush22: ld b,&0B
jr BitmapPush
BitmapPush20: ld b,&0A
jr BitmapPush
BitmapPush18: ld b,&09
jr BitmapPush
BitmapPush16: ld b,&08
jr BitmapPush
BitmapPush14: ld b,&07
jr BitmapPush
BitmapPush12: ld b,&06
jr BitmapPush
BitmapPush10: ld b,&05
jr BitmapPush
BitmapPush8: ld b,&04
jr BitmapPush
BitmapPush6: ld b,&03
jr BitmapPush

finalBitmapPush24: ld b,&0C
jr finalBitmapPush

finalBitmapPush22: ld b,&0B
jr finalBitmapPush

finalBitmapPush20: ld b,&0A
jr finalBitmapPush

finalBitmapPush18: ld b,&09
jr finalBitmapPush

finalBitmapPush16: ld b,&08
jr finalBitmapPush

finalBitmapPush14: ld b,&07
jr finalBitmapPush

finalBitmapPush12: ld b,&06
jr finalBitmapPush

finalBitmapPush10: ld b,&05
jr finalBitmapPush

finalBitmapPush8: ld b,&04
jr finalBitmapPush

finalBitmapPush6: ld b,&03
jr finalBitmapPush
finalBitmapPush:
ld (BitmapPushDeRestore_Plus2-2),de
pop iy
ld l,(iy)
inc iy
ld h,(iy)
inc iy
ld iy,nextline
jp BitmapPushRepeat
NextLinePushDe4: push de
NextLinePushDe3: push de
NextLinePushDe2: push de
NextLinePushDe1: push de

NextLine: 
ld hl,&0850
add hl,sp
ei
ld sp,&0000:StackRestore_Plus2
di
ld sp,hl
Background_CompiledSprite_Minus1:
bit 7,h
jp z,JumpToNextLine
ld hl,&c050
add hl,sp
ld sp,hl
;push hl
jp JumpToNextLine
JumpToNextLine: 
LD L,(IX)
INC IX
LD H,(IX)
INC IX
JP (HL)

NextLinePushHl: Push HL
jr NextLine
NextLinePushBC: Push BC
jr NextLine
NextLineSPshift:add hl,sp
ld sp,hl
jr NextLine
NextLineDecSP8:dec sp
dec sp
dec sp
dec sp
NextLineDecSP4:dec sp
dec sp
dec sp
dec sp
jr NextLine
CompiledSprite_GetNxtLinbc: defw &0000 :CompiledSprite_NextLineJumpBC_Plus2


BitmapData: 

defb &11,&00,&88,&00,&00,&00,&40,&40,&00,&88
defb &11,&00,&00,&88,&11,&00,&20,&20,&40,&40
defb &11,&00,&22,&00,&00,&44,&00,&88,&20,&20
defb &00,&22,&00,&44,&30,&20,&10,&30,&90,&00
defb &88,&44,&22,&11,&00,&90,&C0,&80,&40,&C0
defb &22,&00,&44,&00,&CC,&11,&00,&22,&20,&A0
defb &10,&40,&50,&00,&88,&44,&22,&11,&00,&A0
defb &20,&80,&50,&40,&44,&00,&88,&33,&22,&00
defb &88,&11,&20,&60,&10,&40,&50,&00,&88,&44
defb &22,&11,&00,&A0,&20,&80,&60,&40,&88,&11
defb &00,&44,&88,&44,&22,&11,&00,&A0,&20,&80
defb &40,&51,&00,&22,&00,&B8,&F0,&D0,&F0,&E0
defb &F0,&F0,&B0,&F0,&E0,&F0,&F0,&B0,&F1,&00
defb &11,&00,&00,&88,&00,&F8,&D0,&F0,&F0,&70
defb &F0,&D0,&F0,&F0,&70,&F0,&B0,&F0,&D1,&00
defb &44,&00,&A8,&20,&10,&40,&50,&00,&F0,&D0
defb &F0,&F0,&70,&E0,&E2,&00,&22,&00,&F0,&D0
defb &F0,&88,&22,&00,&64,&20,&10,&30,&90,&00
defb &44,&44,&22,&22,&00,&90,&C0,&80,&40,&62
defb &00,&44,&11,&F0,&B0,&F0,&00,&44,&00,&74
defb &70,&E0,&F0,&F0,&B0,&F0,&40,&44,&00,&88
defb &00,&FC,&E0,&F0,&B0,&F0,&D0,&F0,&70,&F0
defb &D0,&F0,&E0,&F0,&C4,&00,&44,&00,&00,&22
defb &00,&32,&F0,&70,&F0,&B0,&F0,&E0,&F0,&B0
defb &F0,&D0,&F0,&70,&F3,&00,&11,&00,&22,&20
defb &40,&88,&11,&00,&00,&33,&CC,&00,&00,&88
defb &11,&20,&CC,&00,&00,&30,&F0,&80,&00,&70
defb &F0,&F0,&F0,&F1,&00,&11,&00,&CC,&00,&A8
defb &10,&F0,&F0,&00,&44,&44,&22,&22,&00,&F0
defb &F0,&80,&51,&00,&33,&00,&88,&00,&F8,&F0
defb &F0,&F0,&E0,&00,&10,&F0,&C0,&00,&00,&33
defb &00,&64,&00,&40,&40,&00,&44,&44,&22,&22
defb &00,&20,&20,&00,&62,&00,&44,&CC,&00,&00
defb &33,&F0,&F0,&E0,&00,&F0,&F0,&C0,&00,&00
defb &00,&00,&30,&F0,&F0,&00,&70,&F0,&F0,&CC
defb &00,&00,&33,&22,&CC,&11,&00,&22,&00,&40
defb &40,&00,&44,&44,&22,&22,&00,&20,&20,&00
defb &44,&00,&88,&33,&CC,&00,&00,&33,&70,&F0
defb &F0,&F0,&E0,&00,&00,&F0,&F0,&88,&00,&88
defb &88,&11,&00,&40,&40,&00,&44,&44,&22,&22
defb &00,&20,&20,&00,&88,&11,&11,&00,&11,&F0
defb &F0,&00,&00,&70,&F0,&F0,&F0,&E0,&CC,&00
defb &00,&33,&00,&20,&20,&11,&00,&22,&00,&00
defb &33,&00,&00,&00,&CC,&00,&00,&00,&30,&F0
defb &F0,&80,&10,&F0,&F0,&C0,&00,&00,&00,&33
defb &00,&00,&00,&CC,&00,&00,&44,&00,&88,&40
defb &40,&00,&22,&00,&44,&40,&40,&70,&E2,&44
defb &22,&74,&E0,&20,&20,&22,&00,&44,&00,&FC
defb &C0,&00,&10,&F0,&F0,&F0,&C4,&00,&44,&00
defb &11,&00,&32,&F0,&F0,&C0,&22,&66,&66,&44
defb &30,&F0,&F0,&C4,&00,&88,&00,&22,&00,&32
defb &F0,&F0,&F0,&80,&00,&30,&F3,&00,&CC,&00
defb &00,&33,&30,&F0,&F0,&00,&00,&00,&00,&88
defb &11,&F0,&F0,&C0,&22,&22,&44,&44,&30,&F0
defb &F0,&88,&11,&00,&00,&F0,&F0,&C0,&CC,&00
defb &00,&33,&00,&44,&00,&F8,&F0,&C0,&22,&22
defb &44,&44,&30,&F0,&F1,&00,&22,&00,&33,&FF
defb &FF,&FF,&FF,&EE,&00,&22,&00,&22,&00,&44
defb &40,&70,&E2,&22,&44,&74,&E0,&20,&22,&00
defb &44,&00,&44,&00,&77,&FF,&FF,&FF,&FF,&CC
defb &00,&11,&00,&22,&40,&00,&22,&22,&44,&44
defb &00,&20,&44,&00,&88,&00,&88,&11,&40,&00
defb &11,&22,&44,&88,&00,&20,&88,&11,&44,&00
defb &A8,&A0,&B1,&22,&44,&D8,&50,&51,&00,&22
defb &74,&F0,&F1,&22,&44,&F8,&F0,&E2,&00,&44
defb &11,&00,&32,&F0,&F1,&22,&44,&F8,&F0,&C4
defb &00,&88,&00,&88,&11,&50,&51,&22,&44,&A8
defb &A0,&88,&11,&00,&00,&44,&00,&88,&11,&33
defb &CC,&88,&11,&00,&22,&00,&00,&11,&00,&22
defb &00,&88,&11,&00,&44,&00,&88,&00,&88,&11
defb &00,&88,&11,&00,&88,&11,&44,&00,&88,&88
defb &11,&11,&00,&22,&22,&00,&44,&99,&99,&22
defb &00,&44,&11,&00,&22,&AA,&55,&44,&00,&88
defb &00,&88,&11,&CC,&33,&88,&11,&00,&00,&44
defb &00,&88,&11,&00,&22,&00,&00,&22,&11,&00
defb &00,&88,&44,&00,&00,&11,&22,&00,&00,&44
defb &88,&00,&00,&80,&00,&10,&00,&20,&40,&00
defb &80,&00,&10,&00,&10,&40,&00,&10,&00,&20
defb &40,&00,&80,&00,&20,&80,&20,&20,&00,&10
defb &70,&A0,&00,&10,&10,&00,&00,&80,&80,&00
defb &50,&E0,&80,&00,&40,&40,&40,&10,&00,&30
defb &80,&70,&00,&20,&00,&80,&10,&00,&40,&00
defb &E0,&10,&C0,&00,&80,&20,&00,&F0,&F1,&00
defb &88,&00,&00,&11,&00,&F8,&F0,&00,&00,&80
defb &11,&00,&88,&00,&10,&00,&80,&00,&F0,&C0
defb &00,&60,&20,&00,&00,&40,&60,&00,&30,&F0
defb &00,&10,&00,&80,&00,&11,&00,&88,&10,&00
defb &00,&B0,&00,&70,&00,&30,&80,&20,&40,&00
defb &00,&20,&40,&10,&C0,&00,&E0,&00,&D0,&00
defb &40,&00,&00,&80,&10,&00,&00,&20,&A0,&00
defb &00,&80,&11,&00,&88,&50,&A0,&11,&00,&88
defb &10,&00,&00,&50,&00,&80,&80,&00,&00,&10
defb &10,&00,&00,&B0,&D0,&00,&00,&80,&80,&00
defb &00,&10,&10,&00,&00,&B0,&D0,&00,&00,&80
defb &80,&00,&00,&10,&10,&00,&00,&40,&40,&00
defb &00,&20,&00,&80,&10,&C0,&31,&80,&98,&00
defb &40,&00,&40,&00,&00,&20,&20,&00,&00,&20
defb &00,&91,&10,&C8,&30,&80,&10,&00,&00,&80
defb &80,&00,&00,&00,&30,&F0,&E0,&20,&00,&30
defb &80,&00,&11,&10,&C8,&00,&40,&00,&10,&F0
defb &F0,&00,&80,&00,&70,&80,&00,&20,&00,&31
defb &80,&88,&00,&10,&C0,&00,&40,&70,&F0,&C0
defb &20,&00,&10,&E0,&00,&10,&00,&F0,&F0,&80
defb &80,&40,&00,&20,&20,&00,&20,&10,&00,&20
defb &40,&00,&80,&40,&00,&40,&40,&00,&20,&10
defb &80,&40,&00,&70,&F1,&00,&B8,&10,&10,&00
defb &10,&10,&00,&10,&80,&00,&80,&80,&00,&80
defb &00,&00,&80,&D1,&00,&F8,&E0,&00,&20,&10
defb &50,&80,&30,&80,&10,&C0,&10,&20,&00,&00
defb &00,&00,&40,&80,&30,&80,&10,&C0,&10,&A0
defb &40,&00,&11,&20,&88,&C0,&00,&00,&00,&00
defb &30,&11,&40,&88,&00,&20,&80,&00,&00,&10
defb &00,&C0,&00,&00,&00,&00,&30,&00,&80,&00
defb &00,&10,&20,&10,&00,&00,&11,&00,&88,&40
defb &00,&00,&10,&00,&10,&10,&00,&00,&80,&40
defb &00,&20,&00,&00,&20,&11,&00,&88,&00,&00
defb &80,&40,&10,&F0,&F0,&00,&80,&00,&70,&80
defb &00,&40,&30,&F0,&E0,&00,&20,&20,&40,&40
defb &00,&70,&F0,&C0,&20,&00,&10,&E0,&00,&10
defb &00,&F0,&F0,&80,&00,&80,&80,&00,&F0,&F0
defb &80,&40,&00,&30,&D1,&00,&A8,&10,&F0,&F0
defb &F0,&F0,&80,&51,&00,&B8,&C0,&00,&20,&10
defb &F0,&F0,&00,&10,&10,&00,&80,&80,&00,&40
defb &20,&00,&10,&10,&00,&10,&00,&40,&20,&00
defb &00,&00,&10,&00,&80,&00,&80,&80,&00,&40
defb &20,&00,&10,&10,&00,&20,&10,&00,&00,&00
defb &20,&10,&00,&00,&80,&00,&80,&80,&00,&80
defb &11,&00,&98,&10,&80,&00,&80,&91,&00,&88
defb &10,&00,&10,&10,&00,&10,&80,&80,&00,&80
defb &10,&00,&10,&10,&00,&10,&00,&60,&00,&80
defb &00,&00,&40,&10,&80,&00,&80,&80,&00,&80
defb &10,&00,&10,&10,&00,&90,&00,&70,&00,&30
defb &80,&20,&40,&00,&80,&00,&80,&80,&00,&80
defb &11,&00,&98,&10,&80,&00,&80,&91,&00,&88
defb &10,&00,&10,&10,&00,&10,&00,&20,&40,&10
defb &C0,&00,&E0,&00,&90,&00,&10,&00,&80,&00
defb &F0,&C0,&00,&40,&20,&00,&80,&00,&80,&80
defb &00,&80,&10,&00,&10,&10,&00,&10,&80,&00
defb &80,&80,&00,&80,&10,&00,&10,&10,&00,&10
defb &00,&40,&20,&00,&30,&F0,&00,&10,&00,&80
defb &00,&80,&10,&00,&80,&00,&80,&80,&00,&40
defb &31,&00,&98,&10,&00,&10,&80,&00,&80,&91
defb &00,&C8,&20,&00,&10,&10,&00,&10,&00,&80
defb &10,&00,&30,&80,&00,&80,&F0,&F0,&80,&40
defb &00,&30,&C0,&00,&20,&10,&F0,&F0,&F0,&F0
defb &80,&40,&00,&30,&C0,&00,&20,&10,&F0,&F0
defb &10,&00,&10,&C0,&10,&00,&80,&00,&11,&10
defb &88,&80,&10,&11,&80,&88,&00,&10,&00,&80
defb &30,&00,&40,&00,&00,&20,&00,&C0,&40,&80
defb &30,&80,&11,&C0,&98,&20,&40,&91,&30,&88
defb &10,&C0,&10,&20,&80,&40,&00,&70,&E0,&00
defb &20,&10,&11,&00,&C8,&00,&80,&00,&00,&10
defb &00,&31,&00,&88,&00,&20,&00,&30,&80,&00
defb &00,&10,&C0,&00,&40,&00,&60,&00,&11,&60
defb &A8,&00,&20,&00,&00,&40,&00,&51,&60,&88
defb &00,&60,&00,&20,&00,&80,&10,&C0,&30,&80
defb &10,&00,&40,&00,&00,&10,&10,&00,&00,&B0
defb &D1,&00,&88,&80,&80,&00,&00,&10,&10,&11
defb &00,&B8,&D0,&00,&00,&80,&80,&00,&A0,&00
defb &00,&80,&10,&00,&00,&50,&40,&00,&00,&80
defb &11,&00,&88,&20,&40,&11,&00,&88,&10,&00
defb &00,&20,&00,&11,&00,&88,&30,&00,&00,&11
defb &00,&88,&80,&00,&10,&C0,&80,&00,&FF,&FF
defb &80,&10,&40,&20,&80,&33,&00,&00,&00,&11
defb &00,&88,&00,&30,&F0,&80,&00,&40,&80,&10
defb &40,&20,&B3,&CC,&00,&00,&11,&11,&00,&30
defb &80,&00,&00,&40,&20,&00,&00,&30,&80,&00
defb &00,&40,&FF,&88,&00,&33,&00,&10,&10,&00
defb &00,&40,&80,&10,&40,&20,&CC,&00,&11,&FF
defb &20,&00,&00,&10,&C0,&00,&00,&40,&20,&00
defb &00,&10,&C0,&00,&88,&88,&22,&11,&00,&20
defb &80,&00,&00,&A0,&50,&00,&00,&20,&80,&00
defb &00,&A0,&50,&77,&00,&10,&10,&00,&00,&40
defb &80,&10,&40,&33,&00,&33,&EE,&A0,&50,&00
defb &00,&10,&40,&00,&00,&A0,&50,&00,&00,&10
defb &40,&00,&88,&44,&22,&11,&10,&20,&80,&80
defb &00,&A0,&50,&00,&10,&20,&80,&80,&00,&A0
defb &50,&00,&90,&00,&00,&F0,&C0,&10,&40,&CC
defb &00,&CC,&00,&A0,&50,&00,&10,&10,&40,&80
defb &00,&A0,&50,&00,&10,&10,&40,&80,&88,&44
defb &22,&11,&20,&B0,&D0,&40,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&00,&70,&E0,&00,&00,&CC
defb &00,&EE,&80,&80,&00,&80,&40,&10,&77,&00
defb &33,&00,&00,&70,&E0,&00,&20,&B0,&D0,&40
defb &00,&70,&E0,&00,&20,&B0,&D0,&40,&88,&44
defb &22,&11,&10,&40,&20,&80,&60,&40,&20,&60
defb &10,&40,&20,&80,&60,&40,&20,&60,&00,&33
defb &00,&11,&CC,&00,&40,&70,&00,&80,&40,&33
defb &88,&00,&CC,&00,&60,&40,&20,&60,&10,&40
defb &20,&80,&60,&40,&20,&60,&10,&40,&20,&80
defb &88,&44,&22,&11,&00,&80,&10,&00,&90,&80
defb &10,&90,&00,&80,&10,&00,&90,&80,&10,&90
defb &90,&80,&10,&90,&00,&80,&10,&00,&90,&80
defb &10,&90,&00,&80,&10,&00,&88,&44,&40,&00
defb &80,&80,&40,&CC,&00,&33,&22,&11,&10,&10
defb &80,&F0,&70,&10,&80,&E0,&10,&10,&80,&F0
defb &70,&10,&80,&E0,&70,&10,&80,&E0,&F0,&10
defb &80,&80,&70,&10,&80,&E0,&F0,&10,&80,&80
defb &88,&44,&20,&00,&40,&80,&77,&00,&33,&CC
defb &44,&33,&F0,&20,&40,&90,&10,&20,&40,&80
defb &F0,&20,&40,&90,&10,&20,&40,&80,&00,&30
defb &80,&33,&00,&11,&10,&80,&40,&80,&88,&00
defb &CC,&10,&C0,&00,&10,&20,&40,&80,&90,&20
defb &40,&F0,&10,&20,&40,&80,&90,&20,&40,&F0
defb &CC,&22,&44,&22,&90,&20,&40,&F0,&10,&20
defb &40,&80,&90,&20,&40,&F0,&10,&20,&40,&80
defb &00,&20,&80,&00,&00,&60,&20,&B3,&00,&33
defb &00,&10,&40,&00,&10,&20,&40,&80,&F0,&20
defb &40,&90,&10,&20,&40,&80,&F0,&20,&40,&90
defb &44,&22,&44,&22,&F0,&10,&80,&80,&70,&10
defb &80,&F0,&F0,&10,&80,&80,&70,&10,&80,&F0
defb &10,&20,&80,&80,&77,&00,&33,&00,&00,&10
defb &20,&CC,&00,&EE,&10,&10,&40,&80,&F0,&10
defb &80,&E0,&10,&10,&80,&F0,&F0,&10,&80,&E0
defb &10,&10,&80,&F0,&44,&22,&44,&22,&00,&80
defb &10,&00,&90,&80,&10,&90,&00,&80,&10,&00
defb &90,&80,&10,&90,&20,&B0,&D0,&40,&55,&CC
defb &00,&88,&00,&10,&31,&00,&33,&AA,&20,&B0
defb &D0,&40,&90,&80,&10,&90,&00,&80,&10,&00
defb &90,&80,&10,&90,&00,&80,&10,&00,&44,&22
defb &44,&22,&10,&40,&20,&80,&60,&40,&20,&60
defb &10,&40,&20,&80,&60,&40,&20,&60,&10,&40
defb &20,&80,&44,&66,&00,&66,&00,&10,&66,&00
defb &66,&22,&10,&40,&20,&80,&60,&40,&20,&60
defb &10,&40,&20,&80,&60,&40,&20,&60,&10,&40
defb &20,&80,&44,&22,&CC,&22,&20,&B0,&D0,&40
defb &00,&70,&E0,&00,&20,&B0,&D0,&40,&00,&70
defb &E0,&00,&00,&80,&10,&00,&44,&11,&88,&11
defb &00,&10,&88,&11,&88,&22,&00,&80,&10,&00
defb &00,&70,&E0,&00,&20,&B0,&D0,&40,&00,&70
defb &E0,&00,&20,&B0,&D0,&40,&44,&33,&88,&22
defb &10,&10,&40,&80,&00,&A0,&50,&00,&10,&10
defb &40,&80,&00,&A0,&50,&00,&10,&10,&80,&F0
defb &44,&88,&44,&00,&CC,&00,&00,&33,&00,&22
defb &11,&22,&F0,&10,&80,&80,&00,&A0,&50,&00
defb &10,&20,&80,&80,&00,&A0,&50,&00,&10,&20
defb &80,&80,&44,&11,&88,&22,&00,&10,&40,&00
defb &00,&A0,&50,&00,&00,&10,&40,&00,&00,&A0
defb &50,&00,&F0,&20,&40,&90,&55,&44,&22,&AA
defb &90,&20,&40,&F0,&00,&A0,&50,&00,&00,&20
defb &80,&00,&00,&A0,&50,&00,&00,&20,&80,&00
defb &44,&11,&00,&00,&00,&11,&00,&88,&00,&00
defb &88,&22,&00,&10,&C0,&00,&00,&40,&20,&00
defb &00,&10,&C0,&00,&00,&40,&20,&00,&90,&20
defb &40,&F0,&44,&AA,&00,&CC,&00,&88,&11,&00
defb &33,&00,&55,&22,&F0,&20,&40,&90,&00,&40
defb &20,&00,&00,&30,&80,&00,&00,&40,&20,&00
defb &00,&30,&80,&00,&44,&11,&CC,&44,&00,&22
defb &00,&66,&00,&00,&00,&11,&00,&88,&00,&00
defb &66,&00,&44,&00,&22,&33,&00,&11,&88,&11
defb &88,&00,&00,&44,&11,&00,&88,&66,&00,&66
defb &66,&00,&66,&11,&00,&88,&22,&00,&CC,&88
defb &00,&99,&44,&11,&00,&11,&99,&00,&88,&00
defb &00,&11,&88,&00,&00,&FF,&FF,&00,&00,&11
defb &88,&00,&00,&00,&00,&11,&00,&99,&88,&00
defb &88,&22,&99,&00,&11,&33,&00,&44,&11,&00
defb &88,&00,&CC,&00,&44,&00,&00,&22,&00,&33
defb &00,&11,&00,&88,&22,&00,&00,&22,&00,&44
defb &20,&20,&10,&30,&90,&00,&88,&44,&22,&11
defb &00,&90,&C0,&80,&40,&40,&22,&00,&44,&00
defb &CC,&11,&00,&22,&20,&20,&10,&40,&50,&00
defb &88,&44,&22,&11,&00,&A0,&20,&80,&40,&40
defb &44,&00,&88,&33,&22,&00,&88,&11,&20,&20
defb &10,&40,&50,&00,&88,&44,&22,&11,&00,&A0
defb &20,&80,&40,&40,&88,&11,&00,&44,&88,&44
defb &22,&11,&00,&A0,&20,&80,&40,&D1,&00,&22
defb &00,&F8,&E0,&F0,&F0,&70,&F0,&D0,&F0,&F0
defb &70,&F0,&D0,&F0,&71,&00,&11,&00,&00,&88
defb &00,&E8,&F0,&B0,&F0,&E0,&F0,&F0,&B0,&F0
defb &E0,&F0,&F0,&70,&F1,&00,&44,&00,&B8,&20
defb &10,&40,&50,&00,&E0,&F0,&F0,&B0,&F0,&70
defb &E2,&00,&22,&00,&F0,&F0,&B0,&88,&22,&00
defb &64,&A0,&10,&30,&90,&00,&44,&44,&22,&22
defb &00,&90,&C0,&80,&50,&62,&00,&44,&11,&D0
defb &F0,&F0,&00,&44,&00,&74,&E0,&F0,&D0,&F0
defb &F0,&70,&60,&44,&00,&88,&00,&FC,&F0,&D0
defb &F0,&E0,&F0,&B0,&F0,&E0,&F0,&F0,&70,&D0
defb &C4,&00,&44,&00,&00,&22,&00,&32,&B0,&E0
defb &F0,&F0,&70,&F0,&D0,&F0,&70,&F0,&B0,&F0
defb &F3,&00,&11,&00,&22,&60,&CC,&00,&00,&F0
defb &C0,&00,&30,&F0,&F0,&F0,&E0,&11,&00,&11
defb &88,&00,&88,&70,&F0,&F0,&F0,&C0,&00,&30
defb &F0,&00,&00,&33,&33,&F0,&F0,&00,&30,&F0
defb &E0,&00,&33,&22,&00,&64,&00,&80,&20,&00
defb &44,&44,&22,&22,&00,&40,&10,&00,&62,&00
defb &44,&CC,&00,&70,&F0,&C0,&00,&F0,&F0,&CC
defb &CC,&11,&00,&22,&00,&80,&20,&00,&44,&44
defb &22,&22,&00,&40,&10,&00,&44,&00,&88,&33
defb &CC,&00,&00,&33,&00,&30,&F0,&F0,&F0,&C0
defb &88,&11,&00,&F0,&E0,&00,&44,&44,&22,&22
defb &00,&70,&F0,&00,&88,&11,&30,&F0,&F0,&F0
defb &C0,&00,&CC,&00,&00,&33,&00,&20,&20,&11
defb &00,&22,&00,&00,&33,&00,&00,&00,&FC,&E0
defb &00,&00,&00,&70,&F0,&F0,&F0,&F0,&E0,&00
defb &00,&00,&70,&F3,&00,&00,&00,&CC,&00,&00
defb &44,&00,&88,&40,&40,&00,&22,&00,&44,&40
defb &50,&F0,&E2,&44,&22,&74,&F0,&A0,&20,&22
defb &00,&44,&11,&00,&32,&F0,&F0,&00,&22,&66
defb &66,&44,&00,&F0,&F0,&C4,&00,&88,&CC,&00
defb &00,&33,&00,&70,&F0,&F0,&00,&00,&00,&88
defb &11,&F0,&F0,&00,&22,&22,&44,&44,&00,&F0
defb &F0,&88,&11,&00,&F0,&F0,&E0,&00,&CC,&00
defb &00,&33,&00,&44,&00,&F8,&F0,&00,&22,&22
defb &44,&44,&00,&F0,&F1,&00,&22,&00,&00,&22
defb &00,&44,&50,&F0,&E2,&22,&44,&74,&F0,&A0
defb &22,&00,&44,&00,&44,&00,&98,&50,&51,&22
defb &44,&A8,&A0,&91,&00,&22,&00,&88,&11,&A0
defb &B1,&22,&44,&D8,&50,&88,&11,&00,&00,&10
defb &00,&20,&00,&10,&00,&20,&40,&00,&80,&00
defb &40,&00,&80,&00,&80,&20,&00,&10,&00,&40
defb &20,&00,&80,&00,&40,&10,&80,&10,&00,&20
defb &00,&40,&20,&00,&40,&00,&80,&10,&40,&10
defb &70,&A0,&00,&80,&10,&00,&50,&E0,&80,&20
defb &40,&30,&80,&70,&00,&80,&10,&00,&E0,&10
defb &C0,&20,&40,&00,&11,&20,&88,&00,&00,&11
defb &40,&88,&00,&20,&00,&10,&A0,&00,&00,&50
defb &80,&00,&F0,&C0,&00,&40,&00,&70,&A0,&00
defb &00,&50,&80,&00,&00,&00,&E0,&00,&20,&00
defb &30,&F0,&00,&20,&60,&10,&00,&70,&00,&30
defb &80,&20,&10,&90,&00,&00,&00,&60,&20,&00
defb &11,&40,&E8,&00,&00,&00,&90,&80,&40,&10
defb &C0,&00,&E0,&00,&80,&60,&40,&00,&00,&71
defb &20,&88,&00,&40,&60,&00,&40,&10,&E0,&00
defb &80,&00,&00,&80,&10,&00,&00,&80,&10,&00
defb &10,&00,&70,&80,&20,&00,&00,&80,&10,&00
defb &00,&80,&10,&00,&00,&10,&00,&70,&80,&20
defb &80,&00,&00,&40,&10,&00,&11,&80,&A8,&00
defb &00,&40,&00,&20,&10,&00,&00,&51,&10,&88
defb &00,&80,&20,&00,&00,&10,&10,&00,&80,&00
defb &40,&00,&00,&40,&00,&80,&10,&00,&20,&00
defb &00,&80,&00,&40,&20,&00,&00,&40,&20,&00
defb &10,&00,&00,&40,&00,&80,&10,&00,&20,&00
defb &00,&20,&00,&10,&00,&80,&00,&80,&80,&00
defb &40,&00,&00,&20,&00,&B0,&D1,&00,&C8,&00
defb &00,&80,&00,&40,&40,&00,&00,&20,&20,&00
defb &10,&00,&00,&31,&00,&B8,&D0,&00,&40,&00
defb &00,&20,&00,&10,&10,&00,&00,&20,&10,&C0
defb &30,&80,&40,&00,&80,&00,&00,&00,&00,&40
defb &20,&00,&00,&00,&00,&10,&00,&70,&00,&80
defb &80,&00,&00,&00,&00,&40,&40,&30,&80,&00
defb &00,&10,&60,&00,&11,&60,&88,&00,&00,&00
defb &00,&10,&10,&00,&E0,&00,&00,&11,&60,&88
defb &00,&60,&80,&00,&00,&10,&C0,&20,&20,&00
defb &00,&10,&80,&00,&00,&10,&80,&00,&D0,&00
defb &80,&00,&70,&80,&00,&40,&20,&C0,&30,&40
defb &20,&00,&10,&E0,&00,&10,&00,&B0,&00,&C0
defb &40,&00,&20,&10,&20,&00,&10,&C0,&00,&40
defb &00,&70,&E0,&00,&20,&00,&30,&80,&10,&C0
defb &00,&40,&00,&70,&E0,&00,&20,&00,&30,&80
defb &00,&40,&20,&00,&10,&30,&00,&80,&30,&80
defb &11,&C0,&98,&00,&C0,&80,&10,&30,&00,&91
defb &30,&88,&10,&C0,&10,&00,&C0,&80,&00,&40
defb &00,&20,&00,&F0,&00,&40,&20,&00,&F0,&00
defb &40,&00,&00,&20,&00,&F0,&20,&00,&10,&11
defb &80,&88,&00,&10,&00,&80,&30,&00,&40,&00
defb &20,&10,&80,&40,&00,&20,&00,&C0,&40,&00
defb &20,&10,&11,&00,&C8,&40,&00,&20,&D0,&00
defb &80,&00,&70,&80,&00,&40,&20,&C0,&40,&00
defb &20,&20,&40,&40,&00,&20,&30,&40,&20,&00
defb &10,&E0,&00,&10,&00,&B0,&40,&00,&20,&31
defb &00,&88,&00,&40,&40,&30,&C0,&00,&40,&40
defb &20,&20,&00,&30,&C0,&20,&20,&00,&11,&00
defb &A8,&20,&10,&C0,&00,&40,&40,&00,&70,&80
defb &40,&40,&30,&80,&40,&51,&00,&88,&00,&00
defb &20,&20,&10,&E0,&00,&20,&20,&00,&00,&00
defb &00,&10,&00,&80,&00,&40,&40,&00,&00,&00
defb &00,&80,&80,&00,&40,&60,&80,&40,&00,&30
defb &C0,&00,&20,&10,&60,&00,&00,&60,&80,&40
defb &00,&30,&C0,&00,&20,&10,&60,&20,&00,&10
defb &10,&00,&10,&00,&80,&00,&40,&10,&80,&80
defb &00,&40,&31,&00,&98,&10,&80,&00,&00,&10
defb &80,&91,&00,&C8,&20,&00,&10,&10,&80,&20
defb &00,&10,&00,&80,&40,&10,&E0,&00,&80,&00
defb &80,&80,&00,&80,&11,&00,&98,&10,&80,&91
defb &00,&88,&10,&00,&10,&10,&00,&10,&00,&70
defb &80,&20,&00,&00,&80,&91,&00,&88,&10,&00
defb &10,&10,&00,&00,&E0,&00,&20,&00,&30,&F0
defb &80,&80,&00,&40,&20,&00,&10,&10,&80,&00
defb &40,&00,&00,&00,&00,&80,&00,&00,&00,&10
defb &80,&80,&00,&40,&20,&00,&10,&10,&80,&00
defb &00,&60,&80,&40,&00,&30,&D1,&00,&A8,&10
defb &60,&00,&00,&60,&80,&51,&00,&B8,&C0,&00
defb &20,&10,&60,&00,&11,&00,&A8,&20,&00,&20
defb &40,&00,&40,&51,&00,&88,&11,&00,&88,&40
defb &00,&20,&40,&00,&20,&11,&00,&88,&20,&00
defb &10,&00,&80,&00,&00,&10,&00,&80,&00,&40
defb &20,&00,&F0,&00,&40,&00,&11,&20,&88,&F0
defb &00,&40,&20,&00,&F0,&11,&40,&88,&00,&20
defb &00,&F0,&00,&40,&10,&30,&00,&80,&30,&80
defb &10,&C0,&10,&00,&C0,&80,&10,&C0,&00,&40
defb &00,&70,&F1,&00,&A8,&00,&30,&80,&10,&C0
defb &00,&51,&00,&F8,&E0,&00,&20,&00,&30,&80
defb &00,&10,&80,&00,&11,&10,&88,&00,&00,&11
defb &80,&88,&00,&10,&80,&00,&00,&10,&60,&00
defb &00,&60,&80,&00,&00,&20,&10,&C0,&31,&80
defb &C8,&00,&00,&31,&10,&C8,&30,&80,&40,&00
defb &00,&20,&00,&B0,&D0,&00,&40,&00,&00,&40
defb &00,&80,&11,&00,&A8,&00,&00,&51,&00,&88
defb &10,&00,&20,&00,&00,&40,&10,&00,&00,&80
defb &20,&00,&00,&80,&10,&00,&11,&80,&98,&00
defb &00,&91,&10,&88,&00,&80,&10,&00,&00,&10
defb &A0,&00,&11,&50,&88,&00,&00,&11,&A0,&88
defb &00,&50,&80,&00,&00,&00,&00,&11,&00,&88
defb &00,&F0,&11,&11,&00,&40,&20,&00,&00,&30
defb &80,&00,&00,&40,&20,&00,&00,&30,&FF,&88
defb &00,&33,&00,&10,&10,&00,&00,&40,&80,&10
defb &40,&20,&CC,&00,&11,&FF,&C0,&00,&00,&40
defb &20,&00,&00,&10,&C0,&00,&00,&40,&20,&00
defb &88,&88,&22,&11,&00,&A0,&50,&00,&00,&20
defb &80,&00,&00,&A0,&50,&00,&00,&20,&80,&77
defb &00,&10,&10,&00,&00,&40,&80,&10,&40,&33
defb &00,&33,&EE,&10,&40,&00,&00,&A0,&50,&00
defb &00,&10,&40,&00,&00,&A0,&50,&00,&88,&44
defb &22,&11,&00,&A0,&50,&00,&10,&20,&80,&80
defb &00,&A0,&50,&00,&10,&20,&80,&80,&90,&00
defb &00,&F0,&C0,&10,&40,&CC,&00,&CC,&10,&10
defb &40,&80,&00,&A0,&50,&00,&10,&10,&40,&80
defb &00,&A0,&50,&00,&88,&44,&22,&11,&00,&70
defb &E0,&00,&20,&B0,&D0,&40,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&00,&CC,&00,&EE,&80,&80
defb &00,&80,&40,&10,&77,&00,&33,&00,&20,&B0
defb &D0,&40,&00,&70,&E0,&00,&20,&B0,&D0,&40
defb &00,&70,&E0,&00,&88,&44,&22,&11,&60,&40
defb &20,&60,&10,&40,&20,&80,&60,&40,&20,&60
defb &10,&40,&20,&80,&00,&33,&00,&11,&CC,&00
defb &40,&70,&00,&80,&40,&33,&88,&00,&CC,&00
defb &10,&40,&20,&80,&60,&40,&20,&60,&10,&40
defb &20,&80,&60,&40,&20,&60,&88,&44,&22,&11
defb &90,&80,&10,&90,&00,&80,&10,&00,&90,&80
defb &10,&90,&00,&80,&10,&00,&00,&80,&10,&00
defb &90,&80,&10,&90,&00,&80,&10,&00,&90,&80
defb &10,&90,&88,&44,&22,&11,&70,&10,&80,&E0
defb &10,&10,&80,&F0,&70,&10,&80,&E0,&10,&10
defb &80,&F0,&F0,&10,&80,&80,&70,&10,&80,&E0
defb &F0,&10,&80,&80,&70,&10,&80,&E0,&88,&44
defb &44,&33,&10,&20,&40,&80,&F0,&20,&40,&90
defb &10,&20,&40,&80,&F0,&20,&40,&90,&00,&40
defb &20,&33,&00,&11,&10,&80,&40,&80,&88,&00
defb &CC,&40,&20,&00,&90,&20,&40,&F0,&10,&20
defb &40,&80,&90,&20,&40,&F0,&10,&20,&40,&80
defb &CC,&22,&44,&22,&10,&20,&40,&80,&90,&20
defb &40,&F0,&10,&20,&40,&80,&90,&20,&40,&F0
defb &00,&A0,&50,&00,&00,&60,&20,&B3,&00,&33
defb &00,&A0,&50,&00,&F0,&20,&40,&90,&10,&20
defb &40,&80,&F0,&20,&40,&90,&10,&20,&40,&80
defb &44,&22,&44,&22,&70,&10,&80,&F0,&F0,&10
defb &80,&80,&70,&10,&80,&F0,&F0,&10,&80,&80
defb &00,&A0,&50,&00,&77,&00,&33,&00,&00,&10
defb &20,&CC,&00,&EE,&00,&A0,&50,&00,&10,&10
defb &80,&F0,&F0,&10,&80,&E0,&10,&10,&80,&F0
defb &F0,&10,&80,&E0,&44,&22,&44,&22,&90,&80
defb &10,&90,&00,&80,&10,&00,&90,&80,&10,&90
defb &00,&80,&10,&00,&00,&70,&E0,&00,&55,&CC
defb &00,&88,&00,&10,&31,&00,&33,&AA,&00,&70
defb &E0,&00,&00,&80,&10,&00,&90,&80,&10,&90
defb &00,&80,&10,&00,&90,&80,&10,&90,&44,&22
defb &44,&22,&60,&40,&20,&60,&10,&40,&20,&80
defb &60,&40,&20,&60,&10,&40,&20,&80,&60,&40
defb &20,&60,&44,&66,&00,&66,&00,&10,&66,&00
defb &66,&22,&60,&40,&20,&60,&10,&40,&20,&80
defb &60,&40,&20,&60,&10,&40,&20,&80,&60,&40
defb &20,&60,&44,&22,&CC,&22,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&00,&70,&E0,&00,&20,&B0
defb &D0,&40,&90,&80,&10,&90,&44,&11,&88,&11
defb &00,&10,&88,&11,&88,&22,&90,&80,&10,&90
defb &20,&B0,&D0,&40,&00,&70,&E0,&00,&20,&B0
defb &D0,&40,&00,&70,&E0,&00,&44,&33,&88,&22
defb &00,&A0,&50,&00,&10,&10,&40,&80,&00,&A0
defb &50,&00,&10,&10,&40,&80,&70,&10,&80,&E0
defb &44,&88,&44,&00,&CC,&00,&00,&33,&00,&22
defb &11,&22,&70,&10,&80,&E0,&10,&20,&80,&80
defb &00,&A0,&50,&00,&10,&20,&80,&80,&00,&A0
defb &50,&00,&44,&11,&88,&22,&00,&A0,&50,&00
defb &00,&10,&40,&00,&00,&A0,&50,&00,&00,&10
defb &40,&00,&10,&20,&40,&80,&55,&44,&22,&AA
defb &10,&20,&40,&80,&00,&20,&80,&00,&00,&A0
defb &50,&00,&00,&20,&80,&00,&00,&A0,&50,&00
defb &44,&11,&88,&22,&00,&40,&20,&00,&00,&10
defb &C0,&00,&00,&40,&20,&00,&00,&10,&C0,&00
defb &10,&20,&40,&80,&44,&AA,&00,&CC,&00,&88
defb &11,&00,&33,&00,&55,&22,&10,&20,&40,&80
defb &00,&30,&80,&00,&00,&40,&20,&00,&00,&30
defb &80,&00,&00,&40,&20,&00,&44,&11,&00,&11
defb &88,&11,&88,&00,&11,&00,&88,&00,&00,&11
defb &00,&88,&00,&11,&88,&11,&88,&00,&00,&44
defb &11,&00,&88,&66,&00,&66,&11,&00,&88,&00
defb &00,&11,&00,&88,&66,&00,&66,&11,&00,&88
defb &22,&00,&CC,&88,&00,&99,&44,&11,&00,&11
defb &88,&00,&00,&11,&88,&00,&88,&22,&99,&00
defb &11,&33,&00,&44,&11,&00,&88,&00,&CC,&00
defb &55,&00,&88,&00,&00,&11,&00,&AA,&00,&33
defb &00,&11,&00,&88,&22,&00
DoubleByteDE:
pop iy
ld a,(iy)
inc iy
ld d,a
ld e,a
push de
push de
jp(iy)

PushDE_0000x:
Ld DE,&0000
jr PushDE_Multi
PushDE_F0F0x:
Ld DE,&F0F0
jr PushDE_Multi
PushDE_0F0Fx:
Ld DE,&0F0F
jr PushDE_Multi
PushDE_FFFFx:
Ld DE,&FFFF
PushDE_Multi
pop hl
push DE
push DE
push DE
push DE
jp (hl)

DataEnd:
defb 00

save direct "T24-SC3.D02",&4000,DataEnd-&4000	;address,size...}[,exec_address]
