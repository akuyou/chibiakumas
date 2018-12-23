jp Sprite0_Setup


Sprite0_Setup:
ld hl,Sprite0_Start-1
ld de,Sprite0_End-1
ld b,0   ;Y-Start
ld ixh,32	;Width
ld IXL,24+32	;X-Righthandside
ret
Sprite0_Start:
db &F,&1B,&41,&5,&41,&5,&41,&5,&41,&F,&24,&41,&5,&41,&5,&41
db &F,&1E,&41,&5,&41,&5,&41,&5,&41,&F,&24,&41,&5,&41,&5,&41
db &F,&1C,&20,&10,&10,&43,&C1,&20,&D0,&D0,&41,&CB,&81,&F,&27,&81
db &5,&81,&F,&24,&81,&5,&81,&5,&81,&2,&81,&F,&27,&81,&5,&81
db &F,&10,&42,&F,&3,&81,&5,&81,&5,&81,&2,&10,&20,&81,&8,&A1
db &F2,&E,&83,&F,&9,&81,&5,&81,&C,&A1,&F3,&51,&D,&44,&8,&0
db &3,&10,&43,&C1,&20,&D0,&D0,&41,&C9,&2,&81,&6,&A1,&F4,&51,&C
db &82,&C2,&81,&F,&A,&81,&5,&81,&9,&F3,&1,&F2,&C,&41,&C3,&42
db &F,&3,&81,&5,&81,&5,&81,&2,&81,&5,&A1,&F2,&51,&10,&88,&F1
db &B,&82,&10,&FE,&C2,&81,&F,&9,&81,&5,&81,&8,&A1,&F2,&51,&20
db &88,&77,&B,&C1,&F2,&10,&F1,&42,&F,&2,&81,&5,&81,&5,&82,&1
db &10,&20,&81,&3,&20,&77,&EE,&1,&F2,&51,&A,&30,&E8,&44,&E2,&82
db &F,&8,&81,&5,&81,&8,&F1,&2,&F4,&51,&A,&C1,&F4,&C1,&43,&7
db &0,&3,&10,&0,&4,&D0,&41,&C7,&8,&F1,&2,&51,&F3,&51,&9,&82
db &1,&10,&EE,&1,&C2,&81,&F,&5,&41,&5,&41,&B,&20,&66,&66,&A1
db &F2,&A1,&A,&20,&38,&44,&21,&C2,&42,&7,&41,&5,&41,&5,&41,&5
db &41,&B,&A1,&F2,&51,&F1,&52,&F1,&9,&81,&40,&3A,&23,&83,&B0,&F
db &5,&41,&5,&41,&C,&F3,&52,&10,&44,&A,&41,&F4,&D1,&C1,&42,&7
db &41,&5,&41,&5,&41,&5,&41,&3,&0,&3,&20,&81,&2,&A1,&F2,&10
db &11,&52,&9,&81,&10,&DC,&E1,&F2,&D1,&10,&B0,&F,&5,&41,&5,&41
db &D,&10,&77,&1,&F2,&3,&51,&7,&10,&DC,&D1,&F2,&D1,&42,&8,&0
db &3,&10,&43,&C1,&0,&3,&D0,&41,&C5,&81,&5,&81,&4,&52,&F2,&21
db &1,&F2,&D1,&10,&70,&3,&81,&30,&FC,&99,&B3,&C1,&F,&8,&41,&5
db &41,&C,&A2,&F1,&1,&12,&F2,&51,&D1,&C2,&41,&2,&10,&F8,&2,&10
db &B3,&42,&A,&41,&5,&41,&5,&41,&5,&10,&10,&81,&5,&81,&5,&10
db &15,&32,&1,&F3,&81,&C3,&41,&82,&E1,&10,&C0,&51,&82,&F,&8,&41
db &5,&41,&E,&B1,&32,&10,&89,&F2,&51,&C3,&43,&C1,&10,&F1,&51,&43
db &5,&C2,&3,&41,&5,&41,&5,&41,&5,&10,&10,&0,&4,&20,&81,&4
db &21,&10,&1F,&21,&F3,&A1,&C5,&82,&10,&76,&83,&C1,&4,&20,&E8,&F9
db &E,&41,&5,&41,&F,&0,&32,&11,&F3,&51,&C5,&42,&C2,&42,&C1,&42
db &3,&30,&E4,&F8,&11,&0,&4,&10,&0,&6,&D0,&2,&81,&5,&81,&5
db &71,&32,&A1,&F2,&10,&A2,&C7,&41,&C3,&82,&C3,&81,&C2,&41,&51,&F
db &0,&41,&F,&4,&20,&2F,&8D,&F1,&52,&D1,&C7,&41,&81,&C2,&41,&C4
db &D1,&C2,&41,&51,&3,&41,&5,&41,&5,&41,&7,&81,&5,&81,&5,&21
db &32,&21,&20,&22,&20,&41,&C6,&1,&81,&C2,&81,&C3,&E1,&51,&C2,&1
db &51,&F,&0,&41,&F,&4,&A1,&32,&11,&2,&84,&C5,&2,&C6,&E1,&10
db &33,&A2,&51,&3,&41,&5,&41,&5,&41,&5,&10,&E0,&83,&1,&20,&20
db &20,&81,&4,&71,&10,&B,&3,&45,&C2,&41,&2,&C3,&42,&C2,&F1,&53
db &F,&1,&41,&F,&5,&A1,&10,&7,&4,&85,&C1,&41,&2,&C3,&83,&C1
db &A1,&F2,&5,&0,&4,&10,&0,&5,&D0,&4,&81,&5,&81,&4,&21,&10
db &1F,&5,&42,&1,&10,&D0,&41,&2,&C3,&30,&10,&D0,&DC,&F,&5,&81
db &F,&4,&31,&12,&7,&C2,&3,&C3,&41,&83,&E1,&F,&E,&81,&5,&81
db &5,&10,&1F,&21,&7,&C2,&3,&C3,&41,&2,&42,&F,&6,&81,&F,&4
db &10,&2E,&11,&7,&C2,&3,&81,&C2,&41,&2,&82,&F,&A,&20,&E0,&E0
db &0,&3,&20,&81,&5,&10,&4E,&21,&7,&C2,&3,&81,&C3,&F,&A,&81
db &F,&5,&31,&12,&6,&C2,&3,&81,&C3,&D,&0,&5,&10,&0,&3,&D0
db &10,&40,&F,&0,&71,&31,&6,&81,&C2,&4,&C3,&41,&F,&B,&41,&F
db &3,&A1,&12,&5,&81,&C2,&4,&C3,&41,&E,&41,&5,&41,&5,&41,&2
db &41,&F,&0,&21,&10,&B,&5,&81,&C2,&54,&81,&C3,&F,&B,&41,&F
db &4,&10,&7,&5,&81,&C2,&3,&A1,&81,&C3,&E,&41,&5,&41,&5,&10
db &10,&20,&E0,&E0,&83,&1,&20,&20,&20,&81,&5,&10,&1F,&5,&C3,&4
db &51,&C3,&F,&1F,&A1,&12,&4,&C2,&41,&4,&82,&C2,&E,&0,&6,&10
db &10,&90,&3,&41,&F,&0,&31,&5,&C2,&81,&5,&41,&C2,&41,&F,&1F
db &31,&11,&4,&C2,&41,&5,&81,&C2,&41,&8,&E1,&D1,&5,&41,&5,&41
db &8,&41,&F,&0,&22,&3,&81,&C2,&81,&5,&41,&C3,&7,&C1,&2,&E1
db &51,&F,&13,&21,&11,&3,&20,&60,&70,&5,&81,&10,&B0,&C1,&6,&F1
db &4,&10,&64,&2,&41,&5,&41,&5,&0,&3,&E0,&83,&1,&10,&20,&81
db &7,&31,&3,&10,&B0,&C1,&3,&51,&3,&42,&10,&70,&4,&81,&6,&81
db &51,&F,&2,&81,&F,&0,&12,&2,&44,&5,&84,&5,&41,&7,&81,&3
db &0,&4,&10,&41,&5,&81,&5,&81,&9,&22,&1,&84,&3,&51,&3,&44
db &3,&A1,&41,&5,&20,&E0,&FE,&C1,&F,&0,&81,&F,&1,&11,&1,&45
db &5,&84,&4,&C1,&6,&10,&72,&2,&10,&E4,&E,&81,&5,&81,&A,&21
db &85,&2,&A2,&3,&44,&3,&41,&5,&81,&6,&41,&D,&81,&F,&1,&12
db &45,&6,&84,&2,&10,&62,&4,&10,&62,&6,&81,&9,&0,&3,&E0,&83
db &1,&10,&20,&81,&8,&22,&84,&2,&A2,&3,&45,&1,&10,&62,&4,&D1
db &2,&81,&10,&70,&3,&41,&F,&F,&11,&45,&6,&84,&3,&41,&3,&81
db &2,&10,&E4,&5,&81,&2,&20,&10,&10,&41,&2,&41,&F,&4,&86,&2
db &A2,&3,&45,&2,&41,&3,&41,&10,&88,&41,&2,&81,&C1,&3,&41,&F
db &E,&46,&6,&85,&2,&81,&3,&41,&6,&20,&FC,&10,&81,&5,&41,&2
db &41,&F,&3,&86,&3,&A2,&3,&46,&10,&80,&3,&C1,&10,&10,&C2,&4
db &10,&30,&81,&F,&D,&46,&7,&86,&4,&82,&3,&C2,&5,&10,&60,&4
db &10,&10,&C2,&20,&E0,&E0,&83,&1,&10,&20,&81,&6,&86,&4,&A2,&3
db &47,&3,&81,&7,&41,&4,&41,&F,&A,&46,&9,&87,&3,&10,&20,&81
db &C2,&2,&81,&30,&10,&E0,&40,&6,&8F,&2,&1,&85,&3,&A1,&2,&51
db &20,&44,&88,&4A,&10,&20,&61,&32,&C2,&61,&41,&4,&C1,&1,&45,&F
db &3,&45,&1,&10,&EE,&2,&F1,&2,&F1,&1,&52,&2,&85,&2,&10,&E0
db &61,&C2,&E1,&20,&58,&10,&41,&2,&81,&F,&9,&83,&3,&F1,&2,&A1
db &51,&2,&A1,&2,&10,&77,&3,&43,&3,&C1,&60,&66,&64,&DC,&B1,&71
db &80,&F,&9,&43,&3,&20,&11,&66,&4,&F1,&2,&F1,&A,&60,&66,&E0
db &FE,&B1,&D7,&80,&F,&E,&A1,&10,&DD,&51,&5,&A1,&3,&F1,&9,&20
db &EF,&C0,&F3,&C1,&10,&D7,&2,&41,&F,&D,&A1,&F1,&8,&F4,&9,&A1
db &F6,&C1,&20,&F7,&80,&41,&F,&24,&21,&F6,&E1,&F1,&2,&81,&F,&26
db &B1,&F5,&E1,&3,&81,&F,&27,&50,&EF,&11,&77,&32,&B3,&F,&28,&A1
db &F3,&1,&20,&76,&A2,&F,&2A,&F1,&30,&13,&76,&22,&41,&F,&29,&13
db &20,&76,&44,&81,&F,&28,&21,&2,&21,&30,&F6,&DD,&60,&F,&27,&20
db &D,&1,&F1,&52,&A1,&10,&40,&F,&27,&20,&1,&2,&53,&A1,&10,&51
db &F,&26,&51,&12,&40,&4,&DD,&22,&91,&F,&25,&10,&22,&21,&2,&B1
db &51,&A2,&1,&10,&B3,&F,&26,&A1,&71,&2,&B1,&C1,&A2,&1,&10,&62
db &F,&25,&A2,&F1,&12,&B1,&30,&E8,&44,&62,&F,&25,&20,&22,&BB,&F1
db &A3,&20,&44,&66,&F,&25,&20,&66,&75,&F1,&A3,&20,&44,&44,&F,&26
db &51,&10,&66,&F1,&A3,&20,&CC,&44,&F,&27,&A2,&F1,&A3,&20,&B8,&44
db &F,&26,&11,&51,&F2,&A4,&F1,&10,&88,&F,&26,&11,&A1,&F2,&A1,&30
db &44,&66,&88,&F,&25,&21,&2,&F1,&51,&A2,&51,&20,&44,&44,&F,&25
db &30,&2,&6,&44,&A1,&2,&51,&10,&66,&F,&25,&21,&2,&21,&10,&45
db &F1,&2,&51,&F1,&F,&26,&11,&4,&52,&2,&52,&F,&26,&11,&4,&F1
db &F,&2B,&30,&E,&C,&46,&A
Sprite0_End:
