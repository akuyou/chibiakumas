org &8000

nolist
FirstByte:
jp PicFR010BochanlickinglollipopV1png
jp PicFR011BochanlickinglollipopV2png

PicFR010BochanlickinglollipopV1png:
ld (StackRestore_Plus2-2),sp
di
ld hl,&C000+21+38

xor a
ld (ImageWidthD_Plus2-2),a
ld a,01
or a
PicFR010BochanlickinglollipopV1png_DrawGetNextLine:
jr z,PicFR010BochanlickinglollipopV1png_DrawGotLine
call RLE_NextScreenLineHL
dec a
		jr PicFR010BochanlickinglollipopV1png_DrawGetNextLine
PicFR010BochanlickinglollipopV1png_DrawGotLine:
ld sp,hl
LD IX,PicFR010BochanlickinglollipopV1png_DrawOrder
JP JumpToNextLine


PicFR010BochanlickinglollipopV1png_Line_0:
LD DE,&FFFF
jp MultiPushDeLast19


PicFR010BochanlickinglollipopV1png_Line_1:
LD HL,&1100
  Push HL
INC DE

call MultiPushDe6
call BitmapPush10
defw BitmapData+9
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_2:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+19
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_3:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+29
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_4:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+41
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_5:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+53
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_6:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+65
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_7:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+77
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_8:
LD HL,&1100
  Push HL
call MultiPushDe6
LD BC,&0F03
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+85
call MultiPushDe5
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_9:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+99
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_10:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+113
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_11:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+125
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_12:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+139
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_13:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+153
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_14:
LD HL,&1100
  Push HL
call MultiPushDe5
LD BC,&F0F0
  Push BC
LD HL,&10E0
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
LD HL,&1E07
  Push HL
Ld D,C
Ld E,C

call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_15:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+159
  PUSH DE
call BitmapPush8
defw BitmapData+167
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_16:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+183
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_17:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+199
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_18:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+215
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_19:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+229
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_20:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+245
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_21:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+261
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_22:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+277
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_23:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+293
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_24:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+309
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_25:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+323
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_26:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+337
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_27:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush8
defw BitmapData+345
LD DE,&FF7F
  PUSH DE
  PUSH DE
LD BC,&0D5F
  Push BC
LD HL,&0200
  Push HL
Call PushDE_0000x
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_28:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+361
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_29:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+377
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_30:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+393
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_31:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+409
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_32:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+409
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF00
  Push BC
LD HL,&0200
  Push HL
Call PushDE_0000x
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_33:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+415
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF00
  Push BC
LD HL,&0200
  Push HL
Call PushDE_0000x
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_34:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+421
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+427
Call PushDE_0000x
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_35:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush16
defw BitmapData+443
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_36:
LD HL,&1100
  Push HL
call MultiPushDe5
LD BC,&0088
  Push BC
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+453
Call PushDE_0000x
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_37:
LD HL,&1100
  Push HL
call MultiPushDe6
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+461
Call PushDE_0000x
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_38:
LD HL,&1100
  Push HL
call MultiPushDe6
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+471
Call PushDE_0000x
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_39:
LD HL,&1100
  Push HL
call MultiPushDe6
LD BC,&EEFF
  Push BC
Ld H,C
Ld L,C

  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+477
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_40:
LD HL,&1100
  Push HL
call MultiPushDe6
LD BC,&CCFF
  Push BC
LD HL,&FF11
  Push HL
  PUSH DE
  PUSH DE
  Push BC
LD BC,&0102
  Push BC
call MultiPushDe5
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_41:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush6
defw BitmapData+483
  PUSH DE
LD BC,&EE7F
  Push BC
LD HL,&0203
  Push HL
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_42:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+495
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_43:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+507
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_44:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+517
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_45:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+527
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_46:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+535
call MultiPushDe7
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_47:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+543
call MultiPushDe7
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_48:
LD HL,&1100
  Push HL
call MultiPushDe6
LD BC,&E0F0
  Push BC
Ld H,C
Ld L,B

  Push HL
  PUSH DE
LD BC,&7700
  Push BC
call MultiPushDe7
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_49:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+551
call MultiPushDe7
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_50:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+559
call MultiPushDe7
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_51:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+569
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_52:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+579
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_53:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+589
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_54:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+599
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_55:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+609
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_56:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+623
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_57:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+637
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_58:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+651
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_59:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+665
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_60:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+679
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_61:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+693
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_62:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+707
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_63:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+721
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_64:
LD HL,&1100
  Push HL
call MultiPushDe5
call BitmapPush14
defw BitmapData+735
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_65:
LD HL,&1100
  Push HL
call MultiPushDe5
LD BC,&00CC
  Push BC
LD HL,&1107
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+743
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_66:
LD HL,&1100
  Push HL
call MultiPushDe6
LD BC,&0006
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+751
call MultiPushDe5
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_67:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+763
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_68:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+775
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_69:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush12
defw BitmapData+787
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_70:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+799
call MultiPushDe5
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_71:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+815
call MultiPushDe5
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_72:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+829
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_73:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+843
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_74:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+857
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_75:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+871
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_76:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+885
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_77:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+899
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_78:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+913
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_79:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+927
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_80:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+941
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_81:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+955
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_82:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+969
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_83:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+983
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_84:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+997
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_85:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1011
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_86:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1025
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_87:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+1035
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_88:
LD HL,&1100
  Push HL
call MultiPushDe6
call BitmapPush10
defw BitmapData+1045
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_89:
LD HL,&1100
  Push HL
call MultiPushDe7
call BitmapPush8
defw BitmapData+1053
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_90:
LD HL,&1100
  Push HL
call MultiPushDe8
call BitmapPush6
defw BitmapData+1059
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_91:
LD HL,&1100
  Push HL
call MultiPushDe8
call BitmapPush6
defw BitmapData+1065
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_92:
LD HL,&1100
  Push HL
call MultiPushDe9
LD BC,&F0F0
  Push BC
LD HL,&3000
  Push HL
call MultiPushDe6
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_93:
LD HL,&1100
  Push HL
call MultiPushDe9
LD BC,&F0F0
  Push BC
call MultiPushDe7
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_94:
LD HL,&1100
  Push HL
call MultiPushDe9
LD BC,&F010
  Push BC
call MultiPushDe7
LD HL,&0088
  jp NextLinePushHl 


PicFR010BochanlickinglollipopV1png_Line_95:
LD HL,&1100
  Push HL
call MultiPushDe17
LD BC,&0088
 jp NextLinePushBC 


PicFR010BochanlickinglollipopV1png_Line_95_Reuse:
LD DE,&0000
JP PicFR010BochanlickinglollipopV1png_Line_95
PicFR010BochanlickinglollipopV1png_Line_97:
DEC DE

jp MultiPushDeLast19



PicFR010BochanlickinglollipopV1png_DrawOrder: 

  DEFW PicFR010BochanlickinglollipopV1png_Line_0
  DEFW PicFR010BochanlickinglollipopV1png_Line_1
  DEFW PicFR010BochanlickinglollipopV1png_Line_2
  DEFW PicFR010BochanlickinglollipopV1png_Line_3
  DEFW PicFR010BochanlickinglollipopV1png_Line_4
  DEFW PicFR010BochanlickinglollipopV1png_Line_5
  DEFW PicFR010BochanlickinglollipopV1png_Line_6
  DEFW PicFR010BochanlickinglollipopV1png_Line_7
  DEFW PicFR010BochanlickinglollipopV1png_Line_8
  DEFW PicFR010BochanlickinglollipopV1png_Line_9
  DEFW PicFR010BochanlickinglollipopV1png_Line_10
  DEFW PicFR010BochanlickinglollipopV1png_Line_11
  DEFW PicFR010BochanlickinglollipopV1png_Line_12
  DEFW PicFR010BochanlickinglollipopV1png_Line_13
  DEFW PicFR010BochanlickinglollipopV1png_Line_14
  DEFW PicFR010BochanlickinglollipopV1png_Line_15
  DEFW PicFR010BochanlickinglollipopV1png_Line_16
  DEFW PicFR010BochanlickinglollipopV1png_Line_17
  DEFW PicFR010BochanlickinglollipopV1png_Line_18
  DEFW PicFR010BochanlickinglollipopV1png_Line_19
  DEFW PicFR010BochanlickinglollipopV1png_Line_20
  DEFW PicFR010BochanlickinglollipopV1png_Line_21
  DEFW PicFR010BochanlickinglollipopV1png_Line_22
  DEFW PicFR010BochanlickinglollipopV1png_Line_23
  DEFW PicFR010BochanlickinglollipopV1png_Line_24
  DEFW PicFR010BochanlickinglollipopV1png_Line_25
  DEFW PicFR010BochanlickinglollipopV1png_Line_26
  DEFW PicFR010BochanlickinglollipopV1png_Line_27
  DEFW PicFR010BochanlickinglollipopV1png_Line_28
  DEFW PicFR010BochanlickinglollipopV1png_Line_29
  DEFW PicFR010BochanlickinglollipopV1png_Line_30
  DEFW PicFR010BochanlickinglollipopV1png_Line_31
  DEFW PicFR010BochanlickinglollipopV1png_Line_32
  DEFW PicFR010BochanlickinglollipopV1png_Line_33
  DEFW PicFR010BochanlickinglollipopV1png_Line_34
  DEFW PicFR010BochanlickinglollipopV1png_Line_35
  DEFW PicFR010BochanlickinglollipopV1png_Line_36
  DEFW PicFR010BochanlickinglollipopV1png_Line_37
  DEFW PicFR010BochanlickinglollipopV1png_Line_38
  DEFW PicFR010BochanlickinglollipopV1png_Line_39
  DEFW PicFR010BochanlickinglollipopV1png_Line_40
  DEFW PicFR010BochanlickinglollipopV1png_Line_41
  DEFW PicFR010BochanlickinglollipopV1png_Line_42
  DEFW PicFR010BochanlickinglollipopV1png_Line_43
  DEFW PicFR010BochanlickinglollipopV1png_Line_44
  DEFW PicFR010BochanlickinglollipopV1png_Line_45
  DEFW PicFR010BochanlickinglollipopV1png_Line_46
  DEFW PicFR010BochanlickinglollipopV1png_Line_47
  DEFW PicFR010BochanlickinglollipopV1png_Line_48
  DEFW PicFR010BochanlickinglollipopV1png_Line_49
  DEFW PicFR010BochanlickinglollipopV1png_Line_50
  DEFW PicFR010BochanlickinglollipopV1png_Line_51
  DEFW PicFR010BochanlickinglollipopV1png_Line_52
  DEFW PicFR010BochanlickinglollipopV1png_Line_53
  DEFW PicFR010BochanlickinglollipopV1png_Line_54
  DEFW PicFR010BochanlickinglollipopV1png_Line_55
  DEFW PicFR010BochanlickinglollipopV1png_Line_56
  DEFW PicFR010BochanlickinglollipopV1png_Line_57
  DEFW PicFR010BochanlickinglollipopV1png_Line_58
  DEFW PicFR010BochanlickinglollipopV1png_Line_59
  DEFW PicFR010BochanlickinglollipopV1png_Line_60
  DEFW PicFR010BochanlickinglollipopV1png_Line_61
  DEFW PicFR010BochanlickinglollipopV1png_Line_62
  DEFW PicFR010BochanlickinglollipopV1png_Line_63
  DEFW PicFR010BochanlickinglollipopV1png_Line_64
  DEFW PicFR010BochanlickinglollipopV1png_Line_65
  DEFW PicFR010BochanlickinglollipopV1png_Line_66
  DEFW PicFR010BochanlickinglollipopV1png_Line_67
  DEFW PicFR010BochanlickinglollipopV1png_Line_68
  DEFW PicFR010BochanlickinglollipopV1png_Line_69
  DEFW PicFR010BochanlickinglollipopV1png_Line_70
  DEFW PicFR010BochanlickinglollipopV1png_Line_71
  DEFW PicFR010BochanlickinglollipopV1png_Line_72
  DEFW PicFR010BochanlickinglollipopV1png_Line_73
  DEFW PicFR010BochanlickinglollipopV1png_Line_74
  DEFW PicFR010BochanlickinglollipopV1png_Line_75
  DEFW PicFR010BochanlickinglollipopV1png_Line_76
  DEFW PicFR010BochanlickinglollipopV1png_Line_77
  DEFW PicFR010BochanlickinglollipopV1png_Line_78
  DEFW PicFR010BochanlickinglollipopV1png_Line_79
  DEFW PicFR010BochanlickinglollipopV1png_Line_80
  DEFW PicFR010BochanlickinglollipopV1png_Line_81
  DEFW PicFR010BochanlickinglollipopV1png_Line_82
  DEFW PicFR010BochanlickinglollipopV1png_Line_83
  DEFW PicFR010BochanlickinglollipopV1png_Line_84
  DEFW PicFR010BochanlickinglollipopV1png_Line_85
  DEFW PicFR010BochanlickinglollipopV1png_Line_86
  DEFW PicFR010BochanlickinglollipopV1png_Line_87
  DEFW PicFR010BochanlickinglollipopV1png_Line_88
  DEFW PicFR010BochanlickinglollipopV1png_Line_89
  DEFW PicFR010BochanlickinglollipopV1png_Line_90
  DEFW PicFR010BochanlickinglollipopV1png_Line_91
  DEFW PicFR010BochanlickinglollipopV1png_Line_92
  DEFW PicFR010BochanlickinglollipopV1png_Line_93
  DEFW PicFR010BochanlickinglollipopV1png_Line_94
  DEFW PicFR010BochanlickinglollipopV1png_Line_95
  DEFW PicFR010BochanlickinglollipopV1png_Line_95_Reuse
  DEFW PicFR010BochanlickinglollipopV1png_Line_97
  DEFW EndCode
PicFR011BochanlickinglollipopV2png:
ld (StackRestore_Plus2-2),sp
di
ld hl,&C000+21+38

xor a
ld (ImageWidthD_Plus2-2),a
ld a,01
or a
PicFR011BochanlickinglollipopV2png_DrawGetNextLine:
jr z,PicFR011BochanlickinglollipopV2png_DrawGotLine
call RLE_NextScreenLineHL
dec a
		jr PicFR011BochanlickinglollipopV2png_DrawGetNextLine
PicFR011BochanlickinglollipopV2png_DrawGotLine:
ld sp,hl
LD IX,PicFR011BochanlickinglollipopV2png_DrawOrder
JP JumpToNextLine


PicFR011BochanlickinglollipopV2png_Line_0:
ld hl,&FFDA
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_1:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&6F0F
  Push HL
LD BC,&EF1F
  Push BC
ld hl,&FFEE
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_2:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&6F0F
  Push HL
LD BC,&EF3F
  Push BC
ld hl,&FFEE
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_3:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&7F0F
  Push HL
LD BC,&EF7F
  Push BC
ld hl,&FFEE
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_4:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1073
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_5:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1081
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_6:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1089
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_7:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1097
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_8:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&AFFA
  Push HL
LD BC,&F278
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_9:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&0FF5
  Push HL
LD BC,&F5F0
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_10:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&0FEB
  Push HL
LD BC,&FAF0
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_11:
ld hl,&FFEA
add hl,sp
ld sp,hl
LD HL,&F5F1
  Push HL
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_12:
ld hl,&FFEA
add hl,sp
ld sp,hl
LD HL,&FAFA
  Push HL
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_13:
ld hl,&FFEA
add hl,sp
ld sp,hl
LD HL,&F4F5
  Push HL
LD BC,&1F03
  Push BC
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_14:
ld hl,&FFEA
add hl,sp
ld sp,hl
LD HL,&F0FA
  Push HL
LD BC,&3E07
  Push BC
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_15:
ld hl,&FFEA
add hl,sp
ld sp,hl
LD HL,&C0F4
  Push HL
LD BC,&5F07
  Push BC
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_16:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&3F0F
  Push HL
LD BC,&EF37
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&F0F8
  Push HL
LD BC,&BE27
  Push BC
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_17:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&CF0F
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&2780
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&7C5F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_18:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&0F17
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&BCAF
  Push BC
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_19:
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&87F0
  Push HL
LD BC,&784F
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&3C5F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_20:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1109
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_21:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1119
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1100
  Push HL
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_22:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1129
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_23:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1141
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_24:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1149
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&8F0C
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_25:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1157
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&8F19
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_26:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1169
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_27:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1177
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F5F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_28:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1185
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&8F7F
  Push HL
LD BC,&0700
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_29:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&FF11
  Push HL
LD BC,&CCFF
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
dec sp
dec sp
LD HL,&8F7F
  Push HL
LD BC,&0700
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_30:
ld hl,&FFF2
add hl,sp
ld sp,hl
Call PushDE_FFFFx
dec sp
dec sp
LD HL,&DF7F
  Push HL
LD BC,&0700
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_31:
ld hl,&FFEE
add hl,sp
ld sp,hl
LD DE,&FFFF
  PUSH DE
  PUSH DE
dec sp
dec sp
LD HL,&DF3F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_32:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&FF0F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_34:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&FF0F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_35:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&7F0F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_36:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&7F0F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_38:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&3F0F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_39:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&1F0F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_40:
ld hl,&FFE8
add hl,sp
ld sp,hl
LD HL,&0F03
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_41:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&88FF
  Push HL
LD BC,&FFC0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0E03
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_42:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00CC
  Push HL
LD BC,&FFE0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0E02
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_43:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&8833
  Push HL
LD BC,&CCE0
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_44:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&CC33
  Push HL
LD BC,&33E0
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_45:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&CC1F
  Push HL
LD BC,&FFE0
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_46:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&CC9F
  Push HL
LD BC,&FF60
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_47:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&CC9F
  Push HL
LD BC,&FFE0
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_48:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&88BF
  Push HL
LD BC,&FFE0
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_49:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1193
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_50:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1203
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_51:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1213
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_52:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1223
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_53:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1233
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_54:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1243
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_55:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1253
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_56:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1267
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_57:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1281
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_58:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1295
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_59:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1309
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_60:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1323
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_61:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1337
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_62:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1351
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_63:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1365
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_64:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1379
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_65:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1391
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_66:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1403
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_67:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1417
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_68:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1431
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_69:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1445
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_70:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1459
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_71:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1473
ld hl,&FFF4
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_72:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1483
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_73:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1493
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_74:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1501
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_75:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1511
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_76:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1521
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_77:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1531
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_78:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1541
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_79:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1551
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_80:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1561
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_81:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1571
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_82:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1581
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_83:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1591
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_84:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1601
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_85:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD DE,&FFEE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1607
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_86:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1617
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_87:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1627
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_88:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1637
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_89:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FFBB
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F0F
  Push HL
LD BC,&0F01
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_90:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FF33
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F0F
  Push HL
LD BC,&0F00
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_91:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FF33
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F0F
  Push HL
LD BC,&0700
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_92:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FF33
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F0F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_93:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FF77
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F0F
  Push HL
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_94:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FF77
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0F01
  Push HL
ld hl,&FFF0
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_95:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00DD
  Push HL
LD BC,&FF77
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR011BochanlickinglollipopV2png_Line_96:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0055
  Push HL
LD BC,&FF77
  Push BC
ld hl,&FFEC
jp NextLineSPshift



PicFR011BochanlickinglollipopV2png_DrawOrder: 

  DEFW PicFR011BochanlickinglollipopV2png_Line_0
  DEFW PicFR011BochanlickinglollipopV2png_Line_1
  DEFW PicFR011BochanlickinglollipopV2png_Line_2
  DEFW PicFR011BochanlickinglollipopV2png_Line_3
  DEFW PicFR011BochanlickinglollipopV2png_Line_4
  DEFW PicFR011BochanlickinglollipopV2png_Line_5
  DEFW PicFR011BochanlickinglollipopV2png_Line_6
  DEFW PicFR011BochanlickinglollipopV2png_Line_7
  DEFW PicFR011BochanlickinglollipopV2png_Line_8
  DEFW PicFR011BochanlickinglollipopV2png_Line_9
  DEFW PicFR011BochanlickinglollipopV2png_Line_10
  DEFW PicFR011BochanlickinglollipopV2png_Line_11
  DEFW PicFR011BochanlickinglollipopV2png_Line_12
  DEFW PicFR011BochanlickinglollipopV2png_Line_13
  DEFW PicFR011BochanlickinglollipopV2png_Line_14
  DEFW PicFR011BochanlickinglollipopV2png_Line_15
  DEFW PicFR011BochanlickinglollipopV2png_Line_16
  DEFW PicFR011BochanlickinglollipopV2png_Line_17
  DEFW PicFR011BochanlickinglollipopV2png_Line_18
  DEFW PicFR011BochanlickinglollipopV2png_Line_19
  DEFW PicFR011BochanlickinglollipopV2png_Line_20
  DEFW PicFR011BochanlickinglollipopV2png_Line_21
  DEFW PicFR011BochanlickinglollipopV2png_Line_22
  DEFW PicFR011BochanlickinglollipopV2png_Line_23
  DEFW PicFR011BochanlickinglollipopV2png_Line_24
  DEFW PicFR011BochanlickinglollipopV2png_Line_25
  DEFW PicFR011BochanlickinglollipopV2png_Line_26
  DEFW PicFR011BochanlickinglollipopV2png_Line_27
  DEFW PicFR011BochanlickinglollipopV2png_Line_28
  DEFW PicFR011BochanlickinglollipopV2png_Line_29
  DEFW PicFR011BochanlickinglollipopV2png_Line_30
  DEFW PicFR011BochanlickinglollipopV2png_Line_31
  DEFW PicFR011BochanlickinglollipopV2png_Line_32
  DEFW PicFR011BochanlickinglollipopV2png_Line_32
  DEFW PicFR011BochanlickinglollipopV2png_Line_34
  DEFW PicFR011BochanlickinglollipopV2png_Line_35
  DEFW PicFR011BochanlickinglollipopV2png_Line_36
  DEFW PicFR011BochanlickinglollipopV2png_Line_36
  DEFW PicFR011BochanlickinglollipopV2png_Line_38
  DEFW PicFR011BochanlickinglollipopV2png_Line_39
  DEFW PicFR011BochanlickinglollipopV2png_Line_40
  DEFW PicFR011BochanlickinglollipopV2png_Line_41
  DEFW PicFR011BochanlickinglollipopV2png_Line_42
  DEFW PicFR011BochanlickinglollipopV2png_Line_43
  DEFW PicFR011BochanlickinglollipopV2png_Line_44
  DEFW PicFR011BochanlickinglollipopV2png_Line_45
  DEFW PicFR011BochanlickinglollipopV2png_Line_46
  DEFW PicFR011BochanlickinglollipopV2png_Line_47
  DEFW PicFR011BochanlickinglollipopV2png_Line_48
  DEFW PicFR011BochanlickinglollipopV2png_Line_49
  DEFW PicFR011BochanlickinglollipopV2png_Line_50
  DEFW PicFR011BochanlickinglollipopV2png_Line_51
  DEFW PicFR011BochanlickinglollipopV2png_Line_52
  DEFW PicFR011BochanlickinglollipopV2png_Line_53
  DEFW PicFR011BochanlickinglollipopV2png_Line_54
  DEFW PicFR011BochanlickinglollipopV2png_Line_55
  DEFW PicFR011BochanlickinglollipopV2png_Line_56
  DEFW PicFR011BochanlickinglollipopV2png_Line_57
  DEFW PicFR011BochanlickinglollipopV2png_Line_58
  DEFW PicFR011BochanlickinglollipopV2png_Line_59
  DEFW PicFR011BochanlickinglollipopV2png_Line_60
  DEFW PicFR011BochanlickinglollipopV2png_Line_61
  DEFW PicFR011BochanlickinglollipopV2png_Line_62
  DEFW PicFR011BochanlickinglollipopV2png_Line_63
  DEFW PicFR011BochanlickinglollipopV2png_Line_64
  DEFW PicFR011BochanlickinglollipopV2png_Line_65
  DEFW PicFR011BochanlickinglollipopV2png_Line_66
  DEFW PicFR011BochanlickinglollipopV2png_Line_67
  DEFW PicFR011BochanlickinglollipopV2png_Line_68
  DEFW PicFR011BochanlickinglollipopV2png_Line_69
  DEFW PicFR011BochanlickinglollipopV2png_Line_70
  DEFW PicFR011BochanlickinglollipopV2png_Line_71
  DEFW PicFR011BochanlickinglollipopV2png_Line_72
  DEFW PicFR011BochanlickinglollipopV2png_Line_73
  DEFW PicFR011BochanlickinglollipopV2png_Line_74
  DEFW PicFR011BochanlickinglollipopV2png_Line_75
  DEFW PicFR011BochanlickinglollipopV2png_Line_76
  DEFW PicFR011BochanlickinglollipopV2png_Line_77
  DEFW PicFR011BochanlickinglollipopV2png_Line_78
  DEFW PicFR011BochanlickinglollipopV2png_Line_79
  DEFW PicFR011BochanlickinglollipopV2png_Line_80
  DEFW PicFR011BochanlickinglollipopV2png_Line_81
  DEFW PicFR011BochanlickinglollipopV2png_Line_82
  DEFW PicFR011BochanlickinglollipopV2png_Line_83
  DEFW PicFR011BochanlickinglollipopV2png_Line_84
  DEFW PicFR011BochanlickinglollipopV2png_Line_85
  DEFW PicFR011BochanlickinglollipopV2png_Line_86
  DEFW PicFR011BochanlickinglollipopV2png_Line_87
  DEFW PicFR011BochanlickinglollipopV2png_Line_88
  DEFW PicFR011BochanlickinglollipopV2png_Line_89
  DEFW PicFR011BochanlickinglollipopV2png_Line_90
  DEFW PicFR011BochanlickinglollipopV2png_Line_91
  DEFW PicFR011BochanlickinglollipopV2png_Line_92
  DEFW PicFR011BochanlickinglollipopV2png_Line_93
  DEFW PicFR011BochanlickinglollipopV2png_Line_94
  DEFW PicFR011BochanlickinglollipopV2png_Line_95
  DEFW PicFR011BochanlickinglollipopV2png_Line_96
  DEFW PicFR011BochanlickinglollipopV2png_Line_0
  DEFW EndCode







;Global Code
RLE_ImageWidth equ 0
RLE_NextScreenLineHL:
	push de
				ld b,RLE_ImageWidth :ImageWidthE_Plus1
		ld de,&800+RLE_ImageWidth :ImageWidthD_Plus2
		add hl,de
	pop de
	ret nc
	push de
		ld de,&c050
		add hl,de
	pop de
	ret


EndCode:
ld sp,&0000:StackRestore_Plus2
ei
ret

MultiPushDeLast19: ld HL,NextLine
jr MultiPushDe19B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe17: pop HL
jr MultiPushDe17B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
MultiPushDe7: pop HL
jr MultiPushDe7B 
MultiPushDe6: pop HL
jr MultiPushDe6B 
MultiPushDe5: pop HL
jr MultiPushDe5B 
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

finalBitmapPush30: ld b,&0F
jr finalBitmapPush

finalBitmapPush26: ld b,&0D
jr finalBitmapPush

finalBitmapPush24: ld b,&0C
jr finalBitmapPush

finalBitmapPush20: ld b,&0A
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
ld hl,&0800+38
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

defb &03,&78,&F0,&87,&0F,&78,&F0,&87,&0C,&00
defb &07,&78,&F0,&0F,&0F,&78,&F0,&E1,&0E,&00
defb &0F,&F0,&F0,&0F,&0F,&3C,&F0,&E1,&0F,&00
defb &00,&01,&0F,&F0,&F0,&0F,&0F,&3C,&F0,&F0
defb &0F,&08,&00,&03,&1E,&F0,&F0,&0F,&0F,&1E
defb &F0,&F0,&87,&0C,&00,&07,&3C,&F0,&F0,&0F
defb &0F,&1E,&F0,&F0,&C3,&0C,&00,&07,&3C,&F0
defb &F0,&0F,&0F,&0F,&F0,&F0,&C3,&0E,&00,&0F
defb &78,&F0,&F0,&0F,&0F,&0C,&01,&0F,&F0,&F0
defb &E1,&0F,&0E,&30,&F0,&F0,&C0,&0F,&08,&00
defb &01,&0F,&F0,&F0,&E1,&0F,&18,&C0,&F0,&C0
defb &F0,&00,&08,&00,&03,&0F,&F0,&F0,&E1,&0E
defb &60,&00,&F0,&C0,&70,&F0,&03,&1E,&F0,&F0
defb &E1,&18,&00,&70,&F0,&E0,&10,&F0,&E0,&00
defb &03,&1E,&F0,&F0,&E1,&40,&70,&F0,&F0,&F0
defb &C0,&70,&F0,&C0,&F0,&80,&F0,&F0,&80,&00
defb &07,&1E,&F0,&C0,&00,&F0,&80,&00,&07,&3C
defb &F0,&F0,&70,&C0,&77,&EF,&00,&3F,&00,&E0
defb &70,&F0,&C0,&00,&0F,&3C,&F0,&E0,&80,&67
defb &0F,&6F,&09,&CF,&3F,&70,&B0,&F0,&C0,&00
defb &0F,&3C,&F0,&C0,&37,&0F,&0F,&3F,&9F,&0F
defb &1F,&98,&C0,&F0,&80,&00,&0F,&3C,&C0,&03
defb &CF,&7F,&FF,&8F,&AF,&0C,&03,&4E,&70,&F0
defb &00,&01,&0F,&78,&03,&3F,&0F,&CF,&1F,&CF
defb &EF,&CF,&3F,&2F,&38,&80,&00,&01,&0F,&48
defb &0E,&27,&1F,&8F,&07,&FF,&5F,&8F,&17,&DF
defb &08,&00,&00,&01,&0F,&09,&08,&27,&7F,&8E
defb &03,&FF,&5F,&8E,&03,&EF,&88,&00,&00,&01
defb &0F,&06,&0F,&47,&FF,&8E,&03,&FF,&FF,&8E
defb &03,&FF,&88,&00,&00,&01,&0C,&8C,&7F,&5F
defb &FF,&8F,&07,&FF,&5F,&8F,&07,&EF,&88,&00
defb &19,&8C,&7F,&FF,&FF,&CF,&1F,&FF,&5F,&CF
defb &1F,&EF,&88,&00,&17,&8C,&7F,&EF,&FF,&EF
defb &3F,&EF,&EF,&EF,&3F,&DF,&88,&00,&FF,&EF
defb &EF,&FF,&FF,&DF,&88,&00,&00,&05,&7F,&8D
defb &FF,&FF,&BF,&FF,&FF,&DF,&FF,&7F,&FF,&BF
defb &CC,&00,&00,&04,&77,&8D,&FF,&FF,&DF,&FF
defb &FF,&3F,&FF,&BF,&EF,&7F,&CC,&00,&00,&04
defb &77,&DF,&FF,&FF,&EF,&7F,&EF,&FF,&FF,&CF
defb &1F,&FF,&CC,&00,&00,&02,&33,&DF,&FF,&FF
defb &FF,&8F,&1F,&FF,&77,&FF,&FF,&FF,&CC,&00
defb &BB,&FF,&FF,&FF,&CC,&00,&BB,&FF,&FF,&FF
defb &88,&00,&00,&01,&02,&FF,&EE,&00,&00,&01
defb &02,&77,&EE,&00,&33,&FF,&FF,&FF,&33,&FF
defb &FF,&FF,&88,&00,&00,&02,&02,&77,&CC,&00
defb &00,&FF,&FF,&CC,&00,&02,&00,&77,&EE,&00
defb &00,&11,&00,&02,&00,&33,&FF,&00,&00,&00
defb &33,&FF,&00,&01,&0C,&11,&FF,&00,&30,&F0
defb &C0,&EE,&00,&88,&02,&0A,&33,&FF,&CC,&00
defb &70,&F0,&E0,&DC,&F0,&00,&02,&0C,&11,&FF
defb &EE,&00,&70,&F0,&E0,&B8,&F0,&80,&00,&FF
defb &FF,&EE,&70,&90,&E0,&70,&F0,&C0,&00,&33
defb &FF,&FF,&88,&66,&E0,&F0,&F0,&E0,&77,&FF
defb &FF,&FF,&60,&F0,&F0,&E0,&11,&88,&FF,&EE
defb &E0,&F0,&F0,&E0,&00,&FF,&EE,&10,&E0,&F0
defb &F0,&E0,&07,&00,&01,&18,&C0,&70,&C0,&E0
defb &00,&07,&0F,&0F,&0F,&1C,&C0,&70,&B3,&40
defb &01,&0F,&0F,&0C,&01,&1C,&C0,&10,&77,&00
defb &01,&0F,&0F,&38,&E0,&0E,&02,&00,&33,&00
defb &07,&0F,&0F,&70,&F0,&07,&0F,&00,&33,&88
defb &0F,&0F,&0E,&F0,&F0,&83,&0F,&0E,&11,&88
defb &00,&01,&0F,&0F,&1C,&F0,&F0,&C1,&0F,&0F
defb &11,&DD,&88,&00,&00,&03,&0F,&0F,&1C,&F0
defb &F0,&C1,&0F,&0C,&00,&33,&CC,&00,&00,&03
defb &0F,&0F,&1C,&F0,&F0,&C1,&0F,&1D,&00,&FF
defb &EE,&00,&00,&03,&0F,&07,&1C,&F0,&F0,&C1
defb &0F,&1D,&CE,&DD,&FF,&00,&00,&07,&0F,&07
defb &1C,&F0,&F0,&C1,&0F,&3B,&CE,&33,&FF,&00
defb &00,&07,&0F,&07,&1C,&F0,&F0,&C1,&0F,&3B
defb &CE,&EE,&FF,&00,&00,&07,&0E,&0F,&0E,&F0
defb &F0,&83,&0F,&3B,&CF,&11,&FF,&00,&00,&07
defb &0E,&0F,&0F,&30,&F0,&04,&0F,&3B,&CF,&77
defb &BB,&00,&00,&0F,&0E,&0F,&0F,&1D,&CC,&0E
defb &03,&19,&CF,&66,&77,&00,&00,&0F,&0F,&07
defb &0F,&19,&CD,&0F,&00,&0F,&0F,&07,&0F,&66
defb &AA,&0E,&00,&0F,&0E,&03,&0E,&FF,&77,&07
defb &08,&00,&06,&00,&00,&0F,&0E,&CC,&11,&FF
defb &CC,&8B,&08,&00,&0E,&00,&00,&07,&1D,&FF
defb &DD,&EE,&33,&8B,&08,&00,&0E,&00,&00,&03
defb &3B,&FF,&DD,&FF,&FF,&CD,&0C,&00,&0E,&44
defb &00,&01,&77,&FF,&DD,&FF,&FF,&03,&0E,&00
defb &2A,&CC,&00,&22,&AA,&00,&11,&FF,&DD,&FF
defb &88,&03,&0E,&00,&66,&DD,&00,&AA,&EE,&00
defb &00,&FF,&99,&EE,&77,&07,&0F,&11,&66,&FF
defb &00,&BB,&EE,&00,&00,&33,&BB,&FF,&FF,&07
defb &0F,&5D,&77,&FF,&22,&FF,&EE,&00,&00,&C0
defb &33,&EE,&00,&0E,&00,&55,&FF,&FF,&22,&FF
defb &EE,&00,&00,&F0,&C0,&FF,&EE,&1C,&F0,&77
defb &FF,&FF,&33,&FF,&EE,&00,&00,&F0,&F0,&77
defb &01,&30,&F0,&77,&FF,&FF,&33,&FF,&EE,&00
defb &00,&C0,&70,&80,&EE,&F0,&F0,&77,&FF,&EE
defb &33,&FF,&EE,&00,&10,&B0,&B0,&F0,&10,&F0
defb &F0,&77,&FF,&EE,&33,&FF,&EE,&00,&10,&F0
defb &C0,&00,&F0,&F0,&F0,&77,&FF,&EE,&55,&FF
defb &EE,&00,&30,&F0,&F0,&F0,&D0,&F0,&E0,&77
defb &FF,&EE,&DD,&FF,&EE,&00,&30,&F0,&F0,&F0
defb &C0,&00,&C0,&FF,&FF,&EE,&EE,&FF,&EE,&00
defb &30,&F0,&F0,&F0,&C0,&00,&11,&FF,&FF,&DD
defb &FF,&77,&EE,&00,&30,&F0,&F0,&F0,&C0,&00
defb &33,&FF,&FF,&BB,&FF,&FF,&EE,&00,&30,&F0
defb &F0,&F0,&80,&FF,&FF,&FF,&FF,&BB,&FF,&FF
defb &CC,&00,&30,&F0,&F0,&F0,&B3,&FF,&FF,&FF
defb &FF,&77,&FF,&33,&88,&00,&10,&F0,&F0,&F0
defb &B3,&FF,&FF,&FF,&FF,&00,&10,&F0,&F0,&F0
defb &B3,&FF,&FF,&FF,&EE,&00,&10,&F0,&F0,&F0
defb &77,&FF,&CC,&FF,&00,&F0,&F0,&F0,&77,&EE
defb &00,&70,&F0,&F0,&FF,&88,&F0,&2F,&BF,&FF
defb &0F,&7E,&AF,&88,&F0,&5F,&5F,&FF,&0F,&FD
defb &D7,&4C,&F2,&AF,&AF,&FF,&9F,&FE,&EB,&8C
defb &F5,&5F,&0F,&7F,&FF,&F8,&D3,&4E,&8F,&78
defb &03,&1F,&0F,&C0,&10,&C3,&8F,&30,&C0,&2F
defb &0F,&2F,&1E,&80,&80,&F0,&8C,&70,&60,&13
defb &0F,&2F,&78,&90,&C0,&F0,&88,&60,&30,&01
defb &0F,&07,&0F,&4F,&F8,&90,&C0,&F0,&88,&60
defb &30,&01,&F8,&80,&80,&F0,&CC,&70,&70,&00
defb &F8,&C0,&10,&F1,&CC,&30,&E0,&00,&17,&8F
defb &7F,&FF,&FC,&E0,&30,&F3,&EE,&10,&C0,&11
defb &FE,&F0,&F0,&F7,&EE,&00,&00,&11,&FF,&F0
defb &F1,&FF,&FF,&00,&00,&77,&F0,&FF,&F0,&10
defb &E0,&FF,&BF,&88,&00,&F0,&F0,&F7,&F0,&D0
defb &C0,&33,&FF,&88,&00,&70,&F0,&F7,&F0,&D0
defb &C0,&00,&FF,&00,&11,&F8,&F0,&F7,&F8,&D0
defb &C0,&00,&77,&08,&11,&FC,&F0,&FF,&F8,&E0
defb &00,&00,&23,&08,&77,&FE,&F0,&33,&CC,&70
defb &C4,&00,&23,&88,&FF,&FE,&E0,&DD,&8B,&B8
defb &F7,&00,&01,&88,&00,&11,&FF,&FE,&D1,&CE
defb &03,&5C,&FF,&88,&11,&CD,&08,&00,&00,&33
defb &FF,&FE,&D1,&9F,&57,&5C,&FF,&CC,&00,&23
defb &0C,&00,&00,&33,&FF,&FC,&D1,&BF,&DF,&DC
defb &FF,&FF,&00,&EF,&0E,&00,&00,&33,&FF,&74
defb &E0,&DF,&DF,&DC,&FF,&FF,&CC,&DD,&0F,&00
defb &00,&77,&FF,&70,&E0,&DF,&DF,&B8,&FF,&FF
defb &EE,&33,&0F,&00,&00,&77,&FF,&70,&F1,&57
defb &DF,&70,&FF,&FF,&EE,&EE,&0F,&00,&00,&77
defb &EE,&F0,&F1,&BB,&EE,&F0,&33,&FF,&FF,&11
defb &8F,&00,&00,&77,&EE,&F0,&F1,&CD,&EE,&F0
defb &80,&FF,&EE,&77,&8B,&00,&00,&FF,&EE,&F0
defb &F0,&8D,&5D,&F0,&80,&33,&FF,&66,&47,&00
defb &00,&FF,&FF,&70,&F0,&99,&5D,&F0,&80,&00
defb &00,&11,&00,&FF,&FF,&70,&F0,&06,&AA,&F0
defb &C0,&00,&00,&00,&00,&FF,&FF,&30,&E0,&0F
defb &77,&70,&C0,&00,&00,&11,&88,&00,&00,&FF
defb &FF,&CC,&01,&0F,&CC,&B8,&C0,&00,&00,&11
defb &CC,&00,&00,&77,&FF,&FF,&AB,&0E,&33,&B8
defb &E0,&00,&00,&15,&EE,&00,&00,&33,&FF,&FF
defb &23,&1F,&FF,&DC,&E0,&00,&00,&13,&FF,&00
defb &00,&11,&FF,&FF,&89,&1F,&FF,&30,&F0,&80
defb &00,&57,&FF,&22,&AB,&0F,&88,&30,&F0,&80
defb &00,&57,&66,&AA,&00,&EE,&67,&0E,&77,&74
defb &F0,&00,&00,&77,&47,&0F,&FF,&74,&C0,&00
defb &00,&77,&00,&0C,&03,&0E,&00,&F8,&80,&00
defb &00,&00,&00,&0F,&0C,&1F,&EE,&CD,&0F,&00
defb &00,&00,&00,&0F,&0F,&07,&01,&03,&0F,&00
defb &00,&00,&00,&0C,&07,&08,&EE,&0F,&0C,&00
defb &00,&00,&01,&0B,&0B,&1B,&01,&0F,&3F,&FF
defb &FF,&00,&01,&0F,&0C,&17,&CD,&0F,&3F,&77
defb &FF,&77,&03,&0F,&0E,&BF,&EE,&0F,&3B,&00
defb &33,&EE,&03,&0F,&19,&BF,&FF,&00,&00,&33
defb &CC,&EE,&03,&0F,&3B,&AE,&FF,&00,&FF,&77
defb &EE,&DD,&03,&0F,&3B,&2E,&EE,&33,&FF,&77
defb &EE,&FF,&03,&0F,&1D,&CC,&CC,&FF,&03,&0F
defb &0E,&02,&33,&FF,&EE,&FF,&EE,&77,&01,&0F
defb &0F,&0F,&3B,&FF,&DD,&FF,&EE,&00,&01,&0F
defb &0F,&0F,&3B,&FF,&DD,&FF,&FF,&00
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

LastByte:defb 0
save direct "T59-SC3.D04",FirstByte,LastByte-FirstByte
