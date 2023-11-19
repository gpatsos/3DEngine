3D Engine 2.5 (BASIC)

https://www.youtube.com/@GeorgesChannel
https://ko-fi.com/georgeschannel
http://www.georgeschannel.de

Introduction:
With this very experimental software you can render Wavefront Obj-Files on various 8bit/16bit machines mainly from the 80's/90's. 

The project startet on the Commodore Plus/4 in 2019 and its the main version, where all new features will implemented first.

The project is in constant development and the ports for different machines are in different states. I will add and update the various ports into this repository from time to time.

The code is usually unoptimized, not bugfree and it won't render every 3D model perfectly, but with some effort and experience you can achieve good results. Its kept small by intention with a very simple user-interface to have more RAM for the model-data left. Its also written by intention in BASIC to be easy portable on other systems.

How to run the program:
1. Put the two files vertex.seq and planes.seq into the accessable directory or disc
2. Run the BASIC-Code (i choose copy&paste from an editor into emulator). It loads vertex.seq and parses later planes.seq (sequential files).

Usage:
After the vertices are loaded the model-vertices (3d-points) are drawn first. 
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
D - SWITCH BETWEEN WIREFRAME (cd=0) AND FILLED FACES(cd=1)

F - Alternates the frame color (helps when zooming and positioning the model)

U - SCALE MODEL UP TO BORDER
N - CENTER MODEL

B - RESTART PROGRAM
Q - QUIT PROGRAMM

How to render your own object:
 1. Create a 3d-Model in Blender 2.79 (or other 3d-Programm) with max 800 verts (or more depending of your free BASIC memory)
 2. Keep the models as simple as possible, convex and avoid too complex faces. Ideal are triangles or squares faces.
 3. Export your model as OBJ File with "write Normals" Option clicked
 4. Convert the OBJ File with converter_p4_Normals.exe (Dotnet-Application). It outputs two files: vertex.seq and planes.seq
 5. Put the two files vertex.seq and planes.seq into the accesable directory/disc
 6. Run the BASIC-Code (i choose copy&paste from an editor). It loads vertex.seq and parses later planes.seq (sequential files).

Youtube tutorial (English, Commodore Plus/4 version): 
https://youtu.be/Zo7tMpFoxLY

Important Variables in the code:
Line 30 gx=0:gy=135:gz=210 
(Rotation of the object around the midpoint in x,y,z axis in degrees)

Line 50 dx=130:dy=90: l=14: cp=2  
(dx,dy:Position of the midpoint in the Screen (Standard dx=160, dy=100), l = Scalefactor, cp=Filters all faces out, which have area value smaller 2

If you want to thank me and keep my motiviation up you can 

* buy me a coffe here:
  https://ko-fi.com/georgeschannel

* subscribe to my Youtube-Channel:
 https://www.youtube.com/@GeorgesChannel

* just give some positive ands constructive feedback


Greetings
George from "George's Channel"
