org &4000

nolist
FirstByte:
jp PicLoading2png
jp PicEp2Continuepng_Processedpng
jp PicSetDisk3png

PicLoading2png:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C000+0+80

LD IX,PicLoading2png_DrawOrder
JP JumpToNextLine


PicLoading2png_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicLoading2png_Line_1:
jp MultiPushDeLast40


PicLoading2png_Line_1_Reuse:
LD DE,&0000
JP PicLoading2png_Line_1
PicLoading2png_Line_48:
call MultiPushDe35
LD HL,&0020
  Push HL
LD BC,&3000
  Push BC
 jp NextLinePushDe3


PicLoading2png_Line_49:
call MultiPushDe35
call BitmapPush8
defw BitmapData+7
 jp NextLinePushDe1


PicLoading2png_Line_50:
call MultiPushDe35
call BitmapPush8
defw BitmapData+15
 jp NextLinePushDe1


PicLoading2png_Line_51:
call MultiPushDe35
LD HL,&2000
  Push HL
  PUSH DE
LD BC,&F000
  Push BC
Ld H,&70
  Push HL
 jp NextLinePushDe1


PicLoading2png_Line_52:
call MultiPushDe34
call BitmapPush10
defw BitmapData+25
 jp NextLinePushDe1


PicLoading2png_Line_53:
call MultiPushDe34
LD HL,&0040
  Push HL
  PUSH DE
LD BC,&0060
  Push BC
Ld E,&10
  PUSH DE
  PUSH DE

Ld L,D

  jp NextLinePushHl 


PicLoading2png_Line_54:
Ld E,&00
call MultiPushDe34
call BitmapPush10
defw BitmapData+35
 jp NextLinePushDe1


PicLoading2png_Line_55:
call MultiPushDe34
LD HL,&0010
  Push HL
LD BC,&0032
  Push BC
  PUSH DE
Ld E,&60
  PUSH DE
  PUSH DE

Ld L,D

  jp NextLinePushHl 


PicLoading2png_Line_56:
Ld E,&00
call MultiPushDe33
call BitmapPush12
defw BitmapData+47
 jp NextLinePushDe1


PicLoading2png_Line_57:
call MultiPushDe33
call BitmapPush12
defw BitmapData+59
 jp NextLinePushDe1


PicLoading2png_Line_58:
call MultiPushDe33
call BitmapPush12
defw BitmapData+71
 jp NextLinePushDe1


PicLoading2png_Line_59:
call MultiPushDe33
call BitmapPush6
defw BitmapData+77
  PUSH DE
call FinalBitmapPush6
defw BitmapData+83


PicLoading2png_Line_60:
call MultiPushDe33
LD HL,&7744
  Push HL
LD BC,&9000
  Push BC
  PUSH DE
call FinalBitmapPush8
defw BitmapData+91


PicLoading2png_Line_61:
call MultiPushDe32
LD HL,&0088
  Push HL
LD BC,&3322
  Push BC
Ld D,&10
  PUSH DE
  PUSH DE
Ld L,&80
  Push HL
LD BC,&1120
  Push BC
  PUSH DE
LD HL,&3000
  jp NextLinePushHl 


PicLoading2png_Line_62:
Ld D,E
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+107


PicLoading2png_Line_63:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+123


PicLoading2png_Line_64:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+139


PicLoading2png_Line_65:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+155


PicLoading2png_Line_66:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+171


PicLoading2png_Line_67:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+187


PicLoading2png_Line_68:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+203


PicLoading2png_Line_69:
call MultiPushDe32
call FinalBitmapPush16
defw BitmapData+219


PicLoading2png_Line_70:
call MultiPushDe31
call FinalBitmapPush18
defw BitmapData+237


PicLoading2png_Line_71:
call MultiPushDe31
call BitmapPush14
defw BitmapData+251
 jp NextLinePushDe2


PicLoading2png_Line_72:
call MultiPushDe31
call BitmapPush14
defw BitmapData+265
 jp NextLinePushDe2


PicLoading2png_Line_73:
call MultiPushDe31
call BitmapPush14
defw BitmapData+279
 jp NextLinePushDe2


PicLoading2png_Line_74:
call MultiPushDe31
call BitmapPush14
defw BitmapData+293
 jp NextLinePushDe2


PicLoading2png_Line_75:
call MultiPushDe31
call BitmapPush14
defw BitmapData+307
 jp NextLinePushDe2


PicLoading2png_Line_76:
call MultiPushDe31
call BitmapPush14
defw BitmapData+321
 jp NextLinePushDe2


PicLoading2png_Line_77:
call MultiPushDe30
call BitmapPush16
defw BitmapData+337
 jp NextLinePushDe2


PicLoading2png_Line_78:
call MultiPushDe30
call BitmapPush14
defw BitmapData+351
 jp NextLinePushDe3


PicLoading2png_Line_79:
call MultiPushDe30
LD HL,&0044
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+361
 jp NextLinePushDe3


PicLoading2png_Line_80:
call MultiPushDe30
Ld E,&AA
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+371
Ld E,&00
 jp NextLinePushDe3


PicLoading2png_Line_81:
call MultiPushDe30
call BitmapPush14
defw BitmapData+385
 jp NextLinePushDe3


PicLoading2png_Line_82:
call MultiPushDe30
call BitmapPush12
defw BitmapData+397
 jp NextLinePushDe4


PicLoading2png_Line_83:
call MultiPushDe29
call BitmapPush14
defw BitmapData+411
 jp NextLinePushDe4


PicLoading2png_Line_84:
call MultiPushDe29
call BitmapPush16
defw BitmapData+427
 jp NextLinePushDe3


PicLoading2png_Line_85:
call MultiPushDe29
call BitmapPush6
defw BitmapData+433
  PUSH DE
call BitmapPush8
defw BitmapData+441
 jp NextLinePushDe3


PicLoading2png_Line_86:
call MultiPushDe29
LD HL,&0200
  Push HL
LD BC,&8899
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+449
 jp NextLinePushDe3


PicLoading2png_Line_87:
call MultiPushDe29
LD HL,&0400
  Push HL
LD BC,&8855
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+457
 jp NextLinePushDe3


PicLoading2png_Line_88:
call MultiPushDe29
LD HL,&0800
  Push HL
LD BC,&8811
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+465
 jp NextLinePushDe3


PicLoading2png_Line_89:
call MultiPushDe29
LD HL,&0F0E
  Push HL
LD BC,&8811
  Push BC
  PUSH DE
LD HL,&0008
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+471
 jp NextLinePushDe3


PicLoading2png_Line_90:
call MultiPushDe5
LD HL,&E070
  Push HL
call MultiPushDe15
LD BC,&C0F0
  Push BC
call MultiPushDe7
LD HL,&0002
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+481
 jp NextLinePushDe3


PicLoading2png_Line_91:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+487
  PUSH DE
LD HL,&F010
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+493
  PUSH DE
LD BC,&80F0
  Push BC
LD HL,&F010
  Push HL
  PUSH DE
LD BC,&00E0
  Push BC
LD HL,&3000
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+499
  PUSH DE
LD BC,&00C0
  Push BC
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&04
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+511
 jp NextLinePushDe2


PicLoading2png_Line_92:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+521
  PUSH DE
call BitmapPush6
defw BitmapData+527
  PUSH DE
LD HL,&F0F0
  Push HL
LD BC,&F030
  Push BC
  PUSH DE
Ld H,&80
  Push HL
LD BC,&7000
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+533
  PUSH DE
LD HL,&00E0
  Push HL
LD BC,&7000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&08
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+541
 jp NextLinePushDe2


PicLoading2png_Line_93:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+565
  PUSH DE
LD HL,&80F0
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+571
  PUSH DE
LD HL,&00E0
  Push HL
LD BC,&F000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&0E
  Push HL
Ld B,&06
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+583
 jp NextLinePushDe2


PicLoading2png_Line_94:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+607
  PUSH DE
LD HL,&80F0
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+613
  PUSH DE
LD HL,&00E0
  Push HL
LD BC,&F000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0200
  Push HL
  PUSH DE
LD BC,&0008
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+621
 jp NextLinePushDe2


PicLoading2png_Line_95:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+645
  PUSH DE
LD HL,&C0F0
  Push HL
LD BC,&F010
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+657
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0400
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+663
  PUSH DE
LD BC,&0022
  Push BC
LD HL,&0C97
  Push HL
 jp NextLinePushDe2


PicLoading2png_Line_96:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+645
  PUSH DE
LD HL,&C0F0
  Push HL
LD BC,&F010
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+657
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0600
  Push HL
  PUSH DE
LD BC,&0008
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+669
 jp NextLinePushDe2


PicLoading2png_Line_97:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C070
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+689
  PUSH DE
LD BC,&E0F0
  Push BC
LD HL,&F030
  Push HL
  PUSH DE
Ld B,H


  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+697
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+705
  PUSH DE
call BitmapPush10
defw BitmapData+715
 jp NextLinePushDe1


PicLoading2png_Line_98:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C070
  Push HL
  PUSH DE
call BitmapPush20
defw BitmapData+689
  PUSH DE
LD BC,&E0F0
  Push BC
LD HL,&F030
  Push HL
  PUSH DE
Ld B,H


  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+697
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+727
  PUSH DE
call BitmapPush6
defw BitmapData+733
 jp NextLinePushDe1


PicLoading2png_Line_99:
call MultiPushDe6
call BitmapPush16
defw BitmapData+749
  PUSH DE
LD HL,&F070
  Push HL
  PUSH DE
  Push HL 
LD BC,&F030
  Push BC
  PUSH DE
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+757
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+767
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+773
 jp NextLinePushDe1


PicLoading2png_Line_100:
call MultiPushDe6
call BitmapPush16
defw BitmapData+749
  PUSH DE
LD HL,&F070
  Push HL
  PUSH DE
  Push HL 
LD BC,&F030
  Push BC
  PUSH DE
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+757
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+783
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+789
 jp NextLinePushDe1


PicLoading2png_Line_101:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+799
LD DE,&E0F0
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+819
LD HL,&00E0
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+839
 jp NextLinePushDe1


PicLoading2png_Line_102:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+799
LD DE,&E0F0
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+819
LD HL,&00E0
  Push HL
Ld B,E
Ld C,H

  Push BC
Call PushDE_0000x
call FinalBitmapPush20
defw BitmapData+859


PicLoading2png_Line_103:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+867
LD DE,&F030
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+887
  PUSH DE
call BitmapPush10
defw BitmapData+897
Call PushDE_0000x
call BitmapPush6
defw BitmapData+903
LD DE,&FAFA
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+909


PicLoading2png_Line_104:
Call PushDE_0000x
call BitmapPush8
defw BitmapData+867
LD DE,&F030
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+887
  PUSH DE
call BitmapPush10
defw BitmapData+897
Call PushDE_0000x
call BitmapPush8
defw BitmapData+917
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+923


PicLoading2png_Line_105:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+943
  PUSH DE
call BitmapPush12
defw BitmapData+955
  PUSH DE
call BitmapPush8
defw BitmapData+757
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+963
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+969


PicLoading2png_Line_106:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+943
  PUSH DE
call BitmapPush12
defw BitmapData+955
  PUSH DE
call BitmapPush8
defw BitmapData+757
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+977
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+985


PicLoading2png_Line_107:
Call PushDE_0000x
LD HL,&F030
  Push HL
  PUSH DE
call BitmapPush22
defw BitmapData+1007
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1017
Call PushDE_0000x
call BitmapPush8
defw BitmapData+1025
LD DE,&F5F5
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1033


PicLoading2png_Line_108:
Call PushDE_0000x
LD HL,&F030
  Push HL
  PUSH DE
call BitmapPush22
defw BitmapData+1007
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1017
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1055


PicLoading2png_Line_109:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1081
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1087
  PUSH DE
call BitmapPush6
defw BitmapData+651
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1109


PicLoading2png_Line_110:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1081
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1087
  PUSH DE
call BitmapPush6
defw BitmapData+651
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1131


PicLoading2png_Line_111:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush36
defw BitmapData+1167
call BitmapPush8
defw BitmapData+1175
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1197


PicLoading2png_Line_112:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush36
defw BitmapData+1167
call BitmapPush8
defw BitmapData+1175
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1219


PicLoading2png_Line_113:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1229
  PUSH DE
call BitmapPush32
defw BitmapData+1261
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1283


PicLoading2png_Line_114:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1229
  PUSH DE
call BitmapPush32
defw BitmapData+1261
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1305


PicLoading2png_Line_115:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+487
  PUSH DE
LD HL,&F070
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+692
  PUSH DE
call BitmapPush24
defw BitmapData+1329
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1349
 jp NextLinePushDe1


PicLoading2png_Line_116:
call MultiPushDe5
LD HL,&E070
  Push HL
  PUSH DE
  PUSH DE
LD BC,&E010
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1355
  PUSH DE
call BitmapPush6
defw BitmapData+1361
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&7000
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1371
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1391
 jp NextLinePushDe1


PicLoading2png_Line_117:
call MultiPushDe29
call BitmapPush20
defw BitmapData+1411
 jp NextLinePushDe1


PicLoading2png_Line_118:
call MultiPushDe30
call BitmapPush18
defw BitmapData+1429
 jp NextLinePushDe1


PicLoading2png_Line_119:
call MultiPushDe30
call BitmapPush16
defw BitmapData+1445
 jp NextLinePushDe2


PicLoading2png_Line_120:
call MultiPushDe30
call BitmapPush16
defw BitmapData+1461
 jp NextLinePushDe2


PicLoading2png_Line_121:
call MultiPushDe30
call BitmapPush16
defw BitmapData+1477
 jp NextLinePushDe2


PicLoading2png_Line_122:
call MultiPushDe30
call BitmapPush16
defw BitmapData+1493
 jp NextLinePushDe2


PicLoading2png_Line_123:
call MultiPushDe31
call BitmapPush14
defw BitmapData+1507
 jp NextLinePushDe2


PicLoading2png_Line_124:
call MultiPushDe31
call BitmapPush14
defw BitmapData+1521
 jp NextLinePushDe2


PicLoading2png_Line_125:
call MultiPushDe30
call BitmapPush16
defw BitmapData+1537
 jp NextLinePushDe2


PicLoading2png_Line_126:
call MultiPushDe28
call BitmapPush12
defw BitmapData+1549
LD DE,&AAAA
  PUSH DE
  PUSH DE
LD HL,&AA22
  Push HL
LD BC,&4400
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicLoading2png_Line_127:
call MultiPushDe28
LD HL,&00F4
  Push HL
LD BC,&3802
  Push BC
Ld E,&D0
  PUSH DE
  PUSH DE
LD HL,&7500
  Push HL
LD BC,&2244
  Push BC
LD DE,&5555
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&22
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicLoading2png_Line_128:
call MultiPushDe28
call BitmapPush12
defw BitmapData+1561
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
 jp NextLinePushDe2


PicLoading2png_Line_129:
call MultiPushDe28
call BitmapPush12
defw BitmapData+1573
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
 jp NextLinePushDe2


PicLoading2png_Line_130:
call MultiPushDe28
call BitmapPush12
defw BitmapData+1585
LD DE,&5555
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5500
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicLoading2png_Line_131:
call MultiPushDe27
call BitmapPush12
defw BitmapData+1597
LD DE,&AAAA
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicLoading2png_Line_132:
call MultiPushDe27
call BitmapPush12
defw BitmapData+1609
Call PushDE_FFFFx
LD HL,&FF33
  Push HL
INC DE

 jp NextLinePushDe2


PicLoading2png_Line_133:
call MultiPushDe27
call BitmapPush14
defw BitmapData+1623
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0044
  Push HL
 jp NextLinePushDe2


PicLoading2png_Line_134:
call MultiPushDe27
call BitmapPush16
defw BitmapData+1639
LD DE,&3030
  PUSH DE
  PUSH DE
LD HL,&308B
  Push HL
LD DE,&0000
 jp NextLinePushDe2


PicLoading2png_Line_135:
call MultiPushDe27
call BitmapPush10
defw BitmapData+1649
Ld D,&88
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&1100
  Push HL
 jp NextLinePushDe1


PicLoading2png_Line_136:
call MultiPushDe27
call BitmapPush16
defw BitmapData+1665
LD DE,&9090
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1671


PicLoading2png_Line_137:
LD DE,&0000
call MultiPushDe27
call BitmapPush10
defw BitmapData+1681
Ld D,&22
  PUSH DE
  PUSH DE
Call PushDE_0000x
LD HL,&4400
  Push HL
 jp NextLinePushDe1


PicLoading2png_Line_138:
call MultiPushDe27
call BitmapPush10
defw BitmapData+1691
DEC DE

call MultiPushDe6
LD HL,&BB10
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicLoading2png_Line_139:
INC DE

call MultiPushDe27
call BitmapPush12
defw BitmapData+1703
LD DE,&F0F0
call MultiPushDe5
LD HL,&9810
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicLoading2png_Line_140:
LD DE,&0000
call MultiPushDe27
call BitmapPush14
defw BitmapData+1717
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8810
  Push HL
 jp NextLinePushDe1


PicLoading2png_Line_141:
call MultiPushDe27
call BitmapPush14
defw BitmapData+1731
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8810
  Push HL
 jp NextLinePushDe1


PicLoading2png_Line_142:
call MultiPushDe30
LD HL,&0807
  Push HL
LD BC,&C188
  Push BC
DEC DE

call MultiPushDe6
LD HL,&FF10
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicLoading2png_Line_143:
INC DE

call MultiPushDe31
LD HL,&0080
  Push HL
LD DE,&F0F0
call MultiPushDe6
LD BC,&F010
  Push BC
LD HL,&0000
  jp NextLinePushHl 



PicLoading2png_DrawOrder: 

  DEFW PicLoading2png_Line_0
  DEFW PicLoading2png_Line_1
defw looper
  DEFB 1,46
  DEFW PicLoading2png_Line_1_Reuse
  DEFW PicLoading2png_Line_48
  DEFW PicLoading2png_Line_49
  DEFW PicLoading2png_Line_50
  DEFW PicLoading2png_Line_51
  DEFW PicLoading2png_Line_52
  DEFW PicLoading2png_Line_53
  DEFW PicLoading2png_Line_54
  DEFW PicLoading2png_Line_55
  DEFW PicLoading2png_Line_56
  DEFW PicLoading2png_Line_57
  DEFW PicLoading2png_Line_58
  DEFW PicLoading2png_Line_59
  DEFW PicLoading2png_Line_60
  DEFW PicLoading2png_Line_61
  DEFW PicLoading2png_Line_62
  DEFW PicLoading2png_Line_63
  DEFW PicLoading2png_Line_64
  DEFW PicLoading2png_Line_65
  DEFW PicLoading2png_Line_66
  DEFW PicLoading2png_Line_67
  DEFW PicLoading2png_Line_68
  DEFW PicLoading2png_Line_69
  DEFW PicLoading2png_Line_70
  DEFW PicLoading2png_Line_71
  DEFW PicLoading2png_Line_72
  DEFW PicLoading2png_Line_73
  DEFW PicLoading2png_Line_74
  DEFW PicLoading2png_Line_75
  DEFW PicLoading2png_Line_76
  DEFW PicLoading2png_Line_77
  DEFW PicLoading2png_Line_78
  DEFW PicLoading2png_Line_79
  DEFW PicLoading2png_Line_80
  DEFW PicLoading2png_Line_81
  DEFW PicLoading2png_Line_82
  DEFW PicLoading2png_Line_83
  DEFW PicLoading2png_Line_84
  DEFW PicLoading2png_Line_85
  DEFW PicLoading2png_Line_86
  DEFW PicLoading2png_Line_87
  DEFW PicLoading2png_Line_88
  DEFW PicLoading2png_Line_89
  DEFW PicLoading2png_Line_90
  DEFW PicLoading2png_Line_91
  DEFW PicLoading2png_Line_92
  DEFW PicLoading2png_Line_93
  DEFW PicLoading2png_Line_94
  DEFW PicLoading2png_Line_95
  DEFW PicLoading2png_Line_96
  DEFW PicLoading2png_Line_97
  DEFW PicLoading2png_Line_98
  DEFW PicLoading2png_Line_99
  DEFW PicLoading2png_Line_100
  DEFW PicLoading2png_Line_101
  DEFW PicLoading2png_Line_102
  DEFW PicLoading2png_Line_103
  DEFW PicLoading2png_Line_104
  DEFW PicLoading2png_Line_105
  DEFW PicLoading2png_Line_106
  DEFW PicLoading2png_Line_107
  DEFW PicLoading2png_Line_108
  DEFW PicLoading2png_Line_109
  DEFW PicLoading2png_Line_110
  DEFW PicLoading2png_Line_111
  DEFW PicLoading2png_Line_112
  DEFW PicLoading2png_Line_113
  DEFW PicLoading2png_Line_114
  DEFW PicLoading2png_Line_115
  DEFW PicLoading2png_Line_116
  DEFW PicLoading2png_Line_117
  DEFW PicLoading2png_Line_118
  DEFW PicLoading2png_Line_119
  DEFW PicLoading2png_Line_120
  DEFW PicLoading2png_Line_121
  DEFW PicLoading2png_Line_122
  DEFW PicLoading2png_Line_123
  DEFW PicLoading2png_Line_124
  DEFW PicLoading2png_Line_125
  DEFW PicLoading2png_Line_126
  DEFW PicLoading2png_Line_127
  DEFW PicLoading2png_Line_128
  DEFW PicLoading2png_Line_129
  DEFW PicLoading2png_Line_130
  DEFW PicLoading2png_Line_131
  DEFW PicLoading2png_Line_132
  DEFW PicLoading2png_Line_133
  DEFW PicLoading2png_Line_134
  DEFW PicLoading2png_Line_135
  DEFW PicLoading2png_Line_136
  DEFW PicLoading2png_Line_137
  DEFW PicLoading2png_Line_138
  DEFW PicLoading2png_Line_139
  DEFW PicLoading2png_Line_140
  DEFW PicLoading2png_Line_141
  DEFW PicLoading2png_Line_142
  DEFW PicLoading2png_Line_143
  DEFW PicLoading2png_Line_0
defw looper
  DEFB 1,55
  DEFW PicLoading2png_Line_1_Reuse
  DEFW EndCode
PicEp2Continuepng_Processedpng:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C000+0+80

LD IX,PicEp2Continuepng_Processedpng_DrawOrder
JP JumpToNextLine


PicEp2Continuepng_Processedpng_Line_37:
call MultiPushDe30
LD HL,&F030
  Push HL
Ld E,&03
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0006
  Push BC
LD HL,&0003
  Push HL
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_38:
call MultiPushDe30
LD HL,&F070
  Push HL
Ld E,&03
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0006
  Push BC
LD HL,&0003
  Push HL
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_39:
call MultiPushDe29
LD HL,&0080
  Push HL
LD BC,&F0F0
  Push BC
Ld E,&03
  PUSH DE
  PUSH DE

Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&0E
  Push HL
LD BC,&0003
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_40:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1739
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000E
  Push HL
LD BC,&0003
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_41:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1747
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000C
  Push HL
LD BC,&0007
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_42:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1755
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000C
  Push HL
LD BC,&0106
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_43:
call MultiPushDe29
call BitmapPush6
defw BitmapData+571
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000C
  Push HL
LD BC,&0106
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_44:
call MultiPushDe29
call BitmapPush6
defw BitmapData+1149
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0106
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_45:
call MultiPushDe29
call BitmapPush6
defw BitmapData+1761
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0100
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_46:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1769
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0100
  Push BC
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_47:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1777
jp MultiPushDeLast7


PicEp2Continuepng_Processedpng_Line_48:
call MultiPushDe29
call BitmapPush10
defw BitmapData+1787
jp MultiPushDeLast6


PicEp2Continuepng_Processedpng_Line_49:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1795
jp MultiPushDeLast7


PicEp2Continuepng_Processedpng_Line_50:
call MultiPushDe29
call BitmapPush10
defw BitmapData+1805
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C030
  Push HL
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_51:
call MultiPushDe29
LD HL,&80B0
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1811
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
LD HL,&F070
  Push HL
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_52:
call MultiPushDe29
LD HL,&00D0
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1817
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD HL,&F0F0
  Push HL
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_53:
call MultiPushDe29
LD HL,&0060
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1823
  PUSH DE
LD BC,&080A
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1829


PicEp2Continuepng_Processedpng_Line_54:
call MultiPushDe31
call BitmapPush6
defw BitmapData+1835
  PUSH DE
LD HL,&0405
  Push HL
LD BC,&0100
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_55:
LD DE,&0000
call MultiPushDe31
call BitmapPush6
defw BitmapData+1841
  PUSH DE
LD HL,&0A0B
  Push HL
LD BC,&00F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&3000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_56:
LD DE,&0000
call MultiPushDe30
call BitmapPush14
defw BitmapData+1855
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&7000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_57:
LD DE,&0000
call MultiPushDe29
call BitmapPush16
defw BitmapData+1871
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_58:
LD DE,&0000
call MultiPushDe28
call BitmapPush18
defw BitmapData+1889
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_59:
LD DE,&0000
call MultiPushDe28
LD HL,&00C0
  Push HL
LD BC,&F070
  Push BC
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1907


PicEp2Continuepng_Processedpng_Line_60:
call MultiPushDe28
LD HL,&00C0
  Push HL
LD BC,&F070
  Push BC
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1925


PicEp2Continuepng_Processedpng_Line_61:
call MultiPushDe28
call FinalBitmapPush24
defw BitmapData+1949


PicEp2Continuepng_Processedpng_Line_62:
call MultiPushDe29
call FinalBitmapPush22
defw BitmapData+1971


PicEp2Continuepng_Processedpng_Line_63:
call MultiPushDe29
call BitmapPush8
defw BitmapData+1979
LD DE,&0F0F
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1989


PicEp2Continuepng_Processedpng_Line_64:
LD DE,&0000
call MultiPushDe28
call FinalBitmapPush24
defw BitmapData+2013


PicEp2Continuepng_Processedpng_Line_65:
call MultiPushDe28
call BitmapPush22
defw BitmapData+2035
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_66:
call MultiPushDe28
call FinalBitmapPush24
defw BitmapData+2059


PicEp2Continuepng_Processedpng_Line_67:
call MultiPushDe29
call FinalBitmapPush22
defw BitmapData+2081


PicEp2Continuepng_Processedpng_Line_68:
call MultiPushDe23
LD HL,&0070
  Push HL
call MultiPushDe6
call BitmapPush6
defw BitmapData+2087
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2095


PicEp2Continuepng_Processedpng_Line_69:
LD DE,&0000
call MultiPushDe23
LD HL,&0070
  Push HL
call MultiPushDe6
call FinalBitmapPush20
defw BitmapData+2115


PicEp2Continuepng_Processedpng_Line_70:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C010
  Push HL
call MultiPushDe19
LD BC,&00F0
  Push BC
call MultiPushDe6
call FinalBitmapPush20
defw BitmapData+2135


PicEp2Continuepng_Processedpng_Line_71:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C010
  Push HL
call MultiPushDe19
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush24
defw BitmapData+2159


PicEp2Continuepng_Processedpng_Line_72:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&C010
  Push BC
call MultiPushDe19
call BitmapPush8
defw BitmapData+2167
  PUSH DE
call BitmapPush12
defw BitmapData+2179
LD DE,&0A0A
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2187


PicEp2Continuepng_Processedpng_Line_73:
call BitmapPush8
defw BitmapData+2195
LD DE,&0000
call MultiPushDe19
call BitmapPush8
defw BitmapData+2167
  PUSH DE
call BitmapPush20
defw BitmapData+2215
  PUSH DE
LD HL,&8020
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_74:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&C010
  Push BC
call MultiPushDe6
call BitmapPush6
defw BitmapData+565
call MultiPushDe10
call BitmapPush8
defw BitmapData+2223
  PUSH DE
call BitmapPush20
defw BitmapData+2243
  PUSH DE
LD HL,&0030
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_75:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&C010
  Push BC
call MultiPushDe6
call BitmapPush6
defw BitmapData+565
call MultiPushDe10
call BitmapPush8
defw BitmapData+2223
  PUSH DE
call BitmapPush20
defw BitmapData+2263
  PUSH DE
LD HL,&8030
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_76:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&8030
  Push BC
call MultiPushDe6
call BitmapPush6
defw BitmapData+2269
call MultiPushDe11
LD HL,&E000
  Push HL
LD BC,&C070
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2281
  PUSH DE
call BitmapPush6
defw BitmapData+2287
  PUSH DE
LD HL,&0030
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_77:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&8030
  Push BC
call MultiPushDe6
call BitmapPush6
defw BitmapData+2269
call MultiPushDe11
LD HL,&E000
  Push HL
LD BC,&C070
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2307
  PUSH DE
LD HL,&0030
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_78:
  PUSH DE
call BitmapPush8
defw BitmapData+2315
  PUSH DE
LD HL,&C070
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+2321
  PUSH DE
LD BC,&E010
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+2329
  PUSH DE
  PUSH DE
LD BC,&0DE1
  Push BC
LD HL,&F000
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+2343
  PUSH DE
LD BC,&0030
 jp NextLinePushBC 


PicEp2Continuepng_Processedpng_Line_79:
  PUSH DE
call BitmapPush8
defw BitmapData+2315
  PUSH DE
LD HL,&C070
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+2321
  PUSH DE
LD BC,&E010
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+2329
  PUSH DE
  PUSH DE
LD BC,&0EE1
  Push BC
LD HL,&F000
  Push HL
  PUSH DE
call FinalBitmapPush18
defw BitmapData+2361


PicEp2Continuepng_Processedpng_Line_80:
  PUSH DE
call BitmapPush8
defw BitmapData+2369
  PUSH DE
call BitmapPush6
defw BitmapData+2375
Ld D,&70
  PUSH DE
  PUSH DE
Ld H,E
Ld L,E

  Push HL
LD BC,&E010
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
LD HL,&70E0
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2391
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2413
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_81:
  PUSH DE
call BitmapPush8
defw BitmapData+2369
  PUSH DE
call BitmapPush6
defw BitmapData+2375
Ld D,&70
  PUSH DE
  PUSH DE
Ld H,E
Ld L,E

  Push HL
LD BC,&E010
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
LD HL,&70E0
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2391
  PUSH DE
call BitmapPush20
defw BitmapData+2433
  PUSH DE
LD BC,&F010
  Push BC
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_82:
  PUSH DE
call BitmapPush8
defw BitmapData+2441
  PUSH DE
call BitmapPush10
defw BitmapData+2451
  PUSH DE
LD HL,&C010
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2473
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2491
  PUSH DE
LD BC,&C030
  Push BC
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_83:
  PUSH DE
call BitmapPush8
defw BitmapData+2441
  PUSH DE
call BitmapPush10
defw BitmapData+2451
  PUSH DE
LD HL,&C010
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2473
  PUSH DE
call BitmapPush20
defw BitmapData+2511
  PUSH DE
LD BC,&8070
  Push BC
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_84:
  PUSH DE
call BitmapPush20
defw BitmapData+2531
  PUSH DE
LD HL,&C030
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2537
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2547
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2565
  PUSH DE
LD BC,&00F0
  Push BC
 jp NextLinePushDe1


PicEp2Continuepng_Processedpng_Line_85:
  PUSH DE
call BitmapPush20
defw BitmapData+2531
  PUSH DE
LD HL,&C030
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2537
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2547
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush24
defw BitmapData+2589


PicEp2Continuepng_Processedpng_Line_86:
  PUSH DE
call BitmapPush14
defw BitmapData+2603
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
LD HL,&C030
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+2611
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&C010
  Push HL
Ld E,&70
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD HL,&1000
  Push HL

Ld E,L

  PUSH DE
  PUSH DE
call FinalBitmapPush24
defw BitmapData+2635


PicEp2Continuepng_Processedpng_Line_87:
  PUSH DE
call BitmapPush14
defw BitmapData+2603
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
LD HL,&C030
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+2611
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&C010
  Push HL
Ld E,&70
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD HL,&1000
  Push HL

Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2655
  PUSH DE
LD BC,&7000
 jp NextLinePushBC 


PicEp2Continuepng_Processedpng_Line_88:
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2677
  PUSH DE
call BitmapPush8
defw BitmapData+2685
  PUSH DE
call BitmapPush14
defw BitmapData+2699
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2719
  PUSH DE
LD HL,&6000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_89:
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2677
  PUSH DE
call BitmapPush8
defw BitmapData+2685
  PUSH DE
call BitmapPush14
defw BitmapData+2699
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2735
  PUSH DE
LD HL,&7200
  Push HL
  PUSH DE
LD BC,&E000
 jp NextLinePushBC 


PicEp2Continuepng_Processedpng_Line_90:
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2751
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&F030
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+2759
  PUSH DE
call BitmapPush14
defw BitmapData+2773
  PUSH DE
call BitmapPush16
defw BitmapData+2789
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&7000
  Push BC
  PUSH DE
LD HL,&C000
  jp NextLinePushHl 


PicEp2Continuepng_Processedpng_Line_91:
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2751
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&F030
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+2759
  PUSH DE
call BitmapPush14
defw BitmapData+2773
  PUSH DE
  PUSH DE
call FinalBitmapPush24
defw BitmapData+2813


PicEp2Continuepng_Processedpng_Line_92:
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2835
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+2845
  PUSH DE
call BitmapPush6
defw BitmapData+2794
  PUSH DE
call FinalBitmapPush26
defw BitmapData+2871


PicEp2Continuepng_Processedpng_Line_93:
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2835
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+2845
  PUSH DE
call BitmapPush6
defw BitmapData+2794
  PUSH DE
call BitmapPush18
defw BitmapData+2889
  PUSH DE
call FinalBitmapPush6
defw BitmapData+2895


PicEp2Continuepng_Processedpng_Line_94:
call MultiPushDe9
LD HL,&00C0
  Push HL
LD BC,&0060
  Push BC
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&C0
  Push HL
Ld B,&10
  Push BC
  PUSH DE
call BitmapPush18
defw BitmapData+2913
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
LD BC,&0010
 jp NextLinePushBC 


PicEp2Continuepng_Processedpng_Line_95:
call MultiPushDe9
LD HL,&00C0
  Push HL
LD BC,&0060
  Push BC
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&70
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&C0
  Push HL
Ld B,&10
  Push BC
  PUSH DE
call FinalBitmapPush26
defw BitmapData+2939


PicEp2Continuepng_Processedpng_Line_96:
call MultiPushDe9
Ld E,&60
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe7
call FinalBitmapPush26
defw BitmapData+2965


PicEp2Continuepng_Processedpng_Line_97:
call MultiPushDe9
Ld E,&60
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe7
call BitmapPush14
defw BitmapData+2979
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2989


PicEp2Continuepng_Processedpng_Line_98:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2997
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3021


PicEp2Continuepng_Processedpng_Line_99:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2997
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3045


PicEp2Continuepng_Processedpng_Line_100:
call MultiPushDe9
call BitmapPush22
defw BitmapData+3067
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3091


PicEp2Continuepng_Processedpng_Line_101:
call MultiPushDe9
call BitmapPush22
defw BitmapData+3067
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3115


PicEp2Continuepng_Processedpng_Line_102:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+3131
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3155


PicEp2Continuepng_Processedpng_Line_103:
call MultiPushDe9
LD HL,&0060
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3131
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3179


PicEp2Continuepng_Processedpng_Line_104:
call MultiPushDe9
call BitmapPush22
defw BitmapData+3201
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3225


PicEp2Continuepng_Processedpng_Line_105:
call MultiPushDe9
call BitmapPush22
defw BitmapData+3201
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+3249


PicEp2Continuepng_Processedpng_Line_106:
call MultiPushDe9
LD HL,&0080
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&3070
  Push BC
LD HL,&0080
  Push HL
Ld D,C


  PUSH DE
  PUSH DE
Ld D,H


call MultiPushDe7
call FinalBitmapPush26
defw BitmapData+3275


PicEp2Continuepng_Processedpng_Line_107:
call MultiPushDe9
LD HL,&0080
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&3070
  Push BC
LD HL,&0080
  Push HL
Ld D,C


  PUSH DE
  PUSH DE
Ld D,H


call MultiPushDe7
call FinalBitmapPush26
defw BitmapData+3301


PicEp2Continuepng_Processedpng_Line_108:
call MultiPushDe10
LD HL,&3000
  Push HL
call MultiPushDe5
LD BC,&3000
  Push BC
  PUSH DE
LD HL,&0080
  Push HL
Ld B,&10
  Push BC
call MultiPushDe7
call FinalBitmapPush26
defw BitmapData+3327


PicEp2Continuepng_Processedpng_Line_109:
call MultiPushDe10
LD HL,&3000
  Push HL
call MultiPushDe5
LD BC,&2080
  Push BC
  PUSH DE
Ld H,E
Ld L,C

  Push HL
LD BC,&1000
  Push BC
call MultiPushDe7
call FinalBitmapPush26
defw BitmapData+3353


PicEp2Continuepng_Processedpng_Line_110:
call MultiPushDe16
LD HL,&60E0
  Push HL
call MultiPushDe10
call FinalBitmapPush26
defw BitmapData+3379


PicEp2Continuepng_Processedpng_Line_111:
call MultiPushDe16
LD HL,&C070
  Push HL
call MultiPushDe10
call FinalBitmapPush26
defw BitmapData+3405


PicEp2Continuepng_Processedpng_Line_112:
call MultiPushDe27
call BitmapPush16
defw BitmapData+3421
DEC DE

  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
  PUSH DE
LD BC,&0044
 jp NextLinePushBC 


PicEp2Continuepng_Processedpng_Line_113:
INC DE

call MultiPushDe27
call BitmapPush12
defw BitmapData+3433
  PUSH DE
LD HL,&F3FF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3439


PicEp2Continuepng_Processedpng_Line_114:
INC DE

call MultiPushDe28
call BitmapPush14
defw BitmapData+3453
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3459


PicEp2Continuepng_Processedpng_Line_115:
INC DE

call MultiPushDe28
call FinalBitmapPush24
defw BitmapData+3483


PicEp2Continuepng_Processedpng_Line_116:
call MultiPushDe28
call FinalBitmapPush24
defw BitmapData+3507


PicEp2Continuepng_Processedpng_Line_117:
call MultiPushDe28
call BitmapPush14
defw BitmapData+3521
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF3B
  Push HL
LD BC,&0088
 jp NextLinePushBC 


PicEp2Continuepng_Processedpng_Line_118:
INC DE

call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3547


PicEp2Continuepng_Processedpng_Line_119:
call MultiPushDe27
call BitmapPush10
defw BitmapData+3557
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3571


PicEp2Continuepng_Processedpng_Line_120:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3597


PicEp2Continuepng_Processedpng_Line_121:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3623


PicEp2Continuepng_Processedpng_Line_122:
call MultiPushDe27
call BitmapPush8
defw BitmapData+3631
  PUSH DE
call BitmapPush12
defw BitmapData+3643
LD DE,&0401
 jp NextLinePushDe2


PicEp2Continuepng_Processedpng_Line_123:
LD DE,&0000
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3669


PicEp2Continuepng_Processedpng_Line_124:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3695


PicEp2Continuepng_Processedpng_Line_125:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3721


PicEp2Continuepng_Processedpng_Line_126:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3747


PicEp2Continuepng_Processedpng_Line_127:
call MultiPushDe27
call BitmapPush18
defw BitmapData+3765
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3771


PicEp2Continuepng_Processedpng_Line_128:
call MultiPushDe27
call BitmapPush10
defw BitmapData+3781
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3795


PicEp2Continuepng_Processedpng_Line_129:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3821


PicEp2Continuepng_Processedpng_Line_130:
call MultiPushDe27
call FinalBitmapPush26
defw BitmapData+3847


PicEp2Continuepng_Processedpng_Line_131:
call MultiPushDe29
call BitmapPush8
defw BitmapData+3855
LD DE,&CCEE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3865


PicEp2Continuepng_Processedpng_Line_132:
LD DE,&0000
call MultiPushDe31
call BitmapPush10
defw BitmapData+3875
 jp NextLinePushDe4



PicEp2Continuepng_Processedpng_DrawOrder: 

  DEFW PicLoading2png_Line_0
defw looper
  DEFB 1,36
  DEFW PicLoading2png_Line_1_Reuse
  DEFW PicEp2Continuepng_Processedpng_Line_37
  DEFW PicEp2Continuepng_Processedpng_Line_38
  DEFW PicEp2Continuepng_Processedpng_Line_39
  DEFW PicEp2Continuepng_Processedpng_Line_40
  DEFW PicEp2Continuepng_Processedpng_Line_41
  DEFW PicEp2Continuepng_Processedpng_Line_42
  DEFW PicEp2Continuepng_Processedpng_Line_43
  DEFW PicEp2Continuepng_Processedpng_Line_44
  DEFW PicEp2Continuepng_Processedpng_Line_45
  DEFW PicEp2Continuepng_Processedpng_Line_46
  DEFW PicEp2Continuepng_Processedpng_Line_47
  DEFW PicEp2Continuepng_Processedpng_Line_48
  DEFW PicEp2Continuepng_Processedpng_Line_49
  DEFW PicEp2Continuepng_Processedpng_Line_50
  DEFW PicEp2Continuepng_Processedpng_Line_51
  DEFW PicEp2Continuepng_Processedpng_Line_52
  DEFW PicEp2Continuepng_Processedpng_Line_53
  DEFW PicEp2Continuepng_Processedpng_Line_54
  DEFW PicEp2Continuepng_Processedpng_Line_55
  DEFW PicEp2Continuepng_Processedpng_Line_56
  DEFW PicEp2Continuepng_Processedpng_Line_57
  DEFW PicEp2Continuepng_Processedpng_Line_58
  DEFW PicEp2Continuepng_Processedpng_Line_59
  DEFW PicEp2Continuepng_Processedpng_Line_60
  DEFW PicEp2Continuepng_Processedpng_Line_61
  DEFW PicEp2Continuepng_Processedpng_Line_62
  DEFW PicEp2Continuepng_Processedpng_Line_63
  DEFW PicEp2Continuepng_Processedpng_Line_64
  DEFW PicEp2Continuepng_Processedpng_Line_65
  DEFW PicEp2Continuepng_Processedpng_Line_66
  DEFW PicEp2Continuepng_Processedpng_Line_67
  DEFW PicEp2Continuepng_Processedpng_Line_68
  DEFW PicEp2Continuepng_Processedpng_Line_69
  DEFW PicEp2Continuepng_Processedpng_Line_70
  DEFW PicEp2Continuepng_Processedpng_Line_71
  DEFW PicEp2Continuepng_Processedpng_Line_72
  DEFW PicEp2Continuepng_Processedpng_Line_73
  DEFW PicEp2Continuepng_Processedpng_Line_74
  DEFW PicEp2Continuepng_Processedpng_Line_75
  DEFW PicEp2Continuepng_Processedpng_Line_76
  DEFW PicEp2Continuepng_Processedpng_Line_77
  DEFW PicEp2Continuepng_Processedpng_Line_78
  DEFW PicEp2Continuepng_Processedpng_Line_79
  DEFW PicEp2Continuepng_Processedpng_Line_80
  DEFW PicEp2Continuepng_Processedpng_Line_81
  DEFW PicEp2Continuepng_Processedpng_Line_82
  DEFW PicEp2Continuepng_Processedpng_Line_83
  DEFW PicEp2Continuepng_Processedpng_Line_84
  DEFW PicEp2Continuepng_Processedpng_Line_85
  DEFW PicEp2Continuepng_Processedpng_Line_86
  DEFW PicEp2Continuepng_Processedpng_Line_87
  DEFW PicEp2Continuepng_Processedpng_Line_88
  DEFW PicEp2Continuepng_Processedpng_Line_89
  DEFW PicEp2Continuepng_Processedpng_Line_90
  DEFW PicEp2Continuepng_Processedpng_Line_91
  DEFW PicEp2Continuepng_Processedpng_Line_92
  DEFW PicEp2Continuepng_Processedpng_Line_93
  DEFW PicEp2Continuepng_Processedpng_Line_94
  DEFW PicEp2Continuepng_Processedpng_Line_95
  DEFW PicEp2Continuepng_Processedpng_Line_96
  DEFW PicEp2Continuepng_Processedpng_Line_97
  DEFW PicEp2Continuepng_Processedpng_Line_98
  DEFW PicEp2Continuepng_Processedpng_Line_99
  DEFW PicEp2Continuepng_Processedpng_Line_100
  DEFW PicEp2Continuepng_Processedpng_Line_101
  DEFW PicEp2Continuepng_Processedpng_Line_102
  DEFW PicEp2Continuepng_Processedpng_Line_103
  DEFW PicEp2Continuepng_Processedpng_Line_104
  DEFW PicEp2Continuepng_Processedpng_Line_105
  DEFW PicEp2Continuepng_Processedpng_Line_106
  DEFW PicEp2Continuepng_Processedpng_Line_107
  DEFW PicEp2Continuepng_Processedpng_Line_108
  DEFW PicEp2Continuepng_Processedpng_Line_109
  DEFW PicEp2Continuepng_Processedpng_Line_110
  DEFW PicEp2Continuepng_Processedpng_Line_111
  DEFW PicEp2Continuepng_Processedpng_Line_112
  DEFW PicEp2Continuepng_Processedpng_Line_113
  DEFW PicEp2Continuepng_Processedpng_Line_114
  DEFW PicEp2Continuepng_Processedpng_Line_115
  DEFW PicEp2Continuepng_Processedpng_Line_116
  DEFW PicEp2Continuepng_Processedpng_Line_117
  DEFW PicEp2Continuepng_Processedpng_Line_118
  DEFW PicEp2Continuepng_Processedpng_Line_119
  DEFW PicEp2Continuepng_Processedpng_Line_120
  DEFW PicEp2Continuepng_Processedpng_Line_121
  DEFW PicEp2Continuepng_Processedpng_Line_122
  DEFW PicEp2Continuepng_Processedpng_Line_123
  DEFW PicEp2Continuepng_Processedpng_Line_124
  DEFW PicEp2Continuepng_Processedpng_Line_125
  DEFW PicEp2Continuepng_Processedpng_Line_126
  DEFW PicEp2Continuepng_Processedpng_Line_127
  DEFW PicEp2Continuepng_Processedpng_Line_128
  DEFW PicEp2Continuepng_Processedpng_Line_129
  DEFW PicEp2Continuepng_Processedpng_Line_130
  DEFW PicEp2Continuepng_Processedpng_Line_131
  DEFW PicEp2Continuepng_Processedpng_Line_132
defw looper
  DEFB 1,67
  DEFW PicLoading2png_Line_1_Reuse
  DEFW EndCode
PicSetDisk3png:
ld hl,PicSetDisk3png_rledata-1
ld de,PicSetDisk3png_rledataEnd-1
ld b,0
ld ixh,80
ld IXL,79
di
exx 
push bc
exx
jp RLE_Draw
PicSetDisk3png_rledata:

defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&e1
defb &CA
defb &2
defb &CF,&16
defb &F3
defb &41
defb &F,&5b
defb &00,&5,&D0

defb &41
defb &2
defb &C1
defb &00,&12,&D0
defb &F3
defb &C1
defb &41
defb &F,&59
defb &8C
defb &2
defb &8F,&16
defb &F3
defb &82
defb &F,&59
defb &C1
defb &00,&5,&D0

defb &41
defb &2
defb &C1
defb &00,&12,&D0
defb &F3
defb &C1
defb &42
defb &F,&58
defb &C5
defb &F1
defb &CF,&1e
defb &F3
defb &C2
defb &41
defb &F,&58
defb &C1
defb &30,&D0,&D8,&F7
defb &00,&16,&D0
defb &F3
defb &C1
defb &10,&D0
defb &F,&57
defb &81
defb &C4
defb &E1
defb &10,&F7
defb &CF,&1d
defb &F3
defb &C3
defb &F,&58
defb &C1
defb &20,&D0,&D0
defb &10,&F3
defb &00,&16,&D0
defb &F3
defb &C1
defb &10,&D0
defb &F,&57
defb &8B
defb &2
defb &C1
defb &8F,&12
defb &2
defb &C1
defb &82
defb &F3
defb &83
defb &F,&58
defb &C1
defb &00,&4,&D0

defb &41
defb &C2
defb &81
defb &00,&7,&D0
defb &20,&1E,&C1
defb &00,&7,&D0

defb &41
defb &C2
defb &81
defb &10,&D0
defb &F3
defb &C1
defb &10,&D0
defb &F,&57
defb &81
defb &C9
defb &20,&60,&60
defb &CD
defb &61
defb &33
defb &91
defb &CE
defb &20,&60,&60
defb &C8
defb &F,&58
defb &C1
defb &00,&3,&D0
defb &42
defb &C1
defb &2
defb &C1
defb &10,&E0
defb &00,&5,&D0

defb &61
defb &35
defb &10,&C1
defb &00,&5,&D0
defb &43
defb &2
defb &C1
defb &10,&C0
defb &43
defb &C1
defb &10,&D0
defb &F,&57
defb &81
defb &C8
defb &42
defb &2
defb &82
defb &CB
defb &37
defb &CC
defb &42
defb &2
defb &82
defb &C2
defb &82
defb &C3
defb &F,&58
defb &C1
defb &00,&3,&D0
defb &43
defb &2
defb &82
defb &C1
defb &00,&4,&D0
defb &10,&58
defb &37
defb &91
defb &00,&5,&D0
defb &43
defb &2
defb &81
defb &10,&C0
defb &43
defb &C1
defb &10,&D0
defb &F,&57
defb &89
defb &41
defb &C1
defb &2
defb &C1
defb &8B
defb &21
defb &37
defb &91
defb &8B
defb &1
defb &C1
defb &2
defb &C1
defb &88
defb &F,&58
defb &C1
defb &00,&4,&D0
defb &10,&60

defb &81
defb &42
defb &C1
defb &00,&4,&D0

defb &41
defb &39
defb &00,&6,&D0
defb &10,&60

defb &81
defb &48
defb &C1
defb &F,&57
defb &81
defb &C9
defb &41
defb &C2
defb &81
defb &CB
defb &39
defb &CC
defb &41
defb &C2
defb &81
defb &C3
defb &82
defb &C3
defb &F,&58
defb &C1
defb &00,&3,&D0

defb &41
defb &C2
defb &2
defb &C1
defb &00,&5,&D0

defb &41
defb &39
defb &00,&5,&D0

defb &41
defb &C2
defb &2
defb &C1
defb &10,&D0
defb &43
defb &C1
defb &10,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &39
defb &CF,&4
defb &82
defb &C3
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&9,&D0
defb &43
defb &C1
defb &10,&D0
defb &F,&57
defb &8F,&a
defb &39
defb &8F,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &39
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &39
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &8F,&a
defb &39
defb &8F,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &39
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &39
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &8F,&a
defb &39
defb &8F,&9
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &39
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &39
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &10,&58
defb &37
defb &91
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &61
defb &37
defb &91
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&c,&D0
defb &37
defb &C1
defb &00,&c,&D0
defb &F,&57
defb &8F,&b
defb &21
defb &35
defb &91
defb &8F,&a
defb &F,&58
defb &C1
defb &00,&c,&D0
defb &10,&58
defb &33
defb &91
defb &00,&d,&D0
defb &F,&57
defb &81
defb &CF,&c
defb &10,&1E

defb &91
defb &CF,&c
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &8F,&2b
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &8F,&2b
defb &F,&58
defb &C1
defb &00,&d,&D0
defb &20,&FE,&F1
defb &00,&d,&D0
defb &F,&57
defb &81
defb &CF,&b
defb &E1
defb &20,&1F,&E7
defb &CF,&b
defb &F,&58
defb &C1
defb &00,&c,&D0
defb &40,&7E,&EF,&9F,&D1
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&a
defb &10,&9F
defb &F3
defb &71
defb &B1
defb &CF,&a
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &50,&D8,&EF,&1F,&EF,&D7
defb &00,&c,&D0
defb &F,&57
defb &8F,&a
defb &71
defb &40,&7F,&EF,&9F,&BF
defb &8F,&9
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &20,&BE,&BF
defb &F3
defb &71
defb &20,&7F,&D1
defb &00,&b,&D0
defb &F,&57
defb &81
defb &CF,&8
defb &10,&BE

defb &71
defb &F2
defb &51
defb &F2
defb &10,&6F

defb &D1
defb &CF,&8
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &30,&DF,&EF,&66
defb &F2
defb &20,&DF,&E3
defb &00,&b,&D0
defb &F,&57
defb &81
defb &CF,&8
defb &50,&DF,&EF,&11,&BB,&DF

defb &B1
defb &CF,&8
defb &F,&58
defb &C1
defb &00,&a,&D0
defb &20,&D8,&6F
defb &F2
defb &51
defb &2
defb &F2
defb &B1
defb &10,&D7
defb &00,&b,&D0
defb &F,&57
defb &8F,&8
defb &A1
defb &10,&6F

defb &F1
defb &4
defb &F2
defb &B1
defb &10,&D7
defb &8F,&7
defb &F,&58
defb &C1
defb &00,&a,&D0
defb &20,&D8,&6F
defb &F2
defb &4
defb &20,&BF,&D7
defb &00,&b,&D0
defb &F,&57
defb &81
defb &CF,&7
defb &E1
defb &10,&6F
defb &F2
defb &2
defb &A1
defb &F2
defb &B1
defb &10,&D7
defb &CF,&7
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &60,&DF,&67,&33,&EE,&DF,&E3
defb &00,&b,&D0
defb &F,&57
defb &81
defb &CF,&8
defb &10,&DF

defb &B1
defb &F2
defb &A1
defb &20,&DD,&DF

defb &B1
defb &CF,&8
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &10,&BE

defb &71
defb &F2
defb &A1
defb &F2
defb &20,&6F,&F1
defb &00,&b,&D0
defb &F,&57
defb &8F,&9
defb &20,&AE,&BF
defb &F3
defb &71
defb &10,&7F

defb &D1
defb &8F,&8
defb &F,&58
defb &C1
defb &00,&b,&D0
defb &50,&5C,&7F,&EF,&9F,&BF
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&9
defb &E1
defb &40,&EF,&1F,&EF,&D7
defb &CF,&9
defb &F,&58
defb &C1
defb &00,&c,&D0
defb &10,&9F
defb &F3
defb &71
defb &10,&E3
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&a
defb &30,&7E,&EF,&9F

defb &D1
defb &CF,&a
defb &F,&58
defb &C1
defb &00,&c,&D0
defb &30,&D8,&1F,&E7
defb &00,&d,&D0
defb &F,&57
defb &8F,&d
defb &20,&FE,&F1
defb &8F,&b
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &00,&d,&D0

defb &41
defb &2
defb &C1
defb &00,&d,&D0
defb &F,&57
defb &8F,&c
defb &C1
defb &81
defb &C2
defb &81
defb &C1
defb &8F,&a
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &C2
defb &41
defb &20,&3C,&61
defb &C2
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&b
defb &81
defb &61
defb &32
defb &C1
defb &81
defb &CF,&a
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &C2
defb &81
defb &33
defb &91
defb &10,&E0
defb &00,&c,&D0
defb &F,&57
defb &81
defb &CF,&b
defb &81
defb &33
defb &91
defb &81
defb &CF,&a
defb &F,&58
defb &C1
defb &00,&b,&D0

defb &41
defb &C2
defb &81
defb &61
defb &32
defb &C1
defb &10,&E0
defb &00,&c,&D0
defb &F,&57
defb &8F,&c
defb &41
defb &20,&3C,&61

defb &C1
defb &8F,&a
defb &F,&58
defb &C1
defb &10,&D0
defb &4D
defb &C1
defb &00,&5,&D0

defb &81
defb &C2
defb &81
defb &00,&d,&D0
defb &F,&57
defb &81
defb &C3
defb &8E
defb &CA
defb &41
defb &2
defb &CF,&c
defb &F,&58
defb &C1
defb &4F,&2
defb &C1
defb &00,&3,&D0

defb &41
defb &C5
defb &00,&d,&D0
defb &F,&57
defb &81
defb &C3
defb &8E
defb &CF,&19
defb &F,&58
defb &C1
defb &10,&D0
defb &4D
defb &C1
defb &00,&14,&D0
defb &F,&57
defb &8F,&2b
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &00,&1c,&D0
defb &F,&57
defb &81
defb &CF,&2a
defb &F,&58
defb &C1
defb &10,&D0

defb &E1
defb &FF,&0
defb &A5
defb &1
defb &A1
defb &2
defb &51
defb &20,&44,&44
defb &F,&5
defb &20,&D0,&D0
defb &F,&57
defb &84
defb &10,&7F

defb &31
defb &FA
defb &58
defb &A1
defb &10,&88
defb &9
defb &81
defb &CF,&1
defb &84
defb &F,&58
defb &C1
defb &10,&D0
defb &20,&BF,&BF
defb &F2
defb &C2
defb &10,&A8
defb &F7
defb &A5
defb &10,&88
defb &2
defb &10,&11

defb &51
defb &4
defb &41
defb &F,&0
defb &81
defb &20,&C0,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &20,&BF,&BF
defb &C4
defb &10,&D8
defb &F4
defb &58
defb &10,&22

defb &A1
defb &7
defb &81
defb &B
defb &10,&F4
defb &4
defb &41
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &F3
defb &C2
defb &E1
defb &10,&F9
defb &F9
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &10,&44
defb &2
defb &81
defb &5
defb &10,&64
defb &2
defb &20,&70,&80

defb &C1
defb &3
defb &20,&D0,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &71
defb &32
defb &91
defb &20,&FE,&F9
defb &F5
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &6
defb &C1
defb &3
defb &20,&60,&80

defb &E1
defb &6
defb &F1
defb &10,&10

defb &41
defb &C3
defb &F,&58
defb &C1
defb &20,&D8,&7F
defb &F2
defb &C4
defb &10,&A8
defb &F7
defb &A5
defb &10,&88
defb &2
defb &10,&11

defb &51
defb &3
defb &41
defb &2
defb &A1
defb &C1
defb &5
defb &10,&70
defb &4
defb &10,&30
defb &20,&D0,&D0
defb &F,&57
defb &83
defb &A1
defb &71
defb &32
defb &F4
defb &C1
defb &10,&D8
defb &F4
defb &58
defb &10,&22

defb &A1
defb &6
defb &81
defb &41
defb &2
defb &41
defb &7
defb &C2
defb &5
defb &41
defb &83
defb &F,&58
defb &C1
defb &10,&D8
defb &FF,&2
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &20,&44,&80
defb &3
defb &41
defb &8
defb &C2
defb &4
defb &20,&D0,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &71
defb &32
defb &C5
defb &10,&A8
defb &F3
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &5
defb &81
defb &5
defb &C2
defb &3
defb &20,&E0,&90

defb &C1
defb &3
defb &41
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &F3
defb &C5
defb &10,&D8
defb &F7
defb &A5
defb &10,&88
defb &2
defb &10,&11

defb &51
defb &2
defb &41
defb &6
defb &C2
defb &40,&E0,&1E,&E1,&C0
defb &2
defb &20,&D0,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &33
defb &F1
defb &D1
defb &C2
defb &F7
defb &58
defb &10,&22

defb &A1
defb &6
defb &41
defb &7
defb &C1
defb &41
defb &35
defb &C3
defb &1
defb &41
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &B2
defb &20,&D7,&F8

defb &C1
defb &FA
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &10,&44

defb &81
defb &2
defb &41
defb &6
defb &10,&10
defb &73
defb &33
defb &C1
defb &42
defb &C1
defb &10,&D0
defb &F,&57
defb &83
defb &A1
defb &72
defb &20,&E3,&FE
defb &C2
defb &F5
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &10,&20

defb &81
defb &6
defb &C1
defb &10,&10

defb &A1
defb &B3
defb &33
defb &C1
defb &41
defb &83
defb &F,&58
defb &C1
defb &10,&D8
defb &F2
defb &10,&F1
defb &F3
defb &C1
defb &81
defb &F8
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11
defb &10,&20

defb &D1
defb &5
defb &30,&78,&7,&8
defb &75
defb &91
defb &20,&D0,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &32
defb &B1
defb &FB
defb &58
defb &10,&22

defb &A1
defb &5
defb &10,&10

defb &41
defb &3
defb &10,&78

defb &31
defb &B3
defb &10,&1

defb &A1
defb &B4
defb &31
defb &41
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &FF,&2
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &10,&44

defb &41
defb &4
defb &81
defb &61
defb &76
defb &51
defb &10,&8
defb &74
defb &20,&C1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &10,&F7
defb &C6
defb &F5
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &41
defb &2
defb &81
defb &C4
defb &B6
defb &10,&1

defb &A1
defb &B3
defb &11
defb &C3
defb &F,&58
defb &C1
defb &20,&D8,&F7
defb &C6
defb &81
defb &F8
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11

defb &41
defb &3
defb &C5
defb &E1
defb &F5
defb &51
defb &1
defb &F2
defb &71
defb &20,&D1,&D0
defb &F,&57
defb &83
defb &A1
defb &F8
defb &10,&D8
defb &F4
defb &58
defb &10,&22

defb &A1
defb &5
defb &42
defb &4
defb &10,&90
defb &C4
defb &E1
defb &F3
defb &2
defb &F2
defb &11
defb &83
defb &F,&58
defb &C1
defb &10,&D8
defb &F8
defb &10,&A8
defb &F7
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &10,&44

defb &41
defb &5
defb &41
defb &2
defb &C5
defb &F3
defb &1
defb &30,&EE,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &10,&F7
defb &C6
defb &41
defb &F4
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &41
defb &3
defb &10,&10

defb &41
defb &4
defb &41
defb &C3
defb &E1
defb &20,&77,&CC

defb &51
defb &C3
defb &F,&58
defb &C1
defb &20,&D8,&F7
defb &C6
defb &A1
defb &F8
defb &A5
defb &10,&88
defb &2
defb &20,&11,&91

defb &41
defb &2
defb &81
defb &10,&30

defb &41
defb &3
defb &10,&E0
defb &82
defb &C2
defb &F2
defb &30,&99,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &FE
defb &58
defb &10,&22

defb &A1
defb &5
defb &20,&90,&80

defb &31
defb &42
defb &3
defb &20,&D2,&D0

defb &41
defb &C2
defb &F2
defb &A1
defb &51
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &FF,&2
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &30,&44,&90,&80

defb &71
defb &42
defb &3
defb &30,&B5,&80,&30
defb &C2
defb &F2
defb &20,&D1,&D0
defb &F,&57
defb &83
defb &A1
defb &10,&F7
defb &C6
defb &10,&A8
defb &F3
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &20,&90,&8

defb &31
defb &42
defb &3
defb &10,&7A
defb &2
defb &30,&70,&E0,&FE

defb &51
defb &83
defb &F,&58
defb &C1
defb &20,&D8,&F7
defb &C2
defb &E1
defb &FC
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11
defb &30,&90,&8,&63

defb &C1
defb &3
defb &D2
defb &2
defb &50,&61,&80,&FC,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &F3
defb &D1
defb &C3
defb &F7
defb &58
defb &10,&22

defb &A1
defb &5
defb &30,&90,&8,&C3

defb &81
defb &3
defb &E2
defb &2
defb &30,&52,&80,&F9

defb &51
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &F6
defb &C2
defb &81
defb &F8
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &40,&44,&90,&8,&E3

defb &81
defb &3
defb &D2
defb &30,&44,&75,&80
defb &F2
defb &20,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &F3
defb &D1
defb &C2
defb &E1
defb &F6
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &3
defb &81
defb &30,&90,&80,&D7

defb &81
defb &3
defb &62
defb &30,&22,&72,&80
defb &F2
defb &51
defb &C3
defb &F,&58
defb &C1
defb &20,&D8,&F7
defb &C2
defb &E1
defb &FC
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11
defb &40,&90,&80,&87,&60
defb &2
defb &92
defb &30,&81,&25,&80
defb &F2
defb &20,&D1,&D0
defb &F,&57
defb &83
defb &A1
defb &10,&F7
defb &C6
defb &10,&A8
defb &F4
defb &58
defb &10,&22

defb &A1
defb &5
defb &41
defb &3
defb &20,&E6,&E4
defb &2
defb &21
defb &64
defb &2
defb &81
defb &F2
defb &51
defb &83
defb &F,&58
defb &C1
defb &10,&D8
defb &FF,&2
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &10,&44

defb &81
defb &3
defb &30,&C6,&EC,&10

defb &81
defb &94
defb &2
defb &81
defb &F2
defb &20,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &F7
defb &D1
defb &10,&A8
defb &F3
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &81
defb &4
defb &91
defb &10,&FC

defb &41
defb &2
defb &64
defb &2
defb &E1
defb &F2
defb &51
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &F5
defb &D1
defb &C2
defb &10,&D8
defb &F7
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11
defb &82
defb &3
defb &91
defb &20,&FE,&71

defb &1
defb &93
defb &10,&1

defb &81
defb &F3
defb &20,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &F2
defb &C5
defb &E1
defb &F6
defb &58
defb &10,&22

defb &A1
defb &5
defb &82
defb &3
defb &B1
defb &E1
defb &F2
defb &D1
defb &10,&8
defb &62
defb &2
defb &E1
defb &F3
defb &51
defb &C3
defb &F,&58
defb &C1
defb &30,&D8,&F7,&F8
defb &F2
defb &10,&F9
defb &F9
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &10,&44
defb &82
defb &3
defb &B1
defb &E1
defb &F3
defb &C1
defb &4
defb &C1
defb &F4
defb &20,&D1,&D0
defb &F,&57
defb &83
defb &A1
defb &F2
defb &C3
defb &E1
defb &10,&F9
defb &F5
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &82
defb &20,&C0,&C
defb &F5
defb &C4
defb &F5
defb &51
defb &83
defb &F,&58
defb &C1
defb &10,&D8
defb &F4
defb &D1
defb &C3
defb &10,&20
defb &F7
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11

defb &81
defb &2
defb &81
defb &1
defb &B2
defb &FC
defb &D1
defb &20,&D1,&D0
defb &F,&57
defb &81
defb &C2
defb &E1
defb &F7
defb &C1
defb &10,&D8
defb &F4
defb &58
defb &10,&22

defb &A1
defb &5
defb &81
defb &2
defb &81
defb &10,&8

defb &71
defb &FC
defb &D1
defb &51
defb &C3
defb &F,&58
defb &C1
defb &10,&D8
defb &F6
defb &20,&1F,&BF
defb &F7
defb &A4
defb &1
defb &10,&11

defb &51
defb &2
defb &51
defb &20,&44,&20
defb &82
defb &10,&8
defb &B2
defb &FC
defb &20,&D0,&D0
defb &F,&58
defb &C2
defb &E1
defb &F6
defb &B1
defb &72
defb &B1
defb &F3
defb &51
defb &F1
defb &A2
defb &55
defb &20,&44,&44
defb &4
defb &10,&20

defb &81
defb &2
defb &41
defb &10,&4F
defb &FC
defb &41
defb &C2
defb &41
defb &F,&58
defb &C1
defb &10,&D8
defb &F6
defb &10,&6F

defb &31
defb &F8
defb &A5
defb &10,&88
defb &2
defb &20,&11,&11
defb &10,&20

defb &81
defb &2
defb &41
defb &B4
defb &F9
defb &D1
defb &10,&D1
defb &42
defb &F,&58
defb &82
defb &A1
defb &F8
defb &B1
defb &F5
defb &58
defb &10,&22

defb &A1
defb &5
defb &00,&3,&20

defb &21
defb &74
defb &F9
defb &51
defb &82
defb &F,&5b
defb &E1
defb &FF,&3
defb &A3
defb &2
defb &51
defb &43
defb &51
defb &10,&54
defb &4F,&6

defb &C1
defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&cf
PicSetDisk3png_rledataEnd: defb 0







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

MultiPushDeLast40: ld HL,NextLine
jp MultiPushDe40B 
MultiPushDe40: pop HL
jp MultiPushDe40B 
MultiPushDe35: pop HL
jp MultiPushDe35B 
MultiPushDe34: pop HL
jp MultiPushDe34B 
MultiPushDe33: pop HL
jp MultiPushDe33B 
MultiPushDe32: pop HL
jp MultiPushDe32B 
MultiPushDe31: pop HL
jp MultiPushDe31B 
MultiPushDe30: pop HL
jp MultiPushDe30B 
MultiPushDe29: pop HL
jr MultiPushDe29B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe27: pop HL
jr MultiPushDe27B 
MultiPushDe23: pop HL
jr MultiPushDe23B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe15: pop HL
jr MultiPushDe15B 
MultiPushDe11: pop HL
jr MultiPushDe11B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
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

BitmapPush36: ld b,&12
jr BitmapPush
BitmapPush32: ld b,&10
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

finalBitmapPush26: ld b,&0D
jr finalBitmapPush

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

defb &00,&10,&F0,&80,&30,&C0,&F0,&00,&00,&32
defb &F8,&E0,&C0,&00,&00,&C0,&00,&C8,&00,&C0
defb &10,&C0,&00,&30,&80,&00,&32,&00,&20,&00
defb &80,&00,&40,&00,&30,&00,&C0,&00,&40,&00
defb &10,&E4,&00,&C4,&00,&B3,&FE,&00,&C8,&00
defb &80,&00,&62,&10,&00,&20,&60,&40,&FF,&88
defb &80,&00,&80,&10,&80,&00,&C8,&00,&11,&40
defb &BB,&CC,&20,&00,&10,&20,&11,&EE,&00,&10
defb &80,&10,&10,&00,&00,&10,&00,&30,&30,&00
defb &11,&C0,&00,&30,&00,&10,&22,&20,&20,&00
defb &02,&00,&80,&00,&91,&11,&44,&00,&00,&64
defb &00,&20,&20,&20,&30,&B0,&27,&08,&40,&20
defb &62,&00,&AA,&00,&00,&64,&00,&20,&64,&40
defb &61,&90,&D7,&AC,&32,&20,&31,&44,&55,&00
defb &00,&60,&00,&20,&40,&00,&52,&40,&E7,&AC
defb &00,&91,&20,&88,&22,&88,&00,&40,&00,&20
defb &40,&40,&60,&24,&63,&AC,&00,&10,&DD,&11
defb &55,&44,&00,&40,&00,&20,&40,&00,&C0,&56
defb &73,&AC,&30,&00,&E6,&00,&22,&AA,&00,&40
defb &00,&10,&00,&90,&80,&27,&F1,&78,&00,&88
defb &73,&00,&44,&77,&00,&40,&00,&10,&00,&B0
defb &00,&13,&3D,&AC,&00,&40,&73,&88,&88,&55
defb &00,&40,&00,&10,&00,&E0,&48,&33,&DF,&1E
defb &C0,&20,&51,&CC,&44,&22,&88,&00,&90,&58
defb &56,&33,&EF,&AD,&A4,&12,&22,&AA,&22,&11
defb &44,&00,&A1,&C1,&89,&B3,&DF,&1E,&B4,&86
defb &28,&DD,&44,&00,&AA,&00,&A0,&C0,&C4,&3B
defb &AF,&BC,&6F,&0F,&5C,&22,&88,&00,&55,&00
defb &40,&84,&25,&77,&CF,&69,&CF,&4B,&00,&D5
defb &44,&44,&BB,&44,&40,&26,&00,&FF,&96,&E0
defb &9E,&84,&0E,&C0,&AA,&22,&11,&AA,&00,&13
defb &F7,&FE,&0C,&10,&24,&88,&02,&C8,&55,&55
defb &00,&55,&00,&01,&FF,&FE,&1D,&8C,&21,&00
defb &01,&2A,&33,&88,&00,&22,&88,&00,&FF,&DF
defb &2B,&AE,&11,&23,&01,&90,&11,&CC,&44,&11
defb &CC,&00,&7F,&AF,&2B,&EE,&22,&00,&89,&A0
defb &88,&CC,&7F,&0E,&77,&FF,&2A,&00,&01,&90
defb &73,&EE,&03,&08,&77,&CF,&06,&00,&01,&40
defb &20,&FF,&55,&00,&44,&00,&72,&C8,&25,&00
defb &12,&40,&60,&66,&11,&88,&77,&00,&31,&C4
defb &32,&0E,&12,&10,&A0,&33,&00,&44,&33,&00
defb &00,&03,&00,&01,&2B,&8C,&13,&6D,&12,&20
defb &40,&11,&00,&44,&33,&00,&00,&0F,&00,&11
defb &11,&00,&00,&01,&00,&01,&1B,&4C,&67,&BE
defb &0C,&E0,&00,&13,&B3,&AC,&FF,&5C,&88,&81
defb &00,&23,&3B,&6C,&FF,&88,&88,&10,&00,&35
defb &B3,&BD,&DF,&01,&00,&01,&00,&72,&19,&FF
defb &AE,&22,&4F,&7D,&95,&FF,&4E,&04,&08,&00
defb &88,&00,&00,&30,&F0,&F0,&C0,&00,&00,&70
defb &C0,&00,&30,&C0,&00,&70,&F0,&F0,&80,&00
defb &00,&2F,&00,&77,&9E,&AF,&8C,&08,&04,&00
defb &08,&00,&30,&F0,&80,&00,&00,&70,&F0,&F0
defb &F0,&00,&00,&F0,&E0,&00,&70,&F0,&10,&F0
defb &F0,&F0,&E0,&00,&01,&00,&00,&37,&ED,&57
defb &69,&00,&70,&F0,&F0,&F0,&C0,&00,&00,&F0
defb &E0,&00,&F0,&F0,&80,&00,&30,&F0,&80,&00
defb &10,&F0,&F0,&F0,&F0,&80,&30,&F0,&F0,&F0
defb &F0,&00,&21,&00,&00,&11,&CC,&08,&08,&08
defb &11,&00,&08,&00,&70,&F0,&F0,&F0,&E0,&00
defb &00,&F0,&E0,&00,&F0,&F0,&80,&00,&30,&F0
defb &80,&00,&30,&F0,&F0,&F0,&F0,&C0,&70,&F0
defb &F0,&F0,&F0,&80,&43,&08,&04,&00,&00,&01
defb &00,&04,&70,&F0,&00,&F0,&F0,&00,&00,&F0
defb &E0,&00,&F0,&F0,&E0,&00,&30,&F0,&80,&00
defb &70,&F0,&C0,&10,&F0,&E0,&00,&F0,&E0,&00
defb &00,&10,&F0,&F0,&00,&30,&F0,&E0,&00,&44
defb &01,&00,&08,&00,&2F,&8C,&02,&00,&2F,&00
defb &70,&F0,&00,&10,&F0,&C0,&00,&F0,&E0,&00
defb &F0,&F0,&F0,&00,&30,&F0,&80,&00,&F0,&E0
defb &00,&F0,&E0,&00,&00,&30,&F0,&C0,&19,&88
defb &00,&10,&C0,&00,&70,&00,&00,&01,&5F,&4B
defb &05,&00,&00,&AF,&00,&02,&00,&02,&00,&01
defb &77,&00,&30,&A1,&68,&10,&F2,&80,&00,&11
defb &AF,&97,&4E,&08,&F0,&C0,&00,&F0,&E0,&00
defb &F0,&F0,&F0,&80,&30,&F0,&80,&10,&F0,&C0
defb &00,&F0,&E0,&00,&00,&30,&F0,&00,&00,&02
defb &CC,&10,&F0,&61,&AC,&B0,&F4,&80,&00,&13
defb &CE,&A7,&EF,&8C,&00,&04,&88,&61,&0F,&F0
defb &3C,&70,&E0,&00,&00,&33,&EE,&5F,&FF,&4E
defb &30,&F0,&80,&10,&F0,&C0,&00,&70,&F0,&E0
defb &00,&70,&F0,&00,&00,&00,&30,&F0,&80,&00
defb &70,&E0,&30,&F0,&00,&00,&70,&F0,&00,&00
defb &00,&37,&EE,&BF,&FF,&AF,&08,&08,&0A,&00
defb &02,&18,&DC,&C3,&0F,&F0,&5E,&B0,&80,&00
defb &43,&8C,&00,&37,&EE,&5D,&55,&55,&55,&FF
defb &FF,&FF,&FF,&FE,&74,&F0,&C3,&78,&96,&50
defb &80,&10,&F0,&C0,&00,&F0,&F0,&F0,&80,&00
defb &F0,&C0,&10,&F0,&80,&00,&70,&F0,&00,&00
defb &F0,&E0,&00,&F0,&E0,&00,&F0,&E0,&00,&F0
defb &E0,&00,&00,&70,&F0,&00,&00,&00,&03,&F0
defb &E1,&34,&E0,&A0,&D3,&CE,&00,&37,&EE,&BA
defb &00,&76,&43,&78,&E0,&0A,&01,&08,&87,&EE
defb &01,&77,&EE,&E4,&F0,&E0,&00,&F0,&E0,&00
defb &F0,&E0,&00,&F0,&F0,&F0,&80,&10,&F0,&C0
defb &00,&70,&F0,&F0,&30,&F0,&00,&10,&F0,&C0
defb &10,&F0,&80,&00,&70,&F0,&00,&62,&C3,&3C
defb &D0,&34,&81,&0C,&D3,&CE,&11,&77,&EC,&66
defb &EE,&76,&43,&1E,&A0,&E1,&38,&C0,&87,&AD
defb &AF,&77,&AC,&64,&77,&FF,&E0,&00,&70,&F0
defb &00,&10,&F0,&C0,&00,&F0,&E0,&00,&F0,&E0
defb &00,&F0,&F0,&F0,&80,&00,&F0,&E0,&00,&F0
defb &E0,&00,&00,&30,&F0,&C0,&00,&00,&E6,&62
defb &C3,&0F,&50,&84,&70,&E0,&D3,&3D,&5F,&77
defb &6C,&66,&75,&F5,&87,&6B,&BE,&27,&AC,&64
defb &76,&FA,&FF,&FF,&FE,&FA,&EA,&76,&43,&0E
defb &38,&18,&F0,&70,&C0,&00,&E0,&00,&70,&F0
defb &00,&30,&F0,&80,&00,&F0,&E0,&00,&F0,&E0
defb &00,&30,&F0,&F0,&80,&00,&70,&F0,&C0,&00
defb &F0,&E0,&00,&30,&F0,&E0,&00,&30,&C3,&D7
defb &7C,&57,&7C,&66,&75,&F5,&E7,&AF,&BF,&F5
defb &E6,&62,&C3,&0D,&61,&38,&F0,&70,&C0,&00
defb &61,&A7,&E9,&6B,&DA,&64,&76,&FA,&DF,&5F
defb &7E,&FA,&EA,&76,&61,&0A,&C3,&70,&E0,&F0
defb &C0,&00,&F0,&F0,&F0,&80,&00,&70,&E0,&00
defb &00,&30,&F0,&00,&70,&F0,&F0,&F0,&F0,&00
defb &00,&F0,&E0,&00,&F0,&E0,&00,&10,&F0,&F0
defb &80,&00,&30,&F0,&F0,&F0,&F0,&C0,&00,&F0
defb &F0,&F0,&80,&00,&70,&F0,&52,&5B,&4B,&3C
defb &B4,&66,&75,&F5,&E7,&AF,&FF,&F5,&E6,&62
defb &E1,&14,&87,&70,&D0,&F0,&C0,&00,&21,&B4
defb &A7,&8F,&5A,&64,&76,&FA,&EA,&5F,&76,&FA
defb &EA,&76,&60,&38,&0A,&F0,&30,&F0,&E0,&00
defb &F0,&F0,&80,&00,&00,&F0,&F0,&F0,&F0,&00
defb &00,&F0,&F0,&F0,&E0,&00,&10,&F0,&F0,&F0
defb &E0,&00,&00,&F0,&E0,&00,&00,&30,&F0,&80
defb &70,&F0,&F0,&F0,&C0,&00,&00,&F0,&E0,&00
defb &F0,&E0,&10,&68,&7F,&4F,&A4,&66,&75,&F1
defb &E2,&26,&75,&F1,&E6,&62,&D0,&70,&18,&C0
defb &F0,&E0,&E0,&00,&00,&C0,&3F,&9E,&48,&64
defb &76,&F0,&F1,&02,&F8,&F0,&E2,&76,&20,&C3
defb &F0,&F0,&F0,&82,&60,&00,&00,&F0,&F0,&F0
defb &E0,&00,&00,&70,&F0,&F0,&80,&00,&00,&F0
defb &C0,&00,&00,&10,&F0,&80,&30,&F0,&F0,&F0
defb &5F,&2D,&80,&66,&74,&F0,&F0,&99,&F0,&F0
defb &E6,&62,&50,&D2,&F0,&F0,&E0,&08,&C0,&00
defb &00,&70,&C0,&00,&70,&C0,&F0,&00,&10,&F0
defb &F0,&80,&00,&70,&F0,&F0,&C0,&00,&00,&10
defb &F0,&E0,&07,&5A,&00,&64,&76,&F0,&F0,&F6
defb &F0,&F0,&E2,&66,&61,&16,&78,&E0,&04,&00
defb &C0,&00,&61,&E0,&00,&66,&74,&F0,&F0,&F6
defb &F0,&F0,&E6,&62,&02,&1E,&78,&E0,&00,&10
defb &80,&00,&30,&80,&00,&64,&76,&F0,&F0,&9B
defb &F0,&F0,&E2,&76,&41,&16,&B4,&E0,&00,&34
defb &00,&66,&74,&F0,&F1,&00,&F8,&F0,&E6,&62
defb &82,&4F,&C3,&E1,&00,&20,&00,&44,&22,&E0
defb &E2,&02,&74,&B0,&A2,&44,&05,&AF,&0F,&78
defb &02,&C0,&00,&22,&54,&50,&62,&00,&54,&50
defb &44,&22,&0B,&5F,&0F,&3C,&F0,&00,&00,&44
defb &22,&A0,&C4,&26,&22,&A0,&A2,&44,&05,&07
defb &E0,&70,&80,&00,&00,&22,&54,&50,&44,&5F
defb &32,&50,&44,&22,&0A,&0B,&90,&80,&00,&44
defb &22,&A0,&C5,&AF,&AA,&A0,&A2,&44,&05,&24
defb &60,&D0,&00,&22,&54,&50,&77,&FF,&FE,&50
defb &44,&22,&04,&60,&E4,&60,&80,&00,&AA,&44
defb &00,&90,&E8,&10,&20,&00,&00,&04,&E0,&00
defb &00,&44,&00,&FA,&C0,&A0,&60,&60,&05,&70
defb &FA,&80,&00,&22,&00,&F4,&90,&F4,&30,&72
defb &82,&F1,&F5,&C0,&55,&44,&00,&F8,&30,&E8
defb &84,&75,&87,&72,&FA,&C8,&00,&E0,&F1,&A0
defb &1A,&F0,&83,&F0,&F1,&E0,&00,&50,&CC,&F0
defb &FA,&81,&05,&D0,&16,&70,&F0,&F8,&10,&70
defb &22,&00,&22,&71,&F0,&40,&0A,&0A,&0E,&C0
defb &30,&F4,&90,&F0,&30,&03,&11,&00,&11,&70
defb &80,&A1,&05,&05,&1E,&50,&90,&F2,&F0,&F0
defb &50,&20,&0E,&0B,&2C,&B0,&E0,&F0,&F0,&F0
defb &81,&18,&B0,&44,&00,&44,&A0,&D0,&07,&0F
defb &1C,&70,&F0,&70,&F0,&E0,&00,&00,&00,&22
defb &0D,&18,&60,&D0,&0B,&0F,&0F,&70,&F0,&B0
defb &F0,&E0,&20,&D0,&07,&0F,&0E,&E0,&70,&90
defb &D0,&C0,&F8,&80,&B8,&20,&0B,&0F,&1C,&C0
defb &30,&E0,&A0,&80,&00,&10,&B8,&92,&98,&E1
defb &07,&0F,&38,&80,&10,&50,&50,&00,&00,&10
defb &88,&10,&98,&C2,&0B,&0F,&70,&00,&00,&A0
defb &A0,&00,&03,&08,&03,&18,&F0,&F0,&C0,&00
defb &03,&08,&01,&78,&F0,&F0,&C0,&00,&01,&08
defb &10,&F0,&F0,&F0,&E0,&00,&B0,&F0,&F0,&F0
defb &F0,&80,&04,&10,&50,&F0,&F0,&70,&F0,&C0
defb &0A,&20,&A0,&F0,&E0,&30,&F0,&60,&00,&01
defb &05,&18,&50,&70,&C0,&10,&F0,&A0,&0B,&2C
defb &A0,&B0,&80,&10,&E0,&C0,&00,&01,&07,&0F
defb &58,&50,&00,&10,&F0,&40,&00,&02,&1F,&0F
defb &2C,&A0,&00,&05,&2F,&8F,&1E,&40,&00,&0B
defb &5F,&4F,&0F,&80,&00,&10,&F0,&F0,&F0,&80
defb &01,&07,&AF,&8F,&0F,&08,&02,&0F,&5F,&4F
defb &0F,&0A,&F0,&41,&0F,&0D,&04,&00,&05,&0F
defb &AF,&8F,&0F,&05,&04,&00,&E0,&A1,&4F,&0E
defb &0A,&00,&0B,&1F,&5F,&0F,&0E,&0A,&08,&00
defb &30,&00,&D0,&43,&AF,&0F,&0D,&05,&05,&07
defb &AF,&0F,&05,&05,&04,&00,&70,&F0,&C0,&00
defb &10,&F0,&F0,&00,&F0,&F0,&A0,&83,&5F,&4F
defb &0E,&0A,&0A,&1F,&4F,&0E,&0A,&0A,&30,&F0
defb &F0,&00,&70,&F0,&50,&43,&2F,&AF,&0F,&0D
defb &05,&2F,&8F,&0D,&05,&00,&30,&B0,&E0,&00
defb &00,&E0,&A0,&83,&1F,&5F,&0E,&0A,&0B,&1F
defb &0F,&0A,&08,&00,&00,&10,&F0,&F0,&80,&00
defb &10,&70,&C0,&00,&00,&10,&50,&07,&0F,&AF
defb &8F,&05,&0F,&0F,&0F,&04,&00,&84,&00,&30
defb &F0,&E0,&0E,&08,&52,&48,&00,&F0,&F0,&F0
defb &00,&D0,&A0,&00,&50,&00,&20,&87,&1F,&5F
defb &00,&30,&40,&00,&E0,&00,&10,&0F,&0F,&AF
defb &8F,&0F,&0F,&0F,&0D,&21,&A5,&84,&10,&F0
defb &F0,&F0,&C0,&00,&00,&30,&F0,&00,&01,&0F
defb &0F,&5F,&4F,&0F,&0F,&0F,&0E,&1A,&5A,&48
defb &30,&F0,&F0,&F0,&C0,&00,&10,&00,&10,&F0
defb &E0,&00,&03,&0F,&0F,&2F,&AF,&0F,&0F,&0F
defb &2C,&05,&A5,&84,&70,&F0,&70,&B0,&C0,&00
defb &20,&B0,&B0,&F0,&C8,&00,&05,&07,&0F,&1F
defb &5F,&0F,&0F,&0F,&58,&40,&5A,&48,&F0,&E0
defb &70,&00,&E0,&A0,&A5,&90,&70,&C0,&10,&72
defb &F0,&C0,&74,&F0,&00,&0B,&20,&F5,&F1,&80
defb &F2,&F0,&E0,&05,&07,&0F,&0F,&0F,&0F,&1E
defb &F0,&40,&5A,&28,&B0,&00,&10,&98,&FA,&00
defb &B0,&F1,&F0,&02,&0A,&0F,&0F,&0F,&0F,&78
defb &F0,&A0,&A5,&94,&50,&00,&31,&80,&74,&00
defb &40,&00,&F8,&05,&05,&05,&05,&0F,&1E,&F0
defb &F0,&40,&5A,&48,&A0,&00,&00,&07,&08,&00
defb &00,&10,&E0,&00,&00,&10,&C0,&00,&3C,&90
defb &F0,&A0,&25,&A4,&40,&01,&00,&07,&0D,&00
defb &30,&40,&00,&00,&00,&10,&E4,&00,&10,&C0
defb &00,&00,&E0,&00,&00,&00,&00,&10,&E2,&00
defb &00,&01,&05,&05,&50,&D0,&F0,&D0,&52,&4A
defb &80,&01,&0C,&0F,&0E,&08,&00,&10,&F0,&00
defb &00,&70,&80,&00,&00,&10,&E4,&66,&33,&00
defb &00,&0A,&A0,&F0,&F0,&A0,&25,&A4,&30,&E1
defb &0F,&0F,&C3,&00,&00,&10,&40,&66,&33,&00
defb &00,&10,&00,&50,&F0,&D0,&52,&58,&F0,&F0
defb &E1,&F0,&E1,&08,&10,&E0,&00,&30,&F0,&E0
defb &52,&28,&B0,&E0,&25,&30,&F0,&F0,&00,&F0
defb &F0,&04,&70,&80,&A0,&66,&33,&30,&70,&D0
defb &00,&66,&33,&00,&E0,&00,&A5,&84,&50,&50
defb &00,&F0,&80,&00,&00,&F0,&F0,&0A,&00,&F0
defb &B0,&80,&00,&10,&C0,&00,&00,&F0,&00,&10
defb &F0,&00,&10,&F0,&30,&C0,&00,&30,&80,&00
defb &F0,&A0,&77,&EE,&33,&FF,&70,&10,&5A,&5A
defb &20,&A0,&43,&3C,&30,&00,&00,&30,&E0,&50
defb &77,&DC,&51,&FF,&70,&A1,&A5,&A5,&84,&40
defb &86,&1E,&30,&D0,&F0,&80,&00,&10,&C0,&00
defb &F0,&00,&00,&30,&D0,&E0,&00,&F0,&F0,&80
defb &00,&F0,&F0,&90,&F0,&F0,&00,&10,&80,&00
defb &E0,&00,&00,&F0,&C0,&A0,&80,&20,&A0,&00
defb &F0,&92,&5A,&5A,&5A,&18,&86,&0F,&00,&70
defb &30,&F0,&E1,&0D,&10,&50,&50,&70,&F0,&80
defb &21,&A5,&A5,&B0,&87,&07,&00,&F0,&F0,&F0
defb &E1,&0E,&08,&00,&70,&00,&F0,&00,&00,&30
defb &80,&00,&00,&F0,&00,&E0,&70,&00,&00,&70
defb &00,&E0,&00,&30,&E0,&00,&30,&C0,&30,&F0
defb &E0,&F0,&00,&30,&80,&00,&C0,&00,&70,&10
defb &F0,&F0,&D0,&E0,&00,&20,&80,&00,&70,&F0
defb &C0,&5A,&5A,&70,&87,&00,&10,&C0,&30,&F0
defb &E1,&0D,&77,&CC,&11,&FF,&00,&70,&E0,&21
defb &A4,&F0,&E1,&08,&70,&00,&00,&F0,&E1,&0A
defb &08,&00,&10,&E0,&10,&D0,&C0,&00,&10,&C0
defb &10,&E0,&00,&10,&E0,&00,&70,&00,&00,&30
defb &80,&00,&70,&70,&C0,&30,&F0,&C0,&E0,&00
defb &30,&80,&70,&00,&10,&E0,&00,&70,&77,&EE
defb &B3,&FF,&50,&10,&D0,&50,&58,&F0,&C0,&00
defb &E0,&00,&00,&70,&E1,&0D,&00,&30,&C0,&00
defb &F0,&C0,&00,&66,&33,&00,&A0,&80,&E0,&A0
defb &94,&F0,&C0,&00,&C0,&09,&00,&61,&E1,&0A
defb &70,&80,&10,&C0,&00,&30,&C0,&10,&F0,&00
defb &00,&30,&80,&00,&70,&F0,&00,&30,&F0,&00
defb &10,&80,&00,&30,&80,&00,&F1,&E0,&00,&66
defb &B3,&00,&10,&50,&50,&60,&30,&F0,&80,&10
defb &C0,&0D,&00,&61,&0F,&10,&22,&E8,&88,&66
defb &33,&00,&00,&A0,&80,&80,&70,&80,&00,&30
defb &C0,&03,&00,&61,&0E,&F0,&30,&80,&10,&F0
defb &C0,&00,&10,&80,&00,&30,&F0,&80,&70,&E0
defb &10,&F0,&80,&30,&90,&80,&10,&80,&70,&C0
defb &00,&30,&80,&00,&70,&80,&00,&10,&C0,&00
defb &60,&00,&F0,&00,&10,&80,&70,&F0,&80,&20
defb &44,&75,&00,&66,&33,&22,&F2,&50,&40,&44
defb &70,&00,&00,&70,&C0,&07,&0C,&43,&1E,&E0
defb &00,&11,&F5,&20,&A0,&AA,&70,&00,&00,&70
defb &C0,&04,&04,&43,&78,&D0,&10,&E0,&70,&E0
defb &30,&10,&E0,&F0,&F0,&30,&10,&E0,&10,&80
defb &70,&F0,&70,&00,&00,&30,&E0,&70,&C0,&00
defb &00,&10,&C0,&00,&70,&70,&C0,&00,&10,&F0
defb &E0,&30,&F0,&C0,&B8,&98,&40,&11,&70,&00
defb &F0,&F0,&E0,&00,&10,&C3,&D2,&A0,&80,&00
defb &10,&C0,&00,&30,&E0,&30,&80,&30,&E0,&00
defb &10,&C4,&A0,&80,&70,&10,&F0,&D0,&E0,&00
defb &30,&B0,&87,&50,&30,&F0,&C0,&00,&00,&10
defb &80,&70,&F0,&00,&30,&F0,&80,&00,&00,&30
defb &F0,&80,&00,&F0,&E0,&70,&10,&F0,&80,&00
defb &00,&10,&C0,&00,&70,&00,&10,&80,&00,&F0
defb &E0,&00,&00,&30,&F0,&C0,&10,&C8,&50,&00
defb &60,&30,&F0,&D0,&F0,&00,&E0,&70,&0E,&A0
defb &80,&00,&30,&F0,&80,&E4,&20,&80,&E0,&70
defb &00,&E0,&70,&F0,&D0,&E1,&0D,&50,&80,&00
defb &10,&80,&70,&F0,&80,&00,&00,&30,&E0,&62
defb &10,&40,&F0,&C0,&00,&70,&F0,&F0,&B0,&C3
defb &0A,&B0,&80,&00,&30,&30,&E0,&77,&88,&00
defb &00,&33,&FF,&88,&F0,&11,&00,&A0,&F0,&C0
defb &00,&30,&96,&C3,&B0,&85,&05,&70,&80,&00
defb &20,&30,&91,&F8,&F7,&00,&30,&FC,&F0,&E6
defb &30,&00,&00,&40,&F0,&81,&01,&10,&87,&87
defb &70,&82,&0A,&78,&80,&00,&00,&20,&F0,&80
defb &09,&10,&87,&1E,&F0,&05,&05,&78,&80,&00
defb &20,&00,&32,&80,&F1,&F8,&F3,&C0,&00,&F1
defb &F0,&00,&00,&F0,&00,&60,&60,&00,&60,&00
defb &74,&07,&18,&FC,&F6,&83,&0E,&30,&80,&20
defb &00,&10,&70,&80,&0F,&10,&C3,&3C,&E0,&82
defb &0B,&78,&60,&00,&E8,&09,&0C,&F6,&FC,&06
defb &07,&10,&E0,&30,&00,&20,&70,&80,&07,&10
defb &C3,&F0,&D0,&41,&87,&68,&00,&C0,&00,&30
defb &10,&00,&30,&30,&00,&C0,&E0,&10,&C0,&00
defb &30,&30,&80,&00,&C0,&00,&60,&00,&60,&11
defb &D1,&88,&0E,&73,&E8,&8C,&03,&08,&F0,&B0
defb &80,&10,&30,&C0,&05,&38,&C3,&F0,&A0,&83
defb &0F,&3C,&40,&30,&B3,&00,&77,&31,&C0,&CC
defb &11,&88,&66,&30,&80,&00,&B0,&C0,&04,&30
defb &D0,&F0,&50,&61,&0F,&2C,&00,&C0,&00,&60
defb &30,&00,&E0,&30,&10,&90,&F0,&E0,&80,&10
defb &E0,&F0,&40,&30,&03,&00,&07,&11,&91,&CC
defb &11,&0C,&74,&B0,&E0,&10,&50,&F0,&00,&70
defb &A1,&68,&A0,&F0,&0F,&1C,&70,&70,&03,&00
defb &07,&11,&89,&0C,&01,&0C,&74,&B1,&F8,&00
defb &A0,&F0,&F0,&C0,&43,&3C,&50,&F0,&0F,&28
defb &00,&C0,&00,&50,&F0,&F0,&D0,&F0,&10,&70
defb &30,&80,&C0,&70,&70,&10,&C0,&10,&80,&00
defb &C0,&00,&40,&D0,&03,&00,&0E,&11,&89,&0C
defb &03,&0C,&74,&31,&FE,&10,&40,&F0,&50,&B0
defb &87,&4A,&B0,&F0,&87,&0C,&40,&91,&03,&09
defb &0E,&11,&88,&0E,&07,&0C,&FE,&71,&E6,&80
defb &A0,&0A,&28,&61,&0F,&05,&70,&F0,&C3,&08
defb &00,&11,&01,&0F,&0E,&33,&CC,&0F,&0F,&19
defb &FE,&71,&FA,&00,&50,&05,&14,&F0,&0E,&0A
defb &3C,&F0,&E1,&40,&22,&00,&00,&11,&89,&0F
defb &0C,&77,&EE,&07,&0F,&11,&FE,&73,&EA,&80
defb &80,&02,&1A,&F0,&85,&05,&0F,&F0,&82,&80
defb &22,&00,&00,&11,&88,&07,&08,&77,&FF,&01
defb &0E,&33,&FE,&73,&FA,&00,&40,&00,&F0,&C0
defb &60,&0B,&0F,&0F,&40,&00,&11,&00,&00,&11
defb &CC,&00,&00,&FF,&FF,&88,&00,&FF,&FE,&33
defb &E6,&80,&A2,&98,&F1,&B0,&F0,&86,&07,&0E
defb &A2,&88,&33,&00,&55,&44,&EE,&00,&11,&FF
defb &77,&EE,&33,&FF,&FE,&32,&FE,&00,&40,&30
defb &F2,&70,&F0,&91,&89,&05,&11,&44,&22,&00
defb &88,&00,&FF,&FF,&FF,&EE,&77,&FF,&FF,&FF
defb &FE,&33,&CC,&80,&80,&F1,&F4,&70,&F1,&D1
defb &8A,&0A,&00,&EE,&66,&00,&FF,&73,&98,&10
defb &10,&F2,&E8,&F0,&F2,&D9,&98,&40,&11,&DD
defb &44,&00,&30,&F5,&D0,&87,&F5,&D1,&A8,&00
defb &33,&00,&CC,&00,&22,&88,&77,&FF,&FF,&DD
defb &FF,&EA,&10,&10,&70,&FA,&10,&0F,&7A,&86
defb &06,&00,&66,&00,&00,&11,&77,&FF,&FF,&CC
defb &00,&88,&77,&FF,&FF,&EE,&77,&FF,&FF,&FF
defb &FF,&EE,&20,&20,&71,&E0,&10,&87,&0C,&03
defb &0C,&00,&66,&00,&55,&00,&33,&FF,&FF,&FF
defb &77,&FF,&FF,&FF,&FF,&CC,&50,&00,&F2,&80
defb &00,&87,&3B,&CD,&3B,&DD,&CC,&0A,&FF,&88
defb &20,&A0,&E0,&00,&00,&C3,&3B,&CD,&3B,&DD
defb &01,&05,&00,&01,&15,&FF,&FF,&FF,&EE,&00
defb &33,&FF,&FF,&10,&10,&40,&40,&01,&00,&61
defb &0C,&22,&04,&00,&CC,&0A,&08,&00,&08,&10
defb &E1,&1D,&8B,&0C,&01,&0F,&0C,&00,&00,&08
defb &08,&FF,&FF,&FF,&CC,&00,&00,&FF,&EE,&00
defb &80,&20,&01,&01,&00,&77,&FF,&FF,&CC,&00
defb &00,&77,&CC,&10,&40,&00,&02,&01,&04,&00
defb &AA,&15,&8B,&0C,&AB,&0F,&0C,&00,&0A,&08
defb &00,&33,&FF,&FF,&EE,&00,&60,&F7,&88,&04
defb &20,&80,&05,&00,&08,&01,&55,&11,&89,&19
defb &45,&0F,&0E,&00,&AA,&99,&88,&AA,&AB,&0F
defb &0E,&00,&FF,&FF,&FF,&00,&D0,&F7,&00,&8A
defb &10,&40,&02,&00,&00,&2A,&88,&02,&7F,&FF
defb &FF,&88,&F0,&EE,&11,&45,&04,&20,&04,&00
defb &00,&01,&55,&44,&11,&55,&CD,&0F,&0F,&00
defb &00,&FF,&55,&01,&04,&FF,&FF,&DC,&F1,&8A
defb &00,&AA,&8A,&0A,&0A,&00,&05,&00,&3B,&AB
defb &22,&BB,&8B,&0F,&0E,&00,&11,&FF,&AA,&88
defb &0A,&11,&FF,&FE,&E6,&05,&33,&55,&55,&05
defb &04,&00,&08,&00,&55,&DD,&55,&77,&45,&0F
defb &0D,&00,&33,&FF,&DD,&00,&05,&00,&33,&FF
defb &88,&02,&77,&FF,&EE,&8A,&08,&01,&00,&02
defb &2A,&EE,&AA,&EE,&88,&0F,&0A,&00,&00,&05
defb &77,&FF,&77,&CD,&00,&04,&00,&05,&55,&77
defb &55,&DD,&00,&05,&05,&00,&77,&33,&EE,&88
defb &00,&01,&00,&08,&2A,&BB,&BB,&AA,&00,&0A
defb &0A,&00,&EE,&77,&FF,&44,&02,&0A,&0A,&00
defb &00,&0A,&FF,&66,&EE,&CC,&CC,&EE,&77,&88
defb &0C,&05,&05,&04,&00,&04,&EE,&EE,&EE,&CC
defb &04,&00,&00,&01,&15,&55,&55,&44,&00,&05
defb &04,&00,&DD,&CC,&FF,&45,&02,&00,&02,&0A
defb &0A,&08,&EE,&EE,&EE,&CC,&0A,&00,&00,&0A
defb &00,&22,&AA,&88,&00,&02,&08,&00,&05,&05
defb &05,&04,&00,&11,&55,&00,&DD,&99,&EE,&00
defb &04,&00,&00,&0D,&05,&05,&02,&0A,&CC,&DD
defb &EE,&88,&02,&0A,&08,&00
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


RLE_Draw:
  		ld a,ixh
		ld (ImageWidthA_Plus1-1),a
		ld (ImageWidthB_Plus2-2),a
		ld (ImageWidthC_Plus1-1),a
		ld (ImageWidthD_Plus2-2),a
		ld (ImageWidthE_Plus1-1),a
		cpl
		inc a
		ld (NegativeImageWidth_Plus2-2),a
		ld a,d
		ld (RLE_LastByteH_Plus1-1),a
		ld a,e
		ld (RLE_LastByteL_Plus1-1),a
	push hl
		ld a,IXL
		ld h,&C0
		LD L,a
		ld a,b
				ld de,&FFFF :NegativeImageWidth_Plus2
		or a
RLE_DrawGetNextLine:
		jr z,RLE_DrawGotLine
		call RLE_NextScreenLineHL
		add hl,de
		dec a
		jr RLE_DrawGetNextLine
RLE_DrawGotLine:
		ld (RLE_ScrPos_Plus2-2),hl
	;	xor a
				ld iyl,RLE_ImageWidth :ImageWidthA_Plus1
		ld a,255
		ld e,a
		;ld (Nibble_Plus1-1),a
	pop hl


RLE_MoreBytesLoop:

	inc hl
	ld a,(hl)
	ld b,a
	or a
	jp z,RLE_OneByteData
	and %00001111
	jp z,RLE_PlainBitmapData
	ld ixh,0
	ld ixl,a

	;we're doing Nibble data, Expand the data into two pixels of Mode 1 and duplicate

	ld a,b
	and %00110000
	rrca
	rrca
	ld c,a
	ld a,b
	and %11000000
	or c
	ld c,a
	rrca	;Remove these for Left->right
	rrca
	or c
	ld c,a

	ld a,ixl
	cp 15
	jp nz,RLE_NoMoreNibbleBytes
	push de
RLE_MoreNibbleBytes:
		inc hl
		ld a,(hl)
		ld d,0
		ld e,a
		add ix,de
		cp 255
		jp z,RLE_MoreNibbleBytes
	pop de

RLE_NoMoreNibbleBytes:


	ld a,e
	or a
	jp z,RLE_MoreBytesPart2Flip


	ld a,ixl
	cp 4
	call nc,RLE_ByteNibbles



	xor a
	ld d,a ;byte for screen
	push hl
	ld hl,&C050 :RLE_ScrPos_Plus2
	ld b,iyl
RLE_MoreBytes:
	ld a,c
	and %00110011
	or d
	ld d,a
	dec ix
	ld a,ixl
	or ixh
	jr z,RLE_LastByteFlip


RLE_MoreBytesPart2:
	ld a,c
	and %11001100
	or d
	ld d,a

	dec ix

		ld (hl),d
		dec hl
		dec b
		call z,RLE_NextScreenLineHL

	xor a
	ld d,a ;byte for screen

	ld a,ixl
	or ixh
	jr nz,RLE_MoreBytes

RLE_LastByte:
	ld iyl,b
	ld (RLE_ScrPos_Plus2-2),hl
	pop hl
;	ld iyl,b
	ld a,&00:RLE_LastByteH_Plus1
	cp h
	jp nz,RLE_MoreBytesLoop

	ld a,&00:RLE_LastByteL_Plus1
	cp l
	jp nz,RLE_MoreBytesLoop




	exx 			;keep the firmware working!
	pop bc
	exx

	ret
RLE_LastByteFlip:
	ld a,e
	cpl
	ld e,a
	jp RLE_LastByte
RLE_MoreBytesPart2Flip:
	push hl
	ld b,iyl
	ld hl,(RLE_ScrPos_Plus2-2)
	ld a,e
	cpl
	ld e,a
	jp RLE_MoreBytesPart2


RLE_NextScreenLine:
	push hl
		ld iyl,RLE_ImageWidth :ImageWidthC_Plus1
		ld hl,&800+RLE_ImageWidth :ImageWidthB_Plus2
		add hl,de
		ex hl,de
	pop hl
	ret nc
	push hl
		ld hl,&c050
		add hl,de
		ex hl,de
	pop hl
	ret

RLE_PlainBitmapData:
	push de
		ld a,(hl)
		rrca
		rrca
		rrca
		rrca
		ld b,0
		ld c,a

		cp 15
		jp nz,RLE_PlainBitmapDataNoExtras
	;More than 14 bytes, load an extra byte into the count
RLE_PlainBitmapDataHasExtras:
		inc hl
		ld a,(hl)
		or a
		jr z,RLE_PlainBitmapDataNoExtras	; no more bytes
		push hl
			ld h,0
			ld l,a
			add hl,bc
			ld b,h
			ld c,l
		pop hl

		cp 255
		jr z,RLE_PlainBitmapDataHasExtras
RLE_PlainBitmapDataNoExtras:

	
		ld de,(RLE_ScrPos_Plus2-2)
		RLE_PlainBitmapData_More:
		inc hl
		ld a,(hl)
		ld (de),a
		dec de



		dec iyl
		call z,RLE_NextScreenLine
		dec bc
		ld a,b
		or c
		jp nz,RLE_PlainBitmapData_More

		ld (RLE_ScrPos_Plus2-2),de
;ret
	pop de
	jp RLE_MoreBytesLoop

RLE_OneByteData:
	push de
		xor a 
		ld b,a
		ld c,a
RLE_OneByteDataExtras:
		inc hl
		ld a,(hl)
		push hl
			ld h,0
			ld l,a
			add hl,bc
			ld b,h
			ld c,l
		pop hl

		cp 255
		jp z,RLE_OneByteDataExtras

		inc hl
		ld a,(hl)
		ld (RLE_ThisOneByte_Plus1-1),a


		ld de,(RLE_ScrPos_Plus2-2)
RLE_OneByteData_More:
		ld a,00:RLE_ThisOneByte_Plus1
		ld (de),a
		dec de
		dec iyl
		call z,RLE_NextScreenLine




		dec bc
		ld a,b
		or c
		jp nz,RLE_OneByteData_More

		ld (RLE_ScrPos_Plus2-2),de
		;ret

	pop de
	jp RLE_MoreBytesLoop
RLE_ByteNibbles:
	di
	ld a,c
	exx
	ld b,iyl
	ld c,a
	ld d,ixh
	ld e,ixl
		ld hl,(RLE_ScrPos_Plus2-2)
RLE_ByteNibblesMore3:
		ld a,3
RLE_ByteNibblesMore:
		ld (hl),c
		dec hl 
		dec b;iyl
		call z,RLE_NextScreenLineHL

		dec de
		dec de
		cp e
		jp c,RLE_ByteNibblesMore

		ld a,d
		or a
		jp nz,RLE_ByteNibblesMore3

	ld (RLE_ScrPos_Plus2-2),hl
	ld iyl,b
	ld ixh,d
	ld ixl,e
	exx
list
ret
LastByte:defb 0
;read "CoreDefs.asm";read "BootStrap.asm"
save "lz48\T29-SC1.D01",&4000,LastByte-&4000	;address,size...}[,exec_address]
