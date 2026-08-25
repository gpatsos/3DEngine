// 3D Engine Oscar64 version 1.0
// for the Commodore Plus/4
// programmed with Oscar64
// release 2026-08-15
// by Georgios Patsos@George's Channel (youtube)
// Feel free to optimize the code and upload the optimization to this branch.

#pragma region( main, 0x4000,0xFD00, , , {code, data, bss, heap, stack} )
#pragma region( lower, 0x1100,0x1800, , , {data} )
 
#include <stdint.h>
#include <c64/types.h>
#include <stdio.h>
#include <string.h>

// TED Registers
#define TED_VCONTROL  (*(volatile uint8_t*)0xFF06)
#define TED_BITMAP_ADDR (*(volatile uint8_t*)0xFF14)

// Screen/Color Memory (For hires, this sets the foreground/background colors)
#define LUM_RAM    ((uint8_t*)0x1C00) 
#define BITMAP_RAM    ((uint8_t*)0x2000)
#define COLOR_RAM     ((uint8_t*)0x1800)

#define BITMAPRAM  0x2000 
#define BITMAPRAM2 0xC000

uint16_t bitmap  = 0x2000;

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

void SetViewPage1() {
    __asm { 
        lda $ff12
        and #%11000011
        ora #<($2000/1024)
        sta $ff12
    }
}

void SetViewPage2() {
    __asm { 
        lda $ff12
        and #%11000011
        ora #<($C000/1024)
        sta $ff12
    }
}

void SetDrawPage1() {
    bitmap = BITMAPRAM;
}

void SetDrawPage2() {
    bitmap = BITMAPRAM2;
}

void switchDrawPage() {
    if(bitmap == BITMAPRAM2) {
        bitmap = BITMAPRAM;
    } else {
        bitmap = BITMAPRAM2;
    }
}

void switchVisiblePage() {
    // FIX: Wir zeigen die Seite an, auf der wir GERADE gezeichnet haben!
    if(bitmap == BITMAPRAM2) {
        SetViewPage2();
    } else {
        SetViewPage1();
    }
}

void WaitForLastLine() {

	__asm{
		LDA #$CC
		CMP $FF1D
		BNE *-3
	}
}

// Inline function definition for a poke
inline void poke(unsigned addr, byte value)
{
	// Cast address int a volatile pointer, and assign the
	// referenced memory cell with the value
	*(volatile char *)addr = value;
}

// Inline function definition for a peek
inline byte peek(unsigned addr)
{
	// Cast address into a volatile pointer, and read
	// from the memory location
	return *(volatile char *)addr;
}

void init_hires() {
 __asm {
        SEI
        sta $ff3f
        LDA #$3B    
        STA $FF06
        lda $ff06
        ora #$20 
        sta $ff06
        LDA $FF12
        AND #$03    
        ORA #$08    
        STA $FF12
        lda $ff12
        and #%11000011
        ora #<($2000/1024)
        sta $ff12
        lda #>($1800)
        sta $ff14
        cli
    }

    poke(65305, 0);   // Border: Black
    for (uint16_t i = 0; i < 1000; i++) COLOR_RAM[i] = 4;
    for (uint16_t i = 0; i < 1000; i++) LUM_RAM[i] = 240;
}

// Definieren wir klare Modi
#define MODE_SET   0
#define MODE_CLEAR 1

int drawing_mode = MODE_SET; // Benutze eine eigene Variable statt 'setpixel'

/*void set_pixel(int x, int y) {
    // Schneller Check: Negative Werte werden durch den Cast zu riesigen positiven Werten
    if ((unsigned int)x >= 320 || (unsigned int)y >= 200) return;

    // 1. Berechne den Block-Offset (Y / 8 * 320)
    // 320 = 256 + 64. Das entspricht (y/8 << 8) + (y/8 << 6)
    uint16_t y8 = (y >> 3); 
    uint16_t block_y = (y8 << 8) + (y8 << 6);

    // 2. Berechne den X-Block-Offset (x / 8 * 8) -> einfach (x & 0x1F8)
    // 3. Addiere den Y-Offset innerhalb des Blocks (y & 7)
    uint16_t addr = BITMAP_RAM + block_y + (x & 0x1F8) + (y & 7);
    
    // Masken-Tabelle (Viel schneller als Shifting)
    static const uint8_t bit_tab[] = {0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01};
    uint8_t mask = bit_tab[x & 7];

    if (drawing_mode == MODE_SET) {
        *(volatile uint8_t*)addr |= mask;
    } else {
        *(volatile uint8_t*)addr &= ~mask;
    }
}*/

void drawline(int x0, int y0, int x1, int y1) {
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
            uint16_t addr = bitmap + (y8 << 8) + (y8 << 6) + (x0 & 0x1F8) + (y0 & 7);
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
    
    fp = fopen("VERTEX,S,R", "r");
    if (fp == NULL) {
        printf("ERROR: FILE NOT FOUND\n");
        while(1);
    }

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

    // Punkte laden
    for (a = 1; a <= c; ++a) {
        if (fgets(line, sizeof(line), fp)) {
            ptr = line;
            ptr = parse_next_int(ptr, &x_pct[a-1]);
            ptr = parse_next_int(ptr, &y_pct[a-1]);
            ptr = parse_next_int(ptr, &z_pct[a-1]);
            
            col = (int)(((320L * 64L / c) * a) >> 6);
            drawline(col, 0, col, 1);
        }
    }
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
    if (fp == NULL) return;

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
                    drawline(col, 2, col, 2);
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

void render_full_rotation(int degX, int degY, int degZ, int dx, int dy, int scale, int fs, int num_points) {
    // Statische Vorberechnung außerhalb der Schleife
    signed char sx, cx, sy, cy, sz, cz;
    
    // Index-Berechnung (schneller mit Vorberechnung)
    unsigned char ix = (degX % 360) / 5;
    unsigned char iy = (degY % 360) / 5;
    unsigned char iz = (degZ % 360) / 5;

    sx = GET_SIN(ix); cx = GET_COS(ix);
    sy = GET_SIN(iy); cy = GET_COS(iy);
    sz = GET_SIN(iz); cz = GET_COS(iz);

    // Pointer initialisieren für schnelleren Zugriff
    int *px = x_pct;
    int *py = y_pct;
    int *pz = z_pct;
    int *pvx = vx_pct;
    int *pvy = vy_pct;
    int *prz = z_rotated;

    // scale/d vorab berechnen (Fixed Point)
    // Wenn d konstant ist, berechne scale_factor einmal.
    // Falls d sich ändert, lass es hier stehen, aber zieh es aus der Schleife!
    int s_over_d = scale; // Annahme: d ist hier 1 oder wir verrechnen es vorher

    for (int i = 0; i < num_points; ++i) {
        // Lokale Kopien in Registern (oscar64 nutzt ZP für lokale Variablen)
        int xp = (*px++ * s_over_d) / d;
        int yp = (*py++ * s_over_d) / d;
        int zp = (*pz++ * s_over_d) / d;

        // Rotation X
        int xt = (cx * yp - sx * zp) >> 6;
        zp = (sx * yp + cx * zp) >> 6;
        yp = xt;

        // Rotation Y
        xt = (cy * xp + sy * zp) >> 6;
        zp = (-sy * xp + cy * zp) >> 6;
        xp = xt;

        // Rotation Z
        xt = (cz * xp - sz * yp) >> 6;
        yp = (sz * xp + cz * yp) >> 6;
        xp = xt;
	
        *prz++ = zp;
			
        // Perspektive: Division durch Multiplikation ersetzen?
        // Für den Moment: Nutze long nur dort, wo absolut nötig.
        int z_final = zp + fs;
        // oscar64 optimiert (long)xp * fs sehr gut, aber die Division bleibt teuer.
        *pvx++ = dx + (int)(((long)xp * fs) / z_final);
        *pvy++ = dy + (int)(((long)yp * fs) / z_final);
    }
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

void screen_off() {
	// Bit 4 auf 0 setzen, um das Bild schwarz zu schalten
    poke(0xFF06, peek(0xFF06) & 0xEF); 
}

void screen_on() {
    // Bit 4 auf 1 setzen, um das Bild wieder zu aktivieren
    poke(0xFF06, peek(0xFF06) | 0x10);
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

void ultra_fast_clear()
{
    // Clear bitmap memory first (avoiding garbage)
    //for (uint16_t i = 0; i < 8000; i++) BITMAP_RAM[i] = 0;
	memset((void*)bitmap, 0, 8000);
}

void DoRender(int gx, int gy, int gz, int dx, int dy, int scale, int fs, int num_points) {

	render_full_rotation(gx, gy, gz, dx, dy, scale, fs, c);
	
	ultra_fast_clear();
	sort_and_render_faces(fs);
	
	switchVisiblePage();
    switchDrawPage();
}

void DoTranslate(int dx, int dy, int fs, int num_points) {

	Translate(dx, dy, c);
	ultra_fast_clear();
	sort_and_render_faces(fs);

	switchVisiblePage();
    switchDrawPage();
}

#define KEY_UP    145
#define KEY_DOWN  17
#define KEY_LEFT  157
#define KEY_RIGHT 29

// Wir legen die Variable manuell auf eine freie Adresse in der Zero-Page (z.B. $02)
#define KEY_TEMP_ADDR 0x02
#define key_result (*(volatile unsigned char*)KEY_TEMP_ADDR)

char wait_for_key() {
    key_result = 0;

    while (key_result == 0) {
        __asm {
			sei         // Interrupts aus! (WICHTIG)
            sta $ff3e       // ROM ein
            jsr $ffe4       // Kernal GETIN
            // Wir speichern direkt auf die Speicheradresse $02
            sta KEY_TEMP_ADDR 
            sta $ff3f       // ROM aus
			cli         // Interrupts wieder an
        }
    }

    return (char)key_result;
}

int main() {
	__asm { 
	    sta $ff3f 
		sei 
		
	} // Interrupts ganz am Anfang aus!
	
	int gx = 30, gy = 30, gz = 30, scale = 9;
    //float p = 3.14159/180; // BASIC 30: p=π/180
    int cf = 1, cd = 0, cc = 100;
    int fs = 400, dx = 160, dy = 100;
	char key;
    unsigned char running = 1;
	unsigned char frameon = 0;
    
	init_hires();
    
	ultra_fast_clear();

	load_vertex_data();
	load_plane_data(h);
	
	SetViewPage1();
    SetDrawPage2();
	
	DoRender(gx, gy, gz, dx, dy, scale, fs, c);
	
	while (running==1) {
        // 3. Auf Tastendruck warten
        key = wait_for_key();
		//key = 'D'; //wait_for_key();
		
        // 4. Werte anpassen
        switch (key) {
            // X-Achse
            case 'W': gx = (gx + 5) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
            case 'S': gx = (gx - 5 + 360) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c);break;
            
            // Y-Achse
            case 'D': gy = (gy + 5) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
            case 'A': gy = (gy - 5 + 360) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
            
            // Z-Achse
            case 'E': gz = (gz + 5) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
            case 'Q': gz = (gz - 5 + 360) % 360; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
			
			// --- POSITION (dx, dy) ---
			case KEY_UP:    dy -= 5; DoTranslate( 0,-5, fs, c); break;
			case KEY_DOWN:  dy += 5; DoTranslate( 0, 5, fs, c); break;
			case KEY_LEFT:  dx -= 5; DoTranslate(-5, 0, fs, c); break;
			case KEY_RIGHT: dx += 5; DoTranslate( 5, 0, fs, c); break;
			
			
			// --- SCALE ---
            case '+': scale += 1; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
            case '-': if (scale > 1) scale -= 1; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
			
			// --- Load/Save ---
            /*case 'm': load_screen_with_header("screen"); break;adada
			case 'n': save_screen_with_header("screen"); break;*/
           
		    case 'X': wireframeOn = 1 - wireframeOn; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
			case 'P': PaintersOn = 1 - PaintersOn; wireframeOn = 0; DoRender(gx, gy, gz, dx, dy, scale, fs, c); break;
			
			case 'C': 
				backcolor = 1 - backcolor;  
				linecolor = 1 - linecolor;
				DoRender(gx, gy, gz, dx, dy, scale, fs, c);				
			break;
			
			case 'B': frameon = 1- frameon; poke(65305, frameon); break;
			//case 'i': print(0,0,"GX:" + ; break;
	   
            // Programm beenden
            case ' ': running = 0; break;
        }

    }
    return 0;
}
