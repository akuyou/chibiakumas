org &4000
FileBegin:

call Sprite0_Setup
read "..\srcENT\Akuyou_ENT_RLE.asm"




Sprite0_Setup:
ld hl,Sprite0_Start-1
ld de,Sprite0_End-1
ld b,0   ;Y-Start
ld ixh,32	;Width
ld IXL,24+32	;X-Righthandside
ret
Sprite0_Start:
db &F,&1B,&A1,&F4,&51,&F,&29,&10,&EE,&51,&4,&A1,&10,&77,&F,&25
db &10,&EE,&51,&8,&A1,&10,&77,&F,&22,&A1,&51,&C,&A1,&51,&F,&21
db &51,&5,&F1,&2,&F1,&5,&A1,&F,&20,&A1,&5,&F2,&2,&F2,&5,&51
db &F,&1F,&51,&3,&F2,&10,&8F,&2,&10,&1F,&F2,&3,&A1,&F,&1E,&A1
db &3,&F1,&33,&B1,&2,&71,&33,&F1,&3,&51,&F,&1D,&51,&2,&A1,&34
db &B1,&2,&71,&34,&51,&2,&A1,&F,&1C,&A1,&3,&71,&34,&B1,&2,&71
db &34,&B1,&3,&51,&F,&1B,&51,&2,&A1,&35,&B1,&2,&71,&35,&51,&2
db &A1,&F,&1B,&51,&2,&71,&35,&B1,&2,&71,&35,&B1,&2,&A1,&F,&1A
db &A1,&2,&A1,&36,&B1,&2,&71,&36,&51,&2,&51,&F,&6,&A1,&F2,&51
db &4,&F2,&9,&A1,&2,&71,&36,&B1,&2,&71,&36,&B1,&2,&51,&F,&6
db &F4,&2,&A1,&F3,&51,&8,&A1,&10,&88,&37,&B1,&2,&71,&37,&10,&11
db &51,&F,&5,&A1,&F3,&A1,&10,&11,&F2,&10,&1D,&F1,&8,&51,&10,&88
db &37,&B1,&2,&71,&37,&10,&11,&A1,&F,&5,&A1,&F3,&A1,&10,&11,&F2
db &10,&1D,&F1,&8,&51,&10,&4C,&37,&B1,&2,&71,&37,&10,&23,&A1,&F
db &5,&A1,&60,&DD,&CC,&11,&EE,&11,&77,&7,&51,&10,&4C,&33,&11,&20
db &8,&88,&2,&51,&22,&35,&10,&23,&A1,&F,&5,&A1,&10,&DD,&A1,&F2
db &1,&10,&EE,&51,&F2,&51,&7,&51,&10,&4C,&33,&A1,&20,&33,&8F,&2
db &10,&17,&1,&35,&10,&23,&A1,&F,&5,&A2,&F2,&A2,&1,&F5,&51,&7
db &51,&A1,&33,&11,&F2,&21,&10,&8F,&2,&71,&32,&21,&35,&51,&A1,&F
db &5,&A1,&F2,&4,&10,&99,&1,&52,&8,&51,&A1,&33,&A2,&20,&3B,&8C
db &2,&10,&1F,&2,&21,&34,&51,&A1,&F,&5,&A1,&F2,&10,&88,&2,&51
db &C,&51,&A1,&32,&11,&F3,&71,&10,&8B,&2,&10,&1D,&22,&11,&34,&51
db &A1,&F,&6,&F2,&20,&99,&11,&F1,&55,&7,&51,&A1,&32,&11,&F3,&71
db &10,&8F,&2,&51,&22,&11,&10,&B,&33,&51,&A1,&F,&6,&A1,&F3,&2
db &A1,&F4,&51,&7,&51,&A1,&32,&1,&F3,&71,&10,&8F,&2,&30,&15,&E
db &6,&33,&51,&A1,&F,&7,&F1,&10,&66,&2,&A1,&F4,&51,&7,&51,&A1
db &32,&A1,&30,&BB,&77,&8C,&2,&20,&1F,&D,&12,&33,&51,&A1,&F,&D
db &A1,&F2,&51,&8,&51,&20,&2E,&1,&F6,&2,&51,&32,&1,&10,&2,&33
db &51,&A1,&F,&4,&F1,&9,&10,&66,&9,&51,&20,&2E,&44,&F6,&2,&51
db &33,&10,&6,&33,&51,&A1,&F,&3,&F3,&51,&F,&3,&51,&10,&2E,&A1
db &F2,&51,&F4,&2,&F1,&2,&31,&10,&D,&21,&32,&51,&A1,&F,&2,&A1
db &F4,&F,&3,&51,&10,&2E,&A1,&F4,&A1,&F2,&2,&F4,&31,&22,&32,&51
db &A1,&F,&2,&A1,&F4,&51,&F,&2,&51,&10,&2E,&A1,&F4,&A1,&F2,&2
db &F4,&10,&C,&11,&32,&51,&A1,&9,&51,&7,&F2,&20,&DD,&66,&8,&F2
db &51,&6,&51,&10,&2E,&A1,&F4,&A1,&F2,&2,&F5,&21,&20,&9,&47,&A1
db &9,&51,&3,&A1,&3,&F2,&20,&DD,&66,&6,&A1,&F2,&21,&F1,&6,&51
db &10,&26,&F2,&3,&F3,&2,&F7,&21,&10,&47,&A1,&9,&F1,&3,&10,&66
db &2,&F3,&A1,&10,&77,&6,&F3,&21,&B1,&6,&51,&10,&26,&F2,&4,&F2
db &2,&F6,&20,&19,&47,&A1,&9,&A1,&3,&10,&DF,&2,&A1,&F4,&6,&A1
db &20,&BB,&3B,&B1,&6,&51,&20,&26,&77,&5,&A1,&2,&F1,&5,&20,&19
db &47,&A1,&9,&30,&57,&88,&DF,&2,&F2,&A1,&52,&6,&A1,&F3,&1,&10
db &66,&5,&51,&20,&26,&77,&5,&A1,&2,&10,&19,&32,&2,&20,&3B,&47
db &A1,&8,&F1,&30,&9F,&88,&8F,&2,&F2,&10,&44,&7,&A1,&F3,&1,&10
db &66,&5,&51,&20,&26,&77,&5,&F1,&2,&10,&9D,&F2,&30,&89,&77,&47
db &A1,&8,&A1,&B2,&10,&88,&B2,&2,&20,&EE,&11,&F1,&7,&10,&BB,&F2
db &51,&6,&51,&20,&26,&77,&5,&F1,&2,&30,&1D,&2F,&89,&F2,&10,&47
db &A1,&8,&A1,&30,&CF,&88,&CF,&3,&F2,&A1,&F1,&6,&A1,&10,&BB,&F1
db &52,&6,&51,&10,&26,&F2,&5,&F1,&2,&50,&11,&E,&88,&99,&47,&A1
db &9,&10,&57,&2,&10,&57,&4,&10,&EE,&51,&6,&A1,&F3,&51,&10,&44
db &5,&51,&10,&26,&F2,&51,&3,&10,&EE,&2,&F2,&40,&11,&EE,&5D,&47
db &A1,&9,&A1,&3,&A1,&F,&0,&F2,&2,&10,&66,&5,&51,&10,&26,&F3
db &51,&1,&F3,&2,&F2,&20,&11,&EE,&51,&32,&51,&A1,&9,&10,&77,&2
db &10,&77,&E,&A1,&F2,&A2,&5,&FF,&9,&A,&52,&2,&52,&F,&1,&F3
db &5,&10,&10,&81,&F,&5,&51,&A,&52,&2,&52,&F,&9,&10,&10,&81
db &F,&5,&51,&A,&52,&2,&52,&F,&5,&12,&10,&8,&2,&81,&2,&11
db &10,&7,&F,&0,&51,&A,&52,&2,&52,&5,&A1,&10,&77,&7,&31,&11
db &32,&21,&32,&20,&C,&1,&11,&2,&22,&2,&81,&10,&70,&1,&32,&11
db &F,&3,&52,&2,&52,&5,&F3,&51,&5,&21,&2,&11,&10,&2,&12,&20
db &8,&8,&20,&C3,&25,&1,&12,&41,&10,&80,&31,&2,&21,&11,&F,&1
db &A1,&F2,&10,&88,&F2,&4,&10,&77,&31,&F2,&6,&11,&10,&4,&22,&32
db &20,&3C,&61,&12,&21,&2,&21,&81,&2,&81,&11,&3,&10,&CE,&F,&0
db &A1,&0,&3,&88,&3,&A1,&10,&77,&31,&F2,&6,&21,&1,&32,&1,&12
db &4,&10,&1,&11,&32,&11,&10,&21,&22,&61,&4,&31,&10,&77,&E,&52
db &2,&52,&3,&F2,&2,&F1,&51,&6,&21,&20,&4,&4A,&32,&20,&C,&1
db &11,&2,&22,&1,&20,&10,&1,&11,&2,&11,&2,&10,&67,&E,&52,&2
db &52,&3,&A1,&10,&77,&A1,&F2,&8,&32,&4,&12,&1,&11,&2,&32,&91
db &10,&8,&5,&21,&2,&10,&8B,&C,&10,&11,&F2,&1,&A2,&4,&A1,&F4
db &7,&21,&20,&A4,&2,&12,&20,&C,&1,&11,&2,&22,&81,&10,&4,&6
db &20,&1,&8A,&C,&20,&EE,&99,&F1,&52,&4,&F3,&52,&7,&21,&10,&18
db &20,&8,&8,&1,&12,&1,&11,&2,&21,&10,&84,&21,&9,&10,&8A,&C
db &30,&11,&99,&88,&5,&F2,&3,&A1,&7,&41,&E,&81,&21,&2,&32,&6
db &B1,&C,&30,&EE,&99,&77,&5,&F2,&3,&F1,&7,&51,&E,&41,&1,&32
db &F2,&31,&11,&4,&B1,&E,&10,&99,&7,&A1,&F5,&7,&51,&D,&20,&73
db &40,&D1,&C3,&71,&32,&2,&21,&E,&10,&99,&8,&F4,&8,&51,&C,&A1
db &70,&73,&88,&D4,&C8,&F7,&1E,&8,&E,&10,&99,&9,&A1,&51,&9,&51
db &C,&A1,&F1,&2,&B1,&20,&C0,&88,&F2,&20,&78,&1,&11,&D,&10,&99
db &F,&5,&10,&66,&A,&10,&EE,&51,&2,&E1,&10,&40,&1,&F3,&20,&BC
db &13,&11,&D,&10,&99,&F,&6,&A1,&F1,&8,&A1,&F2,&3,&A1,&10,&11
db &F4,&20,&BC,&35,&21,&D,&10,&99,&F,&8,&F1,&5,&51,&2,&10,&F3
db &41,&2,&21,&F6,&20,&FD,&38,&31,&D,&10,&99,&F,&9,&10,&77,&3
db &51,&3,&E1,&F1,&3,&B1,&F6,&D1,&20,&40,&6,&A,&F1,&52,&A2,&FF
db &6,&3,&A1,&20,&77,&44,&3,&A1,&F1,&3,&21,&F2,&1,&F3,&41,&20
db &60,&8,&2,&A1,&F7,&2,&10,&99,&F,&C,&A1,&10,&77,&4,&10,&77
db &3,&F3,&10,&EE,&D1,&2,&41,&10,&CC,&51,&B,&10,&99,&F,&E,&F4
db &1,&F2,&20,&7,&E,&F4,&83,&1,&A2,&21,&B,&10,&99,&F,&C,&F2
db &51,&4,&40,&EE,&19,&1,&B,&F2,&30,&21,&20,&6E,&31,&B,&F2,&F
db &A,&F2,&8,&F2,&21,&3,&31,&F2,&10,&20,&41,&2,&51,&11,&B,&10
db &99,&F,&8,&A1,&F1,&A,&F2,&21,&2,&11,&3,&10,&2,&41,&F,&0
db &F2,&F,&7,&10,&77,&C,&10,&19,&32,&4,&10,&C2,&51,&F,&0,&10
db &99,&F,&5,&10,&EE,&D,&21,&32,&11,&6,&11,&A1,&F,&0,&10,&99
db &F,&4,&F1,&51,&F,&0,&10,&6,&7,&11,&10,&44,&E,&10,&99,&F
db &3,&A1,&F,&1,&31,&11,&2,&21,&11,&3,&20,&9,&44,&E,&10,&99
db &F,&3,&A1,&F,&0,&10,&6,&3,&31,&20,&4,&8,&2,&10,&45,&E
db &10,&99,&F,&3,&A1,&F,&0,&31,&8,&21,&2,&10,&46,&E,&10,&99
db &F,&3,&A1,&E,&31,&3,&11,&10,&80,&C1,&5,&10,&46,&E,&10,&99
db &F,&3,&A1,&4,&A1,&51,&4,&21,&20,&7,&6,&3,&11,&10,&C0,&41
db &3,&20,&D,&46,&E,&10,&99,&F,&3,&10,&66,&3,&A1,&F1,&2,&32
db &11,&10,&8,&31,&4,&11,&10,&E0,&41,&4,&F1,&12,&E,&10,&99,&F
db &3,&10,&99,&51,&2,&A1,&F1,&32,&5,&21,&4,&11,&10,&30,&C1,&2
db &21,&A1,&F2,&11,&E,&10,&99,&F,&3,&40,&11,&EE,&8C,&37,&6,&21
db &4,&91,&20,&70,&70,&30,&8,&EE,&57,&E,&10,&99,&F,&3,&51,&3
db &20,&77,&7B,&3,&31,&3,&31,&3,&81,&C3,&41,&30,&8,&EE,&AB,&E
db &F2,&F,&3,&51,&4,&A1,&10,&79,&11,&3,&11,&2,&31,&3,&81,&C2
db &1,&C2,&1,&20,&7E,&99,&E,&10,&99,&F,&3,&51,&5,&10,&E6,&61
db &9,&84,&40,&D0,&DC,&BC,&88,&D,&A1,&2,&51,&F,&2,&51,&6,&A1
db &F1,&5,&30,&10,&20,&D0,&81,&C3,&30,&88,&57,&88,&D,&53,&A1,&F
db &2,&51,&8,&F2,&51,&81,&C7,&41,&C2,&41,&10,&44,&F1,&2,&A1,&7
db &21,&30,&1,&6,&44,&A3,&F,&2,&51,&A,&A1,&F1,&2,&41,&30,&40
db &20,&B0,&C1,&3,&51,&2,&A1,&7,&81,&20,&10,&60,&A2,&2,&52,&F
db &1,&51,&C,&F1,&20,&91,&80,&2,&10,&E0,&41,&2,&A1,&3,&A1,&7
db &81,&20,&10,&60,&52,&F2,&A2,&F,&1,&A1,&D,&10,&EE,&8,&10,&66
db &3,&51,&7,&81,&30,&10,&60,&22,&52,&1,&52,&F,&1,&F1,&51,&D
db &F8,&51,&4,&51,&3,&C2,&41,&1,&C2,&1,&C2,&10,&11,&A1,&2,&A2
db &F,&2,&10,&EE,&F,&A,&51,&3,&41,&10,&40,&1,&C2,&1,&C2,&2
db &52,&2,&52,&F,&3,&F1,&F,&8,&A1,&4,&41,&40,&40,&CC,&31,&FE
db &2,&A1,&3,&A2,&F,&4,&F1,&51,&F,&6,&51,&4,&81,&C1,&2,&51
db &20,&31,&F6,&2,&52,&3,&52,&F,&4,&10,&66,&F,&4,&A1,&6,&41
db &2,&E1,&20,&20,&BA,&2,&A1,&4,&A2,&F,&5,&A1,&F1,&F,&3,&51
db &4,&20,&F4,&FB,&42,&20,&20,&F6,&2,&52,&4,&52,&F,&6,&F1,&F
db &1,&A1,&3,&81,&C2,&F1,&40,&CC,&D8,&20,&BA,&2,&A1,&5,&A1,&F
db &8,&10,&77,&E,&51,&3,&81,&C2,&F3,&30,&D8,&20,&F6,&2,&52,&F
db &E,&A1,&F2,&51,&A,&A1,&4,&10,&1,&C4,&30,&DC,&31,&FE,&F,&15
db &A1,&FA,&51,&4,&21,&6,&C2,&1,&C2
Sprite0_End:
FileEnd:

save  "..\BldEnt\T10-SC8.D01",FileBegin,FileEnd-FileBegin
