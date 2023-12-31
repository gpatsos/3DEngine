REM 3D-ENGINE 2.6 (COMMANDER X16)
REM RELEASE-DATE: 2023-11-18
REM BY GEORGES CHANNEL (YOUTUBE)
REM THE CODE-STATE IS UNOPTIMIZED AND NOT PRETTY
REM MAKE CHANGES TO YOUR LIKING
REM HAVE FUN!

NEW
CLS
10 SCREEN$80:COLOR5,0:CLS:FC=0
20 GOSUB 2500
30 GX=10:GY=195:GZ=180:P=3.1415926535/180
40 CF=5:CD=0:CC=100
50 FS=400:DX=160:DY=120:L=15:CP=2
60 OPEN 2,8,2,"0:VERTEX.SEQ,SEQ,R"
70 INPUT#2,C,D,H,U:DIMU(U):DIMSL(U)
80 DIMX%(C):DIMY%(C):DIMZ%(C):DIMXI(U)
90 DIMVX%(C):DIMVY%(C):FR=400
100 DIMOO%(FR):DIMOI%(FR):DIMFF%(FR*5)
110 HH=0:VV=0:GOSUB3300:?"LOADING VERTICES"
120 FORA=1TOC:
130 INPUT#2,X%(A),Y%(A),Z%(A)
150 HH=1:VV=0:GOSUB3300::? STR$(A)+"/"+STR$(C)
160 NEXT
170 CLOSE2:GOTO 470
210 REM7060
220 GET A$: IF A$="" THEN GOTO 220
230 IFA$="X"THENGOSUB3200:?"ANGLE X-AXIS ("+STR$(GX)+")":INPUTGX
240 IFA$="Y"THENGOSUB3200:?"ANGLE Y-AXIS ("+STR$(GY)+")":INPUTGY
250 IFA$="Z"THENGOSUB3200:?"ANGLE Z-AXIS ("+STR$(GZ)+")":INPUTGZ
320 IFA$="V"THENGOSUB3200:?"VERTICAL POS DY ("+STR$(DY)+")":INPUTDY
330 IFA$="H"THENGOSUB3200:?"HORIZONT.POS DX ("+STR$(DX)+")":INPUTDX
340 IFA$="C"THENGOSUB3200:?"FACES OVER CP ("+STR$(CP)+")":INPUTCP
355 IFA$="P"THEN GOSUB 2400
356 IFA$="F"THEN GOSUB 2398:GOTO210
357 IFA$="B"THEN CLR:GOTO10
370 IFA$="E"THENGOSUB3200:?"FISHEYE FS ("+STR$(FS)+")":INPUTFS
390 IFA$="M"THENGOSUB3200:?"ZOOM L ("+STR$(L)+")":INPUTL
410 IFA$="L"THEN TI$="000000":GOTO690
412 IFA$="Q"THEN CLS:END
413 IFA$="D"THEN CF=(NOT(CF))+2:CD=(NOT(CD))+2
414 IFA$="N"THEN GOSUB 5100: REM CENTER MODEL
415 IFA$="U"THEN GOSUB 7000: REM SCALE MODEL TO BORDER
420
430 IFA$="I"THEN GOSUB 3100: GOTO210
420
460 
470 REM7290
480 GOSUB 2500
490
500 RX=GX*P
510 RY=GY*P
520 RZ=GZ*P
530 CX=COS(RX):SX=SIN(RX)
540 CY=COS(RY):SY=SIN(RY)
550 CZ=COS(RZ):SZ=SIN(RZ)
560
570 FORNP=1TOC
575 GET B$:IF B$<>""THEN GOTO 210
580 XP=X%(NP)/D*L
590 YP=Y%(NP)/D*L
600 ZP=Z%(NP)/D*L
610
620 GOSUB 1290
630 X1=DX+INT(((XP*FS)/(ZP+FS))+0.5)
640 Y1=DY+INT(((YP*FS)/(ZP+FS))+0.5)
641 VX%(NP)=X1
642 VY%(NP)=Y1
650 PSET X1,Y1,CF
660 NEXT
670 POKE$30D,0:POKE$30E,0:SYS$FFF0:?"!":GOTO210
680
690POKE$30D,0:POKE$30E,0:SYS$FFF0:?"FIND FACES " :REM  + STR$(FRE(0))
700OPEN 2,8,2,"0:PLANES.SEQ,SEQ,R"
710I=1:FR=0:FF=0:II=0:FV=0
720FORA=1TOH
725IFI=1THENINPUT#2,M1,M2,M3:GOSUB4000
730INPUT#2,V
740U(I)=V:
750IFV>0THENI=I+1:GOTO770
751FR=FR+1:GOSUB790:I=1
770NEXT
780CLOSE2:GOSUB1500:T1=TI:GOTO 210
790REM11000
791IFVS=0THENRETURN
792GOSUB2390:REM POKE$30D,3:POKE$30E,0:SYS$FFF0:? "AR:"+STR$(AR)+" " + STR$(I):
793IF AR<=CP THEN RETURN
810OO=0
820FORG=1TOI-2
830LINEVX%(U(G)),VY%(U(G)),VX%(U(G+1)),VY%(U(G+1)),CF
831XP=X%(U(G)):YP=Y%(U(G)):ZP=Z%(U(G))
832GOSUB5000
840OO=OO+ZP
850NEXT
860LINEVX%(U(G)),VY%(U(G)),VX%(U(1)),VY%(U(1)),CF
870REM ?G, I: GRAPHIC 0: END
851XP=X%(U(G)):YP=Y%(U(G)):ZP=Z%(U(G))
852GOSUB5000
1190OO=(OO+ZP)/G:G=I:
1200FF=FF+1:POKE$30D,1:POKE$30E,0:SYS$FFF0:?"F:"+STR$(FF)
1210FV=FV+G:POKE$30D,2:POKE$30E,0:SYS$FFF0:? "V:"+STR$(FV)
1220OO%(FF) = OO
1221OI%(FF)=II+1
1230FORYY=1TOG-1
1240FF%(II+YY)=U(YY)
1250NEXT
1260FF%(II+G)=FR*(-1):II=II+G
1270RETURN
1280
1290REM40000
1300YT=YP:YP=CX*YT-SX*ZP:ZP=SX*YT+CX*ZP
1310XT=XP:XP=CY*XT+SY*ZP:ZP=-SY*XT+CY*ZP
1320XT=XP:XP=CZ*XT-SZ*YP:YP=SZ*XT+CZ*YP
1330RETURN
1340
1350REM40004
1360X1=VX%(P1):Y1=VY%(P1)
1370X2=VX%(P2):Y2=VY%(P2)
1380X3=VX%(P3):Y3=VY%(P3)
1390RETURN
1400
1410REM40020
1420REM SHELL SORT
1430 W1=FF
1431 POKE$30D,3:POKE$30E,0:SYS$FFF0:? "              "
1432 POKE$30D,2:POKE$30E,0:SYS$FFF0:? "              "
1435 POKE$30D,1:POKE$30E,0:SYS$FFF0:? STR$(FF)+"->"+STR$(W1)+ "    "
1440 IF W1<=0 THEN 1480
1445 W1=INT(W1/2): W2=FF-W1
1450 V=0
1455 FOR N1=0 TO W2
1460 W3=N1+W1
1465 IF OO%(N1)<OO%(W3)THEN GOSUB1477: V=1
1470 NEXT N1
1475 IF V>0 THEN 1450
1476 GOTO 1435
1477 S1=OO%(N1): OO%(N1)=OO%(W3): OO%(W3)=S1
1479 S1=OI%(N1): OI%(N1)=OI%(W3): OI%(W3)=S1
1480 RETURN
1490
1500REM41999
1510REMZEICHNESICHTBAREFACES
1520POKE$30D,0:POKE$30E,0:SYS$FFF0:?"SORT"
1530GOSUB1410
1540GOSUB 2500
1550K=1
1560FORJ=1TOFF
1570FORI=OI%(J)TOFV
1580U(K)=FF%(I)
1590IFFF%(I)>0THENK=K+1
1600IFFF%(I)<0THENGOSUB1970:K=1:GOTO1640
1620NEXTI
1630REM42111
1640NEXTJ
1650RETURN
1660
1670REMDRAW FACES
1970G=K:REM61200
1971IFU(G)<-1THENCS=3:GOTO 1980
1972 CS=2
1980N=G-1:IT=I:JT=J:TX=DX:TY=DY:TK=K:YN=200:YX=0:UG=U(G):U(G)=U(1)
1990
2000FORI=1TON
2010IFVY%(U(I))<YNTHENYN=VY%(U(I))
2020IFVY%(U(I))>YXTHENYX=VY%(U(I))
2030DY=VY%(U(I+1))-VY%(U(I))
2040DX=VX%(U(I+1))-VX%(U(I))
2050IFDY=0THENSL(I)=1.0
2060IFDX=0THENSL(I)=0.0
2070IF(DY<>0)AND(DX<>0)THENSL(I)=DX/DY
2080NEXT
2090CL=0:REM CL=RND(1)*255+1
2100FORY=YNTOYX-1
2110K=0
2120
2130FORI=1TON
2140IF((VY%(U(I))<=Y)AND(VY%(U(I+1))>Y))THENGOSUB2350
2150IF((VY%(U(I))>Y)AND(VY%(U(I+1))<=Y))THENGOSUB2350
2160NEXT
2170
2180FORJ=0TOK-2
2190FORI=0TOK-2
2200IFXI(I)>XI(I+1)THENT=XI(I):XI(I)=XI(I+1):XI(I+1)=T
2210NEXT
2220NEXT
2230
2240FORI=0TOK-1STEP2
2250LINE XI(I),Y,XI(I+1),Y,CL
2260NEXT
2270NEXT
2280
2290FORI=1TON
2300LINE VX%(U(I)),VY%(U(I)),VX%(U(I+1)),VY%(U(I+1)),5: REM CD
2310NEXT
2320
2330I=IT:J=JT:DX=TX:DY=TY:K=TK:U(G)=UG
2340RETURN
2350REM61600
2360XI(K)=VX%(U(I))+SL(I)*(Y-VY%(U(I)))
2370K=K+1
2380RETURN

2390 AR = 0
2391 AJ = I-1 
2392 FOR AI=1 TO I-1
2393 AR=AR+(VX%(U(AJ))+VX%(U(AI)))*(VY%(U(AJ))-VY%(U(AI)))
2394 AJ=AI
2395 NEXT AI
2396 AR=ABS(AR/2)
2397 RETURN 

2398 IFFC=0THENCOLOR4,2,1:FC=1:RETURN
2399 COLOR4,1:FC=0:RETURN

2400 RETURN: REM GFX SAVE ROUTINE
2500 CLS:FORI=0TO239:LINE0,I,319,I,0:NEXTI: RETURN: REM SCNCLR

3100 HH=0:VV=0:GOSUB3300:?"GX:"+STR$(GX)+" DX:"+STR$(DX)+" L:"+STR$(L)
3110 HH=1:VV=0:GOSUB3300:?"GY:"+STR$(GY)+" DY:"+STR$(DY)+" M:" + STR$(FRE(0))
3120 HH=2:VV=0:GOSUB3300:?"GZ:"+STR$(GZ)+" FS:"+STR$(FS)+" CD:" + STR$(CD)
3125 HH=3:VV=0:GOSUB3300:?"TI:"+STR$(T/60)+"S"
3130 RETURN

3200 POKE$30D,0:POKE$30E,0:SYS$FFF0:
3210 RETURN

3300 POKE$30D,HH:POKE$30E,VV:SYS$FFF0:RETURN
3310 RETURN

4000 XP=M1:YP=M2:ZP=M3
4620 GOSUB5000
4670 VS=0:IFZP<0.0THENVS=1
4780 RETURN

5000 ZP=SX*YP+CX*ZP
5010 ZP=-SY*XP+CY*ZP
5020 RETURN

5100 YN=32000: YM=-32000: XN=32000: XM=-32000: LM=0:RM=0:UM=0:DM=0:
5105 FOR I=1TO C
5106 POKE$30D,0:POKE$30E,0:SYS$FFF0:?"V:"+STR$(I)+ "/"+STR$(C)
5110 IF VX%(I)<XN THEN XN=VX%(I):LM=I
5120 IF VX%(I)>XM THEN XM=VX%(I):RM=I
5130 IF VY%(I)<YN THEN YN=VY%(I):UM=I
5140 IF VY%(I)>YM THEN YM=VY%(I):DM=I
5141 POKE$30D,1:POKE$30E,0:SYS$FFF0:?"MIN X:"+STR$(XN) + "  "
5142 POKE$30D,2:POKE$30E,0:SYS$FFF0:?"MAX X:"+STR$(XM) + "  "
5143 POKE$30D,3:POKE$30E,0:SYS$FFF0:?"MIN Y:"+STR$(YN) + "  "
5144 POKE$30D,4:POKE$30E,0:SYS$FFF0:?"MAX Y:"+STR$(YM) + "  "
5150 NEXT
5160 HO=YM-YN: BR=XM-XN
5170 DH=INT((240-HO)/2): DB=INT((320-BR)/2)
5180 DY =DY-(YN-DH): DX=DX-(XN-DB):
5185 POKE$30D,5:POKE$30E,0:SYS$FFF0:?"HO:"+STR$(HO)
5186 POKE$30D,6:POKE$30E,0:SYS$FFF0:?"BR:"+STR$(BR)
5187 POKE$30D,7:POKE$30E,0:SYS$FFF0:?"DH:"+STR$(DH)
5188 POKE$30D,8:POKE$30E,0:SYS$FFF0:?"DB:"+STR$(DB)
5189 POKE$30D,9:POKE$30E,0:SYS$FFF0:?"DX:"+STR$(DX)
5190 POKE$30D,11:POKE$30E,0:SYS$FFF0:?"DY:"+STR$(DY)
5191 REM COLOR1,3,2:
5192 REM DRAW1,VX%(LM),VY%(LM)
5193 REM DRAW1,VX%(RM),VY%(RM) 
5194 REM DRAW1,VX%(UM),VY%(UM) 
5195 REM DRAW1,VX%(DM),VY%(DM)
5199 REM GETKEYA$:COLOR1,6,4:
6000 RETURN

7000FORI=L+0.5TO2000STEP.5
7001POKE$30D,0:POKE$30E,0:SYS$FFF0:?"1:"+STR$(I)
7010XP=X%(LM)/D*I
7020YP=Y%(LM)/D*I
7030ZP=Z%(LM)/D*I
7040GOSUB1290
7050X1=DX+INT(((XP*FS)/(ZP+FS))+0.5)
7060Y1=DY+INT(((YP*FS)/(ZP+FS))+0.5)

8010XP=X%(RM)/D*I
8020YP=Y%(RM)/D*I
8030ZP=Z%(RM)/D*I
8040GOSUB1290
8050X2=DX+INT(((XP*FS)/(ZP+FS))+0.5)
8060Y2=DY+INT(((YP*FS)/(ZP+FS))+0.5)

9010XP=X%(UM)/D*I
9020YP=Y%(UM)/D*I
9030ZP=Z%(UM)/D*I
9040GOSUB1290
9050X3=DX+INT(((XP*FS)/(ZP+FS))+0.5)
9060Y3=DY+INT(((YP*FS)/(ZP+FS))+0.5)


10010XP=X%(DM)/D*I
10020YP=Y%(DM)/D*I
10030ZP=Z%(DM)/D*I
10040GOSUB1290
10050X4=DX+INT(((XP*FS)/(ZP+FS))+0.5)
10060Y4=DY+INT(((YP*FS)/(ZP+FS))+0.5)

11070IF((X1<0)OR(Y1<0))THEN GOTO 11101
11075IF((X1>320)OR(Y1>240))THEN GOTO 11101
11080IF((X2<0)OR(Y2<0))THEN GOTO 11101
11085IF((X2>320)OR(Y2>240))THEN GOTO 11101
11090IF((X3<0)OR(Y3<0))THEN GOTO 11101
11095IF((X3>320)OR(Y3>240))THEN GOTO 11101
11096IF((X4<0)OR(Y4<0))THEN GOTO 11101
11097IF((X4>320)OR(Y4>240))THEN GOTO 11101
11100NEXT 
11101L=I-0.5:RETURN
RUN
