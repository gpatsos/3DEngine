Experimental 3d Engine (Commodore BASIC 2.0 + Simons Basic 64)
by Georgios Patsos 04.09.2019

Introduction:
The idea for this experimental 3d Engine is from 1984, when i first got my commodore plus/4.
Considered as experimental, because rendering different large objects may need some changes in the code.

I wrote the 3D Engine for the commodore plus/4 in BASIC 3.5 first this year and converted the code to BASIC 2.0 + Simons BASIC 64 extension.
I exclusively tested it with the VICE-emulator.

How to render your own object:
 *  Create a 3d-Modell in Blender (or other 3d-Programm) with max 1000 verts.
 *  Export it as OBJ File with no Options clicked
 *  Convert the OBJ File with converter.exe. It outputs an vertex.seq and planes.seq
 *  Transfer the two files to the 3dengine.d64 diskimage
 *  Load 3dengine.prg from disk and type RUN

Files
 * converter.exe
   Usage: converter.exe <obj-file>
   Converts an OBJ file (e.g from Blender) into vertex.seq and planes.seq.

 * 3dengine.bas
   The sourcecode of the 3dengine

 * 3dengine.d64
   contains: 3dengine.prg, vertex.seq and planes.seq


USAGE:

WHEN YOU SEE A '!' PRESS FOLLOWING KEYS:
                                        
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
                                        
T - SCALE UP   BY +1 (L=L+1)            
G - SCALE DOWN BY -1 (L=L-1)            
Q - PERSPECTIVE ENHANCE  BY +1 FS=FS+1  
E - PERSPECTIVE DECREASE BY -1 FS=FS-1  
                                        
EMULATOR AT FULL SPEED IS RECOMMENDED   
      
