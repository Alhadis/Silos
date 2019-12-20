import "core:os.odin"
import "core:fmt.odin"
import "core:math.odin"

import "shared:odin-gl/gl.odin"
import stbtt "shared:odin-stb/stb_truetype.odin"

font_shader: u32;
font_shader_uniforms: map[string]gl.Uniform_Info;
vbo: u32;
vao: u32;

ATLAS_WIDTH  :: 4096;
ATLAS_HEIGHT :: 4096;

get_gl_error :: proc(location := #caller_location) {
    err := gl.GetError();
    switch err {
        //case gl.NO_ERROR:  fmt.printf("GL_NO_ERROR at %v\n", location);
        case gl.INVALID_ENUM: fmt.printf("GL_INVALID_ENUM at %v\n", location);
        case gl.INVALID_VALUE: fmt.printf("GL_INVALID_VALUE at %v\n", location);
        case gl.INVALID_OPERATION: fmt.printf("GL_INVALID_OPERATION at %v\n", location);
        case gl.INVALID_FRAMEBUFFER_OPERATION: fmt.printf("GL_INVALID_FRAMEBUFFER_OPERATION at %v\n", location);
        case gl.OUT_OF_MEMORY: fmt.printf("GL_OUT_OF_MEMORY at %v\n", location);
        case gl.STACK_UNDERFLOW: fmt.printf("GL_STACK_UNDERFLOW at %v\n", location);
        case gl.STACK_OVERFLOW: fmt.printf("GL_STACK_OVERFLOW at %v\n", location);
    }
}

Glyph :: struct {
    bearing_x: int,
    advance_x: int,
    x0, y0: f32,
    x1, y1: f32,
    u0, v0: f32,
    u1, v1: f32,
    
    width, height: f32,
}

Font :: struct {
    info: stbtt.Font_Info,
    pack_context: stbtt.Pack_Context,
    texture: u32,
    size: f32,
    scale: f32,
    data: []u8,
    atlas_pixels: []u8,
    glyphs: map[rune]Glyph,
    
    max_width : f32,
    max_height: f32,
    ascent: f32,
    line_advance: f32,
    
    do_kerning: bool,
}

init_font_shader :: proc() {
    ok: bool;
    font_shader, ok = gl.load_shaders_file("font.vert", "font.frag");
    if !ok {
        panic("Failed to compile font shaders!");
    }
    
    font_shader_uniforms = gl.get_uniforms_from_program(font_shader);
    
    gl.Enable(gl.BLEND);
    get_gl_error();
    gl.BlendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    get_gl_error();
    
    gl.ActiveTexture(gl.TEXTURE0);
    get_gl_error();
    gl.GenBuffers(1, &vbo);
    get_gl_error();
    
    gl.GenVertexArrays(1, &vao);
    get_gl_error();
}

load_font_at_size :: proc(path: string, size: f32, do_kerning: bool = false) -> ^Font {
    font_data, ok := os.read_entire_file(path);
    if !ok {
        return nil;
    }
    
    font := new(Font);
    
    font.data = font_data;
    ret := stbtt.init_font(&font.info, font_data, 0);
    if !ret {
        free(font);
        return nil;
    }
    
    gl.GenTextures(1, &font.texture);
    get_gl_error();
    
    font.size = size;
    font.scale = stbtt.scale_for_pixel_height(&font.info, size);
    font.do_kerning = do_kerning;
    
    {
        x0,y0,x1,y1: i32;
        stbtt.stbtt_GetFontBoundingBox(&font.info, &x0, &y0, &x1, &y1);
        font.max_width  = f32(x1 - x0)*font.scale;
        font.max_height = f32(y1 - y0)*font.scale;
        fmt.printf("max_width: %v, max_height: %v\n", font.max_width, font.max_height);
    }
    
    {
        ascent, descent, linegap: i32;
        stbtt.stbtt_GetFontVMetrics(&font.info, &ascent, &descent, &linegap);
        font.line_advance = f32(ascent - descent + linegap) * font.scale;
        font.ascent = f32(ascent)*font.scale;
    }
    
    // Prepare font atlas
    font.atlas_pixels = make([]u8, ATLAS_WIDTH*ATLAS_HEIGHT);
    
    // Packing default font ranges
    stbtt.stbtt_PackBegin(&font.pack_context, &font.atlas_pixels[0], ATLAS_WIDTH, ATLAS_HEIGHT, 0, 1, nil);
    stbtt.stbtt_PackSetOversampling(&font.pack_context, 4, 4);
    
    // TODO(thebirk): We have to store either packed ranges or the old chardata
    // if we ever want to support resizing the atlas. I think?
    
    pack_range(font, 0x20, 0x7F-0x20);
    pack_range(font, 0xA0, 0xFF-0xA0);
    //pack_range(font, 0x4E00, 0x9FFF-0x4E00);
    // Port what you need from Freetype and to dynamic loading
    // using freetype and stb_rect_pack.
    
    fmt.printf("Loaded font '%s' at pixel size %v\n", path, size);
    //fmt.printf("numGlyphs: %d\n", font.info.numGlyphs);
    
    return font;
}

pack_range :: proc(using font: ^Font, from: rune, chars: int) {
    chardata := make([]stbtt.Packed_Char, chars);
    defer free(chardata);
    
    result := stbtt.stbtt_PackFontRange(&pack_context, &font.data[0], 0, size, i32(from), i32(chars), &chardata[0]);
    if result == 0 {
        panic("Failed to pack range! This shold be handled better.");
    }
    
    for packed_char, i in chardata {
        cp := from+rune(i);
        
        a: stbtt.Aligned_Quad;
        x : f32 = 0.0;
        y : f32 = 0.0;
        stbtt.stbtt_GetPackedQuad(&chardata[0], ATLAS_WIDTH, ATLAS_HEIGHT, i32(i), &x, &y, &a, 0);
        
        g: Glyph;
        g.u0 = a.s0;
        g.v0 = a.t0;
        g.u1 = a.s1;
        g.v1 = a.t1;
        
        g.width = a.x1 - a.x0;
        g.height = a.y1 - a.y0;
        
        g.x0 = a.x0;//*scale;
        g.y0 = a.y0;//*scale;
        g.x1 = a.x1;//*scale;
        g.y1 = a.y1;//*scale;
        
        advance: i32;
        left_bearing: i32;
        stbtt.stbtt_GetCodepointHMetrics(&info, i32(cp), &advance, &left_bearing);
        g.bearing_x = int(f32(left_bearing) * scale);
        g.advance_x = int(f32(advance) * scale);
        
        
        
        font.glyphs[cp] = g;
        
        //fmt.printf("cp %c := %v\n", cp, g);
    }
    
    update_texture(font);
}

free_font :: proc(font: ^Font) {
    stbtt.pack_end(&font.pack_context);
    free(font.data);
    free(font.atlas_pixels);
}

update_texture :: proc(using font: ^Font) {
    gl.BindTexture(gl.TEXTURE_2D, font.texture);
    get_gl_error();
    //gl.PixelStorei(gl.UNPACK_ALIGNMENT, 1);
    //gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
    //get_gl_error();
    //gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
    //get_gl_error();
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    get_gl_error();
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    get_gl_error();
    gl.TexImage2D(gl.TEXTURE_2D, 0, gl.RGBA, ATLAS_WIDTH, ATLAS_HEIGHT, 0, gl.RED, gl.UNSIGNED_BYTE, &font.atlas_pixels[0]);
    get_gl_error();
}

Color :: struct #packed {
    r, g, b, a: f32,
};

draw_text :: proc(using font: ^Font, text: string, start_x, start_y: f32, fg, bg: Color, screen_width, screen_height: int) {
    if len(text) == 0 do return;
    
    gl.BindTexture(gl.TEXTURE_2D, font.texture);
    get_gl_error();
    gl.UseProgram(font_shader);
    get_gl_error();
    
    projection := math.ortho3d(0, f32(screen_width), f32(screen_height), 0, -1, 1);
    gl.UniformMatrix4fv(font_shader_uniforms["projection"].location, 1, gl.FALSE, &projection[0][0]);
    get_gl_error();
    
    Vertex :: struct #packed {
        x, y: f32,
        u, v: f32,
        fg, bg: Color,
    }
    
    vertices: [dynamic]Vertex;
    reserve(&vertices, len(text)*6);
    defer free(vertices);
    x := start_x;
    y := start_y;
    
    y += ascent;
    
    for codepoint, i in text {
        //w, h, a := stbtt.get_packed_quad(packed_chars[..], ATLAS_WIDTH, ATLAS_HEIGHT, int(codepoint), false);
        //height := (a.y1-a.y0)*size;
        //width  := (a.x1-a.x0)*size;
        //width := pc.xadvance * scale;
        if codepoint == '\n' {
            y += line_advance;
            x = start_x;
        }
        
        g := glyphs[codepoint];
        
        //fmt.printf("x: %f, y: %f, w: %f, h: %f\n", x, y, width, height);
        //fmt.printf("s0: %f, t0: %f\n", a.s0, a.t0);
        //fmt.printf("s1: %f, t1: %f\n", a.s1, a.t1);
        //fmt.printf("x0: %f, y0: %f\n", a.x0, a.y0);
        //fmt.printf("x1: %f, y1: %f\n", a.x1, a.y1);
        
        //xb := x + f32(g.bearing_x);
        xb := x;
        
        /*
        To get a full background color we should send the quad position, the 
        baseline offsets and the baselines.
        That way we can copy the texture over in the shader ofsetted
        while still being able to color in the eniter quad.
        */
        
        append(&vertices, Vertex{xb+g.x0, y+g.y0, g.u0, g.v0, fg, bg});
        append(&vertices, Vertex{xb+g.x1, y+g.y0, g.u1, g.v0, fg, bg});
        append(&vertices, Vertex{xb+g.x0, y+g.y1, g.u0, g.v1, fg, bg});
        
        append(&vertices, Vertex{xb+g.x1, y+g.y0, g.u1, g.v0, fg, bg});
        append(&vertices, Vertex{xb+g.x1, y+g.y1, g.u1, g.v1, fg, bg});
        append(&vertices, Vertex{xb+g.x0, y+g.y1, g.u0, g.v1, fg, bg});
        
        if do_kerning && i < len(text)-1 { 
            kern_advance := stbtt.stbtt_GetCodepointKernAdvance(&font.info, i32(codepoint), i32(text[i+1]));
            x += f32(kern_advance)*scale;
        }
        x += f32(g.advance_x);
    }
    
    gl.BindVertexArray(vao);
    get_gl_error();
    gl.BindBuffer(gl.ARRAY_BUFFER, vbo);
    get_gl_error();
    gl.BufferData(gl.ARRAY_BUFFER, len(vertices)*size_of(Vertex), &vertices[0], gl.STATIC_DRAW);
    get_gl_error();
    
    gl.EnableVertexAttribArray(0);
    get_gl_error();
    gl.EnableVertexAttribArray(1);
    get_gl_error();
    gl.EnableVertexAttribArray(2);
    get_gl_error();
    gl.EnableVertexAttribArray(3);
    get_gl_error();
    
    pos_stride := 0;
    uv_stride := 2*size_of(f32);
    rgba_stride := uv_stride + 2*size_of(f32);
    bg_stride := rgba_stride + 4*size_of(f32);
    
    gl.VertexAttribPointer(0, 2, gl.FLOAT, gl.FALSE, size_of(Vertex), rawptr(uintptr(pos_stride)));
    get_gl_error();
    gl.VertexAttribPointer(1, 2, gl.FLOAT, gl.FALSE, size_of(Vertex), rawptr(uintptr(uv_stride)));
    get_gl_error();
    gl.VertexAttribPointer(2, 4, gl.FLOAT, gl.FALSE, size_of(Vertex), rawptr(uintptr(rgba_stride)));
    get_gl_error();
    gl.VertexAttribPointer(3, 4, gl.FLOAT, gl.FALSE, size_of(Vertex), rawptr(uintptr(bg_stride)));
    get_gl_error();
    
    gl.DrawArrays(gl.TRIANGLES, 0, i32(len(vertices)));
    get_gl_error();
    
    //gl.DeleteBuffers(1, &vbo);
}