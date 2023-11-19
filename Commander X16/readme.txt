3D Engine v2.6
for the Commander X16 
by Georgios Patsos 2023-11-18
http://www.georgeschannel.de
https://www.youtube.com/@GeorgesChannel

Introduction:
With this very experimental software you can render Wavefront Obj-Files on the Commander X16. Testet only with X16 Emulator Win64 R44 (Windows)

The code is unoptimized, not bugfree and it won't render every 3D model perfectly, but with some effort and experience you can achieve good results. The software is a port from the commodore plus/4 version, which is the original main development version. 

The code is kept small by intention with a very simple user-interface to have more RAM for the model-data left. Its also written by intention in BASIC to be easy portable on other Systems.

How to run the program:
1. Put the two files vertex.seq and planes.seq into the X16 directory
2. Run the BASIC-Code (i choose copy&paste from an editor). It loads vertex.seq and parses later planes.seq (sequential files).

Usage:
After the vertices are loaded the model-vertices (points) are drawn first. 
When the Symbol (!) appears in upper left, you have following choices by pressing one of the following keys:
                                       
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
D - SWITCH BETWEEN WIREFRAME (cd=0) AND FILLED FACES(cd=5) (not working)

F - Alternates the frame color (helps when zooming and positioning the model)

U - SCALE MODEL UP TO BORDER
N - CENTER MODEL

B - RESTART PROGRAM
Q - QUIT PROGRAMM

How to render your own object:
 1. Create a 3d-Model in Blender (or other 3d-Programm) with max 800 verts
 2. Keep the models as simple as possible, convex and avoid too complex faces. Ideal are triangles or squares faces.
 3. Export your model as OBJ File with "write Normals" Option clicked
 4. Convert the OBJ File with converter_p4_Normals.exe (Dotnet-Application). It outputs two files: vertex.seq and planes.seq
 5. Put the two files vertex.seq and planes.seq into the X16 directory
 6. Run the BASIC-Code (i choose copy&paste from an editor). It loads vertex.seq and parses later planes.seq (sequential files).

Youtube tutorial (English, commodore plus/4 version): 
https://youtu.be/Zo7tMpFoxLY

Important Variables in the code:
Line 30 gx=0:gy=135:gz=210 
(Rotation of the object around the midpoint in x,y,z axis in degrees)

Line 50 dx=130:dy=90: l=14: cp=2  
(dx,dy:Position of the midpoint in the Screen (Standard dx=160, dy=100), l = Scalefactor, cp=Filters all faces out, which have area value smaller 2


Delivered files:
 * converter_p4_Normals.exe
   Usage: converter_p4_Normals.exe <obj-file>
   Converts an OBJ file (e.g from Blender) into vertex.seq and planes.seq.

 * 3dengine26X16.bas
   The sourcecode of the 3dengine V2.6
 
 * suzanneN.obj (orinal Object File with Normals as reference)

 * vertex.seq (Vertices of Suzanne)
 
 * planes.seq (Faces of Suzanne)

Epilog:
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

