1 maxsprite=64
2 MODE 1:MEMORY &2000:INK 0,0:INK 1,4:INK 2,20:INK 3,26   
3 PRINT"SPRGRAB 3":PRINT:PRINT:PRINT   
10 PRINT"1.Frame 1"
20 PRINT"2.Frame 2"
30 PRINT"3.Frame 3"
40 PRINT"4.Frame 4"
50 PRINT"99 Test"
51 INPUT a
52 IF a=99 GOTO 1000
63 IF a=1 GOTO 500
64 IF a=2 GOTO 510
65 IF a=3 GOTO 520    
66 IF a=4 GOTO 530    
67 IF a=15 GOTO 900
68 IF a=16 GOTO 910  
69 IF a=17 GOTO 1100  
70 IF a=18 GOTO 1110
71 IF a=19 GOTO 1200  
72 IF a=20 GOTO 1210
73 IF a=21 GOTO 1300
74 IF a=22 GOTO 1310    
75 IF a=23 GOTO 1400    
76 IF a=24 GOTO 1410
100 LOAD "tiletest.scr"
110 CALL &8033,maxsprite*6                
115 CALL &8042          
120 FOR y=0 TO 1:FOR x=0 TO 3:CALL &8048,x*8,16*y,8,16,128,0,&8039:NEXT:NEXT     
125 SAVE "TileTest.tle",b,&4100,&500 
130 t!=TIME
140 FOR i=1 TO 5:CALL &8048,&8045:NEXT   
150 PRINT TIME-t!
160 END
250 PRINT TIME-t!
500 LOAD "Stage16.scr":GOSUB 600:SAVE "Stage16.spr",b,&4000,&2400
501 RUN
510 LOAD "Stage16b.scr":GOSUB 600:SAVE "Stage16b.spr",b,&4000,&2400      
511 RUN
520 LOAD "Stage16c.scr":GOSUB 600:SAVE "Stage16c.spr",b,&4000,&1000:RUN 
530 LOAD "Stage16d.scr":GOSUB 600:SAVE "Stage16d.spr",b,&4000,&1000:RUN 
600 CALL &8033,maxsprite*6
610 'CALL &8042 'only for aligned tiles!
620 y=0:FOR x=2 TO 7:CALL &8048,x*8,24*y,8,32,0,0,&8039:NEXT     
630 y=1:FOR x=0 TO 1:CALL &8048,x*8,32*y,8,32,0,0,&8039:NEXT       
631 y=1:x=2:CALL &8048,x*8,32*y,8,40,0,0,&8039
640 y=3:FOR X=0 TO 1:CALL &8048,x*6,24*y,6,24,0,0,&8039:NEXT       
644 y=3:X=2:CALL &8048,x*6,24*y,8,32,0,0,&8039            
650 aa=6*4
651 GOSUB 2001                 
666 aa=0
668 GOSUB 2001
669 y=4:X=0:CALL &8048,x*6,24*y,6,24,0,0,&8039      
670 CALL &8042:y=7
671 FOR a=0 TO 1       
672 x=1:CALL &8048, a*24+x*8,24*y+16,8,8,0,0,&8039           
673 NEXT
679 FOR a=0 TO 1
680 x=0:CALL &8048, a*24+x*8,24*y+8,8,16,0,0,&8039
682 x=2:CALL &8048, a*24+x*8,24*y+8,8,16,0,0,&8039 
683 NEXT
999 RETURN    
1000 c=0
1009 CLS:FOR i=1 TO 25:PRINT STRING$(40,"X");:NEXT  
1010 LOCATE 1,4
1020 FOR y=0 TO 3
1021 FOR x=0 TO 4      
1025 a=x+y*5+c        
1030 IF a<maxsprite THEN CALL &8048,a,x*24,y*48,&803C    
1040 NEXT
1050 NEXT
1060 INPUT "",a$
1065 c=c+20
1070 GOTO 1009
2001 y=2: x=5:CALL &8048,x*6+aa,24*y+8-16,6*3,16,0,0,&8039        
2002  x=5+3:CALL &8048,x*6+aa,24*y+8-16,6,16,0,0,&8039             
2003 y=3:x=5:CALL &8048,x*6+aa,24*y-8,6*3,24,0,0,&8039:x=5+3:CALL &8048,x*6+aa,24*y-8,6,24,0,0,&8039           
2004  y=4:x=5:CALL &8048,x*6+aa,24*y-8,6*3+128,24,0,0,&8039:x=5+3:CALL &8048,x*6+aa,24*y-8,6+128,24,0,0,&8039                   
2005  y=5:x=5:CALL &8048,x*6+aa,24*y-8,6*3+128,24,0,0,&8039:x=5+3:CALL &8048,x*6+aa,24*y-8,6+128,24,0,0,&8039          
2006 y=6:x=6:CALL &8048,x*6+aa,24*y-8,6*3,24,0,0,&8039:x=5+3:CALL &8048,x*6+aa,24*y-8,6,24,0,0,&8039               
2007 y=7:x=5:CALL &8048,x*6+aa,24*y-8,6*3,16,0,0,&8039:x=5+3:CALL &8048,x*6+aa,24*y-8,6,16,0,0,&8039    
2100 RETURN