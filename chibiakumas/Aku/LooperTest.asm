org &4000
nolist
jp PicStage18_backsbmp

PicStage18_backsbmp:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C050-0

LD IX,PicStage18_backsbmp_DrawOrder
JP JumpToNextLine


PicStage18_backsbmp_Line_0:
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


PicStage18_backsbmp_Line_1:
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


PicStage18_backsbmp_Line_2:
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


PicStage18_backsbmp_Line_3:
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


PicStage18_backsbmp_Line_4:
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


PicStage18_backsbmp_Line_5:
call MultiPushDe6
call BitmapPush30
defw BitmapData+131
call BitmapPush26
defw BitmapData+157
jp MultiPushDeLast6


PicStage18_backsbmp_Line_6:
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


PicStage18_backsbmp_Line_7:
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


PicStage18_backsbmp_Line_8:
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


PicStage18_backsbmp_Line_9:
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


PicStage18_backsbmp_Line_10:
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


PicStage18_backsbmp_Line_11:
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


PicStage18_backsbmp_Line_12:
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


PicStage18_backsbmp_Line_13:
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


PicStage18_backsbmp_Line_14:
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


PicStage18_backsbmp_Line_15:
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


PicStage18_backsbmp_Line_16:
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


PicStage18_backsbmp_Line_17:
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


PicStage18_backsbmp_Line_18:
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


PicStage18_backsbmp_Line_19:
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


PicStage18_backsbmp_Line_20:
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


PicStage18_backsbmp_Line_21:
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


PicStage18_backsbmp_Line_22:
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


PicStage18_backsbmp_Line_23:
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


PicStage18_backsbmp_Line_24:
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


PicStage18_backsbmp_Line_25:
call MultiPushDe17
call BitmapPush12
defw BitmapData+685
jp MultiPushDeLast17


PicStage18_backsbmp_Line_26:
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


PicStage18_backsbmp_Line_27:
call MultiPushDe17
call BitmapPush12
defw BitmapData+697
jp MultiPushDeLast17


PicStage18_backsbmp_Line_28:
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


PicStage18_backsbmp_Line_29:
call MultiPushDe18
call BitmapPush8
defw BitmapData+713
jp MultiPushDeLast18


PicStage18_backsbmp_Line_30:
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


PicStage18_backsbmp_Line_31:
call MultiPushDe18
call BitmapPush8
defw BitmapData+729
jp MultiPushDeLast18


PicStage18_backsbmp_Line_32:
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


PicStage18_backsbmp_Line_33:
call MultiPushDe18
call BitmapPush8
defw BitmapData+745
jp MultiPushDeLast18


PicStage18_backsbmp_Line_34:
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


PicStage18_backsbmp_Line_35:
call MultiPushDe18
call BitmapPush8
defw BitmapData+761
jp MultiPushDeLast18


PicStage18_backsbmp_Line_36:
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


PicStage18_backsbmp_Line_37:
call MultiPushDe19
LD HL,&2200
  Push HL
LD BC,&0044
  Push BC
jp MultiPushDeLast19


PicStage18_backsbmp_Line_38:
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


PicStage18_backsbmp_Line_39:
jp MultiPushDeLast40


PicStage18_backsbmp_Line_38_Reuse:
LD DE,&0000
JP PicStage18_backsbmp_Line_38
PicStage18_backsbmp_Line_39_Reuse:
LD DE,&0000
JP PicStage18_backsbmp_Line_39
PicStage18_backsbmp_Line_133:
call MultiPushDe30
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD DE,&0000
 jp NextLinePushDe3


PicStage18_backsbmp_Line_134:
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
defw BitmapData+767
 jp NextLinePushDe1


PicStage18_backsbmp_Line_135:
call MultiPushDe30
LD HL,&0010
  Push HL
call MultiPushDe5
LD BC,&0080
  Push BC
 jp NextLinePushDe3


PicStage18_backsbmp_Line_134_Reuse:
LD DE,&0000
JP PicStage18_backsbmp_Line_134
PicStage18_backsbmp_Line_135_Reuse:
LD DE,&0000
JP PicStage18_backsbmp_Line_135
PicStage18_backsbmp_Line_168:
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
defw BitmapData+767
 jp NextLinePushDe1


PicStage18_backsbmp_Line_169:
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


PicStage18_backsbmp_Line_170:
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
defw BitmapData+773
call MultiPushDe5
call BitmapPush6
defw BitmapData+779
 jp NextLinePushDe1


PicStage18_backsbmp_Line_171:
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


PicStage18_backsbmp_Line_172:
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
defw BitmapData+785
 jp NextLinePushDe1


PicStage18_backsbmp_Line_173:
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


PicStage18_backsbmp_Line_174:
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
defw BitmapData+791
Ld D,&40
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+797


PicStage18_backsbmp_Line_175:
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
defw BitmapData+811
INC DE

 jp NextLinePushDe3


PicStage18_backsbmp_Line_176:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
call BitmapPush20
defw BitmapData+831
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+861
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_177:
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+879
Call PushDE_0000x
call BitmapPush30
defw BitmapData+909
 jp NextLinePushDe3


PicStage18_backsbmp_Line_178:
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
defw BitmapData+927
Call PushDE_0000x
call BitmapPush28
defw BitmapData+955
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_179:
call MultiPushDe7
call BitmapPush22
defw BitmapData+977
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1005
 jp NextLinePushDe4


PicStage18_backsbmp_Line_180:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+1029
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1057
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_181:
call MultiPushDe6
LD HL,&0033
  Push HL
LD BC,&00CC
  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+1075
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1093
  PUSH DE
call BitmapPush8
defw BitmapData+1101
 jp NextLinePushDe4


PicStage18_backsbmp_Line_182:
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
defw BitmapData+1119
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1137
  PUSH DE
call BitmapPush8
defw BitmapData+1145
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_183:
call MultiPushDe6
call BitmapPush24
defw BitmapData+1169
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1197
 jp NextLinePushDe4


PicStage18_backsbmp_Line_184:
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
defw BitmapData+1219
Call PushDE_0000x
call BitmapPush28
defw BitmapData+1247
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_185:
call MultiPushDe5
call BitmapPush26
defw BitmapData+1273
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1301
 jp NextLinePushDe4


PicStage18_backsbmp_Line_186:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1327
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1355
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_187:
call MultiPushDe5
call BitmapPush26
defw BitmapData+1381
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1409
 jp NextLinePushDe4


PicStage18_backsbmp_Line_188:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1435
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1463
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18_backsbmp_Line_189:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1491
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1519
 jp NextLinePushDe4


PicStage18_backsbmp_Line_190:
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
defw BitmapData+1543
Call PushDE_0000x
call BitmapPush24
defw BitmapData+1567
Ld D,&CC
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1575


PicStage18_backsbmp_Line_191:
Call PushDE_0000x
call BitmapPush28
defw BitmapData+1603
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+1631
 jp NextLinePushDe4


PicStage18_backsbmp_Line_192:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1637
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
defw BitmapData+1651


PicStage18_backsbmp_Line_193:
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1657
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
defw BitmapData+1657
 jp NextLinePushDe3


PicStage18_backsbmp_Line_194:
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
defw BitmapData+797


PicStage18_backsbmp_Line_195:
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


PicStage18_backsbmp_Line_196:
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
defw BitmapData+797


PicStage18_backsbmp_Line_197:
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1665
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
defw BitmapData+1673
 jp NextLinePushDe3


PicStage18_backsbmp_Line_198:
  PUSH DE
call BitmapPush12
defw BitmapData+1685
DEC DE

call MultiPushDe9
call BitmapPush6
defw BitmapData+1691
INC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1697
DEC DE

call MultiPushDe9
call FinalBitmapPush14
defw BitmapData+1711


PicStage18_backsbmp_Line_199:
INC DE

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1721
call MultiPushDe11
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
call MultiPushDe11
call BitmapPush10
defw BitmapData+1731
 jp NextLinePushDe2



PicStage18_backsbmp_DrawOrder: 

  DEFW PicStage18_backsbmp_Line_0
  DEFW PicStage18_backsbmp_Line_1
  DEFW PicStage18_backsbmp_Line_2
  DEFW PicStage18_backsbmp_Line_3
  DEFW PicStage18_backsbmp_Line_4
  DEFW PicStage18_backsbmp_Line_5
  DEFW PicStage18_backsbmp_Line_6
  DEFW PicStage18_backsbmp_Line_7
  DEFW PicStage18_backsbmp_Line_8
  DEFW PicStage18_backsbmp_Line_9
  DEFW PicStage18_backsbmp_Line_10
  DEFW PicStage18_backsbmp_Line_11
  DEFW PicStage18_backsbmp_Line_12
  DEFW PicStage18_backsbmp_Line_13
  DEFW PicStage18_backsbmp_Line_14
  DEFW PicStage18_backsbmp_Line_15
  DEFW PicStage18_backsbmp_Line_16
  DEFW PicStage18_backsbmp_Line_17
  DEFW PicStage18_backsbmp_Line_18
  DEFW PicStage18_backsbmp_Line_19
  DEFW PicStage18_backsbmp_Line_20
  DEFW PicStage18_backsbmp_Line_21
  DEFW PicStage18_backsbmp_Line_22
  DEFW PicStage18_backsbmp_Line_23
  DEFW PicStage18_backsbmp_Line_24
  DEFW PicStage18_backsbmp_Line_25
  DEFW PicStage18_backsbmp_Line_26
  DEFW PicStage18_backsbmp_Line_27
  DEFW PicStage18_backsbmp_Line_28
  DEFW PicStage18_backsbmp_Line_29
  DEFW PicStage18_backsbmp_Line_30
  DEFW PicStage18_backsbmp_Line_31
  DEFW PicStage18_backsbmp_Line_32
  DEFW PicStage18_backsbmp_Line_33
  DEFW PicStage18_backsbmp_Line_34
  DEFW PicStage18_backsbmp_Line_35
  DEFW PicStage18_backsbmp_Line_36
  DEFW PicStage18_backsbmp_Line_37

  defw looper
  DEFB 2,47
  DEFW PicStage18_backsbmp_Line_38_Reuse
  DEFW PicStage18_backsbmp_Line_39_Reuse

  DEFW PicStage18_backsbmp_Line_38_Reuse
  DEFW PicStage18_backsbmp_Line_133

  defw looper
  DEFB 2,17
  DEFW PicStage18_backsbmp_Line_134_Reuse
  DEFW PicStage18_backsbmp_Line_135_Reuse



  DEFW PicStage18_backsbmp_Line_168
  DEFW PicStage18_backsbmp_Line_169
  DEFW PicStage18_backsbmp_Line_170
  DEFW PicStage18_backsbmp_Line_171
  DEFW PicStage18_backsbmp_Line_172
  DEFW PicStage18_backsbmp_Line_173
  DEFW PicStage18_backsbmp_Line_174
  DEFW PicStage18_backsbmp_Line_175
  DEFW PicStage18_backsbmp_Line_176
  DEFW PicStage18_backsbmp_Line_177
  DEFW PicStage18_backsbmp_Line_178
  DEFW PicStage18_backsbmp_Line_179
  DEFW PicStage18_backsbmp_Line_180
  DEFW PicStage18_backsbmp_Line_181
  DEFW PicStage18_backsbmp_Line_182
  DEFW PicStage18_backsbmp_Line_183
  DEFW PicStage18_backsbmp_Line_184
  DEFW PicStage18_backsbmp_Line_185
  DEFW PicStage18_backsbmp_Line_186
  DEFW PicStage18_backsbmp_Line_187
  DEFW PicStage18_backsbmp_Line_188
  DEFW PicStage18_backsbmp_Line_189
  DEFW PicStage18_backsbmp_Line_190
  DEFW PicStage18_backsbmp_Line_191
  DEFW PicStage18_backsbmp_Line_192
  DEFW PicStage18_backsbmp_Line_193
  DEFW PicStage18_backsbmp_Line_194
  DEFW PicStage18_backsbmp_Line_195
  DEFW PicStage18_backsbmp_Line_196
  DEFW PicStage18_backsbmp_Line_197
  DEFW PicStage18_backsbmp_Line_198
  DEFW PicStage18_backsbmp_Line_199
  DEFW EndCode







;Global Code
EndCode:
ld sp,&0000:StackRestore_Plus2
ei
ret

MultiPushDeLast40: ld HL,NextLine
jr MultiPushDe40B 
MultiPushDe40: pop HL
jr MultiPushDe40B 
MultiPushDe34: pop HL
jr MultiPushDe34B 
MultiPushDe30: pop HL
jr MultiPushDe30B 
MultiPushDe27: pop HL
jr MultiPushDe27B 
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

finalBitmapPush14: ld b,&07
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
ld hl,&0800+80
add hl,sp
ld sp,hl
jp nc,JumpToNextLine
ld hl,&c050
add hl,sp
ld sp,hl

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
defb &88,&00,&00,&11,&00,&88,&80,&00,&10,&C0
defb &80,&00,&FF,&FF,&00,&11,&00,&88,&40,&00
defb &00,&11,&00,&88,&30,&00,&80,&10,&40,&20
defb &80,&33,&00,&00,&00,&11,&00,&88,&00,&30
defb &F0,&80,&00,&40,&80,&10,&40,&20,&B3,&CC
defb &00,&00,&11,&11,&00,&30,&80,&00,&00,&40
defb &20,&00,&00,&30,&80,&00,&00,&40,&FF,&88
defb &00,&33,&00,&10,&10,&00,&00,&40,&80,&10
defb &40,&20,&CC,&00,&11,&FF,&20,&00,&00,&10
defb &C0,&00,&00,&40,&20,&00,&00,&10,&C0,&00
defb &88,&88,&22,&11,&00,&20,&80,&00,&00,&A0
defb &50,&00,&00,&20,&80,&00,&00,&A0,&50,&77
defb &00,&10,&10,&00,&00,&40,&80,&10,&40,&33
defb &00,&33,&EE,&A0,&50,&00,&00,&10,&40,&00
defb &00,&A0,&50,&00,&00,&10,&40,&00,&88,&44
defb &22,&11,&10,&20,&80,&80,&00,&A0,&50,&00
defb &10,&20,&80,&80,&00,&A0,&50,&00,&90,&00
defb &00,&F0,&C0,&10,&40,&CC,&00,&CC,&00,&A0
defb &50,&00,&10,&10,&40,&80,&00,&A0,&50,&00
defb &10,&10,&40,&80,&88,&44,&22,&11,&20,&B0
defb &D0,&40,&00,&70,&E0,&00,&20,&B0,&D0,&40
defb &00,&70,&E0,&00,&00,&CC,&00,&EE,&80,&80
defb &00,&80,&40,&10,&77,&00,&33,&00,&00,&70
defb &E0,&00,&20,&B0,&D0,&40,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&88,&44,&22,&11,&10,&40
defb &20,&80,&60,&40,&20,&60,&10,&40,&20,&80
defb &60,&40,&20,&60,&00,&33,&00,&11,&CC,&00
defb &40,&70,&00,&80,&40,&33,&88,&00,&CC,&00
defb &60,&40,&20,&60,&10,&40,&20,&80,&60,&40
defb &20,&60,&10,&40,&20,&80,&88,&44,&22,&11
defb &00,&80,&10,&00,&90,&80,&10,&90,&00,&80
defb &10,&00,&90,&80,&10,&90,&90,&80,&10,&90
defb &00,&80,&10,&00,&90,&80,&10,&90,&00,&80
defb &10,&00,&88,&44,&40,&00,&80,&80,&40,&CC
defb &00,&33,&22,&11,&10,&10,&80,&F0,&70,&10
defb &80,&E0,&10,&10,&80,&F0,&70,&10,&80,&E0
defb &70,&10,&80,&E0,&F0,&10,&80,&80,&70,&10
defb &80,&E0,&F0,&10,&80,&80,&88,&44,&20,&00
defb &40,&80,&77,&00,&33,&CC,&44,&33,&F0,&20
defb &40,&90,&10,&20,&40,&80,&F0,&20,&40,&90
defb &10,&20,&40,&80,&00,&30,&80,&33,&00,&11
defb &10,&80,&40,&80,&88,&00,&CC,&10,&C0,&00
defb &10,&20,&40,&80,&90,&20,&40,&F0,&10,&20
defb &40,&80,&90,&20,&40,&F0,&CC,&22,&44,&22
defb &90,&20,&40,&F0,&10,&20,&40,&80,&90,&20
defb &40,&F0,&10,&20,&40,&80,&00,&20,&80,&00
defb &00,&60,&20,&B3,&00,&33,&00,&10,&40,&00
defb &10,&20,&40,&80,&F0,&20,&40,&90,&10,&20
defb &40,&80,&F0,&20,&40,&90,&44,&22,&44,&22
defb &F0,&10,&80,&80,&70,&10,&80,&F0,&F0,&10
defb &80,&80,&70,&10,&80,&F0,&10,&20,&80,&80
defb &77,&00,&33,&00,&00,&10,&20,&CC,&00,&EE
defb &10,&10,&40,&80,&F0,&10,&80,&E0,&10,&10
defb &80,&F0,&F0,&10,&80,&E0,&10,&10,&80,&F0
defb &44,&22,&44,&22,&00,&80,&10,&00,&90,&80
defb &10,&90,&00,&80,&10,&00,&90,&80,&10,&90
defb &20,&B0,&D0,&40,&55,&CC,&00,&88,&00,&10
defb &31,&00,&33,&AA,&20,&B0,&D0,&40,&90,&80
defb &10,&90,&00,&80,&10,&00,&90,&80,&10,&90
defb &00,&80,&10,&00,&44,&22,&44,&22,&10,&40
defb &20,&80,&60,&40,&20,&60,&10,&40,&20,&80
defb &60,&40,&20,&60,&10,&40,&20,&80,&44,&66
defb &00,&66,&00,&10,&66,&00,&66,&22,&10,&40
defb &20,&80,&60,&40,&20,&60,&10,&40,&20,&80
defb &60,&40,&20,&60,&10,&40,&20,&80,&44,&22
defb &CC,&22,&20,&B0,&D0,&40,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&00,&70,&E0,&00,&00,&80
defb &10,&00,&44,&11,&88,&11,&00,&10,&88,&11
defb &88,&22,&00,&80,&10,&00,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&00,&70,&E0,&00,&20,&B0
defb &D0,&40,&44,&33,&88,&22,&10,&10,&40,&80
defb &00,&A0,&50,&00,&10,&10,&40,&80,&00,&A0
defb &50,&00,&10,&10,&80,&F0,&44,&88,&44,&00
defb &CC,&00,&00,&33,&00,&22,&11,&22,&F0,&10
defb &80,&80,&00,&A0,&50,&00,&10,&20,&80,&80
defb &00,&A0,&50,&00,&10,&20,&80,&80,&44,&11
defb &88,&22,&00,&10,&40,&00,&00,&A0,&50,&00
defb &00,&10,&40,&00,&00,&A0,&50,&00,&F0,&20
defb &40,&90,&55,&44,&22,&AA,&90,&20,&40,&F0
defb &00,&A0,&50,&00,&00,&20,&80,&00,&00,&A0
defb &50,&00,&00,&20,&80,&00,&44,&11,&00,&00
defb &00,&11,&00,&88,&00,&00,&88,&22,&00,&10
defb &C0,&00,&00,&40,&20,&00,&00,&10,&C0,&00
defb &00,&40,&20,&00,&90,&20,&40,&F0,&44,&AA
defb &00,&CC,&00,&88,&11,&00,&33,&00,&55,&22
defb &F0,&20,&40,&90,&00,&40,&20,&00,&00,&30
defb &80,&00,&00,&40,&20,&00,&00,&30,&80,&00
defb &44,&11,&CC,&44,&00,&22,&00,&66,&00,&00
defb &00,&11,&00,&88,&00,&00,&66,&00,&44,&00
defb &22,&33,&00,&11,&88,&11,&88,&00,&00,&44
defb &11,&00,&88,&66,&00,&66,&66,&00,&66,&11
defb &00,&88,&22,&00,&CC,&88,&00,&99,&44,&11
defb &00,&11,&99,&00,&88,&00,&00,&11,&88,&00
defb &00,&FF,&FF,&00,&00,&11,&88,&00,&00,&00
defb &00,&11,&00,&99,&88,&00,&88,&22,&99,&00
defb &11,&33,&00,&44,&11,&00,&88,&00,&CC,&00
defb &44,&00,&00,&22,&00,&33,&00,&11,&00,&88
defb &22,&00
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








LooperContinueAddress:defw LooperContinue
Looper:
ld b,ixh
ld c,ixl
LD a,(bc)
INC bc
ld (Looper_CountB_Plus1-1),a
LD a,(bc)
INC bc
ld (Looper_CountSize_Plus1-1),a
ld (RestoreLooperAddress_Plus2-2),bc
LooperNextStage:
	ld hl,&0000 :RestoreLooperAddress_Plus2
	ld (Looper_Address_Plus2-2),hl
	ld a,0:Looper_CountB_Plus1
	ld (Looper_Count_Plus1-1),a
	LooperRepeat:
		ld hl,&0000 :Looper_Address_Plus2
		LD c,(hl)
		INC hl
		LD b,(hl)
		INC hl
		ld (Looper_Address_Plus2-2),hl
		ld h,b
		ld l,c
		ld ix,LooperContinueAddress
		jp (hl)
   LooperContinue:
		ld a,0:Looper_Count_Plus1
		dec a
		ld (Looper_Count_Plus1-1),a
	jp nz,LooperRepeat
	ld a,0:Looper_CountSize_Plus1
	dec a
	ld (Looper_CountSize_Plus1-1),a
jp nz,LooperNextStage
ld ix,(Looper_Address_Plus2-2)
LD L,(IX)
INC IX
LD H,(IX)
INC IX
list
JP (HL)
