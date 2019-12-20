package gfx

import linalg "core:math/linalg"
import "core:math"
import gl "deps/odin-gl"
import stbi "deps/odin-stb/stbi"
import "core:os"
import stbtt "deps/odin-stb/stbtt"

/** Corresponds 1 to 1 with a gpu texture */
Atlas :: struct {
  /** Width / height in pixels */
  w, h: i32,
  /** GPU tex */
  tex: u32,
}

Tex :: struct {
  atlas: ^Atlas,
  u0, v0, u1, v1: f32,
}

Filter :: enum {
  Linear, Nearest
}

filter_to_gl :: proc(f: Filter) -> i32 {
  switch(f) {
  case Filter.Nearest: return gl.NEAREST;
  case Filter.Linear: return gl.LINEAR;
  }
  assert(false);
  return 0;
}

/** Returns the texture type given bpp - RED, RG, RGB, or RGBA */
bpp_to_gl :: proc(bpp: i32) -> i32 {
  switch (bpp) {
  case 1: return gl.RED;
  case 2: return gl.RG;
  case 3: return gl.RGB;
  case 4: return gl.RGBA;
    case: assert(false);
  }
  return -1;
}

/** Given a .png file, load an atlas */
load_atlas :: proc(filename: cstring, filter: Filter = Filter.Nearest) -> (a: Atlas) {
  bpp: i32;
  data := stbi.load(filename, &a.w, &a.h, &bpp, 0);
  defer stbi.image_free(data);
  gl.GenTextures(1, &a.tex);
  gl.BindTexture(gl.TEXTURE_2D, a.tex);
  gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, filter_to_gl(filter));
  gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, filter_to_gl(filter));
  texformat := bpp_to_gl(bpp);
  gl.TexImage2D(gl.TEXTURE_2D, 0, texformat, a.w, a.h, 0, cast(u32)texformat, gl.UNSIGNED_BYTE, data);
  return;
}

init_tex :: proc(atlas: ^Atlas, x, y, w, h: i32) -> (t: Tex) {
  t.atlas = atlas;
  t.u0 = cast(f32)x / cast(f32)atlas.w;
  t.v0 = cast(f32)y / cast(f32)atlas.h;
  t.u1 = cast(f32)(x+w) / cast(f32)atlas.w;
  t.v1 = cast(f32)(y+h) / cast(f32)atlas.h;
  return;
}

Vert :: struct #packed {
  x, y, z, u, v: f32,
  col: u32,
}

PaintMode :: enum {
  Text, Image
}

Painter :: struct {
  vert_list: [dynamic]Vert,
  uploaded_verts, vao, vbo: u32,
  atlas: Atlas,
  img_uniforms, text_uniforms: gl.Uniforms,
  font: BakedFont,
  mode: PaintMode,
  // Shader programs
  img_program, text_program: u32,
}

/** Bitmap font loaded into a texture */
BakedFont :: struct {
  using atlas: Atlas,
  baked_chars: []stbtt.Baked_Char,
}

/** Loads ascii 32 to 126 into a texture, asserts on failure */
load_font :: proc (filename: string, font_size: f32, filter := Filter.Nearest) -> (b: BakedFont) {
  gl.GetError();
  font_tex_buf: [512 * 512]byte;
  b.w = 512; b.h = 512;
  data, success := os.read_entire_file(filename);
  assert(success);
  defer delete(data);
  baked_chars, ret := stbtt.bake_font_bitmap(data, 0, font_size, font_tex_buf[:], cast(int)b.w, cast(int)b.h, 32, 126); // no guarantee this fits!
  assert(ret > 0, "Couldn't fit font to bitmap");
  b.baked_chars = baked_chars;
  // load texture to GPU
  tex : u32;
  gl.GenTextures(1, &b.tex);
  gl.BindTexture(gl.TEXTURE_2D, b.tex);
  gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, filter_to_gl(filter));
  gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, filter_to_gl(filter));
  texformat := gl.RED;
  gl.TexImage2D(gl.TEXTURE_2D, 0, cast(i32)texformat, b.w, b.h, 0, cast(u32)texformat, gl.UNSIGNED_BYTE, &font_tex_buf[0]);
  return;
}

init_painter :: proc(atlas_filename: cstring,
                     font_filename: string,
                     font_size: f32 = 14.0,
                     img_vert_shader := "shaders/vert.glsl",
                     img_frag_shader := "shaders/frag.glsl",
                     text_vert_shader := "shaders/vert_text.glsl",
                     text_frag_shader := "shaders/frag_text.glsl") -> (p: Painter)
{
  p.mode = .Image;
  p.font = load_font(font_filename, font_size);
  p.vert_list = [dynamic]Vert{};
  p.atlas = load_atlas(atlas_filename);
  img_program, img_shader_success := gl.load_shaders(img_vert_shader, img_frag_shader);
  text_program, text_shader_success := gl.load_shaders(text_vert_shader, text_frag_shader);
  assert(img_shader_success);
  assert(text_shader_success);
  p.img_program = img_program;
  p.text_program = text_program;
  p.img_uniforms = gl.get_uniforms_from_program(img_program);
  p.text_uniforms = gl.get_uniforms_from_program(text_program);
  gl.GenVertexArrays(1, &p.vao);
  gl.BindVertexArray(p.vao);
  gl.GenBuffers(1, &p.vbo);
  gl.BindBuffer(gl.ARRAY_BUFFER, p.vbo);
  gl.EnableVertexAttribArray(0);
  return;
}

draw_text :: proc(p: ^Painter, text: string, x, y: f32, col : u32 = 0xffffffff) {
  assert(len(text) > 0);
  if (p.mode == .Image) {
    flush_render(p);
    p.mode = .Text;
  }
  cpos : f32 = 0;
  for c in text {
    // Lookup char & uv for char
    assert(c >= 32 && c <= 126);
    bc := p.font.baked_chars[c - 32];
    u0 := cast(f32)bc.x0 / cast(f32)p.font.w;
    v0 := cast(f32)bc.y0 / cast(f32)p.font.h;
    u1 := cast(f32)bc.x1 / cast(f32)p.font.w;
    v1 := cast(f32)bc.y1 / cast(f32)p.font.h;

    w, h : f32 = cast(f32)(bc.x1 - bc.x0), cast(f32)(bc.y1 - bc.y0);
    append(&p.vert_list,
           Vert { math.floor(x+bc.xoff+cpos+0), math.floor(y+bc.yoff+0), 0, u0, v0, col },
           Vert { math.floor(x+bc.xoff+cpos+w), math.floor(y+bc.yoff+0), 0, u1, v0, col },
           Vert { math.floor(x+bc.xoff+cpos+w), math.floor(y+bc.yoff+h), 0, u1, v1, col },
           Vert { math.floor(x+bc.xoff+cpos+0), math.floor(y+bc.yoff+0), 0, u0, v0, col },
           Vert { math.floor(x+bc.xoff+cpos+0), math.floor(y+bc.yoff+h), 0, u0, v1, col },
           Vert { math.floor(x+bc.xoff+cpos+w), math.floor(y+bc.yoff+h), 0, u1, v1, col });

    cpos += bc.xadvance;
  }
}

fill_rect :: proc(p: ^Painter, x, y, w, h : f32, col : u32 = 0xffffffff) {
  if (p.mode == .Text) {
    flush_render(p);
    p.mode = .Image;
  }
  append(&p.vert_list,
         Vert { math.floor(x)+0, math.floor(y)+0, 0, 0, 0, col },
         Vert { math.floor(x)+w, math.floor(y)+0, 0, 1, 0, col },
         Vert { math.floor(x)+w, math.floor(y)+h, 0, 1, 1, col },
         Vert { math.floor(x)+0, math.floor(y)+0, 0, 0, 0, col },
         Vert { math.floor(x)+0, math.floor(y)+h, 0, 0, 1, col },
         Vert { math.floor(x)+w, math.floor(y)+h, 0, 1, 1, col });
}

draw_img :: proc(p: ^Painter, t: Tex, x, y, w, h : f32, col : u32 = 0xffffffff) {
  if (p.mode == .Text) {
    flush_render(p);
    p.mode = .Image;
  }
  assert(t.atlas == &p.atlas);
  append(&p.vert_list,
         Vert { math.floor(x)+0, math.floor(y)+0, 0, t.u0, t.v0, col },
         Vert { math.floor(x)+w, math.floor(y)+0, 0, t.u1, t.v0, col },
         Vert { math.floor(x)+w, math.floor(y)+h, 0, t.u1, t.v1, col },
         Vert { math.floor(x)+0, math.floor(y)+0, 0, t.u0, t.v0, col },
         Vert { math.floor(x)+0, math.floor(y)+h, 0, t.u0, t.v1, col },
         Vert { math.floor(x)+w, math.floor(y)+h, 0, t.u1, t.v1, col });
}

/** Doesn't remove uploaded data, just clears CPU buffer */
_clear_buffer :: proc(p: ^Painter) {
  clear(&p.vert_list);
}

/** vbo should be bound to ARRAY_BUFFER */
_upload_buffer :: proc(p: ^Painter) {
  p.uploaded_verts = cast(u32)len(p.vert_list);
  if len(p.vert_list) == 0 {return;}
  gl.BindVertexArray(p.vao);
  gl.BindBuffer(gl.ARRAY_BUFFER, p.vbo);
  gl.BufferData(gl.ARRAY_BUFFER, len(p.vert_list) * size_of(p.vert_list[0]), &p.vert_list[0], gl.STATIC_DRAW);
  // TODO setup col / uv pointers
  gl.EnableVertexAttribArray(0);
  gl.EnableVertexAttribArray(1);
  gl.VertexAttribPointer(0, 3, gl.FLOAT, gl.FALSE, size_of(Vert), nil);
  gl.VertexAttribPointer(1, 2, gl.FLOAT, gl.FALSE, size_of(Vert), cast(rawptr)cast(uintptr)(3 * size_of(f32)));
}

/** Render this painter. This will flush all current drawing tot he gpu, so
calling this again will render nothing. */
flush_render :: proc(p: ^Painter) {
  _upload_buffer(p);
  _clear_buffer(p);
  mat := linalg.ortho3d(0, 800, 600, 0, -1, 1);

  // Activate img / text shader depending on mode
  uniforms : ^gl.Uniforms;
  switch p.mode {
  case .Image:
    uniforms = &p.img_uniforms;
    gl.UseProgram(p.img_program);
  case .Text:
    uniforms = &p.text_uniforms;
    gl.UseProgram(p.text_program);
  }

  gl.UniformMatrix4fv(uniforms["proj_mat"].location, 1, gl.FALSE, &mat[0][0]);
  gl.Uniform1i(uniforms["atlas"].location, 0);

  gl.BindVertexArray(p.vao);
  gl.BindBuffer(gl.ARRAY_BUFFER, p.vbo);

  // Activate img / text texture depending on mode
  gl.ActiveTexture(gl.TEXTURE0);
  switch p.mode {
  case .Image: gl.BindTexture(gl.TEXTURE_2D, p.atlas.tex);
  case .Text: gl.BindTexture(gl.TEXTURE_2D, p.font.tex);
  }

  gl.DrawArrays(gl.TRIANGLES, 0, cast(i32)p.uploaded_verts);
}
