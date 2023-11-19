new
scnclr
10graphic1,1:color4,1:color0,1:color1,6,4:fc=0
20scnclr:poke1344,1
30gx=0:gy=135:gz=210:p=ß/180
40cf=1:cd=0:cc=100
50fs=400:dx=130:dy=90:l=14:cp=2
60open8,8,12,"vertex,seq,read"
70input#8,c,d,h,u:dimu(u):dimsl(u)
80dimx%(c):dimy%(c):dimz%(c):dimxi(u)
90dimvx%(c):dimvy%(c)
100dimoo%(1000):dimoi%(1000):dimff%(5000)
110char,0,0,"loading vertices"
120fora=1toc:
130input#8,x%(a),y%(a),z%(a)
150char,0,1,str$(a)+"/"+str$(c)
160next
170close8:goto 470
210rem7060
220getkeya$
230ifa$="x"thengx=gx+15
240ifa$="y"thengy=gy+15
250ifa$="c"thengz=gz+15
260
270ifa$="b"thengx=gx-15
280ifa$="n"thengy=gy-15
290ifa$="m"thengz=gz-15
300
310
320ifa$="w"thendy=dy-20
330ifa$="a"thendx=dx-20
340ifa$="d"thendx=dx+20
350ifa$="s"thendy=dy+20
355ifa$="p"then gosub 2400
356ifa$="f"then gosub 2398:goto210

370ifa$="q"thenfs=fs+1:
380ifa$="e"thenfs=fs-1:
390ifa$="t"thenl=l+1:
400ifa$="g"thenl=l-1:
410ifa$="l"thenscnclr:Ti$="000000":goto690
420
430ifa$="i"thengosub3100:goto210
420
460
470rem7290
480scnclr
490
500rx=gx*p
510ry=gy*p
520rz=gz*p
530cx=cos(rx):sx=sin(rx)
540cy=cos(ry):sy=sin(ry)
550cz=cos(rz):sz=sin(rz)
560
570fornp=1toc
580xp=x%(np)/d*l
590yp=y%(np)/d*l
600zp=z%(np)/d*l
610
620gosub1290
630x1=dx+(xp*fs)/(zp+fs)
640y1=dy+((yp*fs)/(zp+fs))
641vx%(np)=x1
642vy%(np)=y1
650draw1,x1,y1
660next
670char,0,0,"!":goto210
680
690color4,1
698char,0,0,"find faces " :rem  + str$(fre(0))
700open8,8,12,"planes,seq,read"
710i=1:fr=0:ff=0:ii=0:fv=0
720fora=1toh
730input#8,v
740u(i)=v
750ifv<>0theni=i+1:else fr=fr+1:gosub790:i=1
770next
780close8:gosub1500:goto 210
790rem11000
810g=3:p0=u(g-2):a9=0:oo=0
820rem11003
830p1=u(g-2):p2=u(g-1):p3=u(g)
840rem gosub1290
850ifg>3thenx1=x2:y1=y2:z1=z1
855ifg>3thenx2=x3:y2=y3:z2=z3:goto980
860xp=x%(p1)
870yp=y%(p1)
880zp=z%(p1)
890gosub1290
900x1=xp:y1=yp:z1=zp
910
920xp=x%(p2)
930yp=y%(p2)
940zp=z%(p2)
950gosub1290
960x2=xp:y2=yp:z2=zp
970
980xp=x%(p3)
990yp=y%(p3)
1000zp=z%(p3)
1010gosub1290
1020x3=xp:y3=yp:z3=zp

1030ifg>3then1150
1040lx=x2-x1:px=x3-x1
1050ly=y2-y1:py=y3-y1
1060lz=z2-z1:pz=z3-z1
1070
1080xn=(ly*pz)-(lz*py)
1090yn=(lz*px)-(lx*pz)
1100zn=(lx*py)-(ly*px)
1150ifzn>0thenreturn
1160gosub1350: gosub 2390:char,0,3,"ar:"+str$(ar)+"      "
1161if ar<=cp then return
1170ifg=3thendraw1,x1,y1tox2,y2tox3,y3:elsedraw1tox3,y3
1180g=g+1:oo=oo+z1
1190ifu(g)<>0thengoto820:elsedrawcftovx%(p0),vy%(p0):oo=(oo+z2+z3)/(g-1)
1200ff=ff+1:char,0,1,"f:"+str$(ff)
1210fv=fv+g:char,0,2,"v:"+str$(fv)
1220oo%(ff) = oo:rem oo%(ff)=(z1+z2+z3)
1221oi%(ff)=ii+1
1230foryy=1tog-1
1240ff%(ii+yy)=u(yy)
1250next
1260ff%(ii+g)=fr*(-1):ii=ii+g
1270return
1280
1290rem40000
1300yt=yp:yp=cx*yt-sx*zp:zp=sx*yt+cx*zp
1310xt=xp:xp=cy*xt+sy*zp:zp=-sy*xt+cy*zp
1320xt=xp:xp=cz*xt-sz*yp:yp=sz*xt+cz*yp
1330return
1340
1350rem40004
1360x1=vx%(p1):y1=vy%(p1)
1370x2=vx%(p2):y2=vy%(p2)
1380x3=vx%(p3):y3=vy%(p3)
1390return
1400
1410rem40020
1420rem shell sort
1430 W1=ff
1431 char,0,2,"         "
1432 char,0,3,"         "
1435 char,0,1,str$(ff)+"->"+str$(W1)+ "    "
1440 IF W1<=0 THEN 1480
1445 W1=INT(W1/2): W2=ff-W1
1450 V=0
1455 FOR N1=0 TO W2
1460 W3=N1+W1
1465 IF oo%(N1)<oo%(W3)THEN gosub1477: V=1
1470 NEXT N1
1475 IF V>0 THEN 1450
1476 GOTO 1435
1477 S1=oo%(N1): oo%(N1)=oo%(W3): oo%(W3)=S1
1479 S1=oi%(N1): oi%(N1)=oi%(W3): oi%(W3)=S1
1480 return
1490
1500rem41999
1510remzeichnesichtbarefaces
1520char,0,0,"sort":char,0,2,""
1530gosub1410
1540scnclr
1550k=1
1560forj=1toff
1570fori=oi%(j)tofv
1580u(k)=ff%(i)
1590ifff%(i)>0thenk=k+1
1600ifff%(i)<0thenk=1:gosub1670:goto1640
1620nexti
1630rem42111
1640nextj
1650return
1660
1670rem50000
1680remdrawface
1690g=3:p0=u(g-2)
1700rem51003
1710p1=u(g-2):p2=u(g-1):p3=u(g)
1711if(p3<0)then return
1720gosub1290
1730
1740xp=x%(p1)/d
1750yp=y%(p1)/d
1760zp=z%(p1)/d
1770gosub1290
1780x1=xp:y1=yp:z1=zp
1790
1800xp=x%(p2)/d
1810yp=y%(p2)/d
1820zp=z%(p2)/d
1830gosub1290
1840x2=xp:y2=yp:z2=zp
1850
1860xp=x%(p3)/d
1870yp=y%(p3)/d
1880zp=z%(p3)/d
1890gosub1290
1900x3=xp:y3=yp:z3=zp
1910
1920gosub1350
1930g=g+1:
1940ifu(g)>0thengoto1700:elsegosub1970
1950return
1960
1970rem61200
1980n=g-1:it=i:jt=j:tx=dx:ty=dy:tk=k:yn=200:yx=0:ug=u(g):u(g)=u(1)
1990
2000Fori=1Ton
2010ifvy%(u(i))<ynThenyn=vy%(u(i))
2020Ifvy%(u(i))>yxThenyx=vy%(u(i))
2030dy=vy%(u(i+1))-vy%(u(i))
2040dx=vx%(u(i+1))-vx%(u(i))
2050Ifdy=0Thensl(i)=1.0
2060Ifdx=0Thensl(i)=0.0
2070If(dy<>0)And(dx<>0)Thensl(i)=dx/dy
2080Next
2090
2100Fory=ynToyx-1
2110k=0
2120
2130Fori=1Ton
2140If((vy%(u(i))<=y)And(vy%(u(i+1))>y))Thengosub2350
2150If((vy%(u(i))>y)And(vy%(u(i+1))<=y))Thengosub2350
2160Next
2170
2180Forj=0Tok-2
2190Fori=0Tok-2
2200Ifxi(i)>xi(i+1)Thent=xi(i):xi(i)=xi(i+1):xi(i+1)=t
2210Next
2220Next
2230
2240Fori=0Tok-1step2
2250drawcd,xi(i),yTOxi(i+1),y
2260Next
2270Next
2280
2290Fori=1Ton
2300drawcf,vx%(u(i)),vy%(u(i))tovx%(u(i+1)),vy%(u(i+1))
2310Next
2320
2330i=it:j=jt:dx=tx:dy=ty:k=tk:u(g)=ug
2340return
2350rem61600
2360xi(k)=((vx%(u(i))+sl(i)*(y-vy%(u(i)))))
2370k=k+1
2380return

2390 ar = 0
2391 aj = i-1 
2392 for ai=1 to i-1
2393 ar=ar+(vx%(u(aj))+vx%(u(ai)))*(vy%(u(aj))-vy%(u(ai)))
2394 aj=ai
2395 next ai
2396 ar=abs(ar/2)
2397 return 

2398 iffc=0thencolor4,2,1:fc=1:elsecolor4,1:fc=0
2399 return
2400 return
2398 iffc=0thencolor4,2,1:fc=1:elsecolor4,1:fc=0
2399 return

2400 REM GFX Save Routine
3010 SA=DEC("07f2"):SX=SA+1:SY=SX+1:SR=SY+1
3020 TB=DEC("0333") : DRV=8
3030 REM filename 
3040 FI$="screen"+Str$(cc):FI=LEN(FI$)
3050 FORI=1TOFI:POKETB-1+I,ASC(MID$(FI$,I,1)):NEXT: REM filename to TB store
3060 POKESA,0:POKESX,DRV:POKESY,0:SYSDEC("ffba"): REM DRIVE 8
3070 POKESA,FI:POKESX,TBAND255:POKESY,TB/256:SYSDEC("ffbd"): REM filename KERNAL 
3080 POKEDEC("D1"),0:POKEDEC("D2"),DEC("18"):POKESY,DEC("3f"):POKESX,DEC("ff")
3081 pokesa,DEC("D1"): SYSDEC("ffd8")
3090 cc=cc+1: return

3100 char,0,0,"gx:"+str$(gx)+" dx:"+str$(dx)+" l:"+str$(l)
3110 char,0,1,"gy:"+str$(gy)+" dy:"+str$(dy)+" M:" + str$(fre(0))
3120 char,0,2,"gz:"+str$(gz)+" fs:"+str$(fs)
3130 return
run
