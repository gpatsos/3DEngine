new
scnclr
10graphic1,1:color4,1:color0,1:color1,6,4:fc=0
20scnclr:poke1344,1
30gx=5:gy=210:gz=180:p=ß/180
40cf=1:cd=0:cc=100
50fs=400:dx=160:dy=100:l=16:cp=2
60open8,8,12,"vertex,seq,read"
70input#8,c,d,h,u:dimu(u):dimsl(u)
80dimx%(c):dimy%(c):dimz%(c):dimxi(u)
90dimvx%(c):dimvy%(c):fr=fre(0)-600:fr=int((fr/2)/7)
100dimoo%(fr):dimoi%(fr):dimff%(fr*5)
110char,0,0,"loading vertices ": rem + str$(fr) + " " + str$(fre(0))
120fora=1toc:
130input#8,x%(a),y%(a),z%(a)
150char,0,1,str$(a)+"/"+str$(c)
160next
170close8:goto 470
210rem7060
220getkeya$
230ifa$="x"thengosub3200:?"angle x-axis ("+Str$(gx)+")":INPUTgx:graphic1
240ifa$="y"thengosub3200:?"angle y-axis ("+Str$(gy)+")":INPUTgy:graphic1
250ifa$="z"thengosub3200:?"angle z-axis ("+Str$(gz)+")":INPUTgz:graphic1
320ifa$="v"thengosub3200:?"vertical pos dy ("+Str$(dy)+")":INPUTdy:graphic1
330ifa$="h"thengosub3200:?"horizontal pos dx ("+Str$(dx)+")":INPUTdx:graphic1
340ifa$="c"thengosub3200:?"only faces over cp ("+Str$(cp)+")":INPUTcp:graphic1
355ifa$="p"then gosub 2400
356ifa$="f"then gosub 2398:goto210
357ifa$="b"then clr:goto10
370ifa$="e"thengosub3200:?"fisheye fs ("+Str$(fs)+")":INPUTfs:graphic1
390ifa$="m"thengosub3200:?"zoom l ("+Str$(l)+")":INPUTl:graphic1
410ifa$="l"then scnclr:Ti$="000000":goto690
412ifa$="q"thengraphic 0:end
413ifa$="d"then cf=(not(cf))+2:cd=(not(cd))+2
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
575get b$:if b$<>""then 210
580xp=x%(np)/d*l
590yp=y%(np)/d*l
600zp=z%(np)/d*l
610
620gosub1290
630x1=dx+int(((xp*fs)/(zp+fs))+0.5)
640y1=dy+int(((yp*fs)/(zp+fs))+0.5)
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
725ifi=1theninput#8,m1,m2,m3:gosub4000
730input#8,v
740u(i)=v:
750ifv>0theni=i+1:elsefr=fr+1:gosub790:i=1
770next
780close8:gosub1500:goto 210
790rem11000
791ifvs=0thenreturn
792gosub 2390:rem char,0,3,"ar:"+str$(ar)+" " + str$(i):
793if ar<=cp then return
810oo=0
820Forg=1Toi-2
830draw1,vx%(u(g)),vy%(u(g))tovx%(u(g+1)),vy%(u(g+1))
831xp=x%(u(g)):yp=y%(u(g)):zp=z%(u(g))
832gosub1290
840oo=oo+zp
850Next
860draw1,vx%(u(g)),vy%(u(g))tovx%(u(1)),vy%(u(1))
870rem ?g, i: graphic 0: end
851xp=x%(u(g)):yp=y%(u(g)):zp=z%(u(g))
852gosub1290
1190oo=oo+zp/g:g=i:
1200ff=ff+1:char,0,1,"f:"+str$(ff)
1210fv=fv+g:rem char,0,2,"v:"+str$(fv)
1220oo%(ff) = oo
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
1600ifff%(i)<0thengosub1970:k=1:goto1640
1620nexti
1630rem42111
1640nextj
1650return
1660
1670remDraw faces
1970g=k:rem61200
1971ifu(g)<-1thencs=3:elsecs=2
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
2360xi(k)=vx%(u(i))+sl(i)*(y-vy%(u(i)))
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

2400 REM GFX Save Routine
3010 SA=DEC("07f2"):SX=SA+1:SY=SX+1:SR=SY+1
3020 TB=DEC("0333"):DRV=8
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
3120 char,0,2,"gz:"+str$(gz)+" fs:"+str$(fs)+" cd:" + str$(cd)
3130 return
3200 fori=0to20:?chr$(13):next:graphic2
3210 return

4000 xp=m1:yp=m2:zp=m3
4620 gosub1290
4670 vs=0:ifzp<0.0thenvs=1
4780 return
run
