Experimental 3D engine in commdore BASIC 3.5 
by Georgios Patsos 20.06.2019

Introduction:
The idea for this experimental engine is from 1984, when i fist became my commodore plus/4.
Considered as experimental, because rendering different large objects may need some changes in the code.
I exclusively tested it with the Yape-emulator with full throttle (2000%) and DRIVE 8 mode in IEC level/Performance mode. 
The files are put in the IEC folder.
The programm may run on a commodore plus/4 with SD2IEC drive, but i did not tested.

How to render your own object:
 *  Create a 3d-Modell in Blender (or other 3d-Programm) with max 3.000 verts.
 *  Export it as OBJ File with no Options clicked
 *  Convert the OBJ File with converter.exe. It outputs an vertex.seq and planes.seq
 *  Run the 3dengine to load vertex.seq and planes.seq.

Files
 * converter.exe
   Usage: converter.exe <obj-file>
   Converts an OBJ file (e.g from Blender) into vertex.seq and planes.seq.

 * intro.prg
   A small introduction to the programm. Needs screen.prg

 * 3dengine.pas
   The sourcecode of the 3dengine

 * 3dengine.prg
   Programm-file. Needs: vertex.seq and planes.seq
