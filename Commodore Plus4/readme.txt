3D Engine (Commodore BASIC 3.5)
for the Commodore plus/4
by Georgios Patsos 10.09.2020

Version differences:

v1.0:
First release. Included for historic reasons. Use v2.0 or v2.5.

v2.0: 
slower but more precise, because it calculates the Normals by itself. Userinterface is not refined.

v2.5:
faster but not so precise, because it imports the Normals from Blender. Userinterface is more refined. It has also the autocenter and autoscale feature.

Introduction:
With this software you can render Wavefront Obj-Files on a commodore plus/4, 16 or 116.The code also works on a commodore 128.

The idea for this experimental BASIC renderer is from 1985, when i got a commodore plus/4, my first computer. Consider it as experimental, it won't render every 3D model perfectly, but you can achieve good results. I tested the software on a real plus/4 and with the Yape-Emulator on full throttle (2000%) and DRIVE 8 mode in IEC Level/Performance mode. 

The code is kept small by intention with a very simple user-interface to have more RAM for the model-data left. Its also written by intention in BASIC to be easy portable on other Systems.

Improvements in Version 2.5:
* The exported obj-files have to contain the Face-Normals.
* Rendertime is reduced by another 40%
* you can render bigger model up to ~2800 verts, because of overall reduced code (20% less).
* Reworked user-interface. The parameter-values are typed in directly now.
* Importants Arrays are dimensioned according to the available memory.
* Improved render precision, because the face-normals are imported and not calculated any more.

Improvements in Version 2.0:
* You can render about 30% bigger models up to ~2500 verts
* Rendertime is reduced by 60 %
* Frame color can be alternated with "F" (helps when zooming and positioning the model)
* Screen memory can be saved in a file with "P"

How to render your own object (Yape):
 *  Create a 3d-Model in Blender (or other 3d-Programm) with max 25000 verts. But stay under 1000 verts at your first tries.
 *  Keep the models as simple as possible, convex and avoid too complex faces. Ideal are triangles or squares faces.
 *  Export your model as OBJ File with "write Normals" Option clicked
 *  Convert the OBJ File with converter_p4_Normals.exe (Dotnet-application). It outputs two files: vertex.seq and planes.seq
 *  Put DRIVE 8 in IEC level/Performance mode, choose a IEC-Folder and put vertex.seq and planes.seq in the IEC folder.
 *  Run the 3dengine BASIC-Code (i choose copy&paste from an editor). It loads vertex.seq and parses later planes.seq.
 *  Put the emulator in Full Throttle (Yape: Alt+W)

New Youtube tutorial (English): https://youtu.be/Zo7tMpFoxLY
Watch my channel to see some other models i have renderd with this small BASIC-Engine on other platforms like the Atari ST.

Usage:
After the vertices are loaded the model-vertices (point) are drawn first. 
When the Symbol (!) appears, you have following choices by pressing one of the following keys:
                                       
L - START RENDERING              
I - INFO: DISPLAY CURRENT VALUES        
                                        
X - ANGLE X-AXIS
Y - ANGLE Y-AXIS
Z - ANGLE Z-AXIS
                                        
V - VERTICAL POSITION
H - HORIZONTAL POSITION
                                        
M - ZOOM-FACTOR
C - DRAW ONLY FACES WITH AREA OVER CP
E - FISHEYE
D - SWITCH BETWEEN WIREFRAME (cd=0) AND FILLED FACES(cd=1)

F - Alternates the frame color (helps when zooming and positioning the model)
P - Saves the screen memory in a file

B - RESTART PROGRAM
Q - QUIT PROGRAMM

Important Variables in the code:
Line 30 gx=0:gy=135:gz=210 (Rotation of the object around the midpoint in x,y,z axis in degrees)
Line 40 cf=1:cd=0 (Wirefame) (Alternative: cf=0:cd=1  for filled polygons)
Line 50 dx=130:dy=90: l=14: cp=2  (dx,dy:Position of the midpoint in the Screen (Standard dx=160, dy=100), l = Scalefactor, cp=Filters all faces out, which have area value smaller 2

Delivered files:
 * converter_p4_Normals.exe
   Usage: converter_p4_Normals.exe <obj-file>
   Converts an OBJ file (e.g from Blender) into vertex.seq and planes.seq.

 * 3dengine25.bas
   The sourcecode of the 3dengine V2.0

 * 3deng25.prg
   Programm-file. Needs: vertex.seq and planes.seq
 
 * suzanneN.obj (orinal Object File with Normals as reference)

 * vertex.seq (Vertices of Suzanne)
 
 * planes.seq (Faces of Suzanne)

 * suzanne.png

This small project recieved general positive recations. Many people from all over the world, sceners, 3D artists, artists, engineers (NASA), programmers, filmakers, teachers, university-professors, gamedevelopers, youtubers, hobbyists and enthusiast like me, also people who arent involved in computers, contacted me to express how much they like the renders. These simple wireframe graphics seem to have a generall appeal to everyone.

Their positive feedback always kept me motivated to improve this little programm and push the boundaries further and further.

If you want to thank me and keep my motiviation up you can 

* buy me a coffe here:
  https://ko-fi.com/georgeschannel

* subscribe to my Youtube-Channel:
 https://www.youtube.com/@GeorgesChannel

* just give some positive ands constructive feedback

Greetings
George from "George's Channel"

