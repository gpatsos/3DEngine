3D Engine v2.0 with Colors
for the Atari ST/TT
by Georgios Patsos 2024-01-23
http://www.georgeschannel.de
https://www.youtube.com/@GeorgesChannel

Video: 3D-Render of a Colorful Parrot on a Atari ST/TT in Omikron Basic | Codereview
Link: https://youtu.be/Qp9F1D72kcM

Infos
This code is used with Omikron-Basic 3.6 on an Atari TT (Med-Resolution)
If you want to use it with an ST (low Resolution) reduce these values by half
40 Dx!=320:Dy!=220:L!=80 

The code is unoptimized, not bugfree. The software is a port from the commodore plus/4 version, which is the original main development version. 

The code is kept small by intention with a very simple user-interface to have more RAM for the model-data left. Its also written by intention in BASIC to be easy portable on other Systems.

How to run the program:
1. Put the two files palette.seq, vertex.seq and planes.seq into c:\ (or change in code)

Usage:
After the vertices are loaded the model-vertices (points) are drawn first. 
When the Symbol (!) appears in upper left, you have following choices by pressing one of the following important keys:
                                       
L - START RENDERING              
I - INFO: DISPLAY CURRENT VALUES        

Important Variables in the code:
20 Gx!=0:Gy!=210:Gz!=180
(Rotation of the object around the midpoint in x,y,z axis in degrees)

40 Fs!=1200:Dx!=320:Dy!=220:L!=80
(dx,dy:Position of the midpoint in the Screen (Standard dx=160, dy=100), l = Scalefactor, cp=Filters all faces out, which have area value smaller 2


If you want to thank me and keep my motiviation up you can (optionally)
* become a patreon: 
  https://www.patreon.com/georgeschannel

* buy me a coffe here:
  https://ko-fi.com/georgeschannel

* subscribe to my Youtube-Channel:
 https://www.youtube.com/@GeorgesChannel

* just give some positive ands constructive feedback

Greetings
George from "George's Channel"

