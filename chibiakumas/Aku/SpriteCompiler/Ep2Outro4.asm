read "../CoreDefs.asm"
org &8000

nolist
FirstByte:
jp PicThanksForPlaying1png
jp PicThanksForPlaying1bpng
jp PicThanksForPlaying2png

PicThanksForPlaying1png:
ld hl,PicThanksForPlaying1png_rledata-1
ld de,PicThanksForPlaying1png_rledataEnd-1
ld b,0
ld ixh,64
ld IXL,71
di
exx 
push bc
exx
jp RLE_Draw
PicThanksForPlaying1png_rledata:

defb &F,&ff,&1d
defb &21
defb &6
defb &21
defb &6
defb &21
defb &1
defb &32
defb &6
defb &11
defb &7
defb &11
defb &7
defb &33
defb &F,&46
defb &21
defb &D
defb &22
defb &1
defb &21
defb &6
defb &61
defb &C1
defb &F2
defb &D1
defb &41
defb &2
defb &11
defb &7
defb &11
defb &21
defb &F,&47
defb &22
defb &31
defb &2
defb &10,&7
defb &22
defb &1
defb &22
defb &31
defb &1
defb &22
defb &1
defb &21
defb &2
defb &31
defb &20,&8,&2F

defb &11
defb &2
defb &31
defb &20,&69,&4
defb &20,&E,&E
defb &2
defb &10,&7

defb &21
defb &F,&47
defb &22
defb &1
defb &30,&9,&4,&2
defb &12
defb &21
defb &2
defb &21
defb &1
defb &32
defb &2
defb &21
defb &20,&84,&1A
defb &4
defb &10,&CA
defb &13
defb &22
defb &2
defb &21
defb &10,&4

defb &21
defb &F,&47
defb &22
defb &1
defb &30,&9,&4,&2
defb &12
defb &20,&E,&8
defb &2
defb &21
defb &2
defb &21
defb &10,&84
defb &22
defb &3
defb &21
defb &10,&1

defb &31
defb &12
defb &22
defb &31
defb &20,&8,&4

defb &21
defb &F,&48
defb &40,&2,&9,&4,&2
defb &12
defb &20,&2,&9
defb &2
defb &21
defb &2
defb &21
defb &10,&4
defb &22
defb &3
defb &11
defb &2
defb &91
defb &12
defb &22
defb &1
defb &20,&9,&4

defb &21
defb &F,&47
defb &22
defb &31
defb &20,&8,&4
defb &20,&2,&2
defb &20,&E,&9
defb &2
defb &21
defb &2
defb &21
defb &20,&2A,&9
defb &3
defb &21
defb &10,&B

defb &1
defb &12
defb &22
defb &31
defb &20,&9,&4

defb &21
defb &F,&48
defb &10,&2

defb &11
defb &5
defb &21
defb &B
defb &A1
defb &A
defb &A1
defb &41
defb &F,&51
defb &31
defb &7
defb &11
defb &A
defb &41
defb &B
defb &41
defb &F,&5c
defb &10,&27
defb &6
defb &41
defb &2
defb &A1
defb &B1
defb &7
defb &81
defb &F,&5b
defb &73
defb &10,&5D
defb &2
defb &52
defb &10,&10

defb &21
defb &73
defb &6
defb &81
defb &F,&5b
defb &11
defb &40,&22,&89,&88,&85

defb &1
defb &A2
defb &1
defb &10,&89
defb &7
defb &41
defb &F,&5a
defb &73
defb &51
defb &73
defb &10,&80
defb &72
defb &21
defb &73
defb &7
defb &51
defb &F,&5a
defb &A3
defb &40,&8C,&88,&85,&8C
defb &14
defb &7
defb &51
defb &F,&2d
defb &51
defb &F,&25
defb &81
defb &D
defb &41
defb &F,&2c
defb &F1
defb &52
defb &F,&17
defb &10,&EE
defb &3
defb &A3
defb &5
defb &C2
defb &F1
defb &C1
defb &13
defb &6
defb &81
defb &F,&29
defb &11
defb &3
defb &A1
defb &10,&77
defb &F,&16
defb &A1
defb &30,&DD,&99,&19
defb &72
defb &4
defb &C1
defb &4
defb &C1
defb &10,&57
defb &6
defb &41
defb &F,&27
defb &21
defb &32
defb &2
defb &F5
defb &F,&3
defb &33
defb &11
defb &E
defb &A1
defb &20,&BB,&BB

defb &51
defb &6
defb &81
defb &6
defb &41
defb &7
defb &41
defb &F,&27
defb &34
defb &F7
defb &51
defb &F,&0
defb &30,&8E,&BF,&7
defb &E
defb &30,&77,&BB,&19
defb &52
defb &2
defb &10,&74
defb &3
defb &C1
defb &20,&31,&64
defb &5
defb &81
defb &F,&28
defb &31
defb &10,&3F

defb &F1
defb &35
defb &B1
defb &F2
defb &51
defb &E
defb &31
defb &F2
defb &71
defb &10,&3F
defb &E
defb &10,&EE
defb &A2
defb &30,&99,&27,&80
defb &6
defb &10,&E8
defb &42
defb &5
defb &41
defb &F,&27
defb &60,&8E,&CC,&4C,&1,&3,&E
defb &F2
defb &D
defb &21
defb &B1
defb &F3
defb &10,&EF

defb &31
defb &C
defb &F1
defb &51
defb &F3
defb &10,&11

defb &71
defb &2
defb &41
defb &8
defb &10,&90
defb &F,&7
defb &10,&E0

defb &41
defb &9
defb &21
defb &32
defb &D
defb &33
defb &11
defb &6
defb &10,&8E
defb &3
defb &71
defb &10,&7
defb &4
defb &10,&8F

defb &F1
defb &C
defb &B1
defb &40,&7F,&EF,&DF,&17
defb &B
defb &F2
defb &A1
defb &F2
defb &20,&11,&23

defb &81
defb &2
defb &D1
defb &2
defb &81
defb &E2
defb &3
defb &51
defb &F,&1
defb &C4
defb &81
defb &C3
defb &41
defb &7
defb &21
defb &20,&4F,&7
defb &B
defb &21
defb &34
defb &11
defb &5
defb &32
defb &10,&11

defb &A1
defb &32
defb &11
defb &21
defb &32
defb &2
defb &21
defb &10,&67
defb &A
defb &20,&CE,&8F

defb &71
defb &F2
defb &B1
defb &10,&3F
defb &C
defb &F4
defb &40,&31,&2,&10,&71
defb &5
defb &41
defb &2
defb &41
defb &F,&2
defb &C2
defb &10,&40
defb &B
defb &31
defb &10,&7F
defb &32
defb &C1
defb &2
defb &36
defb &11
defb &10,&8
defb &32
defb &F1
defb &32
defb &5
defb &32
defb &10,&33

defb &71
defb &33
defb &B1
defb &F2
defb &31
defb &20,&1,&8E
defb &A
defb &32
defb &F3
defb &B1
defb &20,&7F,&7F

defb &11
defb &C
defb &F3
defb &30,&30,&A2,&C0
defb &4
defb &41
defb &5
defb &81
defb &F,&5
defb &41
defb &A
defb &40,&8E,&17,&8,&70
defb &36
defb &20,&7F,&C0
defb &32
defb &20,&EF,&7
defb &4
defb &21
defb &3
defb &A1
defb &32
defb &B1
defb &10,&F1
defb &F2
defb &20,&1F,&8

defb &11
defb &8
defb &21
defb &31
defb &F4
defb &71
defb &10,&7F
defb &F2
defb &31
defb &A
defb &A1
defb &F3
defb &D1
defb &40,&32,&82,&40,&80
defb &D2
defb &41
defb &6
defb &41
defb &F,&3
defb &20,&3C,&61
defb &8
defb &40,&8E,&17,&E0,&68

defb &31
defb &F2
defb &31
defb &B1
defb &F2
defb &71
defb &40,&E1,&3,&8F,&17
defb &5
defb &21
defb &20,&45,&CC

defb &31
defb &C3
defb &E1
defb &F3
defb &10,&3

defb &11
defb &8
defb &21
defb &B1
defb &F4
defb &71
defb &F2
defb &10,&CF

defb &71
defb &B
defb &40,&77,&C0,&77,&41
defb &9
defb &C1
defb &D1
defb &2
defb &41
defb &F,&0
defb &21
defb &31
defb &C2
defb &32
defb &C2
defb &11
defb &6
defb &20,&CE,&13
defb &C4
defb &10,&EF

defb &71
defb &32
defb &F1
defb &32
defb &91
defb &C2
defb &1
defb &20,&8E,&1F
defb &4
defb &22
defb &20,&8D,&88

defb &11
defb &2
defb &C2
defb &41
defb &2
defb &10,&2E

defb &11
defb &8
defb &21
defb &F2
defb &34
defb &10,&6F
defb &32
defb &12
defb &D
defb &A1
defb &F1
defb &52
defb &41
defb &7
defb &81
defb &10,&72
defb &3
defb &51
defb &E
defb &10,&2C

defb &91
defb &C2
defb &32
defb &C2
defb &61
defb &6
defb &20,&CF,&3

defb &91
defb &C3
defb &30,&CF,&1F,&EF
defb &32
defb &C3
defb &41
defb &20,&C,&3F
defb &4
defb &21
defb &12
defb &31
defb &52
defb &30,&CC,&91,&B8

defb &F1
defb &2
defb &52
defb &8
defb &B1
defb &10,&7F
defb &C4
defb &10,&96
defb &C2
defb &10,&14
defb &D
defb &A1
defb &30,&77,&41,&80
defb &C2
defb &7
defb &C1
defb &10,&54
defb &E
defb &10,&1E

defb &91
defb &C2
defb &31
defb &91
defb &C2
defb &61
defb &11
defb &5
defb &20,&CF,&9

defb &11
defb &C3
defb &32
defb &10,&1F

defb &F1
defb &33
defb &C3
defb &41
defb &20,&8,&2F
defb &4
defb &10,&8E
defb &22
defb &10,&23

defb &A1
defb &F2
defb &1
defb &41
defb &F3
defb &2
defb &81
defb &8
defb &B1
defb &10,&B7

defb &41
defb &2
defb &C2
defb &41
defb &2
defb &C1
defb &E
defb &A1
defb &F2
defb &1
defb &42
defb &61
defb &C4
defb &33
defb &91
defb &C2
defb &10,&40
defb &D
defb &81
defb &10,&1E
defb &C3
defb &91
defb &20,&78,&E1

defb &31
defb &5
defb &50,&CE,&9,&8,&E1,&9
defb &34
defb &10,&C
defb &C3
defb &61
defb &10,&1
defb &32
defb &11
defb &3
defb &80,&8F,&8A,&10,&3F,&EF,&7C,&8F,&B3

defb &41
defb &8
defb &32
defb &91
defb &A1
defb &F2
defb &1
defb &10,&B8
defb &F2
defb &10,&40
defb &E
defb &F2
defb &82
defb &20,&F2,&81
defb &C3
defb &61
defb &91
defb &C2
defb &1
defb &10,&61
defb &D
defb &81
defb &32
defb &C2
defb &62
defb &30,&78,&E1,&52
defb &4
defb &50,&8E,&9,&8,&7,&8
defb &34
defb &10,&8
defb &32
defb &30,&3C,&1,&E

defb &11
defb &3
defb &10,&8F
defb &12
defb &10,&F8

defb &71
defb &32
defb &F1
defb &10,&7C
defb &32
defb &10,&73
defb &9
defb &B1
defb &10,&17
defb &F4
defb &41
defb &F4
defb &41
defb &E
defb &F2
defb &82
defb &40,&F3,&89,&D0,&C8

defb &D1
defb &82
defb &1
defb &11
defb &E
defb &C1
defb &32
defb &C3
defb &91
defb &10,&78

defb &91
defb &C2
defb &11
defb &5
defb &31
defb &30,&9,&C,&1

defb &21
defb &36
defb &1
defb &40,&E,&9,&3,&E

defb &11
defb &3
defb &10,&8F
defb &12
defb &60,&F8,&13,&CE,&7C,&8,&73
defb &9
defb &B1
defb &10,&37

defb &F1
defb &32
defb &F1
defb &10,&DC
defb &32
defb &10,&73
defb &E
defb &F2
defb &50,&B1,&D3,&B2,&D5,&88

defb &51
defb &A2
defb &1
defb &10,&61
defb &D
defb &61
defb &30,&4B,&70,&1E

defb &91
defb &C2
defb &41
defb &10,&86
defb &C5
defb &21
defb &30,&9,&4,&8C
defb &F3
defb &D1
defb &C3
defb &11
defb &40,&C,&1,&3,&E

defb &11
defb &3
defb &80,&8F,&E,&E8,&13,&C6,&F8,&8,&71
defb &9
defb &B1
defb &60,&B7,&17,&8E,&7C,&9,&63
defb &E
defb &50,&EE,&B1,&D3,&F6,&D8

defb &1
defb &F2
defb &82
defb &1
defb &91
defb &D
defb &10,&68
defb &92
defb &10,&30
defb &C5
defb &41
defb &1
defb &C6
defb &61
defb &20,&D,&6
defb &F2
defb &C2
defb &F2
defb &60,&1E,&E1,&18,&1,&3,&E
defb &4
defb &40,&8F,&E,&E0,&17

defb &B1
defb &C3
defb &20,&8D,&70
defb &9
defb &B1
defb &60,&B7,&17,&8E,&7C,&9,&63
defb &E
defb &30,&EE,&B1,&D7
defb &F2
defb &C2
defb &A1
defb &F3
defb &10,&B8

defb &11
defb &D
defb &81
defb &62
defb &C1
defb &10,&80
defb &C2
defb &32
defb &C2
defb &10,&10

defb &81
defb &C4
defb &41
defb &12
defb &10,&8E
defb &C2
defb &2
defb &70,&7C,&1,&E,&2D,&1,&3,&6
defb &4
defb &10,&7
defb &32
defb &81
defb &C5
defb &41
defb &C4
defb &41
defb &9
defb &31
defb &60,&B7,&16,&86,&78,&9,&61
defb &E
defb &A1
defb &F2
defb &81
defb &10,&F7
defb &FA
defb &11
defb &D
defb &81
defb &92
defb &41
defb &40,&E0,&87,&96,&1E
defb &C2
defb &1
defb &C4
defb &1
defb &12
defb &40,&86,&30,&E,&64
defb &3
defb &21
defb &20,&4B,&1

defb &31
defb &2
defb &11
defb &4
defb &10,&7
defb &32
defb &81
defb &C6
defb &81
defb &C3
defb &A
defb &32
defb &91
defb &C1
defb &32
defb &C3
defb &32
defb &10,&78
defb &F,&0
defb &F2
defb &91
defb &10,&F6
defb &F5
defb &51
defb &F4
defb &E
defb &20,&68,&30

defb &C1
defb &32
defb &1
defb &30,&E0,&68,&87
defb &C4
defb &2
defb &11
defb &2
defb &B1
defb &10,&11
defb &32
defb &10,&45
defb &4
defb &20,&69,&1

defb &21
defb &2
defb &11
defb &4
defb &10,&47
defb &32
defb &10,&60

defb &81
defb &C3
defb &41
defb &C4
defb &A
defb &31
defb &10,&B7
defb &C4
defb &41
defb &C4
defb &61
defb &F,&0
defb &F2
defb &71
defb &41
defb &F6
defb &A1
defb &F3
defb &71
defb &E
defb &10,&A4
defb &C2
defb &32
defb &2
defb &10,&60
defb &C2
defb &10,&1E

defb &C1
defb &5
defb &11
defb &2
defb &B1
defb &30,&11,&3,&4D
defb &4
defb &10,&69
defb &2
defb &21
defb &2
defb &11
defb &5
defb &F1
defb &20,&E,&60

defb &1
defb &C8
defb &A
defb &B1
defb &10,&B7
defb &C5
defb &81
defb &C3
defb &61
defb &F,&0
defb &A1
defb &30,&7F,&E9,&77
defb &F7
defb &51
defb &11
defb &D
defb &81
defb &63
defb &30,&1,&70,&40
defb &C2
defb &10,&8

defb &91
defb &8
defb &A1
defb &30,&33,&3,&4D

defb &11
defb &2
defb &21
defb &10,&29
defb &5
defb &11
defb &3
defb &21
defb &30,&C7,&E,&60
defb &2
defb &81
defb &C5
defb &41
defb &A
defb &B1
defb &10,&7F
defb &C4
defb &41
defb &C4
defb &71
defb &F,&0
defb &A1
defb &20,&77,&C2
defb &F2
defb &1
defb &F6
defb &21
defb &10,&11
defb &C3
defb &41
defb &8
defb &70,&E0,&2D,&80,&D0,&40,&70,&20

defb &31
defb &8
defb &A1
defb &30,&77,&E,&6E

defb &31
defb &2
defb &31
defb &10,&29

defb &11
defb &8
defb &31
defb &11
defb &C3
defb &30,&41,&7,&80
defb &C4
defb &E1
defb &A
defb &B1
defb &20,&7F,&70

defb &81
defb &C6
defb &71
defb &F,&0
defb &A1
defb &30,&37,&84,&EE
defb &52
defb &2
defb &F2
defb &20,&99,&C0
defb &3
defb &81
defb &41
defb &7
defb &70,&68,&25,&80,&D0,&40,&70,&20

defb &61
defb &9
defb &F2
defb &2
defb &F1
defb &62
defb &32
defb &91
defb &10,&38

defb &11
defb &7
defb &10,&E

defb &81
defb &C3
defb &20,&C1,&E
defb &3
defb &81
defb &C2
defb &E1
defb &9
defb &21
defb &F3
defb &10,&61
defb &3
defb &C3
defb &10,&5E
defb &F,&1
defb &71
defb &2
defb &21
defb &1
defb &F2
defb &C1
defb &10,&98
defb &F2
defb &40,&8,&8C,&71,&FC

defb &11
defb &7
defb &20,&E,&D2
defb &2
defb &10,&70
defb &20,&E0,&E0
defb &10,&80

defb &41
defb &9
defb &F5
defb &C2
defb &93
defb &10,&39

defb &11
defb &7
defb &50,&E,&E0,&1C,&C5,&1C

defb &11
defb &2
defb &81
defb &C2
defb &10,&77
defb &8
defb &31
defb &F3
defb &20,&D3,&60
defb &2
defb &20,&E0,&DE
defb &F,&1
defb &11
defb &3
defb &20,&8B,&F7

defb &C1
defb &F2
defb &11
defb &20,&8B,&4

defb &A1
defb &F2
defb &1
defb &11
defb &8
defb &31
defb &10,&96

defb &41
defb &3
defb &C2
defb &41
defb &C3
defb &81
defb &9
defb &A1
defb &F5
defb &C3
defb &91
defb &10,&39

defb &11
defb &7
defb &10,&2

defb &11
defb &C3
defb &20,&3,&38

defb &31
defb &2
defb &C2
defb &E1
defb &10,&77
defb &7
defb &21
defb &B1
defb &F4
defb &91
defb &20,&D0,&80
defb &C2
defb &10,&EF

defb &51
defb &E
defb &31
defb &2
defb &20,&1,&E
defb &F3
defb &71
defb &11
defb &2
defb &11
defb &10,&4
defb &4
defb &11
defb &8
defb &31
defb &30,&B4,&70,&80

defb &41
defb &C2
defb &81
defb &10,&30

defb &C1
defb &9
defb &A1
defb &F4
defb &D1
defb &C3
defb &E1
defb &10,&1C

defb &11
defb &7
defb &10,&2

defb &11
defb &C2
defb &32
defb &11
defb &10,&60
defb &2
defb &81
defb &C2
defb &F3
defb &8
defb &10,&8F
defb &F4
defb &C1
defb &2
defb &C2
defb &B1
defb &F2
defb &11
defb &E
defb &21
defb &80,&8,&11,&91,&EE,&41,&26,&88,&84
defb &4
defb &11
defb &6
defb &C2
defb &41
defb &10,&B4
defb &C5
defb &81
defb &10,&70

defb &1
defb &C2
defb &9
defb &11
defb &F2
defb &51
defb &40,&1,&81,&F4,&E

defb &11
defb &7
defb &20,&2,&82
defb &C2
defb &32
defb &10,&80
defb &C4
defb &10,&88
defb &F2
defb &9
defb &35
defb &91
defb &C3
defb &33
defb &11
defb &F,&1
defb &10,&89
defb &2
defb &30,&1,&10,&20

defb &11
defb &3
defb &30,&85,&70,&E0

defb &11
defb &5
defb &81
defb &C2
defb &41
defb &10,&E0

defb &81
defb &C3
defb &41
defb &C5
defb &41
defb &9
defb &10,&8B

defb &71
defb &2
defb &11
defb &20,&4,&E4

defb &21
defb &32
defb &7
defb &30,&2,&8E,&3B
defb &32
defb &20,&6,&E0

defb &41
defb &F,&1
defb &24
defb &C2
defb &41
defb &31
defb &F,&4
defb &21
defb &2
defb &A1
defb &2
defb &82
defb &41
defb &5
defb &10,&86
defb &C2
defb &10,&F2

defb &11
defb &5
defb &81
defb &C2
defb &41
defb &81
defb &42
defb &C9
defb &A
defb &20,&7,&3B

defb &F1
defb &C2
defb &1
defb &10,&61
defb &33
defb &11
defb &6
defb &30,&2,&4E,&7
defb &32
defb &10,&E

defb &11
defb &3
defb &33
defb &C
defb &24
defb &2
defb &33
defb &11
defb &F,&2
defb &10,&24
defb &5
defb &41
defb &2
defb &21
defb &3
defb &10,&86
defb &C2
defb &10,&F2

defb &11
defb &5
defb &C2
defb &3
defb &81
defb &40,&D0,&6,&8,&1
defb &C2
defb &A
defb &32
defb &A1
defb &F3
defb &20,&F2,&3A
defb &34
defb &6
defb &20,&2,&66
defb &32
defb &2
defb &20,&9,&8B

defb &1
defb &32
defb &1
defb &32
defb &C
defb &10,&3
defb &20,&E,&E
defb &F2
defb &10,&DF
defb &F,&1
defb &10,&68
defb &5
defb &81
defb &2
defb &A1
defb &2
defb &21
defb &10,&BB
defb &C2
defb &10,&F9
defb &6
defb &C2
defb &3
defb &C1
defb &20,&60,&6
defb &3
defb &81
defb &10,&70
defb &9
defb &21
defb &32
defb &11
defb &F3
defb &20,&F9,&18
defb &34
defb &6
defb &30,&6,&66,&3
defb &32
defb &2
defb &20,&6,&6
defb &20,&CC,&C

defb &11
defb &A
defb &31
defb &30,&8D,&1,&8F
defb &F2
defb &71
defb &F2
defb &F,&0
defb &10,&20

defb &31
defb &4
defb &41
defb &2
defb &30,&2,&8E,&77

defb &D1
defb &C2
defb &51
defb &6
defb &20,&E0,&10

defb &81
defb &43
defb &2
defb &10,&6
defb &C3
defb &B
defb &32
defb &10,&1
defb &F2
defb &51
defb &3
defb &21
defb &32
defb &11
defb &7
defb &31
defb &10,&66

defb &31
defb &3
defb &A1
defb &F7
defb &2
defb &31
defb &A
defb &31
defb &30,&68,&13,&8E
defb &F3
defb &B1
defb &F2
defb &E
defb &20,&60,&6C
defb &3
defb &81
defb &3
defb &11
defb &71
defb &F3
defb &10,&E2

defb &E1
defb &8
defb &C2
defb &1
defb &10,&E0
defb &82
defb &2
defb &10,&86
defb &C2
defb &41
defb &8
defb &81
defb &C1
defb &3
defb &10,&CE
defb &2
defb &10,&2E
defb &D
defb &21
defb &30,&1,&41,&30
defb &00,&3,&7F
defb &F2
defb &2
defb &10,&6
defb &8
defb &10,&6
defb &82
defb &B1
defb &2
defb &B1
defb &F3
defb &B1
defb &F2
defb &51
defb &D
defb &20,&E2,&60

defb &11
defb &2
defb &81
defb &3
defb &71
defb &20,&89,&F7

defb &1
defb &52
defb &8
defb &81
defb &10,&70

defb &81
defb &42
defb &C6
defb &41
defb &9
defb &C1
defb &30,&4,&A2,&8F
defb &20,&3F,&3F
defb &20,&78,&E

defb &11
defb &9
defb &40,&B,&C1,&10,&3F
defb &20,&2F,&2F
defb &10,&67
defb &3
defb &31
defb &8
defb &20,&7,&E0

defb &71
defb &2
defb &B1
defb &F3
defb &31
defb &B1
defb &32
defb &51
defb &C
defb &71
defb &42
defb &61
defb &20,&1,&C1

defb &41
defb &2
defb &21
defb &2
defb &10,&F3

defb &71
defb &F2
defb &9
defb &20,&70,&E0
defb &82
defb &C3
defb &2
defb &C1
defb &9
defb &41
defb &50,&3C,&91,&9E,&9F,&97
defb &C2
defb &10,&61
defb &A
defb &40,&E,&80,&30,&7F
defb &20,&6F,&6F
defb &10,&E7
defb &2
defb &10,&9
defb &8
defb &40,&B,&C1,&3B,&8C
defb &F2
defb &30,&DF,&8F,&BF
defb &C
defb &11
defb &2
defb &61
defb &2
defb &10,&91
defb &3
defb &11
defb &20,&22,&EA

defb &F1
defb &32
defb &51
defb &8
defb &60,&70,&E0,&10,&E0,&C0,&E0
defb &42
defb &6
defb &70,&E0,&D0,&98,&1E,&BF,&1F,&78
defb &C2
defb &B
defb &21
defb &1
defb &82
defb &E1
defb &10,&3F
defb &20,&2F,&2F
defb &10,&E7
defb &32
defb &10,&1

defb &11
defb &6
defb &21
defb &10,&9

defb &31
defb &2
defb &11
defb &10,&8
defb &F2
defb &10,&9B
defb &F3
defb &B1
defb &F1
defb &A
defb &71
defb &3
defb &A1
defb &2
defb &21
defb &4
defb &11
defb &20,&57,&C8

defb &71
defb &F2
defb &11
defb &D
defb &C1
defb &10,&D0
defb &00,&3,&E0

defb &41
defb &3
defb &10,&70
defb &C4
defb &20,&83,&1E
defb &B2
defb &32
defb &93
defb &C2
defb &A
defb &21
defb &20,&C0,&88
defb &00,&3,&7F
defb &C2
defb &10,&6
defb &2
defb &11
defb &6
defb &31
defb &10,&9
defb &33
defb &11
defb &32
defb &20,&EF,&13

defb &A1
defb &F2
defb &B1
defb &F2
defb &8
defb &10,&AE
defb &3
defb &21
defb &2
defb &10,&46
defb &3
defb &51
defb &10,&26
defb &2
defb &F1
defb &32
defb &51
defb &9
defb &81
defb &C2
defb &1
defb &C2
defb &81
defb &20,&D0,&D0

defb &81
defb &C2
defb &41
defb &81
defb &C3
defb &30,&E0,&58,&83
defb &33
defb &71
defb &32
defb &10,&81
defb &C3
defb &41
defb &9
defb &21
defb &20,&C0,&88
defb &F5
defb &D1
defb &C2
defb &10,&14
defb &2
defb &11
defb &6
defb &31
defb &10,&6
defb &33
defb &21
defb &20,&8,&8F

defb &11
defb &3
defb &10,&3F
defb &F2
defb &51
defb &6
defb &21
defb &72
defb &20,&11,&1D
defb &6
defb &20,&6,&4E
defb &2
defb &21
defb &F2
defb &9
defb &C3
defb &41
defb &81
defb &C2
defb &81
defb &20,&D0,&D0

defb &81
defb &C6
defb &41
defb &81
defb &C3
defb &10,&21
defb &37
defb &1
defb &C4
defb &9
defb &21
defb &20,&41,&8C
defb &F6
defb &C2
defb &10,&14
defb &2
defb &11
defb &5
defb &20,&E,&82

defb &21
defb &32
defb &21
defb &30,&8,&7F,&9
defb &2
defb &10,&6E
defb &32
defb &51
defb &6
defb &A1
defb &40,&8D,&9,&4,&CE
defb &5
defb &21
defb &10,&AE

defb &11
defb &2
defb &52
defb &9
defb &C3
defb &81
defb &C3
defb &81
defb &20,&D0,&D0

defb &41
defb &C7
defb &81
defb &C3
defb &10,&81
defb &37
defb &2
defb &C3
defb &41
defb &9
defb &20,&7,&8C
defb &F5
defb &D1
defb &C2
defb &20,&14,&8

defb &11
defb &5
defb &10,&2
defb &12
defb &80,&18,&9,&B,&BF,&89,&5D,&8F,&7F

defb &11
defb &A
defb &A1
defb &20,&44,&8

defb &11
defb &4
defb &22
defb &51
defb &20,&13,&66

defb &F1
defb &9
defb &C3
defb &81
defb &C2
defb &20,&D0,&D0

defb &41
defb &C2
defb &81
defb &C5
defb &42
defb &C3
defb &10,&29
defb &37
defb &2
defb &81
defb &C2
defb &41
defb &A
defb &11
defb &10,&8E
defb &F6
defb &D1
defb &C2
defb &21
defb &10,&8
defb &6
defb &22
defb &10,&9
defb &20,&4,&4
defb &50,&E,&BF,&5D,&AB,&7F
defb &F2
defb &5
defb &A1
defb &F3
defb &51
defb &20,&4C,&4C
defb &10,&1

defb &71
defb &4
defb &21
defb &4
defb &51
defb &2
defb &51
defb &9
defb &81
defb &C3
defb &41
defb &20,&E0,&D0

defb &41
defb &C2
defb &41
defb &1
defb &C3
defb &3
defb &81
defb &C2
defb &10,&18
defb &37
defb &3
defb &10,&E0

defb &41
defb &A
defb &21
defb &10,&8B
defb &F6
defb &C3
defb &22
defb &11
defb &6
defb &a0,&2,&61,&B,&D,&8C,&BF,&5D,&2B,&CF,&EF
defb &5
defb &F5
defb &20,&4,&C
defb &2
defb &21
defb &5
defb &F4
defb &20,&8F,&7F
defb &A
defb &C3
defb &81
defb &C2
defb &10,&D0

defb &41
defb &C2
defb &41
defb &8
defb &C2
defb &10,&18
defb &32
defb &10,&69
defb &F2
defb &31
defb &2
defb &A1
defb &1
defb &C2
defb &A
defb &31
defb &10,&1
defb &F7
defb &D1
defb &10,&14

defb &31
defb &7
defb &23
defb &12
defb &34
defb &B1
defb &30,&9F,&D5,&BA
defb &F2
defb &10,&67
defb &5
defb &F1
defb &10,&88

defb &1
defb &A2
defb &2
defb &B1
defb &2
defb &21
defb &4
defb &A1
defb &F4
defb &51
defb &D
defb &10,&E0

defb &1
defb &C3
defb &10,&D0

defb &41
defb &C2
defb &41
defb &8
defb &C2
defb &10,&10
defb &C4
defb &10,&EF

defb &71
defb &2
defb &52
defb &C2
defb &A
defb &31
defb &2
defb &F7
defb &C1
defb &10,&1C

defb &11
defb &7
defb &20,&6,&38

defb &31
defb &3
defb &50,&CE,&DF,&99,&5D,&EF
defb &7
defb &F1
defb &20,&DD,&DD
defb &3
defb &B1
defb &2
defb &30,&6,&C,&88
defb &20,&11,&11

defb &51
defb &F,&0
defb &10,&60
defb &20,&E0,&E0

defb &41
defb &C2
defb &41
defb &8
defb &C2
defb &41
defb &2
defb &C2
defb &61
defb &10,&EE

defb &51
defb &2
defb &52
defb &C2
defb &A
defb &11
defb &2
defb &F7
defb &51
defb &10,&44
defb &9
defb &31
defb &1
defb &33
defb &60,&1,&CE,&DF,&9,&88,&77
defb &7
defb &A1
defb &F4
defb &2
defb &10,&19
defb &3
defb &51
defb &20,&44,&88
defb &20,&BB,&BB

defb &51
defb &F,&0
defb &50,&B0,&D0,&E0,&D0,&40
defb &8
defb &C2
defb &41
defb &2
defb &C2
defb &41
defb &B1
defb &F2
defb &2
defb &A2
defb &C2
defb &A
defb &11
defb &10,&88
defb &F7
defb &51
defb &10,&CC
defb &9
defb &21
defb &20,&7,&3

defb &21
defb &32
defb &B1
defb &30,&DF,&1,&9

defb &31
defb &9
defb &53
defb &F1
defb &20,&99,&4
defb &3
defb &11
defb &10,&6
defb &2
defb &F4
defb &51
defb &E
defb &81
defb &20,&D0,&D0

defb &81
defb &43
defb &10,&B0
defb &7
defb &81
defb &C2
defb &6
defb &A1
defb &F2
defb &3
defb &10,&F1

defb &41
defb &9
defb &20,&6,&88
defb &F7
defb &51
defb &10,&CC
defb &A
defb &10,&1

defb &31
defb &4
defb &33
defb &10,&D

defb &21
defb &E
defb &A1
defb &40,&88,&44,&6,&4

defb &A1
defb &3
defb &A4
defb &F1
defb &E
defb &81
defb &20,&D0,&D0
defb &10,&20
defb &42
defb &10,&B0
defb &4
defb &81
defb &C5
defb &3
defb &11
defb &10,&7F
defb &3
defb &11
defb &2
defb &10,&F1

defb &41
defb &9
defb &32
defb &10,&88
defb &F7
defb &2
defb &31
defb &C
defb &33
defb &1
defb &21
defb &34
defb &D
defb &53
defb &F1
defb &10,&CC

defb &21
defb &12
defb &71
defb &12
defb &21
defb &2
defb &12
defb &3
defb &51
defb &E
defb &C1
defb &20,&10,&60
defb &C2
defb &20,&D0,&C0
defb &2
defb &10,&C2

defb &61
defb &C5
defb &30,&80,&3C,&42

defb &21
defb &32
defb &11
defb &2
defb &C2
defb &A
defb &10,&B

defb &11
defb &3
defb &20,&6,&6
defb &2
defb &10,&E

defb &11
defb &B
defb &B1
defb &F2
defb &32
defb &11
defb &2
defb &10,&6
defb &C
defb &A1
defb &F2
defb &2
defb &51
defb &10,&2E
defb &A2
defb &31
defb &4
defb &11
defb &31
defb &A3
defb &51
defb &E
defb &81
defb &C3
defb &81
defb &C2
defb &81
defb &C3
defb &30,&8,&87,&1E
defb &C4
defb &30,&80,&3C,&E

defb &11
defb &32
defb &11
defb &2
defb &10,&F2
defb &9
defb &21
defb &20,&1,&7
defb &2
defb &20,&6,&6
defb &20,&8,&B

defb &11
defb &B
defb &32
defb &B1
defb &F2
defb &11
defb &2
defb &12
defb &F,&3
defb &30,&23,&77,&57
defb &4
defb &A2
defb &10,&77
defb &F,&1
defb &10,&86

defb &C1
defb &33
defb &10,&16
defb &C2
defb &1
defb &33
defb &10,&B4
defb &C3
defb &41
defb &30,&80,&3C,&42

defb &21
defb &32
defb &11
defb &2
defb &10,&E4
defb &9
defb &21
defb &20,&1,&E
defb &2
defb &10,&6

defb &1
defb &33
defb &10,&8

defb &31
defb &B
defb &10,&EF

defb &71
defb &F2
defb &71
defb &20,&8,&C
defb &D
defb &A3
defb &20,&11,&1
defb &F2
defb &21
defb &5
defb &10,&6
defb &F,&3
defb &37
defb &11
defb &2
defb &21
defb &33
defb &91
defb &C3
defb &41
defb &3
defb &10,&16
defb &F2
defb &21
defb &32
defb &11
defb &20,&6,&44
defb &9
defb &21
defb &3
defb &21
defb &30,&3,&6,&C
defb &4
defb &31
defb &B
defb &B1
defb &F2
defb &31
defb &30,&7F,&4,&8
defb &D
defb &A1
defb &30,&BB,&BF,&57
defb &F2
defb &20,&13,&E
defb &2
defb &10,&6
defb &52
defb &F,&0
defb &21
defb &38
defb &2
defb &35
defb &7
defb &10,&1E
defb &2
defb &35
defb &91
defb &20,&88,&4
defb &7
defb &31
defb &4
defb &21
defb &32
defb &11
defb &10,&C
defb &4
defb &10,&6
defb &9
defb &21
defb &B1
defb &F3
defb &10,&4F

defb &21
defb &3
defb &11
defb &D
defb &20,&11,&77
defb &2
defb &20,&EE,&B

defb &11
defb &72
defb &11
defb &20,&2,&77
defb &F,&0
defb &39
defb &20,&1,&7

defb &21
defb &32
defb &7
defb &20,&6,&70
defb &35
defb &C2
defb &A1
defb &31
defb &8
defb &31
defb &5
defb &21
defb &20,&7,&28

defb &11
defb &3
defb &10,&6
defb &A
defb &31
defb &F4
defb &31
defb &11
defb &3
defb &31
defb &D
defb &10,&99

defb &F1
defb &3
defb &20,&DD,&9F
defb &A2
defb &20,&4,&22

defb &A1
defb &F,&1
defb &39
defb &10,&1

defb &21
defb &2
defb &32
defb &11
defb &6
defb &31
defb &C3
defb &61
defb &34
defb &C1
defb &62
defb &9
defb &11
defb &6
defb &20,&86,&28

defb &11
defb &3
defb &10,&E
defb &9
defb &21
defb &30,&8C,&11,&66
defb &35
defb &D
defb &20,&11,&11

defb &A1
defb &B2
defb &A1
defb &10,&15
defb &52
defb &1
defb &32
defb &1
defb &A1
defb &F,&0
defb &21
defb &3A
defb &4
defb &21
defb &10,&7
defb &6
defb &20,&E1,&33

defb &61
defb &33
defb &91
defb &C2
defb &91
defb &41
defb &7
defb &10,&6
defb &6
defb &20,&6,&38

defb &31
defb &4
defb &31
defb &9
defb &32
defb &21
defb &20,&E0,&44

defb &11
defb &2
defb &11
defb &D
defb &A1
defb &F1
defb &3
defb &10,&2

defb &21
defb &52
defb &A3
defb &2
defb &10,&1

defb &A1
defb &F,&0
defb &21
defb &3A
defb &11
defb &4
defb &10,&7
defb &6
defb &20,&E1,&B3

defb &61
defb &33
defb &10,&E1
defb &62
defb &C1
defb &7
defb &10,&6
defb &6
defb &20,&6,&20

defb &31
defb &4
defb &31
defb &9
defb &31
defb &60,&1C,&B0,&19,&E6,&10,&27
defb &B
defb &F2
defb &51
defb &2
defb &32
defb &30,&8A,&88,&77
defb &4
defb &10,&77
defb &E
defb &21
defb &3B
defb &4
defb &10,&6
defb &6
defb &30,&61,&80,&78
defb &32
defb &92
defb &31
defb &C2
defb &7
defb &10,&6
defb &6
defb &30,&6,&A8,&6
defb &3
defb &21
defb &9
defb &31
defb &60,&1A,&F8,&23,&C6,&B0,&5E
defb &B
defb &F1
defb &10,&66
defb &2
defb &10,&E
defb &12
defb &10,&99
defb &F2
defb &3
defb &A1
defb &F2
defb &E
defb &21
defb &3B
defb &5
defb &11
defb &6
defb &10,&83
defb &C2
defb &10,&CB
defb &32
defb &30,&49,&B4,&70
defb &6
defb &21
defb &7
defb &30,&6,&E8,&16
defb &3
defb &21
defb &11
defb &8
defb &31
defb &40,&C,&7F,&3B,&A6
defb &83
defb &B1
defb &F,&0
defb &51
defb &32
defb &20,&8D,&88
defb &F2
defb &2
defb &20,&99,&DD
defb &E
defb &21
defb &3B
defb &11
defb &B
defb &20,&6,&78
defb &F4
defb &10,&18

defb &91
defb &C2
defb &41
defb &6
defb &31
defb &3
defb &10,&60
defb &2
defb &50,&3,&A8,&E,&C0,&8

defb &11
defb &8
defb &32
defb &1
defb &10,&9F

defb &51
defb &22
defb &71
defb &20,&B0,&7C
defb &B
defb &F1
defb &10,&66
defb &2
defb &10,&E
defb &12
defb &10,&99
defb &F2
defb &F,&5
defb &36
defb &10,&9
defb &35
defb &C
defb &21
defb &10,&8F
defb &F4
defb &2
defb &C3
defb &41
defb &6
defb &31
defb &3
defb &10,&60
defb &2
defb &50,&43,&F8,&1D,&C0,&40

defb &11
defb &8
defb &11
defb &2
defb &50,&77,&4,&8C,&1,&FC
defb &B
defb &F2
defb &51
defb &3
defb &32
defb &21
defb &10,&88
defb &F2
defb &3
defb &A1
defb &10,&DD
defb &E
defb &21
defb &35
defb &10,&1
defb &35
defb &C
defb &A1
defb &F6
defb &2
defb &81
defb &C2
defb &41
defb &6
defb &11
defb &2
defb &C3
defb &2
defb &31
defb &C3
defb &30,&3D,&80,&70

defb &11
defb &8
defb &A1
defb &F5
defb &51
defb &A1
defb &F5
defb &51
defb &B
defb &F1
defb &3
defb &22
defb &20,&B,&99
defb &F2
defb &3
defb &A1
defb &F2
defb &F,&0
defb &21
defb &34
defb &2
defb &35
defb &11
defb &B
defb &A1
defb &F5
defb &51
defb &2
defb &81
defb &C2
defb &41
defb &6
defb &11
defb &2
defb &81
defb &C3
defb &1
defb &31
defb &43
defb &10,&1D

defb &11
defb &C2
defb &1
defb &31
defb &8
defb &A1
defb &5
defb &51
defb &A1
defb &5
defb &51
defb &A
defb &A1
defb &51
defb &2
defb &51
defb &30,&4,&B,&89
defb &F2
defb &2
defb &20,&11,&66
defb &F,&0
defb &C1
defb &61
defb &33
defb &2
defb &35
defb &11
defb &D
defb &A1
defb &20,&11,&66
defb &3
defb &C2
defb &6
defb &21
defb &11
defb &3
defb &70,&60,&30,&C3,&D0,&8,&E1,&10

defb &31
defb &8
defb &A1
defb &2
defb &F1
defb &2
defb &51
defb &20,&22,&4E
defb &2
defb &51
defb &B
defb &51
defb &4
defb &23
defb &20,&4,&DD
defb &4
defb &F1
defb &F,&1
defb &C3
defb &10,&6
defb &2
defb &21
defb &34
defb &D
defb &30,&BB,&DD,&66
defb &3
defb &C2
defb &6
defb &B1
defb &30,&1,&27,&60
defb &2
defb &31
defb &42
defb &81
defb &30,&8,&A1,&30

defb &31
defb &8
defb &A1
defb &60,&88,&67,&44,&22,&BC,&1

defb &51
defb &B
defb &F1
defb &4
defb &12
defb &21
defb &10,&9
defb &A2
defb &4
defb &A1
defb &F,&1
defb &C3
defb &4
defb &21
defb &32
defb &91
defb &41
defb &D
defb &30,&BB,&DD,&66
defb &2
defb &81
defb &C2
defb &5
defb &40,&68,&93,&5E,&60
defb &2
defb &50,&83,&90,&78,&1,&30

defb &31
defb &8
defb &A1
defb &60,&C0,&57,&44,&22,&58,&11

defb &51
defb &B
defb &51
defb &4
defb &23
defb &1
defb &32
defb &51
defb &4
defb &10,&66
defb &E
defb &81
defb &C3
defb &4
defb &10,&86
defb &C3
defb &D
defb &30,&BB,&DD,&66
defb &2
defb &81
defb &C2
defb &5
defb &82
defb &B1
defb &82
defb &B1
defb &10,&60
defb &2
defb &50,&83,&80,&8,&3,&20

defb &31
defb &2
defb &F1
defb &3
defb &F1
defb &70,&88,&40,&BE,&44,&22,&F8,&1

defb &51
defb &B
defb &F1
defb &5
defb &20,&9,&8
defb &32
defb &11
defb &3
defb &A1
defb &F,&0
defb &81
defb &C3
defb &6
defb &C3
defb &D
defb &30,&BB,&DD,&66
defb &2
defb &10,&E0

defb &41
defb &5
defb &40,&E0,&93,&7C,&C0
defb &2
defb &f0,&1,&83,&80,&10,&3,&20,&2,&AE,&11,&AE,&99,&C0,&BE,&44,&22,&E8,&11

defb &51
defb &B
defb &50,&77,&44,&88,&4,&15
defb &32
defb &30,&1,&11,&66
defb &E
defb &C3
defb &41
defb &6
defb &C3
defb &41
defb &C
defb &30,&BB,&DD,&66
defb &2
defb &C2
defb &41
defb &6
defb &C1
defb &30,&3F,&FC,&C0
defb &2
defb &10,&83
defb &2
defb &b0,&10,&3,&20,&6,&7C,&11,&7C,&99,&80,&FE,&44

defb &A1
defb &2
defb &11
defb &2
defb &51
defb &A
defb &A1
defb &F2
defb &7
defb &21
defb &32
defb &11
defb &3
defb &10,&EE
defb &E
defb &C3
defb &41
defb &6
defb &81
defb &C2
defb &41
defb &C
defb &40,&BB,&DD,&66,&80
defb &C2
defb &7
defb &21
defb &34
defb &4
defb &10,&83
defb &2
defb &10,&10

defb &31
defb &3
defb &60,&6,&D8,&23,&D8,&AB,&8

defb &31
defb &2
defb &51
defb &A1
defb &2
defb &F1
defb &2
defb &51
defb &2
defb &11
defb &10,&8
defb &5
defb &A1
defb &10,&DD
defb &7
defb &11
defb &33
defb &1
defb &10,&11
defb &F2
defb &51
defb &D
defb &C3
defb &41
defb &7
defb &C3
defb &C
defb &30,&BB,&DD,&66

defb &1
defb &C3
defb &7
defb &A1
defb &20,&11,&66
defb &32
defb &2
defb &10,&83
defb &2
defb &10,&30

defb &31
defb &3
defb &50,&6,&F8,&23,&F8,&AB

defb &1
defb &22
defb &2
defb &51
defb &30,&22,&2E,&11

defb &51
defb &2
defb &F1
defb &10,&88

defb &51
defb &5
defb &A2
defb &30,&33,&66,&CC

defb &1
defb &22
defb &B1
defb &30,&8B,&33,&BB

defb &51
defb &D
defb &83
defb &8
defb &C2
defb &81
defb &C
defb &30,&BB,&DD,&66

defb &81
defb &C2
defb &41
defb &7
defb &71
defb &20,&23,&9F
defb &35
defb &81
defb &2
defb &20,&EE,&17
defb &2
defb &50,&6,&E8,&33,&E8,&BB

defb &1
defb &13
defb &30,&44,&22,&2E
defb &20,&11,&11
defb &20,&2E,&5D

defb &B1
defb &5
defb &10,&22

defb &A1
defb &F2
defb &A1
defb &20,&77,&77
defb &32
defb &71
defb &52
defb &2
defb &51
defb &F1
defb &F,&9
defb &44
defb &7
defb &F2
defb &2
defb &30,&BB,&DD,&66
defb &C3
defb &8
defb &71
defb &20,&23,&9F

defb &1
defb &34
defb &81
defb &2
defb &10,&20

defb &21
defb &32
defb &1
defb &20,&6,&E
defb &2
defb &70,&E,&88,&84,&14,&44,&22,&E2
defb &20,&11,&11
defb &20,&2E,&5D

defb &B1
defb &5
defb &40,&22,&33,&66,&CC
defb &2
defb &30,&8E,&3,&77
defb &2
defb &51
defb &D
defb &20,&D0,&60
defb &8
defb &81
defb &C2
defb &6
defb &81
defb &F1
defb &3
defb &30,&BB,&DD,&66
defb &C2
defb &41
defb &8
defb &D1
defb &20,&32,&F9

defb &1
defb &B2
defb &11
defb &40,&F7,&4,&22,&9F
defb &33
defb &11
defb &22
defb &2
defb &22
defb &10,&88
defb &F5
defb &51
defb &A1
defb &F5
defb &30,&11,&E2,&D5

defb &E1
defb &4
defb &F1
defb &A
defb &30,&D,&13,&22
defb &52
defb &A1
defb &D
defb &C4
defb &41
defb &6
defb &81
defb &C3
defb &1
defb &10,&8A
defb &F2
defb &10,&88
defb &F2
defb &50,&11,&BB,&DD,&6E,&E1

defb &41
defb &8
defb &A1
defb &60,&11,&66,&4E,&BB,&CB,&2

defb &A1
defb &2
defb &F1
defb &21
defb &32
defb &1
defb &13
defb &1
defb &13
defb &81
defb &60,&F2,&B5,&75,&EA,&F4,&E5

defb &71
defb &2
defb &F1
defb &10,&88

defb &51
defb &3
defb &A1
defb &54
defb &7
defb &22
defb &11
defb &2
defb &A2
defb &52
defb &F1
defb &C
defb &C5
defb &41
defb &5
defb &C4
defb &1
defb &10,&8E
defb &F7
defb &1
defb &A2
defb &51
defb &A2
defb &71
defb &10,&C3
defb &32
defb &7
defb &21
defb &2
defb &40,&2,&A6,&BC,&CB
defb &12
defb &A1
defb &2
defb &A1
defb &51
defb &3
defb &d0,&61,&1,&61,&89,&B6,&BD,&7E,&EA,&E5,&EB,&17,&4,&8
defb &4
defb &10,&BB
defb &53
defb &C
defb &F1
defb &20,&66,&BB

defb &51
defb &B
defb &C4
defb &10,&D0
defb &4
defb &C5
defb &1
defb &10,&7F
defb &F5
defb &51
defb &3
defb &A1
defb &20,&11,&6E
defb &35
defb &7
defb &11
defb &2
defb &11
defb &60,&42,&30,&77,&4,&44,&88
defb &52
defb &10,&8
defb &32
defb &10,&9
defb &32
defb &20,&81,&B6

defb &D1
defb &E2
defb &71
defb &20,&EA,&E5
defb &E2
defb &20,&1F,&8
defb &2
defb &11
defb &3
defb &51
defb &A2
defb &51
defb &F1
defb &C
defb &F1
defb &20,&44,&33

defb &51
defb &B
defb &C3
defb &41
defb &10,&B0
defb &4
defb &10,&D0
defb &82
defb &20,&10,&F8
defb &F7
defb &2
defb &A1
defb &2
defb &10,&2A
defb &35
defb &11
defb &5
defb &31
defb &30,&2,&B,&C0

defb &41
defb &2
defb &A1
defb &3
defb &51
defb &3
defb &A1
defb &2
defb &33
defb &1
defb &33
defb &A1
defb &F5
defb &71
defb &B1
defb &F5
defb &10,&17

defb &21
defb &12
defb &31
defb &21
defb &F,&16
defb &81
defb &C3
defb &10,&60
defb &4
defb &20,&60,&B0
defb &3
defb &91
defb &C3
defb &E1
defb &10,&77
defb &7
defb &21
defb &1
defb &34

defb &11
defb &4
PicThanksForPlaying1png_rledataEnd: defb 0
PicThanksForPlaying1bpng:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50-8
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicThanksForPlaying1bpng_DrawOrder
JP JumpToNextLine


PicThanksForPlaying1bpng_Line_0:
ld hl,&FFC0
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_3:
ld hl,&FFE0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+5
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_4:
ld hl,&FFDC
add hl,sp
ld sp,hl
LD HL,&6904
  Push HL
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_5:
ld hl,&FFE0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+11
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_6:
ld hl,&FFE0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+17
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_7:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&040A
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0025
  Push BC
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_8:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&2A09
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0B04
  Push BC
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_9:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&2200
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0088
  Push BC
LD HL,&1000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_10:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&1000
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0000
  Push BC
LD HL,&1000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_11:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&1088
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&2000
  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_12:
ld hl,&FFDA
add hl,sp
ld sp,hl
LD HL,&2000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_13:
ld hl,&FFDA
add hl,sp
ld sp,hl
LD HL,&4000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_14:
ld hl,&FFDA
add hl,sp
ld sp,hl
LD HL,&4400
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_16:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0011
  Push HL
ld hl,&FFE0
add hl,sp
ld sp,hl
LD BC,&4000
  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_17:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&CC55
  Push HL
ld hl,&FFEE
add hl,sp
ld sp,hl
LD BC,&00EE
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&2000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_18:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0400
  Push HL
LD BC,&8877
  Push BC
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&88DD
  Push HL
LD BC,&9919
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&1000
  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_19:
call BitmapPush8
defw BitmapData+25
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&88BB
  Push HL
LD BC,&BB11
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&1000
  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_20:
LD HL,&000C
  Push HL
LD BC,&0FCF
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&FF11
  Push HL
ld hl,&FFF0
add hl,sp
ld sp,hl
LD BC,&0077
  Push BC
LD HL,&BB19
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
Ld C,&80
  Push BC
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_21:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+31
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&00EE
  Push HL
LD BC,&AA99
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0040
  Push HL
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_22:
call BitmapPush8
defw BitmapData+39
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&CCDD
  Push HL
LD BC,&FF11
  Push BC
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_23:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+47
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&CCBB
  Push HL
LD BC,&FF11
  Push BC
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_24:
call BitmapPush10
defw BitmapData+57
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&FF31
  Push BC
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_25:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+65
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00CC
  Push HL
LD BC,&FF30
  Push BC
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_26:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+73
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&88FF
  Push HL
LD BC,&F732
  Push BC
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_27:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+81
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+87
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_28:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+95
ld hl,&FFF4
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&8877
  Push HL
LD BC,&5100
  Push BC
  PUSH DE
dec sp
dec sp
LD HL,&0044
  Push HL
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_29:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+103
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&8877
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+109
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_30:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+117
ld hl,&FFF4
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&88FF
  Push HL
dec sp
dec sp
call BitmapPush6
defw BitmapData+123
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_31:
call BitmapPush10
defw BitmapData+133
ld hl,&FFF4
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
dec sp
dec sp
call BitmapPush6
defw BitmapData+139
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_32:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+147
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&00FF
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+153
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_33:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&13CE
  Push HL
LD BC,&7C08
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+159
ld hl,&FFFE
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+169
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+175
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_34:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+183
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+189
ld hl,&FFFE
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+195
dec sp
dec sp
LD HL,&2021
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+201
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+207
jp NextLineDecSP4


PicThanksForPlaying1bpng_Line_35:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+215
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+189
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+223
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&B801
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+229
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+235
jp NextLineDecSP4


PicThanksForPlaying1bpng_Line_36:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F0F0
  Push HL
LD BC,&D0F0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+241
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+247
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&A461
  Push HL
LD BC,&E087
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&F0C0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+255
jp NextLineDecSP4


PicThanksForPlaying1bpng_Line_37:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&B0F0
  Push HL
LD BC,&3000
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+261
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&6830
  Push HL
LD BC,&3C03
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&87F0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+269
jp NextLineDecSP4


PicThanksForPlaying1bpng_Line_38:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+275
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+281
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&A4F0
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&1E30
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&1103
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_39:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&C0F0
  Push HL
Ld B,L
Ld C,L

  Push BC
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+287
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0000
  Push HL
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&0170
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0821
  Push HL
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_40:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&00E0
  Push HL
ld hl,&FFEC
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+301
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+307
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&770E
  Push BC
LD HL,&6E03
  Push HL
ld hl,&FFFA
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_41:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&F041
  Push HL
LD BC,&0780
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&E0F0
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+313
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+319
ld hl,&FFF2
add hl,sp
ld sp,hl
LD BC,&FF00
  Push BC
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_42:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0E00
  Push HL
LD BC,&80F0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FF61
  Push HL
LD BC,&00C0
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+325
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&088C
  Push HL
LD BC,&71FC
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+331
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_43:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&1C01
  Push HL
LD BC,&80F0
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&6000
  Push HL
LD BC,&E0DE
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+337
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&8B04
  Push HL
LD BC,&EE33
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&1000
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&F020
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_44:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&3803
  Push HL
LD BC,&C0F8
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&D080
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&000C
  Push BC
LD HL,&0001
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&0404
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
Ld L,&00
  Push HL
LD BC,&0CB4
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_45:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&6000
  Push HL
LD BC,&E0FC
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&30C0
  Push HL
ld hl,&FFF6
add hl,sp
ld sp,hl
LD BC,&0811
  Push BC
LD HL,&91EE
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&8884
  Push BC
LD HL,&0000
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&00C0
  Push BC
LD HL,&70B4
  Push HL
ld hl,&FFF6
add hl,sp
ld sp,hl
LD BC,&CD77
  Push BC
LD HL,&0181
  Push HL
ld hl,&FFFA
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_46:
ld hl,&FFE6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+343
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0085
  Push HL
LD BC,&70E0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&00E0
  Push HL
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+349
jp NextLineDecSP4


PicThanksForPlaying1bpng_Line_47:
ld hl,&FFE6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+355
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0086
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+361
ld hl,&FFF6
add hl,sp
ld sp,hl
LD BC,&F330
  Push BC
ld hl,&FFFA
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_48:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&000F
  Push HL
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+367
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+381
ld hl,&FFF0
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_49:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0C03
  Push HL
LD BC,&0F00
  Push BC
ld hl,&FFF0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+387
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&08BB
  Push HL
LD BC,&F0F9
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+393
ld hl,&FFEE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_50:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+399
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0C8D
  Push HL
LD BC,&018F
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&2003
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&8E77
  Push BC
LD HL,&F174
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&00E0
  Push BC
LD HL,&1060
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&06F0
  Push BC
ld hl,&FFF0
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_51:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&EEFF
  Push HL
Ld B,L
Ld C,L

  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0C68
  Push HL
LD BC,&138E
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&606C
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+405
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+411
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&8030
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_52:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&7F7F
  Push HL
LD BC,&7FFF
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&06A0
  Push HL
LD BC,&238C
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+417
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0080
  Push HL
LD BC,&7060
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&C004
  Push HL
LD BC,&A28F
  Push BC
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_53:
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+423
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+431
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+437
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+443
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&403C
  Push HL
LD BC,&919E
  Push BC
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_54:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+451
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0BC1
  Push HL
LD BC,&3B8C
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&8FBF
  Push HL
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&22EA
  Push BC
LD HL,&3F47
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&70E0
  Push BC
LD HL,&10E0
  Push HL
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&E0D0
  Push BC
LD HL,&981E
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_55:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+459
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+465
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&FFBF
  Push HL
LD BC,&3300
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&57C8
  Push HL
LD BC,&DF37
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0000
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+473
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_56:
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+479
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+485
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&EEBF
  Push HL
LD BC,&FF00
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&3F47
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+491
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+499
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_57:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&C088
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&F7F0
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+505
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&003F
  Push HL
LD BC,&FF11
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&CE33
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+511
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+517
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_58:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FFF0
  Push HL
LD BC,&1400
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+529
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&4411
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0000
  Push BC
LD HL,&F0B0
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&E0F0
  Push BC
LD HL,&810F
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_59:
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush18
defw BitmapData+547
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&6633
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&F0B0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+553
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F010
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_60:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&048E
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&FFF1
  Push BC
LD HL,&3808
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+565
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&1144
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&80F0
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&70C0
  Push BC
LD HL,&F000
  Push HL
LD BC,&80F0
  Push BC
LD HL,&180F
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&E010
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_61:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&088B
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&FFF0
  Push BC
LD HL,&3806
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+577
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&8F7F
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&00F0
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&00F0
  Push BC
LD HL,&180F
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0388
  Push BC
LD HL,&C030
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_62:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FFF7
  Push HL
LD BC,&1403
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+589
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&00E0
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&00F0
  Push BC
LD HL,&10F0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&1344
  Push BC
LD HL,&D130
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_63:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FFF3
  Push HL
LD BC,&1C01
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+599
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&00F0
  Push HL
LD BC,&10C0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1144
  Push HL
LD BC,&D130
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_64:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0400
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&4400
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&000C
  Push HL
LD BC,&0C0F
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&DF09
  Push HL
LD BC,&8877
  Push BC
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&00F0
  Push HL
LD BC,&10C0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&3388
  Push HL
LD BC,&E230
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_65:
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0008
  Push HL
LD BC,&0703
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&DF01
  Push HL
Ld B,&09
  Push BC
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&80F0
  Push HL
LD BC,&0000
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F110
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_66:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FF77
  Push HL
LD BC,&CC00
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0103
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0F0D
  Push BC
LD HL,&0200
  Push HL
ld hl,&FFE4
add hl,sp
ld sp,hl
LD BC,&00E0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0004
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&F110
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_67:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+605
ld hl,&FFD6
add hl,sp
ld sp,hl
LD HL,&C2D2
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&803C
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F000
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_68:
ld hl,&FFCE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+611
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F200
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_69:
ld hl,&FFD0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+617
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&E400
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_70:
ld hl,&FFD0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+623
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&4400
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_71:
ld hl,&FFD0
add hl,sp
ld sp,hl
LD HL,&000F
  Push HL
LD BC,&0F03
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&8804
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_72:
ld hl,&FFD0
add hl,sp
ld sp,hl
LD HL,&0107
  Push HL
LD BC,&0E03
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&B803
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_73:
ld hl,&FFD0
add hl,sp
ld sp,hl
LD HL,&0102
  Push HL
LD BC,&0C07
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&5A00
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_74:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&0807
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_75:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&0007
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_76:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&0006
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_77:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&0004
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying1bpng_Line_90:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_91:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&FF00
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_92:
ld hl,&FFCC
add hl,sp
ld sp,hl
LD HL,&0080
  Push HL
LD BC,&3300
  Push BC
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_93:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&FF11
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_94:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&FF33
  Push HL
jp NextLineDecSP8


PicThanksForPlaying1bpng_Line_95:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&7700
  Push HL
jp NextLineDecSP8



PicThanksForPlaying1bpng_DrawOrder: 

  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying1bpng_Line_3
  DEFW PicThanksForPlaying1bpng_Line_4
  DEFW PicThanksForPlaying1bpng_Line_5
  DEFW PicThanksForPlaying1bpng_Line_6
  DEFW PicThanksForPlaying1bpng_Line_7
  DEFW PicThanksForPlaying1bpng_Line_8
  DEFW PicThanksForPlaying1bpng_Line_9
  DEFW PicThanksForPlaying1bpng_Line_10
  DEFW PicThanksForPlaying1bpng_Line_11
  DEFW PicThanksForPlaying1bpng_Line_12
  DEFW PicThanksForPlaying1bpng_Line_13
  DEFW PicThanksForPlaying1bpng_Line_14
  DEFW PicThanksForPlaying1bpng_Line_14
  DEFW PicThanksForPlaying1bpng_Line_16
  DEFW PicThanksForPlaying1bpng_Line_17
  DEFW PicThanksForPlaying1bpng_Line_18
  DEFW PicThanksForPlaying1bpng_Line_19
  DEFW PicThanksForPlaying1bpng_Line_20
  DEFW PicThanksForPlaying1bpng_Line_21
  DEFW PicThanksForPlaying1bpng_Line_22
  DEFW PicThanksForPlaying1bpng_Line_23
  DEFW PicThanksForPlaying1bpng_Line_24
  DEFW PicThanksForPlaying1bpng_Line_25
  DEFW PicThanksForPlaying1bpng_Line_26
  DEFW PicThanksForPlaying1bpng_Line_27
  DEFW PicThanksForPlaying1bpng_Line_28
  DEFW PicThanksForPlaying1bpng_Line_29
  DEFW PicThanksForPlaying1bpng_Line_30
  DEFW PicThanksForPlaying1bpng_Line_31
  DEFW PicThanksForPlaying1bpng_Line_32
  DEFW PicThanksForPlaying1bpng_Line_33
  DEFW PicThanksForPlaying1bpng_Line_34
  DEFW PicThanksForPlaying1bpng_Line_35
  DEFW PicThanksForPlaying1bpng_Line_36
  DEFW PicThanksForPlaying1bpng_Line_37
  DEFW PicThanksForPlaying1bpng_Line_38
  DEFW PicThanksForPlaying1bpng_Line_39
  DEFW PicThanksForPlaying1bpng_Line_40
  DEFW PicThanksForPlaying1bpng_Line_41
  DEFW PicThanksForPlaying1bpng_Line_42
  DEFW PicThanksForPlaying1bpng_Line_43
  DEFW PicThanksForPlaying1bpng_Line_44
  DEFW PicThanksForPlaying1bpng_Line_45
  DEFW PicThanksForPlaying1bpng_Line_46
  DEFW PicThanksForPlaying1bpng_Line_47
  DEFW PicThanksForPlaying1bpng_Line_48
  DEFW PicThanksForPlaying1bpng_Line_49
  DEFW PicThanksForPlaying1bpng_Line_50
  DEFW PicThanksForPlaying1bpng_Line_51
  DEFW PicThanksForPlaying1bpng_Line_52
  DEFW PicThanksForPlaying1bpng_Line_53
  DEFW PicThanksForPlaying1bpng_Line_54
  DEFW PicThanksForPlaying1bpng_Line_55
  DEFW PicThanksForPlaying1bpng_Line_56
  DEFW PicThanksForPlaying1bpng_Line_57
  DEFW PicThanksForPlaying1bpng_Line_58
  DEFW PicThanksForPlaying1bpng_Line_59
  DEFW PicThanksForPlaying1bpng_Line_60
  DEFW PicThanksForPlaying1bpng_Line_61
  DEFW PicThanksForPlaying1bpng_Line_62
  DEFW PicThanksForPlaying1bpng_Line_63
  DEFW PicThanksForPlaying1bpng_Line_64
  DEFW PicThanksForPlaying1bpng_Line_65
  DEFW PicThanksForPlaying1bpng_Line_66
  DEFW PicThanksForPlaying1bpng_Line_67
  DEFW PicThanksForPlaying1bpng_Line_68
  DEFW PicThanksForPlaying1bpng_Line_69
  DEFW PicThanksForPlaying1bpng_Line_70
  DEFW PicThanksForPlaying1bpng_Line_71
  DEFW PicThanksForPlaying1bpng_Line_72
  DEFW PicThanksForPlaying1bpng_Line_73
  DEFW PicThanksForPlaying1bpng_Line_74
  DEFW PicThanksForPlaying1bpng_Line_75
  DEFW PicThanksForPlaying1bpng_Line_76
  DEFW PicThanksForPlaying1bpng_Line_77
defw looper
  DEFB 1,12
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying1bpng_Line_90
  DEFW PicThanksForPlaying1bpng_Line_91
  DEFW PicThanksForPlaying1bpng_Line_92
  DEFW PicThanksForPlaying1bpng_Line_93
  DEFW PicThanksForPlaying1bpng_Line_94
  DEFW PicThanksForPlaying1bpng_Line_95
  DEFW PicThanksForPlaying1bpng_Line_94
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW EndCode
PicThanksForPlaying2png:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50-8
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicThanksForPlaying2png_DrawOrder
JP JumpToNextLine


PicThanksForPlaying2png_Line_3:
ld hl,&FFE0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+629
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_4:
ld hl,&FFDC
add hl,sp
ld sp,hl
LD HL,&0904
  Push HL
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_5:
ld hl,&FFE0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+635
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_6:
ld hl,&FFE0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+641
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_7:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&840A
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&C405
  Push BC
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_8:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&4809
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0B26
  Push BC
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_9:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&4000
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0040
  Push BC
Ld H,B
Ld L,B

  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_10:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&2000
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0080
  Push BC
Ld H,B
Ld L,B

  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_11:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&2088
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&1000
  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_12:
ld hl,&FFDA
add hl,sp
ld sp,hl
LD HL,&1000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_13:
ld hl,&FFDA
add hl,sp
ld sp,hl
LD HL,&2200
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_16:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0000
  Push HL
ld hl,&FFE0
add hl,sp
ld sp,hl
LD BC,&2000
  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_17:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0011
  Push HL
ld hl,&FFEE
add hl,sp
ld sp,hl
LD BC,&0000
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&1000
  Push HL
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_18:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&CC55
  Push BC
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&0008
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0088
  Push HL

Ld C,H

  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_19:
call BitmapPush8
defw BitmapData+649
ld hl,&FFF0
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0080
  Push HL
Ld B,H
Ld C,H

  Push BC
ld hl,&FFE8
jp NextLineSPshift


PicThanksForPlaying2png_Line_20:
LD HL,&0008
  Push HL
LD BC,&0F00
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&3300
  Push HL
ld hl,&FFF0
add hl,sp
ld sp,hl
Ld B,C
  Push BC
LD HL,&0008
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
Ld C,&40
  Push BC
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_21:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+655
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&0088
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0020
  Push HL
ld hl,&FFE6
jp NextLineSPshift


PicThanksForPlaying2png_Line_22:
call BitmapPush8
defw BitmapData+663
ld hl,&FFF0
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying2png_Line_23:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+671
ld hl,&FFF2
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying2png_Line_24:
call BitmapPush10
defw BitmapData+681
ld hl,&FFF2
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying2png_Line_25:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+55
ld hl,&FFF2
add hl,sp
ld sp,hl
LD DE,&0000
  PUSH DE
  PUSH DE
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying2png_Line_26:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+689
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0066
  Push HL
Ld B,H
Ld C,H

  Push BC
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying2png_Line_27:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+697
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+703
ld hl,&FFDC
jp NextLineSPshift


PicThanksForPlaying2png_Line_28:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+81
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+713
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&C054
  Push HL
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying2png_Line_29:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+95
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&EEDD
  Push HL
LD BC,&0000
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+719
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying2png_Line_30:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+727
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+733
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+739
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying2png_Line_31:
call BitmapPush10
defw BitmapData+749
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+755
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+761
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying2png_Line_32:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+769
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&EEFF
  Push HL
LD BC,&7500
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+775
ld hl,&FFE4
jp NextLineSPshift


PicThanksForPlaying2png_Line_33:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&1FCF
  Push HL
LD BC,&7C0F
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+781
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+795
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+801
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying2png_Line_34:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+809
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+815
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+825
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&3021
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+831
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+837
jp NextLineDecSP4


PicThanksForPlaying2png_Line_35:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+183
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+815
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+845
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&8801
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+851
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+857
jp NextLineDecSP4


PicThanksForPlaying2png_Line_36:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&17E3
  Push HL
LD BC,&F08D
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+863
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+869
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&A4E1
  Push HL
LD BC,&8087
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&01F0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+877
jp NextLineDecSP4


PicThanksForPlaying2png_Line_37:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&D0F0
  Push HL
LD BC,&7000
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+883
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&6870
  Push HL
LD BC,&2C03
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&07E0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+891
jp NextLineDecSP4


PicThanksForPlaying2png_Line_38:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+897
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+903
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&A430
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&1E20
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&110F
  Push HL
jp NextLineDecSP8


PicThanksForPlaying2png_Line_39:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F0F0
  Push HL
LD BC,&D0F0
  Push BC
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+909
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F070
  Push HL
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&0100
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&7821
  Push HL
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying2png_Line_40:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&E0F0
  Push HL
ld hl,&FFEC
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+923
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+929
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&7703
  Push BC
LD HL,&6F03
  Push HL
ld hl,&FFFA
jp NextLineSPshift


PicThanksForPlaying2png_Line_41:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&F0C1
  Push HL
LD BC,&80F0
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
Ld H,C
Ld L,C

  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+935
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+941
ld hl,&FFF2
add hl,sp
ld sp,hl
LD BC,&FF0E
  Push BC
jp NextLineDecSP8


PicThanksForPlaying2png_Line_42:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&14E0
  Push HL
LD BC,&90F0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FFE1
  Push HL
LD BC,&00E0
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+947
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0804
  Push HL
LD BC,&EE33
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+953
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying2png_Line_43:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&3800
  Push HL
LD BC,&C0F0
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&5000
  Push HL
LD BC,&F0DE
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+959
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&AB04
  Push HL
LD BC,&0000
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&1070
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&8020
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicThanksForPlaying2png_Line_44:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&7001
  Push HL
LD BC,&E0F8
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&3080
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&0008
  Push BC
Ld H,B
Ld L,B

  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&0C84
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
Ld L,&F0
  Push HL
LD BC,&1CB4
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicThanksForPlaying2png_Line_45:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&E000
  Push HL
LD BC,&F0FC
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
Ld H,B
Ld L,B

  Push HL
ld hl,&FFF6
add hl,sp
ld sp,hl
LD BC,&0002
  Push BC
LD HL,&80EE
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
Ld C,&85
  Push BC
LD HL,&70E0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&80F0
  Push BC
LD HL,&1070
  Push HL
ld hl,&FFF6
add hl,sp
ld sp,hl
LD BC,&CDFF
  Push BC
LD HL,&FFF0
  Push HL
ld hl,&FFFA
jp NextLineSPshift


PicThanksForPlaying2png_Line_46:
ld hl,&FFE6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+965
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0086
  Push HL
LD BC,&F0F2
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&80F0
  Push HL
LD BC,&10B0
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+971
jp NextLineDecSP4


PicThanksForPlaying2png_Line_47:
ld hl,&FFE6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+977
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0084
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+983
ld hl,&FFF6
add hl,sp
ld sp,hl
LD BC,&F334
  Push BC
ld hl,&FFFA
jp NextLineSPshift


PicThanksForPlaying2png_Line_48:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0003
  Push HL
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+989
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush14
defw BitmapData+1003
ld hl,&FFF0
jp NextLineSPshift


PicThanksForPlaying2png_Line_49:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0CCD
  Push HL
LD BC,&0E00
  Push BC
ld hl,&FFF0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1009
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0877
  Push HL
LD BC,&F174
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1015
ld hl,&FFEE
jp NextLineSPshift


PicThanksForPlaying2png_Line_50:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1021
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0804
  Push HL
LD BC,&008F
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&4E02
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&8CFF
  Push BC
LD HL,&E232
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&00F0
  Push BC
LD HL,&0070
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
Ld C,&C0
  Push BC
ld hl,&FFF0
jp NextLineSPshift


PicThanksForPlaying2png_Line_51:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&7F7F
  Push HL
LD BC,&7FFF
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0801
  Push HL
LD BC,&028E
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&000F
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1027
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1033
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&0070
  Push BC
ld hl,&FFF6
jp NextLineSPshift


PicThanksForPlaying2png_Line_52:
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&3F2F
  Push HL
LD BC,&2F67
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&0801
  Push HL
LD BC,&4E88
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1039
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&00C0
  Push HL
LD BC,&1070
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&8018
  Push HL
LD BC,&808F
  Push BC
jp NextLineDecSP8


PicThanksForPlaying2png_Line_53:
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+1045
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+1053
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1059
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1065
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&8068
  Push HL
LD BC,&A39E
  Push BC
jp NextLineDecSP8


PicThanksForPlaying2png_Line_54:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1073
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0E04
  Push HL
LD BC,&5899
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&3F07
  Push HL
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&22C8
  Push BC
LD HL,&DF37
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&8000
  Push BC
LD HL,&00E0
  Push HL
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&C0B0
  Push BC
LD HL,&FC1E
  Push HL
jp NextLineDecSP8


PicThanksForPlaying2png_Line_55:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1081
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1087
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&FF57
  Push HL
LD BC,&0000
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&5700
  Push HL
LD BC,&3F47
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&8030
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+1095
jp NextLineDecSP8


PicThanksForPlaying2png_Line_56:
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+1101
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1107
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&2EEF
  Push HL
LD BC,&0000
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&CE33
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1113
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+1121
jp NextLineDecSP8


PicThanksForPlaying2png_Line_57:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&C08C
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&FFF0
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+1127
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&88EF
  Push HL
LD BC,&0000
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&4411
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1133
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush6
defw BitmapData+1139
jp NextLineDecSP8


PicThanksForPlaying2png_Line_58:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&F7F0
  Push HL
LD BC,&1408
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1151
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&6633
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&00C0
  Push BC
LD HL,&90B0
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&D0F0
  Push BC
LD HL,&920F
  Push HL
jp NextLineDecSP8


PicThanksForPlaying2png_Line_59:
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush18
defw BitmapData+1169
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&1144
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&80F0
  Push BC
ld hl,&FFFA
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1175
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F030
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_60:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&048A
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&FFF0
  Push BC
LD HL,&3806
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1187
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&8F7F
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&00F0
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&7000
  Push BC

Ld L,C

  Push HL
LD BC,&00F0
  Push BC
LD HL,&380F
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&E030
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_61:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0803
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&FFF7
  Push BC
LD HL,&1C03
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1199
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&0000
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&00E0
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
Ld C,&E0
  Push BC
LD HL,&380F
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0300
  Push BC
LD HL,&D170
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_62:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FFF3
  Push HL
LD BC,&1C00
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+1211
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
ld hl,&FFF8
add hl,sp
ld sp,hl
LD BC,&00E0
  Push BC
LD HL,&30F0
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&1388
  Push BC
LD HL,&E270
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_63:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FF77
  Push HL
LD BC,&4400
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+1221
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&00E0
  Push HL
LD BC,&30C0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1188
  Push HL
LD BC,&E270
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_64:
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0488
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&CC00
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&0008
  Push HL
LD BC,&0109
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1988
  Push HL
LD BC,&7700
  Push BC
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&00E0
  Push HL
LD BC,&30C0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&3300
  Push HL
LD BC,&D570
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_65:
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0000
  Push HL
LD BC,&6106
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1109
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&00F0
  Push HL
Ld B,&10
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&E230
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_66:
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&FF33
  Push HL
LD BC,&0C00
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&0E03
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&0D02
  Push BC
LD HL,&0000
  Push HL
ld hl,&FFE4
add hl,sp
ld sp,hl
LD BC,&00C0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1004
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&E230
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_67:
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1227
ld hl,&FFD6
add hl,sp
ld sp,hl
LD HL,&84B4
  Push HL
ld hl,&FFFE
add hl,sp
ld sp,hl
LD BC,&903C
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F010
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_68:
ld hl,&FFCE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1233
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&F410
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_69:
ld hl,&FFD0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1239
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&E800
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_70:
ld hl,&FFD0
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+1245
ld hl,&FFFA
add hl,sp
ld sp,hl
LD HL,&C800
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_71:
ld hl,&FFD0
add hl,sp
ld sp,hl
LD HL,&000E
  Push HL
LD BC,&0F07
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&8800
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_72:
ld hl,&FFD0
add hl,sp
ld sp,hl
LD HL,&010E
  Push HL
LD BC,&0C07
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&B801
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_73:
ld hl,&FFD0
add hl,sp
ld sp,hl
LD HL,&0104
  Push HL
LD BC,&080F
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&5A06
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicThanksForPlaying2png_Line_74:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&000F
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying2png_Line_75:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&000E
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying2png_Line_76:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&000C
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying2png_Line_77:
ld hl,&FFCE
add hl,sp
ld sp,hl
LD HL,&0008
  Push HL
ld hl,&FFF4
jp NextLineSPshift


PicThanksForPlaying2png_Line_90:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&6600
  Push HL
jp NextLineDecSP8


PicThanksForPlaying2png_Line_91:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&3311
  Push HL
jp NextLineDecSP8


PicThanksForPlaying2png_Line_92:
ld hl,&FFCC
add hl,sp
ld sp,hl
LD HL,&0088
  Push HL
LD BC,&9900
  Push BC
jp NextLineDecSP8


PicThanksForPlaying2png_Line_93:
ld hl,&FFCA
add hl,sp
ld sp,hl
LD HL,&7722
  Push HL
jp NextLineDecSP8



PicThanksForPlaying2png_DrawOrder: 

  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying2png_Line_3
  DEFW PicThanksForPlaying2png_Line_4
  DEFW PicThanksForPlaying2png_Line_5
  DEFW PicThanksForPlaying2png_Line_6
  DEFW PicThanksForPlaying2png_Line_7
  DEFW PicThanksForPlaying2png_Line_8
  DEFW PicThanksForPlaying2png_Line_9
  DEFW PicThanksForPlaying2png_Line_10
  DEFW PicThanksForPlaying2png_Line_11
  DEFW PicThanksForPlaying2png_Line_12
  DEFW PicThanksForPlaying2png_Line_13
  DEFW PicThanksForPlaying2png_Line_13
  DEFW PicThanksForPlaying1bpng_Line_12
  DEFW PicThanksForPlaying2png_Line_16
  DEFW PicThanksForPlaying2png_Line_17
  DEFW PicThanksForPlaying2png_Line_18
  DEFW PicThanksForPlaying2png_Line_19
  DEFW PicThanksForPlaying2png_Line_20
  DEFW PicThanksForPlaying2png_Line_21
  DEFW PicThanksForPlaying2png_Line_22
  DEFW PicThanksForPlaying2png_Line_23
  DEFW PicThanksForPlaying2png_Line_24
  DEFW PicThanksForPlaying2png_Line_25
  DEFW PicThanksForPlaying2png_Line_26
  DEFW PicThanksForPlaying2png_Line_27
  DEFW PicThanksForPlaying2png_Line_28
  DEFW PicThanksForPlaying2png_Line_29
  DEFW PicThanksForPlaying2png_Line_30
  DEFW PicThanksForPlaying2png_Line_31
  DEFW PicThanksForPlaying2png_Line_32
  DEFW PicThanksForPlaying2png_Line_33
  DEFW PicThanksForPlaying2png_Line_34
  DEFW PicThanksForPlaying2png_Line_35
  DEFW PicThanksForPlaying2png_Line_36
  DEFW PicThanksForPlaying2png_Line_37
  DEFW PicThanksForPlaying2png_Line_38
  DEFW PicThanksForPlaying2png_Line_39
  DEFW PicThanksForPlaying2png_Line_40
  DEFW PicThanksForPlaying2png_Line_41
  DEFW PicThanksForPlaying2png_Line_42
  DEFW PicThanksForPlaying2png_Line_43
  DEFW PicThanksForPlaying2png_Line_44
  DEFW PicThanksForPlaying2png_Line_45
  DEFW PicThanksForPlaying2png_Line_46
  DEFW PicThanksForPlaying2png_Line_47
  DEFW PicThanksForPlaying2png_Line_48
  DEFW PicThanksForPlaying2png_Line_49
  DEFW PicThanksForPlaying2png_Line_50
  DEFW PicThanksForPlaying2png_Line_51
  DEFW PicThanksForPlaying2png_Line_52
  DEFW PicThanksForPlaying2png_Line_53
  DEFW PicThanksForPlaying2png_Line_54
  DEFW PicThanksForPlaying2png_Line_55
  DEFW PicThanksForPlaying2png_Line_56
  DEFW PicThanksForPlaying2png_Line_57
  DEFW PicThanksForPlaying2png_Line_58
  DEFW PicThanksForPlaying2png_Line_59
  DEFW PicThanksForPlaying2png_Line_60
  DEFW PicThanksForPlaying2png_Line_61
  DEFW PicThanksForPlaying2png_Line_62
  DEFW PicThanksForPlaying2png_Line_63
  DEFW PicThanksForPlaying2png_Line_64
  DEFW PicThanksForPlaying2png_Line_65
  DEFW PicThanksForPlaying2png_Line_66
  DEFW PicThanksForPlaying2png_Line_67
  DEFW PicThanksForPlaying2png_Line_68
  DEFW PicThanksForPlaying2png_Line_69
  DEFW PicThanksForPlaying2png_Line_70
  DEFW PicThanksForPlaying2png_Line_71
  DEFW PicThanksForPlaying2png_Line_72
  DEFW PicThanksForPlaying2png_Line_73
  DEFW PicThanksForPlaying2png_Line_74
  DEFW PicThanksForPlaying2png_Line_75
  DEFW PicThanksForPlaying2png_Line_76
  DEFW PicThanksForPlaying2png_Line_77
defw looper
  DEFB 1,12
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW PicThanksForPlaying2png_Line_90
  DEFW PicThanksForPlaying2png_Line_91
  DEFW PicThanksForPlaying2png_Line_92
  DEFW PicThanksForPlaying2png_Line_93
  DEFW PicThanksForPlaying1bpng_Line_93
  DEFW PicThanksForPlaying2png_Line_93
  DEFW PicThanksForPlaying1bpng_Line_93
  DEFW PicThanksForPlaying1bpng_Line_0
  DEFW EndCode







;Global Code
RLE_ImageWidth equ 38
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



ei

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
		ld de,&800+RLE_ImageWidth :ImageWidthD_Plus2
		add hl,de
	pop de
	ret nc
	push de
		ld de,&c050
		add hl,de
	pop de
	ret

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

ei
ret

EndCode:
ld sp,(StackRestore_Plus2-2)
ei
ret

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

BitmapPush18: ld b,&09
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
ld hl,&0850-16
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

defb &04,&10,&F7,&FC,&48,&00,&05,&CA,&00,&00
defb &1A,&84,&07,&01,&08,&00,&0A,&84,&00,&33
defb &FF,&FF,&00,&0F,&08,&00,&77,&EF,&0F,&0F
defb &3F,&3F,&FF,&0E,&03,&01,&4C,&CC,&8E,&00
defb &00,&33,&8F,&00,&00,&07,&4C,&00,&00,&67
defb &08,&03,&0E,&07,&2E,&11,&0F,&00,&00,&8E
defb &01,&3F,&EF,&0F,&1F,&33,&01,&08,&1F,&FF
defb &F1,&8F,&2E,&00,&01,&03,&FF,&FE,&F0,&C3
defb &CC,&45,&77,&C0,&77,&00,&00,&00,&01,&2E
defb &00,&70,&C0,&01,&88,&8D,&11,&44,&33,&B8
defb &91,&CC,&55,&0D,&54,&C0,&00,&00,&00,&F0
defb &20,&00,&FF,&DC,&33,&EE,&23,&0A,&40,&F0
defb &87,&0F,&F0,&F0,&10,&B3,&8F,&7C,&EF,&3F
defb &10,&8A,&8F,&00,&61,&30,&E1,&78,&F0,&81
defb &00,&73,&0F,&7C,&CF,&1F,&F8,&05,&01,&20
defb &B1,&C8,&D0,&89,&73,&0F,&DC,&CF,&3F,&37
defb &61,&22,&99,&88,&D5,&B2,&D3,&B1,&FF,&00
defb &F0,&86,&70,&E1,&1E,&70,&00,&71,&08,&F8
defb &C6,&13,&E8,&0E,&63,&09,&7C,&8E,&17,&B7
defb &D8,&F6,&D3,&B1,&EE,&00,&F0,&C0,&70,&F0
defb &F0,&30,&18,&E1,&1E,&FF,&F0,&FF,&00,&70
defb &8D,&F0,&E3,&17,&E0,&0E,&F0,&FF,&D7,&B1
defb &EE,&00,&00,&00,&E0,&10,&F0,&0F,&F0,&80
defb &2D,&0E,&01,&7C,&00,&F0,&61,&09,&78,&86
defb &16,&B7,&F7,&B3,&EE,&00,&00,&00,&4B,&08
defb &00,&64,&0E,&30,&86,&05,&F6,&B7,&CC,&00
defb &00,&00,&69,&00,&00,&45,&0F,&11,&8C,&01
defb &F0,&D0,&F0,&E0,&60,&0F,&FF,&FF,&DC,&7F
defb &CC,&00,&FF,&77,&E9,&7F,&88,&00,&00,&00
defb &70,&F0,&11,&3B,&FF,&FF,&CC,&FF,&C2,&77
defb &88,&00,&03,&20,&70,&40,&D0,&80,&55,&EE
defb &84,&37,&88,&00,&00,&10,&80,&00,&C0,&99
defb &F3,&CC,&08,&13,&00,&00,&10,&80,&E0,&E0
defb &70,&00,&F7,&8B,&00,&01,&00,&00,&10,&01
defb &00,&89,&00,&00,&0E,&E4,&04,&04,&13,&8B
defb &A0,&00,&88,&02,&00,&00,&F0,&D0,&60,&70
defb &E0,&00,&40,&00,&00,&24,&00,&00,&01,&08
defb &06,&D0,&80,&00,&F0,&00,&00,&01,&F2,&F0
defb &86,&00,&80,&00,&00,&68,&00,&00,&06,&60
defb &C0,&00,&F0,&00,&CC,&06,&06,&00,&0F,&03
defb &32,&E2,&FF,&DF,&04,&00,&00,&A0,&E0,&30
defb &C0,&00,&11,&44,&F7,&89,&4C,&00,&0C,&00
defb &67,&2F,&2F,&3F,&47,&2F,&3F,&FF,&8C,&13
defb &E0,&07,&33,&DF,&F3,&00,&08,&10,&F0,&A0
defb &E0,&70,&00,&00,&09,&00,&E7,&6F,&6F,&7F
defb &30,&80,&01,&0F,&E7,&2F,&2F,&3F,&E8,&80
defb &08,&04,&03,&09,&08,&00,&1E,&83,&F0,&F0
defb &70,&00,&10,&E0,&00,&06,&F0,&7F,&7F,&7F
defb &0F,&07,&0F,&09,&0C,&00,&B0,&C0,&F0,&80
defb &00,&00,&0F,&83,&58,&E0,&F0,&E0,&70,&E0
defb &08,&0B,&0F,&06,&0C,&00,&B0,&E0,&70,&F0
defb &00,&00,&0F,&21,&F0,&E0,&70,&F0,&11,&0F
defb &6E,&00,&09,&7F,&08,&0B,&0E,&82,&0E,&00
defb &01,&7F,&8F,&5D,&89,&BF,&0B,&09,&18,&05
defb &02,&00,&00,&01,&08,&14,&F0,&F7,&0F,&29
defb &F0,&D0,&70,&F0,&00,&FF,&7F,&AB,&5D,&BF
defb &0E,&04,&04,&09,&0A,&00,&00,&EF,&CF,&2B
defb &5D,&BF,&8C,&0D,&0B,&61,&02,&00,&00,&67
defb &FF,&BA,&D5,&9F,&8F,&0F,&0D,&06,&0A,&00
defb &EF,&5D,&99,&DF,&CE,&00,&03,&38,&06,&00
defb &33,&FF,&FF,&FF,&88,&0F,&3C,&80,&F0,&F0
defb &1E,&87,&70,&F0,&B4,&0F,&0C,&F0,&10,&F0
defb &E1,&0F,&0E,&00,&04,&00,&00,&00,&08,&00
defb &05,&02,&F1,&E8,&0A,&04,&07,&21,&08,&10
defb &5A,&04,&00,&00,&77,&88,&00,&04,&00,&00
defb &11,&FF,&FF,&FF,&CF,&0F,&77,&EF,&0F,&0F
defb &3F,&3F,&0C,&00,&00,&00,&FF,&0E,&03,&01
defb &4C,&CC,&00,&33,&8F,&00,&00,&07,&4C,&00
defb &8E,&00,&00,&8E,&01,&3F,&EF,&0F,&1F,&00
defb &01,&08,&1F,&FF,&F1,&8F,&2E,&01,&00,&00
defb &66,&11,&88,&00,&00,&70,&80,&51,&00,&00
defb &EE,&77,&88,&00,&54,&F0,&80,&00,&70,&F0
defb &11,&44,&33,&B8,&91,&CC,&55,&0A,&00,&00
defb &DD,&99,&CC,&00,&40,&30,&E1,&78,&F0,&80
defb &20,&00,&FF,&DC,&33,&EE,&23,&8A,&8E,&00
defb &00,&31,&FF,&77,&CC,&00,&61,&20,&A1,&48
defb &D0,&89,&10,&B3,&8F,&7C,&EF,&3F,&10,&05
defb &01,&22,&99,&88,&D5,&81,&63,&0F,&DC,&8F
defb &7F,&37,&61,&20,&91,&88,&D8,&B2,&D3,&A0
defb &00,&FD,&FF,&99,&88,&00,&F0,&96,&F0,&E1
defb &1E,&F0,&00,&73,&08,&7C,&CE,&13,&F8,&0E
defb &43,&03,&7C,&0C,&3F,&B7,&F0,&76,&D3,&A0
defb &11,&FC,&FF,&FF,&88,&00,&F0,&F0,&30,&F0
defb &E0,&70,&18,&F0,&F0,&FF,&FF,&FF,&00,&FF
defb &D7,&A0,&33,&FE,&FF,&EE,&F0,&C0,&70,&0F
defb &F0,&30,&3C,&C3,&1E,&F7,&F0,&F7,&61,&03
defb &78,&84,&3E,&B7,&F7,&80,&77,&FF,&33,&88
defb &78,&0E,&01,&7C,&00,&F0,&8E,&05,&F6,&80
defb &FF,&EE,&11,&EE,&4B,&08,&00,&64,&0E,&30
defb &84,&01,&F0,&B0,&F0,&F0,&E0,&0F,&FF,&33
defb &DC,&07,&FF,&CC,&CC,&33,&E8,&1B,&FF,&88
defb &00,&10,&80,&00,&D1,&3B,&CC,&00,&44,&77
defb &C1,&1B,&FF,&00,&03,&80,&F0,&40,&70,&00
defb &00,&EE,&82,&13,&EE,&00,&00,&01,&FC,&71
defb &8C,&99,&F1,&CC,&06,&01,&CC,&00,&10,&20
defb &60,&E0,&D0,&80,&F3,&8B,&08,&01,&88,&00
defb &10,&00,&22,&00,&88,&00,&0E,&F4,&85,&05
defb &77,&8B,&A0,&01,&23,&00,&88,&00,&F0,&E0
defb &C0,&00,&30,&C0,&40,&11,&00,&00,&08,&00
defb &E1,&08,&F0,&F0,&60,&00,&30,&C0,&00,&00
defb &F9,&F0,&8A,&00,&80,&13,&00,&01,&08,&00
defb &06,&E0,&B0,&00,&70,&80,&FF,&FF,&FF,&EE
defb &03,&03,&11,&54,&F7,&9F,&0C,&00,&00,&E0
defb &B0,&10,&E0,&00,&33,&DF,&F7,&44,&44,&00
defb &0D,&00,&E7,&6F,&6F,&7F,&33,&CF,&7F,&FF
defb &89,&BC,&04,&0C,&47,&3F,&E2,&00,&04,&10
defb &F0,&80,&F0,&10,&C0,&00,&09,&0F,&E7,&2F
defb &2F,&3F,&F8,&80,&00,&06,&F0,&7F,&7F,&7F
defb &A8,&80,&09,&F8,&01,&0E,&00,&00,&1E,&96
defb &F0,&E0,&F0,&00,&F0,&E0,&00,&14,&F0,&F7
defb &FF,&FF,&1D,&E8,&0D,&03,&00,&00,&B0,&E0
defb &30,&90,&C0,&00,&0F,&87,&B0,&D0,&F0,&F0
defb &F0,&E0,&0A,&01,&0C,&03,&00,&00,&B0,&F0
defb &70,&90,&C0,&00,&0F,&52,&F0,&D0,&F0,&F0
defb &00,&00,&0F,&6E,&00,&19,&0B,&0F,&0C,&0D
defb &00,&00,&00,&00,&FF,&8F,&5D,&99,&0D,&0F
defb &0A,&01,&08,&00,&00,&00,&08,&38,&F1,&FF
defb &0F,&5A,&F0,&A0,&F0,&F0,&00,&00,&FF,&7F
defb &AB,&5D,&0D,&0F,&41,&09,&08,&00,&00,&00
defb &67,&CF,&2B,&5D,&8C,&0C,&92,&04,&08,&00
defb &00,&00,&67,&FF,&BA,&D5,&8A,&02,&14,&06
defb &08,&00,&23,&EF,&5D,&99,&CE,&01,&28,&29
defb &08,&00,&00,&06,&06,&00,&00,&0F,&3C,&90
defb &F0,&E1,&3C,&0F,&F0,&F0,&69,&0F,&08,&F0
defb &30,&F0,&C3,&0F,&0C,&00
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

limit &BF00
LastByte:defb 1
save direct "T52-SC5.D04",FirstByte,LastByte-FirstByte
