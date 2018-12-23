read "..\CoreDefs.asm" ;read "BootStrap.asm"
nolist
org &4000
jp PicWingsComplete4bmp
jp PicWingsComplete5bmp

PicWingsComplete4bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete4bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete4bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicWingsComplete4bmp_Line_1:
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


PicWingsComplete4bmp_Line_5:
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


PicWingsComplete4bmp_Line_7:
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


PicWingsComplete4bmp_Line_9:
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


PicWingsComplete4bmp_Line_11:
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


PicWingsComplete4bmp_Line_13:
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


PicWingsComplete4bmp_Line_15:
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


PicWingsComplete4bmp_Line_17:
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


PicWingsComplete4bmp_Line_23:
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


PicWingsComplete4bmp_Line_25:
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


PicWingsComplete4bmp_Line_27:
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


PicWingsComplete4bmp_Line_29:
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


PicWingsComplete4bmp_Line_31:
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


PicWingsComplete4bmp_Line_33:
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


PicWingsComplete4bmp_Line_35:
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


PicWingsComplete4bmp_Line_37:
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


PicWingsComplete4bmp_Line_39:
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


PicWingsComplete4bmp_Line_41:
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


PicWingsComplete4bmp_Line_43:
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


PicWingsComplete4bmp_Line_45:
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


PicWingsComplete4bmp_Line_46:
jp MultiPushDeLast40


PicWingsComplete4bmp_Line_47:
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


PicWingsComplete4bmp_Line_46_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_46
PicWingsComplete4bmp_Line_49:
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


PicWingsComplete4bmp_Line_51:
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


PicWingsComplete4bmp_Line_53:
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


PicWingsComplete4bmp_Line_64:
call MultiPushDe11
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
call MultiPushDe11
LD HL,&2200
  Push HL
  PUSH DE
LD BC,&0044
  Push BC
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_65:
call MultiPushDe10
LD HL,&0022
  Push HL
LD BC,&8888
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
Ld B,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&44
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&2200
  Push BC
  PUSH DE
Ld L,&44
  Push HL
LD BC,&0011
  Push BC
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_66:
call MultiPushDe10
LD HL,&0044
  Push HL
LD BC,&8888
  Push BC
Ld E,&22
  PUSH DE
  PUSH DE
LD HL,&1111
  Push HL
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+77
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_67:
call MultiPushDe10
call BitmapPush10
defw BitmapData+87
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+99
jp MultiPushDeLast9


PicWingsComplete4bmp_Line_68:
call MultiPushDe10
call BitmapPush10
defw BitmapData+109
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+119
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_69:
call MultiPushDe10
call BitmapPush10
defw BitmapData+129
  PUSH DE
LD HL,&0044
  Push HL
  PUSH DE
LD BC,&6600
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+135
  PUSH DE
call BitmapPush10
defw BitmapData+145
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_70:
call MultiPushDe10
call BitmapPush14
defw BitmapData+159
  PUSH DE
LD HL,&EE00
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+171
  PUSH DE
LD BC,&3355
  Push BC
LD HL,&DD11
  Push HL
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_71:
call MultiPushDe11
LD HL,&11AA
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+183
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+195
  PUSH DE
LD BC,&4411
  Push BC
LD HL,&2200
  Push HL
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_72:
call MultiPushDe10
call BitmapPush18
defw BitmapData+213
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+231
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_73:
call MultiPushDe11
LD HL,&EE11
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+243
  PUSH DE
  PUSH DE
LD BC,&00FF
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+257
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_74:
call MultiPushDe8
call BitmapPush14
defw BitmapData+271
  PUSH DE
call BitmapPush6
defw BitmapData+277
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+299
jp MultiPushDeLast8


PicWingsComplete4bmp_Line_75:
call MultiPushDe9
call BitmapPush12
defw BitmapData+311
  PUSH DE
call BitmapPush6
defw BitmapData+317
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+337
jp MultiPushDeLast9


PicWingsComplete4bmp_Line_76:
call MultiPushDe10
call BitmapPush18
defw BitmapData+355
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+373
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_77:
call MultiPushDe11
call BitmapPush16
defw BitmapData+389
  PUSH DE
  PUSH DE
LD HL,&CC33
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+403
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_78:
call MultiPushDe10
LD HL,&0077
  Push HL
LD BC,&1133
  Push BC
LD DE,&2244
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+433
LD HL,&AA33
  Push HL
LD DE,&0000
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe7
call BitmapPush18
defw BitmapData+451
  PUSH DE
  PUSH DE
LD HL,&8811
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+465
call MultiPushDe7
LD BC,&4050
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicWingsComplete4bmp_Line_80:
LD DE,&0000
call MultiPushDe9
call BitmapPush30
defw BitmapData+495
call BitmapPush14
defw BitmapData+509
jp MultiPushDeLast9


PicWingsComplete4bmp_Line_81:
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
call BitmapPush30
defw BitmapData+539
call BitmapPush16
defw BitmapData+555
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_82:
LD DE,&0000
call MultiPushDe9
call BitmapPush30
defw BitmapData+591
call BitmapPush14
defw BitmapData+605
jp MultiPushDeLast9


PicWingsComplete4bmp_Line_83:
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
call BitmapPush30
defw BitmapData+635
call BitmapPush16
defw BitmapData+651
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_84:
LD DE,&0000
call MultiPushDe10
call BitmapPush30
defw BitmapData+681
call BitmapPush10
defw BitmapData+691
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_85:
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
call BitmapPush30
defw BitmapData+721
call BitmapPush16
defw BitmapData+737
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_86:
LD DE,&0000
call MultiPushDe10
call BitmapPush30
defw BitmapData+767
call BitmapPush12
defw BitmapData+779
jp MultiPushDeLast9


PicWingsComplete4bmp_Line_87:
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
call BitmapPush30
defw BitmapData+809
call BitmapPush16
defw BitmapData+825
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_88:
LD DE,&0000
call MultiPushDe11
call BitmapPush30
defw BitmapData+855
call BitmapPush8
defw BitmapData+863
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_89:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+893
call BitmapPush12
defw BitmapData+905
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_90:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+921
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+939
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_91:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+969
call BitmapPush12
defw BitmapData+981
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_92:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+997
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1015
jp MultiPushDeLast10


PicWingsComplete4bmp_Line_93:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1045
call BitmapPush12
defw BitmapData+1057
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_94:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+1073
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1089
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_95:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1119
call BitmapPush12
defw BitmapData+1131
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_96:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+1147
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1163
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_97:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1193
call BitmapPush12
defw BitmapData+1205
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_98:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+1221
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1237
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_99:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1267
call BitmapPush12
defw BitmapData+1279
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_100:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+1295
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1311
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_101:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1341
call BitmapPush6
defw BitmapData+1301
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_102:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+1357
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1373
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_103:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1403
call BitmapPush6
defw BitmapData+1409
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_104:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+1425
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1441
jp MultiPushDeLast11


PicWingsComplete4bmp_Line_105:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+1471
call BitmapPush6
defw BitmapData+1477
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_106:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+1491
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1505
jp MultiPushDeLast12


PicWingsComplete4bmp_Line_107:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1535
LD HL,&22DC
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
LD HL,&0000
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_108:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+1549
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1563
jp MultiPushDeLast12


PicWingsComplete4bmp_Line_109:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1593
LD HL,&00DC
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
Ld L,&00
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_110:
LD DE,&0000
call MultiPushDe12
call BitmapPush12
defw BitmapData+1605
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1617
jp MultiPushDeLast12


PicWingsComplete4bmp_Line_111:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1629
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+1643
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_112:
LD DE,&0000
call MultiPushDe12
call BitmapPush12
defw BitmapData+1655
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1667
jp MultiPushDeLast12


PicWingsComplete4bmp_Line_113:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1679
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+1693
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_114:
LD DE,&0000
call MultiPushDe12
call BitmapPush12
defw BitmapData+1705
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1717
jp MultiPushDeLast12


PicWingsComplete4bmp_Line_115:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1729
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+1743
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_116:
LD DE,&0000
call MultiPushDe13
call BitmapPush10
defw BitmapData+1753
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1763
jp MultiPushDeLast13


PicWingsComplete4bmp_Line_117:
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
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1773
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1783
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_118:
LD DE,&0000
call MultiPushDe13
Ld E,&88
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1789
Call PushDE_0000x
call BitmapPush6
defw BitmapData+1795
Ld D,&44
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast13


PicWingsComplete4bmp_Line_119:
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
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1805
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1815
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_120:
LD DE,&0000
call MultiPushDe14
LD HL,&0088
  Push HL
  PUSH DE
LD BC,&8855
  Push BC
LD HL,&6600
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
LD HL,&9966
  Push HL
  PUSH DE
LD BC,&4400
  Push BC
jp MultiPushDeLast14


PicWingsComplete4bmp_Line_121:
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
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1823
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&1122
  Push BC
  PUSH DE
LD HL,&1050
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_122:
LD DE,&0000
call MultiPushDe16
LD HL,&0011
  Push HL
LD BC,&2200
  Push BC
call MultiPushDe5
LD HL,&1122
  Push HL
jp MultiPushDeLast16


PicWingsComplete4bmp_Line_123:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
call MultiPushDe11
LD HL,&5051
  Push HL
Ld B,&22
  Push BC
call MultiPushDe5
LD HL,&5122
  Push HL
call MultiPushDe11
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete4bmp_Line_125:
LD DE,&5050
call MultiPushDe10
LD HL,&1000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1829
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
LD HL,&5122
  Push HL
LD BC,&1000
  Push BC
jp MultiPushDeLast15


PicWingsComplete4bmp_Line_126:
LD DE,&0000
call MultiPushDe16
LD HL,&0011
  Push HL
call MultiPushDe6
LD BC,&0022
  Push BC
jp MultiPushDeLast16


PicWingsComplete4bmp_Line_127:
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
Ld H,&10
  Push HL
Ld B,&40
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
LD BC,&5040
  Push BC
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  Push HL 
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
jp MultiPushDeLast5


PicWingsComplete4bmp_Line_129:
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
Ld H,&10
  Push HL
Ld B,&40
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
Ld H,E
Ld L,B

  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
jp MultiPushDeLast5


PicWingsComplete4bmp_Line_131:
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


PicWingsComplete4bmp_Line_131_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_131
PicWingsComplete4bmp_Line_151:
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


PicWingsComplete4bmp_Line_153:
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
defw BitmapData+1835
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


PicWingsComplete4bmp_Line_155:
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


PicWingsComplete4bmp_Line_157:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1841
LD DE,&0000
call MultiPushDe24
call BitmapPush6
defw BitmapData+1847
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
 jp NextLinePushBC 


PicWingsComplete4bmp_Line_159:
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


PicWingsComplete4bmp_Line_161:
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


PicWingsComplete4bmp_Line_163:
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


PicWingsComplete4bmp_Line_165:
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


PicWingsComplete4bmp_Line_167:
call MultiPushDe16
LD DE,&5050
call MultiPushDe8
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast15


PicWingsComplete4bmp_Line_169:
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
defw BitmapData+1853
jp MultiPushDeLast8


PicWingsComplete4bmp_Line_171:
call MultiPushDe8
call BitmapPush8
defw BitmapData+1861
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
defw BitmapData+1869
jp MultiPushDeLast8


PicWingsComplete4bmp_Line_173:
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


PicWingsComplete4bmp_Line_175:
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


PicWingsComplete4bmp_Line_175_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_175
PicWingsComplete4bmp_Line_179:
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


PicWingsComplete4bmp_Line_181:
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


PicWingsComplete4bmp_Line_183:
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


PicWingsComplete4bmp_Line_185:
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
defw BitmapData+1875
LD DE,&5050
call MultiPushDe11
LD HL,&5000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete4bmp_Line_187:
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


PicWingsComplete4bmp_Line_189:
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


PicWingsComplete4bmp_Line_191:
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe36
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 



PicWingsComplete4bmp_DrawOrder: 

  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_5
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_7
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_9
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_11
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_13
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_15
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_17
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_23
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_25
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_27
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_29
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_31
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_33
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_35
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_37
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_39
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_41
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_43
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_45
  DEFW PicWingsComplete4bmp_Line_46
  DEFW PicWingsComplete4bmp_Line_47
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_49
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_51
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_53
defw looper
  DEFB 1,10
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_64
  DEFW PicWingsComplete4bmp_Line_65
  DEFW PicWingsComplete4bmp_Line_66
  DEFW PicWingsComplete4bmp_Line_67
  DEFW PicWingsComplete4bmp_Line_68
  DEFW PicWingsComplete4bmp_Line_69
  DEFW PicWingsComplete4bmp_Line_70
  DEFW PicWingsComplete4bmp_Line_71
  DEFW PicWingsComplete4bmp_Line_72
  DEFW PicWingsComplete4bmp_Line_73
  DEFW PicWingsComplete4bmp_Line_74
  DEFW PicWingsComplete4bmp_Line_75
  DEFW PicWingsComplete4bmp_Line_76
  DEFW PicWingsComplete4bmp_Line_77
  DEFW PicWingsComplete4bmp_Line_78
  DEFW PicWingsComplete4bmp_Line_79
  DEFW PicWingsComplete4bmp_Line_80
  DEFW PicWingsComplete4bmp_Line_81
  DEFW PicWingsComplete4bmp_Line_82
  DEFW PicWingsComplete4bmp_Line_83
  DEFW PicWingsComplete4bmp_Line_84
  DEFW PicWingsComplete4bmp_Line_85
  DEFW PicWingsComplete4bmp_Line_86
  DEFW PicWingsComplete4bmp_Line_87
  DEFW PicWingsComplete4bmp_Line_88
  DEFW PicWingsComplete4bmp_Line_89
  DEFW PicWingsComplete4bmp_Line_90
  DEFW PicWingsComplete4bmp_Line_91
  DEFW PicWingsComplete4bmp_Line_92
  DEFW PicWingsComplete4bmp_Line_93
  DEFW PicWingsComplete4bmp_Line_94
  DEFW PicWingsComplete4bmp_Line_95
  DEFW PicWingsComplete4bmp_Line_96
  DEFW PicWingsComplete4bmp_Line_97
  DEFW PicWingsComplete4bmp_Line_98
  DEFW PicWingsComplete4bmp_Line_99
  DEFW PicWingsComplete4bmp_Line_100
  DEFW PicWingsComplete4bmp_Line_101
  DEFW PicWingsComplete4bmp_Line_102
  DEFW PicWingsComplete4bmp_Line_103
  DEFW PicWingsComplete4bmp_Line_104
  DEFW PicWingsComplete4bmp_Line_105
  DEFW PicWingsComplete4bmp_Line_106
  DEFW PicWingsComplete4bmp_Line_107
  DEFW PicWingsComplete4bmp_Line_108
  DEFW PicWingsComplete4bmp_Line_109
  DEFW PicWingsComplete4bmp_Line_110
  DEFW PicWingsComplete4bmp_Line_111
  DEFW PicWingsComplete4bmp_Line_112
  DEFW PicWingsComplete4bmp_Line_113
  DEFW PicWingsComplete4bmp_Line_114
  DEFW PicWingsComplete4bmp_Line_115
  DEFW PicWingsComplete4bmp_Line_116
  DEFW PicWingsComplete4bmp_Line_117
  DEFW PicWingsComplete4bmp_Line_118
  DEFW PicWingsComplete4bmp_Line_119
  DEFW PicWingsComplete4bmp_Line_120
  DEFW PicWingsComplete4bmp_Line_121
  DEFW PicWingsComplete4bmp_Line_122
  DEFW PicWingsComplete4bmp_Line_123
  DEFW PicWingsComplete4bmp_Line_122
  DEFW PicWingsComplete4bmp_Line_125
  DEFW PicWingsComplete4bmp_Line_126
  DEFW PicWingsComplete4bmp_Line_127
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_129
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_151
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_153
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_155
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_157
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_159
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_161
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_163
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_165
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_167
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_169
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_171
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_173
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_175
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_175_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_179
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_181
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_183
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_185
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_187
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_189
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW EndCode
PicWingsComplete5bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete5bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete4bmp_Line_45_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_45
PicWingsComplete4bmp_Line_47_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_47
PicWingsComplete4bmp_Line_49_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_49
PicWingsComplete4bmp_Line_51_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_51
PicWingsComplete4bmp_Line_53_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_53
PicWingsComplete5bmp_Line_64:
call MultiPushDe9
LD HL,&0044
  Push HL
call MultiPushDe20
LD BC,&8800
  Push BC
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_65:
call MultiPushDe9
LD HL,&2244
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
Ld H,C
Ld L,E

  Push HL
call MultiPushDe13
LD BC,&2200
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1881
jp MultiPushDeLast8


PicWingsComplete5bmp_Line_66:
call MultiPushDe9
LD HL,&4444
  Push HL
LD BC,&8800
  Push BC
  PUSH DE
  Push BC
LD HL,&1122
  Push HL
call MultiPushDe12
LD BC,&0011
  Push BC
LD HL,&2244
  Push HL
  PUSH DE

Ld C,L

  Push BC
LD HL,&8888
  Push HL
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_67:
call MultiPushDe8
call BitmapPush6
defw BitmapData+1887
  PUSH DE
LD HL,&0011
  Push HL
Ld B,L
Ld C,L

  Push BC
call MultiPushDe12
LD HL,&0022
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1893
jp MultiPushDeLast8


PicWingsComplete5bmp_Line_68:
call MultiPushDe9
LD HL,&9944
  Push HL
LD BC,&2222
  Push BC
  PUSH DE
LD HL,&1122
  Push HL
LD BC,&9988
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0022
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1899
call BitmapPush6
defw BitmapData+1905
jp MultiPushDeLast8


PicWingsComplete5bmp_Line_69:
call MultiPushDe9
LD HL,&2255
  Push HL
LD BC,&1111
  Push BC
  PUSH DE
Ld L,&22
  Push HL
LD BC,&9944
  Push BC
  PUSH DE
  PUSH DE
Ld L,&00
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+1917
jp MultiPushDeLast8


PicWingsComplete5bmp_Line_70:
call MultiPushDe9
LD HL,&4400
  Push HL
LD BC,&8800
  Push BC
  PUSH DE
Ld L,&44
  Push HL
LD BC,&5522
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1923
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1929
  PUSH DE
LD HL,&0099
  Push HL
LD BC,&AA88
  Push BC
  PUSH DE
Ld L,&44
  Push HL
Ld B,&00
  Push BC
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_71:
call MultiPushDe9
LD HL,&88CC
  Push HL
LD BC,&4400
  Push BC
  PUSH DE
Ld L,&00
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1935
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1941
  PUSH DE
LD HL,&0022
  Push HL
LD BC,&0044
  Push BC
  PUSH DE
Ld L,&88
  Push HL
Ld B,&CC
  Push BC
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_72:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1947
  PUSH DE
  PUSH DE
LD HL,&00EE
  Push HL
LD BC,&1100
  Push BC
  PUSH DE
Ld L,&99
  Push HL
Ld B,L


  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+1955
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1967
  PUSH DE
  PUSH DE
LD HL,&EE11
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FFFF
  Push BC
Ld H,&FF
  Push HL
 jp NextLinePushDe4


PicWingsComplete5bmp_Line_73:
call MultiPushDe6
LD HL,&CCFF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1987
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1993
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2001
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
INC DE

jp MultiPushDeLast6


PicWingsComplete5bmp_Line_74:
call MultiPushDe8
call BitmapPush12
defw BitmapData+2013
  PUSH DE
LD HL,&8888
  Push HL
LD BC,&AA44
  Push BC
  PUSH DE
LD HL,&7700
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2021
  PUSH DE
call BitmapPush14
defw BitmapData+2035
jp MultiPushDeLast7


PicWingsComplete5bmp_Line_75:
call MultiPushDe9
call BitmapPush16
defw BitmapData+2051
  PUSH DE
LD HL,&FF00
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2067
  PUSH DE
LD BC,&EE11
  Push BC
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_76:
call MultiPushDe8
call BitmapPush18
defw BitmapData+2085
  PUSH DE
LD HL,&EE11
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2099
  PUSH DE
call BitmapPush8
defw BitmapData+2107
jp MultiPushDeLast7


PicWingsComplete5bmp_Line_77:
call MultiPushDe7
call BitmapPush20
defw BitmapData+2127
  PUSH DE
LD HL,&EE33
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2153
jp MultiPushDeLast6


PicWingsComplete5bmp_Line_78:
call MultiPushDe6
call BitmapPush16
defw BitmapData+2169
  PUSH DE
LD HL,&FFDD
  Push HL
LD BC,&DDEE
  Push BC
  PUSH DE
LD HL,&CCFF
  Push HL
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
call BitmapPush8
defw BitmapData+2177
  PUSH DE
call BitmapPush12
defw BitmapData+2189
jp MultiPushDeLast6


PicWingsComplete5bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
LD BC,&7700
  Push BC
  PUSH DE
call BitmapPush22
defw BitmapData+2211
  PUSH DE
  PUSH DE
LD HL,&88FF
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+2217
LD DE,&7733
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2231
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&4050
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicWingsComplete5bmp_Line_80:
LD DE,&0000
call MultiPushDe8
call BitmapPush30
defw BitmapData+2261
call BitmapPush20
defw BitmapData+2281
jp MultiPushDeLast7


PicWingsComplete5bmp_Line_81:
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
call BitmapPush10
defw BitmapData+2291
LD DE,&99BB
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2321
call BitmapPush8
defw BitmapData+2329
LD DE,&5050
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_82:
LD DE,&0000
call MultiPushDe7
call BitmapPush18
defw BitmapData+2347
  PUSH DE
call BitmapPush12
defw BitmapData+2359
  PUSH DE
call BitmapPush18
defw BitmapData+2377
jp MultiPushDeLast7


PicWingsComplete5bmp_Line_83:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+2383
LD DE,&44DD
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2413
call BitmapPush24
defw BitmapData+2437
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_84:
LD DE,&0000
call MultiPushDe6
call BitmapPush30
defw BitmapData+2467
call BitmapPush26
defw BitmapData+2493
jp MultiPushDeLast6


PicWingsComplete5bmp_Line_85:
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
defw BitmapData+2523
call BitmapPush30
defw BitmapData+2553
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_86:
LD DE,&0000
call MultiPushDe6
LD HL,&FF00
  Push HL
  PUSH DE
LD DE,&8866
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2583
call BitmapPush10
defw BitmapData+2593
Ld E,&55
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2599
LD DE,&0000
jp MultiPushDeLast5


PicWingsComplete5bmp_Line_87:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
call BitmapPush30
defw BitmapData+2629
call BitmapPush30
defw BitmapData+2659
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_88:
LD DE,&0000
call MultiPushDe8
call BitmapPush30
defw BitmapData+2689
call BitmapPush20
defw BitmapData+2709
jp MultiPushDeLast7


PicWingsComplete5bmp_Line_89:
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
defw BitmapData+2739
call BitmapPush22
defw BitmapData+2761
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_90:
LD DE,&0000
call MultiPushDe7
LD HL,&00AA
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+2781
  PUSH DE
  PUSH DE
LD BC,&0033
  Push BC
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2799
LD DE,&0000
jp MultiPushDeLast7


PicWingsComplete5bmp_Line_91:
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
defw BitmapData+2829
LD DE,&6633
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2857
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_92:
LD DE,&0000
call MultiPushDe7
LD HL,&CC11
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+2873
LD DE,&99DD
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
Ld H,C
Ld L,C

  Push HL
LD DE,&EE66
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2889
LD BC,&0000
  Push BC
Ld H,C
Ld L,D

  Push HL
Ld D,H
Ld E,H

jp MultiPushDeLast7


PicWingsComplete5bmp_Line_93:
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
LD HL,&6640
  Push HL
  PUSH DE
call BitmapPush24
defw BitmapData+2913
LD DE,&CC66
  PUSH DE
  PUSH DE
LD DE,&6677
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2939
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_94:
LD DE,&0000
call MultiPushDe7
LD HL,&3300
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+2959
  PUSH DE
  PUSH DE
LD DE,&CC66
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2975
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
jp MultiPushDeLast6


PicWingsComplete5bmp_Line_95:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
LD HL,&5098
  Push HL
Ld B,&11
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+2987
LD DE,&99DD
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+3017
call BitmapPush12
defw BitmapData+3029
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_96:
LD DE,&0000
call MultiPushDe9
call BitmapPush14
defw BitmapData+3043
LD DE,&88DD
  PUSH DE
  PUSH DE
LD HL,&8866
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&8855
  Push BC
LD DE,&CC66
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3055
LD DE,&0000
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_97:
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
call BitmapPush30
defw BitmapData+3085
call BitmapPush16
defw BitmapData+3101
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_98:
LD DE,&0000
call MultiPushDe9
call BitmapPush20
defw BitmapData+3121
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+3141
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_99:
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
call BitmapPush30
defw BitmapData+3171
call BitmapPush16
defw BitmapData+3187
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_100:
LD DE,&0000
call MultiPushDe9
call BitmapPush12
defw BitmapData+3199
LD DE,&CC66
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC33
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00FF
  Push BC
LD DE,&88DD
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3211
LD DE,&0000
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_101:
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
call BitmapPush28
defw BitmapData+3239
LD DE,&88DD
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3253
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_102:
LD DE,&0000
call MultiPushDe9
call BitmapPush12
defw BitmapData+3265
LD DE,&CC66
  PUSH DE
  PUSH DE
LD HL,&6633
  Push HL
LD BC,&4411
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+3285
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_103:
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
call BitmapPush30
defw BitmapData+3315
call BitmapPush16
defw BitmapData+3331
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_104:
LD DE,&0000
call MultiPushDe9
call BitmapPush20
defw BitmapData+3351
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+3371
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_105:
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
call BitmapPush30
defw BitmapData+3401
call BitmapPush16
defw BitmapData+3417
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_106:
LD DE,&0000
call MultiPushDe9
call BitmapPush20
defw BitmapData+3437
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+3457
jp MultiPushDeLast9


PicWingsComplete5bmp_Line_107:
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
call BitmapPush30
defw BitmapData+3487
call BitmapPush16
defw BitmapData+3503
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_108:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3519
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3535
jp MultiPushDeLast11


PicWingsComplete5bmp_Line_109:
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
  Push HL 
  PUSH DE
call BitmapPush30
defw BitmapData+3565
call BitmapPush12
defw BitmapData+3577
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_110:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3593
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3607
jp MultiPushDeLast11


PicWingsComplete5bmp_Line_111:
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
  Push HL 
  PUSH DE
call BitmapPush20
defw BitmapData+3627
  PUSH DE
call BitmapPush20
defw BitmapData+3647
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_112:
LD DE,&0000
call MultiPushDe11
call BitmapPush8
defw BitmapData+3655
LD DE,&8811
  PUSH DE
  PUSH DE
LD HL,&EE00
  Push HL
Call PushDE_0000x
call BitmapPush14
defw BitmapData+3669
jp MultiPushDeLast11


PicWingsComplete5bmp_Line_113:
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
  Push HL 
  PUSH DE
call BitmapPush14
defw BitmapData+3683
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+3703
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_114:
LD DE,&0000
call MultiPushDe11
call BitmapPush14
defw BitmapData+3717
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3731
jp MultiPushDeLast11


PicWingsComplete5bmp_Line_115:
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
  Push HL 
  PUSH DE
call BitmapPush14
defw BitmapData+3745
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+3765
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_116:
LD DE,&0000
call MultiPushDe12
call BitmapPush12
defw BitmapData+3777
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3789
jp MultiPushDeLast12


PicWingsComplete5bmp_Line_117:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3801
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+3815
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_118:
LD DE,&0000
call MultiPushDe12
call BitmapPush12
defw BitmapData+3827
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3839
jp MultiPushDeLast12


PicWingsComplete5bmp_Line_119:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3851
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+3865
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_121:
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
  Push HL 
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3877
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3891
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_122:
LD DE,&0000
call MultiPushDe13
LD HL,&0088
  Push HL
  PUSH DE
Ld E,&11
  PUSH DE
  PUSH DE

Ld E,H

call MultiPushDe6
Ld E,&22
  PUSH DE
  PUSH DE
Ld B,D
Ld C,D

  Push BC
LD HL,&4400
  Push HL

Ld E,L

jp MultiPushDeLast13


PicWingsComplete5bmp_Line_123:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
call MultiPushDe8
LD HL,&5098
  Push HL
  Push BC
Ld E,&51
  PUSH DE
  PUSH DE

Ld E,H

call MultiPushDe6
Ld E,&22
  PUSH DE
  PUSH DE
Ld B,D


  Push BC
LD HL,&5450
  Push HL

Ld E,L

call MultiPushDe8
call BitmapPush6
defw BitmapData+561
 jp NextLinePushDe2


PicWingsComplete5bmp_Line_125:
LD DE,&5050
call MultiPushDe10
LD HL,&1000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+3899
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
Ld L,&22
  Push HL
LD BC,&1022
  Push BC
  PUSH DE
Ld H,B
Ld L,E

  Push HL
jp MultiPushDeLast13


PicWingsComplete5bmp_Line_126:
LD DE,&0000
call MultiPushDe15
LD HL,&0011
  Push HL
call MultiPushDe8
LD BC,&0022
  Push BC
jp MultiPushDeLast15


PicWingsComplete5bmp_Line_127:
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
Ld H,&10
  Push HL
Ld B,&40
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
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
LD BC,&1022
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
jp MultiPushDeLast5


PicWingsComplete4bmp_Line_151_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_151
PicWingsComplete4bmp_Line_153_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_153
PicWingsComplete4bmp_Line_155_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_155
PicWingsComplete4bmp_Line_157_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_157
PicWingsComplete4bmp_Line_159_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_159
PicWingsComplete4bmp_Line_161_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_161
PicWingsComplete4bmp_Line_163_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_163
PicWingsComplete4bmp_Line_165_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_165
PicWingsComplete4bmp_Line_169_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_169
PicWingsComplete4bmp_Line_171_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_171
PicWingsComplete4bmp_Line_173_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_173
PicWingsComplete4bmp_Line_179_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_179
PicWingsComplete4bmp_Line_181_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_181
PicWingsComplete4bmp_Line_185_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_185
PicWingsComplete4bmp_Line_187_Reuse:
LD DE,&0000
JP PicWingsComplete4bmp_Line_187

PicWingsComplete5bmp_DrawOrder: 

  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_5
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_7
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_9
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_11
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_13
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_15
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_17
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_1
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_23
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_25
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_27
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_29
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_31
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_33
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_35
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_37
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_39
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_41
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_43
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_45_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_47_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_49_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_51_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_53_Reuse
defw looper
  DEFB 1,10
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete5bmp_Line_64
  DEFW PicWingsComplete5bmp_Line_65
  DEFW PicWingsComplete5bmp_Line_66
  DEFW PicWingsComplete5bmp_Line_67
  DEFW PicWingsComplete5bmp_Line_68
  DEFW PicWingsComplete5bmp_Line_69
  DEFW PicWingsComplete5bmp_Line_70
  DEFW PicWingsComplete5bmp_Line_71
  DEFW PicWingsComplete5bmp_Line_72
  DEFW PicWingsComplete5bmp_Line_73
  DEFW PicWingsComplete5bmp_Line_74
  DEFW PicWingsComplete5bmp_Line_75
  DEFW PicWingsComplete5bmp_Line_76
  DEFW PicWingsComplete5bmp_Line_77
  DEFW PicWingsComplete5bmp_Line_78
  DEFW PicWingsComplete5bmp_Line_79
  DEFW PicWingsComplete5bmp_Line_80
  DEFW PicWingsComplete5bmp_Line_81
  DEFW PicWingsComplete5bmp_Line_82
  DEFW PicWingsComplete5bmp_Line_83
  DEFW PicWingsComplete5bmp_Line_84
  DEFW PicWingsComplete5bmp_Line_85
  DEFW PicWingsComplete5bmp_Line_86
  DEFW PicWingsComplete5bmp_Line_87
  DEFW PicWingsComplete5bmp_Line_88
  DEFW PicWingsComplete5bmp_Line_89
  DEFW PicWingsComplete5bmp_Line_90
  DEFW PicWingsComplete5bmp_Line_91
  DEFW PicWingsComplete5bmp_Line_92
  DEFW PicWingsComplete5bmp_Line_93
  DEFW PicWingsComplete5bmp_Line_94
  DEFW PicWingsComplete5bmp_Line_95
  DEFW PicWingsComplete5bmp_Line_96
  DEFW PicWingsComplete5bmp_Line_97
  DEFW PicWingsComplete5bmp_Line_98
  DEFW PicWingsComplete5bmp_Line_99
  DEFW PicWingsComplete5bmp_Line_100
  DEFW PicWingsComplete5bmp_Line_101
  DEFW PicWingsComplete5bmp_Line_102
  DEFW PicWingsComplete5bmp_Line_103
  DEFW PicWingsComplete5bmp_Line_104
  DEFW PicWingsComplete5bmp_Line_105
  DEFW PicWingsComplete5bmp_Line_106
  DEFW PicWingsComplete5bmp_Line_107
  DEFW PicWingsComplete5bmp_Line_108
  DEFW PicWingsComplete5bmp_Line_109
  DEFW PicWingsComplete5bmp_Line_110
  DEFW PicWingsComplete5bmp_Line_111
  DEFW PicWingsComplete5bmp_Line_112
  DEFW PicWingsComplete5bmp_Line_113
  DEFW PicWingsComplete5bmp_Line_114
  DEFW PicWingsComplete5bmp_Line_115
  DEFW PicWingsComplete5bmp_Line_116
  DEFW PicWingsComplete5bmp_Line_117
  DEFW PicWingsComplete5bmp_Line_118
  DEFW PicWingsComplete5bmp_Line_119
  DEFW PicWingsComplete5bmp_Line_118
  DEFW PicWingsComplete5bmp_Line_121
  DEFW PicWingsComplete5bmp_Line_122
  DEFW PicWingsComplete5bmp_Line_123
  DEFW PicWingsComplete5bmp_Line_122
  DEFW PicWingsComplete5bmp_Line_125
  DEFW PicWingsComplete5bmp_Line_126
  DEFW PicWingsComplete5bmp_Line_127
  DEFW PicWingsComplete5bmp_Line_126
  DEFW PicWingsComplete5bmp_Line_127
  DEFW PicWingsComplete5bmp_Line_126
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_131_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_151_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_153_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_155_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_157_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_159_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_161_Reuse
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_163_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_165_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_167
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_169_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_171_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_173_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_175_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_175_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_179_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_181_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_183
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_185_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_187_Reuse
  DEFW PicWingsComplete4bmp_Line_46_Reuse
  DEFW PicWingsComplete4bmp_Line_189
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
  DEFW PicWingsComplete4bmp_Line_0
  DEFW PicWingsComplete4bmp_Line_191
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
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDeLast16: ld HL,NextLine
jr MultiPushDe16B 
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
defb &50,&40,&00,&50,&50,&50,&50,&00,&00,&88
defb &44,&44,&11,&00,&11,&22,&22,&00,&11,&11
defb &22,&00,&11,&00,&44,&88,&88,&22,&00,&11
defb &00,&44,&44,&88,&22,&00,&11,&22,&22,&00
defb &00,&99,&22,&22,&00,&88,&44,&88,&88,&44
defb &88,&44,&44,&88,&44,&11,&11,&22,&44,&00
defb &88,&55,&44,&44,&00,&44,&44,&99,&11,&88
defb &00,&88,&00,&11,&88,&00,&66,&22,&44,&88
defb &88,&00,&88,&AA,&88,&44,&44,&44,&44,&00
defb &44,&55,&44,&88,&00,&33,&22,&AA,&EE,&00
defb &44,&AA,&88,&88,&00,&88,&88,&88,&00,&11
defb &CC,&00,&00,&CC,&00,&44,&44,&44,&88,&00
defb &22,&22,&55,&00,&22,&99,&11,&00,&00,&44
defb &88,&88,&88,&00,&CC,&00,&11,&CC,&00,&44
defb &44,&44,&88,&00,&11,&22,&22,&00,&00,&FF
defb &00,&DD,&FF,&00,&33,&EE,&CC,&33,&CC,&00
defb &11,&11,&22,&00,&00,&44,&88,&88,&88,&00
defb &EE,&00,&33,&CC,&00,&22,&44,&99,&00,&11
defb &EE,&33,&33,&FF,&00,&11,&EE,&00,&00,&33
defb &FF,&33,&11,&EE,&00,&22,&44,&99,&00,&77
defb &88,&00,&11,&BB,&BB,&BB,&77,&FF,&FF,&FF
defb &EE,&00,&33,&88,&66,&22,&44,&99,&11,&FF
defb &FF,&FF,&FF,&BB,&77,&77,&66,&00,&00,&77
defb &88,&00,&00,&22,&44,&99,&11,&88,&77,&00
defb &22,&EE,&DD,&EE,&FF,&BB,&BB,&77,&77,&FF
defb &CC,&00,&77,&88,&11,&11,&55,&AA,&00,&FF
defb &FF,&BB,&BB,&77,&77,&DD,&EE,&DD,&DD,&00
defb &00,&11,&66,&AA,&22,&00,&77,&88,&FF,&00
defb &00,&DD,&11,&44,&EE,&00,&EE,&DD,&DD,&EE
defb &CC,&00,&11,&EE,&77,&00,&33,&99,&EE,&00
defb &00,&DD,&EE,&EE,&DD,&CC,&11,&CC,&AA,&22
defb &CC,&00,&33,&CC,&FF,&00,&00,&22,&66,&33
defb &00,&EE,&CC,&77,&88,&00,&00,&DD,&AA,&DD
defb &00,&22,&DD,&66,&CC,&00,&00,&77,&88,&DD
defb &CC,&33,&11,&99,&33,&11,&00,&99,&00,&BB
defb &44,&11,&EE,&88,&33,&CC,&FF,&88,&33,&EE
defb &00,&00,&00,&11,&FF,&00,&77,&CC,&FF,&00
defb &55,&EE,&00,&BB,&66,&00,&00,&11,&DD,&BB
defb &CC,&11,&66,&CC,&CC,&BB,&66,&55,&99,&BB
defb &33,&CC,&FF,&33,&66,&66,&99,&BB,&44,&CC
defb &DD,&AA,&00,&FF,&66,&EE,&77,&66,&88,&00
defb &00,&77,&88,&00,&00,&77,&88,&00,&00,&55
defb &BB,&BB,&99,&99,&CC,&66,&CC,&BB,&66,&55
defb &99,&BB,&44,&77,&88,&00,&00,&77,&88,&BB
defb &66,&66,&99,&BB,&44,&DD,&88,&EE,&66,&77
defb &33,&CC,&EE,&00,&00,&88,&44,&00,&00,&88
defb &44,&00,&11,&CC,&FF,&00,&55,&22,&22,&66
defb &CC,&BB,&66,&77,&88,&BB,&66,&11,&EE,&00
defb &50,&40,&11,&EE,&11,&BB,&44,&77,&99,&BB
defb &44,&DD,&99,&11,&22,&88,&50,&40,&00,&00
defb &10,&50,&55,&AA,&EE,&CC,&11,&77,&AA,&00
defb &11,&77,&AA,&00,&DD,&DD,&66,&99,&EE,&BB
defb &66,&66,&CC,&BB,&AA,&66,&88,&BB,&33,&00
defb &11,&88,&66,&00,&33,&33,&44,&55,&99,&77
defb &44,&DD,&99,&BB,&55,&EE,&66,&66,&22,&EE
defb &AA,&CC,&DD,&00,&22,&CC,&DD,&55,&DD,&11
defb &99,&88,&11,&99,&66,&66,&CC,&BB,&AA,&77
defb &88,&BB,&11,&98,&00,&00,&50,&40,&00,&00
defb &66,&33,&54,&77,&99,&77,&44,&DD,&99,&AA
defb &66,&00,&44,&CC,&66,&EE,&00,&EE,&AA,&88
defb &55,&00,&22,&88,&55,&55,&CC,&11,&DD,&88
defb &CC,&99,&66,&77,&66,&11,&AA,&22,&88,&AA
defb &00,&CC,&CC,&11,&44,&55,&11,&66,&11,&BB
defb &99,&AA,&66,&EE,&11,&11,&AA,&88,&55,&00
defb &22,&88,&55,&66,&22,&11,&DD,&88,&EE,&DD
defb &66,&33,&66,&44,&BB,&33,&88,&AA,&40,&22
defb &00,&00,&50,&40,&00,&11,&10,&51,&44,&77
defb &33,&44,&99,&BB,&11,&AA,&DD,&CC,&DD,&CC
defb &EE,&EE,&99,&AA,&22,&CC,&DD,&00,&22,&CC
defb &DD,&11,&66,&55,&DD,&CC,&EE,&DD,&AA,&33
defb &66,&44,&BB,&22,&CC,&AA,&00,&11,&00,&22
defb &00,&11,&44,&DD,&33,&44,&99,&BB,&11,&66
defb &EE,&EE,&99,&BB,&11,&77,&AA,&00,&11,&77
defb &AA,&33,&66,&55,&DD,&CC,&66,&DD,&BB,&33
defb &66,&44,&DD,&33,&CC,&AA,&50,&40,&88,&00
defb &50,&40,&00,&44,&50,&51,&44,&FF,&22,&CC
defb &99,&BB,&33,&66,&DD,&88,&22,&CC,&BB,&88
defb &EE,&CC,&88,&EE,&00,&88,&44,&00,&00,&88
defb &44,&11,&CC,&44,&DD,&CC,&77,&44,&DD,&33
defb &66,&44,&DD,&33,&44,&AA,&00,&11,&44,&BB
defb &22,&CC,&99,&BB,&22,&88,&BB,&AA,&EE,&CC
defb &99,&11,&22,&77,&98,&00,&00,&77,&99,&22
defb &22,&44,&DD,&DD,&77,&44,&55,&11,&66,&44
defb &DD,&BB,&CC,&AA,&50,&40,&00,&00,&50,&51
defb &44,&FF,&66,&CC,&99,&AA,&33,&33,&BB,&22
defb &EE,&DD,&33,&44,&55,&11,&66,&44,&DD,&99
defb &44,&AA,&00,&11,&44,&AA,&66,&CC,&99,&AA
defb &22,&88,&BB,&22,&DD,&DD,&33,&77,&33,&00
defb &22,&99,&BB,&22,&DD,&DD,&33,&77,&33,&54
defb &50,&00,&00,&40,&BB,&33,&BB,&22,&EE,&DD
defb &33,&66,&55,&11,&66,&44,&55,&99,&CC,&AA
defb &50,&40,&00,&00,&50,&51,&44,&EE,&66,&88
defb &99,&AA,&DD,&11,&BB,&22,&EE,&DD,&BB,&66
defb &55,&11,&66,&66,&66,&99,&44,&AA,&00,&11
defb &44,&AA,&55,&99,&99,&AA,&22,&99,&BB,&66
defb &DD,&DD,&33,&66,&22,&CC,&55,&99,&66,&66
defb &DD,&99,&22,&EE,&22,&98,&50,&00,&00,&40
defb &55,&11,&DD,&22,&66,&DD,&99,&AA,&66,&99
defb &BB,&66,&66,&99,&CC,&CC,&50,&40,&00,&00
defb &50,&40,&CC,&EE,&55,&99,&BB,&66,&55,&99
defb &DD,&22,&66,&CC,&99,&AA,&66,&99,&BB,&66
defb &66,&CC,&CC,&CC,&CC,&CC,&DD,&99,&BB,&66
defb &55,&99,&66,&44,&DD,&99,&22,&EE,&66,&88
defb &55,&33,&66,&55,&DD,&88,&22,&CC,&66,&98
defb &50,&00,&00,&50,&55,&88,&DD,&00,&66,&EE
defb &99,&BB,&22,&99,&BB,&66,&22,&CC,&CC,&DC
defb &50,&40,&00,&00,&50,&40,&CC,&CC,&DD,&11
defb &BB,&66,&66,&88,&DD,&99,&66,&EE,&DD,&BB
defb &22,&88,&BB,&66,&22,&CC,&CC,&CC,&CC,&CC
defb &DD,&11,&BB,&44,&55,&33,&66,&DD,&DD,&AA
defb &66,&CC,&55,&88,&77,&33,&44,&DD,&DD,&AA
defb &66,&CC,&55,&10,&50,&00,&00,&50,&22,&88
defb &DD,&99,&66,&EE,&CC,&BB,&33,&88,&BB,&22
defb &33,&44,&CC,&DC,&50,&40,&00,&00,&50,&40
defb &CC,&CC,&BB,&51,&33,&54,&22,&CC,&66,&99
defb &77,&66,&CC,&DD,&11,&88,&BB,&22,&33,&44
defb &44,&CC,&CC,&88,&BB,&11,&33,&44,&66,&22
defb &CC,&DD,&BB,&AA,&55,&88,&DD,&00,&66,&22
defb &CC,&DD,&BB,&22,&55,&88,&AA,&50,&50,&00
defb &00,&50,&11,&54,&66,&99,&33,&66,&CC,&DD
defb &11,&88,&BB,&33,&33,&54,&44,&DC,&50,&40
defb &00,&00,&50,&40,&CC,&88,&BB,&33,&33,&54
defb &11,&44,&66,&CC,&33,&66,&CC,&DD,&99,&88
defb &BB,&33,&33,&44,&44,&88,&44,&88,&BB,&33
defb &33,&44,&66,&66,&CC,&DD,&BB,&00,&DD,&88
defb &AA,&00,&AA,&66,&88,&DD,&BB,&44,&DD,&88
defb &EE,&50,&50,&00,&00,&50,&51,&DC,&66,&CC
defb &BB,&66,&CC,&55,&99,&44,&BB,&33,&33,&54
defb &44,&98,&00,&CC,&22,&CC,&BB,&66,&EE,&55
defb &99,&44,&AA,&11,&11,&44,&44,&88,&44,&88
defb &AA,&22,&11,&44,&AA,&66,&99,&DD,&BB,&44
defb &DD,&00,&CC,&00,&AA,&55,&99,&DD,&BB,&44
defb &BB,&40,&DC,&50,&50,&00,&00,&50,&40,&DC
defb &33,&44,&BB,&66,&EE,&66,&99,&44,&AA,&51
defb &51,&54,&00,&98,&44,&00,&AA,&22,&51,&44
defb &00,&CC,&33,&44,&BB,&66,&EE,&66,&99,&CC
defb &AA,&11,&11,&CC,&00,&88,&44,&00,&EE,&22
defb &11,&44,&EE,&55,&99,&DD,&BB,&44,&BB,&00
defb &CC,&00,&EE,&55,&99,&99,&BB,&55,&BB,&40
defb &98,&50,&50,&00,&00,&50,&40,&54,&33,&66
defb &BB,&66,&66,&66,&99,&CC,&AA,&51,&51,&DC
defb &40,&98,&54,&40,&EE,&22,&51,&44,&00,&44
defb &11,&66,&99,&66,&66,&66,&99,&CC,&CC,&11
defb &00,&CC,&CC,&22,&00,&CC,&EE,&55,&99,&99
defb &AA,&55,&AA,&00,&88,&00,&40,&CC,&66,&55
defb &99,&99,&AA,&55,&AA,&40,&98,&50,&50,&00
defb &00,&50,&50,&54,&51,&66,&99,&66,&66,&66
defb &99,&88,&DC,&51,&40,&DC,&00,&44,&11,&AA
defb &DD,&66,&66,&22,&99,&88,&CC,&11,&00,&CC
defb &CC,&22,&00,&CC,&66,&55,&11,&99,&AA,&DD
defb &66,&00,&88,&00,&40,&DC,&66,&55,&11,&99
defb &AA,&99,&66,&40,&98,&50,&50,&00,&00,&50
defb &50,&54,&51,&AA,&55,&66,&66,&22,&99,&88
defb &DC,&40,&40,&DC,&11,&AA,&55,&CC,&66,&33
defb &88,&88,&CC,&00,&00,&44,&88,&00,&00,&CC
defb &44,&77,&11,&88,&EE,&99,&66,&00,&51,&AA
defb &55,&DC,&44,&33,&88,&88,&DC,&50,&50,&54
defb &50,&40,&98,&50,&40,&DC,&44,&77,&00,&88
defb &EE,&99,&66,&50,&11,&AA,&55,&CC,&44,&11
defb &88,&88,&CC,&00,&00,&44,&88,&00,&00,&CC
defb &44,&66,&00,&88,&EE,&99,&66,&00,&40,&AA
defb &55,&DC,&54,&11,&88,&88,&98,&50,&50,&54
defb &50,&40,&98,&50,&40,&54,&44,&66,&00,&88
defb &EE,&99,&44,&50,&00,&AA,&55,&88,&44,&11
defb &88,&88,&88,&00,&00,&44,&88,&00,&00,&44
defb &44,&66,&00,&88,&66,&99,&44,&00,&40,&EE
defb &55,&98,&54,&11,&88,&88,&98,&50,&50,&10
defb &50,&40,&10,&50,&50,&54,&44,&66,&00,&98
defb &66,&99,&DC,&50,&00,&EE,&55,&88,&44,&00
defb &88,&88,&88,&00,&00,&44,&44,&44,&00,&88
defb &66,&99,&CC,&00,&40,&66,&55,&98,&54,&00
defb &88,&00,&98,&50,&50,&54,&00,&44,&00,&98
defb &66,&99,&98,&50,&00,&66,&55,&88,&44,&00
defb &00,&88,&66,&99,&88,&00,&50,&66,&55,&98
defb &10,&00,&88,&00,&10,&50,&50,&10,&40,&44
defb &00,&10,&66,&99,&98,&50,&50,&22,&11,&10
defb &50,&40,&10,&50,&50,&22,&51,&50,&00,&00
defb &00,&10,&50,&40,&00,&10,&00,&50,&50,&00
defb &00,&50,&40,&00,&10,&50,&50,&00,&00,&50
defb &40,&00,&10,&40,&00,&10,&50,&50,&00,&10
defb &50,&40,&50,&50,&40,&10,&50,&50,&40,&00
defb &50,&00,&50,&50,&40,&00,&00,&11,&00,&88
defb &22,&00,&44,&44,&44,&88,&88,&00,&00,&44
defb &44,&88,&88,&88,&00,&22,&11,&22,&44,&44
defb &00,&22,&44,&99,&11,&00,&00,&11,&22,&AA
defb &22,&00,&00,&11,&11,&22,&44,&88,&66,&00
defb &44,&22,&11,&00,&22,&11,&00,&88,&11,&88
defb &CC,&00,&22,&22,&22,&00,&11,&11,&11,&00
defb &00,&CC,&00,&33,&FF,&FF,&EE,&00,&00,&11
defb &88,&11,&11,&22,&44,&22,&22,&66,&44,&00
defb &00,&11,&00,&99,&22,&22,&00,&66,&00,&33
defb &88,&00,&99,&22,&44,&44,&00,&00,&00,&33
defb &CC,&00,&11,&DD,&DD,&BB,&77,&33,&88,&99
defb &22,&44,&00,&77,&33,&BB,&66,&EE,&EE,&00
defb &00,&FF,&EE,&66,&EE,&77,&77,&DD,&DD,&BB
defb &BB,&33,&FF,&EE,&44,&55,&44,&88,&00,&33
defb &88,&00,&00,&11,&FF,&FF,&33,&77,&66,&EE
defb &FF,&BB,&99,&DD,&99,&CC,&22,&00,&11,&00
defb &00,&DD,&EE,&77,&66,&77,&77,&00,&00,&11
defb &EE,&00,&33,&BB,&99,&BB,&99,&EE,&CC,&00
defb &22,&00,&11,&00,&00,&33,&CC,&00,&11,&33
defb &22,&00,&77,&DD,&00,&33,&CC,&00,&00,&11
defb &00,&22,&CC,&EE,&11,&EE,&00,&FF,&00,&22
defb &FF,&88,&11,&33,&22,&00,&00,&11,&EE,&00
defb &00,&11,&EE,&11,&CC,&DD,&00,&22,&00,&77
defb &88,&77,&77,&00,&00,&55,&99,&11,&33,&BB
defb &00,&11,&22,&11,&88,&11,&FF,&FF,&00,&33
defb &FF,&EE,&00,&66,&11,&22,&00,&33,&77,&22
defb &22,&66,&88,&00,&33,&BB,&88,&77,&88,&00
defb &00,&11,&FF,&00,&BB,&00,&00,&11,&99,&BB
defb &BB,&99,&BB,&66,&66,&11,&FF,&FF,&FF,&88
defb &33,&44,&00,&33,&EE,&EE,&DD,&CC,&77,&FF
defb &FF,&EE,&11,&99,&BB,&66,&77,&77,&66,&66
defb &77,&CC,&00,&11,&EE,&EE,&DD,&EE,&33,&BB
defb &BB,&33,&BB,&11,&99,&DD,&BB,&99,&BB,&77
defb &11,&88,&77,&11,&EE,&DD,&DD,&EE,&33,&FF
defb &88,&00,&00,&00,&66,&33,&BB,&66,&77,&66
defb &EE,&66,&88,&00,&77,&77,&88,&00,&00,&77
defb &BB,&88,&00,&66,&CC,&77,&88,&00,&33,&BB
defb &88,&BB,&BB,&11,&99,&DD,&BB,&99,&BB,&33
defb &EE,&66,&00,&11,&99,&FF,&33,&66,&77,&66
defb &EE,&66,&33,&77,&44,&77,&77,&00,&00,&77
defb &88,&DD,&55,&DD,&DD,&88,&DD,&44,&33,&99
defb &CC,&10,&EE,&AA,&77,&66,&77,&77,&77,&11
defb &88,&33,&44,&11,&EE,&00,&22,&88,&44,&00
defb &00,&88,&55,&00,&11,&EE,&00,&BB,&00,&66
defb &33,&BB,&00,&EE,&77,&00,&AA,&CC,&66,&EE
defb &44,&EE,&33,&BB,&99,&99,&DD,&99,&44,&DD
defb &DD,&88,&DD,&33,&00,&FF,&BB,&88,&FF,&44
defb &11,&77,&AA,&00,&11,&77,&AA,&00,&BB,&CC
defb &77,&77,&CC,&33,&22,&CC,&66,&EE,&CC,&AA
defb &66,&EE,&66,&77,&77,&11,&CC,&88,&CC,&00
defb &77,&66,&10,&50,&66,&11,&44,&DD,&CC,&CC
defb &33,&77,&AA,&CC,&DD,&00,&22,&CC,&DD,&77
defb &BB,&00,&CC,&EE,&CC,&AA,&11,&BB,&99,&99
defb &DD,&88,&CC,&EE,&50,&40,&00,&00,&10,&50
defb &50,&50,&50,&11,&BB,&88,&00,&CC,&AA,&CC
defb &AA,&DD,&CC,&CC,&66,&EE,&66,&77,&55,&00
defb &22,&88,&55,&77,&CC,&66,&CC,&EE,&CC,&AA
defb &11,&DD,&99,&DD,&DD,&CC,&CC,&EE,&DD,&44
defb &55,&33,&22,&00,&11,&FF,&88,&00,&00,&77
defb &EE,&00,&11,&33,&22,&88,&AA,&DD,&CC,&CC
defb &EE,&EE,&EE,&66,&EE,&11,&44,&DD,&CC,&DD
defb &88,&FF,&AA,&88,&55,&00,&22,&88,&55,&66
defb &00,&66,&EE,&EE,&CC,&55,&11,&DD,&99,&CC
defb &DD,&CC,&EE,&66,&DD,&54,&55,&11,&DD,&10
defb &40,&00,&77,&00,&10,&50,&50,&00,&33,&88
defb &00,&50,&22,&EE,&22,&88,&AA,&DD,&99,&CC
defb &EE,&CC,&EE,&66,&EE,&22,&88,&DD,&DD,&DD
defb &88,&11,&AA,&88,&99,&DD,&DD,&BB,&99,&CC
defb &22,&CC,&DD,&00,&22,&CC,&DD,&00,&EE,&77
defb &66,&EE,&EE,&55,&11,&DD,&DD,&CC,&EE,&CC
defb &AA,&66,&CC,&CC,&CC,&DD,&99,&44,&DD,&CC
defb &EE,&EE,&EE,&22,&00,&33,&CC,&00,&00,&00
defb &99,&77,&11,&77,&AA,&00,&11,&77,&AA,&33
defb &AA,&77,&66,&66,&66,&55,&00,&DD,&DD,&AA
defb &EE,&CC,&AA,&66,&EE,&AA,&66,&88,&11,&CC
defb &50,&40,&00,&00,&10,&50,&50,&00,&10,&50
defb &50,&00,&EE,&00,&55,&99,&55,&DD,&99,&44
defb &DD,&DD,&66,&EE,&CC,&22,&99,&99,&99,&BB
defb &BB,&77,&00,&88,&44,&00,&00,&88,&44,&33
defb &BB,&77,&77,&77,&66,&55,&00,&EE,&CC,&AA
defb &66,&CC,&AA,&77,&66,&AA,&22,&88,&00,&77
defb &00,&33,&88,&00,&55,&11,&55,&BB,&99,&44
defb &DD,&99,&44,&DD,&CC,&22,&99,&BB,&BB,&BB
defb &22,&77,&98,&00,&00,&77,&99,&33,&BB,&33
defb &77,&33,&77,&55,&00,&EE,&CC,&AA,&66,&CC
defb &66,&77,&66,&AA,&22,&88,&50,&33,&CC,&50
defb &40,&FF,&10,&40,&55,&11,&55,&BB,&99,&88
defb &DD,&99,&44,&DD,&CC,&22,&BB,&BB,&33,&BB
defb &33,&77,&33,&11,&BB,&11,&BB,&33,&BB,&22
defb &88,&66,&CC,&AA,&66,&EE,&66,&33,&66,&99
defb &22,&88,&11,&44,&00,&00,&55,&22,&55,&BB
defb &11,&99,&DD,&99,&44,&DD,&88,&55,&33,&77
defb &77,&66,&50,&00,&00,&51,&BB,&99,&BB,&11
defb &BB,&33,&BB,&22,&88,&66,&CC,&EE,&77,&66
defb &55,&33,&66,&99,&33,&88,&50,&40,&77,&98
defb &50,&40,&00,&00,&10,&50,&50,&50,&50,&40
defb &77,&98,&50,&40,&77,&22,&55,&BB,&22,&99
defb &BB,&99,&CC,&DD,&88,&55,&33,&77,&BB,&BB
defb &BB,&AA,&88,&66,&EE,&DD,&77,&66,&55,&11
defb &66,&DD,&33,&44,&BB,&22,&DD,&AA,&22,&99
defb &BB,&AA,&DD,&DD,&88,&55,&77,&77,&77,&66
defb &50,&00,&00,&40,&DD,&88,&DD,&99,&BB,&99
defb &BB,&AA,&88,&77,&66,&DD,&33,&66,&55,&51
defb &AA,&55,&11,&44,&50,&40,&00,&00,&10,&50
defb &50,&50,&50,&11,&88,&50,&50,&40,&AA,&22
defb &99,&66,&22,&99,&BB,&22,&DD,&BB,&88,&55
defb &DD,&88,&DD,&99,&BB,&99,&DD,&BB,&44,&77
defb &66,&55,&33,&66,&55,&11,&AA,&55,&11,&44
defb &AA,&22,&99,&66,&22,&99,&BB,&22,&99,&BB
defb &88,&BB,&66,&EE,&77,&66,&44,&33,&66,&55
defb &11,&66,&33,&51,&AA,&55,&00,&CC,&50,&40
defb &CC,&22,&99,&66,&33,&11,&AA,&22,&99,&BB
defb &00,&AA,&66,&EE,&66,&CC,&66,&DC,&77,&DC
defb &50,&00,&00,&40,&FF,&88,&DD,&88,&50,&40
defb &00,&00,&10,&50,&50,&50,&50,&66,&50,&50
defb &DD,&99,&44,&33,&66,&55,&11,&AA,&33,&11
defb &AA,&55,&88,&CC,&CC,&66,&99,&66,&33,&11
defb &66,&22,&99,&BB,&00,&AA,&EE,&CC,&DD,&98
defb &55,&98,&50,&00,&00,&50,&66,&88,&66,&CC
defb &DD,&CC,&DD,&99,&22,&11,&66,&77,&99,&AA
defb &22,&99,&AA,&66,&88,&CC,&50,&40,&CC,&55
defb &99,&66,&55,&51,&66,&77,&99,&AA,&51,&22
defb &66,&CC,&66,&88,&66,&CC,&DD,&CC,&55,&CC
defb &AA,&11,&AA,&66,&99,&AA,&22,&88,&AA,&22
defb &88,&CC,&CC,&55,&11,&44,&55,&11,&66,&55
defb &99,&66,&11,&44,&EE,&88,&EE,&CC,&DD,&88
defb &55,&88,&EE,&88,&DD,&88,&55,&98,&50,&00
defb &00,&50,&66,&98,&66,&CC,&55,&DC,&66,&CC
defb &AA,&11,&AA,&66,&99,&AA,&22,&88,&AA,&22
defb &88,&CC,&50,&40,&CC,&55,&51,&54,&55,&51
defb &66,&55,&99,&66,&51,&44,&DD,&88,&AA,&11
defb &AA,&66,&99,&AA,&22,&88,&AA,&22,&88,&44
defb &88,&55,&11,&44,&55,&11,&66,&55,&99,&66
defb &11,&44,&BB,&00,&FF,&50,&50,&00,&00,&50
defb &33,&DC,&33,&44,&66,&DC,&66,&CC,&AA,&11
defb &AA,&22,&88,&AA,&11,&88,&CC,&22,&88,&44
defb &50,&40,&88,&55,&40,&DC,&66,&51,&44,&55
defb &11,&66,&51,&44,&EE,&11,&AA,&22,&88,&AA
defb &11,&88,&CC,&11,&88,&44,&88,&66,&00,&CC
defb &66,&11,&44,&55,&11,&66,&11,&CC,&DD,&88
defb &DD,&99,&BB,&00,&AA,&00,&DD,&99,&AA,&40
defb &EE,&50,&50,&00,&00,&50,&51,&DC,&11,&66
defb &66,&DC,&22,&CC,&EE,&00,&AA,&22,&88,&AA
defb &51,&44,&54,&51,&88,&44,&50,&40,&88,&66
defb &40,&88,&AA,&51,&54,&55,&51,&44,&51,&CC
defb &DD,&00,&00,&CC,&11,&AA,&66,&CC,&33,&44
defb &EE,&00,&AA,&22,&88,&CC,&11,&44,&44,&11
defb &88,&44,&88,&66,&00,&88,&AA,&00,&CC,&55
defb &11,&44,&11,&CC,&BB,&00,&DD,&99,&66,&00
defb &CC,&00,&DD,&11,&66,&40,&DC,&50,&50,&00
defb &00,&50,&40,&DC,&51,&AA,&22,&DC,&33,&44
defb &66,&00,&AA,&22,&88,&DC,&51,&54,&54,&40
defb &88,&44,&50,&40,&88,&44,&40,&88,&AA,&40
defb &DC,&55,&51,&54,&51,&88,&BB,&40,&00,&CC
defb &11,&AA,&22,&CC,&33,&44,&66,&00,&CC,&22
defb &88,&CC,&11,&44,&44,&00,&88,&00,&00,&44
defb &00,&88,&AA,&00,&CC,&55,&00,&CC,&11,&88
defb &BB,&00,&DD,&11,&66,&00,&CC,&00,&55,&51
defb &44,&40,&98,&50,&50,&00,&00,&50,&40,&54
defb &40,&AA,&22,&98,&33,&44,&66,&00,&DC,&22
defb &88,&DC,&51,&DC,&10,&40,&88,&00,&50,&40
defb &00,&44,&40,&00,&EE,&40,&DC,&55,&40,&DC
defb &51,&88,&BB,&40,&00,&44,&00,&AA,&33,&88
defb &33,&44,&66,&00,&CC,&33,&88,&CC,&00,&CC
defb &CC,&00,&CC,&77,&00,&CC,&11,&88,&BB,&00
defb &77,&11,&44,&00,&88,&00,&51,&88,&AA,&50
defb &77,&51,&54,&40,&98,&50,&50,&00,&00,&50
defb &50,&44,&40,&AA,&33,&98,&11,&44,&66,&00
defb &DC,&11,&88,&54,&40,&DC,&50,&40,&00,&00
defb &50,&40,&DC,&40,&98,&66,&40,&DC,&00,&22
defb &00,&EE,&33,&88,&11,&44,&66,&00,&CC,&11
defb &88,&44,&00,&CC,&CC,&00,&88,&66,&00,&CC
defb &11,&88,&AA,&00,&77,&11,&CC,&11,&50,&00
defb &00,&50,&50,&22,&40,&EE,&33,&98,&51,&44
defb &66,&00,&DC,&40,&98,&54,&40,&54,&50,&40
defb &00,&00,&50,&40,&98,&40,&98,&44,&40,&DC
defb &51,&88,&AA,&50,&77,&51,&DC,&51,&22,&00
defb &CC,&00,&88,&44,&00,&44,&88,&00,&88,&44
defb &00,&CC,&11,&00,&66,&00,&66,&11,&CC,&00
defb &40,&EE,&51,&10,&51,&88,&22,&00,&DC,&40
defb &98,&54,&50,&54,&50,&40,&00,&00,&50,&40
defb &98,&40,&98,&54,&40,&DC,&51,&00,&66,&50
defb &22,&51,&DC,&50,&00,&EE,&11,&00,&11,&88
defb &22,&00,&CC,&00,&88,&44,&00,&44,&88,&00
defb &88,&44,&00,&CC,&11,&00,&66,&00,&22,&11
defb &CC,&00,&40,&CC,&51,&50,&51,&88,&11,&00
defb &DC,&40,&98,&54,&50,&10,&50,&40,&00,&00
defb &50,&40,&10,&40,&98,&54,&40,&DC,&22,&00
defb &66,&50,&22,&40,&DC,&50,&00,&44,&11,&00
defb &11,&88,&11,&00,&88,&00,&88,&44,&88,&44
defb &00,&44,&22,&00,&66,&00,&22,&00,&88,&00
defb &50,&54,&51,&50,&51,&88,&11,&00,&98,&40
defb &98,&54,&50,&40,&98,&54,&50,&54,&22,&00
defb &66,&50,&22,&40,&98,&50,&00,&44,&11,&00
defb &11,&88,&11,&00,&88,&00,&00,&44,&88,&00
defb &00,&44,&22,&00,&66,&00,&22,&00,&88,&00
defb &50,&54,&51,&50,&51,&88,&11,&00,&98,&50
defb &50,&54,&50,&40,&98,&50,&50,&54,&22,&00
defb &66,&50,&22,&40,&98,&50,&50,&54,&51,&50
defb &51,&98,&40,&40,&98,&50,&50,&10,&50,&40
defb &10,&50,&50,&54,&00,&50,&66,&50,&22,&40
defb &98,&50,&51,&50,&11,&00,&50,&40,&10,&50
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
save direct "T31-SC5.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]