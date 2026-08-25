// 3D Engine 64 version 1.0
// for the Commodore 64/128
// programmed with Oscar64
// release 2026-08-25
// by Georgios Patsos@George's Channel (youtube)

// ToDo
// * DoubleBuffer
// * Text in HiresMode

#include <c64/memmap.h>
#include <c64/vic.h>
#include <gfx/bitmap.h>
#include <math.h>
#include <fixmath.h>
#include <string.h>

#include <stdint.h>
#include <c64/types.h>
#include <stdio.h>
#include <c64/keyboard.h>

#pragma region( main, 0x0880, 0xcfff, , , {code, data, bss, heap, stack } )

// Sinus-Tabelle (Skalierung 64, 72 Einträge für 5-Grad-Schritte)
const signed char sin_tab[72] = {
    0, 6, 11, 16, 22, 27, 32, 37, 41, 45, 49, 52, 55, 58, 60, 62, 63, 64, 64, 64, 
    63, 62, 60, 58, 55, 52, 49, 45, 41, 37, 32, 27, 22, 16, 11, 6, 0, -6, -11, -16, 
    -22, -27, -32, -37, -41, -45, -49, -52, -55, -58, -60, -62, -63, -64, -64, -64, 
    -63, -62, -60, -58, -55, -52, -49, -45, -41, -37, -32, -27, -22, -16, -11, -6
};

// Hilfsfunktionen für Tabellen-Zugriff
#define GET_SIN(ang) sin_tab[(ang) % 72]
#define GET_COS(ang) sin_tab[((ang) + 18) % 72]


#define MAX_U 256
#define SCALE64 64
// Z-Sorting Strukturen
#define NUM_BUCKETS 256 // Anzahl der Tiefenstufen für die Sortierung

// Assuming these are global or defined elsewhere as in your snippet
int c, d, h, u, a;
int *x_pct, *y_pct, *z_pct, *z_rotated;
int *vx_pct, *vy_pct;
int *u_array;//, *sl, *xi;

int *plane_data = NULL;
int plane_data_count = 0;
int wireframeOn = 0;
int PaintersOn = 0;
int backcolor = 0;
int linecolor = 1;

int bucket_head[NUM_BUCKETS];
int face_next[MAX_U * 4]; // Verknüpfung der Flächen
int face_offset[MAX_U * 4]; // Startindex im plane_data

int min_x[200];
int max_x[200];

// Display buffer
//char * const Color = (char *)0xd000;
//char * const Hires = (char *)0xe000;

char * const Color = (char *)0xd000;
char * const Hires = (char *)0xe000;

// Bitmap for display screen
Bitmap		Screen;

// Clipping rectangle for screen
ClipRect	cr = {0, 0, 319, 199};

// A single point in 2D space
struct Point
{
	int x, y;	
};

// Init display
void init_hires(void)
{
	// Prepare IRQ trampoline, so we can use the RAM under the kernal
	mmap_trampoline();

	// Switch to RAM to init bitmap and screen
	mmap_set(MMAP_RAM);

	memset(Color, 0x50, 1000);
	memset(Hires, 0x00, 8000);

	mmap_set(MMAP_NO_ROM);

	// Set hires bitmap mode
	vic_setmode(VICM_HIRES, Color, Hires);

	vic.color_border = VCOL_BLACK;

	bm_init(&Screen, Hires, 40, 25);	
}


void ultra_fast_clear()
{
	//memset((void*)bitmap, 0, 8000);
	memset(Hires, 0x00, 8000);
}


const char* parse_next_int(const char* str, int* value) {
    int res = 0;
    signed char sign = 1;
    
    // Überspringe alles, was keine Zahl oder Vorzeichen ist
    while (*str && (*str < '0' || *str > '9') && *str != '-') str++;
    
    if (*str == '-') {
        sign = -1;
        str++;
    }
    
    while (*str >= '0' && *str <= '9') {
        res = res * 10 + (*str - '0');
        str++;
    }
    
    *value = res * sign;
    return str; // Gibt die aktuelle Position im String zurück
}

void load_vertex_data(void) {
    FILE *fp;
    char line[64];
    const char* ptr;
    int col = 1;
    
	//printf("1\n");
    fp = fopen("VERTEX,S,R", "r");
    if (fp == NULL) {
		printf("ERROR: FILE NOT FOUND\n");
		//bm_line(&Screen, &cr, 0, 0, 319, 1, 0xff, LINOP_XOR);	
		return;
	}

	//printf("2\n");
    // Header lesen: c, d, h, u
    if (fgets(line, sizeof(line), fp)) {
        ptr = line;
        ptr = parse_next_int(ptr, &c);
        ptr = parse_next_int(ptr, &d);
        ptr = parse_next_int(ptr, &h);
        ptr = parse_next_int(ptr, &u);
        
        // Memory allocation (wie gehabt)
        x_pct = (int*) malloc(c * sizeof(int));
        y_pct = (int*) malloc(c * sizeof(int));
        z_pct = (int*) malloc(c * sizeof(int));
        z_rotated = (int*) malloc(c * sizeof(int));
        vx_pct = (int*) malloc(c * sizeof(int));
        vy_pct = (int*) malloc(c * sizeof(int));
        u_array = (int*) malloc(u * sizeof(int));
    }

	printf("C: %d\n", c);
	printf("D: %d\n", d);
	printf("H: %d\n", h);
	printf("U: %d\n", u);
	printf("LOADING ...\n", u);
    // Punkte laden
    for (a = 1; a <= c; ++a) {
        if (fgets(line, sizeof(line), fp)) {
            ptr = line;
            ptr = parse_next_int(ptr, &x_pct[a-1]);
            ptr = parse_next_int(ptr, &y_pct[a-1]);
            ptr = parse_next_int(ptr, &z_pct[a-1]);
            
            col = (int)(((320L * 64L / c) * a) >> 6);
            
			//bm_line(&Screen, &cr, col, 0, col, 1, 0xff, LINOP_XOR);
			//printf("LLOADING\n");
        }
    }
	//printf("4\n");
    fclose(fp);
}

void load_plane_data(int capacity) {
    FILE *fp;
    int idx;
    int count = 0;
    int col;
    int current_val = 0;
    int has_digit = 0;
    int c_char;

    fp = fopen("PLANES,S,R", "r");
    if (fp == NULL) {
		//bm_line(&Screen, &cr, 0, 0, 319, 1, 0xff, LINOP_XOR);	
		return;
	}
		


    // Speicher reservieren (Prüfe, ob capacity * 2 in den RAM passt!)
    plane_data = (int*) malloc(capacity * sizeof(int));

    // Wir lesen die Datei Zeichen für Zeichen
    while ((c_char = fgetc(fp)) != EOF) {
        if (c_char >= '0' && c_char <= '9') {
            current_val = current_val * 10 + (c_char - '0');
            has_digit = 1;
        } else {
            // Sobald ein Nicht-Ziffer-Zeichen kommt (Komma, Leerzeichen, Newline)
            if (has_digit) {
                if (count < capacity) {
                    plane_data[count++] = current_val;
                    
                    // Fortschrittsbalken
                    col = (int)(((320L * 64L / capacity) * count) >> 6);
                    //drawline(col, 2, col, 2);
					//bm_line(&Screen, &cr, col, 2, col, 2, 0xff, LINOP_XOR);
                }
                current_val = 0;
                has_digit = 0;
            }
        }
    }
    
    // Falls die Datei mit einer Zahl endet ohne folgendes Trennzeichen
    if (has_digit && count < capacity) {
        plane_data[count++] = current_val;
    }

    plane_data_count = count;
    fclose(fp);
}


#define MODE_SET   0
#define MODE_CLEAR 1

int drawing_mode = MODE_SET; // Benutze eine eigene Variable statt 'setpixel'


void drawline(int x0, int y0, int x1, int y1) {
	if (drawing_mode == MODE_SET) {
		bm_line(&Screen, &cr, x0, y0, x1, y1, 0xff, LINOP_SET);
    } else {
		bm_line(&Screen, &cr, x0, y0, x1, y1, 0x00, LINOP_SET);
    }
}

/*void drawline(int x0, int y0, int x1, int y1) {
    int dx = abs(x1 - x0);
    int dy = -abs(y1 - y0);
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int err = dx + dy;
    int e2;

    // Bit-Tabelle für schnellen Zugriff ohne Shifting
    static const uint8_t bit_tab[] = {0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01};

    while (1) {
        // --- START OPTIMIERTE SET_PIXEL ---
        // Clipping Check (als unsigned int, um < 0 und >= 320/200 gleichzeitig zu fangen)
        if ((unsigned int)x0 < 320 && (unsigned int)y0 < 200) {
            // Y-Block berechnen (y / 8)
            uint16_t y8 = (y0 >> 3);
            // Adresse = Base + (y8 * 320) + (x & 0x1F8) + (y & 7)
            // 320 = 256 + 64
            uint16_t addr = (uint16_t) Hires + (y8 << 8) + (y8 << 6) + (x0 & 0x1F8) + (y0 & 7);
            uint8_t mask = bit_tab[x0 & 7];

            if (drawing_mode == MODE_SET) {
                *(volatile uint8_t*)addr |= mask;
            } else {
                *(volatile uint8_t*)addr &= ~mask;
            }
        }
        // --- ENDE OPTIMIERTE SET_PIXEL ---

        if (x0 == x1 && y0 == y1) break;

        e2 = err << 1; // Entspricht 2 * err

        if (e2 >= dy) { 
            err += dy; 
            x0 += sx; 
        }
        if (e2 <= dx) { 
            err += dx; 
            y0 += sy; 
        }
    }
}*/

void render_full_rotation(int degX, int degY, int degZ, int dx, int dy, int scale, int fs, int num_points) {
    unsigned char ix = (degX % 360) / 5;
    unsigned char iy = (degY % 360) / 5;
    unsigned char iz = (degZ % 360) / 5;

    // FIX 1: Cast to 'long' to prevent 16-bit overflow! 
    // 64 * 64 * 64 = 262,144, which destroys standard 16-bit ints.
    long sx = GET_SIN(ix), cx = GET_COS(ix);
    long sy = GET_SIN(iy), cy = GET_COS(iy);
    long sz = GET_SIN(iz), cz = GET_COS(iz);

    // Precompute 3x3 combined matrix (scaled by 64)
    int m00 = (cy * cz) >> 6;
    int m01 = (sx * sy * cz - cx * sz * 64L) >> 12;
    int m02 = (cx * sy * cz + sx * sz * 64L) >> 12;

    int m10 = (cy * sz) >> 6;
    int m11 = (sx * sy * sz + cx * cz * 64L) >> 12;
    int m12 = (cx * sy * sz - sx * cz * 64L) >> 12;

    int m20 = -sy;
    int m21 = (sx * cy) >> 6;
    int m22 = (cx * cy) >> 6;

    // --- NEW OPTIMIZATION ---
    // Bake 'scale' and 'd' directly into the matrix! 
    // We cast to 'long' here to prevent overflow if the user scales up massively.
    // The * 4L increases the fixed-point precision to 256 for the >> 8 trick.
    int m00_s = (int)((m00 * (long)scale * 4L) / d);
    int m01_s = (int)((m01 * (long)scale * 4L) / d);
    int m02_s = (int)((m02 * (long)scale * 4L) / d);

    int m10_s = (int)((m10 * (long)scale * 4L) / d);
    int m11_s = (int)((m11 * (long)scale * 4L) / d);
    int m12_s = (int)((m12 * (long)scale * 4L) / d);

    int m20_s = (int)((m20 * (long)scale * 4L) / d);
    int m21_s = (int)((m21 * (long)scale * 4L) / d);
    int m22_s = (int)((m22 * (long)scale * 4L) / d);

    int *px = x_pct, *py = y_pct, *pz = z_pct;
    int *pvx = vx_pct, *pvy = vy_pct, *prz = z_rotated;

    for (int i = 0; i < num_points; ++i) {
        // Read raw vertex data. NO MATH HERE!
        int x = *px++;
        int y = *py++;
        int z = *pz++;

        // Rotation AND Scaling happen simultaneously here!
        // >> 8 is lightning fast on the 6502 (it just reads the high-byte)
        int xp = (m00_s * x + m01_s * y + m02_s * z) >> 8;
        int yp = (m10_s * x + m11_s * y + m12_s * z) >> 8;
        int zp = (m20_s * x + m21_s * y + m22_s * z) >> 8;

        *prz++ = zp;

        int z_final = zp + fs;
        if (z_final == 0) z_final = 1;

        *pvx++ = dx + (int)(((long)xp * fs) / z_final);
        *pvy++ = dy + (int)(((long)yp * fs) / z_final);
    }
}

void scan_edge(int x1, int y1, int x2, int y2) {
    int tmp, y;
    long x, dx_step;
    if (y1 == y2) return;
    if (y1 > y2) { tmp = y1; y1 = y2; y2 = tmp; tmp = x1; x1 = x2; x2 = tmp; }
    dx_step = ((long)(x2 - x1) << 8) / (y2 - y1);
    x = (long)x1 << 8;
    for (y = y1; y <= y2; ++y) {
        if (y >= 0 && y < 200) {
            int cur_x = (int)(x >> 8);
            if (cur_x < min_x[y]) min_x[y] = cur_x;
            if (cur_x > max_x[y]) max_x[y] = cur_x;
        }
        x += dx_step;
    }
}

void render_wireframe() {
    int i = 0;
    int first_point_idx; // Speichert den ersten Punkt der aktuellen Fläche
    int current_point;
    int next_point;

    while (i < plane_data_count) {
        // Den ersten Punkt dieser Fläche merken, um die Fläche später zu schließen
        first_point_idx = plane_data[i]-1;

        // Innere Schleife: Gehe durch die Punkte der Fläche
        while (plane_data[i] != 0) {
            current_point = plane_data[i]-1;
            
            // Schau nach dem nächsten Punkt im Array
            if (plane_data[i + 1] == 0) {
                // Ende der Fläche erreicht -> Verbinde zurück zum ersten Punkt
                next_point = first_point_idx;
            } else {
                // Normaler nächster Punkt
                next_point = plane_data[i + 1]-1;
            }

            // Zeichne Linie von aktuellem Punkt zu nächstem Punkt
            // WICHTIG: Indizes oft -1, falls deine Datei bei 1 anfängt zu zählen
            drawline(vx_pct[current_point], vy_pct[current_point], 
                     vx_pct[next_point], vy_pct[next_point]);

            i++; // Nächster Punkt in der Fläche
        }

        // Ganz wichtig: i erhöhen, um die "0" zu überspringen!
        i++; 
    }
}


void draw_plane(int* indices, int n) {
    int i;
	if(PaintersOn == 1) {
		int ar = 0, y_min = 200, y_max = 0;
		for (i = 0; i < n; ++i) {
			int c_idx = indices[i], p_idx = indices[(i + n - 1) % n];
			//ar += (vx_pct[p_idx] + vx_pct[c_idx]) * (vy_pct[p_idx] - vy_pct[c_idx]);
			if (vy_pct[c_idx] < y_min) y_min = vy_pct[c_idx];
			if (vy_pct[c_idx] > y_max) y_max = vy_pct[c_idx];
		}
		//if (ar > 0) {
		for (i = y_min; i <= y_max; ++i) { min_x[i] = 320; max_x[i] = -1; }
		for (i = 0; i < n; ++i) scan_edge(vx_pct[indices[i]], vy_pct[indices[i]], vx_pct[indices[(i+1)%n]], vy_pct[indices[(i+1)%n]]);
		drawing_mode = MODE_CLEAR;
		for (i = y_min; i <= y_max; ++i) if (min_x[i] <= max_x[i]) drawline(min_x[i], i, max_x[i], i);
		drawing_mode = MODE_SET;
	}
    
	for (i = 0; i < n; ++i) drawline(vx_pct[indices[i]], vy_pct[indices[i]], vx_pct[indices[(i+1)%n]], vy_pct[indices[(i+1)%n]]);
    //}
}

void sort_and_render_faces(int fs) {
	
	if (wireframeOn == 1) {
		render_wireframe();
		return;
	}


    int i = 0, f_count = 0, b_idx, z_max, f;
    long ar; // Für die Flächenberechnung (Sichtbarkeit)
    
    memset(bucket_head, -1, sizeof(bucket_head));
	
    while (i < plane_data_count && f_count < (MAX_U * 4)) {
        int start = i;
        int n = 0;
        z_max = -32767;
        ar = 0; // Reset für Sichtbarkeitsprüfung
        
        // 1. Punkte der Fläche sammeln und Z-Max sowie Sichtbarkeit bestimmen
        while (plane_data[i] != 0) {
            int curr = plane_data[i] - 1;
            int next_idx = plane_data[i+1];
            
            // Falls der nächste Wert 0 ist, müssen wir zum Anfang der Fläche schließen
            if (next_idx == 0) next_idx = plane_data[start] - 1;
            else next_idx -= 1;

            // Z-Max für Sortierung
            if (z_rotated[curr] > z_max) z_max = z_rotated[curr];

            // Backface Culling (Schoelace Formula Teilschritt)
            // (x2 + x1) * (y2 - y1)
            ar += (long)(vx_pct[curr] + vx_pct[next_idx]) * (vy_pct[curr] - vy_pct[next_idx]);
            
            n++; i++;
        }
        
        // 2. Nur wenn Fläche sichtbar (ar > 0) und gültig (n >= 3)
        if (n >= 3 && ar > 0) {
            // Mapping auf 256 Buckets
            b_idx = (z_max + fs + 256) >> 2; 
            if (b_idx < 0) b_idx = 0; if (b_idx > 255) b_idx = 255;

            face_offset[f_count] = start;
            face_next[f_count] = bucket_head[b_idx];
            bucket_head[b_idx] = f_count++;
        }
        i++; // Überspringe den 0-Marker
    }

    // 3. Rendering: Nur die sichtbaren Flächen von hinten nach vorne
    for (b_idx = 255; b_idx >= 0; --b_idx) {
        f = bucket_head[b_idx];
        while (f != -1) {
            int off = face_offset[f], n_p = 0;
            while (plane_data[off + n_p] != 0) {
                u_array[n_p] = plane_data[off + n_p] - 1;
                n_p++;
            }
            
            // Da wir die Sichtbarkeit oben schon geprüft haben,
            // rufen wir draw_plane ohne interne ar-Prüfung auf oder 
            // zeichnen direkt den Inhalt.
            draw_plane(u_array, n_p); 
            
            f = face_next[f];
        }
    }
 }

void DoRender(int gx, int gy, int gz, int dx, int dy, int scale, int fs, int num_points) {
	
	render_full_rotation(gx, gy, gz, dx, dy, scale, fs, c);
	
	
	ultra_fast_clear();
	sort_and_render_faces(fs);
	
	// C64
	//switchVisiblePage();
    //switchDrawPage();
	
}


void Translate(int DX, int DY, int num_points) {
    // Statische Vorberechnung außerhalb der Schleife
    int *pvx = vx_pct;
    int *pvy = vy_pct;
	
    
	if (DX != 0) {
		for (int i = 0; i < num_points; ++i) {
			*pvx++ += DX;
		}
	}
	
	if (DY != 0) {
		for (int i = 0; i < num_points; ++i) {
			*pvy++ += DY;
		}
	}
}

void DoTranslate(int dx, int dy, int fs, int num_points) {
	
	Translate(dx, dy, c);
	ultra_fast_clear();
	sort_and_render_faces(fs);
	
	// C64
	//switchVisiblePage();
    //switchDrawPage();
}

#define KEY_UP    145
#define KEY_DOWN  17
#define KEY_LEFT  157
#define KEY_RIGHT 29

int main(void)
{
	int gx = 0, gy = 0, gz = 0, scale = 12;
    //float p = 3.14159/180; // BASIC 30: p=π/180
    int cf = 1, cd = 0, cc = 100;
    int fs = 400, dx = 160, dy = 100;
	char key;
    unsigned char running = 1;
	int frameon = 0;
    
	load_vertex_data();
	load_plane_data(h);
	
	init_hires();

	ultra_fast_clear();

	DoRender(gx, gy, gz, dx, dy, scale, fs, c);
		
	while (running==1) {
        
		keyb_poll();
            
		//Z-Achse
		if (key_pressed(KSCAN_Q)) { gz = (gz + 5) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
		if (key_pressed(KSCAN_E)) { gz = (gz - 5 + 360) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
		
		// 4. Werte anpassen
		if (key_pressed(KSCAN_S)) {gx = (gx + 5) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
		if (key_pressed(KSCAN_W)) {gx = (gx - 5 + 360) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c);}
            
		// Y-Achse
		if (key_pressed(KSCAN_A)) {gy = (gy + 5) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
		if (key_pressed(KSCAN_D)) { gy = (gy - 5 + 360) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
			
		// --- POSITION (dx, dy) ---
		if ((key_pressed(KSCAN_RSHIFT)) && (key_pressed(KSCAN_CSR_DOWN))) { dy -= 5; DoTranslate( 0,-5, fs, c); }
		if (!(key_pressed(KSCAN_RSHIFT)) && (key_pressed(KSCAN_CSR_DOWN))) { dy += 5; DoTranslate( 0, 5, fs, c); }
		if ((key_pressed(KSCAN_RSHIFT)) && (key_pressed(KSCAN_CSR_RIGHT))) { dx -= 5; DoTranslate(-5, 0, fs, c); }
		if (!(key_pressed(KSCAN_RSHIFT)) && (key_pressed(KSCAN_CSR_RIGHT))) { dx += 5; DoTranslate( 5, 0, fs, c); }
			
		// --- SCALE ---
		if (key_pressed(KSCAN_PLUS)) { scale += 1; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
		if (key_pressed(KSCAN_MINUS)) { if (scale > 1) scale -= 1; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
			
			// --- Load/Save ---
            /*case 'm': load_screen_with_header("screen"); break;adada
			case 'n': save_screen_with_header("screen"); break;*/

		if (key_pressed(KSCAN_X)) { wireframeOn = 1 - wireframeOn; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
		if (key_pressed(KSCAN_P)) { PaintersOn = 1 - PaintersOn; wireframeOn = 0; DoRender(gx, gy, gz, dx, dy, scale, fs, c); }
			
		if (key_pressed(KSCAN_C)) {
			backcolor = 1 - backcolor;  
			linecolor = 1 - linecolor;
			DoRender(gx, gy, gz, dx, dy, scale, fs, c);				
		}
			
		if (key_pressed(KSCAN_B)) {
			frameon = 1 - frameon;
			if (vic.color_border == VCOL_BLUE) {
				vic.color_border = VCOL_BLACK;
			}
			else { 
				vic.color_border = VCOL_BLUE;
			}
		}
		//case 'i': print(0,0,"GX:" + ; break;
	   
		// Programm beenden
		if (key_pressed(KSCAN_SPACE)) { running = 0; }
		
		
    }
    return 0;
}
