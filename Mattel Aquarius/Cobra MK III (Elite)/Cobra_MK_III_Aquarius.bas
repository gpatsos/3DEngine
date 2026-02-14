new
20cls
30gx=-45:gy=30:gz=165:p=3.14159265359/180
40cf=1:cd=0:cc=100
50fs=200:dx=39:dy=35:l=7:cp=1
70read c,d,h,u$: dim u(val(u$)):dim sl(val(u$))
80dim x(c):dim y(c):dim z(c):dim xi(val(u$))
90dim vx(c):dim vy(c)
100dim oo(300):dim ou(300):dim oi(300):dim ff(1000)
110locate 1,1:print "LOADING VERTICES"
120fora=1toc:
130read x(a),y(a),z(a): y(a)=y(a)*1.25
150Locate 1,2:print str$(a)+"/"+str$(c)
160next

190goto470

210rem7060
220A$ = inkey$: if a$ ="" then goto 220
230ifa$="x"thengx=gx+15
240ifa$="y"thengy=gy+10
250ifa$="c"thengz=gz+15
260
270ifa$="b"thengx=gx-15
280ifa$="n"thengy=gy-15
290ifa$="m"thengz=gz-15

320ifa$="w"thendy=dy-5
330ifa$="a"thendx=dx-5
340ifa$="d"thendx=dx+5
350ifa$="s"thendy=dy+5
355ifa$="p"then gosub 2400

370ifa$="q"thenfs=fs+1:
380ifa$="e"thenfs=fs-1:
390ifa$="t"thenl=l+1:
400ifa$="g"thenl=l-1:
410ifa$="l"thencls:goto690
420
430ifa$="i"then print "gx:"+str$(gx)+"dx:"+str$(dx)+"l:"+str$(l)
440ifa$="i"then  print "gy:"+str$(gy)+"dy:"+str$(dy)
450ifa$="i"then  print "gz:"+str$(gz)+"fs:"+str$(fs):goto210

470rem7290
480cls

500rx=gx*p
510ry=gy*p
520rz=gz*p
530cx=cos(rx):sx=sin(rx)
540cy=cos(ry):sy=sin(ry)
550cz=cos(rz):sz=sin(rz)

570fornp=1toc
580xp=x(np)/d*l
590yp=y(np)/d*l
600zp=z(np)/d*l

620gosub1290
630x1=dx+(xp*fs)/(zp+fs)
640y1=dy+((yp*fs)/(zp+fs))
641vx(np)=x1
642vy(np)=y1
650 line (x1,y1)-(x1,y1)
660next
670print "!": goto210

690rem7600
700 print "find faces"
710i=1:fr=0:ff=0:ii=0:fv=0
720fora=1toh
730read v
740u(i)=v
750ifv<>0theni=i+1:goto 770
751fr=fr+1:gosub790:i=1
770next
780gosub1500: restore 5000: goto 220
790rem11000
810g=3:p0=u(g-2):a9=0
820rem11003
830p1=u(g-2):p2=u(g-1):p3=u(g)
840rem gosub1290
850ifg>3thenx1=x2:y1=y2:z1=z1
855ifg>3thenx2=x3:y2=y3:z2=z3:goto980
860xp=x(p1)
870yp=y(p1)
880zp=z(p1)
890gosub1290
900x1=xp:y1=yp:z1=zp

920xp=x(p2)
930yp=y(p2)
940zp=z(p2)
950gosub1290
960x2=xp:y2=yp:z2=zp:  rem print x2, y2, z2

980xp=x(p3)
990yp=y(p3)
1000zp=z(p3)
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
1160gosub1350: gosub 2390: rem print ar, x1,y1, x2,y2, x3,y3
1161 rem if ar<=cp then return
1170 line (x1,y1)-(x2,y2): line(x2,y2)-(x3,y3)
1180g=g+1
1190ifu(g)<>0thengoto820:
1191line (x2,y2)-(x3,y3): line (x3,y3)-(vx(p0),vy(p0))
1200ff=ff+1:rem char,0,1,"f:"+str$(ff)
1210fv=fv+g:rem char,0,2,"v:"+str$(fv)
1220oo(ff)=(z1+z2+z3):ou(ff)=fr:oi(ff)=ii+1
1230foryy=1tog-1
1240ff(ii+yy)=u(yy)
1250next
1260ff(ii+g)=fr*(-1):ii=ii+g
1270return

1290rem40000
1300yt=yp:yp=cx*yt-sx*zp:zp=sx*yt+cx*zp
1310xt=xp:xp=cy*xt+sy*zp:zp=-sy*xt+cy*zp
1320xt=xp:xp=cz*xt-sz*yp:yp=sz*xt+cz*yp
1330return

1350rem40004
1360x1=vx(p1):y1=vy(p1)
1370x2=vx(p2):y2=vy(p2)
1380x3=vx(p3):y3=vy(p3)
1390return

1410rem40020
1420rem shell sort
1430 W1=ff
1431 rem char,0,2,"         "
1432 rem char,0,3,"         "
1435 print str$(ff)+"->"+str$(W1)+ "    "
1440 IF W1<=0 THEN 1480
1445 W1=INT(W1/2): W2=ff-W1
1450 V=0
1455 FOR N1=0 TO W2
1460 W3=N1+W1
1465 IF oo(N1)<oo(W3)THEN gosub1477: V=1
1470 NEXT N1
1475 IF V>0 THEN 1450
1476 GOTO 1435
1477 S1=oo(N1): oo(N1)=oo(W3): oo(W3)=S1
1478 S1=ou(N1): ou(N1)=ou(W3): ou(W3)=S1
1479 S1=oi(N1): oi(N1)=oi(W3): oi(W3)=S1
1480 return

1500rem41999
1510remzeichnesichtbarefaces
1520print "sort":
1530gosub1410
1540cls
1550k=1
1560forj=1toff
1570fori=oi(j)tofv
1580u(k)=ff(i)
1590if ff(i)>0 thenk=k+1
1600if ff(i)<0 thenk=1
1610if (ff(i)<0) and (abs(ff(i))=ou(j)) then gosub1670: goto1630
1620nexti
1630rem42111
1640nextj
1650return

1670rem50000
1680remdrawface
1690g=3:p0=u(g-2)
1700rem51003
1710p1=u(g-2):p2=u(g-1):p3=u(g)
1711if(p3<0)then return
1720gosub1290

1740xp=x(p1)/d
1750yp=y(p1)/d
1760zp=z(p1)/d
1770gosub1290
1780x1=xp:y1=yp:z1=zp

1800xp=x(p2)/d
1810yp=y(p2)/d
1820zp=z(p2)/d
1830gosub1290
1840x2=xp:y2=yp:z2=zp

1860xp=x(p3)/d
1870yp=y(p3)/d
1880zp=z(p3)/d
1890gosub1290
1900x3=xp:y3=yp:z3=zp

1920gosub1350
1930g=g+1:
1940ifu(g)>0thengoto1700:goto 1950
1941gosub1970
1950return

1970rem61200
1980n=g-1:it=i:jt=j:tx=dx:ty=dy:tk=k:yn=200:yx=0:ug=u(g):u(g)=u(1)
1990goto 2290: rem optimierung
2000Fori=1Ton
2010ifvy(U(i))<ynThenyn=vy(U(i))
2020Ifvy(U(i))>yxThenyx=vy(U(i))
2030dy=vy(U(i+1))-vy(U(i))
2040dx=vx(U(i+1))-vx(U(i))
2050Ifdy=0Thensl(i)=1.0
2060Ifdx=0Thensl(i)=0.0
2070If(dy<>0)And(dx<>0)Thensl(i)=dx/dy
2080Next

2100Fory=ynToyx-1
2110k=0

2130Fori=1Ton
2140If((vy(U(i))<=y)And(vy(U(i+1))>y))Thengosub2350
2150If((vy(U(i))>y)And(vy(U(i+1))<=y))Thengosub2350
2160Next

2180Forj=0Tok-2
2190Fori=0Tok-2
2200Ifxi(i)>xi(i+1)Thent=xi(i):xi(i)=xi(i+1):xi(i+1)=t
2210Next
2220Next

2240Fori=0Tok-1step2
2250rem line (xi(i),y)-(xi(i+1),y),6:
2260Next
2270Next

2290Fori=1Ton
2300Line (vx(U(i)),vy(U(i)))-(vx(U(i+1)),vy(U(i+1)))
2310Next: 

2330i=it:j=jt:dx=tx:dy=ty:k=tk:u(g)=ug
2340return
2350rem61600
2360xi(k)=((vx(u(i))+sl(i)*(y-vy(u(i)))))
2370k=k+1
2380return

2390 ar = 0
2391 aj = i-1 
2392 for ai=1 to i-1
2393 ar=ar+(vx(u(aj))+vx(u(ai)))*(vy(u(aj))-vy(u(ai)))
2394 aj=ai
2395 next ai
2396 ar=abs(ar/2)
2397 return 

4000Data 28,100,73,8
4001Data -94,132,-8
4002Data 270,107,506
4003Data 270,186,-8
4004Data -411,-75,170
4005Data -411,-75,-188
4006Data 270,-75,-188
4007Data 270,-75,170
4008Data 270,53,-467
4009Data 270,2,-467
4010Data 270,9,-512
4011Data 270,46,494
4012Data 270,53,449
4013Data 270,9,494
4014Data 270,87,188
4015Data 270,106,48
4016Data 270,-41,48
4017Data 270,-21,188
4018Data 270,2,449
4019Data 270,46,-512
4020Data 270,106,-65
4021Data 270,107,-524
4022Data 270,87,-206
4023Data 270,-21,-206
4024Data 270,-22,740
4025Data 270,-41,-65
4026Data 270,-22,-758
4027Data 102,-25,-722
4028Data 102,-25,704

5000Data 1
5001Data 2
5002Data 3
5003Data 0
5004Data 6
5005Data 26
5006Data 21
5007Data 3
5008Data 2
5009Data 24
5010Data 7
5011Data 0
5012Data 6
5013Data 7
5014Data 4
5015Data 5
5016Data 0
5017Data 15
5018Data 14
5019Data 17
5020Data 16
5021Data 0
5022Data 27
5023Data 26
5024Data 6
5025Data 5
5026Data 0
5027Data 19
5028Data 8
5029Data 9
5030Data 10
5031Data 0
5032Data 21
5033Data 26
5034Data 27
5035Data 0
5036Data 25
5037Data 23
5038Data 22
5039Data 20
5040Data 0
5041Data 21
5042Data 27
5043Data 5
5044Data 1
5045Data 0
5046Data 4
5047Data 7
5048Data 24
5049Data 28
5050Data 0
5051Data 28
5052Data 2
5053Data 1
5054Data 4
5055Data 0
5056Data 3
5057Data 21
5058Data 1
5059Data 0
5060Data 4
5061Data 1
5062Data 5
5063Data 0
5064Data 24
5065Data 2
5066Data 28
5067Data 0
5068Data 12
5069Data 11
5070Data 13
5071Data 18
5072Data 0
run
