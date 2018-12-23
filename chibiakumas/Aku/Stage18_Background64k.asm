;read "BootStrap.asm"


	ld (Background_CompiledSprite_Minus1+1),de
	call Akuyou_ScreenBuffer_GetActiveScreen
	ld h,a
	ld l,&50
	ld (StackRestore_Plus2-2),sp
	di
	ld sp,hl

PicStage18backsbmp:
LD IX,PicStage18backsbmp_DrawOrder
JP JumpToNextLine


PicStage18backsbmp_Line_0:
call BitmapPush6
defw BitmapData+5
LD DE,&0000
call MultiPushDe34
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_1:
jp MultiPushDeLast40


PicStage18backsbmp_Line_2:
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


PicStage18backsbmp_Line_3:
call MultiPushDe6
LD HL,&4400
  Push HL
LD BC,&CCFF
  Push BC
DEC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+11
LD DE,&8000
  PUSH DE
  PUSH DE
LD HL,&1122
  Push HL
LD BC,&4488
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
LD DE,&FFFF
call MultiPushDe6
LD HL,&FF33
  Push HL
LD BC,&0022
  Push BC
INC DE

jp MultiPushDeLast6


PicStage18backsbmp_Line_4:
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
call BitmapPush6
defw BitmapData+23
Ld D,&80
  PUSH DE
  PUSH DE
LD HL,&1122
  Push HL
LD BC,&4488
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
Ld E,&00
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


PicStage18backsbmp_Line_5:
call MultiPushDe6
LD HL,&0011
  Push HL
LD BC,&00F1
  Push BC
LD DE,&F0F0
call MultiPushDe6
call BitmapPush6
defw BitmapData+35
LD DE,&8000
  PUSH DE
  PUSH DE
LD HL,&1122
  Push HL
LD BC,&4488
  Push BC
LD DE,&0010
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+41
LD DE,&F0F0
call MultiPushDe6
LD HL,&F800
  Push HL
LD BC,&8800
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast6


PicStage18backsbmp_Line_6:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&22
  Push HL
Ld C,&E2
  Push BC
LD DE,&F0F0
call MultiPushDe6
call BitmapPush6
defw BitmapData+47
LD DE,&8000
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
defw BitmapData+53
LD DE,&F0F0
call MultiPushDe6
LD HL,&7400
  Push HL
LD BC,&4400
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&88
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_7:
call MultiPushDe6
LD HL,&0044
  Push HL
LD BC,&00C4
  Push BC
LD DE,&F0F0
call MultiPushDe6
call BitmapPush6
defw BitmapData+59
LD DE,&8000
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
defw BitmapData+65
LD DE,&F0F0
call MultiPushDe6
LD HL,&3200
  Push HL
LD BC,&2200
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast6


PicStage18backsbmp_Line_8:
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
defw BitmapData+71
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
defw BitmapData+77
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


PicStage18backsbmp_Line_9:
call MultiPushDe7
LD HL,&1100
  Push HL
LD BC,&F1F0
  Push BC
Call PushDE_F0F0x
call BitmapPush28
defw BitmapData+105
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F0F8
  Push HL
LD BC,&0088
  Push BC
Ld D,B
Ld E,B

jp MultiPushDeLast7


PicStage18backsbmp_Line_10:
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
Call PushDE_0000x
LD HL,&0033
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+125
  PUSH DE
LD BC,&CC00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&44
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_11:
call MultiPushDe7
Ld D,&44
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&CC00
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+145
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


PicStage18backsbmp_Line_12:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&88F0
  Push BC
Call PushDE_F0F0x
call BitmapPush30
defw BitmapData+175
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F011
  Push HL
LD BC,&0011
  Push BC
Call PushDE_0000x
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_13:
call MultiPushDe7
Ld E,&11
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+181
LD DE,&4422
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+195
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&88
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicStage18backsbmp_Line_14:
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
defw BitmapData+211
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


PicStage18backsbmp_Line_15:
call MultiPushDe7
LD HL,&0044
  Push HL
LD BC,&00C4
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+223
  PUSH DE
LD HL,&7466
  Push HL
LD BC,&66E2
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+235
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3200
  Push HL
LD BC,&2200
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast7


PicStage18backsbmp_Line_16:
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

Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
Ld C,&CC
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+251
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
LD BC,&00CC
  Push BC
  PUSH DE
  PUSH DE
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


PicStage18backsbmp_Line_17:
call MultiPushDe8
Ld D,&11
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+259
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+275
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


PicStage18backsbmp_Line_18:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
call BitmapPush8
defw BitmapData+283
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+299
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+307
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_19:
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
defw BitmapData+323
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


PicStage18backsbmp_Line_20:
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
defw BitmapData+335
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


PicStage18backsbmp_Line_21:
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
defw BitmapData+347
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


PicStage18backsbmp_Line_22:
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
defw BitmapData+357
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


PicStage18backsbmp_Line_23:
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
defw BitmapData+369
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


PicStage18backsbmp_Line_24:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe14
call BitmapPush12
defw BitmapData+381
call MultiPushDe14
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_25:
call MultiPushDe17
call BitmapPush12
defw BitmapData+393
jp MultiPushDeLast17


PicStage18backsbmp_Line_2_Reuse:
LD DE,&0000
JP PicStage18backsbmp_Line_2
PicStage18backsbmp_Line_1_Reuse:
LD DE,&0000
JP PicStage18backsbmp_Line_1
PicStage18backsbmp_Line_133:
call MultiPushDe30
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD DE,&0000
 jp NextLinePushDe3


PicStage18backsbmp_Line_134:
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
defw BitmapData+399
 jp NextLinePushDe1


PicStage18backsbmp_Line_135:
call MultiPushDe30
LD HL,&0010
  Push HL
call MultiPushDe5
LD BC,&0080
  Push BC
 jp NextLinePushDe3


PicStage18backsbmp_Line_134_Reuse:
LD DE,&0000
JP PicStage18backsbmp_Line_134
PicStage18backsbmp_Line_135_Reuse:
LD DE,&0000
JP PicStage18backsbmp_Line_135
PicStage18backsbmp_Line_168:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe12
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
Call PushDE_0000x
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD HL,&0010
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+399
 jp NextLinePushDe1


PicStage18backsbmp_Line_169:
call MultiPushDe12
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
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
Ld L,&10
  Push HL
call MultiPushDe5
LD BC,&0080
  Push BC
 jp NextLinePushDe3


PicStage18backsbmp_Line_170:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe8
LD HL,&FFFF
  Push HL
call MultiPushDe5
Ld C,&88
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
call MultiPushDe5
LD BC,&FFFF
  Push BC
  PUSH DE
LD HL,&0010
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+399
 jp NextLinePushDe1


PicStage18backsbmp_Line_171:
call MultiPushDe10
LD HL,&FFFF
  Push HL
call MultiPushDe6
LD BC,&0088
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
call MultiPushDe6
LD BC,&FFFF
  Push BC
LD HL,&0010
  Push HL
call MultiPushDe5
LD BC,&0080
  Push BC
 jp NextLinePushDe3


PicStage18backsbmp_Line_172:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe6
LD HL,&00FF
  Push HL
call MultiPushDe7
Ld C,&88
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
call MultiPushDe7
LD BC,&FF10
  Push BC
call MultiPushDe5
call BitmapPush6
defw BitmapData+399
 jp NextLinePushDe1


PicStage18backsbmp_Line_173:
call MultiPushDe9
LD HL,&FF00
  Push HL
call MultiPushDe5
DEC DE

  PUSH DE
  PUSH DE
LD BC,&3388
  Push BC
Call PushDE_0000x
LD HL,&11CC
  Push HL
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD BC,&00FF
  Push BC
LD DE,&F0F0
call MultiPushDe6
Ld D,B
Ld E,B

 jp NextLinePushDe3


PicStage18backsbmp_Line_174:
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
LD BC,&2288
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1144
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
LD BC,&3300
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_175:
call MultiPushDe8
LD HL,&CC33
  Push HL
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
INC DE

call MultiPushDe5
LD BC,&2288
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1144
  Push HL
call MultiPushDe5
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+413
INC DE

 jp NextLinePushDe3


PicStage18backsbmp_Line_176:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
call MultiPushDe5
call BitmapPush20
defw BitmapData+433
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+453
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_177:
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
LD HL,&7700
  Push HL

Ld E,L

call MultiPushDe7
LD BC,&2288
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1144
  Push HL
call MultiPushDe7
call BitmapPush14
defw BitmapData+467
 jp NextLinePushDe3


PicStage18backsbmp_Line_178:
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
defw BitmapData+485
Call PushDE_0000x
call BitmapPush18
defw BitmapData+503
Ld D,&CC
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_179:
call MultiPushDe7
LD HL,&EE00
  Push HL
LD BC,&CC00
  Push BC
call MultiPushDe8
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1144
  Push BC
call MultiPushDe8
call BitmapPush10
defw BitmapData+513
 jp NextLinePushDe4


PicStage18backsbmp_Line_180:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+537
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+561
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_181:
call MultiPushDe6
LD HL,&0033
  Push HL
LD BC,&00CC
  Push BC
call MultiPushDe9
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1144
  Push BC
call MultiPushDe9
call BitmapPush8
defw BitmapData+569
 jp NextLinePushDe4


PicStage18backsbmp_Line_182:
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
defw BitmapData+587
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+605
  PUSH DE
LD HL,&CC33
  Push HL
LD BC,&0077
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_183:
call MultiPushDe6
LD HL,&1100
  Push HL
LD BC,&3300
  Push BC
call MultiPushDe9
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1144
  Push BC
call MultiPushDe9
call BitmapPush8
defw BitmapData+613
 jp NextLinePushDe4


PicStage18backsbmp_Line_184:
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
defw BitmapData+635
Call PushDE_0000x
call BitmapPush22
defw BitmapData+657
Ld D,&33
  PUSH DE
  PUSH DE
Ld D,E
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_185:
call MultiPushDe5
LD HL,&0033
  Push HL
LD BC,&0077
  Push BC
call MultiPushDe10
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1144
  Push BC
call MultiPushDe10
call BitmapPush6
defw BitmapData+663
 jp NextLinePushDe4


PicStage18backsbmp_Line_186:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+689
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+715
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_187:
call MultiPushDe5
LD HL,&6600
  Push HL
LD BC,&6644
  Push BC
call MultiPushDe10
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&11
  Push BC
call MultiPushDe10
call BitmapPush6
defw BitmapData+721
 jp NextLinePushDe4


PicStage18backsbmp_Line_188:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+747
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+773
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
LD BC,&1100
  Push BC
 jp NextLinePushDe1


PicStage18backsbmp_Line_189:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+779
call MultiPushDe10
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1144
  Push BC
call MultiPushDe10
call BitmapPush6
defw BitmapData+785
 jp NextLinePushDe4


PicStage18backsbmp_Line_190:
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
defw BitmapData+809
Call PushDE_0000x
call BitmapPush24
defw BitmapData+833
Ld D,&CC
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+841


PicStage18backsbmp_Line_191:
Call PushDE_0000x
call BitmapPush6
defw BitmapData+847
call MultiPushDe10
LD HL,&2288
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1144
  Push BC
call MultiPushDe10
call BitmapPush6
defw BitmapData+853
 jp NextLinePushDe4


PicStage18backsbmp_Line_192:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+859
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
defw BitmapData+873


PicStage18backsbmp_Line_193:
INC DE

jp MultiPushDeLast40


PicStage18backsbmp_Line_198:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&CC
  Push HL
DEC DE

call MultiPushDe9
LD BC,&FF00
  Push BC
INC DE

call MultiPushDe6
Ld H,E
Ld L,B

  Push HL
DEC DE

call MultiPushDe9
Ld B,&33
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1



PicStage18backsbmp_DrawOrder: 

  DEFW PicStage18backsbmp_Line_0
  DEFW PicStage18backsbmp_Line_1
  DEFW PicStage18backsbmp_Line_2
  DEFW PicStage18backsbmp_Line_3
  DEFW PicStage18backsbmp_Line_4
  DEFW PicStage18backsbmp_Line_5
  DEFW PicStage18backsbmp_Line_6
  DEFW PicStage18backsbmp_Line_7
  DEFW PicStage18backsbmp_Line_8
  DEFW PicStage18backsbmp_Line_9
  DEFW PicStage18backsbmp_Line_10
  DEFW PicStage18backsbmp_Line_11
  DEFW PicStage18backsbmp_Line_12
  DEFW PicStage18backsbmp_Line_13
  DEFW PicStage18backsbmp_Line_14
  DEFW PicStage18backsbmp_Line_15
  DEFW PicStage18backsbmp_Line_16
  DEFW PicStage18backsbmp_Line_17
  DEFW PicStage18backsbmp_Line_18
  DEFW PicStage18backsbmp_Line_19
  DEFW PicStage18backsbmp_Line_20
  DEFW PicStage18backsbmp_Line_21
  DEFW PicStage18backsbmp_Line_22
  DEFW PicStage18backsbmp_Line_23
  DEFW PicStage18backsbmp_Line_24
  DEFW PicStage18backsbmp_Line_25
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_133
  DEFW PicStage18backsbmp_Line_134
  DEFW PicStage18backsbmp_Line_135
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_134_Reuse
  DEFW PicStage18backsbmp_Line_135_Reuse
  DEFW PicStage18backsbmp_Line_168
  DEFW PicStage18backsbmp_Line_169
  DEFW PicStage18backsbmp_Line_170
  DEFW PicStage18backsbmp_Line_171
  DEFW PicStage18backsbmp_Line_172
  DEFW PicStage18backsbmp_Line_173
  DEFW PicStage18backsbmp_Line_174
  DEFW PicStage18backsbmp_Line_175
  DEFW PicStage18backsbmp_Line_176
  DEFW PicStage18backsbmp_Line_177
  DEFW PicStage18backsbmp_Line_178
  DEFW PicStage18backsbmp_Line_179
  DEFW PicStage18backsbmp_Line_180
  DEFW PicStage18backsbmp_Line_181
  DEFW PicStage18backsbmp_Line_182
  DEFW PicStage18backsbmp_Line_183
  DEFW PicStage18backsbmp_Line_184
  DEFW PicStage18backsbmp_Line_185
  DEFW PicStage18backsbmp_Line_186
  DEFW PicStage18backsbmp_Line_187
  DEFW PicStage18backsbmp_Line_188
  DEFW PicStage18backsbmp_Line_189
  DEFW PicStage18backsbmp_Line_190
  DEFW PicStage18backsbmp_Line_191
  DEFW PicStage18backsbmp_Line_192
  DEFW PicStage18backsbmp_Line_193
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_2_Reuse
  DEFW PicStage18backsbmp_Line_1_Reuse
  DEFW PicStage18backsbmp_Line_198
  DEFW PicStage18backsbmp_Line_1_Reuse
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
MultiPushDe30: pop HL
jr MultiPushDe30B 
MultiPushDe27: pop HL
jr MultiPushDe27B 
MultiPushDeLast17: ld HL,NextLine
jr MultiPushDe17B 
MultiPushDe17: pop HL
jr MultiPushDe17B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
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

defb &11,&00,&88,&00,&00,&00,&40,&40,&44,&00
defb &88,&33,&CC,&11,&00,&22,&20,&20,&40,&40
defb &88,&11,&00,&44,&22,&00,&88,&11,&20,&20
defb &40,&51,&00,&22,&00,&F8,&F1,&00,&44,&00
defb &A8,&20,&40,&62,&00,&44,&11,&F0,&F0,&88
defb &22,&00,&64,&20,&40,&44,&00,&88,&00,&FC
defb &F3,&00,&11,&00,&22,&20,&40,&88,&11,&00
defb &00,&33,&CC,&00,&00,&88,&11,&20,&F0,&F3
defb &00,&00,&00,&CC,&00,&A8,&10,&F0,&F0,&00
defb &44,&44,&22,&22,&00,&F0,&F0,&80,&51,&00
defb &33,&00,&00,&00,&FC,&F0,&33,&22,&00,&64
defb &00,&40,&40,&00,&44,&44,&22,&22,&00,&20
defb &20,&00,&62,&00,&44,&CC,&CC,&11,&00,&22
defb &00,&40,&40,&00,&44,&44,&22,&22,&00,&20
defb &20,&00,&44,&00,&88,&33,&F0,&E0,&CC,&00
defb &00,&33,&00,&00,&88,&11,&00,&40,&40,&00
defb &44,&44,&22,&22,&00,&20,&20,&00,&88,&11
defb &00,&00,&CC,&00,&00,&33,&00,&20,&20,&11
defb &00,&22,&00,&33,&00,&00,&00,&CC,&00,&00
defb &44,&00,&88,&40,&40,&00,&22,&00,&44,&40
defb &40,&70,&E2,&44,&22,&74,&E0,&20,&20,&22
defb &00,&44,&F0,&C4,&00,&88,&00,&00,&00,&33
defb &00,&00,&00,&FC,&F3,&00,&00,&00,&CC,&00
defb &00,&00,&11,&00,&32,&F0,&00,&88,&11,&F0
defb &F0,&F0,&E2,&22,&44,&74,&F0,&F0,&F0,&88
defb &11,&00,&33,&00,&00,&00,&CC,&00,&00,&00
defb &00,&44,&00,&F8,&F0,&F0,&F3,&22,&44,&F8
defb &F0,&F0,&F1,&00,&22,&00,&33,&FF,&FF,&FF
defb &FF,&EE,&00,&22,&00,&22,&00,&44,&40,&70
defb &F1,&22,&44,&F8,&E0,&20,&22,&00,&44,&00
defb &44,&00,&77,&FF,&FF,&FF,&FF,&CC,&00,&11
defb &00,&22,&40,&00,&11,&22,&44,&88,&00,&20
defb &44,&00,&88,&00,&88,&11,&40,&00,&00,&AA
defb &55,&00,&00,&20,&88,&11,&44,&00,&A8,&A0
defb &A0,&AA,&55,&50,&50,&51,&00,&22,&74,&F0
defb &F0,&AA,&55,&F0,&F0,&E2,&00,&44,&11,&00
defb &32,&F0,&F0,&E6,&76,&F0,&F0,&C4,&00,&88
defb &00,&88,&11,&50,&50,&66,&66,&A0,&A0,&88
defb &11,&00,&00,&77,&FF,&88,&00,&66,&66,&00
defb &11,&FF,&EE,&00,&00,&11,&00,&88,&80,&00
defb &00,&30,&F0,&80,&00,&40,&80,&10,&40,&20
defb &B3,&CC,&00,&00,&88,&22,&00,&30,&80,&00
defb &00,&40,&20,&00,&00,&30,&80,&00,&00,&40
defb &FF,&88,&00,&33,&CC,&00,&11,&FF,&20,&00
defb &00,&10,&C0,&00,&00,&40,&20,&00,&00,&10
defb &C0,&00,&44,&11,&00,&10,&10,&00,&00,&40
defb &80,&10,&40,&33,&00,&33,&EE,&00,&88,&22
defb &10,&20,&80,&80,&00,&A0,&50,&00,&10,&20
defb &80,&80,&00,&A0,&50,&00,&00,&A0,&50,&00
defb &10,&10,&40,&80,&00,&A0,&50,&00,&10,&10
defb &40,&80,&44,&11,&80,&80,&00,&80,&40,&10
defb &77,&00,&33,&00,&88,&22,&10,&40,&20,&80
defb &60,&40,&20,&60,&10,&40,&20,&80,&60,&40
defb &20,&60,&00,&33,&00,&11,&CC,&00,&00,&33
defb &88,&00,&CC,&00,&60,&40,&20,&60,&10,&40
defb &20,&80,&60,&40,&20,&60,&10,&40,&20,&80
defb &44,&11,&40,&00,&80,&80,&40,&CC,&00,&33
defb &88,&22,&10,&10,&80,&F0,&70,&10,&80,&E0
defb &10,&10,&80,&F0,&70,&10,&80,&E0,&70,&10
defb &80,&E0,&F0,&10,&80,&80,&70,&10,&80,&E0
defb &F0,&10,&80,&80,&44,&11,&10,&80,&40,&80
defb &88,&00,&CC,&00,&88,&22,&90,&20,&40,&F0
defb &10,&20,&40,&80,&90,&20,&40,&F0,&10,&20
defb &40,&80,&00,&20,&80,&00,&00,&10,&40,&00
defb &10,&20,&40,&80,&F0,&20,&40,&90,&10,&20
defb &40,&80,&F0,&20,&40,&90,&44,&11,&00,&10
defb &20,&CC,&00,&EE,&88,&22,&00,&80,&10,&00
defb &90,&80,&10,&90,&00,&80,&10,&00,&90,&80
defb &10,&90,&20,&B0,&D0,&40,&55,&CC,&00,&88
defb &11,&00,&33,&AA,&20,&B0,&D0,&40,&90,&80
defb &10,&90,&00,&80,&10,&00,&90,&80,&10,&90
defb &00,&80,&10,&00,&44,&11,&00,&10,&66,&00
defb &66,&22,&88,&22,&20,&B0,&D0,&40,&00,&70
defb &E0,&00,&20,&B0,&D0,&40,&00,&70,&E0,&00
defb &00,&80,&10,&00,&44,&11,&88,&11,&88,&11
defb &88,&22,&00,&80,&10,&00,&00,&70,&E0,&00
defb &20,&B0,&D0,&40,&00,&70,&E0,&00,&20,&B0
defb &D0,&40,&44,&11,&44,&88,&44,&00,&CC,&00
defb &00,&33,&00,&22,&11,&22,&88,&22,&00,&10
defb &40,&00,&00,&A0,&50,&00,&00,&10,&40,&00
defb &00,&A0,&50,&00,&F0,&20,&40,&90,&55,&44
defb &22,&AA,&90,&20,&40,&F0,&00,&A0,&50,&00
defb &00,&20,&80,&00,&00,&A0,&50,&00,&00,&20
defb &80,&00,&44,&11,&00,&00,&00,&11,&00,&88
defb &00,&00,&44,&AA,&00,&CC,&00,&88,&11,&00
defb &33,&00,&55,&22,&CC,&44,&00,&22,&00,&66
defb &00,&00,&00,&11,&00,&88,&00,&00,&66,&00
defb &44,&00,&22,&33
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

