5 REM ***** you need simons basic 64 *****
10colour0,0:poke 646,5:gosub2400
30gx=10:gy=165:gz=180:p=3.14159265359/180
40cf=0:cd=1
50fs=200:dx=160:dy=100:l=10:cp=2
60open8,8,12,"vertex,seq,read"
70input#8,c$,d$,h$,u$:c%=val(c$):d%=val(d$):h=val(h$):
75dim u%(val(u$)):dim sl(val(u$))
80dimx%(c%):dimy%(c%):dimz%(c%):dimxi%(val(u$))
90dimvx%(c%):dimvy%(c%)
100dimoo%(400):dimou%(400):dimoi%(400):dimff%(3200)
110print at(0,0)"loading vertices"
120fora=1toc%:
130input#8,x%(a),y%(a),z%(a)
150print at(0,1)str$(a)+"/"+str$(c%)
160next
170close8:
180hires 5,0
190goto470
200
210rem7060
220geta$:ifa$=""thengoto220
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
360
370ifa$="q"thenfs=fs+1:
380ifa$="e"thenfs=fs-1:
390ifa$="t"thenl=l+1:
400ifa$="g"thenl=l-1:
410ifa$="l"thennrm:goto690
420
430ifa$="i"thentext,0,0"gx:"+str$(gx)+"dx:"+str$(dx)+"l:"+str$(l),1,1,1
440ifa$="i"thentext,0,10,"gy:"+str$(gy)+"dy:"+str$(dy),1,1,1
450ifa$="i"thentext at(0,20,"gz:"+str$(gz)+"fs:"+str$(fs),1,1,1:goto210
460
470rem7290
480
490
500rx=gx*p
510ry=gy*p
520rz=gz*p
530cx=cos(rx):sx=sin(rx)
540cy=cos(ry):sy=sin(ry)
550cz=cos(rz):sz=sin(rz)
560
570fornp=1toc%
580xp=x%(np)/d%*l
590yp=y%(np)/d%*l
600zp=z%(np)/d%*l
610
620gosub1290
630vx%(np)=dx+(xp*fs)/(zp+fs)
640vy%(np)=dy+(yp*fs)/(zp+fs)
650plotvx%(np),vy%(np),1
660next
670print at(0,0)"!":goto210

680
690rem7600
700open8,8,12,"planes,seq,read"
710i=1:fr=0:ff=0:ii=0
720fora=1toh
730input#8,v
740u%(i)=v
750ifv<>0theni=i+1:
751ifv=0thenfr=fr+1:gosub790:i=1
770next
780close8:gosub1500:goto210
790rem11000
800gosub2400:print at(0,0)"find faces"
810g=3:p0=u%(g-2):a9=0
820rem11003
830p1=u%(g-2):p2=u%(g-1):p3=u%(g)
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

1120remle=sqr(xn*xn+yn*yn+zn*zn)
1130remifle<>0thenxn=xn/le:yn=yn/le:zn=zn/le
1140remw=xn*x1+yn*y1+zn*z1
1150ifzn>0thenreturn
1160gosub1350: gosub 2390:print at(0,3)"ar:"+str$(ar)+"      "
1161if ar<=cp then return
1170rem linex1,y1,x2,y2,1:linex2,y2,x3,y3,1
1180g=g+1
1190ifu%(g)<>0thengoto820:
119rem 1ifu%(g)=0thenlinex2,y2,x3,y3,1:linex3,y3,vx%(p0),vy%(p0),1
1200ff=ff+1:print at(0,1)"f:"+str$(ff)
1210fv=fv+g:print at(0,2)"v:"+str$(fv)
1220oo%(ff)=(z1+z2+z3):ou%(ff)=fr:oi%(ff)=ii+1
1230foryy=1tog-1
1240ff%(ii+yy)=u%(yy)
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
1420remsort
1430for i=1 to (ff-1)
1440print at(0,1)str$(i)+"/"+str$(ff)
1450for j=(i+1)to ff
1460ifoo%(j)>oo%(i)thent=ou%(i):ou%(i)=ou%(j):ou%(j)=t:
1461ifoo%(j)>oo%(i)thent=oi%(i):oi%(i)=oi%(j):oi%(j)=t
1470ifoo%(j)>oo%(i)thent=oo%(i):oo%(i)=oo%(j):oo%(j)=t
1480nextj:nexti:return
1490
1500rem41999
1510remzeichnesichtbarefaces
1520gosub2400:print at(0,0)"sort":print at(0,2)""
1530gosub1410
1540hires 5,0
1550
1560for j=1 to ff
1570for i=oi%(j) to fv
1580u%(k)=ff%(i)
1590ifff%(i)>0thenk=k+1
1600if(ff%(i)<0)thenk=1
1610if(ff%(i)<0)and(abs(ff%(i))=ou%(j))thengosub1670:goto1630
1620nexti
1630rem42111
1640nextj
1650return
1660
1670rem50000
1680remdrawface
1690g=3:p0=u%(g-2)
1700rem51003
1710p1=u%(g-2):p2=u%(g-1):p3=u%(g)
1711if(p3<0)then return
1720gosub1290
1730
1740xp=x%(p1)/d%
1750yp=y%(p1)/d%
1760zp=z%(p1)/d%
1770gosub1290
1780x1=xp:y1=yp:z1=zp
1790
1800xp=x%(p2)/d%
1810yp=y%(p2)/d%
1820zp=z%(p2)/d%
1830gosub1290
1840x2=xp:y2=yp:z2=zp
1850
1860xp=x%(p3)/d%
1870yp=y%(p3)/d%
1880zp=z%(p3)/d%
1890gosub1290
1900x3=xp:y3=yp:z3=zp
1910
1920gosub1350
1930g=g+1:
1940ifu%(g)>0thengoto1700:
1941gosub1970
1950return
1960
1970rem61200
1980n=g-1:it=i:jt=j:tx=dx:ty=dy:tk=k:yn=200:yx=0:ug=u%(g):u%(g)=u%(1)
1990
2000for i=1 to n
2010ifvy%(u%(i))<ynthenyn=vy%(u%(i))
2020ifvy%(u%(i))>yxthenyx=vy%(u%(i))
2030dy=vy%(u%(i+1))-vy%(u%(i))
2040dx=vx%(u%(i+1))-vx%(u%(i))
2050ifdy=0thensl(i)=1.0
2060ifdx=0thensl(i)=0.0
2070if(dy<>0)and(dx<>0)thensl(i)=dx/dy
2080next
2090
2100for y=yn to yx-1
2110k=0
2120
2130fori=1ton
2140if((vy%(u%(i))<=y)and(vy%(u%(i+1))>y))thengosub2350
2150if((vy%(u%(i))>y)and(vy%(u%(i+1))<=y))thengosub2350
2160next
2170
2180 for j=0 to (k-2)
2190 for i=0 to (k-2)
2200ifxi(i)>xi(i+1)thent=xi(i):xi(i)=xi(i+1):xi(i+1)=t
2210next
2220next
2230
2240 for i=0 to (k-1) step2
2250linexi(i),y,xi(i+1),y,1
2260next
2270next
2280
2290fori=1ton
2300linevx%(u%(i)),vy%(u%(i)),vx%(u%(i+1)),vy%(u%(i+1)),0
2310next
2320
2330i=it:j=jt:dx=tx:dy=ty:k=tk:u%(g)=ug
2340return

2350rem61600
2351 zw = y-vy%(u%(i))
2352 zw = zw * sl(i)
2353 zz = vx%(u%(i))
2360 xi(k)=zz+zw
2370 k=k+1
2380return

2390 ar = 0
2391 aj = i-1 
2392 for ai=1 to (i-1)
2393 ar=ar+(vx%(u%(aj))+vx%(u%(ai)))*(vy%(u%(aj))-vy%(u%(ai)))
2394 aj=ai
2395 next ai
2396 ar=abs(ar/2)
2397 return 

2400 nrm:rem clearscreen
2410 a$="":s1=peek(51):s2=peek(52):poke 51,64:poke 52,63
2420 fort=1to125:a$=a$+chr$(0):next
2430 poke51,s1:poke52,s2
2440 return














