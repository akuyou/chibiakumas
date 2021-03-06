org &C000
FileBegin:



jp Sprite0_Setup
jp Sprite0Color_Setup


Sprite0_Setup:
ld hl,Sprite0_Start-1
ld de,Sprite0_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0_Start:
db &A6,&3,&AA,&21,&A5,&E1,&B1,&A5,&51,&F2,&53,&2,&56,&2,&41,&52
db &1,&41,&52,&F3,&71,&55,&E1,&F2,&B1,&A2,&10,&80,&A5,&21,&2,&20
db &2A,&F8,&11,&A2,&F4,&A1,&10,&82,&A2,&D1,&F2,&71,&52,&20,&40,&D5
db &52,&11,&3,&10,&15,&F2,&10,&47,&51,&F3,&52,&10,&1,&52,&E1,&F2
db &B1,&10,&2A,&1,&A2,&E1,&10,&AB,&21,&2,&A1,&10,&C2,&F3,&11,&10
db &EA,&F2,&20,&2B,&80,&A2,&F3,&52,&11,&20,&54,&FD,&52,&20,&1,&54
db &91,&F4,&71,&41,&F2,&71,&10,&15,&1,&53,&E1,&F2,&A2,&1,&A2,&20
db &FE,&AB,&2,&10,&2A,&C1,&F5,&30,&E8,&BF,&2,&81,&A3,&F2,&30,&57
db &1,&D5,&F2,&52,&20,&40,&15,&F2,&10,&C7,&F2,&30,&D1,&5F,&41,&54
db &20,&FE,&AB,&21,&A2,&E1,&F2,&10,&2B,&1,&A2,&81,&10,&7F,&2,&10
db &FE,&31,&A2,&21,&1,&A2,&E1,&20,&BF,&7D,&55,&F3,&10,&17,&1,&52
db &C1,&10,&3F,&2,&10,&F8,&71,&52,&11,&10,&50,&D1,&F2,&51,&A6,&E1
db &F3,&10,&2B,&81,&A2,&E1,&F1,&4,&F2,&A2,&1,&A2,&F3,&B1,&56,&F4
db &10,&17,&41,&52,&E1,&31,&4,&C1,&30,&4F,&45,&D5,&F3,&51,&A6,&F4
db &10,&2B,&A2,&20,&F2,&1,&81,&2,&C1,&10,&9F,&1,&A3,&10,&BF,&A2
db &1,&55,&50,&5F,&FD,&15,&54,&F9,&5,&81,&10,&3F,&1,&52,&D1,&71
db &53,&2,&81,&A6,&E1,&10,&A,&A2,&10,&FC,&5,&81,&10,&3F,&1,&A5
db &10,&80,&3,&41,&57,&11,&52,&10,&3C,&2,&21,&3,&10,&7F,&1,&54
db &7,&A7,&1,&20,&2A,&3E,&81,&5,&10,&7E,&1,&A3,&21,&7,&41,&56
db &11,&20,&15,&1F,&21,&5,&10,&FE,&1,&53,&11,&4,&A7,&1,&A2,&1
db &A2,&10,&1F,&81,&5,&10,&FE,&11,&A3,&20,&82,&A,&57,&3,&20,&4
db &D5,&71,&7,&20,&F8,&41,&55,&11,&A7,&4,&81,&10,&EA,&71,&7,&10
db &F8,&11,&A7,&52,&71,&53,&10,&1,&41,&3,&10,&E5,&11,&8,&F1,&20
db &43,&D5,&F1,&53,&E1,&F2,&A2,&21,&2,&A1,&2,&81,&10,&F0,&11,&8
db &F1,&20,&83,&EA,&F2,&A2,&F3,&52,&11,&10,&40,&52,&20,&40,&F9,&5
db &61,&20,&C0,&C0,&10,&3,&D1,&F3,&10,&57,&F3,&B1,&A1,&2,&A2,&21
db &20,&A0,&F8,&5,&81,&30,&31,&C0,&83,&A1,&F4,&A1,&F3,&71,&10,&15
db &1,&53,&20,&40,&38,&5,&21,&20,&80,&80,&10,&43,&D1,&F4,&51,&E1
db &F3,&10,&A,&81,&A2,&21,&20,&A0,&3C,&81,&2,&21,&20,&E0,&E0,&20
db &80,&83,&A1,&F4,&B1,&F3,&71,&50,&5,&7D,&15,&50,&1C,&20,&20,&20
db &20,&E0,&F1,&2,&10,&47,&D1,&F4,&51,&E1,&F3,&50,&A2,&FE,&2A,&28
db &1C,&3,&21,&20,&C0,&71,&2,&10,&87,&A1,&F4,&B1,&51,&F2,&71,&50
db &51,&7F,&15,&54,&1E,&20,&20,&20,&6,&10,&E,&51,&F4,&51,&10,&EA
db &F2,&A2,&F2,&30,&A,&2A,&1F,&3,&A1,&6,&10,&8E,&A2,&F3,&B1,&50
db &D5,&7F,&D5,&7F,&5,&52,&F1,&4,&21,&6,&10,&E,&52,&F3,&51,&A2
db &60,&FE,&EA,&BF,&A,&2A,&F,&81,&9,&20,&E,&A8,&E1,&F2,&B1,&52
db &F2,&51,&F2,&71,&20,&5,&15,&F1,&7,&81,&3,&20,&1C,&40,&D1,&F2
db &51,&A2,&20,&FE,&EA,&F2,&10,&8A,&A2,&F1,&8,&21,&2,&20,&1C,&80
db &A1,&F2,&A1,&20,&50,&FD,&51,&F2,&71,&30,&5,&95,&7,&21,&2,&11
db &4,&50,&8,&7C,&5,&F4,&57,&1,&A4,&F3,&10,&8A,&A2,&71,&3,&10
db &EF,&4,&30,&2,&7C,&A,&81,&A3,&2,&52,&D1,&F3,&20,&5,&D5,&71
db &3,&20,&B8,&1,&81,&3,&20,&F8,&54,&1,&53,&2,&81,&A2,&F3,&20
db &8A,&CA,&71,&3,&10,&5E,&31,&4,&21,&20,&F8,&A8,&1,&A3,&20,&15
db &50,&D1,&F2,&71,&20,&5,&D5,&31,&4,&D1,&31,&3,&81,&2,&F1,&52
db &10,&1,&52,&A4,&E1,&F3,&60,&8A,&CA,&3,&7F,&A8,&E7,&F1,&4,&F1
db &91,&A2,&81,&A2,&54,&F4,&20,&5,&C5,&31,&3,&10,&A8,&51,&6,&E1
db &31,&52,&11,&52,&A4,&E1,&F3,&A3,&E1,&31,&3,&41,&52,&4,&21,&20
db &E0,&AB,&B1,&A3,&54,&F3,&54,&E1,&11,&3,&10,&2A,&71,&6,&C1,&10
db &D3,&71,&53,&A4,&10,&FE,&B1,&A2,&21,&10,&EA,&11,&3,&10,&15,&71
db &6,&C1,&20,&A7,&BF,&A2,&10,&45,&52,&10,&7F,&52,&2,&10,&E4,&11
db &3,&10,&89,&31,&6,&81,&20,&57,&7F,&52,&A7,&21,&2,&10,&EA,&11
db &3,&10,&86,&31,&6,&81,&10,&A7,&F2,&10,&AE,&52,&41,&53,&11,&3
db &10,&E5,&5,&C1,&11,&3,&21,&2,&81,&10,&4F,&F3,&71,&20,&2A,&8
db &A2,&3,&81,&10,&F2,&4,&30,&C2,&20,&80,&2,&20,&1,&AF,&E1,&F2
db &B1,&10,&5F,&11,&2,&11,&2,&41,&52,&F1,&7,&81,&4,&20,&1,&4F
db &D1,&F2,&71,&10,&FE,&21,&4,&81,&A3,&F1,&5,&21,&4,&30,&8,&1
db &8F,&E1,&F2,&B1,&F2,&10,&15,&3,&53,&10,&F9,&5,&21,&2,&40,&8
db &2,&1,&5F,&D1,&F2,&51,&10,&FE,&A2,&10,&2,&81,&A4,&F1,&5,&21
db &10,&20,&81,&3,&50,&1,&9F,&FA,&AB,&FD,&58,&10,&79,&5,&21,&3
db &11,&2,&30,&1,&4E,&FD,&52,&A1,&F2,&A3,&10,&2,&81,&A2,&71,&5
db &21,&3,&11,&2,&10,&1,&E1,&A2,&B1,&A2,&51,&F2,&52,&41,&3,&41
db &30,&39,&7,&1C,&3,&81,&1,&22,&1,&20,&1,&4E,&52,&30,&1,&EA
db &AF,&3,&C1,&40,&83,&3C,&19,&13,&5,&21,&10,&10,&2,&61,&A2,&21
db &3,&D1,&10,&5F,&2,&30,&38,&C,&3C,&A1,&B2,&6,&41,&20,&28,&20
db &61,&52,&11,&3,&81,&10,&AE,&2,&10,&C4,&12,&20,&3C,&BC,&71,&6
db &41,&30,&58,&10,&A6,&21,&5,&52,&2,&10,&3,&22,&20,&3C,&18,&31
db &4,&81,&2,&20,&B8,&28,&61,&52,&11,&2,&A3,&21,&20,&80,&F0,&42
db &10,&38,&B,&71,&12,&71,&A5,&54,&10,&40,&2,&20,&48,&38,&B,&B1
db &20,&A,&47,&54,&50,&EA,&2A,&60,&73,&90,&81,&3,&81,&2,&21,&5
db &71,&10,&15,&71,&A5,&10,&F5,&52,&10,&A0,&91,&2,&91,&81,&C,&F1
db &30,&A,&47,&75,&52,&40,&FA,&AB,&20,&40,&B1,&4,&82,&8,&E1,&60
db &15,&A7,&FE,&AB,&F5,&17,&1,&22,&61,&2,&11,&3,&31,&5,&E1,&2
db &E1,&20,&B,&4E,&F2,&10,&57,&E1,&F2,&21,&30,&10,&A0,&4,&11,&3
db &41,&6,&31,&30,&E0,&7,&8E,&F3,&A1,&F2,&40,&57,&90,&BA,&5,&11
db &3,&10,&8,&81,&4,&C1,&30,&F1,&7,&E,&F3,&51,&F3,&A1,&10,&50
db &81,&F2,&6,&11,&21,&5,&C2,&20,&7,&9C,&F3,&B1,&F2,&71,&2,&11
db &10,&F2,&71,&3,&11,&2,&11,&3,&81,&40,&80,&C3,&3,&1C,&F3,&51
db &F2,&3,&B1,&10,&68,&21,&3,&11,&2,&11,&21,&3,&60,&62,&80,&3
db &9C,&5E,&B7,&12,&3,&91,&10,&E8,&11,&3,&11,&2,&11,&81,&2,&81
db &40,&20,&C0,&1,&38,&D1,&82,&1,&40,&82,&B4,&90,&E8,&11,&F,&8
db &20,&86,&54,&1,&D2,&21,&11,&F,&8,&30,&82,&5C,&60,&52,&10,&12
db &F,&7,&40,&A,&3B,&40,&67,&22,&F,&7,&50,&A,&BC,&A0,&E3,&42
db &F,&3,&61,&3,&20,&C6,&B8,&1,&A2,&E1,&11,&F,&4,&50,&58,&5C
db &6,&57,&50,&21,&F,&7,&31,&10,&70,&5,&11,&30,&32,&47,&8E,&52
db &90,&C7,&4,&9B,&5D,&9B,&61,&75,&60,&3E,&81,&4,&12,&A2,&E1,&40
db &8,&75,&C2,&A,&31,&53,&40,&53,&41,&27,&E0,&2,&81,&2,&81,&C0
db &10,&B5,&A8,&8E,&54,&82,&84,&5A,&5D,&9B,&61,&25,&4,&81,&2,&81
db &10,&A0,&61,&4,&81,&11,&F,&4,&30,&6A,&A0,&40,&E2,&60,&4,&25
db &80,&93,&2C,&9C,&52,&30,&A9,&21,&58,&2,&70,&A,&3E,&E0,&50,&62
db &8E,&2A,&2,&91,&A2,&21,&41,&52,&61,&A2,&20,&71,&50,&2,&10,&A
db &C1,&2,&82,&1,&10,&6B,&A1,&82,&21,&30,&8,&91,&2C,&C1,&53,&13
db &51,&10,&48,&2,&F1,&5,&10,&48,&11,&6,&11,&C,&10,&18,&2,&71
db &2,&81,&2,&40,&8,&59,&6C,&23,&C1,&92,&41,&81,&A2,&81,&1,&C2
db &A1,&91,&22,&51,&6,&20,&1,&C8,&52,&10,&6C,&22,&60,&48,&95,&90
db &AB,&80,&AC,&52,&30,&57,&10,&98,&2,&60,&5,&B8,&54,&6C,&21,&48
db &52,&90,&90,&52,&C8,&2A,&45,&25,&20,&90,&20,&51,&2,&31,&11,&3
db &31,&A,&11,&7,&A1,&20,&D0,&C0,&51,&F,&1,&81,&70,&2B,&13,&63
db &75,&A6,&54,&80,&51,&2,&31,&71,&C,&81,&10,&30,&B2,&50,&42,&27
db &EC,&74,&80,&31,&2,&71,&F1,&D,&91,&A2,&21,&40,&63,&25,&70,&FC
db &2,&31,&2,&61,&E1,&F,&1E,&11,&7,&81,&3
Sprite0_End:

Sprite0Color_Setup:
ld hl,Sprite0Color_Start-1
ld de,Sprite0Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0Color_Start:
db &0,&19,&47,&10,&7,&0,&E,&47,&10,&7,&20,&42,&42,&0,&C,&47
db &10,&7,&42,&20,&42,&42,&0,&B,&47,&71,&47,&20,&7,&7,&0,&A
db &47,&71,&49,&10,&7,&0,&A,&47,&10,&43,&31,&43,&10,&7,&0,&3
db &46,&0,&5,&47,&0,&3,&3,&10,&47,&20,&43,&43,&20,&7,&7,&0
db &3,&46,&0,&5,&47,&10,&3,&20,&47,&47,&10,&3,&0,&4,&7,&0
db &3,&46,&0,&3,&47,&20,&7,&7,&20,&47,&47,&0,&9,&45,&51,&49
db &10,&47,&0,&A,&45,&51,&49,&0,&B,&45,&51,&45
Sprite0Color_End:






FileEnd:

save  "..\ResZX\Level4_Screen.bin",FileBegin,FileEnd-FileBegin
