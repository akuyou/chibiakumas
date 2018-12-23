
org &6000

nolist
FirstByte:
jp Pic0Loadingpng
jp Pic2Continuepng
jp PicSetDisk3PNG

Pic0Loadingpng:
ld hl,Pic0Loadingpng_rledata-1
ld de,Pic0Loadingpng_rledataEnd-1
ld b,0
ld ixh,80
ld IXL,79
di
exx 
push bc
exx
jp RLE_Draw


Pic0Loadingpng_rledata:

defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&95
defb &10,&90

defb &41
defb &F,&8d
defb &81
defb &20,&70,&E0

defb &41
defb &2
defb &C3
defb &F,&85
defb &10,&60
defb &4
defb &10,&60
defb &C3
defb &D1
defb &51
defb &F,&84
defb &41
defb &6
defb &81
defb &20,&70,&80

defb &C1
defb &F,&83
defb &C1
defb &41
defb &3
defb &10,&E0
defb &2
defb &10,&60
defb &2
defb &10,&64
defb &F,&81
defb &81
defb &7
defb &C1
defb &2
defb &81
defb &3
defb &81
defb &F,&80
defb &81
defb &41
defb &3
defb &81
defb &4
defb &41
defb &2
defb &41
defb &2
defb &81
defb &51
defb &F,&7f
defb &81
defb &3
defb &81
defb &51
defb &7
defb &C1
defb &3
defb &C1
defb &F,&7b
defb &81
defb &F2
defb &10,&51
defb &2
defb &10,&62
defb &2
defb &10,&F2
defb &4
defb &81
defb &3
defb &10,&60
defb &F,&7a
defb &F2
defb &51
defb &20,&20,&30

defb &41
defb &2
defb &81
defb &2
defb &D1
defb &4
defb &41
defb &2
defb &10,&64
defb &F,&79
defb &10,&EE
defb &52
defb &10,&A8
defb &4
defb &10,&64
defb &3
defb &C1
defb &3
defb &41
defb &3
defb &41
defb &F,&79
defb &F2
defb &2
defb &10,&90
defb &4
defb &41
defb &6
defb &81
defb &10,&80
defb &3
defb &C1
defb &F,&78
defb &A1
defb &30,&33,&A2,&40
defb &6
defb &10,&E8
defb &3
defb &81
defb &10,&90

defb &41
defb &2
defb &81
defb &F,&78
defb &F1
defb &20,&11,&91
defb &3
defb &81
defb &7
defb &E1
defb &2
defb &10,&90
defb &3
defb &81
defb &41
defb &F,&76
defb &A2
defb &20,&88,&40
defb &3
defb &41
defb &2
defb &11
defb &3
defb &20,&10,&10
defb &10,&91
defb &3
defb &81
defb &41
defb &F,&76
defb &52
defb &2
defb &20,&31,&10

defb &81
defb &2
defb &31
defb &20,&93,&D0
defb &00,&3,&10

defb &41
defb &3
defb &E1
defb &F,&75
defb &A2
defb &1
defb &A2
defb &90,&10,&90,&11,&DE,&E3,&48,&30,&20,&32

defb &41
defb &3
defb &E1
defb &F,&75
defb &52
defb &2
defb &51
defb &20,&98,&40
defb &2
defb &20,&5E,&73
defb &82
defb &91
defb &3
defb &10,&20

defb &41
defb &3
defb &C1
defb &F,&74
defb &A4
defb &1
defb &A2
defb &D1
defb &4
defb &40,&5E,&31,&12,&30
defb &20,&20,&20

defb &41
defb &3
defb &81
defb &F,&74
defb &53
defb &3
defb &70,&73,&80,&10,&DE,&B1,&23,&60
defb &2
defb &10,&20

defb &41
defb &3
defb &81
defb &F,&73
defb &A1
defb &10,&33

defb &A1
defb &2
defb &A1
defb &D1
defb &2
defb &51
defb &30,&80,&BC,&78

defb &71
defb &2
defb &C1
defb &20,&40,&80
defb &4
defb &81
defb &F,&73
defb &A2
defb &2
defb &51
defb &20,&CC,&31

defb &81
defb &3
defb &20,&DE,&9E

defb &11
defb &2
defb &81
defb &42
defb &10,&80
defb &4
defb &81
defb &F,&73
defb &52
defb &1
defb &50,&22,&EE,&20,&10,&E0

defb &31
defb &B2
defb &F1
defb &40,&11,&24,&70,&80
defb &4
defb &81
defb &F,&72
defb &A2
defb &2
defb &10,&11
defb &53
defb &81
defb &10,&1
defb &63
defb &71
defb &F2
defb &10,&91

defb &B1
defb &82
defb &91
defb &10,&40
defb &F,&77
defb &52
defb &2
defb &A3
defb &51
defb &30,&14,&C3,&D2

defb &31
defb &B2
defb &F1
defb &30,&59,&4C,&68
defb &42
defb &F,&76
defb &A2
defb &4
defb &52
defb &81
defb &A1
defb &33
defb &10,&B7

defb &61
defb &72
defb &F1
defb &20,&15,&62

defb &81
defb &43
defb &F,&75
defb &A2
defb &52
defb &10,&22
defb &A3
defb &41
defb &40,&8,&2D,&6F,&3C

defb &B1
defb &F2
defb &21
defb &20,&12,&42

defb &81
defb &F,&76
defb &10,&DD
defb &2
defb &10,&11
defb &52
defb &40,&60,&7,&C2,&47
defb &C2
defb &20,&CB,&77
defb &2
defb &10,&13

defb &81
defb &F,&75
defb &A2
defb &2
defb &A4
defb &1
defb &10,&64

defb &11
defb &2
defb &51
defb &10,&92
defb &2
defb &10,&86
defb &F3
defb &E1
defb &11
defb &F,&77
defb &52
defb &4
defb &F1
defb &20,&11,&1D
defb &3
defb &21
defb &30,&10,&CE,&86
defb &F3
defb &71
defb &F,&77
defb &10,&EE
defb &2
defb &60,&22,&EE,&80,&48,&8,&99
defb &2
defb &72
defb &51
defb &B2
defb &F2
defb &51
defb &F,&77
defb &A1
defb &5
defb &40,&66,&44,&58,&44
defb &2
defb &30,&11,&7F,&1D

defb &71
defb &F2
defb &11
defb &F,&77
defb &52
defb &2
defb &52
defb &F2
defb &20,&B1,&48
defb &4
defb &10,&9D
defb &F3
defb &1
defb &20,&8F,&37
defb &F,&77
defb &A1
defb &2
defb &A3
defb &30,&77,&10,&28
defb &4
defb &10,&B

defb &B1
defb &F2
defb &2
defb &31
defb &11
defb &F,&77
defb &A1
defb &F1
defb &2
defb &F1
defb &2
defb &20,&33,&30
defb &82
defb &11
defb &2
defb &21
defb &10,&12

defb &81
defb &D2
defb &F,&7b
defb &A1
defb &10,&11

defb &A1
defb &2
defb &A1
defb &70,&11,&D0,&80,&1,&87,&11,&EA

defb &41
defb &F,&7b
defb &A1
defb &10,&11

defb &A1
defb &2
defb &A1
defb &2
defb &70,&20,&90,&9,&BE,&1,&4E,&1D
defb &F,&7a
defb &A1
defb &10,&88
defb &8
defb &20,&70,&86
defb &72
defb &30,&33,&AE,&D
defb &F,&7a
defb &F1
defb &10,&44
defb &7
defb &21
defb &60,&40,&C4,&AE,&77,&DE,&D9

defb &11
defb &F,&79
defb &F1
defb &A1
defb &8
defb &81
defb &3
defb &51
defb &1
defb &F2
defb &51
defb &20,&BE,&1D

defb &51
defb &F,&79
defb &F1
defb &9
defb &21
defb &3
defb &21
defb &40,&88,&EF,&DE,&D9

defb &61
defb &F,&79
defb &F1
defb &9
defb &11
defb &4
defb &10,&11

defb &71
defb &F3
defb &10,&84

defb &D1
defb &F,&1c
defb &81
defb &C2
defb &F,&2f
defb &81
defb &10,&70
defb &F,&a
defb &F1
defb &9
defb &51
defb &3
defb &11
defb &10,&2
defb &B2
defb &F2
defb &21
defb &E2
defb &31
defb &10,&27
defb &F,&18
defb &C5
defb &41
defb &7
defb &C2
defb &41
defb &6
defb &C2
defb &4
defb &C2
defb &41
defb &7
defb &81
defb &C4
defb &41
defb &7
defb &81
defb &C2
defb &A
defb &81
defb &C5
defb &41
defb &9
defb &C2
defb &C
defb &51
defb &9
defb &11
defb &2
defb &21
defb &2
defb &11
defb &21
defb &72
defb &D1
defb &31
defb &F2
defb &2
defb &21
defb &10,&17
defb &F,&15
defb &C7
defb &41
defb &5
defb &81
defb &C3
defb &5
defb &C3
defb &41
defb &2
defb &81
defb &C3
defb &6
defb &81
defb &C6
defb &7
defb &C3
defb &41
defb &8
defb &81
defb &C7
defb &41
defb &7
defb &81
defb &C2
defb &41
defb &B
defb &51
defb &9
defb &51
defb &5
defb &21
defb &C1
defb &B2
defb &21
defb &10,&FE

defb &71
defb &4
defb &21
defb &F,&14
defb &81
defb &C8
defb &5
defb &81
defb &C3
defb &5
defb &C4
defb &2
defb &81
defb &C3
defb &5
defb &81
defb &C7
defb &41
defb &5
defb &81
defb &C4
defb &8
defb &C9
defb &7
defb &81
defb &C3
defb &F,&6
defb &11
defb &10,&88
defb &3
defb &11
defb &20,&4,&4
defb &10,&EE
defb &5
defb &21
defb &41
defb &F,&13
defb &C9
defb &41
defb &4
defb &81
defb &C3
defb &4
defb &81
defb &C4
defb &2
defb &81
defb &C3
defb &5
defb &C8
defb &41
defb &5
defb &81
defb &C4
defb &7
defb &81
defb &C9
defb &41
defb &6
defb &81
defb &C3
defb &F,&6
defb &11
defb &4
defb &21
defb &2
defb &21
defb &6
defb &21
defb &2
defb &31
defb &91
defb &F,&12
defb &81
defb &C3
defb &41
defb &2
defb &C4
defb &41
defb &3
defb &81
defb &C3
defb &4
defb &C5
defb &2
defb &81
defb &C3
defb &4
defb &C4
defb &2
defb &C3
defb &41
defb &5
defb &C5
defb &41
defb &5
defb &81
defb &C4
defb &3
defb &C4
defb &41
defb &5
defb &81
defb &C3
defb &F,&6
defb &11
defb &10,&8
defb &2
defb &A1
defb &9
defb &30,&11,&8E,&43
defb &F,&11
defb &81
defb &C3
defb &3
defb &81
defb &C3
defb &41
defb &3
defb &81
defb &C3
defb &3
defb &81
defb &C5
defb &2
defb &81
defb &C3
defb &4
defb &C3
defb &41
defb &2
defb &C3
defb &41
defb &5
defb &C5
defb &41
defb &5
defb &81
defb &C4
defb &3
defb &C4
defb &41
defb &5
defb &81
defb &C3
defb &F,&6
defb &11
defb &9
defb &21
defb &10,&17
defb &2
defb &10,&1

defb &21
defb &72
defb &11
defb &F,&12
defb &C2
defb &41
defb &4
defb &C4
defb &3
defb &81
defb &C3
defb &3
defb &C6
defb &2
defb &81
defb &C3
defb &3
defb &81
defb &C3
defb &3
defb &C3
defb &41
defb &4
defb &81
defb &C6
defb &5
defb &81
defb &C3
defb &5
defb &C4
defb &5
defb &81
defb &C3
defb &F,&6
defb &11
defb &4
defb &11
defb &2
defb &21
defb &10,&57
defb &3
defb &23
defb &91
defb &B2
defb &31
defb &F,&12
defb &81
defb &C1
defb &5
defb &81
defb &C3
defb &3
defb &81
defb &C3
defb &3
defb &C6
defb &2
defb &81
defb &C3
defb &3
defb &81
defb &C2
defb &41
defb &3
defb &C3
defb &41
defb &4
defb &81
defb &C6
defb &5
defb &C3
defb &41
defb &5
defb &81
defb &C3
defb &5
defb &81
defb &C3
defb &F,&6
defb &21
defb &4
defb &11
defb &8
defb &11
defb &B2
defb &20,&4B,&DF
defb &F,&1a
defb &C3
defb &3
defb &81
defb &C3
defb &2
defb &81
defb &C6
defb &2
defb &81
defb &C3
defb &3
defb &C3
defb &4
defb &C3
defb &41
defb &4
defb &81
defb &C2
defb &1
defb &81
defb &C2
defb &5
defb &C3
defb &7
defb &C3
defb &5
defb &81
defb &C3
defb &F,&7
defb &11
defb &B
defb &10,&4E

defb &F1
defb &72
defb &41
defb &10,&EF

defb &11
defb &F,&19
defb &C3
defb &3
defb &81
defb &C3
defb &2
defb &81
defb &C6
defb &2
defb &81
defb &C3
defb &3
defb &C3
defb &4
defb &C3
defb &41
defb &4
defb &81
defb &C2
defb &1
defb &81
defb &C2
defb &5
defb &C3
defb &7
defb &C3
defb &5
defb &81
defb &C3
defb &F,&7
defb &21
defb &B
defb &B2
defb &F2
defb &10,&27
defb &F2
defb &51
defb &F,&10
defb &81
defb &C4
defb &41
defb &3
defb &C3
defb &41
defb &2
defb &81
defb &C3
defb &2
defb &C3
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &4
defb &C3
defb &41
defb &4
defb &C3
defb &1
defb &81
defb &C2
defb &41
defb &3
defb &81
defb &C3
defb &7
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &F,&8
defb &12
defb &3
defb &12
defb &20,&4,&C

defb &71
defb &F3
defb &10,&57
defb &F2
defb &71
defb &F,&10
defb &81
defb &C4
defb &41
defb &3
defb &C3
defb &41
defb &2
defb &81
defb &C3
defb &1
defb &81
defb &C3
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &4
defb &C3
defb &41
defb &4
defb &C3
defb &1
defb &81
defb &C2
defb &41
defb &3
defb &81
defb &C3
defb &7
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &F,&7
defb &FA
defb &A7
defb &11
defb &F2
defb &71
defb &3
defb &10,&4E

defb &91
defb &F,&a
defb &C6
defb &3
defb &C3
defb &41
defb &2
defb &81
defb &C3
defb &1
defb &C3
defb &1
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &4
defb &C3
defb &41
defb &4
defb &C2
defb &41
defb &2
defb &C2
defb &41
defb &3
defb &81
defb &C3
defb &7
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &F,&7
defb &DF,&1
defb &52
defb &F2
defb &71
defb &3
defb &20,&EF,&61
defb &F,&9
defb &C6
defb &3
defb &C3
defb &41
defb &2
defb &81
defb &C3
defb &1
defb &C3
defb &1
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &4
defb &C3
defb &41
defb &3
defb &81
defb &C2
defb &41
defb &2
defb &C3
defb &3
defb &81
defb &C3
defb &7
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &F,&7
defb &F1
defb &F,&0
defb &10,&72
defb &F3
defb &21
defb &2
defb &20,&7F,&43
defb &F,&9
defb &C5
defb &41
defb &3
defb &C3
defb &3
defb &81
defb &C3
defb &81
defb &C2
defb &10,&10

defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &3
defb &C3
defb &4
defb &C3
defb &41
defb &3
defb &81
defb &C2
defb &41
defb &2
defb &C3
defb &41
defb &3
defb &C3
defb &7
defb &C3
defb &5
defb &81
defb &C3
defb &F,&7
defb &D1
defb &F,&0
defb &10,&33

defb &E1
defb &F2
defb &A1
defb &2
defb &20,&EF,&61
defb &F,&9
defb &C5
defb &41
defb &3
defb &C3
defb &3
defb &81
defb &C3
defb &81
defb &C2
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &3
defb &C3
defb &4
defb &C3
defb &41
defb &3
defb &81
defb &C3
defb &1
defb &81
defb &C3
defb &41
defb &3
defb &C3
defb &7
defb &C3
defb &5
defb &81
defb &C3
defb &F,&7
defb &10,&33
defb &FD
defb &1
defb &10,&32

defb &61
defb &F2
defb &21
defb &72
defb &20,&5E,&43
defb &F,&9
defb &C3
defb &5
defb &81
defb &C3
defb &3
defb &81
defb &C5
defb &41
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &3
defb &C3
defb &41
defb &3
defb &C3
defb &41
defb &3
defb &C9
defb &41
defb &3
defb &C3
defb &41
defb &5
defb &81
defb &C3
defb &5
defb &81
defb &C3
defb &F,&7
defb &10,&31

defb &F1
defb &EC
defb &1
defb &30,&33,&BE,&BB
defb &B2
defb &20,&9E,&61
defb &F,&9
defb &C3
defb &41
defb &4
defb &C4
defb &3
defb &81
defb &C5
defb &41
defb &2
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &3
defb &C3
defb &41
defb &3
defb &C3
defb &41
defb &3
defb &C9
defb &41
defb &3
defb &81
defb &C3
defb &5
defb &81
defb &C2
defb &41
defb &5
defb &81
defb &C3
defb &F,&7
defb &10,&33
defb &D4
defb &F5
defb &D3
defb &20,&33,&32

defb &61
defb &72
defb &81
defb &72
defb &D1
defb &32
defb &41
defb &F,&9
defb &81
defb &C3
defb &3
defb &81
defb &C3
defb &41
defb &3
defb &81
defb &C5
defb &3
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &3
defb &81
defb &C3
defb &3
defb &C3
defb &41
defb &2
defb &81
defb &CA
defb &3
defb &81
defb &C4
defb &3
defb &C4
defb &41
defb &5
defb &81
defb &C3
defb &F,&7
defb &10,&31

defb &F1
defb &E3
defb &74
defb &F1
defb &E4
defb &1
defb &10,&B3

defb &E1
defb &B2
defb &1
defb &E1
defb &B2
defb &61
defb &10,&61
defb &F,&9
defb &81
defb &C3
defb &41
defb &2
defb &C4
defb &41
defb &3
defb &81
defb &C5
defb &3
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &3
defb &81
defb &C3
defb &41
defb &2
defb &C3
defb &41
defb &2
defb &81
defb &CA
defb &3
defb &81
defb &C4
defb &3
defb &C4
defb &41
defb &5
defb &81
defb &C3
defb &F,&7
defb &10,&33
defb &D4
defb &F1
defb &B4
defb &D3
defb &40,&33,&B2,&6D,&3D

defb &C1
defb &72
defb &61
defb &C1
defb &F,&b
defb &CA
defb &4
defb &81
defb &C4
defb &41
defb &3
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &4
defb &81
defb &C8
defb &41
defb &2
defb &C3
defb &41
defb &4
defb &C3
defb &41
defb &3
defb &81
defb &C9
defb &41
defb &3
defb &81
defb &C6
defb &F,&7
defb &10,&31

defb &F1
defb &E3
defb &F1
defb &73
defb &F1
defb &E4
defb &1
defb &40,&B3,&D2,&1E,&AD
defb &93
defb &F,&b
defb &CA
defb &4
defb &81
defb &C4
defb &41
defb &3
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &4
defb &81
defb &C8
defb &41
defb &2
defb &C3
defb &5
defb &81
defb &C2
defb &41
defb &4
defb &C9
defb &4
defb &C7
defb &F,&7
defb &10,&33
defb &D4
defb &20,&BB,&27
defb &D4
defb &20,&33,&B2

defb &91
defb &32
defb &72
defb &C1
defb &62
defb &41
defb &F,&c
defb &C8
defb &5
defb &81
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &5
defb &81
defb &C7
defb &41
defb &10,&80
defb &C3
defb &5
defb &81
defb &C3
defb &4
defb &81
defb &C7
defb &41
defb &3
defb &81
defb &C7
defb &F,&7
defb &20,&31,&FB

defb &C1
defb &E2
defb &1
defb &20,&13,&F9

defb &C1
defb &E2
defb &1
defb &10,&33
defb &62
defb &B2
defb &20,&37,&B4
defb &F,&d
defb &81
defb &C6
defb &41
defb &5
defb &81
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &5
defb &81
defb &C7
defb &41
defb &10,&80
defb &C3
defb &5
defb &81
defb &C3
defb &5
defb &C7
defb &4
defb &81
defb &C7
defb &F,&7
defb &10,&33

defb &D1
defb &C4
defb &51
defb &10,&89
defb &C4
defb &60,&33,&32,&A4,&CF,&17,&60
defb &F,&e
defb &C6
defb &7
defb &C3
defb &41
defb &4
defb &81
defb &C3
defb &2
defb &81
defb &C3
defb &6
defb &81
defb &C6
defb &2
defb &81
defb &C2
defb &41
defb &6
defb &C3
defb &5
defb &81
defb &C5
defb &41
defb &4
defb &81
defb &C7
defb &F,&7
defb &10,&31

defb &F1
defb &C4
defb &E1
defb &10,&C4
defb &C4
defb &10,&32

defb &F1
defb &2
defb &62
defb &B2
defb &11
defb &F,&12
defb &C2
defb &9
defb &10,&E0

defb &41
defb &6
defb &C2
defb &41
defb &3
defb &C2
defb &41
defb &7
defb &81
defb &C4
defb &41
defb &3
defb &C2
defb &7
defb &81
defb &10,&70
defb &6
defb &81
defb &C3
defb &41
defb &6
defb &C6
defb &41
defb &F,&7
defb &10,&33

defb &D1
defb &C5
defb &F1
defb &C5
defb &10,&33

defb &E1
defb &2
defb &81
defb &91
defb &32
defb &F,&7a
defb &10,&31

defb &F1
defb &C5
defb &F1
defb &C5
defb &10,&32

defb &F1
defb &3
defb &10,&78

defb &C1
defb &F,&7a
defb &10,&33

defb &D1
defb &C4
defb &E1
defb &10,&C5
defb &C4
defb &10,&33

defb &E1
defb &4
defb &C1
defb &41
defb &F,&7a
defb &10,&31

defb &F1
defb &C4
defb &51
defb &10,&88
defb &C4
defb &10,&32

defb &F1
defb &F,&80
defb &80,&22,&D1,&D0,&32,&1,&71,&70,&11

defb &A1
defb &F,&80
defb &10,&11

defb &A1
defb &83
defb &A1
defb &3
defb &D1
defb &83
defb &10,&22

defb &51
defb &F,&80
defb &10,&22

defb &51
defb &43
defb &20,&11,&13

defb &A1
defb &43
defb &10,&11

defb &A1
defb &F,&80
defb &10,&11

defb &A1
defb &83
defb &20,&99,&27

defb &A1
defb &83
defb &10,&22

defb &51
defb &F,&80
defb &10,&22

defb &51
defb &43
defb &51
defb &73
defb &A1
defb &43
defb &10,&11

defb &A1
defb &F,&80
defb &10,&11

defb &A1
defb &83
defb &F5
defb &83
defb &10,&22

defb &51
defb &F,&80
defb &10,&22
defb &5D
defb &1
defb &A1
defb &F,&80
defb &10,&11
defb &AD
defb &1
defb &51
defb &F,&80
defb &A1
defb &F,&0
defb &A1
defb &F,&80
defb &51
defb &F,&0
defb &51
defb &F,&80
defb &AF,&2
defb &F,&80
defb &5F,&2
defb &F,&7e
defb &A1
defb &FF,&4
defb &51
defb &F,&7c
defb &51
defb &3
defb &51
defb &F,&0
defb &A1
defb &F,&7b
defb &A1
defb &3
defb &A1
defb &20,&8,&81
defb &00,&5,&90
defb &20,&18,&45
defb &F,&7a
defb &51
defb &3
defb &51
defb &F,&2
defb &A1
defb &F,&79
defb &A1
defb &3
defb &30,&A2,&D0,&C
defb &00,&5,&C0
defb &20,&C,&6

defb &51
defb &F,&78
defb &51
defb &3
defb &51
defb &F,&4
defb &A1
defb &F,&77
defb &A1
defb &FF,&9
defb &10,&D5
defb &F,&76
defb &51
defb &1
defb &C2
defb &D1
defb &CF,&5
defb &10,&C4
defb &F,&76
defb &D1
defb &20,&C1,&D4
defb &F,&6
defb &D1
defb &F,&76
defb &D1
defb &3
defb &D1
defb &F,&6
defb &D1
defb &F,&76
defb &FF,&b
defb &D1
defb &F,&76
defb &CF,&c
defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&22
Pic0Loadingpng_rledataEnd: defb 0



Pic2Continuepng:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C000+0+80

LD IX,Pic2Continuepng_DrawOrder
JP JumpToNextLine


Pic2Continuepng_Line_0:
LD DE,&0000
jp MultiPushDeLast40


Pic2Continuepng_Line_1:
jp MultiPushDeLast40


Pic2Continuepng_Line_1_Reuse:
LD DE,&0000
JP Pic2Continuepng_Line_1
Pic2Continuepng_Line_37:
call MultiPushDe36
LD HL,&80F0
  Push HL
LD BC,&3C0F
  Push BC
 jp NextLinePushDe2


Pic2Continuepng_Line_38:
call MultiPushDe36
call BitmapPush6
defw BitmapData+5
 jp NextLinePushDe1


Pic2Continuepng_Line_39:
call MultiPushDe35
call BitmapPush8
defw BitmapData+13
 jp NextLinePushDe1


Pic2Continuepng_Line_40:
call MultiPushDe35
call BitmapPush8
defw BitmapData+21
 jp NextLinePushDe1


Pic2Continuepng_Line_41:
call MultiPushDe35
call BitmapPush8
defw BitmapData+29
 jp NextLinePushDe1


Pic2Continuepng_Line_42:
call MultiPushDe35
call BitmapPush8
defw BitmapData+37
 jp NextLinePushDe1


Pic2Continuepng_Line_43:
call MultiPushDe35
call BitmapPush8
defw BitmapData+45
 jp NextLinePushDe1


Pic2Continuepng_Line_44:
call MultiPushDe35
call BitmapPush8
defw BitmapData+53
 jp NextLinePushDe1


Pic2Continuepng_Line_45:
call MultiPushDe35
LD HL,&80A5
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0F07
  Push BC
LD HL,&0000
  jp NextLinePushHl 


Pic2Continuepng_Line_46:
LD DE,&0000
call MultiPushDe35
call BitmapPush8
defw BitmapData+61
 jp NextLinePushDe1


Pic2Continuepng_Line_47:
call MultiPushDe35
call BitmapPush8
defw BitmapData+69
 jp NextLinePushDe1


Pic2Continuepng_Line_48:
call MultiPushDe35
call BitmapPush8
defw BitmapData+77
 jp NextLinePushDe1


Pic2Continuepng_Line_49:
call MultiPushDe35
call BitmapPush8
defw BitmapData+85
 jp NextLinePushDe1


Pic2Continuepng_Line_50:
call MultiPushDe35
call BitmapPush8
defw BitmapData+93
 jp NextLinePushDe1


Pic2Continuepng_Line_51:
call MultiPushDe35
call BitmapPush6
defw BitmapData+99
 jp NextLinePushDe2


Pic2Continuepng_Line_52:
call MultiPushDe35
LD HL,&004E
  Push HL
LD BC,&FF5F
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_53:
call MultiPushDe28
LD HL,&005A
  Push HL
LD BC,&0F01
  Push BC
call MultiPushDe5
LD HL,&00AE
  Push HL
LD BC,&FFBF
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_54:
call MultiPushDe28
LD HL,&802D
  Push HL
LD BC,&AF03
  Push BC
call MultiPushDe5
LD HL,&00CE
  Push HL
LD BC,&FF7F
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_55:
call MultiPushDe28
LD HL,&481E
  Push HL
LD BC,&FF17
  Push BC
call MultiPushDe5
LD HL,&00EE
  Push HL
Ld C,&77
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_56:
call MultiPushDe28
LD HL,&848F
  Push HL
LD BC,&EF37
  Push BC
call MultiPushDe5
LD HL,&00EE
  Push HL
LD BC,&FF77
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_57:
call MultiPushDe28
LD HL,&480F
  Push HL
LD BC,&FF17
  Push BC
call MultiPushDe5
LD HL,&00EE
  Push HL
Ld C,&77
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_58:
call MultiPushDe28
LD HL,&A48F
  Push HL
LD BC,&EF37
  Push BC
call MultiPushDe5
LD HL,&00EE
  Push HL
LD BC,&FF77
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_59:
call MultiPushDe28
LD HL,&4A0F
  Push HL
LD BC,&5F17
  Push BC
call MultiPushDe5
LD HL,&00FF
  Push HL
LD BC,&FF77
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_60:
call MultiPushDe28
LD HL,&2C8F
  Push HL
LD BC,&AF07
  Push BC
call MultiPushDe5
LD HL,&00FF
  Push HL
LD BC,&FF13
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_61:
call MultiPushDe28
call BitmapPush8
defw BitmapData+107
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
LD BC,&FF23
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_62:
call MultiPushDe28
call BitmapPush8
defw BitmapData+115
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&08FF
  Push HL
LD BC,&7F13
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_63:
call MultiPushDe28
call BitmapPush8
defw BitmapData+123
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&88EF
  Push HL
LD BC,&FF01
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_64:
call MultiPushDe28
call BitmapPush10
defw BitmapData+133
  PUSH DE
  PUSH DE
LD HL,&08DF
  Push HL
LD BC,&7F11
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_65:
call MultiPushDe28
call BitmapPush12
defw BitmapData+145
  PUSH DE
LD HL,&8CAF
  Push HL
LD BC,&BF01
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_66:
call MultiPushDe28
call BitmapPush12
defw BitmapData+157
  PUSH DE
LD HL,&485F
  Push HL
Ld B,L
Ld C,E

  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_67:
call MultiPushDe28
call BitmapPush12
defw BitmapData+169
  PUSH DE
LD HL,&84AF
  Push HL
LD BC,&2700
  Push BC
 jp NextLinePushDe3


Pic2Continuepng_Line_68:
call MultiPushDe23
LD HL,&0060
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+187
  PUSH DE
  PUSH DE
LD BC,&0011
 jp NextLinePushBC 


Pic2Continuepng_Line_69:
call MultiPushDe23
LD HL,&0070
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+205
  PUSH DE
  PUSH DE
LD BC,&0011
 jp NextLinePushBC 


Pic2Continuepng_Line_70:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe19
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+215
  PUSH DE
call BitmapPush6
defw BitmapData+221
  PUSH DE
  PUSH DE
LD HL,&0033
  jp NextLinePushHl 


Pic2Continuepng_Line_71:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C010
  Push HL
call MultiPushDe19
LD BC,&00E0
  Push BC
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+239
  PUSH DE
  PUSH DE
LD BC,&0022
 jp NextLinePushBC 


Pic2Continuepng_Line_72:
  PUSH DE
LD HL,&00C0
  Push HL
  PUSH DE
LD BC,&C010
  Push BC
call MultiPushDe19
call BitmapPush6
defw BitmapData+245
  PUSH DE
  PUSH DE
LD DE,&B4A5
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+259
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0022
  jp NextLinePushHl 


Pic2Continuepng_Line_73:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&C010
  Push BC
call MultiPushDe6
call BitmapPush6
defw BitmapData+265
call MultiPushDe10
call BitmapPush8
defw BitmapData+273
  PUSH DE
LD HL,&685A
  Push HL
LD BC,&7810
  Push BC
  PUSH DE
LD HL,&0007
  Push HL
LD BC,&0800
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+279
  PUSH DE
LD HL,&2200
  Push HL
LD BC,&4466
 jp NextLinePushBC 


Pic2Continuepng_Line_74:
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
LD BC,&C010
  Push BC
call MultiPushDe6
call BitmapPush6
defw BitmapData+285
call MultiPushDe10
call BitmapPush8
defw BitmapData+293
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&3000
  Push BC
  PUSH DE
LD DE,&0801
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+307


Pic2Continuepng_Line_75:
call BitmapPush8
defw BitmapData+315
LD DE,&0000
call MultiPushDe6
call BitmapPush6
defw BitmapData+321
call MultiPushDe11
LD HL,&F000
  Push HL
LD BC,&80F0
  Push BC
  PUSH DE
  PUSH DE
  Push BC
Ld H,&10
  Push HL
  PUSH DE
LD BC,&0600
  Push BC
  PUSH DE
LD HL,&AF17
  Push HL
  PUSH DE
Ld E,&01
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+327


Pic2Continuepng_Line_76:
call BitmapPush8
defw BitmapData+335
Ld E,&00
call MultiPushDe6
call BitmapPush6
defw BitmapData+341
call MultiPushDe11
LD HL,&E000
  Push HL
LD BC,&C070
  Push BC
  PUSH DE
  PUSH DE
Ld H,&11
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+347
  PUSH DE
LD BC,&0801
  Push BC
Ld H,E
Ld L,C

  Push HL
  PUSH DE
LD BC,&2200
  Push BC
Ld L,&66
  jp NextLinePushHl 


Pic2Continuepng_Line_77:
  PUSH DE
call BitmapPush6
defw BitmapData+353
call MultiPushDe6
LD HL,&E030
  Push HL
  PUSH DE
LD BC,&E010
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
call MultiPushDe8
LD HL,&C010
  Push HL
Ld C,&30
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0801
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&05
  Push HL
  Push BC
  PUSH DE
LD BC,&2211
  Push BC
LD HL,&0066
  jp NextLinePushHl 


Pic2Continuepng_Line_78:
  PUSH DE
call BitmapPush8
defw BitmapData+361
  PUSH DE
LD HL,&C070
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+367
  PUSH DE
LD BC,&E010
  Push BC
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
call MultiPushDe6
call BitmapPush8
defw BitmapData+375
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0007
  Push HL
LD BC,&0003
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+381
  PUSH DE
LD HL,&EE44
  Push HL
LD BC,&2266
 jp NextLinePushBC 


Pic2Continuepng_Line_79:
  PUSH DE
call BitmapPush8
defw BitmapData+389
  PUSH DE
call BitmapPush10
defw BitmapData+399
  PUSH DE
LD HL,&E010
  Push HL
  PUSH DE
  PUSH DE
LD BC,&F0F0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+409
  PUSH DE
  PUSH DE
LD BC,&1100
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&EF01
  Push BC
  PUSH DE
LD HL,&0813
  Push HL
  PUSH DE
LD BC,&0600
  Push BC
  PUSH DE
LD HL,&6600
  Push HL
LD BC,&5522
 jp NextLinePushBC 


Pic2Continuepng_Line_80:
  PUSH DE
call BitmapPush8
defw BitmapData+417
  PUSH DE
call BitmapPush6
defw BitmapData+423
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
defw BitmapData+439
  PUSH DE
LD BC,&0088
  Push BC
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+447
  PUSH DE
LD BC,&0300
  Push BC
  PUSH DE
LD HL,&6600
  Push HL
LD BC,&8844
 jp NextLinePushBC 


Pic2Continuepng_Line_81:
  PUSH DE
call BitmapPush8
defw BitmapData+455
  PUSH DE
call BitmapPush6
defw BitmapData+461
Ld D,&F0
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
call BitmapPush12
defw BitmapData+473
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+485
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0208
  Push BC
  Push HL 
  PUSH DE
Ld H,&66
  Push HL
LD BC,&2222
 jp NextLinePushBC 


Pic2Continuepng_Line_82:
  PUSH DE
call BitmapPush8
defw BitmapData+493
  PUSH DE
call BitmapPush10
defw BitmapData+503
  PUSH DE
LD HL,&C010
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+525
  PUSH DE
call BitmapPush6
defw BitmapData+531
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+539
  PUSH DE
  PUSH DE
LD BC,&6600
  Push BC
LD HL,&2200
  jp NextLinePushHl 


Pic2Continuepng_Line_83:
  PUSH DE
call BitmapPush8
defw BitmapData+547
  PUSH DE
call BitmapPush10
defw BitmapData+557
  PUSH DE
LD HL,&C010
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+563
Ld E,&80
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+573
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+581
  PUSH DE
call BitmapPush8
defw BitmapData+589
  PUSH DE
  PUSH DE
LD BC,&7700
  Push BC
LD HL,&0022
  jp NextLinePushHl 


Pic2Continuepng_Line_84:
  PUSH DE
call BitmapPush20
defw BitmapData+609
  PUSH DE
LD HL,&C030
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+615
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+625
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,B


  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+633
  PUSH DE
call FinalBitmapPush6
defw BitmapData+639


Pic2Continuepng_Line_85:
  PUSH DE
call BitmapPush20
defw BitmapData+659
  PUSH DE
LD HL,&C030
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+665
  PUSH DE
  PUSH DE
LD BC,&F000
  Push BC
LD HL,&C010
  Push HL
Ld E,&70
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC

Ld E,B

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+673
  PUSH DE
call BitmapPush8
defw BitmapData+681
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
Ld B,E
Ld C,H

 jp NextLinePushBC 


Pic2Continuepng_Line_86:
  PUSH DE
call BitmapPush14
defw BitmapData+695
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
defw BitmapData+703
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
LD HL,&C010
  Push HL
Ld E,&70
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+733
LD BC,&0011
 jp NextLinePushBC 


Pic2Continuepng_Line_87:
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+753
  PUSH DE
call BitmapPush8
defw BitmapData+761
  PUSH DE
call BitmapPush6
defw BitmapData+767
Ld E,&70
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+797
LD HL,&8800
  jp NextLinePushHl 


Pic2Continuepng_Line_88:
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+819
  PUSH DE
call BitmapPush8
defw BitmapData+827
  PUSH DE
call BitmapPush14
defw BitmapData+841
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+859
  PUSH DE
LD HL,&4400
  Push HL
LD BC,&0011
 jp NextLinePushBC 


Pic2Continuepng_Line_89:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+865
LD DE,&F070
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+895
call BitmapPush10
defw BitmapData+905
LD DE,&0088
  PUSH DE
  PUSH DE
call FinalBitmapPush22
defw BitmapData+927


Pic2Continuepng_Line_90:
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+943
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&F030
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+951
  PUSH DE
call BitmapPush14
defw BitmapData+965
  PUSH DE
  PUSH DE
call FinalBitmapPush24
defw BitmapData+989


Pic2Continuepng_Line_91:
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+1011
  PUSH DE
call BitmapPush8
defw BitmapData+1019
  PUSH DE
call BitmapPush14
defw BitmapData+1033
  PUSH DE
LD HL,&0088
  Push HL
  PUSH DE
call FinalBitmapPush22
defw BitmapData+1055


Pic2Continuepng_Line_92:
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+1077
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+1087
  PUSH DE
call BitmapPush6
defw BitmapData+1093
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1103
LD DE,&5FDF
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1113


Pic2Continuepng_Line_93:
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1121
  PUSH DE
LD HL,&E010
  Push HL
  PUSH DE
LD BC,&00C0
  Push BC
LD HL,&1000
  Push HL
  PUSH DE
LD BC,&E010
  Push BC
LD HL,&0060
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0070
  Push BC
  PUSH DE
LD HL,&3000
  Push HL
  PUSH DE
LD BC,&F000
  Push BC
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
Ld B,&10
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+1133
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1139
LD DE,&8800
 jp NextLinePushDe2


Pic2Continuepng_Line_94:
Ld D,E
call MultiPushDe9
LD HL,&00C0
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
Ld L,&60
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&20
  Push BC
  PUSH DE
LD HL,&7000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&80
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1151
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1161


Pic2Continuepng_Line_95:
INC DE

call MultiPushDe9
LD HL,&00E0
  Push HL
LD BC,&0060
  Push BC
call MultiPushDe8
Ld H,C
Ld L,E

  Push HL
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1185


Pic2Continuepng_Line_96:
call MultiPushDe9
Ld E,&60
  PUSH DE
  PUSH DE
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1209


Pic2Continuepng_Line_97:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1215
  PUSH DE
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe8
LD BC,&2222
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+1223
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1231


Pic2Continuepng_Line_98:
INC DE

call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00E0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1239
  PUSH DE
LD HL,&C000
  Push HL
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1263


Pic2Continuepng_Line_99:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
Ld L,&30
  Push HL
  Push BC
call BitmapPush12
defw BitmapData+1275
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1299


Pic2Continuepng_Line_100:
call MultiPushDe9
call BitmapPush22
defw BitmapData+1321
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1345


Pic2Continuepng_Line_101:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+1361
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1385


Pic2Continuepng_Line_102:
call MultiPushDe9
LD HL,&0060
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+1401
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1425


Pic2Continuepng_Line_103:
call MultiPushDe9
LD HL,&0060
  Push HL
  PUSH DE
call BitmapPush18
defw BitmapData+1443
call MultiPushDe8
call FinalBitmapPush24
defw BitmapData+1467


Pic2Continuepng_Line_104:
call MultiPushDe9
call BitmapPush22
defw BitmapData+1489
call MultiPushDe8
call BitmapPush22
defw BitmapData+1511
 jp NextLinePushDe1


Pic2Continuepng_Line_105:
call MultiPushDe9
call BitmapPush10
defw BitmapData+1521
  PUSH DE
call BitmapPush10
defw BitmapData+1531
call MultiPushDe8
call BitmapPush22
defw BitmapData+1553
 jp NextLinePushDe1


Pic2Continuepng_Line_106:
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
call BitmapPush8
defw BitmapData+1561
call MultiPushDe8
call BitmapPush22
defw BitmapData+1583
 jp NextLinePushDe1


Pic2Continuepng_Line_107:
call MultiPushDe10
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
LD BC,&8070
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&3000
  Push BC
call MultiPushDe8
call BitmapPush22
defw BitmapData+1605
 jp NextLinePushDe1


Pic2Continuepng_Line_108:
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
call MultiPushDe8
call BitmapPush22
defw BitmapData+1627
 jp NextLinePushDe1


Pic2Continuepng_Line_109:
call MultiPushDe16
LD HL,&2080
  Push HL
call MultiPushDe11
call BitmapPush22
defw BitmapData+1649
 jp NextLinePushDe1


Pic2Continuepng_Line_110:
call MultiPushDe16
LD HL,&60E0
  Push HL
call MultiPushDe11
call BitmapPush22
defw BitmapData+1671
 jp NextLinePushDe1


Pic2Continuepng_Line_111:
call MultiPushDe16
LD HL,&C070
  Push HL
call MultiPushDe12
LD BC,&6600
  Push BC
Ld E,&C0
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+1687


Pic2Continuepng_Line_112:
Ld E,&00
call MultiPushDe28
call BitmapPush22
defw BitmapData+1709
 jp NextLinePushDe1


Pic2Continuepng_Line_113:
call MultiPushDe29
call BitmapPush16
defw BitmapData+1725
 jp NextLinePushDe3


Pic2Continuepng_Line_114:
call MultiPushDe29
call BitmapPush16
defw BitmapData+1741
 jp NextLinePushDe3


Pic2Continuepng_Line_115:
call MultiPushDe29
call BitmapPush18
defw BitmapData+1759
 jp NextLinePushDe2


Pic2Continuepng_Line_116:
call MultiPushDe29
LD HL,&2280
  Push HL
Ld D,&10
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1771
Ld D,E
 jp NextLinePushDe2


Pic2Continuepng_Line_117:
call MultiPushDe29
call BitmapPush12
defw BitmapData+1783
  PUSH DE
call BitmapPush6
defw BitmapData+1789
 jp NextLinePushDe1


Pic2Continuepng_Line_118:
call MultiPushDe29
call BitmapPush18
defw BitmapData+1807
 jp NextLinePushDe2


Pic2Continuepng_Line_119:
call MultiPushDe29
call BitmapPush12
defw BitmapData+1819
  PUSH DE
LD HL,&8090
  Push HL
LD BC,&D000
  Push BC
 jp NextLinePushDe2


Pic2Continuepng_Line_120:
call MultiPushDe29
call BitmapPush18
defw BitmapData+1837
 jp NextLinePushDe2


Pic2Continuepng_Line_121:
call MultiPushDe29
call BitmapPush18
defw BitmapData+1855
 jp NextLinePushDe2


Pic2Continuepng_Line_122:
call MultiPushDe29
call BitmapPush16
defw BitmapData+1871
  PUSH DE
LD HL,&3200
  Push HL
 jp NextLinePushDe1


Pic2Continuepng_Line_123:
call MultiPushDe29
call BitmapPush16
defw BitmapData+1887
  PUSH DE
LD HL,&E800
  Push HL
 jp NextLinePushDe1


Pic2Continuepng_Line_124:
call MultiPushDe29
call BitmapPush14
defw BitmapData+1901
  PUSH DE
LD HL,&7400
  Push HL
LD BC,&8070
  Push BC
 jp NextLinePushDe1


Pic2Continuepng_Line_125:
call MultiPushDe29
call BitmapPush14
defw BitmapData+1915
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1921


Pic2Continuepng_Line_126:
call MultiPushDe28
call BitmapPush16
defw BitmapData+1937
  PUSH DE
LD HL,&0064
  Push HL
 jp NextLinePushDe2


Pic2Continuepng_Line_127:
call MultiPushDe29
call BitmapPush18
defw BitmapData+1955
 jp NextLinePushDe2


Pic2Continuepng_Line_128:
call MultiPushDe29
call BitmapPush18
defw BitmapData+1973
 jp NextLinePushDe2


Pic2Continuepng_Line_129:
call MultiPushDe29
call BitmapPush20
defw BitmapData+1993
 jp NextLinePushDe1


Pic2Continuepng_Line_130:
call MultiPushDe29
call BitmapPush6
defw BitmapData+1999
  PUSH DE
call BitmapPush12
defw BitmapData+2011
 jp NextLinePushDe1


Pic2Continuepng_Line_131:
call MultiPushDe29
LD HL,&8000
  Push HL
  PUSH DE
LD BC,&7000
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2017
 jp NextLinePushDe3


Pic2Continuepng_Line_132:
call MultiPushDe34
LD HL,&0030
  Push HL
  PUSH DE
LD BC,&0064
  Push BC
 jp NextLinePushDe3



Pic2Continuepng_DrawOrder: 

  DEFW Pic2Continuepng_Line_0
  DEFW Pic2Continuepng_Line_1
defw looper
  DEFB 1,35
  DEFW Pic2Continuepng_Line_1_Reuse
  DEFW Pic2Continuepng_Line_37
  DEFW Pic2Continuepng_Line_38
  DEFW Pic2Continuepng_Line_39
  DEFW Pic2Continuepng_Line_40
  DEFW Pic2Continuepng_Line_41
  DEFW Pic2Continuepng_Line_42
  DEFW Pic2Continuepng_Line_43
  DEFW Pic2Continuepng_Line_44
  DEFW Pic2Continuepng_Line_45
  DEFW Pic2Continuepng_Line_46
  DEFW Pic2Continuepng_Line_47
  DEFW Pic2Continuepng_Line_48
  DEFW Pic2Continuepng_Line_49
  DEFW Pic2Continuepng_Line_50
  DEFW Pic2Continuepng_Line_51
  DEFW Pic2Continuepng_Line_52
  DEFW Pic2Continuepng_Line_53
  DEFW Pic2Continuepng_Line_54
  DEFW Pic2Continuepng_Line_55
  DEFW Pic2Continuepng_Line_56
  DEFW Pic2Continuepng_Line_57
  DEFW Pic2Continuepng_Line_58
  DEFW Pic2Continuepng_Line_59
  DEFW Pic2Continuepng_Line_60
  DEFW Pic2Continuepng_Line_61
  DEFW Pic2Continuepng_Line_62
  DEFW Pic2Continuepng_Line_63
  DEFW Pic2Continuepng_Line_64
  DEFW Pic2Continuepng_Line_65
  DEFW Pic2Continuepng_Line_66
  DEFW Pic2Continuepng_Line_67
  DEFW Pic2Continuepng_Line_68
  DEFW Pic2Continuepng_Line_69
  DEFW Pic2Continuepng_Line_70
  DEFW Pic2Continuepng_Line_71
  DEFW Pic2Continuepng_Line_72
  DEFW Pic2Continuepng_Line_73
  DEFW Pic2Continuepng_Line_74
  DEFW Pic2Continuepng_Line_75
  DEFW Pic2Continuepng_Line_76
  DEFW Pic2Continuepng_Line_77
  DEFW Pic2Continuepng_Line_78
  DEFW Pic2Continuepng_Line_79
  DEFW Pic2Continuepng_Line_80
  DEFW Pic2Continuepng_Line_81
  DEFW Pic2Continuepng_Line_82
  DEFW Pic2Continuepng_Line_83
  DEFW Pic2Continuepng_Line_84
  DEFW Pic2Continuepng_Line_85
  DEFW Pic2Continuepng_Line_86
  DEFW Pic2Continuepng_Line_87
  DEFW Pic2Continuepng_Line_88
  DEFW Pic2Continuepng_Line_89
  DEFW Pic2Continuepng_Line_90
  DEFW Pic2Continuepng_Line_91
  DEFW Pic2Continuepng_Line_92
  DEFW Pic2Continuepng_Line_93
  DEFW Pic2Continuepng_Line_94
  DEFW Pic2Continuepng_Line_95
  DEFW Pic2Continuepng_Line_96
  DEFW Pic2Continuepng_Line_97
  DEFW Pic2Continuepng_Line_98
  DEFW Pic2Continuepng_Line_99
  DEFW Pic2Continuepng_Line_100
  DEFW Pic2Continuepng_Line_101
  DEFW Pic2Continuepng_Line_102
  DEFW Pic2Continuepng_Line_103
  DEFW Pic2Continuepng_Line_104
  DEFW Pic2Continuepng_Line_105
  DEFW Pic2Continuepng_Line_106
  DEFW Pic2Continuepng_Line_107
  DEFW Pic2Continuepng_Line_108
  DEFW Pic2Continuepng_Line_109
  DEFW Pic2Continuepng_Line_110
  DEFW Pic2Continuepng_Line_111
  DEFW Pic2Continuepng_Line_112
  DEFW Pic2Continuepng_Line_113
  DEFW Pic2Continuepng_Line_114
  DEFW Pic2Continuepng_Line_115
  DEFW Pic2Continuepng_Line_116
  DEFW Pic2Continuepng_Line_117
  DEFW Pic2Continuepng_Line_118
  DEFW Pic2Continuepng_Line_119
  DEFW Pic2Continuepng_Line_120
  DEFW Pic2Continuepng_Line_121
  DEFW Pic2Continuepng_Line_122
  DEFW Pic2Continuepng_Line_123
  DEFW Pic2Continuepng_Line_124
  DEFW Pic2Continuepng_Line_125
  DEFW Pic2Continuepng_Line_126
  DEFW Pic2Continuepng_Line_127
  DEFW Pic2Continuepng_Line_128
  DEFW Pic2Continuepng_Line_129
  DEFW Pic2Continuepng_Line_130
  DEFW Pic2Continuepng_Line_131
  DEFW Pic2Continuepng_Line_132
defw looper
  DEFB 1,67
  DEFW Pic2Continuepng_Line_1_Reuse
  DEFW EndCode



PicSetDisk3PNG:
ret
ifdef DiskImage
ld hl,PicSetDisk3PNG_rledata-1
ld de,PicSetDisk3PNG_rledataEnd-1
ld b,0
ld ixh,80
ld IXL,79
di
exx 
push bc
exx
jp RLE_Draw
PicSetDisk3PNG_rledata:

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
PicSetDisk3PNG_rledataEnd: defb 0

endif





;Global Code
RLE_ImageWidth equ 38
RLE_Draw:
  		ld a,ixh
		ld (ImageWidthA_Plus1-1),a
		ld (ImageWidthC_Plus1-1),a
		ld (ImageWidthE_Plus1-1),a
		push de
		push hl
			ld hl,&0050
			ld d,h
			ld e,a
			add hl,de
			ld (ImageWidthB_Plus2-2),hl
			ld (ImageWidthD_Plus2-2),hl		
		pop hl
		pop de	



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

RLE_NextScreenLineHL:
	push de
				ld b,RLE_ImageWidth :ImageWidthE_Plus1
		ld de,&0050+RLE_ImageWidth :ImageWidthD_Plus2
		add hl,de
	pop de
;	ret nc
;	push de
;		ld de,&c050
;		add hl,de
;	pop de
	ret

RLE_NextScreenLine:
	push hl
		ld iyl,RLE_ImageWidth :ImageWidthC_Plus1
		ld hl,&0050+RLE_ImageWidth :ImageWidthB_Plus2
		add hl,de
		ex hl,de
	pop hl
;	ret nc
;	push hl
;		ld hl,&c050
;		add hl,de
;		ex hl,de
;	pop hl
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

ret





EndCode:
ld sp,&0000:StackRestore_Plus2
ret

MultiPushDeLast40: ld HL,NextLine
jp MultiPushDe40B 
MultiPushDe40: pop HL
jp MultiPushDe40B 
MultiPushDe36: pop HL
jp MultiPushDe36B 
MultiPushDe35: pop HL
jp MultiPushDe35B 
MultiPushDe34: pop HL
jp MultiPushDe34B 
MultiPushDe29: pop HL
jr MultiPushDe29B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe23: pop HL
jr MultiPushDe23B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDe11: pop HL
jr MultiPushDe11B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
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

BitmapPush30: ld b,&0F
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

finalBitmapPush24: ld b,&0C
jr finalBitmapPush

finalBitmapPush22: ld b,&0B
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
ld hl,&0050+80
add hl,sp
ld sp,hl
;jp nc,JumpToNextLine
;ld hl,&c050
;add hl,sp
;ld sp,hl

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

defb &00,&07,&0F,&0F,&1E,&F0,&01,&AF,&AF,&AF
defb &0F,&B4,&80,&00,&17,&5F,&5F,&5F,&0F,&5A
defb &C0,&00,&27,&FF,&EF,&AF,&8F,&2D,&E0,&00
defb &17,&7F,&FF,&5F,&0F,&1E,&78,&00,&07,&AF
defb &AF,&AF,&0F,&0F,&B4,&00,&07,&5F,&5F,&0F
defb &0F,&0F,&5A,&00,&52,&0F,&0F,&0F,&0F,&1E
defb &5A,&80,&21,&87,&0F,&0F,&2D,&A5,&A5,&80
defb &10,&4B,&0F,&5A,&5A,&5A,&5A,&80,&00,&A5
defb &A5,&A5,&F0,&E1,&B4,&80,&00,&12,&5A,&5A
defb &5F,&7C,&F0,&80,&00,&10,&AF,&EF,&F8,&00
defb &00,&77,&88,&00,&03,&5F,&0F,&5A,&00,&FF
defb &EE,&00,&03,&0F,&0F,&2D,&11,&FF,&FF,&88
defb &03,&0F,&0F,&5A,&67,&00,&37,&FF,&FF,&EE
defb &30,&87,&0F,&3C,&00,&01,&0C,&1E,&5F,&FF
defb &FF,&FF,&DF,&69,&0F,&5A,&00,&0E,&00,&16
defb &A7,&FF,&FF,&FF,&AF,&BE,&0F,&3C,&17,&00
defb &00,&12,&5B,&7F,&FF,&FF,&5F,&5F,&87,&5A
defb &00,&57,&5E,&48,&01,&6F,&08,&00,&00,&03
defb &A5,&BF,&FF,&EF,&AF,&AF,&87,&B4,&01,&27
defb &AD,&A4,&02,&00,&2F,&08,&00,&01,&5A,&5F
defb &FF,&5F,&5E,&5A,&96,&5A,&04,&00,&69,&80
defb &EF,&AF,&A5,&A5,&A5,&B4,&01,&53,&5A,&4A
defb &04,&00,&01,&69,&A5,&E1,&08,&00,&01,&CF
defb &88,&00,&5A,&00,&11,&5A,&5A,&5A,&D2,&5A
defb &E0,&00,&00,&10,&C0,&00,&01,&34,&78,&86
defb &00,&00,&02,&00,&00,&00,&24,&00,&00,&01
defb &00,&70,&F0,&F0,&E0,&00,&00,&10,&F0,&00
defb &00,&30,&C0,&00,&23,&12,&C3,&08,&00,&06
defb &00,&F0,&F0,&F0,&F0,&80,&00,&10,&F0,&00
defb &00,&70,&80,&00,&66,&00,&00,&22,&00,&00
defb &33,&01,&0F,&00,&00,&01,&0C,&00,&10,&C0
defb &00,&00,&E0,&00,&00,&00,&00,&F0,&F0,&F0
defb &F0,&C0,&66,&44,&00,&22,&00,&00,&30,&80
defb &00,&00,&E0,&00,&00,&00,&00,&E0,&00,&30
defb &F0,&E0,&00,&01,&0C,&00,&00,&0E,&30,&80
defb &00,&10,&C0,&00,&00,&F0,&B0,&80,&00,&10
defb &C0,&00,&00,&F0,&00,&10,&E0,&00,&10,&F0
defb &30,&C0,&00,&30,&80,&00,&00,&08,&00,&11
defb &0C,&00,&10,&F0,&F0,&80,&00,&10,&C0,&00
defb &00,&F0,&00,&30,&F0,&00,&00,&10,&F0,&E0
defb &00,&F0,&F0,&80,&00,&70,&E0,&00,&10,&E0
defb &30,&D0,&F0,&80,&00,&10,&C0,&00,&F0,&00
defb &00,&30,&D0,&E0,&00,&F0,&F0,&80,&00,&F0
defb &F0,&90,&F0,&F0,&00,&10,&80,&00,&E0,&00
defb &00,&07,&8C,&11,&8E,&01,&08,&00,&30,&80
defb &F0,&80,&00,&30,&80,&00,&30,&00,&00,&70
defb &80,&E0,&00,&30,&80,&00,&C0,&00,&20,&00
defb &70,&90,&C0,&F0,&00,&11,&88,&00,&00,&00
defb &00,&70,&F0,&00,&10,&E0,&70,&00,&F0,&00
defb &00,&30,&80,&00,&00,&F0,&00,&E0,&70,&00
defb &00,&70,&00,&E0,&00,&30,&E0,&00,&30,&C0
defb &30,&F0,&E0,&F0,&00,&30,&80,&00,&C0,&00
defb &70,&10,&F0,&F0,&D0,&E0,&00,&22,&00,&11
defb &88,&00,&0C,&33,&08,&00,&00,&03,&00,&06
defb &F0,&00,&70,&00,&00,&30,&80,&00,&10,&F0
defb &10,&C0,&E0,&00,&00,&E0,&10,&E0,&70,&30
defb &F0,&B0,&B0,&E0,&E0,&00,&30,&80,&30,&00
defb &00,&E0,&00,&70,&00,&11,&00,&22,&00,&11
defb &88,&00,&06,&04,&0C,&52,&5A,&48,&0E,&04
defb &10,&E0,&10,&D0,&C0,&00,&10,&C0,&10,&E0
defb &00,&10,&E0,&00,&70,&00,&00,&30,&80,&00
defb &70,&70,&C0,&30,&F0,&C0,&E0,&00,&30,&80
defb &70,&00,&10,&E0,&00,&70,&03,&08,&00,&0F
defb &0F,&A5,&00,&04,&11,&11,&00,&44,&88,&00
defb &30,&C0,&10,&F0,&80,&00,&30,&C0,&10,&C0
defb &00,&30,&C0,&00,&F0,&00,&00,&30,&80,&00
defb &70,&F0,&80,&30,&F0,&80,&00,&11,&00,&22
defb &00,&88,&88,&00,&01,&00,&03,&0F,&0F,&1E
defb &48,&07,&70,&80,&10,&C0,&00,&30,&C0,&10
defb &F0,&00,&00,&30,&80,&00,&70,&F0,&00,&30
defb &F0,&00,&10,&00,&88,&44,&22,&00,&00,&00
defb &06,&00,&1F,&5F,&5F,&08,&A4,&01,&8E,&00
defb &00,&00,&00,&22,&11,&00,&88,&00,&00,&00
defb &00,&10,&E0,&00,&30,&80,&00,&70,&F0,&00
defb &10,&E0,&00,&10,&F0,&80,&30,&E0,&00,&70
defb &80,&10,&D0,&80,&70,&E0,&00,&30,&C0,&00
defb &30,&80,&10,&C0,&30,&F0,&80,&00,&00,&22
defb &00,&88,&00,&11,&08,&03,&AF,&AF,&AF,&70
defb &16,&00,&11,&CE,&00,&11,&66,&22,&44,&00
defb &88,&00,&00,&00,&00,&10,&C0,&00,&30,&80
defb &10,&F0,&C0,&00,&10,&80,&00,&30,&F0,&80
defb &70,&E0,&10,&F0,&80,&30,&90,&80,&10,&00
defb &70,&C0,&00,&30,&80,&00,&70,&80,&00,&10
defb &C0,&00,&60,&00,&F0,&00,&10,&80,&70,&F0
defb &80,&20,&00,&02,&00,&1F,&7F,&DF,&4E,&F0
defb &07,&84,&00,&01,&6E,&00,&00,&22,&11,&11
defb &80,&70,&10,&80,&30,&80,&10,&80,&F0,&30
defb &C0,&E0,&00,&00,&70,&80,&00,&30,&C0,&00
defb &F0,&00,&00,&00,&30,&80,&F0,&F0,&80,&00
defb &10,&C0,&00,&F0,&30,&00,&00,&00,&00,&10
defb &C0,&00,&60,&10,&E0,&00,&00,&88,&88,&22
defb &11,&00,&11,&0E,&01,&AF,&FF,&AF,&9C,&B0
defb &45,&5A,&08,&10,&81,&00,&00,&EE,&10,&E0
defb &70,&E0,&30,&10,&E0,&F0,&F0,&30,&10,&E0
defb &10,&80,&70,&A0,&70,&00,&00,&30,&E0,&70
defb &C0,&00,&00,&10,&C0,&00,&70,&70,&C0,&00
defb &10,&F0,&E0,&30,&F0,&C0,&11,&88,&00,&44
defb &11,&00,&23,&08,&13,&5F,&FF,&88,&10,&60
defb &11,&2D,&80,&10,&80,&1D,&00,&77,&22,&11
defb &30,&F0,&F0,&00,&00,&30,&00,&F0,&F0,&C0
defb &30,&F0,&C0,&70,&E0,&30,&F0,&C0,&10,&D0
defb &F0,&70,&70,&00,&00,&10,&F0,&F0,&80,&00
defb &00,&10,&C0,&00,&70,&F0,&80,&00,&10,&F0
defb &C0,&10,&F0,&80,&00,&88,&88,&88,&22,&44
defb &04,&00,&27,&BF,&EE,&33,&AE,&00,&27,&9E
defb &5A,&38,&F0,&82,&00,&66,&30,&F0,&C0,&00
defb &00,&10,&80,&70,&F0,&00,&30,&F0,&80,&00
defb &00,&30,&F0,&80,&00,&F0,&E0,&70,&10,&F0
defb &80,&00,&00,&10,&C0,&00,&70,&00,&00,&10
defb &C0,&00,&30,&E0,&7F,&4F,&A5,&B4,&F0,&02
defb &00,&44,&00,&11,&00,&88,&00,&44,&00,&00
defb &08,&00,&5F,&7F,&00,&10,&F0,&00,&00,&70
defb &C0,&20,&FF,&AF,&08,&10,&92,&4A,&00,&66
defb &22,&00,&80,&00,&44,&23,&00,&01,&AF,&FF
defb &FF,&DF,&08,&10,&A5,&84,&00,&22,&00,&11
defb &80,&00,&00,&CC,&88,&44,&00,&03,&08,&01
defb &5F,&FF,&00,&88,&00,&CC,&44,&06,&00,&03
defb &BF,&FF,&FF,&FF,&F7,&FF,&FF,&EF,&8C,&00
defb &5A,&4C,&88,&00,&22,&22,&00,&DD,&11,&88
defb &00,&03,&08,&13,&7F,&FF,&FF,&FF,&FB,&FF
defb &FF,&FF,&4E,&01,&A7,&8C,&88,&22,&00,&55
defb &00,&60,&00,&30,&E0,&00,&F7,&FF,&FF,&FF
defb &AF,&10,&5F,&EE,&00,&CC,&00,&88,&88,&52
defb &08,&27,&E0,&00,&00,&E0,&00,&60,&60,&00
defb &00,&EE,&11,&88,&00,&AD,&84,&17,&CC,&FF
defb &88,&FF,&F7,&FF,&FF,&11,&CF,&00,&3F,&EE
defb &44,&22,&00,&66,&00,&C0,&00,&10,&B0,&00
defb &10,&B0,&00,&E0,&60,&00,&00,&EE,&00,&99
defb &00,&5E,&0E,&37,&88,&77,&00,&77,&EE,&33
defb &CC,&11,&EF,&08,&77,&EE,&00,&44,&22,&22
defb &00,&C0,&00,&30,&10,&00,&30,&30,&00,&C0
defb &E0,&10,&C0,&00,&30,&30,&80,&00,&C0,&00
defb &60,&00,&00,&66,&11,&88,&01,&AF,&83,&5F
defb &88,&22,&00,&77,&EE,&11,&88,&11,&FF,&0C
defb &77,&EE,&44,&22,&00,&66,&00,&C0,&00,&20
defb &30,&00,&20,&30,&10,&80,&F0,&30,&C0,&00
defb &B0,&70,&00,&22,&00,&AA,&11,&5F,&61,&FF
defb &CC,&42,&42,&FF,&EE,&00,&42,&33,&FF,&CE
defb &77,&E0,&00,&44,&00,&22,&00,&C0,&00,&60
defb &30,&00,&E0,&30,&10,&90,&F0,&E0,&80,&10
defb &E0,&F0,&00,&33,&11,&88,&01,&AF,&53,&9F
defb &EE,&24,&F5,&FF,&FF,&00,&F5,&77,&FF,&AF
defb &74,&E0,&00,&22,&00,&66,&00,&C0,&00,&60
defb &70,&B0,&E0,&70,&10,&30,&F0,&C0,&80,&30
defb &70,&D0,&80,&00,&00,&22,&55,&88,&10,&F0
defb &27,&BF,&FF,&72,&D9,&FF,&FF,&DC,&18,&3B
defb &FF,&AF,&70,&C2,&00,&66,&44,&66,&00,&C0
defb &00,&40,&F0,&F0,&D0,&F0,&10,&70,&30,&80
defb &C0,&70,&70,&10,&C0,&D0,&80,&00,&C0,&00
defb &11,&44,&10,&F0,&27,&9F,&FF,&65,&91,&FF
defb &FF,&CD,&91,&91,&FF,&AF,&61,&AF,&00,&22
defb &00,&66,&D0,&E0,&60,&00,&F0,&D0,&80,&00
defb &C0,&00,&00,&E0,&00,&70,&D0,&F0,&70,&F0
defb &10,&E0,&11,&11,&01,&AE,&27,&BF,&EE,&62
defb &DB,&FF,&FF,&88,&7A,&00,&DF,&9E,&31,&5F
defb &99,&66,&00,&66,&00,&70,&00,&30,&80,&00
defb &30,&30,&11,&00,&99,&4E,&27,&9F,&CC,&24
defb &24,&FF,&FF,&88,&24,&00,&27,&9C,&23,&FF
defb &4C,&22,&44,&66,&11,&00,&45,&FF,&13,&AF
defb &8C,&42,&42,&57,&5F,&00,&57,&00,&47,&1C
defb &77,&FF,&9D,&66,&00,&66,&22,&00,&11,&FF
defb &A9,&9F,&4C,&01,&00,&07,&0F,&00,&AF,&88
defb &8F,&D0,&DD,&6F,&CC,&22,&44,&62,&22,&00
defb &33,&FF,&FC,&0F,&0E,&03,&18,&F0,&87,&01
defb &0F,&1F,&1E,&F0,&11,&5F,&08,&66,&10,&AA
defb &22,&00,&33,&7F,&70,&87,&0F,&F0,&F0,&00
defb &F0,&87,&0F,&0F,&78,&30,&80,&5F,&11,&22
defb &32,&00,&00,&00,&22,&00,&11,&5F,&50,&B0
defb &F0,&80,&00,&00,&00,&83,&F0,&E1,&22,&00
defb &00,&5F,&80,&F0,&E0,&00,&00,&10,&00,&70
defb &00,&10,&80,&00,&E0,&00,&00,&66,&44,&00
defb &80,&70,&80,&11,&33,&88,&11,&DC,&F0,&C0
defb &00,&40,&90,&80,&00,&77,&80,&00,&00,&11
defb &37,&CC,&33,&EE,&20,&00,&73,&00,&80,&60
defb &00,&66,&00,&30,&80,&00,&C4,&10,&37,&AE
defb &77,&EE,&30,&00,&80,&10,&00,&30,&00,&22
defb &00,&E0,&E0,&00,&71,&C0,&37,&4E,&FF,&EE
defb &32,&00,&03,&9D,&FF,&8C,&40,&20,&00,&10
defb &B0,&00,&73,&22,&00,&F1,&F8,&90,&90,&00
defb &00,&70,&70,&80,&00,&30,&81,&3B,&FF,&08
defb &40,&00,&00,&30,&D0,&E0,&10,&80,&00,&77
defb &EF,&20,&44,&00,&CC,&62,&60,&60,&00,&40
defb &32,&E0,&00,&C0,&30,&F0,&00,&FF,&CE,&30
defb &00,&10,&00,&66,&60,&30,&00,&62,&E0,&10
defb &F1,&E8,&60,&00,&11,&FF,&8D,&98,&00,&20
defb &00,&B0,&B0,&10,&00,&40,&40,&F1,&EC,&00
defb &33,&FF,&1B,&4C,&80,&C0,&76,&F0,&90,&10
defb &00,&88,&C0,&00,&10,&80,&37,&EF,&27,&EE
defb &80,&00,&C0,&00,&10,&10,&71,&80,&00,&E8
defb &37,&CE,&17,&EE,&90,&00,&30,&60,&10,&90
defb &60,&E0,&00,&10,&37,&8C,&13,&DE,&30,&F0
defb &E0,&30,&80,&90,&60,&30,&00,&10,&80,&00
defb &32,&C0,&00,&10,&83,&08,&41,&0C,&F0,&10
defb &00,&10,&80,&50,&60,&10,&80,&00,&40,&00
defb &00,&10,&E0,&00,&40,&70,&FF,&F8,&90,&90
defb &80,&10,&80,&40,&60,&00,&80,&00,&00,&30
defb &FE,&C0,&76,&B0,&88,&00,&10,&80,&C0,&10
defb &80,&40,&60,&00,&00,&10,&10,&C0,&00,&60
defb &00,&E0,&00,&71,&10,&E0,&10,&00,&20,&00
defb &C0,&40,&70,&80,&10,&80,&00,&40,&70,&80
defb &00,&20,&00,&77,&90,&C0,&00,&71,&10,&E2
defb &10,&E0,&F1,&88,&00,&30,&FE,&80
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
list
push DE
push DE
jp (hl)


LastByte:defb 0
;read "CoreDefs.asm";read "BootStrap.asm"
save "..\BldENT\T29-SC1.D00",FirstByte,LastByte-FirstByte	;address,size...}[,exec_address]
