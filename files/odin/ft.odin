// stolen from https://gist.github.com/thebirk/f01d0ed63a61d86813fbbd4cc0badcc5
package freetype

using import "core:c"
import "core:os"

when os.OS == "windows" do foreign import ftlib "freetype.lib";
else when os.OS == "linux" do foreign import ftlib "system:freetype";
else when os.OS == "darwin" do foreign import ftlib "system:freetype";


Library_ :: struct {}
Library  :: ^Library_;

Size_Internal :: rawptr;
Size_Metrics :: struct {
    x_ppem      : u16,
    y_ppem      : u16,
    x_scale     : long,
    y_scale     : long,
    ascender    : long,
    descender   : long,
    height      : long,
    max_advance : long,
}

Generic_Finalizer :: proc "c" (object: rawptr);
Generic :: struct {
    data: rawptr,
    finalizer: Generic_Finalizer,
}

SizeRec :: struct {
    face     : Face,
    generic  : Generic,
    metrics  : Size_Metrics,
    internal : Size_Internal,
}
Size :: ^SizeRec;

Bitmap_Size :: struct {
    height : i16,
    width  : i16,
    size   : long,
    x_ppem : long,
    y_ppem : long,
}

Encoding :: enum i32 {
    ENCODING_NONE      = 0,
    ENCODING_MS_SYMBOL = ('s' << 24) | ('y' << 16) | ('m' << 8) | 'b',
    ENCODING_UNICODE   = ('u' << 24) | ('n' << 16) | ('i' << 8) | 'c',
    ENCODING_SJIS      = ('s' << 24) | ('j' << 16) | ('i' << 8) | 's',
    ENCODING_PRC       = ('g' << 24) | ('b' << 16) | (' ' << 8) | ' ',
    ENCODING_BIG5      = ('b' << 24) | ('i' << 16) | ('g' << 8) | '5',
    ENCODING_WANSUNG   = ('w' << 24) | ('a' << 16) | ('n' << 8) | 's',
    ENCODING_JOHAB     = ('j' << 24) | ('o' << 16) | ('h' << 8) | 'a',

    /* for backward compatibility */
    ENCODING_GB2312     = ENCODING_PRC,
    ENCODING_MS_SJIS    = ENCODING_SJIS,
    ENCODING_MS_GB2312  = ENCODING_PRC,
    ENCODING_MS_BIG5    = ENCODING_BIG5,
    ENCODING_MS_WANSUNG = ENCODING_WANSUNG,
    ENCODING_MS_JOHAB   = ENCODING_JOHAB,

    ENCODING_ADOBE_STANDARD = ('A' << 24) | ('D' << 16) | ('O' << 8) | 'B',
    ENCODING_ADOBE_EXPERT   = ('A' << 24) | ('D' << 16) | ('B' << 8) | 'E',
    ENCODING_ADOBE_CUSTOM   = ('A' << 24) | ('D' << 16) | ('B' << 8) | 'C',
    ENCODING_ADOBE_LATIN_1  = ('l' << 24) | ('a' << 16) | ('t' << 8) | '1',
    ENCODING_OLD_LATIN_2    = ('l' << 24) | ('a' << 16) | ('t' << 8) | '2',
    ENCODING_APPLE_ROMAN    = ('a' << 24) | ('r' << 16) | ('m' << 8) | 'n',
}

CharMapRec :: struct {
    face        : Face,
    encoding    : Encoding,
    platform_id : u16,
    encoding_id : u16,
}
CharMap :: ^CharMapRec;

BBox :: struct {
    xMin, yMin: long,
    xMax, yMax: long,
}

Glyph_Metrics :: struct {
    width        : long,
    height       : long,
    horiBearingX : long,
    horiBearingY : long,
    horiAdvance  : long,
    vertBearingX : long,
    vertBearingY : long,
    vertAdvance  : long,
}

Glyph_Format :: enum i32 {
    GLYPH_FORMAT_NONE      = 0,
    GLYPH_FORMAT_COMPOSITE = ('c' << 24) | ('o' << 16) | ('m' << 8) | 'p',
    GLYPH_FORMAT_BITMAP    = ('b' << 24) | ('i' << 16) | ('t' << 8) | 's',
    GLYPH_FORMAT_OUTLINE   = ('o' << 24) | ('u' << 16) | ('t' << 8) | 'l',
    GLYPH_FORMAT_PLOTTER   = ('p' << 24) | ('l' << 16) | ('o' << 8) | 't',
}

Bitmap :: struct {
    rows         : u32,
    width        : u32,
    pitch        : int,
    buffer       : ^u8,
    num_grays    : u16,
    pixel_mode   : u8,
    palette_mode : u8,
    palette      : rawptr,
}

Vector :: struct {
    x: long,
    y: long,
}

Outline :: struct {
    n_contours : i16,
    n_points   : i16,
    points     : ^Vector,
    tags       : ^u8,
    contours   : ^i16,
    flags      : i32,
}

SubGlyph :: rawptr;
Slot_Internal :: rawptr;

GlyphSlotRec :: struct {
    library           : Library,
    face              : Face,
    next              : GlyphSlot,
    reserved          : u32,
    generic           : Generic,
    metrics           : Glyph_Metrics,
    linearHoriAdvance : long,
    linearVertAdvance : long,
    advance           : Vector,
    format            : Glyph_Format,
    bitmap            : Bitmap,
    bitmap_left       : i32,
    bitmap_top        : i32,
    outline           : Outline,
    num_subglyphs     : u32,
    subglyphs         : SubGlyph,
    control_data      : rawptr,
    control_len       : long,
    lsb_delta         : long,
    rsb_delta         : long,
    other             : rawptr,
    internal          : Slot_Internal,
}
GlyphSlot :: ^GlyphSlotRec;

Driver :: rawptr;

Alloc_Func   :: proc"c"(memory: Memory, size: long) -> rawptr;
Free_Func    :: proc"c"(memory: Memory, block: rawptr);
Realloc_Func :: proc"c"(memory: Memory, cur_size: long, new_size: long, block: rawptr) -> rawptr;

MemoryRec :: struct {
    user    : rawptr,
    alloc   : Alloc_Func,
    free    : Free_Func,
    realloc : Realloc_Func,
}
Memory :: ^MemoryRec;

Stream_IoFunc    :: proc"c"(stream: Stream, offset: ulong, buffer: ^u8, count: ulong) -> ulong;
Stream_CloseFunc :: proc"c"(stream: Stream);

StreamDesc :: struct #raw_union {
    value: long,
    pointer: rawptr,
}

StreamRec :: struct {
    base       : ^u8,
    size       : ulong,
    pos        : ulong,
    descriptor : StreamDesc,
    pathname   : StreamDesc,
    read       : Stream_IoFunc,
    close      : Stream_CloseFunc,
    memory     : Memory,
    cursor     : ^u8,
    limit      : ^u8,
}
Stream :: ^StreamRec;

ListNode :: rawptr;
ListRec :: struct {
    head : ListNode,
    tail : ListNode,
}
List :: ^ListRec;

Face_Internal :: rawptr;

FaceFlag :: enum long {
    FACE_FLAG_SCALABLE          = 1 <<  0,
    FACE_FLAG_FIXED_SIZES       = 1 <<  1,
    FACE_FLAG_FIXED_WIDTH       = 1 <<  2,
    FACE_FLAG_SFNT              = 1 <<  3,
    FACE_FLAG_HORIZONTAL        = 1 <<  4,
    FACE_FLAG_VERTICAL          = 1 <<  5,
    FACE_FLAG_KERNING           = 1 <<  6,
    FACE_FLAG_FAST_GLYPHS       = 1 <<  7,
    FACE_FLAG_MULTIPLE_MASTERS  = 1 <<  8,
    FACE_FLAG_GLYPH_NAMES       = 1 <<  9,
    FACE_FLAG_EXTERNAL_STREAM   = 1 << 10,
    FACE_FLAG_HINTER            = 1 << 11,
    FACE_FLAG_CID_KEYED         = 1 << 12,
    FACE_FLAG_TRICKY            = 1 << 13,
    FACE_FLAG_COLOR             = 1 << 14,
    FACE_FLAG_VARIATION         = 1 << 15,
}

FaceRec :: struct {
    num_faces       : long,
    face_index      : long,
    face_flags      : FaceFlag,
    style_flags     : long,
    num_glyphs      : long,
    family_name     : ^u8,
    style_name      : ^u8,
    num_fixed_sizes : i32,
    available_sizes : ^Bitmap_Size,
    num_charmaps    : i32,
    charmaps        : ^CharMap,
    generic         : Generic,

    /*# The following member variables (down to `underline_thickness') */
    /*# are only relevant to scalable outlines; cf. @Bitmap_Size    */
    /*# for bitmap fonts.                                              */
    bbox                : BBox,
    units_per_EM        : u16,
    ascender            : i16,
    descender           : i16,
    height              : i16,
    max_advance_width   : i16,
    max_advance_height  : i16,
    underline_position  : i16,
    underline_thickness : i16,
    glyph               : GlyphSlot,
    size                : Size,
    charmap             : CharMap,

    /*@private begin */
    driver      : Driver,
    memory      : Memory,
    stream      : Stream,
    sizes_list  : ListRec,
    autohint    : Generic,
    extensions  : rawptr,
    internal    : Face_Internal,
}
Face     :: ^FaceRec;

Load_Flags :: enum i32 {
    LOAD_DEFAULT                     = 0x0,
    LOAD_NO_SCALE                    = 1 << 0,
    LOAD_NO_HINTING                  = 1 << 1,
    LOAD_RENDER                      = 1 << 2,
    LOAD_NO_BITMAP                   = 1 << 3,
    LOAD_VERTICAL_LAYOUT             = 1 << 4,
    LOAD_FORCE_AUTOHINT              = 1 << 5,
    LOAD_CROP_BITMAP                 = 1 << 6,
    LOAD_PEDANTIC                    = 1 << 7,
    LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 1 << 9,
    LOAD_NO_RECURSE                  = 1 << 10,
    LOAD_IGNORE_TRANSFORM            = 1 << 11,
    LOAD_MONOCHROME                  = 1 << 12,
    LOAD_LINEAR_DESIGN               = 1 << 13,
    LOAD_NO_AUTOHINT                 = 1 << 15,
    LOAD_COLOR                       = 1 << 20,
    LOAD_COMPUTE_METRICS             = 1 << 21,
    LOAD_BITMAP_METRICS_ONLY         = 1 << 22,


}

Render_Mode :: enum i32 {
    RENDER_MODE_NORMAL = 0,
    RENDER_MODE_LIGHT,
    RENDER_MODE_MONO,
    RENDER_MODE_LCD,
    RENDER_MODE_LCD_V,
    RENDER_MODE_MAX,
}

Kerning_Mode :: enum u32 {
    KERNING_DEFAULT = 0,
    KERNING_UNFITTED,
    KERNING_UNSCALED,
}

HAS_GLYPH_NAMES :: proc(face: Face) -> bool {
    using FaceFlag;
    return (face.face_flags & FACE_FLAG_GLYPH_NAMES) > FaceFlag(0);
}

HAS_COLOR :: proc(face: Face) -> bool {
    using FaceFlag;
    return (face.face_flags & FACE_FLAG_COLOR) > FaceFlag(0);
}

@(default_calling_convention="c", link_prefix="FT_")
foreign ftlib {
    Init_FreeType :: proc(lib: ^Library) -> i32 ---;
    Done_FreeType :: proc(lib: Library)  -> i32 ---;

    New_Face  :: proc(library: Library, path: cstring, face_index: long, face: ^Face) -> i32 ---;
    Done_Face :: proc(face: Face) -> i32 ---;
    Set_Pixel_Sizes :: proc(face: Face, pixel_width: u32, pixel_height: u32) -> i32 ---;

    Load_Glyph      :: proc(face: Face, glyph_index: u32, load_flags: Load_Flags) -> i32 ---;
    Load_Char       :: proc(face: Face, char_code: ulong, load_flags: Load_Flags) -> i32 ---;
    Render_Glyph    :: proc(slot: GlyphSlot, render_mode: Render_Mode) -> i32 ---;

    Get_Char_Index  :: proc(face: Face, charcode: ulong) -> u32 ---;
    Get_Kerning     :: proc(face: Face, leglyph, right_glyph: u32, kern_mode: u32, kerning: ^Vector) -> i32 ---;
    Get_Glyph_Name  :: proc(face: Face, glyph_index: u32, buffer: ^u8, buffer_max: u32) -> i32 ---;

    Get_First_Char  :: proc(face: Face, agindex: ^c.uint) -> ulong ---;
    Get_Next_Char   :: proc(face: Face, char_code: ulong, agindex: ^c.uint) -> ulong ---;
}
