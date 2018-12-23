write "..\BldZX\spectest.bin"
org &8000
FileStart:




org &8000

nolist
FirstByte:
jp PicClipImage

PicClipImage:
ld (StackRestore_Plus2-2),sp
di
ld sp,&4000+0+32

LD IX,PicClipImage_DrawOrder
JP JumpToNextLine


PicClipImage_Line_0:
call BitmapPush6
defw BitmapData+5
LD DE,&EEEE
call MultiPushDe6
LD HL,&EE1C
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+13


PicClipImage_Line_1:
LD HL,&DD00
  Push HL
  PUSH DE
LD BC,&00BB
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&BB38
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
LD BC,&1FF0
  Push BC
LD HL,&FCBB
  jp NextLinePushHl 


PicClipImage_Line_2:
call BitmapPush6
defw BitmapData+19
LD DE,&EEEE
call MultiPushDe6
call BitmapPush8
defw BitmapData+27
  PUSH DE
LD HL,&3FEF
  Push HL
LD BC,&FCEE
 jp NextLinePushBC 


PicClipImage_Line_3:
call BitmapPush6
defw BitmapData+33
LD DE,&BBBB
call MultiPushDe6
call BitmapPush6
defw BitmapData+39
  PUSH DE
  PUSH DE
LD HL,&3F0F
  Push HL
LD BC,&FCBB
 jp NextLinePushBC 


PicClipImage_Line_4:
call BitmapPush6
defw BitmapData+45
LD DE,&EEEE
call MultiPushDe6
call BitmapPush8
defw BitmapData+53
  PUSH DE
LD HL,&3F51
  Push HL
LD BC,&FCEF
 jp NextLinePushBC 


PicClipImage_Line_5:
call BitmapPush6
defw BitmapData+59
LD DE,&BBBB
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&BFBB
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+67
LD BC,&BFBB
  Push BC
  PUSH DE
LD HL,&3F55
  Push HL
Ld B,&FC
 jp NextLinePushBC 


PicClipImage_Line_6:
call BitmapPush6
defw BitmapData+73
LD DE,&EEEE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+87
  PUSH DE
LD HL,&3F55
  Push HL
LD BC,&F8EF
 jp NextLinePushBC 


PicClipImage_Line_7:
call BitmapPush6
defw BitmapData+93
LD DE,&BBBB
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FFBB
  Push HL
LD DE,&FFFB
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+107


PicClipImage_Line_8:
call BitmapPush10
defw BitmapData+117
LD DE,&00EE
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+131


PicClipImage_Line_9:
call BitmapPush30
defw BitmapData+161
LD HL,&BFBB
  jp NextLinePushHl 


PicClipImage_Line_10:
call BitmapPush30
defw BitmapData+191
LD HL,&EFEE
  jp NextLinePushHl 


PicClipImage_Line_11:
LD HL,&007F
  Push HL
LD DE,&5501
  PUSH DE
  PUSH DE
call FinalBitmapPush26
defw BitmapData+217


PicClipImage_Line_12:
call BitmapPush30
defw BitmapData+247
LD HL,&FFEE
  jp NextLinePushHl 


PicClipImage_Line_13:
LD HL,&805F
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
call FinalBitmapPush26
defw BitmapData+273


PicClipImage_Line_14:
LD HL,&C02F
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush26
defw BitmapData+299


PicClipImage_Line_15:
LD HL,&E057
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush26
defw BitmapData+325


PicClipImage_Line_16:
LD HL,&E0AB
  Push HL
  PUSH DE
call FinalBitmapPush28
defw BitmapData+353


PicClipImage_Line_17:
call BitmapPush30
defw BitmapData+383
LD HL,&FFBF
  jp NextLinePushHl 


PicClipImage_Line_18:
call BitmapPush30
defw BitmapData+413
LD HL,&FFFB
  jp NextLinePushHl 


PicClipImage_Line_19:
call BitmapPush30
defw BitmapData+443
LD HL,&FFBF
  jp NextLinePushHl 


PicClipImage_Line_20:
call BitmapPush30
defw BitmapData+473
LD HL,&FFF7
  jp NextLinePushHl 


PicClipImage_Line_21:
call BitmapPush30
defw BitmapData+503
LD HL,&FFDF
  jp NextLinePushHl 


PicClipImage_Line_22:
call BitmapPush28
defw BitmapData+531
  PUSH DE
LD HL,&FFFF
  jp NextLinePushHl 


PicClipImage_Line_23:
call BitmapPush28
defw BitmapData+559
  PUSH DE
LD HL,&FEBF
  jp NextLinePushHl 


PicClipImage_Line_24:
call BitmapPush30
defw BitmapData+589
LD HL,&755D
  jp NextLinePushHl 


PicClipImage_Line_25:
call BitmapPush30
defw BitmapData+619
LD HL,&EAAA
  jp NextLinePushHl 


PicClipImage_Line_26:
call BitmapPush30
defw BitmapData+649
LD HL,&555D
  jp NextLinePushHl 


PicClipImage_Line_27:
call BitmapPush30
defw BitmapData+679
LD HL,&AAAA
  jp NextLinePushHl 


PicClipImage_Line_28:
call BitmapPush30
defw BitmapData+709
LD HL,&555D
  jp NextLinePushHl 


PicClipImage_Line_29:
call BitmapPush30
defw BitmapData+739
LD HL,&AAAA
  jp NextLinePushHl 


PicClipImage_Line_30:
  PUSH DE
call FinalBitmapPush30
defw BitmapData+769


PicClipImage_Line_31:
  PUSH DE
call FinalBitmapPush30
defw BitmapData+799


PicClipImage_Line_32:
  PUSH DE
call FinalBitmapPush30
defw BitmapData+829


PicClipImage_Line_33:
  PUSH DE
call FinalBitmapPush30
defw BitmapData+859


PicClipImage_Line_34:
  PUSH DE
call FinalBitmapPush30
defw BitmapData+889


PicClipImage_Line_35:
  PUSH DE
  PUSH DE
call FinalBitmapPush28
defw BitmapData+917


PicClipImage_Line_36:
  PUSH DE
  PUSH DE
call FinalBitmapPush28
defw BitmapData+945


PicClipImage_Line_37:
  PUSH DE
  PUSH DE
call FinalBitmapPush28
defw BitmapData+973


PicClipImage_Line_38:
LD HL,&0200
  Push HL
  PUSH DE
call FinalBitmapPush28
defw BitmapData+1001


PicClipImage_Line_39:
  PUSH DE
call FinalBitmapPush30
defw BitmapData+1031


PicClipImage_Line_40:
call BitmapPush30
defw BitmapData+1061
LD HL,&6F00
  jp NextLinePushHl 


PicClipImage_Line_41:
call BitmapPush8
defw BitmapData+1069
LD DE,&A002
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1077
  PUSH DE
LD DE,&0A01
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1083


PicClipImage_Line_42:
call BitmapPush22
defw BitmapData+1105
LD DE,&0504
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1111


PicClipImage_Line_43:
call BitmapPush30
defw BitmapData+1141
LD HL,&FB07
  jp NextLinePushHl 


PicClipImage_Line_44:
call BitmapPush22
defw BitmapData+1163
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1169


PicClipImage_Line_45:
call BitmapPush8
defw BitmapData+1177
LD DE,&A002
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+1197


PicClipImage_Line_46:
call BitmapPush8
defw BitmapData+1205
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0044
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1215


PicClipImage_Line_47:
call BitmapPush8
defw BitmapData+1223
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

Ld E,L

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1229


PicClipImage_Line_48:
LD HL,&447F
  Push HL
LD BC,&FFFF
  Push BC
Call PushDE_0000x
call FinalBitmapPush20
defw BitmapData+1249


PicClipImage_Line_49:
LD HL,&1191
  Push HL
LD BC,&FF5B
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1265
LD DE,&AA2A
 jp NextLinePushDe2


PicClipImage_Line_50:
call BitmapPush30
defw BitmapData+1295
LD HL,&4140
  jp NextLinePushHl 


PicClipImage_Line_51:
call BitmapPush30
defw BitmapData+1325
LD HL,&942A
  jp NextLinePushHl 


PicClipImage_Line_52:
call BitmapPush30
defw BitmapData+1355
LD HL,&554A
  jp NextLinePushHl 


PicClipImage_Line_53:
LD DE,&1111
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1373
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1381


PicClipImage_Line_54:
LD DE,&4444
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1399
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1407


PicClipImage_Line_55:
LD DE,&1111
  PUSH DE
  PUSH DE
Call PushDE_0000x
call FinalBitmapPush20
defw BitmapData+1427


PicClipImage_Line_56:
call MultiPushDe7
call BitmapPush8
defw BitmapData+1435
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1441


PicClipImage_Line_57:
LD HL,&4444
  Push HL
LD BC,&4404
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+1461


PicClipImage_Line_58:
call MultiPushDe7
call FinalBitmapPush18
defw BitmapData+1479


PicClipImage_Line_59:
call MultiPushDe7
call FinalBitmapPush18
defw BitmapData+1497


PicClipImage_Line_60:
LD HL,&0404
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+1517


PicClipImage_Line_61:
call MultiPushDe7
call FinalBitmapPush18
defw BitmapData+1535


PicClipImage_Line_62:
call MultiPushDe7
call FinalBitmapPush18
defw BitmapData+1553


PicClipImage_Line_63:
LD HL,&0004
  Push HL
call MultiPushDe6
call FinalBitmapPush18
defw BitmapData+1571


PicClipImage_Line_64:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1F00
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1589


PicClipImage_Line_65:
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1607


PicClipImage_Line_66:
  PUSH DE
  PUSH DE
LD HL,&00F8
  Push HL
LD BC,&E001
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1625


PicClipImage_Line_67:
  PUSH DE
  PUSH DE
LD HL,&E067
  Push HL
LD BC,&8002
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1643


PicClipImage_Line_68:
call BitmapPush8
defw BitmapData+1651
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1669


PicClipImage_Line_69:
call BitmapPush8
defw BitmapData+1677
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1695


PicClipImage_Line_70:
call BitmapPush6
defw BitmapData+1701
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+1719


PicClipImage_Line_71:
call BitmapPush6
defw BitmapData+1725
call MultiPushDe5
call BitmapPush8
defw BitmapData+1733
Ld E,&14
  PUSH DE
  PUSH DE
LD HL,&0420
  Push HL
Ld B,D
Ld C,L

 jp NextLinePushBC 


PicClipImage_Line_72:
call BitmapPush6
defw BitmapData+1739
Ld E,&00
call MultiPushDe5
call BitmapPush12
defw BitmapData+1751
Ld E,&80
 jp NextLinePushDe2


PicClipImage_Line_73:
call BitmapPush6
defw BitmapData+1757
Ld E,&00
call MultiPushDe5
call FinalBitmapPush16
defw BitmapData+1773


PicClipImage_Line_74:
call BitmapPush6
defw BitmapData+1779
call MultiPushDe5
call BitmapPush8
defw BitmapData+1787
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1793


PicClipImage_Line_75:
  PUSH DE
call BitmapPush6
defw BitmapData+1799
call MultiPushDe5
call FinalBitmapPush14
defw BitmapData+1813


PicClipImage_Line_76:
  PUSH DE
call BitmapPush6
defw BitmapData+1819
call MultiPushDe5
call BitmapPush6
defw BitmapData+1825
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1831


PicClipImage_Line_77:
  PUSH DE
call BitmapPush6
defw BitmapData+1837
call MultiPushDe5
call BitmapPush12
defw BitmapData+1849
 jp NextLinePushDe1


PicClipImage_Line_78:
  PUSH DE
call BitmapPush6
defw BitmapData+1855
call MultiPushDe6
call BitmapPush10
defw BitmapData+1865
 jp NextLinePushDe1


PicClipImage_Line_79:
  PUSH DE
call BitmapPush6
defw BitmapData+1871
call MultiPushDe5
call BitmapPush12
defw BitmapData+1883
 jp NextLinePushDe1


PicClipImage_Line_80:
  PUSH DE
call BitmapPush6
defw BitmapData+1889
call MultiPushDe5
call FinalBitmapPush14
defw BitmapData+1903


PicClipImage_Line_81:
  PUSH DE
call BitmapPush6
defw BitmapData+1909
call MultiPushDe5
call FinalBitmapPush14
defw BitmapData+1923


PicClipImage_Line_82:
  PUSH DE
call BitmapPush6
defw BitmapData+1929
call MultiPushDe5
call FinalBitmapPush14
defw BitmapData+1943


PicClipImage_Line_83:
  PUSH DE
LD HL,&1800
  Push HL
  PUSH DE
LD BC,&2001
  Push BC
call MultiPushDe5
call FinalBitmapPush14
defw BitmapData+1957


PicClipImage_Line_84:
  PUSH DE
LD HL,&1C00
  Push HL
  PUSH DE
LD BC,&2001
  Push BC
call MultiPushDe5
call FinalBitmapPush14
defw BitmapData+1971


PicClipImage_Line_85:
  PUSH DE
LD HL,&0E00
  Push HL
call MultiPushDe7
call FinalBitmapPush14
defw BitmapData+1985


PicClipImage_Line_86:
  PUSH DE
LD HL,&0600
  Push HL
call MultiPushDe7
call FinalBitmapPush14
defw BitmapData+1999


PicClipImage_Line_87:
  PUSH DE
LD HL,&0300
  Push HL
call MultiPushDe8
call FinalBitmapPush12
defw BitmapData+2011


PicClipImage_Line_88:
LD HL,&0040
  Push HL
LD BC,&0100
  Push BC
call MultiPushDe9
call BitmapPush6
defw BitmapData+2017
  PUSH DE
LD HL,&00BA
  jp NextLinePushHl 


PicClipImage_Line_89:
LD HL,&00F0
  Push HL
call MultiPushDe9
call FinalBitmapPush12
defw BitmapData+2029


PicClipImage_Line_90:
LD HL,&0048
  Push HL
LD BC,&0100
  Push BC
call MultiPushDe7
call FinalBitmapPush14
defw BitmapData+2043


PicClipImage_Line_91:
LD HL,&0028
  Push HL
LD BC,&0100
  Push BC
call MultiPushDe7
call BitmapPush6
defw BitmapData+2049
  PUSH DE
call FinalBitmapPush6
defw BitmapData+2055


PicClipImage_Line_92:
LD HL,&0024
  Push HL
LD BC,&0100
  Push BC
call MultiPushDe7
call BitmapPush6
defw BitmapData+2061
  PUSH DE
  PUSH DE
LD HL,&0200
  Push HL
LD BC,&002A
 jp NextLinePushBC 


PicClipImage_Line_93:
LD HL,&0004
  Push HL
LD BC,&0200
  Push BC
call MultiPushDe7
call FinalBitmapPush14
defw BitmapData+2075


PicClipImage_Line_94:
call MultiPushDe9
LD HL,&7E00
  Push HL
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2085


PicClipImage_Line_95:
call MultiPushDe9
LD HL,&7F00
  Push HL
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2095


PicClipImage_Line_96:
call MultiPushDe8
LD HL,&0080
  Push HL
LD BC,&3F00
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2105


PicClipImage_Line_97:
call MultiPushDe8
LD HL,&0040
  Push HL
LD BC,&3F00
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2115


PicClipImage_Line_98:
call MultiPushDe8
LD HL,&0020
  Push HL
LD BC,&1F00
  Push BC
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2123


PicClipImage_Line_99:
  PUSH DE
  PUSH DE
LD HL,&0010
  Push HL
call MultiPushDe5
LD BC,&0020
  Push BC
LD HL,&1F00
  Push HL
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2133


PicClipImage_Line_100:
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
call MultiPushDe5
LD BC,&0020
  Push BC
LD HL,&1F00
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+2141
 jp NextLinePushDe1


PicClipImage_Line_101:
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&5000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&20
  Push HL
Ld B,&0F
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2151


PicClipImage_Line_102:
  PUSH DE
  PUSH DE
LD HL,&0208
  Push HL
LD BC,&5000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
Ld B,&0F
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+2157


PicClipImage_Line_103:
  PUSH DE
  PUSH DE
LD HL,&0208
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe5
LD HL,&0300
  Push HL
  PUSH DE
Ld B,&70
  Push BC
LD HL,&4455
  Push HL
  PUSH DE
LD BC,&5405
  Push BC
LD HL,&40FF
  jp NextLinePushHl 


PicClipImage_Line_104:
  PUSH DE
  PUSH DE
LD HL,&0110
  Push HL
call MultiPushDe8
LD BC,&2840
  Push BC
LD HL,&0C00
  Push HL
  PUSH DE
  PUSH DE
LD BC,&A03F
 jp NextLinePushBC 


PicClipImage_Line_105:
  PUSH DE
  PUSH DE
LD HL,&0218
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe7
call BitmapPush6
defw BitmapData+2163
  PUSH DE
LD HL,&407F
  jp NextLinePushHl 


PicClipImage_Line_106:
  PUSH DE
  PUSH DE
LD HL,&0F10
  Push HL
LD BC,&7800
  Push BC
call MultiPushDe7
call BitmapPush6
defw BitmapData+2169
  PUSH DE
LD HL,&A0AF
  jp NextLinePushHl 


PicClipImage_Line_107:
  PUSH DE
  PUSH DE
LD HL,&1C38
  Push HL
LD BC,&1008
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2179


PicClipImage_Line_108:
  PUSH DE
  PUSH DE
LD HL,&1E1C
  Push HL
LD BC,&4808
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8003
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+2185
  PUSH DE
LD BC,&8000
  Push BC
LD HL,&E82B
  jp NextLinePushHl 


PicClipImage_Line_109:
  PUSH DE
  PUSH DE
LD HL,&1E3E
  Push HL
LD BC,&6610
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C001
  Push HL
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2197


PicClipImage_Line_110:
  PUSH DE
  PUSH DE
LD HL,&363E
  Push HL
LD BC,&6F09
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F001
  Push HL
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2209


PicClipImage_Line_111:
  PUSH DE
  PUSH DE
LD HL,&F76E
  Push HL
LD BC,&6D02
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F801
  Push HL
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2221


PicClipImage_Line_112:
  PUSH DE
call BitmapPush6
defw BitmapData+2227
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8E00
  Push HL
  PUSH DE
LD BC,&0020
  Push BC
LD HL,&00A0
  Push HL
  PUSH DE
LD BC,&2000
  Push BC
LD HL,&4C03
  Push HL
LD BC,&00A0
 jp NextLinePushBC 


PicClipImage_Line_113:
call BitmapPush28
defw BitmapData+2255
  PUSH DE
LD HL,&4055
  jp NextLinePushHl 


PicClipImage_Line_114:
  PUSH DE
call BitmapPush6
defw BitmapData+2261
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
Ld L,&08
  Push HL
LD BC,&4021
  Push BC
  PUSH DE
LD HL,&0300
  Push HL
  PUSH DE
LD BC,&0008
 jp NextLinePushBC 


PicClipImage_Line_115:
call BitmapPush30
defw BitmapData+2291
LD HL,&0014
  jp NextLinePushHl 


PicClipImage_Line_116:
  PUSH DE
call BitmapPush6
defw BitmapData+2297
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
LD BC,&4500
  Push BC
  PUSH DE
Ld L,&02
  Push HL
LD BC,&0028
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+2303


PicClipImage_Line_117:
call BitmapPush8
defw BitmapData+2311
LD DE,&5555
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&55F0
  Push HL
LD BC,&6940
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2323


PicClipImage_Line_118:
call BitmapPush8
defw BitmapData+2331
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
LD BC,&2B00
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+2341
 jp NextLinePushDe1


PicClipImage_Line_119:
call BitmapPush8
defw BitmapData+2349
LD DE,&AAAA
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&AAE0
  Push HL
LD BC,&2BA8
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2361


PicClipImage_Line_120:
call BitmapPush8
defw BitmapData+2369
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00A0
  Push HL
LD BC,&1F00
  Push BC
  PUSH DE
Ld L,&08
  Push HL
Ld B,&12
  Push BC
  PUSH DE
LD HL,&80BE
  Push HL
LD BC,&AA02
  Push BC
 jp NextLinePushDe1


PicClipImage_Line_121:
call BitmapPush8
defw BitmapData+2377
LD DE,&5555
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2383
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2395


PicClipImage_Line_122:
call BitmapPush8
defw BitmapData+2403
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0004
  Push HL
LD BC,&2000
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
LD BC,&0908
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+2409


PicClipImage_Line_123:
call BitmapPush8
defw BitmapData+2417
LD DE,&AAAA
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+2437


PicClipImage_Line_124:
call BitmapPush16
defw BitmapData+2453
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0900
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+2459


PicClipImage_Line_125:
call BitmapPush30
defw BitmapData+2489
LD HL,&2080
  jp NextLinePushHl 


PicClipImage_Line_126:
call BitmapPush30
defw BitmapData+2519
LD HL,&0002
  jp NextLinePushHl 


PicClipImage_Line_127:
call BitmapPush30
defw BitmapData+2549
 jp NextLinePushDe1


PicClipImage_Line_128:
call BitmapPush10
defw BitmapData+2559
  PUSH DE
call BitmapPush18
defw BitmapData+2577
 jp NextLinePushDe1


PicClipImage_Line_129:
call BitmapPush10
defw BitmapData+2587
  PUSH DE
call FinalBitmapPush20
defw BitmapData+2607


PicClipImage_Line_130:
LD DE,&AAAA
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2619
  PUSH DE
call FinalBitmapPush14
defw BitmapData+2633


PicClipImage_Line_131:
call BitmapPush30
defw BitmapData+2663
LD HL,&405F
  jp NextLinePushHl 


PicClipImage_Line_132:
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2683
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&802F
  jp NextLinePushHl 


PicClipImage_Line_133:
call BitmapPush26
defw BitmapData+2709
  PUSH DE
LD HL,&0010
  Push HL
LD BC,&F47F
 jp NextLinePushBC 


PicClipImage_Line_134:
call BitmapPush24
defw BitmapData+2733
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E82B
  jp NextLinePushHl 


PicClipImage_Line_135:
call BitmapPush16
defw BitmapData+2749
  PUSH DE
call BitmapPush8
defw BitmapData+2757
  PUSH DE
  PUSH DE
LD HL,&F57F
  jp NextLinePushHl 


PicClipImage_Line_136:
call BitmapPush28
defw BitmapData+2785
  PUSH DE
LD HL,&FA2A
  jp NextLinePushHl 


PicClipImage_Line_137:
call BitmapPush26
defw BitmapData+2811
  PUSH DE
LD HL,&1000
  Push HL
LD BC,&FD5F
 jp NextLinePushBC 


PicClipImage_Line_138:
  PUSH DE
  PUSH DE
LD HL,&7C86
  Push HL
LD BC,&0103
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+2827
  PUSH DE
LD HL,&4000
  Push HL
LD BC,&FAAA
 jp NextLinePushBC 


PicClipImage_Line_139:
call BitmapPush26
defw BitmapData+2853
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&FD55
 jp NextLinePushBC 


PicClipImage_Line_140:
  PUSH DE
  PUSH DE
LD HL,&7DB7
  Push HL
LD BC,&A101
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+2863
  PUSH DE
LD HL,&00E8
  Push HL
LD BC,&0130
  Push BC
  PUSH DE
  PUSH DE
LD HL,&A88A
  jp NextLinePushHl 


PicClipImage_Line_141:
call BitmapPush28
defw BitmapData+2891
  PUSH DE
LD HL,&1451
  jp NextLinePushHl 


PicClipImage_Line_142:
LD HL,&00FE
  Push HL
  PUSH DE
LD BC,&7F5B
  Push BC
LD HL,&FC0E
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+2907
  PUSH DE
  PUSH DE
LD BC,&0002
 jp NextLinePushBC 


PicClipImage_Line_143:
call BitmapPush28
defw BitmapData+2935
 jp NextLinePushDe2


PicClipImage_Line_144:
call BitmapPush24
defw BitmapData+2959
  PUSH DE
LD HL,&013A
  Push HL
 jp NextLinePushDe2


PicClipImage_Line_145:
call BitmapPush30
defw BitmapData+2989
LD HL,&0020
  jp NextLinePushHl 


PicClipImage_Line_146:
call BitmapPush28
defw BitmapData+3017
  PUSH DE
LD HL,&0200
  jp NextLinePushHl 


PicClipImage_Line_147:
call BitmapPush30
defw BitmapData+3047
LD HL,&0005
  jp NextLinePushHl 


PicClipImage_Line_148:
LD HL,&C020
  Push HL
  PUSH DE
call BitmapPush24
defw BitmapData+3071
  PUSH DE
LD BC,&800A
 jp NextLinePushBC 


PicClipImage_Line_149:
LD HL,&8044
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush26
defw BitmapData+3097


PicClipImage_Line_150:
LD HL,&C00E
  Push HL
LD BC,&0B00
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+3107
Ld E,&80
  PUSH DE
  PUSH DE
call FinalBitmapPush12
defw BitmapData+3119


PicClipImage_Line_151:
LD HL,&C041
  Push HL
LD BC,&0F00
  Push BC
  PUSH DE
call FinalBitmapPush26
defw BitmapData+3145


PicClipImage_Line_152:
call BitmapPush26
defw BitmapData+3171
Ld E,&00
 jp NextLinePushDe3


PicClipImage_Line_153:
call BitmapPush22
defw BitmapData+3193
  PUSH DE
LD HL,&8007
  Push HL
 jp NextLinePushDe3


PicClipImage_Line_154:
call BitmapPush22
defw BitmapData+3215
  PUSH DE
LD HL,&808D
  Push HL
 jp NextLinePushDe3


PicClipImage_Line_155:
call BitmapPush22
defw BitmapData+3237
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0020
  jp NextLinePushHl 


PicClipImage_Line_156:
call BitmapPush24
defw BitmapData+3261
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0089
  jp NextLinePushHl 


PicClipImage_Line_157:
call BitmapPush22
defw BitmapData+3283
  PUSH DE
LD HL,&0040
  Push HL
LD BC,&0001
  Push BC
  PUSH DE
Ld L,&54
  jp NextLinePushHl 


PicClipImage_Line_158:
call BitmapPush26
defw BitmapData+3309
  PUSH DE
LD HL,&0040
  Push HL
LD BC,&40EA
 jp NextLinePushBC 


PicClipImage_Line_159:
call BitmapPush28
defw BitmapData+3337
  PUSH DE
LD HL,&10FD
  jp NextLinePushHl 


PicClipImage_Line_160:
call BitmapPush24
defw BitmapData+3361
  PUSH DE
LD HL,&4000
  Push HL
  PUSH DE
LD BC,&80FA
 jp NextLinePushBC 


PicClipImage_Line_161:
call BitmapPush22
defw BitmapData+3383
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3391


PicClipImage_Line_162:
call BitmapPush22
defw BitmapData+3413
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3421


PicClipImage_Line_163:
call BitmapPush22
defw BitmapData+3443
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3451


PicClipImage_Line_164:
call BitmapPush22
defw BitmapData+3473
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3481


PicClipImage_Line_165:
call BitmapPush22
defw BitmapData+3503
  PUSH DE
LD HL,&F005
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F2FF
 jp NextLinePushBC 


PicClipImage_Line_166:
call BitmapPush22
defw BitmapData+3525
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3533


PicClipImage_Line_167:
call BitmapPush14
defw BitmapData+3547
  PUSH DE
call BitmapPush6
defw BitmapData+3553
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3561


PicClipImage_Line_168:
call BitmapPush20
defw BitmapData+3581
  PUSH DE
call BitmapPush6
defw BitmapData+3587
  PUSH DE
LD HL,&EAAF
  jp NextLinePushHl 


PicClipImage_Line_169:
call BitmapPush20
defw BitmapData+3607
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3617


PicClipImage_Line_170:
call BitmapPush20
defw BitmapData+3637
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3647


PicClipImage_Line_171:
call BitmapPush20
defw BitmapData+3667
  PUSH DE
call BitmapPush6
defw BitmapData+3673
  PUSH DE
LD HL,&FDFF
  jp NextLinePushHl 


PicClipImage_Line_172:
call BitmapPush20
defw BitmapData+3693
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3703


PicClipImage_Line_173:
  PUSH DE
call BitmapPush8
defw BitmapData+3711
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3717
  PUSH DE
call FinalBitmapPush10
defw BitmapData+3727


PicClipImage_Line_174:
call BitmapPush10
defw BitmapData+3737
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0800
  Push HL
LD BC,&0014
  Push BC
  PUSH DE
LD HL,&C00E
  Push HL
LD BC,&8000
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0AA0
  jp NextLinePushHl 


PicClipImage_Line_175:
  PUSH DE
LD HL,&04C0
  Push HL
LD BC,&810A
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+3753
  PUSH DE
  PUSH DE
LD HL,&0020
  Push HL
LD BC,&5555
 jp NextLinePushBC 


PicClipImage_Line_176:
call BitmapPush6
defw BitmapData+3759
  PUSH DE
call BitmapPush6
defw BitmapData+3765
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3771
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3777


PicClipImage_Line_177:
call BitmapPush14
defw BitmapData+3791
  PUSH DE
call FinalBitmapPush16
defw BitmapData+3807


PicClipImage_Line_178:
call BitmapPush12
defw BitmapData+3819
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3833
 jp NextLinePushDe1


PicClipImage_Line_179:
LD HL,&0040
  Push HL
LD BC,&3D80
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+3841
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3849
  PUSH DE
LD HL,&0054
  Push HL
LD BC,&5545
 jp NextLinePushBC 


PicClipImage_Line_180:
LD HL,&0040
  Push HL
LD BC,&2100
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+3857
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3865
  PUSH DE
LD HL,&00A0
  Push HL
LD BC,&82A2
 jp NextLinePushBC 


PicClipImage_Line_181:
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3875
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3889


PicClipImage_Line_182:
LD HL,&0800
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+3899
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3913


PicClipImage_Line_183:
LD HL,&2200
  Push HL
  PUSH DE
call FinalBitmapPush28
defw BitmapData+3941


PicClipImage_Line_184:
call BitmapPush22
defw BitmapData+3963
jp MultiPushDeLast5


PicClipImage_Line_185:
call BitmapPush22
defw BitmapData+3985
jp MultiPushDeLast5


PicClipImage_Line_186:
call BitmapPush22
defw BitmapData+4007
jp MultiPushDeLast5


PicClipImage_Line_187:
call BitmapPush8
defw BitmapData+4015
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&500A
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush12
defw BitmapData+4027


PicClipImage_Line_188:
call BitmapPush8
defw BitmapData+4035
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&500E
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+4045


PicClipImage_Line_189:
call BitmapPush12
defw BitmapData+4057
  PUSH DE
LD HL,&604C
  Push HL
  PUSH DE
call FinalBitmapPush14
defw BitmapData+4071


PicClipImage_Line_190:
LD HL,&57FD
  Push HL
LD BC,&FF55
  Push BC
  PUSH DE
LD HL,&2822
  Push HL
  PUSH DE
LD BC,&0020
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+4077
  PUSH DE
LD DE,&888A
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+4083


PicClipImage_Line_191:
call BitmapPush8
defw BitmapData+4091
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&582D
  Push HL
  PUSH DE
LD BC,&002E
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+4101


ColorMap_PicClipImage:
ld sp,&5B00
LD DE,&0707
push de
LD DE,&4747
push de
LD DE,&0707
push de
Ld D,&47
push de
Ld E,&47
push de
LD DE,&0707
push de
Ld E,&47
push de
LD DE,&4444
push de
LD DE,&0747
push de
LD DE,&4707
push de
LD DE,&0747
push de
LD DE,&4646
push de
call MultiPushDe4
LD DE,&0404
push de
LD DE,&4403
push de
LD DE,&0347
push de
LD DE,&0707
push de
LD DE,&4747
push de
Ld D,&07
push de
Ld D,E
push de
LD DE,&4404
push de
LD DE,&4747
push de
Ld E,&07
push de
LD DE,&0747
push de
Ld D,E
push de
push de
push de
Ld E,&07
push de
Ld D,E
push de
LD DE,&0444
push de
LD DE,&4403
push de
Ld D,E
push de
Ld E,&47
push de
LD DE,&4005
push de
Ld D,E
push de
push de
LD DE,&4707
push de
LD DE,&0702
push de
Ld D,E
push de
LD DE,&4747
push de
LD DE,&0707
push de
LD DE,&4747
push de
push de
Ld E,&07
push de
Ld D,E
push de
LD DE,&4444
push de
LD DE,&0323
push de
Ld D,E
push de
LD DE,&0347
push de
LD DE,&4005
push de
LD DE,&4F4F
push de
Ld E,&4D
push de
LD DE,&0505
push de
LD DE,&0242
push de
Ld D,E
push de
LD DE,&0202
push de
LD DE,&4207
push de
LD DE,&4747
push de
push de
Ld E,&07
push de
Ld D,E
push de
LD DE,&4404
push de
Ld E,&03
push de
Ld D,&23
push de
LD DE,&4343
push de
LD DE,&0305
push de
LD DE,&4F4F
push de
push de
LD DE,&4D05
push de
LD DE,&4242
push de
push de
push de
Ld E,&47
push de
LD DE,&0707
push de
LD DE,&4747
push de
push de
Ld E,&07
push de
LD DE,&4460
push de
Ld E,&42
push de
LD DE,&4243
push de
LD DE,&6363
push de
LD DE,&4345
push de
LD DE,&4F4F
push de
push de
LD DE,&4D45
push de
LD DE,&0742
push de
LD DE,&4747
push de
push de
LD DE,&0707
push de
push de
LD DE,&4747
push de
push de
push de
LD DE,&4244
push de
Ld E,&42
push de
LD DE,&7272
push de
LD DE,&4444
push de
LD DE,&4242
push de
LD DE,&454D
push de
Ld D,E
push de
Ld E,&42
push de
LD DE,&4207
push de
Ld D,E
push de
LD DE,&4747
push de
Ld E,&07
push de
LD DE,&0747
push de
Ld D,&42
push de
Ld D,E
push de
LD DE,&0707
push de
LD DE,&4242
push de
push de
LD DE,&7272
push de
push de
LD DE,&4242
push de
LD DE,&4545
push de
Ld E,&4D
push de
LD DE,&4D42
push de
Ld D,E
push de
Ld E,&07
push de
LD DE,&0747
push de
LD DE,&4707
push de
push de
Ld D,E
push de
Ld E,&47
push de
Ld E,&07
push de
LD DE,&0202
push de
Ld E,&42
push de
LD DE,&7272
push de
Ld E,&42
push de
LD DE,&0202
push de
push de
LD DE,&4245
push de
Ld D,E
push de
Ld E,&02
push de
Ld D,E
push de
LD DE,&0747
push de
LD DE,&4707
push de
push de
Ld D,E
push de
push de
LD DE,&4747
push de
LD DE,&0202
push de
Ld E,&42
push de
LD DE,&7272
push de
Ld E,&42
push de
LD DE,&0202
push de
push de
push de
Ld E,&45
push de
LD DE,&4D02
push de
Ld D,E
push de
Ld E,&07
push de
Ld D,&47
push de
push de
Ld D,E
push de
Ld E,&04
push de
LD DE,&4747
push de
LD DE,&0205
push de
LD DE,&4747
push de
LD DE,&4242
push de
push de
LD DE,&4747
push de
push de
push de
push de
LD DE,&4507
push de
LD DE,&0747
push de
LD DE,&4707
push de
LD DE,&0747
push de
push de
Ld E,&07
push de
LD DE,&4404
push de
LD DE,&4747
push de
push de
push de
LD DE,&4242
push de
push de
LD DE,&4747
push de
push de
push de
push de
Ld E,&45
push de
LD DE,&4547
push de
Ld D,E
push de
LD DE,&0707
push de
LD DE,&4747
push de
Ld E,&07
push de
push de
Ld E,&47
push de
call MultiPushDe9
Ld D,&45
push de
LD DE,&4707
push de
Ld D,E
push de
Ld E,&47
push de
Ld D,E
push de
Ld E,&07
push de
Ld E,&47
push de
push de
LD DE,&0707
push de
LD DE,&4747
push de
call MultiPushDe7
LD DE,&4545
push de
LD DE,&0707
push de
Ld E,&47
push de
Ld D,E
push de
Ld E,&07
push de
LD DE,&0444
push de
LD DE,&4747
push de
Ld E,&07
push de
Ld E,&47
push de
Ld D,&07
push de
Ld D,E
push de
push de
push de
push de
LD DE,&4303
push de
LD DE,&4747
push de
Ld D,&45
push de
LD DE,&0505
push de
LD DE,&0707
push de
LD DE,&4747
push de
Ld E,&07
push de
Ld E,&47
push de
push de
LD DE,&0707
push de
LD DE,&4747
push de
Ld D,&07
push de
Ld D,E
push de
push de
push de
LD DE,&4303
push de
push de
LD DE,&4247
push de
LD DE,&0507
push de
Ld D,E
push de
Ld D,&47
push de
Ld E,&47
push de
push de
push de
LD DE,&4141
push de
push de
LD DE,&4747
push de
push de
push de
push de
Ld E,&41
push de
LD DE,&4343
push de
push de
Ld E,&03
push de
LD DE,&0347
push de
Ld D,E
push de
push de
LD DE,&4E4E
push de
push de
push de
LD DE,&4141
push de
push de
LD DE,&4747
push de
push de
push de
push de
LD DE,&4141
push de
Ld E,&03
push de
Ld D,E
push de
push de
Ld E,&41
push de
Ld D,E
push de
push de
LD DE,&4E4E
push de
push de
push de
Ld D,&48
push de
Ld D,E
push de
Ld E,&48
push de
LD DE,&484D
push de
LD DE,&4A4A
push de
push de
push de
Ld E,&48
push de
Ld E,&4A
push de
Ld D,&48
push de
Ld D,E
push de
Ld E,&48
push de
push de
LD DE,&4D4D
push de
push de
push de
LD DE,&484E
push de
Ld D,E
push de
push de
LD DE,&494D
push de
LD DE,&4D4A
push de
Ld D,E
push de
call MultiPushDe6
Ld E,&49
push de
LD DE,&494D
push de
Ld D,E
push de
Ld E,&49
push de
LD DE,&4E4E
push de
push de
push de
LD DE,&494D
push de
LD DE,&4D4A
push de
Ld D,E
push de
call MultiPushDe6
Ld E,&49
push de
Ld D,E
push de
LD DE,&4D4D
push de
LD DE,&4949
push de
LD DE,&4E4E
push de
push de
Ld E,&49
push de
LD DE,&5959
push de
Ld E,&4A
push de
Ld D,E
push de
call MultiPushDe5
Ld E,&4E
push de
LD DE,&4E49
push de
LD DE,&594B
push de
Ld E,&59
push de
push de
LD DE,&4E4E
push de
push de
push de
LD DE,&5959
push de
Ld E,&4A
push de
LD DE,&4A49
push de
push de
Ld E,&4A
push de
push de
Ld E,&4E
push de
Ld D,E
push de
push de
Ld E,&59
push de
Ld D,E
push de
LD DE,&4A4A
push de
LD DE,&5959
push de
Ld E,&4E
push de
Ld D,E
push de
Ld E,&59
push de
Ld D,E
push de
call MultiPushDe5
Ld E,&4E
push de
Ld D,E
push de
push de
LD DE,&5959
push de
push de
LD DE,&514A
push de
Ld E,&59
push de
  jp EndCode

PicClipImage_DrawOrder: 

  DEFW PicClipImage_Line_0
  DEFW PicClipImage_Line_1
  DEFW PicClipImage_Line_2
  DEFW PicClipImage_Line_3
  DEFW PicClipImage_Line_4
  DEFW PicClipImage_Line_5
  DEFW PicClipImage_Line_6
  DEFW PicClipImage_Line_7
  DEFW PicClipImage_Line_8
  DEFW PicClipImage_Line_9
  DEFW PicClipImage_Line_10
  DEFW PicClipImage_Line_11
  DEFW PicClipImage_Line_12
  DEFW PicClipImage_Line_13
  DEFW PicClipImage_Line_14
  DEFW PicClipImage_Line_15
  DEFW PicClipImage_Line_16
  DEFW PicClipImage_Line_17
  DEFW PicClipImage_Line_18
  DEFW PicClipImage_Line_19
  DEFW PicClipImage_Line_20
  DEFW PicClipImage_Line_21
  DEFW PicClipImage_Line_22
  DEFW PicClipImage_Line_23
  DEFW PicClipImage_Line_24
  DEFW PicClipImage_Line_25
  DEFW PicClipImage_Line_26
  DEFW PicClipImage_Line_27
  DEFW PicClipImage_Line_28
  DEFW PicClipImage_Line_29
  DEFW PicClipImage_Line_30
  DEFW PicClipImage_Line_31
  DEFW PicClipImage_Line_32
  DEFW PicClipImage_Line_33
  DEFW PicClipImage_Line_34
  DEFW PicClipImage_Line_35
  DEFW PicClipImage_Line_36
  DEFW PicClipImage_Line_37
  DEFW PicClipImage_Line_38
  DEFW PicClipImage_Line_39
  DEFW PicClipImage_Line_40
  DEFW PicClipImage_Line_41
  DEFW PicClipImage_Line_42
  DEFW PicClipImage_Line_43
  DEFW PicClipImage_Line_44
  DEFW PicClipImage_Line_45
  DEFW PicClipImage_Line_46
  DEFW PicClipImage_Line_47
  DEFW PicClipImage_Line_48
  DEFW PicClipImage_Line_49
  DEFW PicClipImage_Line_50
  DEFW PicClipImage_Line_51
  DEFW PicClipImage_Line_52
  DEFW PicClipImage_Line_53
  DEFW PicClipImage_Line_54
  DEFW PicClipImage_Line_55
  DEFW PicClipImage_Line_56
  DEFW PicClipImage_Line_57
  DEFW PicClipImage_Line_58
  DEFW PicClipImage_Line_59
  DEFW PicClipImage_Line_60
  DEFW PicClipImage_Line_61
  DEFW PicClipImage_Line_62
  DEFW PicClipImage_Line_63
  DEFW PicClipImage_Line_64
  DEFW PicClipImage_Line_65
  DEFW PicClipImage_Line_66
  DEFW PicClipImage_Line_67
  DEFW PicClipImage_Line_68
  DEFW PicClipImage_Line_69
  DEFW PicClipImage_Line_70
  DEFW PicClipImage_Line_71
  DEFW PicClipImage_Line_72
  DEFW PicClipImage_Line_73
  DEFW PicClipImage_Line_74
  DEFW PicClipImage_Line_75
  DEFW PicClipImage_Line_76
  DEFW PicClipImage_Line_77
  DEFW PicClipImage_Line_78
  DEFW PicClipImage_Line_79
  DEFW PicClipImage_Line_80
  DEFW PicClipImage_Line_81
  DEFW PicClipImage_Line_82
  DEFW PicClipImage_Line_83
  DEFW PicClipImage_Line_84
  DEFW PicClipImage_Line_85
  DEFW PicClipImage_Line_86
  DEFW PicClipImage_Line_87
  DEFW PicClipImage_Line_88
  DEFW PicClipImage_Line_89
  DEFW PicClipImage_Line_90
  DEFW PicClipImage_Line_91
  DEFW PicClipImage_Line_92
  DEFW PicClipImage_Line_93
  DEFW PicClipImage_Line_94
  DEFW PicClipImage_Line_95
  DEFW PicClipImage_Line_96
  DEFW PicClipImage_Line_97
  DEFW PicClipImage_Line_98
  DEFW PicClipImage_Line_99
  DEFW PicClipImage_Line_100
  DEFW PicClipImage_Line_101
  DEFW PicClipImage_Line_102
  DEFW PicClipImage_Line_103
  DEFW PicClipImage_Line_104
  DEFW PicClipImage_Line_105
  DEFW PicClipImage_Line_106
  DEFW PicClipImage_Line_107
  DEFW PicClipImage_Line_108
  DEFW PicClipImage_Line_109
  DEFW PicClipImage_Line_110
  DEFW PicClipImage_Line_111
  DEFW PicClipImage_Line_112
  DEFW PicClipImage_Line_113
  DEFW PicClipImage_Line_114
  DEFW PicClipImage_Line_115
  DEFW PicClipImage_Line_116
  DEFW PicClipImage_Line_117
  DEFW PicClipImage_Line_118
  DEFW PicClipImage_Line_119
  DEFW PicClipImage_Line_120
  DEFW PicClipImage_Line_121
  DEFW PicClipImage_Line_122
  DEFW PicClipImage_Line_123
  DEFW PicClipImage_Line_124
  DEFW PicClipImage_Line_125
  DEFW PicClipImage_Line_126
  DEFW PicClipImage_Line_127
  DEFW PicClipImage_Line_128
  DEFW PicClipImage_Line_129
  DEFW PicClipImage_Line_130
  DEFW PicClipImage_Line_131
  DEFW PicClipImage_Line_132
  DEFW PicClipImage_Line_133
  DEFW PicClipImage_Line_134
  DEFW PicClipImage_Line_135
  DEFW PicClipImage_Line_136
  DEFW PicClipImage_Line_137
  DEFW PicClipImage_Line_138
  DEFW PicClipImage_Line_139
  DEFW PicClipImage_Line_140
  DEFW PicClipImage_Line_141
  DEFW PicClipImage_Line_142
  DEFW PicClipImage_Line_143
  DEFW PicClipImage_Line_144
  DEFW PicClipImage_Line_145
  DEFW PicClipImage_Line_146
  DEFW PicClipImage_Line_147
  DEFW PicClipImage_Line_148
  DEFW PicClipImage_Line_149
  DEFW PicClipImage_Line_150
  DEFW PicClipImage_Line_151
  DEFW PicClipImage_Line_152
  DEFW PicClipImage_Line_153
  DEFW PicClipImage_Line_154
  DEFW PicClipImage_Line_155
  DEFW PicClipImage_Line_156
  DEFW PicClipImage_Line_157
  DEFW PicClipImage_Line_158
  DEFW PicClipImage_Line_159
  DEFW PicClipImage_Line_160
  DEFW PicClipImage_Line_161
  DEFW PicClipImage_Line_162
  DEFW PicClipImage_Line_163
  DEFW PicClipImage_Line_164
  DEFW PicClipImage_Line_165
  DEFW PicClipImage_Line_166
  DEFW PicClipImage_Line_167
  DEFW PicClipImage_Line_168
  DEFW PicClipImage_Line_169
  DEFW PicClipImage_Line_170
  DEFW PicClipImage_Line_171
  DEFW PicClipImage_Line_172
  DEFW PicClipImage_Line_173
  DEFW PicClipImage_Line_174
  DEFW PicClipImage_Line_175
  DEFW PicClipImage_Line_176
  DEFW PicClipImage_Line_177
  DEFW PicClipImage_Line_178
  DEFW PicClipImage_Line_179
  DEFW PicClipImage_Line_180
  DEFW PicClipImage_Line_181
  DEFW PicClipImage_Line_182
  DEFW PicClipImage_Line_183
  DEFW PicClipImage_Line_184
  DEFW PicClipImage_Line_185
  DEFW PicClipImage_Line_186
  DEFW PicClipImage_Line_187
  DEFW PicClipImage_Line_188
  DEFW PicClipImage_Line_189
  DEFW PicClipImage_Line_190
  DEFW PicClipImage_Line_191
  DEFW ColorMap_PicClipImage







;Global Code
RLE_ImageWidth equ 0
RLE_NextScreenLineHL:
	push de
	ld b,RLE_ImageWidth :ImageWidthE_Plus1
	ld de,&000+RLE_ImageWidth :ImageWidthD_Plus2
	add hl,de
	inc h
	ld a,h
	and  %00000111;7
	jp nz,JumpToNextLineBB
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,JumpToNextLineBB
	ld a,h
	sub %00001000;8
	ld h,a
JumpToNextLineBB: 
	pop de
	ret

EndCode:
ld sp,&0000:StackRestore_Plus2
ei
ret

MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
MultiPushDe7: pop HL
jr MultiPushDe7B 
MultiPushDe6: pop HL
jr MultiPushDe6B 
MultiPushDeLast5: ld HL,NextLine
jr MultiPushDe5B 
MultiPushDe5: pop HL
jr MultiPushDe5B 
MultiPushDe4: pop HL
jr MultiPushDe4B 
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

finalBitmapPush30: ld b,&0F
jr finalBitmapPush

finalBitmapPush28: ld b,&0E
jr finalBitmapPush

finalBitmapPush26: ld b,&0D
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
ld hl,&0000+31
add hl,sp
inc h
	ld a,h
	and  %00000111;7
	jp nz,JumpToNextLineB
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,JumpToNextLineB
	ld a,h
	sub %00001000;8
	ld h,a
JumpToNextLineB: 
inc hl
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

defb &EE,&00,&00,&00,&00,&77,&EE,&FE,&0F,&BF
defb &EE,&EE,&EE,&EF,&EF,&00,&00,&C0,&00,&77
defb &EE,&EF,&00,&00,&00,&3E,&08,&EE,&BB,&00
defb &05,&F8,&00,&DD,&00,&00,&1C,&E3,&08,&FB
defb &EF,&00,&2B,&FE,&00,&F7,&EE,&EF,&00,&00
defb &78,&C1,&0C,&FE,&BE,&01,&57,&FF,&80,&FF
defb &00,&06,&18,&C3,&0C,&FB,&BB,&BF,&FF,&0A
defb &FF,&FF,&C0,&7F,&EE,&FF,&02,&06,&18,&46
defb &04,&FF,&EE,&FF,&FE,&FE,&EE,&FF,&BB,&15
defb &FF,&FF,&F0,&DD,&BF,&F8,&05,&3F,&FB,&BB
defb &BB,&BF,&F3,&02,&08,&7F,&84,&FF,&00,&EE
defb &EE,&EE,&00,&2B,&FF,&FF,&F8,&00,&EE,&FF
defb &E0,&80,&EE,&EE,&EE,&03,&FB,&03,&0C,&70
defb &C4,&00,&3F,&80,&BB,&BB,&BB,&03,&03,&03
defb &0C,&60,&C6,&01,&C0,&03,&80,&3C,&BB,&1E
defb &BB,&01,&C0,&BB,&BB,&BB,&00,&57,&55,&FF
defb &FC,&00,&00,&80,&FE,&EE,&EE,&06,&01,&9F
defb &04,&20,&C6,&03,&E0,&07,&C0,&7E,&EE,&3F
defb &EE,&03,&E0,&EE,&EE,&EE,&00,&AA,&AA,&BF
defb &FE,&00,&BF,&BF,&00,&80,&FB,&BB,&BB,&0C
defb &01,&FF,&04,&21,&8F,&03,&E0,&07,&C0,&7F
defb &BB,&3F,&BB,&07,&F0,&FB,&BB,&BB,&00,&80
defb &EE,&EE,&EE,&0C,&00,&E1,&86,&3F,&00,&03
defb &E0,&07,&C0,&7F,&6E,&7F,&6E,&07,&F0,&EE
defb &EE,&EF,&02,&A0,&00,&2A,&BF,&80,&BB,&FF
defb &00,&80,&FF,&BB,&BF,&0C,&00,&C1,&86,&3C
defb &00,&03,&E0,&07,&C0,&7F,&BB,&7F,&BB,&07
defb &F0,&BB,&BB,&BB,&FF,&FF,&00,&80,&FE,&EE
defb &EE,&04,&00,&C0,&8F,&00,&00,&03,&E0,&07
defb &C0,&7F,&6E,&7F,&6E,&0F,&F8,&FE,&EE,&EF
defb &BF,&FF,&00,&80,&FF,&BB,&BB,&06,&02,&C0
defb &80,&00,&00,&03,&E0,&07,&C0,&7F,&BB,&7F
defb &BB,&0F,&78,&FF,&BB,&BF,&EF,&FF,&FC,&3F
defb &00,&EE,&EE,&02,&06,&00,&00,&01,&F8,&03
defb &E0,&07,&C0,&FF,&80,&FF,&80,&0F,&78,&EE
defb &EE,&FF,&EC,&00,&F8,&0F,&00,&FB,&BA,&03
defb &0C,&00,&07,&E3,&F8,&03,&E0,&07,&C0,&FF
defb &80,&FF,&80,&0F,&78,&BB,&BB,&BF,&B8,&00
defb &01,&55,&55,&F0,&F0,&03,&00,&EF,&EE,&01
defb &F8,&00,&07,&E3,&F0,&03,&E0,&07,&C0,&FF
defb &80,&FF,&80,&1F,&7C,&FE,&FE,&FF,&EC,&00
defb &02,&AA,&AB,&F0,&E0,&01,&00,&FF,&FB,&00
defb &60,&50,&07,&E7,&F0,&03,&E0,&07,&C0,&FF
defb &80,&F7,&80,&1F,&7C,&FF,&BB,&FF,&B8,&00
defb &05,&55,&75,&F8,&C0,&00,&00,&FF,&75,&00
defb &00,&F0,&07,&E7,&E0,&03,&E0,&07,&C0,&F7
defb &C1,&F7,&80,&1E,&3C,&F7,&FF,&EF,&EC,&00
defb &AA,&BF,&FA,&F8,&80,&00,&80,&FF,&EA,&00
defb &00,&F0,&07,&EF,&E0,&03,&E0,&07,&C0,&F7
defb &C1,&F7,&80,&1E,&3C,&FF,&EF,&FF,&B8,&01
defb &55,&7F,&F5,&78,&C0,&FF,&55,&00,&00,&F0
defb &07,&EF,&C0,&03,&E0,&07,&C0,&F7,&C1,&EF
defb &80,&3E,&3E,&FF,&FF,&FF,&EC,&02,&AA,&FF
defb &FA,&F8,&E0,&FF,&EA,&00,&00,&F0,&07,&EF
defb &C0,&03,&E0,&07,&C0,&FB,&C1,&EF,&80,&3E
defb &3E,&FF,&FF,&FF,&55,&55,&55,&FF,&F5,&F8
defb &55,&55,&55,&5D,&55,&00,&F0,&F8,&07,&FF
defb &80,&03,&E0,&07,&C0,&FB,&C1,&EF,&80,&3C
defb &1E,&00,&00,&55,&06,&AF,&AF,&FF,&EA,&F8
defb &2A,&AA,&2A,&AE,&EA,&01,&F0,&F8,&07,&FF
defb &C0,&03,&E0,&07,&C0,&FB,&E3,&CF,&80,&3C
defb &1E,&00,&00,&AE,&1D,&5F,&57,&FF,&F5,&F0
defb &00,&11,&55,&55,&55,&01,&F0,&F8,&07,&FF
defb &C0,&03,&E0,&07,&C0,&F9,&E3,&CF,&80,&3C
defb &1E,&00,&00,&55,&2E,&AF,&AF,&FF,&FB,&A8
defb &AA,&D4,&2A,&AA,&EA,&01,&E0,&78,&07,&FF
defb &E0,&03,&E0,&07,&C0,&F9,&E3,&CF,&80,&7C
defb &1F,&00,&00,&AA,&5F,&5F,&5F,&FF,&FD,&40
defb &08,&D5,&55,&F5,&55,&03,&E0,&7C,&07,&FF
defb &E0,&03,&E0,&07,&C0,&F9,&E3,&CF,&80,&7C
defb &1F,&00,&00,&55,&2E,&AE,&AF,&FF,&AA,&80
defb &AA,&D4,&2A,&AE,&AA,&03,&E0,&7C,&07,&FF
defb &E0,&03,&E0,&07,&C0,&F9,&E3,&CF,&80,&78
defb &0F,&00,&E8,&AE,&57,&5D,&5F,&FF,&50,&00
defb &5D,&55,&08,&D5,&55,&55,&55,&03,&E0,&7C
defb &07,&FF,&F0,&03,&E0,&07,&C0,&F8,&F7,&8F
defb &80,&78,&0F,&07,&F0,&55,&2E,&AE,&BF,&FA
defb &BE,&AA,&A2,&10,&2A,&AA,&AA,&03,&F0,&FC
defb &07,&FF,&F0,&03,&E0,&07,&C0,&F8,&F7,&8F
defb &80,&78,&0F,&0F,&E0,&AE,&17,&5F,&5D,&55
defb &55,&01,&15,&55,&00,&55,&75,&06,&EE,&EE
defb &06,&EA,&E8,&03,&60,&05,&C0,&D8,&EE,&8D
defb &80,&BB,&BB,&0D,&80,&55,&2F,&BF,&AA,&80
defb &AE,&02,&AA,&AA,&00,&AA,&EA,&03,&BB,&BA
defb &03,&B9,&B8,&01,&C0,&07,&40,&70,&BB,&87
defb &00,&EE,&EE,&1A,&00,&AE,&17,&FF,&50,&00
defb &55,&01,&15,&55,&40,&57,&55,&06,&EE,&EE
defb &06,&E0,&E8,&03,&70,&0D,&C0,&D8,&6E,&0D
defb &80,&BB,&BB,&34,&00,&55,&2F,&FA,&A0,&00
defb &AE,&03,&AA,&AA,&20,&AA,&EA,&03,&BB,&BA
defb &03,&B0,&BC,&01,&D0,&07,&40,&70,&3B,&07
defb &00,&EE,&EE,&38,&1C,&AE,&17,&F0,&44,&05
defb &55,&55,&60,&44,&44,&06,&EE,&EE,&06,&E0
defb &6C,&03,&70,&0D,&C0,&D8,&6E,&0D,&81,&BB
defb &BB,&2A,&FE,&44,&0B,&E0,&11,&05,&FF,&FF
defb &F0,&31,&01,&03,&BB,&BA,&03,&A0,&3A,&01
defb &D0,&07,&40,&70,&3B,&07,&00,&EE,&EE,&15
defb &FF,&15,&05,&C0,&44,&07,&FF,&FF,&F8,&64
defb &44,&05,&40,&14,&05,&40,&54,&02,&A8,&0A
defb &80,&A8,&14,&0A,&81,&50,&05,&0A,&FF,&04
defb &02,&80,&10,&37,&FF,&FF,&F8,&31,&01,&0A
defb &80,&0A,&02,&A0,&2A,&01,&54,&15,&00,&50
defb &2A,&05,&00,&A0,&02,&05,&0F,&01,&01,&D5
defb &55,&40,&FF,&FF,&FC,&60,&04,&05,&00,&15
defb &05,&40,&15,&00,&AA,&AA,&00,&A8,&14,&0A
defb &81,&50,&05,&40,&06,&04,&00,&EA,&AA,&A8
defb &00,&04,&0F,&01,&10,&7F,&FF,&F5,&50,&01
defb &2A,&10,&55,&55,&01,&50,&2A,&05,&01,&EF
defb &00,&00,&05,&F0,&05,&40,&15,&00,&2A,&AA
defb &00,&A8,&14,&0A,&81,&40,&01,&40,&1E,&04
defb &42,&AF,&FF,&FE,&A8,&04,&03,&F7,&FF,&FF
defb &FB,&F8,&00,&00,&04,&FC,&01,&0A,&11,&0A
defb &82,&A0,&0A,&10,&15,&54,&01,&50,&08,&05
defb &02,&A0,&02,&B0,&FC,&51,&10,&55,&FF,&FF
defb &F0,&11,&05,&40,&15,&44,&0A,&A8,&04,&A8
defb &00,&0A,&85,&40,&01,&50,&F0,&04,&44,&2A
defb &BF,&FF,&E0,&04,&1F,&FD,&00,&00,&0F,&FE
defb &40,&93,&35,&15,&5F,&FF,&C0,&11,&5F,&FE
defb &00,&00,&10,&FF,&11,&00,&11,&0A,&82,&80
defb &0A,&11,&05,&40,&11,&50,&00,&05,&00,&4F
defb &FE,&02,&AB,&FF,&80,&44,&7F,&FF,&10,&C2
defb &3F,&FF,&04,&00,&44,&00,&00,&7B,&FB,&01
defb &75,&FF,&00,&11,&00,&00,&10,&02,&00,&00
defb &55,&55,&45,&50,&15,&55,&24,&7E,&64,&57
defb &CF,&40,&48,&88,&20,&04,&44,&5F,&FF,&DC
defb &AA,&AA,&91,&79,&19,&3F,&D1,&01,&03,&E4
defb &C8,&80,&00,&2D,&39,&10,&54,&15,&00,&41
defb &24,&44,&47,&44,&44,&04,&1C,&7F,&E0,&1F
defb &00,&04,&44,&40,&EC,&99,&33,&84,&16,&52
defb &34,&99,&04,&1C,&44,&44,&29,&EA,&AA,&94
defb &91,&11,&11,&11,&10,&10,&60,&00,&78,&FF
defb &C0,&01,&11,&10,&8A,&A2,&AA,&0C,&55,&55
defb &45,&55,&13,&11,&11,&11,&53,&F5,&0A,&55
defb &04,&44,&44,&44,&44,&00,&80,&00,&0F,&E0
defb &E4,&04,&44,&40,&CC,&BA,&AB,&04,&15,&57
defb &75,&55,&04,&44,&44,&44,&00,&03,&80,&07
defb &01,&80,&30,&01,&11,&00,&88,&8A,&AA,&04
defb &55,&55,&15,&54,&2A,&94,&20,&02,&AA,&94
defb &91,&11,&00,&04,&03,&80,&81,&04,&18,&00
defb &44,&40,&E8,&B1,&33,&8E,&15,&25,&64,&95
defb &4A,&55,&56,&D9,&0A,&55,&04,&44,&20,&80
defb &26,&DA,&A0,&80,&81,&11,&11,&10,&00,&18
defb &1E,&00,&61,&11,&0C,&00,&11,&00,&00,&30
defb &70,&1C,&10,&80,&06,&00,&4A,&55,&76,&90
defb &0A,&55,&2A,&94,&20,&00,&AA,&94,&80,&00
defb &02,&A8,&F0,&21,&80,&06,&00,&80,&02,&00
defb &04,&00,&4A,&55,&76,&48,&0A,&55,&00,&07
defb &55,&57,&C0,&63,&00,&01,&84,&40,&03,&00
defb &60,&80,&66,&90,&A0,&80,&80,&FF,&A8,&02
defb &A0,&C6,&01,&00,&84,&40,&01,&00,&55,&55
defb &70,&00,&95,&55,&40,&02,&01,&40,&11,&00
defb &5F,&00,&44,&20,&01,&00,&04,&00,&2E,&AA
defb &26,&48,&AA,&AA,&C0,&00,&8A,&2A,&0A,&00
defb &7F,&04,&02,&20,&01,&80,&11,&55,&50,&00
defb &95,&54,&60,&00,&40,&00,&07,&C0,&BE,&FE
defb &02,&20,&01,&80,&80,&80,&88,&00,&C0,&88
defb &20,&00,&08,&95,&7F,&81,&3E,&9F,&02,&40
defb &01,&80,&97,&AF,&A4,&02,&B2,&80,&A0,&00
defb &07,&AA,&A1,&0B,&7D,&01,&42,&40,&01,&80
defb &6A,&5D,&54,&01,&7D,&57,&50,&00,&3F,&50
defb &07,&04,&7B,&3D,&82,&40,&01,&00,&D5,&83
defb &28,&00,&E8,&1B,&E0,&00,&00,&05,&5F,&F8
defb &FF,&4C,&C2,&80,&01,&00,&AB,&F5,&50,&01
defb &DD,&57,&F0,&00,&01,&0A,&00,&A8,&7F,&C2
defb &C0,&40,&01,&00,&05,&60,&0F,&F8,&00,&0F
defb &80,&01,&56,&80,&20,&00,&18,&00,&F8,&00
defb &00,&50,&00,&82,&FF,&81,&E0,&C0,&02,&00
defb &05,&20,&09,&FC,&00,&3F,&F8,&01,&A2,&20
defb &48,&04,&14,&00,&7C,&00,&07,&8C,&00,&43
defb &7F,&8E,&E1,&40,&02,&00,&14,&FC,&07,&F0
defb &28,&00,&08,&80,&18,&00,&30,&02,&3C,&00
defb &1E,&00,&00,&46,&7F,&12,&E3,&00,&04,&00
defb &1C,&7E,&3B,&E0,&2C,&00,&00,&18,&30,&DD
defb &7F,&1C,&E6,&00,&28,&EA,&60,&00,&64,&00
defb &30,&00,&80,&00,&00,&50,&78,&C3,&9F,&80
defb &72,&00,&31,&EB,&00,&00,&44,&00,&02,&00
defb &10,&00,&70,&42,&14,&00,&00,&83,&78,&C3
defb &8E,&E0,&94,&00,&3F,&DB,&E0,&00,&84,&00
defb &01,&01,&79,&C2,&14,&F0,&38,&00,&00,&01
defb &20,&00,&60,&10,&00,&03,&AD,&FB,&B0,&00
defb &00,&04,&54,&00,&50,&00,&05,&00,&01,&38
defb &E5,&C0,&0C,&FE,&00,&1F,&24,&FB,&3C,&00
defb &02,&05,&8F,&C6,&02,&7C,&00,&01,&28,&00
defb &01,&00,&00,&1C,&00,&3E,&1E,&00,&14,&01
defb &40,&44,&05,&00,&04,&00,&BC,&E1,&80,&00
defb &00,&30,&13,&24,&0F,&00,&40,&00,&00,&14
defb &02,&80,&05,&C2,&3B,&61,&00,&20,&1B,&AC
defb &07,&80,&94,&05,&40,&1D,&45,&40,&07,&E1
defb &34,&21,&E0,&00,&00,&C0,&0F,&F8,&01,&C0
defb &04,&08,&4C,&01,&84,&0F,&80,&E0,&03,&80
defb &2E,&B2,&D0,&80,&00,&80,&07,&F0,&00,&E0
defb &09,&14,&1C,&07,&02,&9F,&80,&60,&03,&C0
defb &39,&B4,&CF,&00,&01,&40,&03,&E0,&00,&70
defb &0D,&00,&18,&06,&00,&1F,&00,&70,&07,&88
defb &13,&58,&9F,&00,&3F,&00,&50,&15,&10,&17
defb &00,&78,&01,&84,&2C,&80,&5F,&00,&05,&00
defb &30,&04,&00,&2B,&00,&38,&0C,&8A,&47,&00
defb &38,&00,&07,&80,&70,&1C,&40,&15,&00,&5C
defb &0E,&05,&88,&00,&30,&00,&03,&00,&60,&08
defb &00,&8A,&00,&0A,&0F,&06,&64,&00,&20,&00
defb &00,&01,&40,&14,&08,&25,&00,&17,&07,&03
defb &1C,&00,&00,&8A,&A2,&0B,&03,&04,&7C,&01
defb &40,&11,&00,&20,&08,&05,&C1,&0F,&80,&00
defb &3A,&00,&00,&02,&10,&08,&A0,&03,&80,&05
defb &80,&00,&01,&80,&D0,&02,&C0,&00,&00,&E0
defb &5D,&11,&40,&10,&02,&22,&20,&01,&C0,&00
defb &00,&F0,&5D,&01,&00,&15,&08,&00,&0A,&90
defb &54,&00,&80,&00,&00,&78,&88,&00,&00,&02
defb &80,&08,&95,&40,&28,&00,&50,&01,&00,&05
defb &40,&80,&00,&A2,&14,&00,&00,&01,&80,&02
defb &A8,&00,&00,&50,&08,&00,&12,&81,&00,&01
defb &54,&02,&20,&28,&55,&00,&29,&40,&80,&00
defb &AA,&80,&04,&14,&00,&01,&F0,&00,&15,&50
defb &00,&0A,&05,&40,&30,&00,&02,&AA,&00,&81
defb &10,&00,&50,&00,&5D,&00,&01,&55,&54,&20
defb &01,&40,&BA,&80,&04,&00,&00,&2A,&40,&00
defb &01,&54,&C0,&3C,&C0,&00,&00,&03,&80,&2A
defb &5F,&D4,&00,&40,&54,&00,&00,&54,&F0,&1F
defb &00,&28,&E3,&02,&80,&00,&57,&F5,&01,&18
defb &15,&40,&00,&15,&60,&05,&D0,&00,&82,&A8
defb &01,&B0,&01,&80,&00,&02,&80,&00,&20,&00
defb &55,&55,&03,&F8,&01,&D4,&00,&01,&40,&01
defb &70,&00,&16,&7D,&EF,&F7,&C0,&00,&00,&55
defb &40,&00,&52,&80,&70,&54,&04,&11,&40,&81
defb &80,&51,&11,&10,&54,&11,&45,&05,&1E,&9F
defb &E7,&F7,&50,&05,&44,&40,&0B,&98,&37,&E7
defb &C0,&00,&00,&22,&00,&05,&40,&00,&1C,&04
defb &54,&2A,&88,&8A,&88,&C2,&E0,&AA,&A2,&2A
defb &A0,&A2,&2A,&8A,&2B,&CF,&6F,&EF,&EA,&A8
defb &82,&82,&0D,&EF,&E1,&1E,&F0,&00,&A0,&00
defb &00,&88,&80,&00,&0F,&FF,&FD,&7F,&F5,&55
defb &01,&55,&11,&00,&00,&55,&54,&25,&C0,&00
defb &3C,&02,&15,&05,&26,&F8,&1C,&FF,&D0,&00
defb &00,&00,&00,&AA,&B8,&60,&40,&00,&08,&80
defb &02,&00,&06,&98,&08,&F0,&F2,&AA,&AA,&AA
defb &00,&40,&00,&FD,&FD,&E8,&50,&00,&14,&00
defb &05,&08,&47,&7A,&6F,&DB,&78,&00,&00,&00
defb &0F,&7A,&4F,&0F,&7F,&55,&55,&55,&50,&0F
defb &40,&00,&04,&15,&0A,&02,&05,&FD,&FF,&40
defb &50,&00,&04,&00,&85,&50,&7E,&D8,&0F,&0F
defb &7E,&00,&00,&00,&15,&40,&02,&8A,&BF,&80
defb &76,&79,&D8,&0C,&FE,&AA,&AA,&AA,&2A,&A0
defb &11,&75,&FF,&C0,&50,&00,&04,&10,&04,&54
defb &2A,&AA,&A8,&00,&00,&20,&06,&0A,&00,&20
defb &06,&00,&00,&00,&20,&00,&73,&FC,&C0,&4B
defb &F8,&00,&00,&00,&60,&00,&02,&AA,&B7,&80
defb &05,&55,&F7,&C0,&10,&00,&04,&0B,&04,&15
defb &01,&55,&55,&00,&00,&60,&0F,&00,&41,&55
defb &55,&54,&3B,&F8,&00,&2F,&FD,&55,&55,&55
defb &80,&AA,&A2,&80,&20,&00,&08,&1E,&90,&00
defb &02,&AA,&AA,&00,&08,&70,&0F,&00,&28,&AA
defb &AA,&AA,&3F,&E0,&03,&2F,&E8,&AA,&AA,&AA
defb &01,&55,&FF,&C0,&10,&00,&04,&0F,&C4,&85
defb &01,&55,&55,&00,&02,&78,&1F,&00,&04,&01
defb &55,&54,&36,&80,&1F,&3F,&91,&55,&55,&55
defb &AA,&A8,&19,&00,&08,&6E,&A2,&AA,&AA,&AA
defb &02,&82,&AA,&80,&08,&00,&00,&12,&09,&10
defb &A0,&2A,&AA,&44,&00,&A0,&3F,&90,&55,&54
defb &E6,&07,&0B,&54,&45,&55,&55,&55,&14,&04
defb &00,&55,&55,&40,&10,&00,&04,&00,&04,&41
defb &50,&55,&55,&00,&00,&14,&1F,&C0,&20,&34
defb &47,&D0,&80,&00,&AA,&A8,&6C,&3F,&0A,&DC
defb &2A,&00,&00,&08,&8A,&00,&08,&00,&00,&00
defb &00,&28,&08,&0A,&00,&02,&20,&00,&10,&00
defb &02,&02,&05,&45,&75,&05,&55,&00,&00,&14
defb &07,&18,&80,&00,&55,&45,&EC,&1B,&08,&FE
defb &15,&55,&55,&55,&04,&40,&08,&10,&2A,&02
defb &AA,&55,&50,&08,&99,&4C,&C8,&C0,&2A,&A8
defb &EC,&43,&4B,&BC,&10,&00,&02,&00,&04,&42
defb &BD,&05,&55,&00,&00,&02,&9D,&7F,&FF,&C0
defb &55,&50,&F1,&FF,&0B,&9C,&15,&55,&11,&55
defb &04,&00,&80,&08,&2F,&02,&20,&AA,&A0,&12
defb &FD,&6F,&FF,&E0,&2A,&A8,&7F,&FF,&33,&CC
defb &AA,&AA,&44,&AA,&00,&9D,&FF,&1F,&FF,&E0
defb &15,&54,&7F,&E9,&FD,&CC,&15,&51,&10,&55
defb &30,&00,&02,&08,&04,&04,&5F,&00,&40,&00
defb &20,&00,&00,&14,&08,&00,&05,&B8,&00,&55
defb &54,&7F,&D7,&C0,&C3,&C2,&A2,&A8,&60,&F3
defb &FC,&DD,&8A,&A0,&00,&2A,&78,&00,&02,&0A
defb &84,&07,&42,&FF,&54,&00,&00,&7D,&E8,&98
defb &C6,&82,&11,&54,&08,&30,&CC,&FF,&55,&00
defb &00,&15,&20,&00,&00,&05,&40,&02,&81,&3F
defb &C0,&2A,&80,&FD,&B0,&A0,&9C,&82,&70,&01
defb &A4,&22,&A0,&01,&F0,&55,&F5,&00,&00,&F9
defb &EC,&A0,&3C,&A6,&8A,&AA,&00,&01,&B7,&78
defb &8A,&82,&00,&2A,&A8,&8A,&AA,&40,&10,&F3
defb &90,&D2,&37,&FE,&14,&00,&70,&00,&C4,&00
defb &20,&00,&7C,&21,&55,&08,&20,&7F,&06,&04
defb &77,&EE,&44,&51,&00,&B4,&BF,&7D,&44,&10
defb &7E,&15,&20,&00,&88,&00,&02,&28,&2A,&02
defb &28,&01,&10,&3F,&2F,&94,&E7,&4E,&54,&00
defb &40,&00,&85,&00,&15,&75,&17,&00,&82,&00
defb &00,&3F,&78,&9C,&27,&0E,&82,&0A,&3F,&FC
defb &20,&FE,&A0,&00,&FF,&02,&80,&00,&02,&BE
defb &8A,&00,&00,&28,&00,&94,&7C,&40,&83,&D2
defb &80,&00,&FF,&F3,&80,&A6,&00,&03,&E0,&40
defb &10,&05,&7D,&00,&40,&00,&85,&40,&55,&FD
defb &05,&00,&00,&10,&05,&D4,&CF,&C1,&00,&0A
defb &CC,&03,&FF,&F6,&41,&70,&00,&03,&A0,&80
defb &FE,&00,&80,&01,&C0,&C0,&02,&BE,&80,&00
defb &00,&02,&00,&B2,&F6,&88,&03,&0A,&DC,&06
defb &7E,&BC,&40,&3E,&00,&07,&00,&C0,&00,&15
defb &FF,&40,&4A,&03,&61,&40,&55,&FF,&41,&44
defb &00,&55,&55,&10,&5F,&C4,&00,&03,&F0,&06
defb &FE,&0C,&C0,&F0,&00,&03,&40,&C0,&AF,&81
defb &1E,&00,&00,&60,&02,&AA,&A0,&88,&00,&28
defb &00,&34,&0B,&40,&08,&05,&80,&0F,&FF,&07
defb &C0,&80,&17,&40,&00,&15,&55,&50,&44,&00
defb &00,&70,&55,&55,&40,&42,&00,&85,&00,&2A
defb &82,&33,&8B,&42,&84,&0F,&FF,&97,&04,&28
defb &FC,&86,&64,&F8,&88,&0F,&FF,&DF,&08,&02
defb &00,&08,&28,&00,&84,&00,&00,&10,&22,&22
defb &02,&00,&00,&05,&55,&40,&42,&00,&00,&54
defb &08,&84,&21,&50,&88,&00,&06,&36,&FF,&CB
defb &A8,&54,&C0,&07,&FF,&DE,&02,&00,&00,&00
defb &0F,&C0,&10,&21,&08,&00,&06,&E7,&80,&E0
defb &00,&0D,&C0,&00,&DF,&CD,&00,&AA,&00,&03
defb &80,&60,&3F,&F8,&78,&21,&10,&00,&07,&F3
defb &00,&C1,&6C,&81,&C0,&01,&41,&82,&95,&55
defb &40,&00,&00,&78,&73,&9C,&C4,&43,&10,&20
defb &03,&FD,&00,&31,&65,&99,&C4,&01,&00,&85
defb &2A,&FE,&A8,&00,&00,&78,&E1,&0E,&82,&55
defb &50,&40,&07,&F8,&00,&64,&49,&09,&88,&04
defb &00,&CA,&57,&FF,&F4,&00,&00,&BC,&00,&01
defb &F3,&9F,&05,&FF,&FC,&80,&03,&9A,&14,&C5
defb &59,&98,&94,&01,&00,&D4,&AF,&A8,&FA,&00
defb &00,&1E,&FF,&FF,&0F,&FF,&FF,&00,&01,&DC
defb &54,&8B,&31,&30,&48,&01,&73,&A9,&7F,&00
defb &BD,&00,&00,&BE,&80,&00,&00,&05,&FF,&3F
defb &9F,&FF,&FF,&80,&01,&C4,&3F,&86,&42,&12
defb &68,&00,&FD,&52,&FF,&00,&7E,&00,&00,&3F
defb &88,&00,&50,&00,&00,&01,&9E,&1F,&3F,&FF
defb &FF,&00,&01,&C6,&16,&32,&42,&22,&48,&00
defb &AA,&25,&FF,&00,&BF,&00,&00,&7B,&00,&03
defb &37,&8E,&BF,&FF,&FD,&80,&01,&C2,&80,&EF
defb &18,&C3,&10,&00,&00,&0A,&FC,&04,&0F,&C0
defb &06,&73,&00,&FE,&3F,&FF,&FF,&40,&00,&C7
defb &FC,&DD,&15,&09,&70,&00,&00,&15,&F8,&92
defb &5F,&A0,&0D,&F2,&FF,&44,&00,&03,&80,&00
defb &34,&00,&02,&3A,&5F,&FF,&FE,&80,&00,&32
defb &FE,&D5,&18,&3B,&30,&28,&00,&0B,&F8,&AF
defb &BF,&90,&19,&C4,&FA,&A0,&00,&05,&C0,&00
defb &58,&00,&8B,&7C,&2A,&BF,&FD,&00,&00,&39
defb &FF,&E0,&30,&52,&B4,&44,&00,&05,&FA,&FF
defb &BF,&10,&1B,&C4,&FF,&D0,&04,&0A,&A2,&00
defb &27,&00,&CF,&E8,&15,&55,&5A,&00,&00,&38
defb &FF,&DC,&97,&C0,&3C,&4C,&00,&0B,&FE,&FF
defb &BE,&20,&33,&80,&FF,&A0,&00,&01,&50,&08
defb &0B,&80,&CF,&F0,&0A,&AA,&AC,&40,&00,&3F
defb &3F,&4C,&07,&01,&B8,&00,&00,&07,&D5,&D7
defb &FD,&20,&33,&81,&FE,&E0,&05,&55,&4A,&00
defb &00,&03,&03,&00,&9F,&07,&D8,&30,&00,&0B
defb &CA,&AB,&FA,&40,&67,&83,&BF,&E8,&80,&00
defb &00,&02,&00,&68,&00,&03,&DF,&00,&30,&00
defb &00,&17,&81,&47,&F4,&40,&CF,&06,&3F,&80
defb &0E,&A9,&AC,&40,&FF,&F4,&40,&00,&00,&04
defb &11,&5D,&0D,&31,&CA,&00,&AA,&80,&7F,&C0
defb &1F,&FF,&F0,&00,&00,&0F,&80,&0B,&E8,&00
defb &98,&10,&00,&22,&00,&08,&00,&30,&1A,&68
defb &A5,&49,&57,&50,&0B,&FF,&FF,&FF,&80,&04
defb &00,&1F,&40,&07,&F0,&01,&B0,&00,&FF,&FD
defb &40,&00,&00,&27,&60,&06,&40,&30,&15,&B2
defb &C6,&A2,&2A,&A0,&00,&7F,&FF,&00,&00,&40
defb &00,&BE,&80,&13,&E0,&03,&20,&00,&AB,&FA
defb &00,&20,&00,&1D,&D0,&0A,&00,&38,&18,&28
defb &E3,&05,&55,&55,&00,&01,&FC,&00,&00,&28
defb &00,&78,&40,&A9,&C0,&03,&40,&00,&00,&1F
defb &F8,&05,&50,&18,&14,&B2,&02,&80,&88,&80
defb &00,&44,&78,&00,&00,&28,&00,&F0,&81,&53
defb &80,&1E,&80,&00,&AA,&AA,&80,&00,&00,&77
defb &C0,&02,&80,&30,&00,&10,&00,&31,&00,&81
defb &C0,&29,&18,&40,&03,&00,&22,&14,&5F,&7D
defb &10,&00,&00,&01,&80,&01,&54,&60,&00,&88
defb &00,&02,&81,&41,&80,&03,&20,&00,&0F,&90
defb &30,&00,&01,&10,&00,&10,&00,&02,&22,&00
defb &21,&00,&00,&20,&05,&03,&E0,&0C,&80,&00
defb &88,&80,&88,&AF,&E8,&88,&03,&0A,&AA,&80
defb &03,&DC,&00,&0A,&88,&00,&F0,&0C,&22,&01
defb &55,&5F,&F5,&55,&54,&00,&00,&0F,&C0,&3F
defb &80,&00,&28,&55,&54,&01,&58,&00,&04,&00
defb &03,&1F,&FF,&C0,&0F,&9E,&00,&04,&AA,&0A
defb &AA,&A0,&20,&80,&00,&07,&C0,&7F,&80,&00
defb &A0,&02,&AC,&00,&00,&10,&00,&2B,&FF,&82
defb &06,&9E,&00,&04,&00,&07,&F5,&55,&55,&E0
defb &55,&50,&00,&01,&01,&5F,&FF,&C5,&0E,&7E
defb &00,&03,&FA,&00,&2B,&A0,&0A,&A0,&A8,&00
defb &00,&2A,&AF,&86,&87,&9C,&00,&17,&FD,&55
defb &7F,&C4,&55,&F5,&50,&00,&D0,&5F,&F5,&00
defb &00,&15,&54,&00,&00,&85,&7F,&D1,&0C,&98
defb &00,&0A,&AA,&02,&BF,&80,&0B,&FA,&60,&00
defb &E8,&AA,&A8,&00,&00,&0B,&FE,&00,&02,&2A
defb &AA,&AA,&00,&F0,&F4,&5F,&FD,&00,&00,&57
defb &FF,&00,&09,&55,&5F,&55,&44,&51,&00,&10
defb &00,&C0,&00,&17,&F5,&57,&FF,&40,&17,&FD
defb &75,&00,&AA,&A8,&00,&6A,&AA,&28,&00,&40
defb &00,&02,&A2,&22,&AA,&00,&0B,&FA,&00,&60
defb &0C,&05,&55,&55,&55,&55,&55,&57,&FF,&50
defb &00,&40,&00,&11,&08,&81,&11,&20,&15,&FD
defb &05,&7C,&0C,&2A,&82,&0A,&20,&88,&80,&00
defb &A0,&00,&08,&40,&00,&44,&40,&00,&44,&00
defb &02,&AA,&00,&2E,&0E,&57,&F7,&57,&55,&F5
defb &40,&7F,&4C,&AA,&A0,&2D,&8A,&28,&86,&AB
defb &24,&AA,&51,&18,&64,&50,&08,&22,&22,&A8
defb &00,&0B,&3D,&5D,&F5,&57,&8A,&28,&88,&AA
defb &AA,&AA,&AA,&A0,&8A,&A8,&00,&02,&00,&08
defb &05,&54,&80,&01,&02,&FF,&F8,&03,&8A,&28
defb &88,&EB,&2E,&CA,&8B,&B8,&8A,&88,&00,&54
defb &00,&C0,&14,&00,&01,&00,&6C,&48,&AA,&AA
defb &88,&AA,&AA,&AA,&08,&42,&02,&00,&2B,&77
defb &E8,&82,&51,&45,&26,&AB,&2A,&A4,&8A,&B2
defb &64,&88
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













list




ret