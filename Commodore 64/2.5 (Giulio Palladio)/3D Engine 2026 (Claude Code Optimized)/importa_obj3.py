# -*- coding: utf-8 -*-
"""
Blender 2.79 - Importa un .obj, lo centra su un piano 300 x 200 e riduce
facce e vertici entro i limiti del programma.

Versione 2 - correzioni per il convertitore OBJ -> vertex.seq / planes.seq:
  * l'OBJ esce senza normali, UV e materiali (facce "f 3 5 1 2"): il
    convertitore esterno copiava i token "3/1/1" o "3//1" cosi' com'erano
    e rompeva planes.seq;
  * ricompone i triangoli in quad (come nel modello che funziona);
  * limiti di facce/vertici allineati al modello funzionante (~1400 / ~1500);
  * scala automatica in export: le coordinate finali (dopo la scala del
    convertitore) restano entro +-COORD_LIMIT, quindi sotto i 32767 del
    BASIC (altrimenti ?ILLEGAL QUANTITY ERROR).

  * scrive direttamente vertex.seq e planes.seq nel formato letto dall'engine
    BASIC (intestazione c,d,h,u; vertici interi; per ogni piano la normale,
    gli indici, e uno 0), senza passare dal convertitore esterno;

Uso:
  - da riga di comando:  blender -b -P importa_obj.py
  - oppure incolla nell'editor di testo di Blender e premi "Run Script".
"""
import os
import math
import bpy
import bmesh
from mathutils import Vector, Matrix

# ------------------------------------------------------------------
# PARAMETRI DA ADATTARE
# ------------------------------------------------------------------
OBJ_DIR = r"C:\OBJ_script"                       # cartella di lavoro
NOME_FILE = "modello"                            # <-- UNICO punto dove cambiare il nome (senza .obj)
OBJ_PATH = os.path.join(OBJ_DIR, NOME_FILE + ".obj")  # file .obj da importare

PLANE_X = 300.0        # larghezza del piano (asse X)
PLANE_Y = 200.0        # profondita' del piano (asse Y)

# Limiti del programma, riferiti al risultato FINALE (dopo la conversione
# in quad). Il modello di riferimento che funziona ha 1558 vertici e 1393 piani.
#
# I limiti sono CALCOLATI dal modello di memoria del listato BASIC
# 3dengine_adp_hybrid.bas (righe 101-113):
#   - 5 array interi (x%, y%, z%, vx%, vy%): 10 byte per vertice
#   - ogni faccia VISIBILE costa 14 byte (oo%, oi%, ib%), meno 8192 byte
#     tenuti nella RAM sotto la ROM del BASIC ($A000-$BFFF)
# L'engine memorizza solo le facce rivolte verso l'osservatore (circa meta'
# del totale), quindi basta che i posti disponibili (mf) siano almeno
# VISIBLE_FRAC * facce totali.
C64_ARRAY_BYTES = 29669   # RAM BASIC libera per gli array: 38911 - programma (8124) - variabili e stringhe (~1100)
VISIBLE_FRAC = 0.60       # quota massima di facce visibili insieme (0.5 = solido convesso, 0.6 = margine)
AUTO_LIMITS = True        # True = massimo calcolato; False = usa i due valori manuali qui sotto
MANUAL_MAX_FACES = 2000
MANUAL_MAX_VERTS = 2000


def c64_start(nv):
    """fre(0) previsto dopo i DIM dei vertici (il valore 'start' del tasto i)."""
    return C64_ARRAY_BYTES - 10 * (nv + 1) - 35


def c64_face_slots(nv):
    """Facce visibili memorizzabili (mf, riga 111 del listato BASIC)."""
    fm = c64_start(nv)
    fr = int((fm - 640) / 4)
    if fr > 819:
        fr = int((fm - 640 + 8192) / 14)
    return fr


if AUTO_LIMITS:
    MAX_VERTS = 1
    while c64_face_slots(MAX_VERTS + 1) / VISIBLE_FRAC >= MAX_VERTS + 1:
        MAX_VERTS += 1
    MAX_FACES = int(c64_face_slots(MAX_VERTS) / VISIBLE_FRAC)
else:
    MAX_FACES = MANUAL_MAX_FACES
    MAX_VERTS = MANUAL_MAX_VERTS

# Se i limiti non vengono raggiunti NON scrivo i file (sarebbero troppo grandi
# per il C64 e darebbero OUT OF MEMORY). Metti True per scriverli comunque.
ALLOW_OVER_LIMIT = False

FIT_TO_PLANE = True    # se il modello eccede il piano, lo riduce in scala

# Posizione verticale del modello rispetto al piano (Z = 0):
#   'MIDDLE' -> il piano passa a meta' altezza del modello
#   'BASE'   -> il modello poggia sul piano (base a Z = 0)
Z_MODE = 'MIDDLE'

# Dove salvare l'.obj risultante (solo il modello, senza il piano).
# Usa un nome diverso dall'originale per non sovrascriverlo.
# Metti None per non esportare.
EXPORT_PATH = os.path.join(OBJ_DIR, NOME_FILE + "_out.obj")
MERGE_DIST = 0.0001    # tolleranza per l'unione dei vertici doppi

# --- Scala per il convertitore e per il BASIC ---------------------
# Fattore di scala che applica il tool di conversione (2a cifra
# dell'intestazione di vertex.seq: 100 nel modello che funziona).
CONVERTER_SCALE = 100.0
# Coordinate massime desiderate dopo la conversione (il modello che
# funziona arriva a circa 1000; il BASIC non va oltre 32767).
COORD_LIMIT = 1000.0
# True  -> la scala di export e' calcolata per rispettare COORD_LIMIT
# False -> si usa EXPORT_SCALE cosi' com'e'
AUTO_EXPORT_SCALE = True
EXPORT_SCALE = 0.1

# Normali nell'OBJ: servono solo al vecchio convertitore, che pero' copia i
# token "v//vn" cosi' come sono e rompe planes.seq. Lasciale False: le normali
# per piano che l'engine BASIC legge (riga 390 del listato) ora le calcola
# direttamente write_seq().
USE_NORMALS = False
FLAT_NORMALS = False

# Scrittura diretta dei file per l'engine BASIC
WRITE_SEQ = True
SEQ_DIR = OBJ_DIR
VERTEX_NAME = "vertex.seq"
PLANES_NAME = "planes.seq"

# Ricomposizione triangoli -> quad (angolo massimo tra i due triangoli)
QUAD_ANGLE_DEG = 40.0
# Stima iniziale: quanti triangoli servono per ottenere MAX_FACES quad
QUAD_FACTOR = 1.6
# ------------------------------------------------------------------


def deselect_all():
    for o in bpy.context.scene.objects:
        o.select = False


def set_active(obj):
    deselect_all()
    obj.select = True
    bpy.context.scene.objects.active = obj


def import_obj(path):
    """Importa l'obj, unisce eventuali parti e azzera le trasformazioni."""
    path = bpy.path.abspath(path).strip()
    if not os.path.isfile(path):
        folder = os.path.dirname(path)
        info = "File non trovato.\n  Percorso visto da Python: {!r}\n".format(path)
        if os.path.isdir(folder):
            nomi = [f for f in os.listdir(folder) if f.lower().endswith(".obj")]
            info += "  La cartella esiste. File .obj al suo interno: {!r}".format(nomi)
        else:
            info += "  La cartella NON esiste: {!r}".format(folder)
        raise RuntimeError(info)
    deselect_all()
    bpy.ops.import_scene.obj(filepath=path)
    objs = [o for o in bpy.context.selected_objects if o.type == 'MESH']
    if not objs:
        raise RuntimeError("Nessuna mesh trovata in: {}".format(path))

    if len(objs) > 1:
        deselect_all()
        for o in objs:
            o.select = True
        bpy.context.scene.objects.active = objs[0]
        bpy.ops.object.join()
        obj = bpy.context.scene.objects.active
    else:
        obj = objs[0]

    set_active(obj)
    # Dopo questo passaggio i vertici sono in coordinate mondo
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
    return obj


def clean_and_triangulate(obj):
    """Unisce i vertici doppi, toglie vertici isolati e triangola."""
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    bmesh.ops.remove_doubles(bm, verts=bm.verts[:], dist=MERGE_DIST)
    bmesh.ops.dissolve_degenerate(bm, dist=MERGE_DIST, edges=bm.edges[:])
    for v in [v for v in bm.verts if not v.link_edges]:
        bm.verts.remove(v)
    bmesh.ops.triangulate(bm, faces=bm.faces[:])
    bm.to_mesh(obj.data)
    bm.free()
    obj.data.update()


def triangles_to_quads(obj):
    """Ricompone i triangoli in quad (il modello funzionante e' quasi
    tutto a quad). Lascia triangoli dove l'unione non e' possibile."""
    set_active(obj)
    bpy.ops.object.mode_set(mode='EDIT')
    bpy.ops.mesh.select_all(action='SELECT')
    ang = math.radians(QUAD_ANGLE_DEG)
    bpy.ops.mesh.tris_convert_to_quads(face_threshold=ang,
                                       shape_threshold=ang)
    bpy.ops.object.mode_set(mode='OBJECT')
    obj.data.update()


def decimate(obj, ratio):
    mod = obj.modifiers.new("Decimate", 'DECIMATE')
    mod.decimate_type = 'COLLAPSE'
    mod.ratio = max(ratio, 0.001)
    mod.use_collapse_triangulate = True
    set_active(obj)
    bpy.ops.object.modifier_apply(apply_as='DATA', modifier=mod.name)


def reduce_mesh(obj, max_iter=12):
    """Riduce con Decimate (collapse) e ricompone in quad, finche' le facce
    e i vertici FINALI rientrano nei limiti del programma."""
    factor = QUAD_FACTOR
    for _ in range(max_iter):
        clean_and_triangulate(obj)
        nt = len(obj.data.polygons)
        nv = len(obj.data.vertices)
        target_t = MAX_FACES * factor
        if nt > target_t or nv > MAX_VERTS:
            ratio = min(target_t / float(nt), MAX_VERTS * 0.97 / float(nv))
            decimate(obj, ratio)
        triangles_to_quads(obj)
        if (len(obj.data.polygons) <= MAX_FACES and
                len(obj.data.vertices) <= MAX_VERTS):
            return True
        factor *= 0.85
    return (len(obj.data.polygons) <= MAX_FACES and
            len(obj.data.vertices) <= MAX_VERTS)


def bounds(obj):
    xs = [v.co.x for v in obj.data.vertices]
    ys = [v.co.y for v in obj.data.vertices]
    zs = [v.co.z for v in obj.data.vertices]
    return (Vector((min(xs), min(ys), min(zs))),
            Vector((max(xs), max(ys), max(zs))))


def fit_and_center(obj):
    """Ridimensiona (se serve), centra in XY sull'origine e posiziona in Z (vedi Z_MODE)."""
    mn, mx = bounds(obj)
    size = mx - mn

    if FIT_TO_PLANE and size.x > 0 and size.y > 0:
        s = min(PLANE_X / size.x, PLANE_Y / size.y)
        if s < 1.0:
            obj.data.transform(Matrix.Scale(s, 4))
            mn, mx = bounds(obj)

    if Z_MODE == 'BASE':
        z_ref = mn.z
    else:
        z_ref = (mn.z + mx.z) / 2.0
    center = Vector(((mn.x + mx.x) / 2.0, (mn.y + mx.y) / 2.0, z_ref))
    obj.data.transform(Matrix.Translation(-center))
    obj.data.update()


def make_plane(name, size_x, size_y):
    """Piano esatto size_x x size_y centrato sull'origine, a Z = 0."""
    hx, hy = size_x / 2.0, size_y / 2.0
    verts = [(-hx, -hy, 0.0), (hx, -hy, 0.0), (hx, hy, 0.0), (-hx, hy, 0.0)]
    me = bpy.data.meshes.new(name)
    me.from_pydata(verts, [], [(0, 1, 2, 3)])
    me.update()
    plane = bpy.data.objects.new(name, me)
    bpy.context.scene.objects.link(plane)
    return plane


def compute_export_scale(obj):
    """Scala di export (global_scale) per tenere le coordinate finali entro
    +-COORD_LIMIT dopo la moltiplicazione del convertitore."""
    if not AUTO_EXPORT_SCALE:
        return EXPORT_SCALE
    mn, mx = bounds(obj)
    max_abs = max(abs(mn.x), abs(mn.y), abs(mn.z),
                  abs(mx.x), abs(mx.y), abs(mx.z))
    if max_abs <= 0:
        return EXPORT_SCALE
    return (COORD_LIMIT / CONVERTER_SCALE) / max_abs


def export_obj(obj, path):
    """Esporta solo il modello in .obj: solo vertici e facce (quad), senza
    normali, UV, materiali, cosi' il convertitore trova indici semplici."""
    folder = os.path.dirname(path)
    if folder and not os.path.isdir(folder):
        os.makedirs(folder)
    scale = compute_export_scale(obj)
    set_active(obj)  # lascia selezionato solo il modello
    if FLAT_NORMALS:
        bpy.ops.object.shade_flat()
    bpy.ops.export_scene.obj(filepath=path,
                             use_selection=True,
                             use_triangles=False,   # mantiene i quad
                             use_normals=USE_NORMALS,  # "f v//vn", mai "v/vt/vn"
                             use_uvs=False,         # niente "vt" e "/vt"
                             use_materials=False,   # niente .mtl
                             use_edges=False,
                             global_scale=scale)
    print("Salvato: {}".format(path))
    print("Scala di export: {:.5f}  ->  dopo il convertitore (x{:g}) "
          "le coordinate arrivano a circa {:.0f}".format(
              scale, CONVERTER_SCALE, _max_abs(obj) * scale * CONVERTER_SCALE))


def _max_abs(obj):
    mn, mx = bounds(obj)
    return max(abs(mn.x), abs(mn.y), abs(mn.z),
               abs(mx.x), abs(mx.y), abs(mx.z))


def fmt_num(v):
    """Numero con al massimo 2 decimali, senza zeri inutili ("83.66", "100", "0")."""
    r = round(v, 2)
    if r == 0:
        return "0"
    return "{:.2f}".format(r).rstrip("0").rstrip(".")


def newell_normal(pts):
    """Normale del poligono (metodo di Newell), normalizzata e per 100."""
    nx = ny = nz = 0.0
    n = len(pts)
    for k in range(n):
        a = pts[k]
        b = pts[(k + 1) % n]
        nx += (a[1] - b[1]) * (a[2] + b[2])
        ny += (a[2] - b[2]) * (a[0] + b[0])
        nz += (a[0] - b[0]) * (a[1] + b[1])
    ln = math.sqrt(nx * nx + ny * ny + nz * nz)
    if ln == 0:
        return (0.0, 0.0, 0.0)
    return (nx / ln * 100.0, ny / ln * 100.0, nz / ln * 100.0)


def build_seq(verts, faces, d):
    """verts: coordinate (float) gia' moltiplicate per d; faces: liste di indici
    0-based. Ritorna (byte_vertex, byte_planes, (nv, nf, h, u, picco))."""
    iv = [(int(round(x)), int(round(y)), int(round(z))) for (x, y, z) in verts]
    peak = max(max(abs(c) for c in v) for v in iv)
    h = sum(len(f) + 1 for f in faces)
    u = max(len(f) for f in faces) + 1
    vl = ["{},{},{},{}".format(len(iv), int(d), h, u)]
    for v in iv:
        vl.append("{},{},{}".format(v[0], v[1], v[2]))
    pl = []
    for f in faces:
        n = newell_normal([verts[i] for i in f])
        pl.append("{},{},{}".format(fmt_num(n[0]), fmt_num(n[1]), fmt_num(n[2])))
        for i in f:
            pl.append(str(i + 1))
        pl.append("0")
    vb = ("\r".join(vl) + "\r").encode("ascii")
    pb = ("\r".join(pl) + "\r").encode("ascii")
    return vb, pb, (len(iv), len(faces), h, u, peak)


def write_seq(obj, folder):
    """Scrive vertex.seq e planes.seq (righe separate da CR, come i file che
    funzionano). Gli assi sono quelli dell'export OBJ di Blender (Y su, -Z
    avanti): (x, y, z) -> (x, z, -y)."""
    me = obj.data
    s = compute_export_scale(obj) * CONVERTER_SCALE
    verts = [(v.co.x * s, v.co.z * s, -v.co.y * s) for v in me.vertices]
    faces = [list(p.vertices) for p in me.polygons]
    vb, pb, info = build_seq(verts, faces, CONVERTER_SCALE)
    if info[4] > 32767:
        raise RuntimeError("Coordinata {} oltre 32767: abbassa COORD_LIMIT".format(info[4]))
    if info[3] > 127:
        raise RuntimeError("Faccia con troppi lati (u={}): il BASIC accetta u <= 126".format(info[3]))
    if folder and not os.path.isdir(folder):
        os.makedirs(folder)
    with open(os.path.join(folder, VERTEX_NAME), "wb") as fh:
        fh.write(vb)
    with open(os.path.join(folder, PLANES_NAME), "wb") as fh:
        fh.write(pb)
    print("SEQ scritti in {}".format(folder))
    print("  intestazione: {},{},{},{}  (vertici, scala, voci piani, lati max + 1)".format(
        info[0], int(CONVERTER_SCALE), info[2], info[3]))
    print("  piani: {}   coordinata massima: {}".format(info[1], info[4]))


def show_error(msg):
    """Stampa l'errore e lo mostra in un blocco di testo 'ERRORE' nell'editor."""
    print(msg)
    try:
        old = bpy.data.texts.get("ERRORE")
        if old is not None:
            bpy.data.texts.remove(old)
        t = bpy.data.texts.new("ERRORE")
        t.from_string(msg)
        if bpy.context.screen is not None:
            for area in bpy.context.screen.areas:
                if area.type == 'TEXT_EDITOR':
                    area.spaces.active.text = t
    except Exception:
        pass


def main():
    obj = import_obj(OBJ_PATH)
    print("Importato: {} facce, {} vertici".format(
        len(obj.data.polygons), len(obj.data.vertices)))

    ok = reduce_mesh(obj)
    fit_and_center(obj)
    make_plane("Piano", PLANE_X, PLANE_Y)

    mn, mx = bounds(obj)
    sizes = {}
    for p in obj.data.polygons:
        sizes[len(p.vertices)] = sizes.get(len(p.vertices), 0) + 1
    print("Risultato: {} facce, {} vertici".format(
        len(obj.data.polygons), len(obj.data.vertices)))
    print("Facce per numero di lati: {}".format(sorted(sizes.items())))
    print("Ingombro: {:.2f} x {:.2f} x {:.2f}".format(
        mx.x - mn.x, mx.y - mn.y, mx.z - mn.z))
    if not ok:
        print("ATTENZIONE: limiti non raggiunti ({} facce / {} vertici), "
              "aumenta max_iter o rivedi i limiti.".format(MAX_FACES, MAX_VERTS))
    if (mx.x - mn.x) > PLANE_X or (mx.y - mn.y) > PLANE_Y:
        print("ATTENZIONE: il modello eccede il piano {} x {}.".format(PLANE_X, PLANE_Y))

    set_active(obj)
    if not ok and not ALLOW_OVER_LIMIT:
        print("ERRORE: il modello ha {} facce e {} vertici, oltre i limiti {} / {}. "
              "Nessun file scritto (i SEQ precedenti restano invariati).".format(
                  len(obj.data.polygons), len(obj.data.vertices), MAX_FACES, MAX_VERTS))
        return
    nv, nf = len(obj.data.vertices), len(obj.data.polygons)
    print("Limiti usati: {} vertici / {} facce".format(MAX_VERTS, MAX_FACES))
    print("C64: 'start' atteso nel tasto i = {}, facce visibili memorizzabili = {}".format(
        c64_start(nv), c64_face_slots(nv)))
    if c64_start(nv) < 700:
        print("ATTENZIONE: previsto OUT OF MEMORY ERROR in riga 110 del BASIC.")
    elif c64_face_slots(nv) < nf * VISIBLE_FRAC:
        print("ATTENZIONE: con alcune angolazioni potresti vedere 'mem full' (facce tagliate).")
    if EXPORT_PATH:
        export_obj(obj, EXPORT_PATH)
    if WRITE_SEQ:
        write_seq(obj, SEQ_DIR)


import traceback
try:
    main()
except Exception:
    show_error(traceback.format_exc())
