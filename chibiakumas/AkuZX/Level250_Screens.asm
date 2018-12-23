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
db &F,&6,&11,&2,&11,&2,&11,&2,&11,&F,&A,&11,&2,&11,&2,&11
db &F,&7,&11,&2,&11,&2,&11,&2,&11,&F,&A,&11,&2,&11,&2,&11
db &F,&0,&10,&28,&4,&12,&51,&D4,&F5,&21,&5,&10,&1F,&6,&10,&54
db &B,&81,&2,&81,&6,&C1,&10,&3F,&6,&A2,&8,&81,&2,&81,&2,&10
db &8,&21,&4,&F2,&31,&6,&10,&5D,&11,&A,&81,&2,&81,&5,&20,&F8
db &79,&8,&21,&7,&81,&2,&81,&2,&10,&8,&22,&2,&20,&FC,&70,&6
db &10,&1C,&51,&A,&81,&2,&81,&5,&20,&FC,&F0,&6,&10,&3E,&A1,&3
db &13,&51,&D4,&F4,&10,&20,&2,&20,&CE,&F9,&6,&20,&49,&15,&A,&81
db &2,&81,&4,&10,&86,&F2,&5,&81,&20,&7F,&2B,&7,&81,&2,&81,&2
db &81,&10,&20,&2,&20,&86,&FE,&6,&20,&1C,&17,&A,&81,&2,&81,&4
db &C3,&71,&11,&5,&20,&49,&2F,&7,&81,&2,&81,&2,&81,&23,&1,&20
db &FC,&AE,&11,&4,&81,&20,&67,&17,&A,&81,&2,&81,&4,&20,&F8,&8B
db &5,&21,&F2,&10,&2E,&4,&12,&D5,&F3,&5,&F1,&10,&A3,&5,&31,&F2
db &10,&16,&9,&11,&2,&11,&6,&E1,&20,&78,&20,&3,&21,&F2,&A1,&7
db &11,&2,&11,&2,&11,&6,&81,&20,&7A,&59,&F1,&2,&31,&21,&72,&A
db &11,&2,&11,&7,&50,&9D,&B8,&FE,&60,&62,&B1,&7,&11,&2,&11,&2
db &10,&1,&24,&2,&50,&6A,&7D,&FC,&53,&3A,&51,&A,&11,&2,&11,&7
db &50,&F8,&F0,&FA,&AB,&1C,&A1,&2,&81,&10,&7,&12,&51,&D5,&F2,&21
db &2,&21,&3,&71,&10,&FD,&C1,&F2,&51,&2,&20,&1D,&C0,&F1,&7,&11
db &2,&11,&7,&A1,&10,&F8,&81,&F2,&B1,&40,&B2,&2E,&C0,&2F,&11,&2
db &11,&2,&11,&2,&11,&21,&2,&21,&3,&61,&10,&71,&41,&F4,&E1,&30
db &D7,&C0,&2F,&6,&11,&2,&11,&7,&A1,&10,&B2,&A1,&F4,&C1,&30,&6F
db &C0,&27,&11,&2,&11,&2,&11,&2,&11,&25,&2,&41,&11,&42,&A1,&F2
db &40,&C7,&F7,&B0,&23,&6,&11,&2,&11,&7,&41,&20,&2,&54,&F2,&10
db &87,&F2,&20,&70,&30,&14,&D6,&10,&20,&2,&21,&2,&81,&10,&4,&81
db &A2,&E1,&30,&83,&BF,&E0,&A1,&8,&11,&A,&A1,&2,&41,&40,&D5,&83
db &5F,&C0,&71,&2,&11,&2,&11,&2,&11,&3,&21,&2,&21,&2,&81,&60
db &10,&80,&A2,&83,&3F,&80,&11,&8,&11,&A,&10,&2B,&3,&E1,&30,&81
db &3F,&75,&3,&11,&2,&11,&2,&11,&2,&10,&AE,&24,&2,&10,&5E,&3
db &E1,&30,&81,&3F,&28,&9,&11,&A,&10,&3C,&3,&E1,&30,&1,&3F,&50
db &3,&14,&D5,&2,&21,&2,&21,&2,&10,&5C,&3,&E1,&20,&1,&7F,&C
db &21,&9,&10,&B8,&3,&E1,&20,&1,&7F,&F,&1,&21,&2,&21,&2,&10
db &78,&3,&F1,&20,&1,&FE,&C,&21,&A,&B1,&3,&F1,&20,&1,&FE,&E
db &E2,&24,&3,&71,&3,&F1,&20,&AB,&FC,&11,&B,&21,&A,&E1,&3,&F1
db &2,&10,&FD,&11,&5,&15,&D3,&41,&8,&E1,&20,&1,&F8,&2,&10,&FA
db &11,&C,&11,&9,&C1,&20,&2,&F8,&2,&10,&F4,&11,&6,&11,&2,&11
db &2,&11,&41,&8,&81,&20,&1,&78,&2,&10,&E8,&31,&C,&11,&9,&81
db &20,&3,&F8,&3,&F1,&31,&6,&11,&2,&11,&2,&11,&E2,&A1,&24,&3
db &20,&5,&7C,&2,&10,&E8,&71,&F,&8,&20,&3,&EC,&3,&72,&6,&16
db &91,&10,&40,&8,&40,&6,&76,&20,&A0,&E1,&F,&8,&10,&A,&A2,&3
db &52,&3,&10,&3C,&2,&11,&2,&11,&3,&41,&8,&10,&4,&52,&10,&20
db &1,&A2,&3,&10,&C3,&11,&F,&3,&81,&A2,&3,&52,&2,&C1,&2,&10
db &6,&11,&2,&11,&2,&E3,&A1,&23,&4,&53,&10,&50,&1,&A2,&2,&21
db &2,&10,&18,&8,&21,&7,&81,&A3,&3,&41,&20,&15,&10,&3,&21,&1
db &15,&2,&21,&2,&21,&5,&53,&10,&50,&1,&A2,&21,&10,&18,&2,&10
db &FE,&31,&7,&21,&8,&A2,&21,&3,&41,&10,&15,&C1,&3,&10,&7,&E1
db &7,&21,&2,&21,&5,&53,&10,&50,&1,&A2,&1,&41,&2,&81,&3,&11
db &6,&21,&8,&A2,&21,&3,&41,&10,&15,&61,&2,&61,&3,&21,&4,&E3
db &A1,&23,&3,&41,&52,&11,&10,&50,&1,&A2,&21,&61,&2,&31,&20,&78
db &40,&E,&81,&A2,&21,&3,&41,&52,&20,&4,&8,&E1,&2,&81,&1,&13
db &41,&9,&53,&2,&51,&1,&A2,&21,&2,&30,&84,&81,&3,&11,&D,&A2
db &21,&4,&41,&52,&2,&41,&3,&10,&1F,&21,&2,&11,&41,&9,&52,&2
db &82,&10,&80,&A2,&2,&10,&1C,&F1,&2,&31,&21,&D,&10,&2A,&2,&61
db &82,&21,&10,&50,&2,&20,&A,&3C,&2,&61,&2,&11,&F1,&E2,&A1,&23
db &3,&51,&3,&31,&2,&C1,&10,&80,&2,&21,&5,&41,&C,&A1,&20,&2
db &C2,&2,&10,&86,&11,&5,&20,&7C,&A1,&41,&3,&A8,&4,&10,&3B,&2
db &10,&4,&21,&3,&40,&D2,&83,&1,&4C,&52,&C,&71,&3,&10,&F8,&4
db &30,&28,&D8,&1,&81,&F,&A,&41,&62,&D1,&32,&81,&F,&B,&61,&20
db &DA,&63,&81,&F,&B,&F1,&30,&EC,&63,&10,&F,&A,&E1,&30,&F3,&6B
db &18,&F,&A,&E1,&F2,&10,&3B,&81,&F,&B,&C1,&F2,&B1,&F,&E,&20
db &1F,&7,&31,&F,&C,&20,&F8,&23,&A1,&F,&D,&C1,&20,&3,&12,&F
db &C,&41,&52,&10,&24,&F,&C,&21,&2,&10,&6D,&F,&C,&D1,&20,&51
db &49,&F,&C,&11,&20,&2,&59,&F,&B,&30,&54,&D4,&92,&F,&B,&22
db &20,&9C,&B2,&F,&B,&30,&18,&BC,&62,&F,&B,&30,&3A,&ED,&64,&F
db &B,&30,&72,&AB,&64,&F,&B,&20,&56,&AB,&42,&F,&B,&30,&64,&AB
db &4C,&F,&C,&A1,&20,&AB,&4B,&F,&B,&30,&D4,&AB,&8E,&F,&B,&30
db &E4,&4B,&86,&F,&B,&20,&C2,&69,&42,&F,&B,&30,&62,&24,&64,&F
db &B,&30,&82,&35,&34,&F,&B,&10,&1,&20,&14,&14,&F,&B,&10,&1
db &C1,&F,&E,&10,&CE,&61,&5
Sprite0_End:

Sprite0Color_Setup:
ld hl,Sprite0Color_Start-1
ld de,Sprite0Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0Color_Start:
db &20,&2,&47,&20,&7,&7,&10,&47,&71,&42,&1,&20,&4,&4,&10,&47
db &0,&8,&2,&0,&3,&7,&20,&47,&43,&31,&42,&1,&10,&47,&0,&8
db &2,&20,&7,&7,&31,&42,&1,&10,&4,&31,&42,&1,&20,&43,&43,&0
db &8,&2,&10,&7,&31,&42,&1,&0,&3,&4,&20,&43,&43,&0,&8,&2
db &20,&47,&7,&0,&5,&4,&10,&47,&0,&9,&2,&20,&7,&7,&20,&4
db &2,&20,&4,&4,&20,&47,&47,&0,&8,&2,&71,&42,&1,&20,&4,&2
db &20,&4,&4,&0,&3,&3,&0,&7,&2,&71,&42,&1,&20,&4,&2,&20
db &4,&4,&0,&4,&3,&0,&6,&2,&20,&4,&4,&0,&3,&2,&20,&4
db &4,&0,&3,&47,&20,&3,&2,&0,&E,&47,&10,&7,&0,&D,&47,&10
db &45,&20,&7,&7,&0,&C,&47,&20,&45,&45,&20,&7,&7,&71,&41
Sprite0Color_End:

