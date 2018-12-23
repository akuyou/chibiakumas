read "..\CoreDefs.asm" ;read "BootStrap.asm"
org &4000
jp PicWingsComplete6bmp
jp PicWingsComplete6bbmp

PicWingsComplete6bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete6bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete6bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicWingsComplete6bmp_Line_1:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Ld D,L
Ld E,L

call MultiPushDe16
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_5:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+5
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+11
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_7:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Call PushDE_0000x
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_9:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
Ld B,E


  Push BC
Call PushDE_0000x
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_11:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Call PushDE_0000x
LD BC,&4010
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&50
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_13:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld B,&00
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
Call PushDE_0000x
LD HL,&4010
  Push HL

Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_15:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
Call PushDE_0000x
Ld C,&10
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&50
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_17:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
Ld C,&00
  Push BC
Call PushDE_0000x
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_23:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
Call PushDE_0000x
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD DE,&0000
call MultiPushDe5
LD BC,&5050
  Push BC
LD HL,&0040
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_25:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  Push HL 
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld D,H
Ld E,H

call MultiPushDe7
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+23
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bmp_Line_27:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&5010
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+35
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bmp_Line_29:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+41
call MultiPushDe8
LD HL,&5010
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bmp_Line_31:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+47
call MultiPushDe8
call BitmapPush6
defw BitmapData+47
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_33:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld B,L


  Push BC
call MultiPushDe8
LD HL,&5010
  Push HL
Ld C,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_35:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
LD BC,&0000
  Push BC
call MultiPushDe8
LD HL,&1000
  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_37:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
LD BC,&0040
  Push BC
call MultiPushDe6
Ld H,E
Ld L,B

  Push HL

Ld C,L

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_39:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+53
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+59
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_41:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,L

  Push BC

Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_43:
  PUSH DE
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
Ld L,&50
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+67
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
Ld L,&50
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
LD HL,&5000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicWingsComplete6bmp_Line_46:
jp MultiPushDeLast40


PicWingsComplete6bmp_Line_47:
call MultiPushDe6
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld C,&50
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&40
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld D,B
Ld E,B

jp MultiPushDeLast6


PicWingsComplete6bmp_Line_46_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_46
PicWingsComplete6bmp_Line_49:
call MultiPushDe7
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld C,&50
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&40
  Push BC
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld D,B
Ld E,B

jp MultiPushDeLast7


PicWingsComplete6bmp_Line_51:
call MultiPushDe11
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld C,&50
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast11


PicWingsComplete6bmp_Line_53:
call MultiPushDe13
LD HL,&0040
  Push HL
LD BC,&5050
  Push BC
  PUSH DE
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld B,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

jp MultiPushDeLast13


PicWingsComplete6bmp_Line_56:
call MultiPushDe8
LD HL,&8800
  Push HL
call MultiPushDe22
LD BC,&0044
  Push BC
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_56_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_56
PicWingsComplete6bmp_Line_58:
call MultiPushDe7
call BitmapPush6
defw BitmapData+73
call MultiPushDe20
call BitmapPush6
defw BitmapData+79
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_59:
call MultiPushDe7
call BitmapPush6
defw BitmapData+85
  PUSH DE
LD HL,&0088
  Push HL
call MultiPushDe16
LD BC,&4400
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1144
  Push HL
Ld B,&88
  Push BC
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_60:
call MultiPushDe7
call BitmapPush6
defw BitmapData+91
  PUSH DE
LD HL,&0088
  Push HL
call MultiPushDe16
LD BC,&4400
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1144
  Push HL
  Push BC
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_61:
call MultiPushDe7
call BitmapPush6
defw BitmapData+97
  PUSH DE
LD HL,&4488
  Push HL
Ld B,E
Ld C,H

  Push BC
call MultiPushDe14
LD HL,&8800
  Push HL
LD BC,&4488
  Push BC
  PUSH DE
  PUSH DE
LD HL,&2244
  Push HL

Ld C,E

  Push BC
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_62:
call MultiPushDe7
call BitmapPush6
defw BitmapData+103
  PUSH DE
LD HL,&4488
  Push HL
LD BC,&0022
  Push BC
  PUSH DE
  PUSH DE
Ld L,&00
  Push HL
call MultiPushDe8
Ld C,&88
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
Ld B,&44
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+111
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_63:
call MultiPushDe7
call BitmapPush6
defw BitmapData+117
  PUSH DE
LD HL,&8888
  Push HL
LD BC,&0022
  Push BC
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
call MultiPushDe8
Ld C,&88
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
LD BC,&4444
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+123
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_64:
call MultiPushDe7
call BitmapPush6
defw BitmapData+129
  PUSH DE
LD HL,&8888
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+135
call MultiPushDe7
LD HL,&1188
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
LD HL,&0022
  Push HL
LD BC,&4444
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+141
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_65:
call MultiPushDe6
call BitmapPush22
defw BitmapData+163
call MultiPushDe7
call BitmapPush20
defw BitmapData+183
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_66:
call MultiPushDe6
call BitmapPush22
defw BitmapData+205
call MultiPushDe7
LD HL,&2288
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+219
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_67:
call MultiPushDe7
call BitmapPush18
defw BitmapData+237
call MultiPushDe8
LD HL,&4488
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+251
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_68:
call MultiPushDe7
call BitmapPush12
defw BitmapData+263
  PUSH DE
call BitmapPush6
defw BitmapData+269
call MultiPushDe6
call BitmapPush20
defw BitmapData+289
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_69:
call MultiPushDe8
call BitmapPush20
defw BitmapData+309
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+329
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_70:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+335
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC33
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+351
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+367
  PUSH DE
LD BC,&00FF
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+373
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_71:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+393
Call PushDE_0000x
call BitmapPush22
defw BitmapData+415
DEC DE

  PUSH DE
  PUSH DE
LD BC,&FF33
  Push BC
Call PushDE_0000x
jp NextLine


PicWingsComplete6bmp_Line_72:
call MultiPushDe6
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+435
Call PushDE_0000x
call BitmapPush14
defw BitmapData+449
  PUSH DE
call BitmapPush10
defw BitmapData+459
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_73:
call MultiPushDe8
call BitmapPush10
defw BitmapData+469
  PUSH DE
call BitmapPush8
defw BitmapData+477
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&8811
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+493
LD DE,&0000
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_74:
call MultiPushDe6
call BitmapPush14
defw BitmapData+507
  PUSH DE
call BitmapPush8
defw BitmapData+515
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+523
  PUSH DE
call BitmapPush14
defw BitmapData+537
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_75:
call MultiPushDe5
call BitmapPush10
defw BitmapData+547
  PUSH DE
call BitmapPush6
defw BitmapData+553
  PUSH DE
call BitmapPush8
defw BitmapData+561
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+567
  PUSH DE
call BitmapPush18
defw BitmapData+585
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_76:
call MultiPushDe5
call BitmapPush22
defw BitmapData+607
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7700
  Push HL
  PUSH DE
call BitmapPush22
defw BitmapData+629
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_77:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+639
LD DE,&DD11
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+655
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
call BitmapPush24
defw BitmapData+679
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_78:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+689
LD DE,&3322
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+705
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+715
  PUSH DE
call BitmapPush14
defw BitmapData+729
  PUSH DE
LD HL,&EE77
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+741
LD DE,&BB33
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+757
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+775
LD DE,&3377
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+787
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_80:
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8877
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+795
LD DE,&BB33
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+825
call BitmapPush8
defw BitmapData+833
LD DE,&3377
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+843
LD DE,&0000
 jp NextLinePushDe3


PicWingsComplete6bmp_Line_81:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+873
call BitmapPush24
defw BitmapData+897
LD DE,&3366
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+909
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_82:
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+915
LD DE,&BB11
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+945
call BitmapPush8
defw BitmapData+953
LD DE,&3366
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+959
LD DE,&0000
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_83:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+969
LD DE,&BB99
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+999
call BitmapPush26
defw BitmapData+1025
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_84:
LD DE,&0000
call MultiPushDe5
call BitmapPush30
defw BitmapData+1055
call BitmapPush28
defw BitmapData+1083
  PUSH DE
LD HL,&3300
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_85:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1113
call BitmapPush30
defw BitmapData+1143
LD HL,&9822
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1149
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_86:
Call PushDE_0000x
LD HL,&0033
  Push HL
  PUSH DE
call BitmapPush30
defw BitmapData+1179
call BitmapPush26
defw BitmapData+1205
  PUSH DE
LD BC,&0033
  Push BC
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_87:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&CC00
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+1235
call BitmapPush30
defw BitmapData+1265
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_88:
Call PushDE_0000x
LD HL,&3300
  Push HL
  PUSH DE
call BitmapPush30
defw BitmapData+1295
call BitmapPush28
defw BitmapData+1323
  PUSH DE
LD BC,&3300
  Push BC
 jp NextLinePushDe3


PicWingsComplete6bmp_Line_89:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1353
call BitmapPush24
defw BitmapData+1377
LD DE,&DD88
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1389
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_90:
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+1395
LD DE,&66CC
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1413
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1431
LD DE,&DD88
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1437
LD DE,&0000
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_91:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1467
call BitmapPush24
defw BitmapData+1491
LD DE,&DD88
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1503
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_92:
LD DE,&0000
call MultiPushDe5
LD HL,&0066
  Push HL
  PUSH DE
call BitmapPush26
defw BitmapData+1529
  PUSH DE
call BitmapPush20
defw BitmapData+1549
Ld D,&DD
  PUSH DE
  PUSH DE
LD BC,&2200
  Push BC
LD HL,&8811
  Push HL
Ld D,C


jp MultiPushDeLast5


PicWingsComplete6bmp_Line_93:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1579
call BitmapPush26
defw BitmapData+1605
LD DE,&DD40
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1615
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_94:
LD DE,&0000
call MultiPushDe5
call BitmapPush28
defw BitmapData+1643
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1663
Ld D,&BB
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,L


jp MultiPushDeLast5


PicWingsComplete6bmp_Line_95:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1693
call BitmapPush30
defw BitmapData+1723
call BitmapPush10
defw BitmapData+1733
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_96:
LD DE,&0000
call MultiPushDe5
LD HL,&2200
  Push HL
Ld E,&44
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+1755
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1781
  PUSH DE
LD BC,&1100
  Push BC
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_97:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1811
call BitmapPush30
defw BitmapData+1841
LD HL,&9840
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1847
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_98:
LD DE,&0000
call MultiPushDe6
call BitmapPush26
defw BitmapData+1873
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1899
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_99:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+1929
call BitmapPush20
defw BitmapData+1949
LD DE,&AA40
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1959
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_100:
LD DE,&0000
call MultiPushDe6
call BitmapPush26
defw BitmapData+1985
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2005
Ld D,&AA
  PUSH DE
  PUSH DE
LD HL,&0022
  Push HL
Ld D,H


jp MultiPushDeLast6


PicWingsComplete6bmp_Line_101:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+2035
call BitmapPush26
defw BitmapData+2061
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_102:
LD DE,&0000
call MultiPushDe6
call BitmapPush26
defw BitmapData+2087
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2113
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_103:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+2143
call BitmapPush20
defw BitmapData+2163
LD DE,&CC40
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2173
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_104:
LD DE,&0000
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2193
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2213
Ld D,&CC
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_105:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2243
call BitmapPush22
defw BitmapData+2265
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_106:
LD DE,&0000
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
LD HL,&0055
  Push HL
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+2279
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2297
Ld D,&CC
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_107:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2325
  PUSH DE
call BitmapPush22
defw BitmapData+2347
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_108:
LD DE,&0000
call MultiPushDe7
Ld E,&44
  PUSH DE
  PUSH DE
LD HL,&0055
  Push HL
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+2361
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2379
Ld D,&88
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_109:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
Ld E,&54
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2409
call BitmapPush18
defw BitmapData+2427
Ld E,&50
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_110:
LD DE,&0000
call MultiPushDe7
Ld E,&44
  PUSH DE
  PUSH DE
LD HL,&0033
  Push HL
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+2439
Call PushDE_0000x
call BitmapPush18
defw BitmapData+2457
Ld D,&88
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_111:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
Ld E,&54
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2487
call BitmapPush18
defw BitmapData+2505
Ld E,&50
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_112:
LD DE,&0000
call MultiPushDe8
call BitmapPush20
defw BitmapData+2525
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2545
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_113:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2565
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2585
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_114:
LD DE,&0000
call MultiPushDe8
call BitmapPush20
defw BitmapData+2605
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2625
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_115:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2645
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2665
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_116:
LD DE,&0000
call MultiPushDe9
call BitmapPush18
defw BitmapData+2683
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2701
jp MultiPushDeLast9


PicWingsComplete6bmp_Line_117:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2719
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2739
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_118:
LD DE,&0000
call MultiPushDe9
call BitmapPush18
defw BitmapData+2757
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2775
jp MultiPushDeLast9


PicWingsComplete6bmp_Line_119:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2793
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2813
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_120:
LD DE,&0000
call MultiPushDe10
call BitmapPush16
defw BitmapData+2829
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2845
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_121:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2863
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2883
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_122:
LD DE,&0000
call MultiPushDe10
call BitmapPush12
defw BitmapData+2895
  PUSH DE
LD HL,&5500
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2911
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_123:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
call MultiPushDe5
call BitmapPush12
defw BitmapData+2923
  PUSH DE
LD HL,&5550
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2939
call MultiPushDe5
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_124:
LD DE,&0000
call MultiPushDe10
call BitmapPush12
defw BitmapData+2951
  PUSH DE
LD HL,&5500
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2967
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_125:
LD DE,&5050
call MultiPushDe10
call BitmapPush12
defw BitmapData+2979
  PUSH DE
LD HL,&6650
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+2995
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_126:
LD DE,&0000
call MultiPushDe10
LD HL,&0044
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+3003
  PUSH DE
LD BC,&6600
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3009
LD DE,&1188
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3015
LD DE,&0000
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_127:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3027
  PUSH DE
LD HL,&6650
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3033
LD DE,&5198
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3039
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_128:
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+3047
  PUSH DE
LD HL,&6600
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3057
  PUSH DE
LD BC,&2200
  Push BC
jp MultiPushDeLast11


PicWingsComplete6bmp_Line_129:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3069
  PUSH DE
LD HL,&6650
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+3085
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_131:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld D,&40
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3099
call BitmapPush14
defw BitmapData+3113
  PUSH DE
LD HL,&0010
  Push HL
Ld B,H
Ld C,D

  Push BC
Ld D,E
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_132:
LD DE,&0000
call MultiPushDe13
call BitmapPush6
defw BitmapData+3119
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3125
jp MultiPushDeLast13


PicWingsComplete6bmp_Line_133:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3131
  PUSH DE
LD BC,&5450
  Push BC
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L


  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+3147
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bmp_Line_134:
LD DE,&0000
call MultiPushDe14
LD HL,&4400
  Push HL
LD BC,&8811
  Push BC
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
  PUSH DE
LD BC,&0066
  Push BC
  Push HL 
jp MultiPushDeLast14


PicWingsComplete6bmp_Line_135:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
LD BC,&5450
  Push BC
LD HL,&8811
  Push HL
  PUSH DE
  Push BC
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+3157
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_135_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_135
PicWingsComplete6bmp_Line_138:
LD DE,&0000
call MultiPushDe14
LD HL,&4400
  Push HL
LD BC,&8811
  Push BC
call MultiPushDe8
LD HL,&0066
  Push HL
LD BC,&0088
  Push BC
jp MultiPushDeLast14


PicWingsComplete6bmp_Line_139:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
Ld C,&50
  Push BC
LD HL,&0011
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC

Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3163
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_140:
LD DE,&0000
call MultiPushDe15
LD HL,&0011
  Push HL
call MultiPushDe8
LD BC,&0022
  Push BC
jp MultiPushDeLast15


PicWingsComplete6bmp_Line_141:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1022
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_141_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_141
PicWingsComplete6bmp_Line_145:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,C

  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_145_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_145
PicWingsComplete6bmp_Line_151:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,C
Ld E,C

call MultiPushDe8
LD BC,&0050
  Push BC
LD HL,&1000
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_153:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3169
LD DE,&0000
call MultiPushDe15
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_155:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld D,H
Ld E,H

call MultiPushDe18
LD HL,&0040
  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete6bmp_Line_157:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3175
LD DE,&0000
call MultiPushDe24
call BitmapPush6
defw BitmapData+3181
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_159:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe28
LD HL,&0040
  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H


 jp NextLinePushBC 


PicWingsComplete6bmp_Line_161:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe31
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicWingsComplete6bmp_Line_163:
  PUSH DE
LD HL,&4050
  Push HL
LD BC,&5010
  Push BC
call MultiPushDe14
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD DE,&0000
call MultiPushDe14
LD BC,&4050
  Push BC
Ld H,C
Ld L,C

  Push HL
 jp NextLinePushDe1


PicWingsComplete6bmp_Line_165:
  PUSH DE
LD HL,&4050
  Push HL
call MultiPushDe14
LD BC,&4050
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&5010
  Push HL
LD DE,&0000
call MultiPushDe14
  Push BC
 jp NextLinePushDe1


PicWingsComplete6bmp_Line_167:
call MultiPushDe16
LD DE,&5050
call MultiPushDe8
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast15


PicWingsComplete6bmp_Line_169:
call MultiPushDe8
LD HL,&0040
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe5
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&5010
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+3187
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_171:
call MultiPushDe8
call BitmapPush8
defw BitmapData+3195
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe10
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3203
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_173:
call MultiPushDe8
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,L
Ld E,L

call MultiPushDe10
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&4050
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

jp MultiPushDeLast8


PicWingsComplete6bmp_Line_175:
call MultiPushDe10
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe19
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast9


PicWingsComplete6bmp_Line_175_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_175
PicWingsComplete6bmp_Line_179:
call MultiPushDe7
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe24
LD BC,&5010
  Push BC
LD DE,&0000
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_181:
call MultiPushDe5
LD HL,&0040
  Push HL
LD DE,&5050
call MultiPushDe8
LD BC,&5010
  Push BC
LD HL,&1000
  Push HL
call MultiPushDe8
LD BC,&0040
  Push BC
call MultiPushDe9
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicWingsComplete6bmp_Line_183:
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe11
Ld E,&10
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
Ld E,&50
call MultiPushDe6
LD BC,&1000
  Push BC
Ld D,&00
  PUSH DE
  PUSH DE
Ld D,E
call MultiPushDe11
Ld D,C
Ld E,C

 jp NextLinePushDe3


PicWingsComplete6bmp_Line_185:
  PUSH DE
  PUSH DE
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&5000
  Push BC
  PUSH DE
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
Ld C,&10
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3209
LD DE,&5050
call MultiPushDe11
LD HL,&5000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete6bmp_Line_187:
  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&5000
  Push BC
  PUSH DE
  PUSH DE
  Push BC
Call PushDE_0000x
LD HL,&0040
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD BC,&1040
  Push BC
call MultiPushDe12
LD DE,&0000
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_189:
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe12
LD HL,&5040
  Push HL
call MultiPushDe10
LD BC,&1040
  Push BC
call MultiPushDe12
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_191:
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe36
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 



PicWingsComplete6bmp_DrawOrder: 

  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_5
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_7
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_9
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_11
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_13
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_15
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_17
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_23
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_25
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_27
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_29
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_31
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_33
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_35
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_37
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_39
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_41
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_43
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_45
  DEFW PicWingsComplete6bmp_Line_46
  DEFW PicWingsComplete6bmp_Line_47
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_49
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_51
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_53
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_56
  DEFW PicWingsComplete6bmp_Line_56_Reuse
  DEFW PicWingsComplete6bmp_Line_58
  DEFW PicWingsComplete6bmp_Line_59
  DEFW PicWingsComplete6bmp_Line_60
  DEFW PicWingsComplete6bmp_Line_61
  DEFW PicWingsComplete6bmp_Line_62
  DEFW PicWingsComplete6bmp_Line_63
  DEFW PicWingsComplete6bmp_Line_64
  DEFW PicWingsComplete6bmp_Line_65
  DEFW PicWingsComplete6bmp_Line_66
  DEFW PicWingsComplete6bmp_Line_67
  DEFW PicWingsComplete6bmp_Line_68
  DEFW PicWingsComplete6bmp_Line_69
  DEFW PicWingsComplete6bmp_Line_70
  DEFW PicWingsComplete6bmp_Line_71
  DEFW PicWingsComplete6bmp_Line_72
  DEFW PicWingsComplete6bmp_Line_73
  DEFW PicWingsComplete6bmp_Line_74
  DEFW PicWingsComplete6bmp_Line_75
  DEFW PicWingsComplete6bmp_Line_76
  DEFW PicWingsComplete6bmp_Line_77
  DEFW PicWingsComplete6bmp_Line_78
  DEFW PicWingsComplete6bmp_Line_79
  DEFW PicWingsComplete6bmp_Line_80
  DEFW PicWingsComplete6bmp_Line_81
  DEFW PicWingsComplete6bmp_Line_82
  DEFW PicWingsComplete6bmp_Line_83
  DEFW PicWingsComplete6bmp_Line_84
  DEFW PicWingsComplete6bmp_Line_85
  DEFW PicWingsComplete6bmp_Line_86
  DEFW PicWingsComplete6bmp_Line_87
  DEFW PicWingsComplete6bmp_Line_88
  DEFW PicWingsComplete6bmp_Line_89
  DEFW PicWingsComplete6bmp_Line_90
  DEFW PicWingsComplete6bmp_Line_91
  DEFW PicWingsComplete6bmp_Line_92
  DEFW PicWingsComplete6bmp_Line_93
  DEFW PicWingsComplete6bmp_Line_94
  DEFW PicWingsComplete6bmp_Line_95
  DEFW PicWingsComplete6bmp_Line_96
  DEFW PicWingsComplete6bmp_Line_97
  DEFW PicWingsComplete6bmp_Line_98
  DEFW PicWingsComplete6bmp_Line_99
  DEFW PicWingsComplete6bmp_Line_100
  DEFW PicWingsComplete6bmp_Line_101
  DEFW PicWingsComplete6bmp_Line_102
  DEFW PicWingsComplete6bmp_Line_103
  DEFW PicWingsComplete6bmp_Line_104
  DEFW PicWingsComplete6bmp_Line_105
  DEFW PicWingsComplete6bmp_Line_106
  DEFW PicWingsComplete6bmp_Line_107
  DEFW PicWingsComplete6bmp_Line_108
  DEFW PicWingsComplete6bmp_Line_109
  DEFW PicWingsComplete6bmp_Line_110
  DEFW PicWingsComplete6bmp_Line_111
  DEFW PicWingsComplete6bmp_Line_112
  DEFW PicWingsComplete6bmp_Line_113
  DEFW PicWingsComplete6bmp_Line_114
  DEFW PicWingsComplete6bmp_Line_115
  DEFW PicWingsComplete6bmp_Line_116
  DEFW PicWingsComplete6bmp_Line_117
  DEFW PicWingsComplete6bmp_Line_118
  DEFW PicWingsComplete6bmp_Line_119
  DEFW PicWingsComplete6bmp_Line_120
  DEFW PicWingsComplete6bmp_Line_121
  DEFW PicWingsComplete6bmp_Line_122
  DEFW PicWingsComplete6bmp_Line_123
  DEFW PicWingsComplete6bmp_Line_124
  DEFW PicWingsComplete6bmp_Line_125
  DEFW PicWingsComplete6bmp_Line_126
  DEFW PicWingsComplete6bmp_Line_127
  DEFW PicWingsComplete6bmp_Line_128
  DEFW PicWingsComplete6bmp_Line_129
  DEFW PicWingsComplete6bmp_Line_128
  DEFW PicWingsComplete6bmp_Line_131
  DEFW PicWingsComplete6bmp_Line_132
  DEFW PicWingsComplete6bmp_Line_133
  DEFW PicWingsComplete6bmp_Line_134
  DEFW PicWingsComplete6bmp_Line_135
  DEFW PicWingsComplete6bmp_Line_134
  DEFW PicWingsComplete6bmp_Line_135_Reuse
  DEFW PicWingsComplete6bmp_Line_138
  DEFW PicWingsComplete6bmp_Line_139
  DEFW PicWingsComplete6bmp_Line_140
  DEFW PicWingsComplete6bmp_Line_141
  DEFW PicWingsComplete6bmp_Line_140
  DEFW PicWingsComplete6bmp_Line_141_Reuse
  DEFW PicWingsComplete6bmp_Line_140
  DEFW PicWingsComplete6bmp_Line_145
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_145_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_145_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_151
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_153
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_155
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_157
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_159
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_161
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_163
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_165
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_167
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_169
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_171
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_173
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_175
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_175_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_179
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_181
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_183
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_185
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_187
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_189
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW EndCode
PicWingsComplete6bbmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete6bbmp_DrawOrder
JP JumpToNextLine


PicWingsComplete6bmp_Line_45_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_45
PicWingsComplete6bmp_Line_47_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_47
PicWingsComplete6bmp_Line_49_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_49
PicWingsComplete6bmp_Line_51_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_51
PicWingsComplete6bmp_Line_53_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_53
PicWingsComplete6bbmp_Line_57:
call MultiPushDe8
LD HL,&0088
  Push HL
call MultiPushDe22
LD BC,&4400
  Push BC
jp MultiPushDeLast8


PicWingsComplete6bbmp_Line_58:
call MultiPushDe8
LD HL,&2288
  Push HL
call MultiPushDe22
LD BC,&4400
  Push BC
LD HL,&1100
  Push HL
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_59:
call MultiPushDe8
LD HL,&4444
  Push HL
call MultiPushDe22
LD BC,&8888
  Push BC
jp MultiPushDeLast8


PicWingsComplete6bbmp_Line_60:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3215
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
call MultiPushDe14
LD BC,&0044
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3221
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_61:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3227
  PUSH DE
LD HL,&0022
  Push HL
LD BC,&8800
  Push BC
call MultiPushDe14
LD HL,&0044
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3233
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_62:
call MultiPushDe6
call BitmapPush8
defw BitmapData+3241
  PUSH DE
LD HL,&0044
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe14
LD HL,&0088
  Push HL
Ld B,L


  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+3249
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_63:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3255
  PUSH DE
call BitmapPush6
defw BitmapData+3214
  PUSH DE
LD HL,&0044
  Push HL
call MultiPushDe8
LD BC,&8800
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3269
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_64:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3275
  PUSH DE
call BitmapPush6
defw BitmapData+3226
  PUSH DE
LD HL,&1144
  Push HL
call MultiPushDe8
LD BC,&8800
  Push BC
LD HL,&2200
  Push HL
  PUSH DE
LD BC,&2288
  Push BC
Ld H,C


  Push HL
call BitmapPush8
defw BitmapData+3283
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_65:
call MultiPushDe7
call BitmapPush14
defw BitmapData+3297
  PUSH DE
LD HL,&2222
  Push HL
  PUSH DE
  PUSH DE
LD BC,&4400
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+3309
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_66:
call MultiPushDe7
call BitmapPush12
defw BitmapData+3321
  PUSH DE
call BitmapPush6
defw BitmapData+3327
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3333
  PUSH DE
call BitmapPush12
defw BitmapData+3345
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_67:
call MultiPushDe6
call BitmapPush14
defw BitmapData+3359
  PUSH DE
call BitmapPush6
defw BitmapData+3365
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3371
  PUSH DE
call BitmapPush14
defw BitmapData+3385
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_68:
call MultiPushDe6
call BitmapPush22
defw BitmapData+3407
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
  PUSH DE
call BitmapPush22
defw BitmapData+3429
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_69:
call MultiPushDe7
call BitmapPush6
defw BitmapData+3435
  PUSH DE
call BitmapPush12
defw BitmapData+3447
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+3467
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_70:
call MultiPushDe8
call BitmapPush18
defw BitmapData+3485
  PUSH DE
LD HL,&8811
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0066
  Push BC
  PUSH DE
  PUSH DE
LD HL,&11BB
  Push HL
call BitmapPush8
defw BitmapData+3493
  PUSH DE
LD BC,&5500
  Push BC
LD HL,&00FF
  Push HL
jp MultiPushDeLast8


PicWingsComplete6bbmp_Line_71:
call MultiPushDe7
call BitmapPush12
defw BitmapData+3505
  PUSH DE
call BitmapPush6
defw BitmapData+3511
  PUSH DE
LD HL,&8811
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0066
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3517
  PUSH DE
call BitmapPush14
defw BitmapData+3531
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_72:
call MultiPushDe6
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+3553
INC DE

  PUSH DE
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3559
  PUSH DE
LD BC,&8877
  Push BC
LD HL,&66EE
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+3569
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_73:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+3587
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
call BitmapPush8
defw BitmapData+3595
  PUSH DE
call BitmapPush8
defw BitmapData+3603
  PUSH DE
  PUSH DE
LD BC,&CCFF
  Push BC
LD HL,&FF33
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bbmp_Line_74:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+335
  PUSH DE
call BitmapPush22
defw BitmapData+3625
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
call BitmapPush22
defw BitmapData+3647
  PUSH DE
call BitmapPush6
defw BitmapData+373
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_75:
call MultiPushDe6
call BitmapPush22
defw BitmapData+3669
  PUSH DE
LD HL,&0077
  Push HL
  PUSH DE
  PUSH DE
LD BC,&8833
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3681
LD DE,&9999
  PUSH DE
  PUSH DE
LD HL,&EE22
  Push HL
LD BC,&BB77
  Push BC
LD DE,&0000
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_76:
call MultiPushDe6
call BitmapPush26
defw BitmapData+3707
  PUSH DE
  PUSH DE
LD HL,&8833
  Push HL
  PUSH DE
call BitmapPush22
defw BitmapData+3729
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_77:
call MultiPushDe6
call BitmapPush22
defw BitmapData+3751
  PUSH DE
LD HL,&00FF
  Push HL
  PUSH DE
  PUSH DE
LD BC,&CC33
  Push BC
  PUSH DE
call BitmapPush24
defw BitmapData+3775
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_78:
call MultiPushDe5
call BitmapPush8
defw BitmapData+3783
LD DE,&2266
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3799
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&CC33
  Push HL
  PUSH DE
call BitmapPush24
defw BitmapData+3823
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+3847
  PUSH DE
LD HL,&0077
  Push HL
  PUSH DE
  PUSH DE
LD BC,&8833
  Push BC
  PUSH DE
call BitmapPush24
defw BitmapData+3871
  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_80:
LD DE,&0000
call MultiPushDe5
call BitmapPush8
defw BitmapData+3879
LD DE,&6677
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+3909
call BitmapPush18
defw BitmapData+3927
LD DE,&0000
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_81:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3937
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+3967
LD HL,&33DD
  Push HL
LD BC,&3388
  Push BC
Ld D,&77
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+3985
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_82:
Call PushDE_0000x
call BitmapPush8
defw BitmapData+3993
LD DE,&6633
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4023
call BitmapPush8
defw BitmapData+4031
LD DE,&11BB
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+4039
Call PushDE_0000x
jp NextLine


PicWingsComplete6bbmp_Line_83:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+4051
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4081
call BitmapPush24
defw BitmapData+4105
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_84:
Call PushDE_0000x
call BitmapPush10
defw BitmapData+4115
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4145
call BitmapPush20
defw BitmapData+4165
Call PushDE_0000x
jp NextLine


PicWingsComplete6bbmp_Line_85:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+4177
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4207
call BitmapPush24
defw BitmapData+4231
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_86:
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+4239
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4269
call BitmapPush22
defw BitmapData+4291
LD DE,&0000
 jp NextLinePushDe3


PicWingsComplete6bbmp_Line_87:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4321
call BitmapPush30
defw BitmapData+4351
call BitmapPush10
defw BitmapData+4361
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_88:
LD DE,&0000
call MultiPushDe5
call BitmapPush30
defw BitmapData+4391
call BitmapPush30
defw BitmapData+4421
LD HL,&1100
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bbmp_Line_89:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4451
call BitmapPush30
defw BitmapData+4481
call BitmapPush10
defw BitmapData+4491
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_90:
Call PushDE_0000x
call BitmapPush10
defw BitmapData+4501
LD DE,&BB11
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+4517
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+4543
  PUSH DE
LD HL,&6600
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bbmp_Line_91:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4573
call BitmapPush30
defw BitmapData+4603
call BitmapPush10
defw BitmapData+4613
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_92:
Call PushDE_0000x
LD HL,&0022
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+4619
LD DE,&BB11
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4647
  PUSH DE
call BitmapPush20
defw BitmapData+4667
Call PushDE_0000x
jp NextLine


PicWingsComplete6bbmp_Line_93:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4697
call BitmapPush30
defw BitmapData+4727
call BitmapPush10
defw BitmapData+4737
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_94:
LD DE,&0000
call MultiPushDe5
LD HL,&0088
  Push HL
  PUSH DE
call BitmapPush26
defw BitmapData+4763
  PUSH DE
call BitmapPush24
defw BitmapData+4787
  PUSH DE
LD BC,&4400
  Push BC
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_95:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+4817
call BitmapPush30
defw BitmapData+4847
call BitmapPush10
defw BitmapData+4857
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_96:
LD DE,&0000
call MultiPushDe5
LD HL,&0022
  Push HL
  PUSH DE
call BitmapPush24
defw BitmapData+4881
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+4909
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_97:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4915
  PUSH DE
call BitmapPush30
defw BitmapData+4945
call BitmapPush30
defw BitmapData+4975
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_98:
LD DE,&0000
call MultiPushDe7
call BitmapPush24
defw BitmapData+4999
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+5025
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_99:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+5055
call BitmapPush24
defw BitmapData+5079
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_100:
LD DE,&0000
call MultiPushDe7
call BitmapPush12
defw BitmapData+5091
LD DE,&88DD
  PUSH DE
  PUSH DE
LD HL,&1188
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
LD HL,&9922
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+5111
Ld D,&55
  PUSH DE
  PUSH DE
LD BC,&2200
  Push BC
Ld D,C


jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_101:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+5141
call BitmapPush26
defw BitmapData+5167
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_102:
LD DE,&0000
call MultiPushDe6
Ld E,&88
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+5189
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+5215
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_103:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+5245
call BitmapPush26
defw BitmapData+5271
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_104:
LD DE,&0000
call MultiPushDe6
Ld E,&88
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+5293
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+5319
jp MultiPushDeLast6


PicWingsComplete6bbmp_Line_105:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+5349
call BitmapPush26
defw BitmapData+5375
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_106:
LD DE,&0000
call MultiPushDe7
call BitmapPush24
defw BitmapData+5399
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+5423
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_107:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+5453
call BitmapPush18
defw BitmapData+5471
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_108:
LD DE,&0000
call MultiPushDe8
call BitmapPush22
defw BitmapData+5493
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+5513
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_109:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+5543
call BitmapPush16
defw BitmapData+5559
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_110:
LD DE,&0000
call MultiPushDe8
call BitmapPush20
defw BitmapData+5579
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+5597
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bbmp_Line_111:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+5617
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+5635
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_112:
LD DE,&0000
call MultiPushDe9
call BitmapPush18
defw BitmapData+5653
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+5673
jp MultiPushDeLast8


PicWingsComplete6bbmp_Line_113:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+5691
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+5711
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_114:
LD DE,&0000
call MultiPushDe9
LD HL,&1188
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+5725
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+5737
Ld D,&33
  PUSH DE
  PUSH DE
LD BC,&4400
  Push BC
LD HL,&2200
  Push HL
Ld D,L


jp MultiPushDeLast8


PicWingsComplete6bbmp_Line_115:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+5755
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+5767
Ld D,&33
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
LD BC,&2250
  Push BC
Ld D,C


  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_116:
LD DE,&0000
call MultiPushDe9
LD HL,&0088
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+5781
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+5793
Ld D,&33
  PUSH DE
  PUSH DE
LD BC,&4400
  Push BC
Ld D,C


jp MultiPushDeLast9


PicWingsComplete6bbmp_Line_117:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+5811
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+5831
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_118:
LD DE,&0000
call MultiPushDe9
Ld E,&88
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+5845
Call PushDE_0000x
LD HL,&00AA
  Push HL
  PUSH DE
LD BC,&CC66
  Push BC
call BitmapPush12
defw BitmapData+5857
jp MultiPushDeLast9


PicWingsComplete6bbmp_Line_119:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+5875
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+5895
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_120:
LD DE,&0000
call MultiPushDe10
call BitmapPush12
defw BitmapData+5907
  PUSH DE
LD HL,&4411
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+5919
jp MultiPushDeLast10


PicWingsComplete6bbmp_Line_121:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+5937
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+5957
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_122:
LD DE,&0000
call MultiPushDe11
call BitmapPush10
defw BitmapData+5967
  PUSH DE
LD HL,&8822
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0055
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+5975
  PUSH DE
LD HL,&1100
  Push HL
jp MultiPushDeLast10


PicWingsComplete6bbmp_Line_123:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
call MultiPushDe6
call BitmapPush14
defw BitmapData+5989
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5055
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+6001
call MultiPushDe5
call BitmapPush6
defw BitmapData+903
 jp NextLinePushDe2


PicWingsComplete6bbmp_Line_125:
LD DE,&5050
call MultiPushDe10
call BitmapPush16
defw BitmapData+6017
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
Ld L,&33
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+6029
jp MultiPushDeLast10


PicWingsComplete6bbmp_Line_126:
LD DE,&0000
call MultiPushDe11
call BitmapPush10
defw BitmapData+6039
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
call BitmapPush8
defw BitmapData+6047
  PUSH DE
LD BC,&1100
  Push BC
jp MultiPushDeLast10


PicWingsComplete6bbmp_Line_127:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+6063
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
Ld L,&33
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+6075
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_128:
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+6083
  PUSH DE
LD HL,&0033
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
call BitmapPush8
defw BitmapData+6091
jp MultiPushDeLast12


PicWingsComplete6bbmp_Line_129:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+6107
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
Ld L,&33
  Push HL
  PUSH DE
LD BC,&DC11
  Push BC
call BitmapPush10
defw BitmapData+6117
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
jp MultiPushDeLast5


PicWingsComplete6bbmp_Line_130:
LD DE,&0000
call MultiPushDe12
LD HL,&8800
  Push HL
Ld E,&22
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6123
Call PushDE_0000x
LD BC,&0033
  Push BC
  PUSH DE
LD HL,&CC11
  Push HL

Ld E,L

  PUSH DE
  PUSH DE
Ld C,&44
  Push BC

Ld E,B

jp MultiPushDeLast12


PicWingsComplete6bbmp_Line_131:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6129
Ld E,&22
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+6149
Ld E,&51
  PUSH DE
  PUSH DE
Ld E,&10
  PUSH DE
  PUSH DE
LD BC,&0040
  Push BC
Ld E,&50
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bbmp_Line_132:
LD DE,&0000
call MultiPushDe13
Ld E,&22
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
Ld B,D
Ld C,D

  Push BC
  PUSH DE
Call PushDE_0000x
LD HL,&0011
  Push HL
  PUSH DE
Ld B,&CC
  Push BC

Ld E,L

  PUSH DE
  PUSH DE

Ld E,H

jp MultiPushDeLast13


PicWingsComplete6bbmp_Line_133:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
Ld E,&22
  PUSH DE
  PUSH DE
LD BC,&00CC
  Push BC
  Push HL 
  PUSH DE
call BitmapPush14
defw BitmapData+6163
Ld E,&51
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6169
Ld E,&50
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bbmp_Line_134:
LD DE,&0000
call MultiPushDe14
LD HL,&0022
  Push HL
LD BC,&00CC
  Push BC
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&11
  Push HL
  PUSH DE
LD BC,&CC00
  Push BC
  Push HL 
jp MultiPushDeLast14


PicWingsComplete6bbmp_Line_135:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+6177
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
LD BC,&9840
  Push BC
  PUSH DE
LD HL,&6600
  Push HL
  Push BC
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bbmp_Line_136:
LD DE,&0000
call MultiPushDe14
call BitmapPush8
defw BitmapData+6185
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
LD BC,&6600
  Push BC
  Push HL 
jp MultiPushDeLast14


PicWingsComplete6bbmp_Line_137:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+6193
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
LD BC,&9840
  Push BC
  PUSH DE
LD HL,&6600
  Push HL
  Push BC
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bbmp_Line_138:
LD DE,&0000
call MultiPushDe14
call BitmapPush6
defw BitmapData+2895
call MultiPushDe7
LD HL,&6600
  Push HL
LD BC,&8800
  Push BC
jp MultiPushDeLast14


PicWingsComplete6bbmp_Line_139:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6199
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&22
  Push BC
LD HL,&1040
  Push HL
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld H,&00
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bbmp_Line_140:
LD DE,&0000
call MultiPushDe16
LD HL,&1100
  Push HL
call MultiPushDe7
LD BC,&2200
  Push BC
jp MultiPushDeLast15


PicWingsComplete6bbmp_Line_141:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
Ld H,&22
  Push HL
  PUSH DE
  PUSH DE
Ld B,&50
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&11
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bbmp_Line_142:
LD DE,&0000
call MultiPushDe16
LD HL,&2200
  Push HL
call MultiPushDe7
LD BC,&1100
  Push BC
jp MultiPushDeLast15


PicWingsComplete6bbmp_Line_141_Reuse:
LD DE,&0000
JP PicWingsComplete6bbmp_Line_141
PicWingsComplete6bbmp_Line_145:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
Ld B,E


  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,C

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_151_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_151
PicWingsComplete6bmp_Line_153_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_153
PicWingsComplete6bmp_Line_155_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_155
PicWingsComplete6bmp_Line_157_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_157
PicWingsComplete6bmp_Line_159_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_159
PicWingsComplete6bmp_Line_161_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_161
PicWingsComplete6bmp_Line_163_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_163
PicWingsComplete6bmp_Line_165_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_165
PicWingsComplete6bmp_Line_169_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_169
PicWingsComplete6bmp_Line_171_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_171
PicWingsComplete6bmp_Line_173_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_173
PicWingsComplete6bmp_Line_179_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_179
PicWingsComplete6bmp_Line_181_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_181
PicWingsComplete6bmp_Line_185_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_185
PicWingsComplete6bmp_Line_187_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_187

PicWingsComplete6bbmp_DrawOrder: 

  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_5
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_7
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_9
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_11
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_13
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_15
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_17
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_1
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_23
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_25
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_27
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_29
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_31
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_33
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_35
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_37
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_39
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_41
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_43
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_45_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_47_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_49_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_51_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_53_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bbmp_Line_57
  DEFW PicWingsComplete6bbmp_Line_58
  DEFW PicWingsComplete6bbmp_Line_59
  DEFW PicWingsComplete6bbmp_Line_60
  DEFW PicWingsComplete6bbmp_Line_61
  DEFW PicWingsComplete6bbmp_Line_62
  DEFW PicWingsComplete6bbmp_Line_63
  DEFW PicWingsComplete6bbmp_Line_64
  DEFW PicWingsComplete6bbmp_Line_65
  DEFW PicWingsComplete6bbmp_Line_66
  DEFW PicWingsComplete6bbmp_Line_67
  DEFW PicWingsComplete6bbmp_Line_68
  DEFW PicWingsComplete6bbmp_Line_69
  DEFW PicWingsComplete6bbmp_Line_70
  DEFW PicWingsComplete6bbmp_Line_71
  DEFW PicWingsComplete6bbmp_Line_72
  DEFW PicWingsComplete6bbmp_Line_73
  DEFW PicWingsComplete6bbmp_Line_74
  DEFW PicWingsComplete6bbmp_Line_75
  DEFW PicWingsComplete6bbmp_Line_76
  DEFW PicWingsComplete6bbmp_Line_77
  DEFW PicWingsComplete6bbmp_Line_78
  DEFW PicWingsComplete6bbmp_Line_79
  DEFW PicWingsComplete6bbmp_Line_80
  DEFW PicWingsComplete6bbmp_Line_81
  DEFW PicWingsComplete6bbmp_Line_82
  DEFW PicWingsComplete6bbmp_Line_83
  DEFW PicWingsComplete6bbmp_Line_84
  DEFW PicWingsComplete6bbmp_Line_85
  DEFW PicWingsComplete6bbmp_Line_86
  DEFW PicWingsComplete6bbmp_Line_87
  DEFW PicWingsComplete6bbmp_Line_88
  DEFW PicWingsComplete6bbmp_Line_89
  DEFW PicWingsComplete6bbmp_Line_90
  DEFW PicWingsComplete6bbmp_Line_91
  DEFW PicWingsComplete6bbmp_Line_92
  DEFW PicWingsComplete6bbmp_Line_93
  DEFW PicWingsComplete6bbmp_Line_94
  DEFW PicWingsComplete6bbmp_Line_95
  DEFW PicWingsComplete6bbmp_Line_96
  DEFW PicWingsComplete6bbmp_Line_97
  DEFW PicWingsComplete6bbmp_Line_98
  DEFW PicWingsComplete6bbmp_Line_99
  DEFW PicWingsComplete6bbmp_Line_100
  DEFW PicWingsComplete6bbmp_Line_101
  DEFW PicWingsComplete6bbmp_Line_102
  DEFW PicWingsComplete6bbmp_Line_103
  DEFW PicWingsComplete6bbmp_Line_104
  DEFW PicWingsComplete6bbmp_Line_105
  DEFW PicWingsComplete6bbmp_Line_106
  DEFW PicWingsComplete6bbmp_Line_107
  DEFW PicWingsComplete6bbmp_Line_108
  DEFW PicWingsComplete6bbmp_Line_109
  DEFW PicWingsComplete6bbmp_Line_110
  DEFW PicWingsComplete6bbmp_Line_111
  DEFW PicWingsComplete6bbmp_Line_112
  DEFW PicWingsComplete6bbmp_Line_113
  DEFW PicWingsComplete6bbmp_Line_114
  DEFW PicWingsComplete6bbmp_Line_115
  DEFW PicWingsComplete6bbmp_Line_116
  DEFW PicWingsComplete6bbmp_Line_117
  DEFW PicWingsComplete6bbmp_Line_118
  DEFW PicWingsComplete6bbmp_Line_119
  DEFW PicWingsComplete6bbmp_Line_120
  DEFW PicWingsComplete6bbmp_Line_121
  DEFW PicWingsComplete6bbmp_Line_122
  DEFW PicWingsComplete6bbmp_Line_123
  DEFW PicWingsComplete6bbmp_Line_122
  DEFW PicWingsComplete6bbmp_Line_125
  DEFW PicWingsComplete6bbmp_Line_126
  DEFW PicWingsComplete6bbmp_Line_127
  DEFW PicWingsComplete6bbmp_Line_128
  DEFW PicWingsComplete6bbmp_Line_129
  DEFW PicWingsComplete6bbmp_Line_130
  DEFW PicWingsComplete6bbmp_Line_131
  DEFW PicWingsComplete6bbmp_Line_132
  DEFW PicWingsComplete6bbmp_Line_133
  DEFW PicWingsComplete6bbmp_Line_134
  DEFW PicWingsComplete6bbmp_Line_135
  DEFW PicWingsComplete6bbmp_Line_136
  DEFW PicWingsComplete6bbmp_Line_137
  DEFW PicWingsComplete6bbmp_Line_138
  DEFW PicWingsComplete6bbmp_Line_139
  DEFW PicWingsComplete6bbmp_Line_140
  DEFW PicWingsComplete6bbmp_Line_141
  DEFW PicWingsComplete6bbmp_Line_142
  DEFW PicWingsComplete6bbmp_Line_141_Reuse
  DEFW PicWingsComplete6bbmp_Line_142
  DEFW PicWingsComplete6bbmp_Line_145
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_145_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_145_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_151_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_153_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_155_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_157_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_159_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_161_Reuse
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_163_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_165_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_167
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_169_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_171_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_173_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_175_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_175_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_179_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_181_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_183
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_185_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_187_Reuse
  DEFW PicWingsComplete6bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_189
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW PicWingsComplete6bmp_Line_0
  DEFW PicWingsComplete6bmp_Line_191
  DEFW EndCode







;Global Code
EndCode:
ld sp,(StackRestore_Plus2-2)
ei
ret

MultiPushDeLast40: ld HL,NextLine
jp MultiPushDe40B 
MultiPushDe40: pop HL
jp MultiPushDe40B 
MultiPushDe36: pop HL
jp MultiPushDe36B 
MultiPushDe31: pop HL
jp MultiPushDe31B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe24: pop HL
jr MultiPushDe24B 
MultiPushDe22: pop HL
jr MultiPushDe22B 
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDeLast15: ld HL,NextLine
jr MultiPushDe15B 
MultiPushDe15: pop HL
jr MultiPushDe15B 
MultiPushDeLast14: ld HL,NextLine
jr MultiPushDe14B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDeLast13: ld HL,NextLine
jr MultiPushDe13B 
MultiPushDe13: pop HL
jr MultiPushDe13B 
MultiPushDeLast12: ld HL,NextLine
jr MultiPushDe12B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDeLast11: ld HL,NextLine
jr MultiPushDe11B 
MultiPushDe11: pop HL
jr MultiPushDe11B 
MultiPushDeLast10: ld HL,NextLine
jr MultiPushDe10B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDeLast9: ld HL,NextLine
jr MultiPushDe9B 
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
JP (HL)


BitmapData: 

defb &10,&50,&50,&50,&50,&00,&00,&50,&50,&50
defb &50,&40,&00,&10,&50,&40,&00,&50,&40,&00
defb &50,&50,&40,&00,&10,&50,&50,&40,&00,&50
defb &40,&00,&50,&50,&50,&00,&50,&00,&00,&00
defb &00,&10,&50,&00,&00,&00,&10,&50,&50,&40
defb &10,&50,&00,&00,&00,&10,&50,&40,&10,&50
defb &50,&40,&00,&50,&50,&50,&50,&00,&00,&44
defb &00,&88,&44,&00,&00,&88,&44,&00,&88,&00
defb &00,&22,&00,&88,&44,&00,&00,&22,&00,&88
defb &88,&00,&00,&11,&00,&88,&88,&00,&44,&11
defb &00,&99,&00,&22,&00,&11,&00,&22,&44,&22
defb &00,&88,&22,&00,&88,&99,&00,&44,&88,&22
defb &44,&44,&11,&00,&11,&88,&88,&AA,&11,&88
defb &00,&22,&00,&44,&22,&00,&66,&11,&44,&44
defb &66,&00,&00,&11,&00,&44,&22,&00,&00,&44
defb &11,&00,&99,&00,&22,&00,&00,&CC,&55,&AA
defb &33,&00,&66,&00,&11,&88,&33,&11,&66,&88
defb &CC,&00,&11,&00,&22,&44,&22,&00,&88,&00
defb &11,&00,&88,&22,&00,&11,&00,&44,&44,&00
defb &00,&22,&00,&88,&99,&00,&44,&33,&00,&77
defb &55,&88,&EE,&11,&88,&00,&00,&66,&11,&CC
defb &66,&BB,&88,&33,&00,&88,&22,&44,&44,&11
defb &88,&44,&44,&00,&00,&11,&88,&88,&AA,&11
defb &88,&00,&CC,&33,&99,&BB,&CC,&66,&00,&11
defb &88,&FF,&66,&77,&00,&CC,&00,&66,&11,&44
defb &44,&66,&CC,&55,&AA,&33,&00,&66,&33,&11
defb &CC,&33,&99,&88,&22,&00,&88,&44,&88,&11
defb &66,&77,&00,&EE,&33,&11,&88,&33,&11,&66
defb &88,&CC,&00,&22,&00,&44,&88,&44,&11,&00
defb &00,&44,&11,&00,&44,&44,&88,&22,&33,&00
defb &77,&55,&88,&EE,&11,&88,&00,&CC,&99,&88
defb &66,&44,&CC,&00,&66,&11,&CC,&66,&BB,&88
defb &33,&11,&00,&44,&88,&88,&22,&00,&88,&00
defb &00,&FF,&FF,&FF,&EE,&00,&00,&88,&00,&CC
defb &44,&55,&00,&CC,&00,&44,&33,&99,&BB,&CC
defb &66,&00,&11,&88,&FF,&66,&77,&00,&88,&00
defb &CC,&22,&88,&88,&CC,&00,&44,&00,&11,&FF
defb &FF,&FF,&CC,&00,&11,&00,&00,&66,&22,&DD
defb &11,&88,&33,&33,&11,&CC,&33,&99,&88,&00
defb &00,&77,&77,&66,&FF,&DD,&BB,&BB,&88,&00
defb &00,&66,&77,&00,&EE,&33,&33,&00,&66,&22
defb &DD,&11,&88,&00,&22,&00,&33,&11,&88,&33
defb &AA,&CC,&77,&00,&CC,&00,&CC,&99,&88,&00
defb &00,&11,&BB,&FF,&66,&EE,&00,&66,&44,&CC
defb &00,&CC,&33,&88,&DD,&77,&00,&66,&33,&00
defb &00,&33,&FF,&FF,&FF,&DD,&DD,&BB,&FF,&66
defb &00,&33,&DD,&88,&DD,&FF,&BB,&88,&33,&CC
defb &66,&00,&66,&11,&CC,&DD,&EE,&33,&FF,&00
defb &77,&77,&EE,&CC,&66,&FF,&00,&00,&00,&33
defb &11,&EE,&CC,&EE,&FF,&77,&66,&FF,&DD,&EE
defb &00,&BB,&55,&99,&BB,&CC,&FF,&88,&EE,&00
defb &11,&88,&EE,&11,&CC,&CC,&CC,&EE,&11,&CC
defb &66,&00,&11,&CC,&77,&CC,&FF,&66,&66,&BB
defb &44,&11,&EE,&FF,&DD,&BB,&BB,&CC,&77,&33
defb &66,&55,&DD,&33,&33,&FF,&88,&00,&66,&EE
defb &FF,&66,&EE,&FF,&00,&11,&CC,&00,&00,&66
defb &44,&CC,&CC,&99,&88,&00,&00,&EE,&00,&77
defb &FF,&33,&22,&EE,&99,&BB,&33,&88,&00,&33
defb &DD,&DD,&BB,&DD,&DD,&88,&11,&EE,&00,&DD
defb &EE,&EE,&00,&33,&CC,&00,&33,&66,&33,&EE
defb &77,&66,&AA,&FF,&CC,&33,&FF,&88,&77,&FF
defb &00,&FF,&DD,&55,&BB,&99,&FF,&11,&BB,&00
defb &00,&FF,&00,&11,&DD,&EE,&CC,&11,&EE,&00
defb &77,&66,&DD,&11,&FF,&00,&33,&FF,&88,&00
defb &00,&77,&00,&00,&00,&33,&BB,&BB,&77,&DD
defb &88,&11,&66,&55,&AA,&00,&00,&77,&FF,&00
defb &33,&EE,&22,&DD,&BB,&AA,&EE,&22,&EE,&00
defb &11,&66,&99,&AA,&00,&66,&FF,&BB,&77,&77
defb &33,&66,&66,&88,&77,&CC,&00,&11,&FF,&88
defb &11,&EE,&00,&00,&11,&FF,&BB,&77,&77,&00
defb &00,&33,&EE,&66,&77,&00,&33,&BB,&BB,&77
defb &EE,&00,&00,&11,&EE,&00,&FF,&88,&55,&99
defb &BB,&33,&11,&33,&11,&00,&33,&99,&99,&FF
defb &33,&AA,&BB,&44,&11,&FF,&00,&00,&11,&FF
defb &88,&00,&33,&EE,&00,&00,&DD,&FF,&11,&EE
defb &00,&99,&88,&55,&DD,&33,&BB,&88,&77,&00
defb &77,&77,&22,&EE,&88,&66,&44,&11,&EE,&33
defb &EE,&CC,&00,&11,&FF,&00,&50,&40,&00,&77
defb &EE,&00,&00,&33,&EE,&00,&BB,&55,&33,&AA
defb &DD,&AA,&00,&77,&88,&00,&EE,&22,&DD,&00
defb &66,&FF,&88,&00,&EE,&77,&88,&00,&00,&77
defb &99,&CC,&00,&77,&DD,&88,&22,&DD,&11,&FF
defb &88,&66,&33,&33,&BB,&88,&77,&00,&77,&77
defb &33,&11,&88,&77,&77,&88,&00,&00,&00,&77
defb &88,&11,&66,&DD,&22,&FF,&CC,&66,&33,&33
defb &88,&FF,&44,&77,&BB,&11,&DD,&88,&33,&BB
defb &11,&BB,&11,&AA,&AA,&DD,&10,&11,&EE,&50
defb &50,&40,&00,&00,&77,&00,&66,&EE,&33,&77
defb &88,&BB,&CC,&77,&33,&11,&88,&FF,&DD,&00
defb &44,&88,&44,&00,&00,&88,&44,&88,&50,&40
defb &00,&00,&10,&50,&11,&EE,&10,&22,&DD,&55
defb &66,&66,&88,&00,&33,&00,&22,&66,&FF,&11
defb &CC,&11,&DD,&EE,&11,&77,&AA,&00,&11,&77
defb &AA,&11,&EE,&EE,&00,&EE,&33,&DD,&99,&00
defb &CC,&33,&BB,&99,&DD,&CC,&66,&00,&EE,&EE
defb &77,&77,&00,&CC,&33,&00,&00,&55,&99,&BB
defb &55,&33,&44,&50,&00,&CC,&50,&40,&00,&00
defb &EE,&40,&CC,&CC,&11,&FF,&AA,&CC,&DD,&00
defb &22,&CC,&DD,&77,&EE,&00,&CC,&CC,&11,&EE
defb &CC,&FF,&44,&33,&BB,&88,&EE,&CC,&51,&DD
defb &50,&40,&00,&00,&10,&00,&CC,&50,&40,&BB
defb &22,&BB,&66,&77,&66,&66,&EE,&40,&DD,&CC
defb &77,&77,&40,&BB,&CC,&DD,&22,&88,&55,&77
defb &88,&33,&77,&AA,&11,&EE,&CC,&FF,&66,&33
defb &DD,&88,&66,&EE,&11,&DD,&99,&DD,&88,&DD
defb &33,&00,&AA,&00,&00,&33,&11,&44,&33,&22
defb &CC,&66,&EE,&66,&EE,&11,&DD,&88,&66,&FF
defb &11,&BB,&CC,&DD,&EE,&11,&77,&BB,&00,&77
defb &AA,&88,&55,&00,&77,&00,&00,&77,&51,&EE
defb &CC,&77,&66,&33,&DD,&DC,&77,&66,&40,&DD
defb &99,&DD,&88,&DD,&11,&88,&55,&10,&50,&00
defb &CC,&40,&00,&00,&66,&22,&DC,&66,&EE,&66
defb &CC,&51,&BB,&88,&EE,&FF,&51,&BB,&88,&DD
defb &EE,&33,&88,&00,&33,&99,&AA,&88,&55,&00
defb &22,&88,&55,&66,&50,&40,&00,&00,&00,&CC
defb &DD,&00,&22,&CC,&DD,&11,&66,&00,&FF,&BB
defb &00,&FF,&66,&77,&AA,&11,&DD,&CC,&77,&66
defb &00,&DD,&99,&DD,&88,&DD,&99,&88,&22,&88
defb &55,&00,&66,&66,&CC,&66,&EE,&66,&CC,&11
defb &BB,&88,&EE,&EE,&11,&77,&99,&BB,&CC,&33
defb &77,&CC,&11,&AA,&22,&CC,&AA,&00,&11,&77
defb &AA,&33,&DD,&40,&77,&BB,&40,&FF,&66,&77
defb &BB,&51,&EE,&DC,&33,&BB,&40,&DD,&DD,&DD
defb &88,&DD,&88,&DC,&11,&44,&CC,&50,&50,&40
defb &AA,&40,&CC,&66,&DC,&66,&EE,&EE,&DC,&33
defb &77,&00,&DD,&EE,&33,&77,&99,&BB,&DC,&33
defb &77,&98,&22,&FF,&11,&77,&44,&00,&00,&88
defb &44,&44,&33,&00,&33,&BB,&00,&FF,&77,&33
defb &BB,&00,&EE,&CC,&33,&BB,&00,&EE,&CC,&DD
defb &88,&55,&88,&CC,&00,&AA,&00,&11,&44,&00
defb &CC,&66,&88,&66,&CC,&DD,&CC,&33,&77,&00
defb &DD,&CC,&33,&77,&33,&BB,&CC,&33,&77,&00
defb &33,&00,&88,&88,&BB,&50,&33,&DD,&88,&77
defb &BB,&33,&DD,&00,&FF,&66,&33,&BB,&00,&EE
defb &CC,&66,&DC,&66,&88,&66,&40,&55,&10,&50
defb &50,&00,&CC,&00,&DC,&33,&77,&51,&BB,&DC
defb &22,&FF,&33,&77,&98,&66,&FF,&50,&33,&77
defb &99,&77,&98,&00,&00,&77,&AA,&77,&50,&40
defb &00,&CC,&10,&50,&50,&22,&98,&51,&98,&55
defb &88,&22,&00,&33,&88,&00,&22,&77,&BB,&00
defb &33,&DD,&88,&77,&BB,&11,&DD,&88,&FF,&66
defb &11,&DD,&88,&66,&88,&66,&EE,&11,&BB,&CC
defb &66,&EE,&33,&77,&88,&66,&FF,&00,&33,&77
defb &99,&00,&00,&77,&00,&11,&00,&55,&DD,&98
defb &33,&DD,&98,&77,&BB,&11,&DD,&88,&77,&66
defb &51,&DD,&98,&66,&CC,&66,&DC,&66,&DC,&33
defb &50,&00,&CC,&50,&50,&40,&00,&00,&98,&66
defb &EE,&11,&BB,&88,&66,&EE,&33,&77,&98,&66
defb &FF,&50,&66,&FF,&33,&BB,&50,&00,&00,&33
defb &77,&33,&50,&40,&00,&00,&10,&50,&40,&CC
defb &50,&33,&40,&DD,&00,&33,&DD,&33,&DD,&88
defb &33,&DD,&88,&33,&DD,&88,&DD,&CC,&77,&77
defb &11,&DD,&88,&66,&CC,&66,&CC,&22,&CC,&11
defb &88,&DD,&88,&66,&EE,&33,&BB,&88,&EE,&CC
defb &66,&FF,&00,&66,&FF,&00,&66,&FF,&22,&FF
defb &DD,&98,&11,&DD,&98,&33,&DD,&88,&EE,&DC
defb &77,&BB,&40,&EE,&98,&33,&44,&66,&DC,&22
defb &DC,&51,&98,&50,&11,&10,&50,&40,&00,&00
defb &88,&BB,&00,&55,&CC,&33,&77,&88,&DD,&DC
defb &66,&FF,&00,&66,&EE,&50,&66,&EE,&22,&EE
defb &50,&00,&00,&11,&DD,&11,&50,&40,&00,&00
defb &10,&50,&22,&10,&50,&66,&DD,&99,&DD,&88
defb &11,&EE,&CC,&11,&DD,&88,&EE,&CC,&33,&BB
defb &00,&EE,&CC,&33,&66,&77,&44,&33,&44,&00
defb &88,&00,&00,&88,&99,&BB,&00,&DD,&CC,&33
defb &77,&00,&DD,&CC,&66,&EE,&00,&DD,&EE,&00
defb &66,&EE,&66,&CC,&EE,&DC,&51,&EE,&DC,&11
defb &DD,&88,&EE,&EE,&33,&BB,&00,&EE,&DC,&33
defb &66,&11,&54,&33,&54,&40,&DC,&50,&40,&44
defb &50,&40,&00,&00,&40,&BB,&40,&AA,&11,&BB
defb &40,&DD,&DC,&33,&77,&51,&DD,&CC,&66,&EE
defb &00,&DD,&EE,&40,&DD,&EE,&66,&DC,&50,&00
defb &00,&40,&DD,&99,&50,&40,&00,&00,&10,&40
defb &98,&50,&40,&DC,&EE,&88,&EE,&CC,&00,&EE
defb &CC,&11,&EE,&CC,&66,&EE,&11,&DD,&88,&66
defb &CC,&33,&66,&11,&44,&33,&00,&88,&00,&BB
defb &00,&AA,&11,&BB,&00,&DD,&88,&66,&EE,&11
defb &DD,&88,&DD,&EE,&00,&DD,&CC,&00,&DD,&CC
defb &55,&CC,&EE,&CC,&40,&EE,&CC,&00,&EE,&DC
defb &77,&66,&51,&DD,&98,&77,&44,&33,&66,&11
defb &54,&33,&54,&50,&44,&50,&50,&11,&50,&40
defb &00,&00,&40,&BB,&40,&AA,&11,&BB,&40,&BB
defb &98,&66,&EE,&51,&BB,&88,&DD,&CC,&00,&DD
defb &DC,&40,&DD,&CC,&55,&98,&50,&00,&00,&40
defb &66,&88,&50,&40,&00,&00,&10,&22,&66,&CC
defb &FF,&66,&00,&FF,&66,&00,&EE,&CC,&77,&66
defb &11,&DD,&88,&77,&66,&11,&AA,&11,&44,&33
defb &44,&00,&22,&00,&11,&00,&00,&BB,&00,&AA
defb &11,&66,&11,&BB,&88,&66,&EE,&11,&BB,&88
defb &DD,&CC,&11,&BB,&CC,&11,&BB,&CC,&DD,&88
defb &50,&00,&00,&50,&22,&CC,&77,&66,&40,&FF
defb &66,&00,&FF,&66,&33,&66,&51,&DD,&98,&33
defb &66,&51,&AA,&11,&54,&11,&54,&50,&22,&50
defb &11,&66,&51,&BB,&10,&66,&EE,&51,&BB,&11
defb &BB,&CC,&11,&BB,&DC,&51,&BB,&88,&DD,&10
defb &50,&40,&00,&00,&10,&50,&50,&50,&11,&50
defb &33,&44,&77,&66,&00,&77,&66,&00,&77,&66
defb &33,&66,&00,&DD,&88,&33,&66,&11,&AA,&11
defb &44,&11,&44,&00,&11,&00,&11,&66,&11,&BB
defb &00,&66,&CC,&11,&BB,&11,&BB,&88,&11,&BB
defb &88,&11,&BB,&88,&BB,&00,&50,&00,&00,&50
defb &11,&54,&77,&66,&50,&77,&66,&00,&77,&66
defb &33,&77,&40,&DD,&98,&33,&AA,&51,&BB,&00
defb &DC,&51,&DC,&50,&51,&10,&22,&50,&40,&EE
defb &40,&CC,&33,&66,&51,&77,&40,&66,&DC,&33
defb &BB,&51,&BB,&88,&11,&BB,&98,&51,&BB,&88
defb &AA,&50,&00,&CC,&77,&66,&00,&77,&BB,&00
defb &77,&66,&33,&BB,&00,&EE,&CC,&11,&AA,&00
defb &DD,&00,&CC,&11,&CC,&00,&00,&88,&44,&00
defb &00,&EE,&00,&CC,&22,&CC,&11,&66,&00,&DD
defb &CC,&33,&77,&11,&BB,&88,&33,&77,&88,&11
defb &BB,&88,&CC,&00,&50,&00,&00,&50,&40,&DC
defb &33,&BB,&50,&33,&BB,&00,&77,&AA,&33,&BB
defb &40,&EE,&DC,&51,&AA,&40,&DD,&00,&DC,&40
defb &DC,&50,&40,&98,&22,&CC,&51,&66,&40,&DD
defb &DC,&33,&77,&11,&77,&88,&33,&77,&10,&33
defb &77,&00,&DC,&50,&50,&40,&00,&00,&10,&50
defb &50,&50,&54,&50,&00,&44,&33,&BB,&00,&33
defb &BB,&00,&33,&BB,&11,&BB,&00,&66,&CC,&11
defb &AA,&00,&DD,&00,&22,&CC,&11,&66,&00,&DD
defb &88,&33,&66,&33,&77,&00,&33,&77,&00,&33
defb &77,&00,&88,&00,&98,&50,&50,&00,&00,&50
defb &50,&44,&33,&BB,&10,&33,&DD,&88,&33,&BB
defb &51,&BB,&50,&66,&DC,&51,&AA,&40,&DD,&00
defb &DC,&40,&DC,&50,&40,&DC,&40,&CC,&22,&CC
defb &51,&66,&40,&DD,&98,&33,&66,&33,&77,&00
defb &66,&FF,&50,&33,&77,&40,&00,&22,&33,&BB
defb &88,&11,&DD,&88,&33,&BB,&00,&BB,&00,&66
defb &22,&88,&11,&44,&00,&DD,&88,&33,&44,&33
defb &77,&00,&66,&EE,&00,&77,&77,&11,&50,&00
defb &00,&50,&50,&22,&11,&BB,&98,&51,&DD,&88
defb &33,&DD,&88,&DD,&50,&22,&DC,&40,&AA,&50
defb &55,&00,&54,&40,&54,&50,&40,&98,&40,&88
defb &22,&88,&51,&54,&40,&DD,&10,&22,&DC,&66
defb &FF,&00,&66,&EE,&50,&77,&66,&51,&00,&22
defb &11,&BB,&88,&11,&DD,&88,&11,&DD,&88,&DD
defb &00,&33,&22,&88,&11,&44,&00,&BB,&00,&22
defb &CC,&66,&EE,&00,&66,&EE,&00,&77,&66,&11
defb &50,&66,&EE,&51,&50,&50,&50,&00,&00,&50
defb &50,&22,&51,&DD,&98,&51,&DD,&88,&11,&DD
defb &88,&DD,&50,&33,&54,&40,&AA,&50,&55,&00
defb &40,&98,&40,&88,&22,&88,&51,&54,&40,&BB
defb &50,&22,&DC,&66,&EE,&00,&66,&EE,&00,&DD
defb &88,&00,&EE,&CC,&11,&DD,&88,&DD,&00,&33
defb &33,&00,&11,&44,&00,&BB,&00,&22,&CC,&66
defb &EE,&00,&DD,&CC,&00,&66,&CC,&00,&50,&66
defb &DC,&50,&50,&50,&50,&00,&00,&50,&50,&50
defb &40,&DD,&98,&40,&EE,&CC,&00,&DD,&88,&DD
defb &50,&33,&54,&40,&AA,&50,&33,&00,&40,&98
defb &40,&88,&33,&00,&51,&54,&40,&BB,&50,&22
defb &DC,&66,&CC,&00,&DD,&DC,&00,&DD,&88,&00
defb &EE,&CC,&00,&DD,&88,&55,&00,&33,&44,&00
defb &AA,&00,&33,&00,&44,&00,&00,&88,&33,&00
defb &11,&44,&00,&BB,&00,&22,&88,&66,&CC,&00
defb &DD,&CC,&00,&66,&CC,&00,&40,&DD,&98,&40
defb &EE,&EE,&00,&DD,&98,&55,&50,&33,&54,&40
defb &AA,&50,&33,&00,&54,&50,&40,&88,&33,&00
defb &51,&54,&40,&BB,&50,&22,&98,&66,&CC,&11
defb &DD,&DC,&50,&66,&DC,&50,&00,&DD,&88,&00
defb &66,&EE,&00,&DD,&88,&55,&00,&33,&88,&00
defb &CC,&00,&22,&00,&44,&00,&00,&88,&11,&00
defb &00,&CC,&00,&77,&00,&22,&88,&66,&CC,&11
defb &DD,&88,&00,&66,&CC,&00,&40,&DD,&98,&50
defb &66,&EE,&00,&EE,&98,&66,&50,&33,&98,&40
defb &DC,&50,&22,&00,&54,&50,&40,&88,&11,&00
defb &40,&DC,&50,&77,&50,&11,&98,&55,&CC,&11
defb &DD,&98,&50,&66,&DC,&50,&00,&DD,&88,&00
defb &66,&EE,&00,&EE,&88,&66,&00,&11,&88,&00
defb &CC,&00,&22,&00,&11,&00,&00,&CC,&00,&66
defb &00,&11,&88,&55,&CC,&11,&DD,&88,&00,&66
defb &CC,&00,&40,&55,&98,&50,&33,&66,&00,&EE
defb &98,&66,&50,&51,&98,&40,&EE,&50,&22,&00
defb &50,&40,&11,&00,&51,&DC,&50,&66,&50,&51
defb &98,&55,&CC,&11,&BB,&10,&50,&66,&98,&50
defb &00,&55,&88,&00,&33,&66,&00,&66,&88,&66
defb &00,&11,&88,&00,&EE,&00,&22,&00,&11,&00
defb &11,&CC,&00,&66,&00,&11,&88,&55,&88,&11
defb &BB,&00,&00,&66,&88,&00,&50,&55,&98,&50
defb &33,&66,&00,&66,&98,&66,&50,&51,&98,&40
defb &66,&50,&00,&00,&50,&40,&00,&00,&51,&98
defb &50,&66,&50,&51,&98,&55,&88,&11,&BB,&50
defb &50,&66,&98,&50,&00,&55,&88,&00,&33,&66
defb &00,&66,&88,&66,&00,&11,&88,&00,&66,&00
defb &11,&88,&00,&66,&00,&11,&88,&55,&88,&11
defb &BB,&00,&00,&66,&88,&00,&50,&55,&10,&50
defb &33,&66,&50,&66,&98,&66,&50,&51,&98,&50
defb &44,&50,&00,&00,&50,&40,&00,&00,&40,&98
defb &50,&66,&50,&51,&98,&55,&98,&51,&BB,&50
defb &50,&22,&98,&50,&33,&66,&00,&77,&00,&66
defb &00,&11,&88,&00,&44,&00,&00,&88,&00,&66
defb &00,&11,&88,&33,&88,&11,&BB,&00,&00,&22
defb &88,&00,&33,&66,&50,&77,&50,&66,&50,&51
defb &98,&50,&54,&50,&40,&98,&50,&66,&50,&51
defb &98,&33,&98,&51,&BB,&50,&50,&22,&98,&50
defb &11,&66,&00,&77,&00,&66,&00,&11,&88,&00
defb &44,&00,&00,&88,&00,&66,&00,&11,&88,&33
defb &88,&11,&AA,&00,&00,&22,&88,&00,&11,&66
defb &50,&77,&50,&44,&50,&51,&10,&40,&44,&10
defb &40,&98,&50,&22,&50,&40,&98,&33,&98,&51
defb &AA,&10,&50,&11,&98,&50,&11,&66,&00,&66
defb &00,&44,&00,&11,&AA,&00,&00,&11,&88,&00
defb &00,&88,&00,&22,&00,&00,&11,&66,&50,&66
defb &50,&54,&50,&51,&50,&40,&00,&10,&AA,&10
defb &50,&51,&98,&50,&40,&00,&10,&22,&50,&40
defb &11,&CC,&00,&66,&00,&44,&00,&11,&88,&11
defb &88,&00,&EE,&00,&00,&11,&88,&00,&11,&CC
defb &50,&66,&50,&54,&50,&51,&50,&40,&00,&10
defb &40,&00,&10,&22,&50,&40,&98,&51,&98,&40
defb &EE,&10,&50,&51,&98,&50,&00,&50,&50,&50
defb &50,&66,&50,&50,&11,&CC,&50,&66,&50,&54
defb &98,&51,&98,&40,&EE,&10,&50,&51,&98,&50
defb &50,&50,&50,&00,&11,&88,&00,&66,&00,&44
defb &88,&11,&88,&00,&66,&00,&11,&88,&50,&44
defb &50,&54,&40,&00,&10,&50,&50,&40,&98,&40
defb &98,&50,&66,&10,&50,&40,&98,&50,&50,&40
defb &98,&50,&66,&10,&50,&40,&98,&50,&50,&40
defb &10,&50,&22,&10,&00,&10,&50,&40,&00,&10
defb &00,&50,&50,&00,&00,&50,&40,&00,&10,&50
defb &50,&00,&00,&50,&40,&00,&10,&40,&00,&10
defb &50,&50,&00,&10,&50,&40,&50,&50,&40,&10
defb &50,&50,&40,&00,&50,&00,&50,&50,&40,&00
defb &22,&00,&44,&44,&11,&00,&22,&00,&88,&88
defb &11,&00,&11,&00,&44,&44,&11,&00,&22,&00
defb &88,&88,&22,&00,&11,&00,&44,&88,&22,&11
defb &88,&00,&00,&66,&11,&00,&44,&88,&22,&00
defb &00,&88,&66,&88,&44,&22,&00,&11,&00,&88
defb &55,&88,&44,&00,&00,&22,&00,&88,&88,&11
defb &00,&44,&66,&88,&CC,&44,&88,&CC,&55,&88
defb &88,&00,&00,&22,&00,&11,&00,&44,&88,&22
defb &11,&99,&00,&22,&66,&99,&88,&88,&44,&66
defb &55,&99,&00,&22,&66,&11,&00,&44,&88,&22
defb &88,&66,&88,&44,&22,&00,&CC,&11,&77,&33
defb &BB,&00,&11,&00,&22,&22,&00,&88,&44,&11
defb &11,&00,&22,&00,&33,&77,&33,&AA,&00,&CC
defb &11,&00,&88,&55,&88,&44,&44,&66,&88,&CC
defb &44,&00,&33,&88,&BB,&77,&44,&00,&22,&00
defb &00,&88,&22,&22,&00,&88,&44,&11,&11,&00
defb &44,&00,&11,&00,&00,&BB,&BB,&44,&77,&00
defb &00,&88,&CC,&55,&88,&88,&00,&88,&22,&44
defb &11,&00,&DD,&00,&22,&66,&99,&88,&88,&00
defb &00,&FF,&22,&66,&00,&33,&CC,&00,&00,&FF
defb &00,&11,&99,&33,&CC,&00,&00,&44,&66,&55
defb &99,&00,&22,&CC,&22,&00,&99,&00,&44,&00
defb &00,&77,&99,&99,&FF,&CC,&00,&44,&33,&44
defb &22,&11,&00,&CC,&11,&77,&33,&BB,&FF,&EE
defb &66,&77,&88,&00,&00,&33,&77,&33,&AA,&00
defb &CC,&22,&11,&00,&BB,&00,&88,&00,&00,&22
defb &33,&44,&66,&22,&00,&33,&88,&BB,&77,&44
defb &00,&22,&88,&00,&33,&CC,&BB,&BB,&44,&77
defb &00,&11,&11,&88,&FF,&22,&66,&00,&33,&CC
defb &00,&77,&66,&EE,&FF,&FF,&88,&11,&33,&44
defb &CC,&44,&88,&CC,&BB,&22,&00,&44,&00,&33
defb &FF,&DD,&DD,&BB,&88,&00,&FF,&00,&11,&99
defb &33,&CC,&33,&00,&00,&00,&66,&00,&BB,&99
defb &DD,&88,&00,&00,&77,&99,&99,&CC,&00,&11
defb &BB,&FF,&77,&66,&66,&EE,&77,&44,&11,&88
defb &00,&33,&FF,&FF,&FF,&DD,&BB,&BB,&FF,&66
defb &11,&CC,&55,&BB,&AA,&00,&11,&00,&00,&33
defb &CC,&00,&DD,&FF,&BB,&88,&33,&CC,&22,&00
defb &11,&77,&66,&88,&EE,&00,&FF,&00,&77,&77
defb &EE,&CC,&00,&FF,&00,&77,&99,&33,&00,&11
defb &88,&00,&FF,&66,&EE,&FF,&DD,&EE,&00,&AA
defb &55,&99,&BB,&CC,&EE,&00,&11,&CC,&FF,&66
defb &66,&99,&44,&11,&EE,&FF,&DD,&DD,&BB,&CC
defb &00,&66,&00,&33,&22,&77,&88,&00,&00,&33
defb &CC,&CC,&FF,&00,&66,&EE,&FF,&77,&66,&FF
defb &22,&22,&66,&66,&66,&55,&DD,&33,&77,&88
defb &11,&33,&DD,&BB,&BB,&DD,&DD,&88,&33,&CC
defb &CC,&FF,&77,&00,&00,&33,&CC,&00,&11,&EE
defb &00,&DD,&EE,&EE,&00,&33,&CC,&00,&33,&66
defb &BB,&EE,&66,&DD,&AA,&FF,&33,&CC,&FF,&33
defb &DD,&66,&DD,&99,&FF,&55,&BB,&00,&00,&FF
defb &00,&11,&DD,&EE,&CC,&11,&EE,&00,&00,&FF
defb &22,&33,&BB,&77,&77,&DD,&88,&11,&66,&DD
defb &88,&00,&55,&CC,&DD,&CC,&66,&DD,&CC,&77
defb &CC,&FF,&00,&33,&CC,&FF,&88,&EE,&DD,&88
defb &EE,&CC,&EE,&88,&00,&66,&DD,&AA,&00,&66
defb &FF,&BB,&BB,&77,&11,&00,&22,&EE,&66,&11
defb &66,&33,&CC,&00,&FF,&00,&00,&00,&11,&FF
defb &BB,&BB,&77,&00,&00,&BB,&EE,&EE,&66,&00
defb &00,&FF,&11,&AA,&11,&99,&DD,&11,&11,&99
defb &11,&88,&11,&99,&DD,&FF,&44,&00,&33,&BB
defb &77,&77,&EE,&00,&DD,&FF,&11,&EE,&00,&99
defb &88,&DD,&CC,&77,&77,&00,&77,&66,&77,&AA
defb &33,&55,&BB,&00,&99,&00,&EE,&00,&11,&CC
defb &22,&44,&33,&66,&BB,&11,&77,&99,&BB,&88
defb &33,&BB,&88,&EE,&CC,&66,&44,&11,&EE,&33
defb &EE,&CC,&33,&44,&DD,&88,&66,&88,&33,&CC
defb &EE,&00,&DD,&88,&66,&FF,&88,&00,&33,&77
defb &88,&00,&00,&77,&BB,&00,&00,&77,&DD,&88
defb &66,&CC,&11,&FF,&88,&EE,&22,&33,&77,&00
defb &FF,&00,&55,&88,&66,&CC,&BB,&11,&BB,&99
defb &BB,&88,&33,&BB,&11,&11,&CC,&77,&EE,&CC
defb &11,&66,&00,&FF,&10,&40,&00,&00,&33,&99
defb &88,&FF,&DD,&00,&22,&88,&44,&00,&00,&88
defb &55,&00,&22,&FF,&CC,&66,&77,&33,&22,&FF
defb &00,&77,&BB,&33,&BB,&00,&77,&66,&50,&40
defb &00,&00,&00,&33,&CC,&11,&AA,&00,&DD,&DD
defb &BB,&51,&BB,&11,&BB,&88,&66,&66,&00,&DD
defb &00,&11,&CC,&00,&33,&22,&FF,&11,&CC,&11
defb &DD,&EE,&11,&77,&AA,&00,&11,&77,&AA,&11
defb &EE,&EE,&00,&EE,&33,&DD,&33,&00,&88,&77
defb &BB,&33,&BB,&88,&BB,&00,&77,&77,&33,&77
defb &88,&44,&00,&EE,&00,&22,&CC,&11,&99,&99
defb &11,&66,&55,&77,&00,&22,&88,&40,&77,&00
defb &00,&00,&EE,&66,&FF,&40,&EE,&CC,&11,&FF
defb &AA,&CC,&DD,&00,&22,&CC,&DD,&77,&EE,&00
defb &DD,&CC,&33,&DD,&99,&EE,&98,&77,&77,&11
defb &DD,&98,&50,&40,&00,&00,&33,&88,&40,&55
defb &10,&33,&AA,&99,&AA,&51,&BB,&11,&BB,&40
defb &66,&EE,&33,&BB,&88,&55,&11,&AA,&33,&33
defb &88,&11,&66,&00,&00,&CC,&EE,&66,&FF,&11
defb &77,&BB,&22,&77,&AA,&88,&55,&00,&22,&88
defb &55,&77,&99,&33,&77,&AA,&33,&DD,&99,&EE
defb &CC,&77,&BB,&00,&DD,&CC,&CC,&00,&11,&AA
defb &00,&77,&33,&11,&66,&11,&BB,&11,&BB,&00
defb &EE,&CC,&33,&77,&88,&DD,&51,&AA,&33,&BB
defb &CC,&40,&99,&10,&40,&33,&00,&00,&CC,&66
defb &FF,&33,&88,&44,&33,&99,&AA,&88,&55,&00
defb &22,&88,&55,&66,&77,&00,&88,&77,&33,&DD
defb &88,&EE,&DC,&77,&BB,&88,&EE,&DC,&50,&40
defb &00,&33,&10,&50,&22,&44,&40,&FF,&77,&11
defb &66,&51,&BB,&11,&BB,&40,&DD,&DC,&77,&77
defb &88,&DD,&11,&BB,&11,&99,&EE,&00,&66,&88
defb &CC,&DD,&EE,&33,&77,&88,&11,&DD,&22,&CC
defb &DD,&00,&22,&CC,&DD,&22,&EE,&00,&77,&BB
defb &11,&EE,&CC,&FF,&44,&33,&BB,&88,&EE,&CC
defb &00,&CC,&00,&00,&55,&88,&11,&EE,&66,&33
defb &66,&11,&BB,&11,&BB,&00,&DD,&CC,&77,&77
defb &00,&BB,&DD,&50,&77,&77,&51,&EE,&CC,&FF
defb &66,&33,&DD,&88,&EE,&DC,&33,&77,&33,&66
defb &51,&BB,&51,&88,&EE,&50,&11,&CC,&50,&40
defb &22,&00,&66,&33,&66,&51,&BB,&33,&BB,&40
defb &DD,&DC,&66,&FF,&51,&BB,&CC,&DD,&EE,&33
defb &BB,&98,&22,&FF,&11,&77,&AA,&00,&11,&77
defb &AA,&33,&50,&40,&11,&00,&10,&40,&EE,&10
defb &11,&CC,&00,&88,&44,&44,&33,&00,&77,&77
defb &11,&EE,&EE,&77,&66,&11,&DD,&88,&EE,&CC
defb &33,&BB,&11,&66,&00,&BB,&11,&88,&77,&00
defb &00,&66,&88,&00,&33,&88,&66,&33,&44,&11
defb &AA,&33,&77,&00,&DD,&CC,&66,&EE,&11,&BB
defb &99,&DD,&EE,&33,&BB,&88,&33,&00,&88,&88
defb &44,&00,&BB,&50,&77,&77,&51,&EE,&EE,&77
defb &66,&51,&DD,&88,&EE,&CC,&33,&BB,&11,&BB
defb &44,&DD,&51,&DC,&33,&98,&50,&33,&10,&40
defb &00,&00,&EE,&22,&CC,&BB,&66,&33,&77,&40
defb &DD,&DC,&66,&EE,&51,&BB,&99,&DD,&EE,&33
defb &BB,&98,&33,&77,&88,&77,&98,&00,&00,&77
defb &88,&77,&50,&40,&00,&00,&10,&33,&10,&40
defb &77,&00,&44,&DD,&00,&CC,&11,&CC,&00,&11
defb &88,&00,&22,&77,&BB,&00,&77,&77,&00,&EE
defb &EE,&33,&66,&11,&DD,&88,&77,&66,&EE,&00
defb &CC,&22,&CC,&BB,&66,&33,&66,&11,&BB,&88
defb &66,&EE,&11,&BB,&11,&DD,&CC,&33,&BB,&88
defb &33,&77,&99,&00,&BB,&50,&77,&77,&40,&EE
defb &EE,&33,&66,&51,&DD,&98,&77,&66,&51,&BB
defb &11,&BB,&44,&DD,&88,&DC,&40,&EE,&50,&40
defb &44,&40,&00,&00,&DC,&66,&CC,&BB,&66,&33
defb &66,&51,&BB,&88,&66,&EE,&11,&BB,&51,&DD
defb &DC,&33,&BB,&98,&33,&77,&99,&BB,&50,&00
defb &00,&33,&66,&77,&50,&40,&00,&00,&00,&88
defb &50,&11,&CC,&40,&44,&55,&88,&CC,&00,&77
defb &CC,&33,&77,&88,&33,&77,&99,&BB,&00,&00
defb &00,&33,&66,&77,&BB,&00,&77,&BB,&00,&FF
defb &66,&33,&77,&11,&DD,&CC,&77,&66,&11,&00
defb &00,&33,&88,&00,&CC,&66,&88,&BB,&66,&33
defb &66,&11,&BB,&88,&EE,&EE,&33,&BB,&BB,&50
defb &77,&BB,&40,&FF,&66,&33,&BB,&51,&EE,&DC
defb &33,&AA,&40,&DD,&11,&BB,&54,&55,&88,&54
defb &50,&11,&10,&50,&11,&40,&00,&00,&98,&66
defb &88,&BB,&66,&22,&CC,&11,&77,&00,&DD,&EE
defb &33,&77,&51,&BB,&DC,&33,&77,&98,&33,&77
defb &99,&BB,&50,&00,&00,&33,&66,&77,&50,&40
defb &00,&00,&22,&50,&50,&22,&10,&40,&00,&11
defb &AA,&77,&BB,&00,&77,&BB,&00,&77,&66,&33
defb &BB,&00,&EE,&CC,&33,&BB,&00,&DD,&99,&DD
defb &44,&66,&88,&44,&88,&55,&88,&AA,&EE,&66
defb &CC,&33,&77,&00,&DD,&CC,&33,&77,&11,&BB
defb &88,&33,&77,&88,&33,&77,&99,&66,&BB,&98
defb &77,&BB,&50,&77,&66,&33,&BB,&88,&EE,&CC
defb &33,&BB,&40,&66,&88,&22,&98,&66,&98,&22
defb &50,&40,&44,&50,&50,&40,&00,&00,&10,&55
defb &88,&55,&00,&55,&98,&33,&77,&40,&DD,&DC
defb &77,&77,&11,&BB,&98,&33,&77,&98,&77,&77
defb &BB,&66,&50,&00,&00,&51,&BB,&77,&50,&40
defb &00,&00,&10,&50,&40,&98,&50,&51,&BB,&33
defb &DD,&88,&33,&BB,&00,&77,&BB,&11,&BB,&88
defb &77,&66,&11,&DD,&00,&66,&88,&22,&88,&66
defb &88,&22,&11,&00,&00,&11,&00,&55,&88,&55
defb &00,&55,&88,&22,&EE,&11,&BB,&88,&77,&66
defb &33,&77,&88,&33,&77,&00,&66,&FF,&33,&44
defb &11,&50,&50,&40,&00,&00,&22,&DC,&50,&00
defb &00,&40,&DD,&33,&DD,&98,&33,&BB,&10,&33
defb &BB,&11,&DD,&98,&77,&66,&51,&DD,&98,&66
defb &CC,&22,&98,&66,&98,&22,&00,&00,&10,&50
defb &22,&50,&50,&11,&50,&55,&98,&55,&00,&DD
defb &98,&66,&EE,&51,&BB,&98,&66,&EE,&33,&77
defb &10,&33,&77,&50,&66,&FF,&55,&BB,&DD,&88
defb &33,&DD,&88,&33,&BB,&11,&DD,&88,&77,&66
defb &00,&EE,&88,&33,&44,&22,&88,&66,&88,&33
defb &00,&33,&00,&55,&88,&55,&00,&BB,&00,&55
defb &CC,&11,&BB,&88,&66,&EE,&33,&77,&00,&66
defb &FF,&00,&66,&FF,&66,&88,&66,&98,&50,&00
defb &00,&50,&55,&99,&DD,&98,&33,&DD,&98,&33
defb &DD,&88,&DD,&98,&77,&66,&40,&66,&98,&33
defb &44,&22,&98,&22,&98,&11,&50,&22,&50,&55
defb &10,&55,&00,&BB,&50,&55,&98,&51,&BB,&98
defb &66,&CC,&66,&FF,&10,&66,&FF,&50,&66,&EE
defb &33,&66,&00,&66,&88,&33,&44,&22,&88,&22
defb &88,&11,&00,&BB,&00,&55,&88,&11,&BB,&00
defb &66,&CC,&66,&EE,&00,&66,&EE,&00,&66,&EE
defb &55,&00,&50,&00,&00,&50,&22,&99,&DD,&98
defb &51,&DD,&98,&11,&DD,&88,&DD,&DC,&33,&66
defb &50,&66,&DC,&33,&44,&11,&98,&33,&98,&40
defb &98,&50,&50,&44,&50,&77,&50,&66,&00,&BB
defb &40,&DD,&98,&11,&BB,&40,&EE,&CC,&66,&EE
defb &00,&66,&EE,&50,&66,&EE,&55,&50,&11,&99
defb &DD,&88,&11,&EE,&CC,&11,&DD,&CC,&66,&CC
defb &11,&BB,&00,&22,&CC,&11,&44,&11,&88,&33
defb &00,&44,&00,&77,&00,&66,&00,&AA,&00,&DD
defb &00,&33,&66,&00,&DD,&88,&EE,&EE,&00,&DD
defb &EE,&00,&66,&EE,&66,&00,&50,&00,&00,&50
defb &51,&88,&DD,&DC,&40,&EE,&DC,&00,&EE,&DC
defb &66,&DC,&51,&BB,&50,&22,&DC,&51,&44,&11
defb &98,&33,&98,&40,&98,&50,&50,&54,&50,&77
defb &50,&66,&00,&AA,&40,&DD,&50,&33,&66,&40
defb &DD,&88,&DD,&CC,&00,&DD,&CC,&40,&EE,&CC
defb &66,&50,&00,&88,&EE,&CC,&00,&EE,&CC,&00
defb &EE,&CC,&66,&CC,&11,&BB,&00,&22,&CC,&11
defb &44,&33,&00,&33,&00,&44,&00,&77,&00,&33
defb &00,&AA,&00,&DD,&00,&33,&66,&00,&DD,&88
defb &DD,&CC,&00,&DD,&CC,&00,&DD,&CC,&44,&00
defb &50,&00,&00,&50,&40,&88,&EE,&CC,&40,&FF
defb &66,&00,&EE,&DC,&66,&DC,&51,&BB,&98,&22
defb &DC,&51,&44,&33,&50,&33,&98,&40,&10,&50
defb &50,&10,&50,&77,&50,&33,&00,&AA,&40,&DD
defb &50,&77,&66,&40,&DD,&88,&DD,&CC,&11,&BB
defb &DC,&40,&DD,&DC,&54,&50,&00,&88,&EE,&EE
defb &00,&77,&66,&00,&EE,&CC,&22,&CC,&11,&BB
defb &88,&22,&CC,&11,&44,&33,&00,&33,&88,&00
defb &00,&77,&00,&33,&00,&AA,&00,&DD,&00,&77
defb &66,&00,&DD,&00,&DD,&CC,&11,&BB,&88,&11
defb &DD,&CC,&44,&00,&54,&50,&50,&00,&00,&50
defb &40,&88,&66,&EE,&50,&77,&66,&00,&FF,&66
defb &33,&54,&40,&BB,&98,&22,&DC,&51,&44,&11
defb &50,&11,&10,&50,&00,&AA,&40,&DD,&50,&77
defb &44,&40,&BB,&51,&BB,&CC,&11,&BB,&98,&51
defb &DD,&98,&00,&88,&66,&EE,&00,&77,&66,&00
defb &77,&66,&33,&44,&00,&DD,&88,&22,&CC,&11
defb &44,&11,&00,&11,&00,&AA,&00,&DD,&00,&66
defb &CC,&00,&BB,&11,&BB,&88,&11,&BB,&88,&11
defb &DD,&88,&44,&00,&BB,&98,&10,&50,&50,&00
defb &00,&50,&40,&10,&77,&66,&50,&77,&66,&00
defb &77,&66,&33,&54,&40,&DD,&98,&22,&98,&51
defb &44,&11,&50,&51,&00,&AA,&40,&55,&50,&66
defb &DC,&40,&BB,&51,&BB,&88,&11,&BB,&98,&51
defb &33,&66,&00,&33,&BB,&00,&77,&66,&33,&44
defb &00,&DD,&88,&22,&88,&00,&CC,&11,&00,&11
defb &00,&CC,&00,&55,&00,&66,&CC,&00,&BB,&11
defb &BB,&88,&33,&77,&00,&11,&BB,&00,&33,&66
defb &50,&33,&BB,&00,&33,&AA,&33,&54,&40,&DD
defb &98,&22,&98,&40,&CC,&11,&50,&51,&00,&CC
defb &50,&55,&50,&66,&DC,&40,&BB,&51,&77,&00
defb &33,&77,&50,&51,&BB,&50,&33,&66,&00,&33
defb &BB,&00,&33,&AA,&11,&44,&00,&DD,&00,&22
defb &88,&00,&CC,&11,&00,&22,&00,&CC,&00,&55
defb &00,&22,&CC,&00,&AA,&11,&77,&00,&33,&77
defb &00,&11,&BB,&00,&33,&66,&50,&33,&BB,&88
defb &11,&AA,&51,&54,&40,&DD,&50,&22,&98,&40
defb &CC,&11,&50,&22,&00,&CC,&50,&55,&50,&22
defb &DC,&40,&AA,&51,&66,&00,&77,&77,&50,&51
defb &BB,&50,&11,&66,&00,&11,&BB,&88,&11,&AA
defb &11,&44,&00,&FF,&00,&33,&CC,&00,&AA,&11
defb &66,&00,&77,&66,&00,&11,&AA,&00,&51,&66
defb &50,&51,&BB,&88,&11,&AA,&51,&98,&40,&FF
defb &50,&33,&50,&40,&88,&11,&DC,&40,&66,&51
defb &66,&00,&77,&66,&50,&51,&AA,&50,&11,&66
defb &00,&11,&BB,&88,&11,&AA,&11,&88,&00,&77
defb &00,&33,&88,&00,&66,&11,&66,&00,&77,&66
defb &00,&11,&AA,&00,&51,&44,&50,&40,&DD,&88
defb &11,&66,&51,&98,&50,&66,&50,&33,&98,&40
defb &88,&00,&50,&40,&00,&44,&50,&77,&50,&11
defb &98,&50,&66,&51,&AA,&00,&66,&CC,&50,&40
defb &AA,&50,&11,&44,&00,&00,&DD,&88,&11,&44
defb &11,&88,&00,&66,&00,&33,&00,&44,&00,&77
defb &00,&11,&88,&00,&66,&00,&AA,&00,&51,&54
defb &50,&40,&DD,&88,&11,&54,&51,&98,&50,&66
defb &50,&11,&98,&40,&00,&00,&50,&40,&00,&00
defb &50,&66,&50,&51,&98,&50,&66,&40,&AA,&00
defb &66,&DC,&50,&40,&AA,&50,&DD,&88,&11,&CC
defb &11,&88,&00,&66,&00,&11,&88,&00,&00,&66
defb &00,&11,&88,&00,&66,&00,&EE,&00,&66,&CC
defb &11,&54,&50,&40,&DD,&98,&51,&DC,&51,&98
defb &40,&66,&50,&11,&10,&50,&00,&00,&50,&40
defb &00,&00,&50,&22,&50,&51,&98,&50,&66,&40
defb &EE,&50,&66,&DC,&50,&40,&AA,&50,&BB,&00
defb &11,&88,&11,&00,&00,&CC,&00,&22,&CC,&00
defb &22,&00,&66,&00,&33,&44,&22,&98,&50,&40
defb &BB,&50,&51,&98,&51,&50,&40,&DC,&50,&22
defb &50,&51,&50,&40,&DC,&50,&22,&50,&66,&50
defb &33,&54,&33,&10,&50,&40,&BB,&00,&51,&98
defb &22,&50,&40,&98,&50,&22,&00,&10,&50,&51
defb &50,&40,&54,&50,&11,&50,&66,&50,&33,&54
defb &BB,&00,&11,&00,&22,&00,&00,&88,&00,&22
defb &44,&00,&11,&00,&22,&00,&33,&44,&33,&50
defb &50,&40,&BB,&00,&51,&50,&22,&50,&40,&98
defb &50,&00,&00,&10,&40,&00,&10,&50,&54,&50
defb &51,&50,&22,&50,&33,&54,&EE,&00,&11,&00
defb &22,&00,&00,&88,&44,&00,&11,&00,&22,&00
defb &11,&CC,&33,&50,&50,&40,&EE,&00,&33,&50
defb &22,&50,&40,&98,&50,&40,&00,&10,&40,&00
defb &10,&50,&54,&50,&51,&50,&33,&50,&33,&00
defb &00,&00,&EE,&00,&40,&10,&50,&40,&00,&10
defb &11,&DC,&50,&50,&33,&50,&50,&50,&50,&00
defb &00,&50,&50,&50,&33,&50,&50,&40,&EE,&00
defb &00,&DC,&50,&50,&51,&50,&50,&50,&50,&00
defb &00,&50,&50,&50,&40,&00,&10,&50,&50,&50
defb &44,&50,&50,&51,&88,&00,&44,&50,&44,&00
defb &00,&11,&88,&00,&44,&00,&54,&50,&50,&51
defb &88,&00,&54,&50,&50,&51,&00,&00,&10,&50
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


LevelEnd:
list
defb 0
save direct "T31-SC6.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]