read "..\CoreDefs.asm" ;read "BootStrap.asm"
nolist
org &4000
jp PicStage20Back0001png
jp PicStage20Back0002png
jp PicStage20Back0003png
jp PicStage20Back0004png

PicStage20Back0001png:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Back0001png_DrawOrder
JP JumpToNextLine


PicStage20Back0001png_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicStage20Back0001png_Line_1:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
LD DE,&0000
call MultiPushDe16
LD BC,&E030
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_5:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
LD DE,&0000
call MultiPushDe5
LD BC,&00C0
  Push BC
LD HL,&F030
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E030
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_7:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
Call PushDE_0000x
LD BC,&00C0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Call PushDE_0000x
LD BC,&E030
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_9:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
Call PushDE_0000x
LD BC,&00C0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
  Push BC
  PUSH DE
  PUSH DE
Ld B,E
Ld C,L

  Push BC
Call PushDE_0000x
LD HL,&E030
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_11:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
Call PushDE_0000x
Ld B,&80
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
Call PushDE_0000x
LD BC,&E030
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_13:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
Ld C,&30
  Push BC
Call PushDE_0000x
LD HL,&E030
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_15:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  Push BC
Call PushDE_0000x
Ld B,&E0
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_17:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C070
  Push HL
Call PushDE_0000x
Ld B,&80
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Call PushDE_0000x
LD BC,&E030
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_23:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+11
Call PushDE_0000x
LD HL,&E0F0
  Push HL
Call PushDE_F0F0x
LD BC,&F070
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+17
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicStage20Back0001png_Line_25:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
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
LD HL,&E0F0
  Push HL
LD DE,&0F0F
call MultiPushDe5
Ld B,&0F
  Push BC
LD HL,&F070
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
  Push HL 
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_27:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+23
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0078
  Push HL
LD DE,&0F0F
call MultiPushDe8
LD BC,&C300
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicStage20Back0001png_Line_29:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+35
LD DE,&0F0F
call MultiPushDe8
call BitmapPush12
defw BitmapData+47
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicStage20Back0001png_Line_31:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+53
LD DE,&0F0F
call MultiPushDe8
call BitmapPush12
defw BitmapData+65
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicStage20Back0001png_Line_33:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
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
LD BC,&003C
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&C310
  Push HL
Ld C,&80
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
Ld C,&E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_35:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+71
LD DE,&0F0F
call MultiPushDe6
call BitmapPush6
defw BitmapData+77
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_37:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
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
defw BitmapData+83
Call PushDE_0F0Fx
call BitmapPush6
defw BitmapData+89
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_39:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
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
defw BitmapData+95
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+101
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_41:
  PUSH DE
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0001png_Line_43:
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&30
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicStage20Back0001png_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+109
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
LD BC,&7000
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe3


PicStage20Back0001png_Line_46:
jp MultiPushDeLast40


PicStage20Back0001png_Line_47:
call MultiPushDe6
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld D,B
Ld E,B

jp MultiPushDeLast6


PicStage20Back0001png_Line_46_Reuse:
LD DE,&0000
JP PicStage20Back0001png_Line_46
PicStage20Back0001png_Line_49:
call MultiPushDe7
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
Ld D,H
Ld E,H

jp MultiPushDeLast7


PicStage20Back0001png_Line_51:
call MultiPushDe11
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast11


PicStage20Back0001png_Line_53:
call MultiPushDe13
call BitmapPush6
defw BitmapData+115
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
LD BC,&F070
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast13


PicStage20Back0001png_Line_79:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
call MultiPushDe34
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Back0001png_Line_81:
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+121
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
call MultiPushDe22
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+127
 jp NextLinePushDe2


PicStage20Back0001png_Line_83:
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+121
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,L


  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&0000
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0001png_Line_121:
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+121
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
call MultiPushDe20
Ld H,B
Ld L,B

  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&0000
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0001png_Line_123:
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+121
call MultiPushDe14
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
call MultiPushDe14
call BitmapPush6
defw BitmapData+127
 jp NextLinePushDe2


PicStage20Back0001png_Line_125:
LD DE,&F0F0
call MultiPushDe10
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
jp MultiPushDeLast10


PicStage20Back0001png_Line_127:
LD DE,&F0F0
call MultiPushDe5
LD HL,&7000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
  Push HL 
jp MultiPushDeLast5


PicStage20Back0001png_Line_131:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&80
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&0000
  jp NextLinePushHl 


PicStage20Back0001png_Line_131_Reuse:
LD DE,&0000
JP PicStage20Back0001png_Line_131
PicStage20Back0001png_Line_151:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&80
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
call MultiPushDe10
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicStage20Back0001png_Line_153:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&80
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+11
LD DE,&0000
call MultiPushDe14
call BitmapPush6
defw BitmapData+133
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&70
  Push BC
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_155:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&80
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
Ld D,C
Ld E,C

call MultiPushDe18
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicStage20Back0001png_Line_157:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+139
LD DE,&0000
call MultiPushDe24
call BitmapPush6
defw BitmapData+145
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&0000
  jp NextLinePushHl 


PicStage20Back0001png_Line_159:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe28
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_161:
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe30
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0001png_Line_163:
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&F030
  Push BC
call MultiPushDe14
LD HL,&C0F0
  Push HL
Call PushDE_F0F0x
  Push BC
LD DE,&0000
call MultiPushDe14
LD BC,&E0F0
  Push BC
LD HL,&F070
  Push HL
 jp NextLinePushDe1


PicStage20Back0001png_Line_165:
  PUSH DE
LD HL,&E070
  Push HL
call MultiPushDe14
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&F030
  Push HL
LD DE,&0000
call MultiPushDe14
LD BC,&E070
  Push BC
 jp NextLinePushDe1


PicStage20Back0001png_Line_167:
call MultiPushDe15
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe8
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast15


PicStage20Back0001png_Line_169:
call MultiPushDe8
LD HL,&00E0
  Push HL
LD BC,&3000
  Push BC
call MultiPushDe5
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0FC3
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&00C0
  Push HL
LD BC,&7000
  Push BC
jp MultiPushDeLast8


PicStage20Back0001png_Line_171:
call MultiPushDe8
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe6
LD DE,&F0F0
  PUSH DE
  PUSH DE
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+153
jp MultiPushDeLast8


PicStage20Back0001png_Line_173:
call MultiPushDe8
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00C0
  Push BC
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&0FC3
  Push BC
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

jp MultiPushDeLast8


PicStage20Back0001png_Line_175:
call MultiPushDe10
LD HL,&E0F0
  Push HL
Call PushDE_F0F0x
LD BC,&780F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
LD HL,&0FE1
  Push HL
LD DE,&F0F0
call MultiPushDe5
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast9


PicStage20Back0001png_Line_177:
call MultiPushDe10
LD DE,&F0F0
call MultiPushDe5
LD HL,&F03C
  Push HL
LD DE,&0F0F
call MultiPushDe8
LD BC,&C3F0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast9


PicStage20Back0001png_Line_179:
call MultiPushDe7
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&1E0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&0FC3
  Push HL
LD DE,&F0F0
call MultiPushDe8
LD BC,&F030
  Push BC
LD DE,&0000
jp MultiPushDeLast7


PicStage20Back0001png_Line_181:
call MultiPushDe5
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe8
LD BC,&F090
  Push BC
LD HL,&3000
  Push HL
  PUSH DE
Ld C,&0F
  Push BC
Call PushDE_0F0Fx
call BitmapPush6
defw BitmapData+159
LD DE,&F0F0
call MultiPushDe9
LD HL,&F000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicStage20Back0001png_Line_183:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
Ld E,&10
  PUSH DE
  PUSH DE
LD BC,&00C0
  Push BC
Ld E,&F0
call MultiPushDe6
LD HL,&1000
  Push HL
Ld D,&80
  PUSH DE
  PUSH DE
Ld D,E
call MultiPushDe11
Ld D,B
Ld E,B

 jp NextLinePushDe3


PicStage20Back0001png_Line_185:
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&F000
  Push BC
  PUSH DE
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
LD HL,&F010
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+165
LD DE,&F0F0
call MultiPushDe11
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Back0001png_Line_187:
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&7080
  Push BC
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Call PushDE_0000x
LD BC,&00E0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&10E0
  Push HL
call MultiPushDe11
LD BC,&F070
  Push BC
LD DE,&0000
 jp NextLinePushDe2


PicStage20Back0001png_Line_189:
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe12
LD BC,&F0C0
  Push BC
call MultiPushDe10
LD HL,&10E0
  Push HL
call MultiPushDe12
LD BC,&1000
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0001png_Line_191:
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
call MultiPushDe36
LD BC,&3000
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0001png_Line_193:
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe34
LD BC,&F010
  Push BC
LD DE,&0000
 jp NextLinePushDe2


PicStage20Back0001png_Line_195:
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe34
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Back0001png_Line_197:
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe36
LD BC,&7000
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0001png_Line_199:
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe35
LD BC,&F000
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 



PicStage20Back0001png_DrawOrder: 

  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_5
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_7
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_9
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_11
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_13
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_15
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_17
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_23
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_25
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_27
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_29
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_31
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_33
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_35
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_37
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_39
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_41
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_43
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_45
  DEFW PicStage20Back0001png_Line_46
  DEFW PicStage20Back0001png_Line_47
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_49
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_51
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_53
defw looper
  DEFB 1,25
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_79
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_81
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_121
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_123
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_125
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_127
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_127
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_131_Reuse
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_151
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_153
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_155
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_157
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_159
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_161
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_163
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_165
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_167
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_169
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_171
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_173
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_175
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_177
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_179
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_181
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_183
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_185
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_187
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_189
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_191
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_193
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_195
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_197
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0001png_Line_199
  DEFW EndCode
PicStage20Back0002png:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Back0002png_DrawOrder
JP JumpToNextLine


PicStage20Back0002png_Line_1:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe16
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD BC,&0080
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_3:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
Ld C,&C0
  Push BC
LD HL,&F070
  Push HL
call MultiPushDe6
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD BC,&0080
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_5:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&E030
  Push BC
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD HL,&0080
  Push HL
 jp NextLinePushDe4


PicStage20Back0002png_Line_7:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
Ld B,C
  Push BC
LD HL,&3000
  Push HL
  PUSH DE
Ld B,&80
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD BC,&0080
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_9:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Call PushDE_0000x
call BitmapPush6
defw BitmapData+177
  PUSH DE
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD BC,&0080
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_11:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Call PushDE_0000x
call BitmapPush6
defw BitmapData+183
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD HL,&0080
  Push HL
 jp NextLinePushDe4


PicStage20Back0002png_Line_13:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Call PushDE_0000x
Ld C,&E0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD HL,&0080
  Push HL
 jp NextLinePushDe4


PicStage20Back0002png_Line_15:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
call BitmapPush6
defw BitmapData+189
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD HL,&0080
  Push HL
 jp NextLinePushDe4


PicStage20Back0002png_Line_17:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
call BitmapPush6
defw BitmapData+195
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+171
Call PushDE_F0F0x
LD HL,&0080
  Push HL
 jp NextLinePushDe4


PicStage20Back0002png_Line_19:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe16
call BitmapPush6
defw BitmapData+201
Call PushDE_F0F0x
LD BC,&0080
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_21:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe16
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
Ld C,&80
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_23:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
Ld D,C
Ld E,C

call MultiPushDe5
LD BC,&F070
  Push BC
Call PushDE_0000x
LD HL,&0080
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_25:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Call PushDE_0000x
LD BC,&F03C
  Push BC
LD DE,&0F0F
call MultiPushDe5
call BitmapPush6
defw BitmapData+207
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_27:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&3C
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&C300
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_29:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld B,&C0
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD HL,&800F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
call BitmapPush6
defw BitmapData+213
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_31:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+223
LD DE,&0F0F
call MultiPushDe8
call BitmapPush6
defw BitmapData+229
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_33:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld B,&C0
  Push BC
  PUSH DE
Ld H,&10
  Push HL
LD BC,&803C
  Push BC
LD DE,&0F0F
call MultiPushDe8
call BitmapPush6
defw BitmapData+235
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_35:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld B,&C0
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+71
LD DE,&0F0F
call MultiPushDe6
call BitmapPush8
defw BitmapData+243
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_37:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+249
Call PushDE_0F0Fx
call BitmapPush10
defw BitmapData+259
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_39:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld B,&80
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
LD HL,&3000
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_41:
call BitmapPush6
defw BitmapData+107
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_43:
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld H,&00
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE

Ld C,H

  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

 jp NextLinePushDe2


PicStage20Back0002png_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld H,&00
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE

Ld C,H

  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

jp MultiPushDeLast5


PicStage20Back0002png_Line_47:
call MultiPushDe5
call BitmapPush6
defw BitmapData+265
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicStage20Back0002png_Line_49:
call MultiPushDe7
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

jp MultiPushDeLast7


PicStage20Back0002png_Line_51:
call MultiPushDe9
call BitmapPush8
defw BitmapData+273
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,C
Ld E,C

jp MultiPushDeLast10


PicStage20Back0002png_Line_53:
call MultiPushDe13
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
LD BC,&E070
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast13


PicStage20Back0002png_Line_79:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
call MultiPushDe35
LD BC,&00E0
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Back0002png_Line_81:
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld D,L
Ld E,L

call MultiPushDe21
Ld C,&F0
  Push BC
Call PushDE_F0F0x
LD HL,&3000
  Push HL
Ld C,&E0
  Push BC
 jp NextLinePushDe1


PicStage20Back0002png_Line_83:
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld C,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&30
  Push HL
Ld C,&E0
  Push BC
 jp NextLinePushDe1


PicStage20Back0002png_Line_121:
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
LD BC,&C0F0
  Push BC
call MultiPushDe13
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&30
  Push HL
Ld C,&E0
  Push BC
 jp NextLinePushDe1


PicStage20Back0002png_Line_123:
Call PushDE_F0F0x
LD HL,&7000
  Push HL
LD BC,&00E0
  Push BC
call MultiPushDe10
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00F0
  Push HL
call MultiPushDe15
LD BC,&3000
  Push BC
LD HL,&00E0
  Push HL
 jp NextLinePushDe1


PicStage20Back0002png_Line_125:
LD DE,&F0F0
call MultiPushDe11
LD HL,&7000
  Push HL
LD BC,&80F0
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
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
call MultiPushDe10
  Push BC
LD BC,&00E0
  Push BC
 jp NextLinePushDe1


PicStage20Back0002png_Line_127:
LD DE,&F0F0
call MultiPushDe6
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&80F0
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
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&0080
  Push HL
jp MultiPushDeLast9


PicStage20Back0002png_Line_129:
LD DE,&F0F0
call MultiPushDe6
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&80F0
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
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_131:
call BitmapPush6
defw BitmapData+279
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&80F0
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
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_151:
call BitmapPush6
defw BitmapData+279
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_153:
call BitmapPush6
defw BitmapData+279
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+285
LD DE,&0000
call MultiPushDe13
call BitmapPush8
defw BitmapData+293
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
 jp NextLinePushDe4


PicStage20Back0002png_Line_155:
call BitmapPush6
defw BitmapData+279
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
Ld L,&30
  Push HL
Ld D,B
Ld E,B

call MultiPushDe19
LD BC,&C070
  Push BC
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
  Push HL 
 jp NextLinePushDe4


PicStage20Back0002png_Line_157:
call BitmapPush6
defw BitmapData+279
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD DE,&0000
call MultiPushDe25
call BitmapPush8
defw BitmapData+301
Call PushDE_F0F0x
jp NextLine


PicStage20Back0002png_Line_159:
call BitmapPush6
defw BitmapData+279
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD DE,&0000
call MultiPushDe28
LD BC,&C070
  Push BC
LD HL,&0080
  Push HL
Call PushDE_F0F0x
jp NextLine


PicStage20Back0002png_Line_161:
call BitmapPush10
defw BitmapData+311
call MultiPushDe30
LD HL,&0080
  Push HL
Call PushDE_F0F0x
jp NextLine


PicStage20Back0002png_Line_163:
call BitmapPush8
defw BitmapData+319
call MultiPushDe13
LD HL,&80F0
  Push HL
Call PushDE_F0F0x
LD BC,&F010
  Push BC
LD DE,&0000
call MultiPushDe14
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicStage20Back0002png_Line_165:
LD HL,&F0F0
  Push HL
LD BC,&7000
  Push BC
call MultiPushDe14
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&F030
  Push BC
LD DE,&0000
call MultiPushDe14
Ld H,E
Ld L,B

  Push HL

Ld C,L

 jp NextLinePushBC 


PicStage20Back0001png_Line_167_Reuse:
LD DE,&0000
JP PicStage20Back0001png_Line_167
PicStage20Back0002png_Line_169:
call MultiPushDe9
LD HL,&F070
  Push HL
call MultiPushDe5
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&780F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,&87
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&F000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast15


PicStage20Back0002png_Line_171:
call MultiPushDe8
LD HL,&00E0
  Push HL
LD BC,&F070
  Push BC
  PUSH DE
Ld H,B
Ld L,B

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe5
call BitmapPush6
defw BitmapData+325
Call PushDE_0000x
call BitmapPush8
defw BitmapData+333
jp MultiPushDeLast7


PicStage20Back0002png_Line_173:
call MultiPushDe9
call BitmapPush8
defw BitmapData+341
  PUSH DE
LD HL,&00C0
  Push HL
LD BC,&3C0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
LD HL,&0FC3
  Push HL
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld D,H
Ld E,H

jp MultiPushDeLast7


PicStage20Back0002png_Line_175:
call MultiPushDe11
Call PushDE_F0F0x
LD HL,&780F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&0FC3
  Push BC
LD DE,&F0F0
call MultiPushDe7
LD HL,&F030
  Push HL
LD DE,&0000
jp MultiPushDeLast7


PicStage20Back0002png_Line_177:
call MultiPushDe9
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe5
LD BC,&F01E
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&C3F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast8


PicStage20Back0002png_Line_179:
call MultiPushDe6
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe9
LD DE,&0F0F
call MultiPushDe7
LD BC,&0F87
  Push BC
LD DE,&F0F0
call MultiPushDe8
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast7


PicStage20Back0002png_Line_181:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&1080
  Push BC
  PUSH DE
LD HL,&3C0F
  Push HL
Call PushDE_0F0Fx
call BitmapPush6
defw BitmapData+347
LD DE,&F0F0
call MultiPushDe8
LD BC,&F070
  Push BC
LD DE,&0000
jp MultiPushDeLast6


PicStage20Back0002png_Line_183:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe10
call BitmapPush6
defw BitmapData+353
call MultiPushDe6
call BitmapPush6
defw BitmapData+359
call MultiPushDe9
LD BC,&3000
  Push BC
Call PushDE_0000x
jp NextLine


PicStage20Back0002png_Line_185:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F080
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+365
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+371
LD DE,&F0F0
call MultiPushDe11
LD HL,&F000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicStage20Back0002png_Line_187:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F0C0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Call PushDE_0000x
call BitmapPush8
defw BitmapData+43
LD DE,&F0F0
call MultiPushDe11
LD BC,&F070
  Push BC
LD DE,&0000
 jp NextLinePushDe2


PicStage20Back0002png_Line_189:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F0C0
  Push BC
call MultiPushDe10
LD HL,&00E0
  Push HL
call MultiPushDe12
LD BC,&3000
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0002png_Line_191:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe10
LD BC,&F080
  Push BC
call MultiPushDe10
LD HL,&10F0
  Push HL
call MultiPushDe12
Ld C,&00
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0002png_Line_193:
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe11
LD HL,&F090
  Push HL
call MultiPushDe24
LD BC,&3000
 jp NextLinePushBC 


PicStage20Back0002png_Line_195:
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe36
LD BC,&3000
 jp NextLinePushBC 


PicStage20Back0002png_Line_197:
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe36
LD BC,&3000
 jp NextLinePushBC 


PicStage20Back0002png_Line_199:
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe37
LD HL,&3000
  jp NextLinePushHl 



PicStage20Back0002png_DrawOrder: 

  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_3
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_5
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_7
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_9
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_11
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_13
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_15
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_17
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_19
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_21
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_23
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_25
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_27
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_29
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_31
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_33
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_35
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_37
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_39
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_41
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_43
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_45
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_47
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_49
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_51
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_53
defw looper
  DEFB 1,25
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_79
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_81
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_121
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_123
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_125
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_127
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_151
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_153
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_155
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_157
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_159
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_161
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_163
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_165
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0001png_Line_167_Reuse
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_169
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_171
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_173
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_175
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_177
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_179
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_181
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_183
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_185
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_187
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0002png_Line_189
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_191
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_193
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_195
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_197
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_199
  DEFW EndCode
PicStage20Back0003png:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Back0003png_DrawOrder
JP JumpToNextLine


PicStage20Back0003png_Line_1:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe16
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld B,&E0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_5:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe8
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld H,&E0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_7:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe7
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld H,&E0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_9:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe7
Ld C,&E0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
Ld D,B
Ld E,B

call MultiPushDe5
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_11:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe5
LD BC,&8070
  Push BC
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
 jp NextLinePushDe2


PicStage20Back0003png_Line_13:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe5
call BitmapPush6
defw BitmapData+377
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
 jp NextLinePushDe2


PicStage20Back0003png_Line_15:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Call PushDE_0000x
call BitmapPush8
defw BitmapData+385
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
 jp NextLinePushDe2


PicStage20Back0003png_Line_17:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe7
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
call MultiPushDe5
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_19:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe16
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_21:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld D,B
Ld E,B

call MultiPushDe16
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_23:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Call PushDE_0000x
LD DE,&F0F0
call MultiPushDe5
LD BC,&F030
  Push BC
Call PushDE_0000x
LD HL,&0080
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_25:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E03C
  Push BC
LD DE,&0F0F
call MultiPushDe6
LD HL,&F0F0
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD BC,&E0F0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_27:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
Ld C,&78
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&6100
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld B,&E0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_29:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD BC,&800F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
LD HL,&0F10
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld B,&E0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_31:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD BC,&800F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
LD HL,&0F30
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld B,&E0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_33:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+393
LD DE,&0F0F
call MultiPushDe8
LD HL,&C300
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld B,&E0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_35:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&F0
  Push BC
call BitmapPush6
defw BitmapData+399
LD DE,&0F0F
call MultiPushDe6
call BitmapPush10
defw BitmapData+409
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD BC,&E0F0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_37:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+415
Call PushDE_0F0Fx
call BitmapPush12
defw BitmapData+427
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD BC,&E0F0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_39:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+433
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&C0F0
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
  Push BC
Ld H,&E0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_41:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&C0F0
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
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
Ld B,&F0
 jp NextLinePushBC 


PicStage20Back0003png_Line_43:
  PUSH DE
call BitmapPush6
defw BitmapData+439
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&C0F0
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
  Push BC
call FinalBitmapPush6
defw BitmapData+445


PicStage20Back0003png_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
Ld L,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
Ld L,&F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicStage20Back0003png_Line_47:
call MultiPushDe5
call BitmapPush8
defw BitmapData+453
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Ld D,C
Ld E,C

jp MultiPushDeLast5


PicStage20Back0003png_Line_49:
call MultiPushDe8
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld L,&F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
  PUSH DE
Ld B,E
Ld C,L

  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast6


PicStage20Back0003png_Line_51:
call MultiPushDe9
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld L,&F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
jp MultiPushDeLast10


PicStage20Back0003png_Line_53:
call MultiPushDe13
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast13


PicStage20Back0003png_Line_81:
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&F070
  Push BC
LD HL,&0000
  Push HL
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
Ld D,L
Ld E,L

call MultiPushDe20
call BitmapPush8
defw BitmapData+461
Call PushDE_F0F0x
LD HL,&F070
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicStage20Back0003png_Line_83:
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&F070
  Push BC
LD HL,&0000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE

Ld C,L

  Push BC
Ld L,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&30
  Push BC
Ld L,&80
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0003png_Line_121:
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&F070
  Push BC
LD HL,&0000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE

Ld C,L

  Push BC
Ld L,&E0
  Push HL
call MultiPushDe14
Ld B,&30
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&70
  Push BC
Ld L,&00
  jp NextLinePushHl 


PicStage20Back0003png_Line_123:
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&F070
  Push BC
LD HL,&0000
  Push HL
call MultiPushDe10
LD BC,&3000
  Push BC
LD HL,&E0F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00E0
  Push HL
call MultiPushDe15
Ld C,&70
  Push BC
LD HL,&0000
  jp NextLinePushHl 


PicStage20Back0003png_Line_125:
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F010
  Push BC
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
LD HL,&C0F0
  Push HL
call MultiPushDe10
LD BC,&F070
  Push BC
LD HL,&0000
  jp NextLinePushHl 


PicStage20Back0003png_Line_127:
LD DE,&F0F0
call MultiPushDe7
LD HL,&F030
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
jp MultiPushDeLast8


PicStage20Back0003png_Line_129:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
LD BC,&E0F0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_151:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,H
Ld E,H

call MultiPushDe5
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
LD BC,&E0F0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_153:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD DE,&0000
call MultiPushDe14
LD HL,&C0F0
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
  PUSH DE
LD HL,&1000
  Push HL
LD BC,&E0F0
  Push BC
 jp NextLinePushDe2


PicStage20Back0003png_Line_155:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+467
LD DE,&0000
call MultiPushDe20
LD HL,&E0F0
  Push HL
  PUSH DE
Call PushDE_F0F0x
LD BC,&1000
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_157:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld D,B
Ld E,B

call MultiPushDe24
Call PushDE_F0F0x
LD BC,&1000
  Push BC
LD HL,&E0F0
  Push HL
 jp NextLinePushDe2


PicStage20Back0003png_Line_159:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
Ld L,&30
  Push HL
Ld D,B
Ld E,B

call MultiPushDe28
call BitmapPush8
defw BitmapData+475
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Back0003png_Line_161:
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+481
LD DE,&0000
call MultiPushDe32
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicStage20Back0003png_Line_163:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD DE,&0000
call MultiPushDe14
LD BC,&C0F0
  Push BC
Call PushDE_F0F0x
LD HL,&F030
  Push HL
LD DE,&0000
call MultiPushDe14
Ld B,&E0
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Back0002png_Line_165_Reuse:
LD DE,&0000
JP PicStage20Back0002png_Line_165
PicStage20Back0003png_Line_167:
call MultiPushDe10
LD HL,&F010
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
Ld D,H
Ld E,H

call MultiPushDe8
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast15


PicStage20Back0003png_Line_169:
call MultiPushDe9
LD HL,&00F0
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&80
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
Ld H,&0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast15


PicStage20Back0003png_Line_171:
call MultiPushDe9
call BitmapPush8
defw BitmapData+489
  PUSH DE
  PUSH DE
LD HL,&F0F0
  Push HL
LD BC,&F078
  Push BC
LD DE,&0F0F
call MultiPushDe6
Ld H,B
Ld L,B

  Push HL
Ld C,&30
  Push BC
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+308
jp MultiPushDeLast7


PicStage20Back0003png_Line_173:
call MultiPushDe11
call BitmapPush10
defw BitmapData+499
LD DE,&0F0F
call MultiPushDe8
LD HL,&0FC3
  Push HL
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld D,H
Ld E,H

jp MultiPushDeLast6


PicStage20Back0003png_Line_175:
call MultiPushDe11
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
LD HL,&0FC3
  Push HL
LD DE,&F0F0
call MultiPushDe8
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast6


PicStage20Back0003png_Line_177:
call MultiPushDe9
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&F01E
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&C3F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
Ld C,&00
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast6


PicStage20Back0003png_Line_179:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe12
LD HL,&1E0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&0FC3
  Push BC
LD DE,&F0F0
call MultiPushDe9
LD HL,&F000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast6


PicStage20Back0003png_Line_181:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&1000
  Push BC
  PUSH DE
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&F0F0
  Push BC
LD HL,&10C0
  Push HL
Ld D,C
Ld E,C

call MultiPushDe8
Ld C,&30
  Push BC
LD DE,&0000
jp MultiPushDeLast6


PicStage20Back0003png_Line_183:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&F030
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0F87
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+505
call MultiPushDe8
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicStage20Back0003png_Line_185:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe10
call BitmapPush10
defw BitmapData+515
  PUSH DE
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+521
LD DE,&F0F0
call MultiPushDe9
LD HL,&7000
  Push HL
Call PushDE_0000x
jp NextLine


PicStage20Back0003png_Line_187:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe9
LD BC,&F000
  Push BC
LD HL,&E0F0
  Push HL
  PUSH DE
Ld C,&10
  Push BC
Call PushDE_0000x
call BitmapPush8
defw BitmapData+529
LD DE,&F0F0
call MultiPushDe11
LD HL,&F070
  Push HL
LD DE,&0000
 jp NextLinePushDe2


PicStage20Back0003png_Line_189:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe9
LD BC,&F000
  Push BC
LD HL,&C0F0
  Push HL
call MultiPushDe8
Ld C,&30
  Push BC
LD HL,&00E0
  Push HL
call MultiPushDe13
LD BC,&1000
 jp NextLinePushBC 


PicStage20Back0003png_Line_191:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe10
LD BC,&F000
  Push BC
LD HL,&80F0
  Push HL
call MultiPushDe8
Ld C,&70
  Push BC
LD HL,&00F0
  Push HL
call MultiPushDe13
LD BC,&3000
 jp NextLinePushBC 


PicStage20Back0003png_Line_193:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F010
  Push BC
LD HL,&80F0
  Push HL
call MultiPushDe9
LD BC,&C0F0
  Push BC
call MultiPushDe13
LD HL,&7000
  jp NextLinePushHl 


PicStage20Back0003png_Line_195:
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe12
LD BC,&10F0
  Push BC
call MultiPushDe23
LD HL,&7000
  jp NextLinePushHl 


PicStage20Back0003png_Line_197:
  PUSH DE
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe37
LD BC,&F000
 jp NextLinePushBC 


PicStage20Back0003png_Line_199:
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe38
LD BC,&F000
 jp NextLinePushBC 



PicStage20Back0003png_DrawOrder: 

  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_5
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_7
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_9
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_11
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_13
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_15
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_17
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_19
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_21
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_23
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_25
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_27
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_29
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_31
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_33
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_35
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_37
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_39
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_41
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_43
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_45
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_47
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_49
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_51
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_53
defw looper
  DEFB 1,27
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_81
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_121
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_123
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_125
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_127
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_151
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_153
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_155
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_157
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_159
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_161
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_163
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0002png_Line_165_Reuse
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_167
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_169
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_171
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_173
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_175
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_177
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_179
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_181
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_183
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_185
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_187
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0003png_Line_189
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_191
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_193
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_195
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_197
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0003png_Line_199
  DEFW EndCode
PicStage20Back0004png:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Back0004png_DrawOrder
JP JumpToNextLine


PicStage20Back0004png_Line_1:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe16
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_3:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe7
call BitmapPush6
defw BitmapData+535
call MultiPushDe6
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_5:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe7
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld D,B
Ld E,B

call MultiPushDe6
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_7:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe7
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&70
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_9:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe7
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_11:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe6
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_13:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe6
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld D,H
Ld E,H

call MultiPushDe5
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F000
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_17:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
Ld D,B
Ld E,B

call MultiPushDe6
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

call MultiPushDe5
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&70
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_23:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
Ld D,B
Ld E,B

call MultiPushDe5
LD DE,&F0F0
call MultiPushDe5
LD HL,&F070
  Push HL
Ld D,B
Ld E,B

call MultiPushDe5
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_25:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F01E
  Push BC
LD DE,&0F0F
call MultiPushDe6
LD HL,&E1F0
  Push HL
Call PushDE_0000x
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_27:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
Ld C,&78
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&6100
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&80F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_29:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD HL,&800F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&0F30
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&F000
  Push HL
LD BC,&80F0
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_31:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+541
LD DE,&0F0F
call MultiPushDe8
call BitmapPush10
defw BitmapData+551
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_33:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+557
LD DE,&0F0F
call MultiPushDe8
call BitmapPush10
defw BitmapData+567
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_35:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+575
LD DE,&0F0F
call MultiPushDe6
call BitmapPush12
defw BitmapData+587
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_37:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+597
Call PushDE_0F0Fx
call BitmapPush6
defw BitmapData+587
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_39:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&F0
  Push BC
call MultiPushDe7
LD HL,&F070
  Push HL
Ld C,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_41:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&30
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_43:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+291
Call PushDE_F0F0x
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
Ld L,&F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE

Ld C,H

  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&70
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&F0
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Back0004png_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicStage20Back0004png_Line_47:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
Ld C,&F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+105
LD DE,&0000
jp MultiPushDeLast5


PicStage20Back0004png_Line_49:
call MultiPushDe7
call BitmapPush6
defw BitmapData+603
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&E0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE

Ld L,B

  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&70
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast7


PicStage20Back0004png_Line_51:
call MultiPushDe9
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
Ld L,&F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+609
LD DE,&0000
jp MultiPushDeLast10


PicStage20Back0004png_Line_53:
call MultiPushDe14
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE

Ld C,H

  Push BC
Ld D,H
Ld E,H

jp MultiPushDeLast12


PicStage20Back0004png_Line_79:
LD HL,&F0F0
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe35
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicStage20Back0004png_Line_81:
call BitmapPush6
defw BitmapData+615
Call PushDE_F0F0x
LD HL,&3000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  Push HL 
Ld D,L
Ld E,L

call MultiPushDe18
LD HL,&00E0
  Push HL
Call PushDE_F0F0x
LD BC,&1000
  Push BC
LD HL,&80F0
  Push HL
 jp NextLinePushDe4


PicStage20Back0004png_Line_83:
call BitmapPush6
defw BitmapData+615
Call PushDE_F0F0x
LD HL,&3000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&30
  Push HL
Ld B,&C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&F0
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
LD BC,&80F0
  Push BC
 jp NextLinePushDe4


PicStage20Back0004png_Line_121:
call BitmapPush6
defw BitmapData+615
Call PushDE_F0F0x
LD HL,&3000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&0080
  Push BC
call MultiPushDe14
Ld H,E
Ld L,B

  Push HL
Ld C,&E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
LD BC,&80F0
  Push BC
 jp NextLinePushDe4


PicStage20Back0004png_Line_123:
call BitmapPush6
defw BitmapData+615
LD DE,&F0F0
call MultiPushDe15
LD HL,&3000
  Push HL
LD BC,&E0F0
  Push BC
call MultiPushDe14
LD HL,&1000
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe4


PicStage20Back0004png_Line_125:
call BitmapPush6
defw BitmapData+615
LD DE,&F0F0
call MultiPushDe10
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&80F0
  Push BC
jp MultiPushDeLast11


PicStage20Back0004png_Line_127:
LD DE,&F0F0
call MultiPushDe9
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld L,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
LD HL,&E0F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
Ld H,&C0
  Push HL
jp MultiPushDeLast6


PicStage20Back0004png_Line_129:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld L,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
LD HL,&E0F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
Ld H,&C0
  Push HL
jp MultiPushDeLast6


PicStage20Back0004png_Line_131:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld L,&E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
LD HL,&E0F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&70
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_151:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
Ld L,&E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,H
Ld E,H

call MultiPushDe5
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&70
  Push BC
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&70
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_153:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
Ld B,&30
  Push BC
Ld D,H
Ld E,H

call MultiPushDe15
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_155:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,C
Ld E,C

call MultiPushDe21
call BitmapPush8
defw BitmapData+623
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&80F0
  Push BC
 jp NextLinePushDe1


PicStage20Back0004png_Line_157:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Ld D,C
Ld E,C

call MultiPushDe23
call BitmapPush6
defw BitmapData+629
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
LD HL,&80F0
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_159:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+635
LD DE,&0000
call MultiPushDe28
LD HL,&C0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Ld H,&80
  Push HL
 jp NextLinePushDe1


PicStage20Back0004png_Line_161:
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
call MultiPushDe31
call FinalBitmapPush10
defw BitmapData+645


PicStage20Back0004png_Line_163:
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD DE,&0000
call MultiPushDe14
LD BC,&C0F0
  Push BC
Call PushDE_F0F0x
LD HL,&F030
  Push HL
LD DE,&0000
call MultiPushDe15
Ld B,&80
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0004png_Line_165:
LD HL,&F0F0
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe14
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
Ld C,&10
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C010
  Push HL
call MultiPushDe10
LD BC,&80F0
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Back0004png_Line_167:
call MultiPushDe10
LD HL,&80F0
  Push HL
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe8
Ld B,&10
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
jp MultiPushDeLast12


PicStage20Back0004png_Line_169:
call MultiPushDe10
LD HL,&F0F0
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F00F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&87F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0070
  Push HL
jp MultiPushDeLast12


PicStage20Back0004png_Line_171:
call MultiPushDe10
LD HL,&00F0
  Push HL
  PUSH DE
LD BC,&00C0
  Push BC
LD HL,&7000
  Push HL
  PUSH DE
LD BC,&80F0
  Push BC
LD HL,&F078
  Push HL
LD DE,&0F0F
call MultiPushDe6
Ld B,C
  Push BC
LD HL,&F010
  Push HL
LD DE,&0000
jp MultiPushDeLast15


PicStage20Back0004png_Line_173:
call MultiPushDe12
call BitmapPush8
defw BitmapData+653
LD DE,&0F0F
call MultiPushDe8
LD HL,&0FE1
  Push HL
LD BC,&F000
  Push BC
Call PushDE_0000x
LD HL,&00C0
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
Ld C,&30
  Push BC
Ld D,H
Ld E,H

jp MultiPushDeLast6


PicStage20Back0004png_Line_175:
call MultiPushDe12
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
LD HL,&0FC3
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&0000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicStage20Back0004png_Line_177:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
call MultiPushDe10
LD BC,&F01E
  Push BC
LD DE,&0F0F
call MultiPushDe8
LD HL,&87F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe9
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast5


PicStage20Back0004png_Line_179:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&1E0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&0FC3
  Push HL
LD BC,&F010
  Push BC
Ld D,B
Ld E,B

call MultiPushDe9
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicStage20Back0004png_Line_181:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe11
LD HL,&1080
  Push HL
  PUSH DE
LD BC,&1E0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&F0F0
  Push HL
LD BC,&30C0
  Push BC
Ld D,L
Ld E,L

call MultiPushDe8
LD HL,&F010
  Push HL
LD DE,&0000
jp MultiPushDeLast6


PicStage20Back0004png_Line_183:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F010
  Push BC
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
Ld H,C
Ld L,C

  Push HL
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld H,C
Ld L,E

  Push HL
call MultiPushDe9
Ld B,&30
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast5


PicStage20Back0004png_Line_185:
call MultiPushDe5
LD DE,&F0F0
call MultiPushDe9
call BitmapPush10
defw BitmapData+663
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+673
call MultiPushDe8
LD HL,&7000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicStage20Back0004png_Line_187:
call MultiPushDe5
LD DE,&F0F0
call MultiPushDe9
LD HL,&F010
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE

Ld L,B

  Push HL
Call PushDE_0000x
call BitmapPush8
defw BitmapData+681
LD DE,&F0F0
call MultiPushDe9
LD BC,&3000
  Push BC
Call PushDE_0000x
jp NextLine


PicStage20Back0004png_Line_189:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe9
LD BC,&F000
  Push BC
LD HL,&00C0
  Push HL
call MultiPushDe8
Ld C,&10
  Push BC
LD HL,&00E0
  Push HL
call MultiPushDe11
Ld C,&70
  Push BC
LD DE,&0000
 jp NextLinePushDe2


PicStage20Back0004png_Line_191:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
call MultiPushDe10
LD BC,&F000
  Push BC
LD HL,&00C0
  Push HL
call MultiPushDe8
Ld C,&10
  Push BC
LD HL,&00E0
  Push HL
call MultiPushDe12
Ld C,&30
  Push BC
LD HL,&0000
  jp NextLinePushHl 


PicStage20Back0004png_Line_193:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe11
LD BC,&F010
  Push BC
LD HL,&0080
  Push HL
call MultiPushDe8
Ld C,&30
  Push BC
LD HL,&80F0
  Push HL
call MultiPushDe13
Ld C,&00
 jp NextLinePushBC 


PicStage20Back0004png_Line_195:
  PUSH DE
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe13
LD BC,&00C0
  Push BC
jp MultiPushDeLast24


PicStage20Back0004png_Line_197:
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast39


PicStage20Back0004png_Line_199:
LD DE,&F0F0
jp MultiPushDeLast40



PicStage20Back0004png_DrawOrder: 

  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_3
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_5
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_7
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_9
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_11
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_13
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_13
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_17
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_1
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_23
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_25
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_27
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_29
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_31
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_33
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_35
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_37
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_39
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_41
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_43
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_45
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_47
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_49
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_51
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_53
defw looper
  DEFB 1,25
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_79
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_81
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_83
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_121
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_123
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_125
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_127
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_129
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_131
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_151
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_153
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_155
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_157
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_159
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_161
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_163
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_165
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_167
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_169
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_171
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_173
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_175
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_177
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_179
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_181
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_183
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_185
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_187
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_189
  DEFW PicStage20Back0001png_Line_46_Reuse
  DEFW PicStage20Back0004png_Line_191
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_193
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_195
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_197
  DEFW PicStage20Back0001png_Line_0
  DEFW PicStage20Back0004png_Line_199
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
MultiPushDeLast39: ld HL,NextLine
jp MultiPushDe39B 
MultiPushDe39: pop HL
jp MultiPushDe39B 
MultiPushDe38: pop HL
jp MultiPushDe38B 
MultiPushDe37: pop HL
jp MultiPushDe37B 
MultiPushDe36: pop HL
jp MultiPushDe36B 
MultiPushDe35: pop HL
jp MultiPushDe35B 
MultiPushDe34: pop HL
jp MultiPushDe34B 
MultiPushDe32: pop HL
jp MultiPushDe32B 
MultiPushDe31: pop HL
jp MultiPushDe31B 
MultiPushDe30: pop HL
jp MultiPushDe30B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe25: pop HL
jr MultiPushDe25B 
MultiPushDeLast24: ld HL,NextLine
jr MultiPushDe24B 
MultiPushDe24: pop HL
jr MultiPushDe24B 
MultiPushDe23: pop HL
jr MultiPushDe23B 
MultiPushDe22: pop HL
jr MultiPushDe22B 
MultiPushDe21: pop HL
jr MultiPushDe21B 
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

BitmapPush12: ld b,&06
jr BitmapPush
BitmapPush10: ld b,&05
jr BitmapPush
BitmapPush8: ld b,&04
jr BitmapPush
BitmapPush6: ld b,&03
jr BitmapPush

finalBitmapPush10: ld b,&05
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

defb &00,&F0,&F0,&F0,&F0,&C0,&00,&10,&F0,&C0
defb &00,&70,&E0,&00,&70,&F0,&80,&00,&10,&F0
defb &F0,&C0,&00,&70,&E0,&00,&70,&F0,&F0,&80
defb &1E,&80,&00,&00,&00,&10,&E0,&00,&70,&F0
defb &F0,&F0,&80,&00,&00,&00,&10,&87,&0F,&C0
defb &00,&00,&10,&F0,&E0,&00,&70,&F0,&F0,&F0
defb &F0,&80,&00,&00,&30,&0F,&0F,&3C,&80,&00
defb &10,&F0,&F0,&80,&00,&10,&C3,&0F,&0F,&78
defb &E0,&00,&00,&00,&00,&00,&00,&70,&E1,&0F
defb &F0,&C0,&30,&F0,&00,&00,&00,&10,&F0,&E0
defb &30,&F0,&F0,&C0,&00,&70,&F0,&F0,&F0,&80
defb &80,&00,&F0,&F0,&E0,&00,&F0,&C0,&00,&00
defb &70,&F0,&F0,&E0,&00,&00,&30,&F0,&E0,&00
defb &30,&F0,&80,&00,&00,&F0,&F0,&80,&00,&70
defb &E0,&00,&10,&F0,&F0,&00,&70,&F0,&C0,&10
defb &F0,&F0,&C0,&00,&C0,&00,&F0,&F0,&F0,&0F
defb &F0,&00,&F0,&F0,&E0,&00,&80,&00,&F0,&F0
defb &F0,&C0,&10,&F0,&F0,&F0,&F0,&E0,&70,&F0
defb &F0,&F0,&F0,&E0,&C0,&10,&F0,&F0,&F0,&C0
defb &C0,&30,&F0,&F0,&F0,&00,&80,&00,&F0,&F0
defb &F0,&E0,&00,&10,&F0,&F0,&87,&0F,&80,&00
defb &00,&00,&10,&0F,&0F,&C0,&00,&00,&00,&F0
defb &F0,&C0,&00,&F0,&F0,&00,&00,&00,&30,&0F
defb &F0,&E0,&00,&00,&00,&C3,&F0,&E0,&00,&00
defb &00,&10,&C3,&0F,&0F,&F0,&E0,&00,&10,&F0
defb &F0,&E0,&00,&30,&F0,&80,&00,&30,&F0,&0F
defb &F0,&00,&10,&F0,&F0,&C0,&F0,&C0,&00,&F0
defb &F0,&F0,&E0,&00,&F0,&80,&00,&70,&F0,&F0
defb &00,&10,&F0,&80,&00,&70,&80,&00,&70,&F0
defb &F0,&F0,&E0,&00,&80,&00,&70,&F0,&F0,&F0
defb &F0,&80,&00,&10,&F0,&F0,&F0,&80,&00,&70
defb &F0,&F0,&00,&30,&F0,&80,&00,&70,&F0,&F0
defb &70,&F0,&F0,&F0,&87,&0F,&00,&30,&F0,&80
defb &00,&70,&C0,&00,&00,&F0,&F0,&F0,&80,&00
defb &30,&E0,&C0,&10,&F0,&F0,&F0,&87,&E0,&00
defb &10,&F0,&90,&F0,&F0,&80,&F0,&00,&00,&30
defb &80,&00,&00,&00,&00,&30,&F0,&00,&70,&F0
defb &E0,&00,&F0,&80,&00,&70,&F0,&C0,&F0,&C0
defb &10,&F0,&F0,&F0,&C0,&00,&3C,&00,&00,&00
defb &F0,&00,&10,&F0,&0F,&3C,&80,&00,&30,&F0
defb &F0,&C0,&00,&70,&F0,&00,&00,&30,&C3,&0F
defb &0F,&F0,&F0,&00,&00,&70,&F0,&C0,&00,&70
defb &F0,&F0,&F0,&80,&00,&70,&E1,&0F,&F0,&C0
defb &00,&00,&30,&F0,&E0,&00,&10,&F0,&80,&00
defb &00,&00,&00,&30,&F0,&C0,&C0,&00,&30,&F0
defb &F0,&F0,&F0,&C0,&80,&00,&30,&F0,&F0,&F0
defb &80,&00,&30,&F0,&C0,&00,&30,&F0,&F0,&E0
defb &00,&10,&F0,&F0,&F0,&C0,&00,&F0,&C0,&00
defb &10,&F0,&70,&F0,&80,&00,&00,&F0,&F0,&80
defb &0F,&3C,&E0,&00,&00,&10,&F0,&F0,&C0,&00
defb &F0,&80,&70,&00,&00,&10,&80,&00,&00,&00
defb &00,&30,&F0,&E0,&00,&F0,&F0,&00,&30,&F0
defb &E0,&00,&E0,&00,&30,&F0,&F0,&F0,&E0,&00
defb &70,&F0,&F0,&F0,&F0,&00,&0F,&80,&00,&00
defb &00,&F0,&F0,&80,&00,&F0,&F0,&00,&00,&00
defb &30,&0F,&1E,&00,&00,&00,&30,&F0,&F0,&80
defb &00,&F0,&F0,&F0,&00,&00,&00,&C3,&0F,&78
defb &80,&00,&00,&00,&30,&F0,&F0,&80,&00,&F0
defb &F0,&F0,&F0,&80,&00,&30,&E1,&0F,&0F,&F0
defb &E0,&00,&00,&F0,&F0,&00,&30,&F0,&80,&00
defb &F0,&F0,&F0,&80,&70,&F0,&F0,&80,&00,&F0
defb &F0,&00,&00,&10,&F0,&F0,&F0,&C0,&00,&30
defb &F0,&F0,&F0,&00,&F0,&C0,&00,&30,&E0,&00
defb &70,&F0,&00,&00,&70,&F0,&F0,&F0,&F0,&80
defb &00,&70,&F0,&F0,&E0,&00,&0F,&F0,&F0,&00
defb &30,&F0,&E0,&00,&E0,&00,&00,&00,&00,&10
defb &F0,&00,&10,&F0,&F0,&00,&10,&F0,&C0,&00
defb &00,&00,&00,&10,&F0,&00,&00,&F0,&F0,&F0
defb &E0,&00
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
save direct "T31-SC8.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]