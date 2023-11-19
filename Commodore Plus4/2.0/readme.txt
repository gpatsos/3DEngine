3D Engine v2.0 (Commodore BASIC 3.5)
for the Commodore plus/4
by Georgios Patsos 04.08.2020

Introduction:
The idea for this experimental engine is from 1984, when i fist got my commodore plus/4. Considered it as experimental, because rendering large objects may need some changes in the code.
I tested the software on a real plus/4 and with the Yape-Emulator on full throttle (2000%) and DRIVE 8 mode in IEC Level/Performance mode. 

The code is kept small by intention with a very simple user-interface to have more RAM for the model-data left. 

Improvements in Version 2.0:
* You can render about 30% bigger models up to ~2500 verts
* Rendertime is reduced by 60 %
* Frame color can be alternated with "F" (helps when zooming and positioning the model)
* Screen memory can be saved in a file with "P"

How to render your own object (Yape):
 *  Create a 3d-Model in Blender (or other 3d-Programm) with max 25000 verts. But stay under 1000 verts at your first tries.
 *  Keep the models as simple as possible, concave and avoid to complex faces. Ideal are triangles or squares faces.
 *  Export your model as OBJ File with no options(!) clicked
 *  Convert the OBJ File with converter_p4.exe (Dotnet-application). It outputs two files: vertex.seq and planes.seq
 *  Put DRIVE 8 in IEC level/Performance mode, choose a IEC-Folder and put vertex.seq and planes.seq in the IEC folder.
 *  Run the 3dengine BASIC-Code (i choose copy&paste from an editor). It loads vertex.seq and parses later planes.seq.
 *  Put the emulator in Full Throttle (Yape: Alt+W)

Youtube tutorial (german): https://www.youtube.com/watch?v=9yp2uIUDPr0
Watch my channel to see some other models i have renderd with this small BASIC-Engine.

Usage:
After the vertices are loaded the model-vertices (point) are drawn first. 
When the Symbol (!) appears, you have following choices by pressing one of the following keys:
                                       
L - LINES: START RENDERING              
I - INFO: DISPLAY CURRENT VALUES        
                                        
X - ROTATE X-AXIS +15 DEGREES (GX=GX+15)
Y - ROTATE Y-AXIS +15 DEGREES (GY=GY+15)
C - ROTATE Z-AXIS +15 DEGREES (GZ=GZ+15)
B - ROTATE X-AXIS -15 DEGREES (GX=GX-15)
N - ROTATE Y-AXIS -15 DEGREES (GY=GY-15)
M - ROTATE Z-AXIS -15 DEGREES (GZ=GZ-15)
                                        
W - SHIFT UP    BY 20 PIXEL (DY=DY-20)  
A - SHIFT DOWN  BY 20 PIXEL (DX=DX-20)  
D - SHIFT RIGHT BY 20 PIXEL (DX=DX+20)  
S - SHIFT LEFT  BY 20 PIXEL (DY=DY+20)  
                                        
T - SCALE UP   BY +1 (L=L+1) - Zooming           
G - SCALE DOWN BY -1 (L=L-1) - Zooming           

Q - PERSPECTIVE ENHANCE  BY +1 FS=FS+1  
E - PERSPECTIVE DECREASE BY -1 FS=FS-1 

F - Alternates the frame color (helps when zooming and positioning the model)
P - Saves the screen memory in a file

Important Variables in the code:
Line 30 gx=0:gy=135:gz=210 (Rotation of the object around the midpoint in x,y,z axis in degrees)
Line 40 cf=1:cd=0 (Wirefame) (Alternative: cf=0:cd=1  for filled polygons)
Line 50 dx=130:dy=90: l=14: cp=2  (dx,dy:Position of the midpoint in the Screen (Standard dx=160, dy=100), l = Scalefactor, cp=Filters all faces out, which have area value smaller 2
Line 100 dimoo%(1000):dimoi%(1000):dimff%(5000) I set these values pretty high. If you run out of memory or you use a C16/c116 , these are the values you have to adapt the sizes. Keep the size of oo% euqal to oi% and ff% about 4-5 times size of oo% (you have to experiment).

Delivered files:
 * converter_p4.exe
   Usage: converter.exe <obj-file>
   Converts an OBJ file (e.g from Blender) into vertex.seq and planes.seq.

 * 3dengine20.bas
   The sourcecode of the 3dengine V2.0

 * 3deng20.prg
   Programm-file. Needs: vertex.seq and planes.seq

 * vertex.seq (Vertices of the SpaceX Crew Dragon)
 
 * planes.seq (Faces of the SpaceX Crew Dragon)

 * SpaceXCrewDragon.png (Screenshot of the finished render)

