package gfx

import d3d "../d3d"

import "core:sys/win32"

import "core:mem"
import "core:fmt"
import "core:strings"

//TODO

// any structs that reference actual backend buffers should be in the OS layer, not in the general layer


Gfx_Handle :: opaque int;
Gfx_Buffer_Handle :: Gfx_Handle;
Gfx_Image_Handle :: Gfx_Handle;
Gfx_Shader_Handle :: Gfx_Handle;
Gfx_Pipeline_Handle :: Gfx_Handle;
Gfx_Pass_Handle :: Gfx_Handle;
Gfx_Context_Handle :: Gfx_Handle;

INVALID_ID :: 0;
NUM_SHADER_STAGES :: 2;
NUM_INFLIGHT_FRAMES :: 2;
MAX_COLOR_ATTACHMENTS :: 4;
MAX_SHADERSTAGE_BUFFERS :: 4;
MAX_SHADERSTAGE_IMAGES :: 12;
MAX_SHADERSTAGE_UBS :: 4;
MAX_UB_MEMBERS :: 16;
MAX_VERTEX_ATTTRIBUTES :: 16;
MAX_MIPMAPS :: 16;
MAX_TEXTUREARRAY_LAYERS :: 8; //todo(dimenus): Fix this somehow. Default value of 128 makes compile times unbearable...

CLEAR_RED_DEFAULT :: 0.5;
CLEAR_GREEN_DEFAULT :: 0.5;
CLEAR_BLUE_DEFAULT :: 0.5;
CLEAR_ALPHA_DEFAULT :: 0.5;
CLEAR_DEPTH_DEFAULT :: 1.0;
CLEAR_STENCIL_DEFAULT :: 0;

SLOT_SHIFT :: 16;
SLOT_MASK :: (1 << SLOT_SHIFT) - 1;
MAX_POOL_SIZE :: 1 << SLOT_SHIFT;
DEFAULT_BUFFER_POOL_SIZE :: 128;
DEFAULT_IMAGE_POOL_SIZE :: 128;
DEFAULT_SHADER_POOL_SIZE :: 32;
DEFAULT_PIPELINE_POOL_SIZE :: 64;
DEFAULT_PASS_POOL_SIZE :: 16;
DEFAULT_CONTEXT_POOL_SIZE :: 16;

Features :: enum int {
    INSTANCING,
    TEXTURE_COMPRESSION_DXT,
    TEXTURE_COMPRESSION_PVRTC,
    TEXTURE_COMPRESSION_ATC,
    TEXTURE_COMPRESSION_ETC2,
    TEXTURE_FLOAT,
    TEXTURE_HALF_FLOAT,
    ORIGIN_BOTTOM_LEFT,
    ORIGIN_TOP_LEFT,
    MSAA_RENDER_TARGETS,
    PACKED_VERTEX_FORMAT_10_2,
    MULTIPLE_RENDER_TARGET,
    IMAGETYPE_3D,
    IMAGETYPE_ARRAY,
}

ResourceState :: enum {
    INITIAL,
    ALLOC,
    VALID,
    FAILED,
    INVALID,
}

Usage :: enum {
    _DEFAULT,      /* value 0 reserved for default-init */
    IMMUTABLE,
    DYNAMIC,
    STREAM,
}

BufferType :: enum {
    _DEFAULT,         /* value 0 reserved for default-init */
    VERTEX_BUFFER,
    INDEX_BUFFER,
}

IndexSizeType :: enum {
    _DEFAULT,   /* value 0 reserved for default-init */
    NONE,
    UINT16,
    UINT32,
}

ImageType :: enum {
    _DEFAULT,  /* value 0 reserved for default-init */
    FLAT_2D,
    CUBE,
    DEPTH_3D,
    ARRAY,
}

CubeFace :: enum {
    POS_X,
    NEG_X,
    POS_Y,
    NEG_Y,
    POS_Z,
    NEG_Z,
}

ShaderStage :: enum {
    VERTEX,
    FRAGMENT,
}

PixelFormat :: enum {
    _DEFAULT,    /* value 0 reserved for default-init */
    NONE,
    RGBA8,
    RGB8,
    RGBA4,
    R5G6B5,
    R5G5B5A1,
    R10G10B10A2,
    RGBA32F,
    RGBA16F,
    R32F,
    R16F,
    L8,
    DXT1,
    DXT3,
    DXT5,
    DEPTH,
    DEPTH_STENCIL,
    PVRTC2_RGB,
    PVRTC4_RGB,
    PVRTC2_RGBA,
    PVRTC4_RGBA,
    ETC2_RGB8,
    ETC2_SRGB8,
}

PrimitiveType :: enum {
    _DEFAULT,  /* value 0 reserved for default-init */
    POINTS,
    LINES,
    LINE_STRIP,
    TRIANGLES,
    TRIANGLE_STRIP,
}

FilterMode :: enum {
     _DEFAULT, /* value 0 reserved for default-init */
    NEAREST,
    LINEAR,
    NEAREST_MIPMAP_NEAREST,
    NEAREST_MIPMAP_LINEAR,
    LINEAR_MIPMAP_NEAREST,
    LINEAR_MIPMAP_LINEAR,
}

WrapMode :: enum {
    _DEFAULT,   /* value 0 reserved for default-init */
    REPEAT,
    CLAMP_TO_EDGE,
    MIRRORED_REPEAT,
}

VertexFormat :: enum {
    INVALID,
    FLOAT,
    FLOAT2,
    FLOAT3,
    FLOAT4,
    BYTE4,
    BYTE4N,
    UBYTE4,
    UBYTE4N,
    SHORT2,
    SHORT2N,
    SHORT4,
    SHORT4N,
    UINT10_N2,
}

VertexStepType :: enum {
    _DEFAULT,     /* value 0 reserved for default-init */
    PER_VERTEX,
    PER_INSTANCE,
}

UniformType :: enum {
    INVALID,
    FLOAT,
    FLOAT2,
    FLOAT3,
    FLOAT4,
    MAT4,
}

CullMode :: enum {
    _DEFAULT,   /* value 0 reserved for default-init */
    NONE,
    FRONT,
    BACK,
}

FaceWindingMode :: enum {
    _DEFAULT,    /* value 0 reserved for default-init */
    COUNTER_CLOCKWISE,
    CLOCKWISE,
}

ComparisonFuncType :: enum {
    _DEFAULT,    /* value 0 reserved for default-init */
    NEVER,
    LESS,
    EQUAL,
    LESS_EQUAL,
    GREATER,
    NOT_EQUAL,
    GREATER_EQUAL,
    ALWAYS,
}

StencilOpType :: enum {
    _DEFAULT,      /* value 0 reserved for default-init */
    KEEP,
    ZERO,
    REPLACE,
    INCR_CLAMP,
    DECR_CLAMP,
    INVERT,
    INCR_WRAP,
    DECR_WRAP,
}

BlendFactor :: enum {
    _DEFAULT,    /* value 0 reserved for default-init */
    ZERO,
    ONE,
    SRC_COLOR,
    ONE_MINUS_SRC_COLOR,
    SRC_ALPHA,
    ONE_MINUS_SRC_ALPHA,
    DST_COLOR,
    ONE_MINUS_DST_COLOR,
    DST_ALPHA,
    ONE_MINUS_DST_ALPHA,
    SRC_ALPHA_SATURATED,
    BLEND_COLOR,
    ONE_MINUS_BLEND_COLOR,
    BLEND_ALPHA,
    ONE_MINUS_BLEND_ALPHA,
}

BlendOp :: enum {
     _DEFAULT,    /* value 0 reserved for default-init */
    ADD,
    SUBTRACT,
    REVERSE_SUBTRACT,
}

ColorMask :: enum {
    R,
    G,
    B,
    A,
}

ActionType :: enum {
     _DEFAULT,
    CLEAR,
    LOAD,
    DONTCARE,
}

Action_Color_Attachment :: struct {
    action_type: ActionType,
    value: [4]f32,
}

Action_Depth_Attachment :: struct {
    action_type: ActionType,
    value: f32,
}

Action_Stencil_Attachment :: struct {
    action_type: ActionType,
    value: u8,
}

Pass_Action :: struct {
    colors: [MAX_COLOR_ATTACHMENTS]Action_Color_Attachment,
    depth: Action_Depth_Attachment,
    stencil: Action_Stencil_Attachment,
}

Bindings :: struct {
    vertex_buffer_handles: [MAX_SHADERSTAGE_BUFFERS]Gfx_Buffer_Handle,
    vertex_buffer_offsets: [MAX_SHADERSTAGE_BUFFERS]u32,
    index_buffer_handle: Gfx_Buffer_Handle,
    index_buffer_offset: u32,
    vs_image_handles: [MAX_SHADERSTAGE_IMAGES]Gfx_Image_Handle,
    fs_image_handles: [MAX_SHADERSTAGE_IMAGES]Gfx_Image_Handle,
}

Draw_State :: struct {
    pipeline: Gfx_Pipeline_Handle,
    vert_buffers: [MAX_SHADERSTAGE_BUFFERS]Gfx_Buffer_Handle,
    ind_buffers: Gfx_Buffer_Handle,
    ind_offset_idx: int,
    vs_images: [MAX_SHADERSTAGE_IMAGES]Gfx_Image_Handle,
    fs_images: [MAX_SHADERSTAGE_IMAGES]Gfx_Image_Handle,
}

BackendType :: enum {
    D3D11,
}

GLES_Backend :: struct {
    force: b32,
}

//todo(ryan): drawable_cb
Metal_Backend :: struct {
    device: rawptr,
    drawable_cb: rawptr,
    glob_uniform_buffer_size: int,
    sampler_cache_size: int, 
}

D3D11_Backend :: struct {
    dev: ^d3d.ID3D11_Device,
    dev_ctx: ^d3d.ID3D11_Device_Context,
    get_rtv_cb: proc() -> ^d3d.ID3D11_Render_Target_View,
    get_dsv_cb: proc() -> ^d3d.ID3D11_Depth_Stencil_View,
}

Setup_Desc :: struct {
    buffer_pool_size: int,
    image_pool_size: int,
    shader_pool_size: int,
    pipeline_pool_size: int,
    pass_pool_size: int,
    context_pool_size: int,
    backend: union {
        GLES_Backend, Metal_Backend, D3D11_Backend,
    },
}

Buffer_Desc :: struct {
    size: int,
    type: BufferType,
    usage: Usage,
    content: rawptr,
    gl_buffers: [NUM_INFLIGHT_FRAMES]int,
    d3d11_buffer: rawptr,
}

Sub_Image_Content :: struct {
    ptr: rawptr,
    size: int,
}

Image_Content :: struct {
    sub_images: [len(CubeFace)][MAX_MIPMAPS]Sub_Image_Content,
}

Image_Desc :: struct {
    type: ImageType,
    is_render_target: bool,
    width, height: int,
    using _: struct #raw_union {
        depth, num_layers: int,
    },
    num_mipmaps: int,
    usage: Usage,
    pixel_format: PixelFormat,
    sample_count: int,
    filter_modes: struct {
        min, mag: FilterMode,
    },
    wrap: struct {
        u, v, w: WrapMode,
    },
    max_anisotropy: int,
    lod: struct {
        min, max: f32,
    },
    content: Image_Content,
    backend_textures: struct {
        gles: [NUM_INFLIGHT_FRAMES]int,
        metal: [NUM_INFLIGHT_FRAMES]rawptr,
        d3d11: rawptr,  
    },
}

Shader_Uniform_Desc :: struct {
    name: string,
    type: UniformType,
    array_count: int,
}

Shader_Uniform_Block_Desc :: struct {
    size: int,
    uniforms: [MAX_UB_MEMBERS]Shader_Uniform_Desc,
}

Shader_Image_Desc :: struct {
    name: string,
    type: ImageType,
}

Shader_Stage_Desc :: struct {
    src_text: string,
    byte_code: []u8,
    entry: string,
    uniform_blocks: [MAX_SHADERSTAGE_UBS]Shader_Uniform_Block_Desc,
    images: [MAX_SHADERSTAGE_IMAGES]Shader_Image_Desc,
}

Shader_Desc :: struct {
    vert_shader: Shader_Stage_Desc,
    frag_shader: Shader_Stage_Desc,
}

Buffer_Layout_Desc :: struct {
    stride: int,
    step: struct {
        type: VertexStepType,
        rate: int,
    },
}

Vertex_Attr_Desc :: struct {
    name: string, 
    semantic_name: string,
    semantic_index: int,
    buffer_index: int,
    offset: int,
    format: VertexFormat,
}

Layout_Desc :: struct {
    buffers: [MAX_SHADERSTAGE_BUFFERS]Buffer_Layout_Desc,
    attrs: [MAX_VERTEX_ATTTRIBUTES]Vertex_Attr_Desc,
}

Stencil_State :: struct {
    fail_op, depth_fail_op, pass_op: StencilOpType,
    compare_func: ComparisonFuncType,
}

Depth_Stencil_State :: struct {
    stencil_front, stencil_back: Stencil_State,
    depth_compare_func: ComparisonFuncType,
    depth_write_enabled, stencil_enabled: b32,
    stencil_read_mask, stencil_write_mask: u8,
    stencil_ref: u32,
}

Blend_State :: struct {
    enabled: bool,
    src_factor_rgb, src_factor_alpha: BlendFactor,
    dest_factor_rgb, dest_factor_alpha: BlendFactor,
    op_rgb, op_alpha: BlendOp,
    color_write_mask: bit_set[ColorMask],
    color_attachment_count: int,
    color_format, depth_format: PixelFormat,
    color: [4]f32,
}

Rasterizer_State :: struct {
    alpha_to_coverage_enabled: bool,
    cull_mode: CullMode,
    face_winding_mode: FaceWindingMode,
    sample_count: int,
    depth_bias: f32,
    depth_bias_slope_scale: f32,
    depth_bias_clamp: f32,
}

Pipeline_Desc :: struct {
    layout: Layout_Desc,
    shader_handle: Gfx_Shader_Handle,
    primitive_type: PrimitiveType,
    index_type: IndexSizeType,
    depth_stencil: Depth_Stencil_State,
    blend: Blend_State,
    rasterizer: Rasterizer_State,
}

Attachment_Desc :: struct {
    image_handle: Gfx_Image_Handle,
    num_mip_levels: int,
    using _: struct #raw_union {
        face, layer, slice: int,
    },
}

Pass_Desc :: struct {
    color_atts: [MAX_COLOR_ATTACHMENTS]Attachment_Desc,
    depth_stencil_att: Attachment_Desc,
}

@(private)
get_vertex_format_width :: proc (fmt: VertexFormat) -> int {
    using VertexFormat;
    switch(fmt) {
        case INVALID: return 0;
        case FLOAT: return 4;
        case FLOAT2: return 8;
        case FLOAT3: return 12;
        case FLOAT4: return 16;
        case BYTE4, BYTE4N, UBYTE4, UBYTE4N, SHORT2, SHORT2N, UINT10_N2: return 4;
        case SHORT4, SHORT4N: return 8;
        case: assert(false); 
    }
    return 0;
}

@(private)
get_uniform_type_width :: proc (type: UniformType, count: int) -> int {
    using UniformType;
    switch(type) {
        case INVALID: return 0;
        case FLOAT: return 4 * count;
        case FLOAT2: return 8 * count;
        case FLOAT3: return 12 * count;
        case FLOAT4: return 16 * count;
        case MAT4: return 64 * count;
        case: assert(false);
    }
    return 0;
}

@(private)
is_compressed_pixel_format :: proc (fmt: PixelFormat) -> bool {
    using PixelFormat;
    switch(fmt) {
        case DXT1, DXT3, DXT5, PVRTC2_RGB, PVRTC2_RGBA,
            PVRTC4_RGB, PVRTC4_RGBA: return true;
        case: return false;
    }
}

@(private)
is_valid_rendertarget_color_format :: proc (fmt: PixelFormat) -> bool {
    using PixelFormat;
    switch(fmt) {
        case RGB8, R10G10B10A2, RGBA32F, RGBA16F: return true;
        case: return false;
    }
}

@(private)
is_valid_rendertarget_depth_format :: proc (fmt: PixelFormat) -> bool {
    using PixelFormat;
    switch(fmt) {
        case DEPTH, DEPTH_STENCIL: return true;
        case: return false;
    }
}

@(private)
is_depth_stencil_format :: proc (fmt: PixelFormat) -> bool {
    return fmt == PixelFormat.DEPTH_STENCIL;
}

@(private)
get_pixel_format_width :: proc (fmt: PixelFormat) -> int {
    using PixelFormat;
    switch(fmt) {
        case RGBA32F: return 16;
        case RGBA16F: return 8;
        case RGBA8, R10G10B10A2, R32F: return 4;
        case RGB8: return 3;
        case R5G5B5A1, R5G6B5, RGBA4, R16F: return 2;
        case L8: return 1;
        case:
            assert(false);
    }
    return 0;
}

@(private)
get_pixel_format_row_pitch :: proc (fmt: PixelFormat, width: int) -> int {
    pitch: int;
    using PixelFormat;
    switch (fmt) {
        case DXT1, ETC2_RGB8, ETC2_SRGB8: {
            pitch = ((width + 3) / 4) * 8;
            pitch = pitch < 8 ? 8 : pitch; 
        }
        case DXT3, DXT5: {
            pitch = ((width + 3) / 4) * 16;
            pitch = pitch < 16 ? 16 : pitch;
        }
        case PVRTC4_RGB, PVRTC4_RGBA: {
            block_size :: 4 * 4;
            bpp :: 4;
            width_blocks := width / 4;
            width_blocks = width_blocks < 2 ? 2 : width_blocks;
            pitch = width_blocks * ((block_size * bpp) / 8);
        }
        case PVRTC2_RGB, PVRTC2_RGBA: {
            block_size :: 8 * 4;
            bpp :: 2;
            width_blocks := width / 4;
            width_blocks = width_blocks < 2 ? 2 : width_blocks;
            pitch = width_blocks * ((block_size * bpp) / 8);
        }
        case: {
            pitch = width * get_pixel_format_width(fmt);
        }
    }
    return pitch;
}

@(private)
get_surface_pitch :: proc (fmt: PixelFormat, width, height: int) -> int {
    num_rows: int = 0;
    using PixelFormat;
    switch (fmt) {
        case DXT1, DXT3, DXT5, ETC2_RGB8, ETC2_SRGB8, PVRTC2_RGB, PVRTC2_RGBA,
            PVRTC4_RGB, PVRTC4_RGBA: {
                num_rows = ((height + 3) / 4);
            }
        case: {
            num_rows = height;
        }
    }
    if num_rows < 1 {
        num_rows = 1;
    }
    return num_rows * get_pixel_format_row_pitch(fmt, width);
}

@(private)
resolve_default_pass_action :: proc (from, to: ^Pass_Action) {
    assert(from != nil);
    assert(to != nil);
    to^ = from^;
    for i := 0; i < MAX_COLOR_ATTACHMENTS; i += 1 {
        c := &to.colors[i];
        if c.action_type == ActionType._DEFAULT {
            c.action_type = ActionType.CLEAR;
            c.value[0] = CLEAR_RED_DEFAULT;
            c.value[1] = CLEAR_GREEN_DEFAULT;
            c.value[2] = CLEAR_BLUE_DEFAULT;
            c.value[3] = CLEAR_ALPHA_DEFAULT;
        }
    }

    if to.depth.action_type == ActionType._DEFAULT {
        to.depth.action_type = ActionType.CLEAR;
        to.depth.value = CLEAR_DEPTH_DEFAULT;
    }
    if to.stencil.action_type == ActionType._DEFAULT {
        to.stencil.action_type = ActionType.CLEAR;
        to.stencil.value = CLEAR_STENCIL_DEFAULT;
    }
}

@(private)
get_d3d11_usage :: proc (usg: Usage) -> d3d.D3D11Usage {
    using d3d;
    switch (usg) {
        case Usage.IMMUTABLE:               return D3D11Usage.IMMUTABLE;
        case Usage.DYNAMIC, Usage.STREAM: return D3D11Usage.DYNAMIC;
        case: {
            assert(false);
            return d3d.D3D11Usage(0);
        }
    }
}

@(private)
get_d3d11_cpu_access_flags :: proc (usg: Usage) -> d3d.D3D11CPUAccessFlag {
    using Usage;
    switch (usg) {
        case IMMUTABLE: return d3d.D3D11CPUAccessFlag(0);
        case DYNAMIC, STREAM: return d3d.D3D11CPUAccessFlag.WRITE;
        case: {
            assert(false);
            return d3d.D3D11CPUAccessFlag(0);
        }
    }
}

@(private)
get_dxgi_texture_format :: proc (fmt: PixelFormat) -> d3d.DXGIFormat {
    using d3d;
    switch (fmt) {
        case PixelFormat.RGBA8:             return DXGIFormat.R8G8B8A8_UNSIGNED_NORMALIZED;
        case PixelFormat.R10G10B10A2:       return DXGIFormat.R10G10B10A2_UNSIGNED_NORMALIZED;
        case PixelFormat.RGBA32F:           return DXGIFormat.R32G32B32A32_FLOAT;
        case PixelFormat.RGBA16F:           return DXGIFormat.R16G16B16A16_FLOAT;
        case PixelFormat.R32F:              return DXGIFormat.R32_FLOAT;
        case PixelFormat.R16F:              return DXGIFormat.R16_FLOAT;
        case PixelFormat.L8:                return DXGIFormat.R8_UNSIGNED_NORMALIZED;
        case PixelFormat.DXT1:              return DXGIFormat.BC1_UNSIGNED_NORMALIZED;
        case PixelFormat.DXT3:              return DXGIFormat.BC2_UNSIGNED_NORMALIZED;
        case PixelFormat.DXT5:              return DXGIFormat.BC3_UNSIGNED_NORMALIZED;
        case: {
            return DXGIFormat.UNKNOWN;
        }
    }
}

@(private)
get_dxgi_rendertarget_color_format :: proc (fmt: PixelFormat) -> d3d.DXGIFormat {
    using d3d;
    switch (fmt) {
        case PixelFormat.RGBA8:             return DXGIFormat.R8G8B8A8_UNSIGNED_NORMALIZED;
        case PixelFormat.RGBA32F:           return DXGIFormat.R32G32B32A32_FLOAT;
        case PixelFormat.RGBA16F:           return DXGIFormat.R16G16B16A16_FLOAT;
        case PixelFormat.R32F:              return DXGIFormat.R32_FLOAT;
        case PixelFormat.R16F:              return DXGIFormat.R16_FLOAT;
        case PixelFormat.L8:                return DXGIFormat.R8_UNSIGNED_NORMALIZED;
        case: {
            return DXGIFormat.UNKNOWN;
        }
    }
}

@(private)
get_dxgi_rendertarget_depth_format :: proc (fmt: PixelFormat) -> d3d.DXGIFormat {
    using d3d;
    switch (fmt) {
        case PixelFormat.DEPTH:             return DXGIFormat.D16_UNSIGNED_NORMALIZED;
        case PixelFormat.DEPTH_STENCIL:     return DXGIFormat.D24_UNSIGNED_NORMALIZED_S8_UNSIGNED_INT;
        case: {
            return DXGIFormat.UNKNOWN;
        }
    }
}

@(private)
get_d3d11_primitive_topology :: proc (pt: PrimitiveType) -> d3d.D3D11PrimitiveTopology {
    using d3d;
    switch (pt) {
        case PrimitiveType.POINTS:              return D3D11PrimitiveTopology.POINT_LIST;
        case PrimitiveType.LINES:               return D3D11PrimitiveTopology.LINE_LIST;
        case PrimitiveType.LINE_STRIP:          return D3D11PrimitiveTopology.LINE_STRIP;
        case PrimitiveType.TRIANGLES:           return D3D11PrimitiveTopology.TRIANGLE_LIST;
        case PrimitiveType.TRIANGLE_STRIP:      return D3D11PrimitiveTopology.TRIANGLE_STRIP;
        case: {
            return d3d.D3D11PrimitiveTopology(0);
        }
    }
}

@(private)
get_d3d11_index_format :: proc (ist: IndexSizeType) -> d3d.DXGIFormat {
    using d3d;
    switch (ist) {
        case IndexSizeType.NONE:            return DXGIFormat.UNKNOWN;
        case IndexSizeType.UINT16:          return DXGIFormat.R16_UNSIGNED_INT;
        case IndexSizeType.UINT32:          return DXGIFormat.R32_UNSIGNED_INT;
        case: {
            return d3d.DXGIFormat(0);
        }
    }
}

@(private)
get_d3d11_filter :: proc (min, mag: FilterMode, max_anisotropy: int) -> d3d.D3D11Filter {
    using d3d;
    if max_anisotropy > 1 {
        return D3D11Filter.ANISOTROPIC;
    } else if mag == FilterMode.NEAREST {
        using FilterMode;
        switch (min) {
            case NEAREST, NEAREST_MIPMAP_NEAREST:
                return D3D11Filter.MIN_MAG_MIP_POINT;
            case LINEAR, LINEAR_MIPMAP_NEAREST:
                return D3D11Filter.MIN_LINEAR_MAG_MIP_POINT;
            case NEAREST_MIPMAP_LINEAR:
                return D3D11Filter.MIN_MAG_POINT_MIP_LINEAR;
            case LINEAR_MIPMAP_LINEAR:
                return D3D11Filter.MIN_LINEAR_MAG_POINT_MIP_LINEAR;
            case: {
                assert(false);
            }
        }
    } else if mag == FilterMode.LINEAR {
        using FilterMode;
        switch (min) {
            case NEAREST, NEAREST_MIPMAP_NEAREST:
                return D3D11Filter.MIN_POINT_MAG_LINEAR_MIP_POINT;
            case LINEAR, LINEAR_MIPMAP_NEAREST:
                return D3D11Filter.MIN_MAG_LINEAR_MIP_POINT;
            case NEAREST_MIPMAP_LINEAR:
                return D3D11Filter.MIN_POINT_MAG_MIP_LINEAR;
            case LINEAR_MIPMAP_LINEAR:
                return D3D11Filter.MIN_MAG_MIP_LINEAR;
            case: {
                assert(false);
            }
        }
    }
    assert(false);
    return D3D11Filter.MIN_MAG_MIP_POINT;
}

@(private)
get_d3d11_texture_address_mode :: proc (m: WrapMode) -> d3d.D3D11TextureAddressMode {
    using d3d;
    switch (m) {
        case WrapMode.REPEAT:               return D3D11TextureAddressMode.WRAP;
        case WrapMode.CLAMP_TO_EDGE:        return D3D11TextureAddressMode.CLAMP;
        case WrapMode.MIRRORED_REPEAT:      return D3D11TextureAddressMode.MIRROR;
        case: {
            assert(false);
            return D3D11TextureAddressMode(0);
        }
    }
}


@(private)
get_d3d11_vertex_format :: proc (fmt: VertexFormat) -> d3d.DXGIFormat {
    using d3d;
    switch (fmt) {
        case VertexFormat.FLOAT:        return DXGIFormat.R32_FLOAT;
        case VertexFormat.FLOAT2:       return DXGIFormat.R32G32_FLOAT;
        case VertexFormat.FLOAT3:       return DXGIFormat.R32G32B32_FLOAT;
        case VertexFormat.FLOAT4:       return DXGIFormat.R32G32B32A32_FLOAT;
        case VertexFormat.BYTE4:        return DXGIFormat.R8G8B8A8_SIGNED_INT;
        case VertexFormat.BYTE4N:       return DXGIFormat.R8G8B8A8_SIGNED_NORMALIZED;
        case VertexFormat.UBYTE4:       return DXGIFormat.R8G8B8A8_UNSIGNED_INT;
        case VertexFormat.UBYTE4N:      return DXGIFormat.R8G8B8A8_UNSIGNED_NORMALIZED;
        case VertexFormat.SHORT2:       return DXGIFormat.R16G16_SIGNED_INT;
        case VertexFormat.SHORT2N:      return DXGIFormat.R16G16_SIGNED_NORMALIZED;
        case VertexFormat.SHORT4:       return DXGIFormat.R16G16B16A16_SIGNED_INT;
        case VertexFormat.SHORT4N:      return DXGIFormat.R16G16B16A16_SIGNED_NORMALIZED;
        case: {
            assert(false);
            return DXGIFormat(0);
        }
    }
}

@(private)
get_d3d11_input_classification :: proc (st: VertexStepType) -> d3d.D3D11InputClassification {
    using d3d;
    switch (st) {
        case VertexStepType.PER_VERTEX:         return D3D11InputClassification.PER_VERTEX_DATA;
        case VertexStepType.PER_INSTANCE:       return D3D11InputClassification.PER_INSTANCE_DATA;
        case: {
            assert(false);
            return D3D11InputClassification(0);
        }
    }
}

@(private)
get_d3d11_cull_mode :: proc (cm: CullMode) -> d3d.D3D11CullMode {
    using d3d;
    switch (cm) {
        case CullMode.NONE:             return D3D11CullMode.NONE;
        case CullMode.FRONT:            return D3D11CullMode.FRONT;
        case CullMode.BACK:             return D3D11CullMode.BACK;
        case: {
            assert(false);
            return D3D11CullMode(0);
        }
    }
}

@(private)
get_d3d11_compare_func :: proc (cft: ComparisonFuncType) -> d3d.D3D11ComparisonFunc {
    using d3d;
    switch (cft) {
        case ComparisonFuncType.NEVER:              return D3D11ComparisonFunc.NEVER;
        case ComparisonFuncType.LESS:               return D3D11ComparisonFunc.LESS;
        case ComparisonFuncType.EQUAL:              return D3D11ComparisonFunc.EQUAL;
        case ComparisonFuncType.LESS_EQUAL:         return D3D11ComparisonFunc.LESS_EQUAL;
        case ComparisonFuncType.GREATER:            return D3D11ComparisonFunc.GREATER;
        case ComparisonFuncType.NOT_EQUAL:          return D3D11ComparisonFunc.NOT_EQUAL;
        case ComparisonFuncType.GREATER_EQUAL:      return D3D11ComparisonFunc.GREATER_EQUAL;
        case ComparisonFuncType.ALWAYS:             return D3D11ComparisonFunc.ALWAYS;
        case: {
            assert(false);
            return D3D11ComparisonFunc(0);
        }
    }
}

@(private)
get_d3d11_stencil_op :: proc (opt: StencilOpType) -> d3d.D3D11StencilOp {
    using d3d;
    switch (opt) {
        case StencilOpType.KEEP:            return D3D11StencilOp.KEEP;
        case StencilOpType.ZERO:            return D3D11StencilOp.ZERO;
        case StencilOpType.REPLACE:         return D3D11StencilOp.REPLACE;
        case StencilOpType.INCR_CLAMP:      return D3D11StencilOp.INCREMENT_SAT;
        case StencilOpType.DECR_CLAMP:      return D3D11StencilOp.DECREMENT_SAT;
        case StencilOpType.INVERT:          return D3D11StencilOp.INVERT;
        case StencilOpType.INCR_WRAP:       return D3D11StencilOp.INCREMENT;
        case StencilOpType.DECR_WRAP:       return D3D11StencilOp.DECREMENT;
        case: {
            assert(false);
            return D3D11StencilOp(0);
        }
    }
}

@(private)
get_d3d11_blend_factor :: proc (bf: BlendFactor) -> d3d.D3D11BlendType {
    using d3d;
    switch (bf) {
        case BlendFactor.ZERO:                      return D3D11BlendType.ZERO;
        case BlendFactor.ONE:                       return D3D11BlendType.ONE;
        case BlendFactor.SRC_COLOR:                 return D3D11BlendType.SRC_COLOR;
        case BlendFactor.ONE_MINUS_SRC_COLOR:       return D3D11BlendType.INV_SRC_COLOR;
        case BlendFactor.SRC_ALPHA:                 return D3D11BlendType.SRC_ALPHA;
        case BlendFactor.ONE_MINUS_SRC_ALPHA:       return D3D11BlendType.INV_SRC_ALPHA;
        case BlendFactor.DST_COLOR:                 return D3D11BlendType.DEST_COLOR;       
        case BlendFactor.ONE_MINUS_DST_COLOR:       return D3D11BlendType.INV_DEST_COLOR;
        case BlendFactor.DST_ALPHA:                 return D3D11BlendType.DEST_ALPHA;
        case BlendFactor.ONE_MINUS_DST_ALPHA:       return D3D11BlendType.INV_DEST_ALPHA;
        case BlendFactor.SRC_ALPHA_SATURATED:       return D3D11BlendType.SRC_ALPHA_SAT;
        case BlendFactor.BLEND_COLOR:               return D3D11BlendType.BLEND_FACTOR;
        case BlendFactor.ONE_MINUS_BLEND_COLOR:     return D3D11BlendType.INV_BLEND_FACTOR;
        case BlendFactor.BLEND_ALPHA:               return D3D11BlendType.BLEND_FACTOR;
        case BlendFactor.ONE_MINUS_BLEND_ALPHA:     return D3D11BlendType.INV_BLEND_FACTOR;
        case: {
            assert(false);
            return D3D11BlendType(0);
        }
    }
}

get_d3d11_blend_op :: proc (op: BlendOp) -> d3d.D3D11BlendOpType {
    using d3d;
    switch (op) {
        case BlendOp.ADD:                   return D3D11BlendOpType.ADD;
        case BlendOp.SUBTRACT:              return D3D11BlendOpType.SUBTRACT;
        case BlendOp.REVERSE_SUBTRACT:      return D3D11BlendOpType.REV_SUBTRACT;
        case: {
            assert(false);
            return D3D11BlendOpType(0);
        }
    }
}

get_d3d11_color_write_mask :: proc (cm: bit_set[ColorMask]) -> u8 {
    using d3d;
    ret: D3D11ColorWriteEnable;
    if ColorMask.R in cm {
        ret |= D3D11ColorWriteEnable.RED;
    } 
    if ColorMask.G in cm {
        ret |= D3D11ColorWriteEnable.GREEN;
    }
    if ColorMask.B in cm {
        ret |= D3D11ColorWriteEnable.BLUE;
    }
    if ColorMask.A in cm {
        ret |= D3D11ColorWriteEnable.ALPHA;
    }
    return u8(ret);
}

@(private)
Pool_Slot :: struct {
    handle, ctx_handle: Gfx_Handle,
    state: ResourceState,
}

decode_handle :: proc (hndl: Gfx_Handle) -> int {
    return int(hndl) & SLOT_MASK;
}

Buffer_D3D11 :: struct {
    pool_slot: Pool_Slot,
    type: BufferType,
    size: int,
    append_pos: int,
    has_append_overflow: bool,
    usage: Usage,
    update_frame_index, append_frame_index: int,
    d3d11_buf: ^d3d.ID3D11_Buffer,
}

Image_D3D11 :: struct {
    pool_slot: Pool_Slot,
    type: ImageType,
    is_render_target: b32,
    width, height, depth, num_mipmaps: int,
    usage: Usage,
    pixel_format: PixelFormat,
    sample_count: int,
    filter_modes: struct {
        min, mag: FilterMode,
    },
    wrap: struct {
        u, v, w: WrapMode,
    },
    max_anisotropy: int,
    update_frame_index: int,
    dxgi_format: d3d.DXGIFormat,
    tex_2d: ^d3d.ID3D11_Texture2D,
    tex_3d: ^d3d.ID3D11_Texture3D,
    tex_ds: ^d3d.ID3D11_Texture2D,
    tex_msaa: ^d3d.ID3D11_Texture2D,
    srv: ^d3d.ID3D11_Shader_Resource_View,
    smp: ^d3d.ID3D11_Sampler_State, 
}

Uniform_Block_D3D11 :: struct {
    size: int,
}

Shader_Image_D3D11 :: struct {
    type: ImageType,
}

Shader_Stage_D3D11 :: struct {
    num_uniform_blocks: int,
    num_images: int,
    uniform_blocks: [MAX_SHADERSTAGE_UBS]Uniform_Block_D3D11,
    images: [MAX_SHADERSTAGE_IMAGES]Image_D3D11,
    cbs: [MAX_SHADERSTAGE_UBS]^d3d.ID3D11_Buffer,
}

Shader_D3D11 :: struct {
    pool_slot: Pool_Slot,
    stages: [MAX_SHADERSTAGE_UBS]Shader_Stage_D3D11,
    vert_shader: ^d3d.ID3D11_Vertex_Shader,
    pixel_shader: ^d3d.ID3D11_Pixel_Shader,
    vert_shader_blob: []u8,
}

Pipeline_D3D11 :: struct {
    pool_slot: Pool_Slot,
    shader: ^Shader_D3D11,
    shader_handle: Gfx_Shader_Handle,
    prim_type: PrimitiveType,
    index_type: IndexSizeType,
    is_vertex_layout_valid: [MAX_SHADERSTAGE_BUFFERS]b8,
    color_attachment_count: int,
    color_format: PixelFormat,
    depth_format: PixelFormat,
    sample_count: int,
    blend_color: [4]f32,
    stencil_ref: u32,
    vb_strides: [MAX_SHADERSTAGE_BUFFERS]u32,
    prim_topology: d3d.D3D11PrimitiveTopology,
    index_format: d3d.DXGIFormat,
    input_layout: ^d3d.ID3D11_Input_Layout,
    rasterizer_state: ^d3d.ID3D11_Rasterizer_State,
    depth_stencil_state: ^d3d.ID3D11_Depth_Stencil_State,
    blend_state: ^d3d.ID3D11_Blend_State,
}

Attachment_D3D11 :: struct {
    image: ^Image_D3D11,
    image_handle: Gfx_Image_Handle,
    num_mip_levels: int,
    slice: int,
}

Pass_D3D11 :: struct {
    pool_slot: Pool_Slot,
    color_atts: [MAX_COLOR_ATTACHMENTS]Attachment_D3D11,
    num_color_atts: int, //todo(ryan): use a more odin-like array
    depth_stencil_att: Attachment_D3D11,
    rtvs: [MAX_COLOR_ATTACHMENTS]^d3d.ID3D11_Render_Target_View,
    dsv: ^d3d.ID3D11_Depth_Stencil_View,
}

@(private)
Pools_D3D11 :: struct {
    buffer_pool, image_pool, shader_pool, 
        pipeline_pool, pass_pool: Pool,
    buffers: []Buffer_D3D11,
    images: []Image_D3D11,
    shaders: []Shader_D3D11,
    pipelines: []Pipeline_D3D11,
    passes: []Pass_D3D11,
};

Context :: struct {
    pool_slot: Pool_Slot,
}

@(private)
iState: struct {
    is_valid: bool,
    frame_index: int,
    active_context_handle: Gfx_Context_Handle,
    curr_pass_handle: Gfx_Pass_Handle,
    curr_pipeline_handle: Gfx_Pipeline_Handle,
    is_pass_valid: bool,
    are_bindings_valid: bool,
    is_next_draw_valid: bool,
    contexts: []Context,
    context_pool: Pool,
    backend: union { State_D3D11 },
};

@(private)
State_D3D11 :: struct {
    is_valid: b32,
    dev: ^d3d.ID3D11_Device,
    dev_ctx: ^d3d.ID3D11_Device_Context,
    get_curr_rtv: proc() -> ^d3d.ID3D11_Render_Target_View,
    get_curr_dsv: proc() -> ^d3d.ID3D11_Depth_Stencil_View,
    in_pass: b32,
    use_indexed_draw: b32,
    curr_width: int,
    curr_height: int,
    num_rtvs: int,
    curr_pass: ^Pass_D3D11,
    curr_pass_handle: Gfx_Pass_Handle,
    curr_pipeline: ^Pipeline_D3D11,
    curr_pipeline_handle: Gfx_Pipeline_Handle,
    curr_rtvs: [MAX_COLOR_ATTACHMENTS]^d3d.ID3D11_Render_Target_View,
    curr_dsv: ^d3d.ID3D11_Depth_Stencil_View,
    zeroes: struct {
        rtvs: [MAX_SHADERSTAGE_BUFFERS]^d3d.ID3D11_Render_Target_View,
        vbs: [MAX_SHADERSTAGE_BUFFERS]^d3d.ID3D11_Buffer,
        vb_offsets, vb_strides: [MAX_SHADERSTAGE_BUFFERS]u32, //note(ryan): do not change this type!
        cbs: [MAX_SHADERSTAGE_UBS]^d3d.ID3D11_Buffer,
        srvs: [MAX_SHADERSTAGE_IMAGES]^d3d.ID3D11_Shader_Resource_View,
        smps: [MAX_SHADERSTAGE_IMAGES]^d3d.ID3D11_Sampler_State,
    },
    subres_data: [MAX_MIPMAPS * MAX_TEXTUREARRAY_LAYERS]d3d.D3D11_Sub_Resource_Data,
    pools: Pools_D3D11,
}

setup_d3d11_backend :: proc (state: ^State_D3D11, desc: ^Setup_Desc) {
    assert(desc != nil);
    be_state := &desc.backend.(D3D11_Backend);
    assert(be_state.dev != nil);
    assert(be_state.dev_ctx != nil);
    assert(be_state.get_rtv_cb != nil);
    assert(be_state.get_dsv_cb != nil);
    iState.backend = State_D3D11 {
        is_valid = true,
        dev = be_state.dev,
        dev_ctx = be_state.dev_ctx,
        get_curr_rtv = be_state.get_rtv_cb,
        get_curr_dsv = be_state.get_dsv_cb,
    };
    setup_d3d11_pools(&state.pools, desc);
}

discard_d3d11_backend :: proc (s: ^State_D3D11) {
    assert(s.is_valid == true);
    discard_d3d11_pools(&s.pools);
    mem.zero_item(s);
}

query_d3d11_feature :: proc (f: Features) -> bool {
    using Features;
    switch (f) {
        case INSTANCING, TEXTURE_COMPRESSION_DXT, TEXTURE_FLOAT,
            TEXTURE_HALF_FLOAT, ORIGIN_TOP_LEFT, MSAA_RENDER_TARGETS,
            MULTIPLE_RENDER_TARGET, IMAGETYPE_3D, IMAGETYPE_ARRAY:
                return true;
            
        case: return false;
    }
}

clear_d3d11_state :: proc (state: ^State_D3D11 ) {
    using state;
    dev_ctx.om_set_render_targets(dev_ctx, MAX_COLOR_ATTACHMENTS, &zeroes.rtvs[0], nil);
    dev_ctx.rs_set_state(dev_ctx, nil);
    dev_ctx.om_set_depth_stencil_state(dev_ctx, nil, 0);
    dev_ctx.om_set_blend_state(dev_ctx, nil, nil, 0xFFFF_FFFF);
    dev_ctx.ia_set_vertex_buffers(dev_ctx, 0, MAX_SHADERSTAGE_BUFFERS, 
        &zeroes.vbs[0], &zeroes.vb_strides[0], &zeroes.vb_offsets[0]);
    dev_ctx.ia_set_index_buffer(dev_ctx, nil, d3d.DXGIFormat.UNKNOWN, 0);
    dev_ctx.ia_set_input_layout(dev_ctx, nil);
    dev_ctx.vs_set_shader(dev_ctx, nil, nil, 0);
    dev_ctx.ps_set_shader(dev_ctx, nil, nil, 0);
    dev_ctx.vs_set_constant_buffers(dev_ctx, 0, MAX_SHADERSTAGE_UBS, &zeroes.cbs[0]);
    dev_ctx.ps_set_constant_buffers(dev_ctx, 0, MAX_SHADERSTAGE_UBS, &zeroes.cbs[0]);
    dev_ctx.vs_set_shader_resources(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &zeroes.srvs[0]);
    dev_ctx.ps_set_shader_resources(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &zeroes.srvs[0]);
    dev_ctx.vs_set_samplers(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &zeroes.smps[0]);
    dev_ctx.ps_set_samplers(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &zeroes.smps[0]);
}

reset_state_cache :: proc () {
    switch _ in iState.backend {
        case State_D3D11: 
            clear_d3d11_state(&iState.backend.(State_D3D11));
        case:
            assert(false);
    }
}

activate_context :: proc (ctx: ^Context) {
    reset_state_cache();
}

init_context :: proc (ctx: ^Context) {
    assert(ctx != nil);
    assert(ctx.pool_slot.state == ResourceState.ALLOC);
    ctx.pool_slot.state = ResourceState.VALID;
}

destroy_context :: proc (ctx: ^Context) {
    assert(ctx != nil);
    mem.zero_item(ctx);
}

init_stencil_state :: proc (s: ^Stencil_State) {
    assert(s != nil);
    s.fail_op = StencilOpType.KEEP;
    s.depth_fail_op = StencilOpType.KEEP;
    s.pass_op = StencilOpType.KEEP;
    s.compare_func = ComparisonFuncType.ALWAYS;
}

init_depth_stencil_state :: proc (s: ^Depth_Stencil_State) {
    assert(s != nil);
    init_stencil_state(&s.stencil_front);
    init_stencil_state(&s.stencil_back);
    s.depth_compare_func = ComparisonFuncType.ALWAYS;
    s.stencil_read_mask = 0;
    s.stencil_write_mask = 0;
    s.stencil_ref = 0;
    s.depth_write_enabled = false;
    s.stencil_enabled = false;
}


create_d3d11_buffer :: proc (buf: ^Buffer_D3D11, desc: ^Buffer_Desc) -> ResourceState {
    assert(buf != nil);
    assert(desc != nil);
    assert(buf.pool_slot.state == ResourceState.ALLOC);
    assert(buf.d3d11_buf == nil);

    buf.size = desc.size;
    buf.append_pos = 0;
    buf.has_append_overflow = false;
    buf.type = def(desc.type, BufferType.VERTEX_BUFFER);
    buf.usage = def(buf.usage, Usage.IMMUTABLE);
    buf.update_frame_index = 0;
    buf.append_frame_index = 0;
    if desc.d3d11_buffer != nil { //injected
        buf.d3d11_buf = cast(^d3d.ID3D11_Buffer)desc.d3d11_buffer;
        buf.d3d11_buf.add_ref(buf.d3d11_buf);
    } else {
        using d3d;
        d3d11_desc := D3D11_Buffer_Desc {
            byte_width = u32(buf.size),
            usage = get_d3d11_usage(buf.usage),
            bind_flags = buf.type == BufferType.VERTEX_BUFFER ? 
                D3D11BindFlag.VERTEX_BUFFER : D3D11BindFlag.INDEX_BUFFER,
            cpu_access_flags = get_d3d11_cpu_access_flags(buf.usage),
        };
        init_data: D3D11_Sub_Resource_Data;
        if buf.usage == Usage.IMMUTABLE {
            assert(desc.content != nil);
            init_data.sys_mem = desc.content;
        }
        be_state := &iState.backend.(State_D3D11);
        hr := be_state.dev.create_buffer(be_state.dev, &d3d11_desc, &init_data, &buf.d3d11_buf);
        assert(win32.succeeded(hr) && buf.d3d11_buf != nil);
    }
    return ResourceState.VALID;
}

destroy_d3d11_buffer :: proc (buf: ^Buffer_D3D11) {
    assert(buf != nil);
    if buf.d3d11_buf != nil {
        buf.d3d11_buf.release(buf.d3d11_buf);
    }
    mem.zero_item(buf);
}

fill_d3d11_subres_data :: proc (img: ^Image_D3D11, content: ^Image_Content) {
    num_faces := (img.type == ImageType.CUBE) ? 6 : 1;
    num_slices := (img.type == ImageType.ARRAY) ? img.depth : 1;
    subres_index := 0;
    for face_index := 0; face_index < num_faces; face_index += 1 {
        for slice_index := 0; slice_index < num_slices; /* no stmt */ {
            for mip_index: u32 = 0; mip_index < u32(img.num_mipmaps); { //mip_index is used to bitshift
                assert(subres_index < (MAX_MIPMAPS * MAX_TEXTUREARRAY_LAYERS));
                subres := &iState.backend.(State_D3D11).subres_data[subres_index];
                mip_width := ((img.width >> mip_index) > 0) ? img.width >> mip_index : 1;
                mip_height := ((img.height >> mip_index) > 0) ? img.height >> mip_index : 1;
                subimg_content := &content.sub_images[face_index][mip_index];
                slice_size := int(subimg_content.size) / num_slices;
                slice_offset := slice_size * slice_index;
                ptr: ^u8 = cast(^u8)subimg_content.ptr;
                subres.sys_mem = mem.ptr_offset(ptr, int(slice_offset));
                assert(mip_width < cast(int)max(u32));
                assert(mip_height < cast(int)max(u32));
                row_pitch := get_pixel_format_row_pitch(img.pixel_format, mip_width);
                assert(row_pitch < cast(int)max(u32));
                subres.mem_pitch = cast(u32)row_pitch;
                if img.type == ImageType.DEPTH_3D {
                    surface_pitch := get_surface_pitch(img.pixel_format, mip_width, mip_height);
                    assert(surface_pitch < cast(int)max(u32));
                    subres.mem_slice_pitch = u32(surface_pitch);
                } else {
                    subres.mem_slice_pitch = 0;
                }

                mip_index += 1;
                subres_index += 1;
            }
        }
    }
}

//only use this with enums or integers
@(private)
def :: proc (a, b: $T) -> T {
    if a > T(0) {
        return a;
    } else {
        return b;
    }
}

@(private)
create_d3d11_image :: proc (img: ^Image_D3D11, desc: ^Image_Desc) -> ResourceState {
    assert(img != nil && desc != nil);
    assert(img.pool_slot.state == ResourceState.ALLOC);
    assert(img.tex_2d == nil && img.tex_3d == nil && img.tex_ds == nil && img.tex_msaa == nil);
    assert(img.srv == nil && img.smp == nil);

    img.type = def(desc.type, ImageType.FLAT_2D);
    img.is_render_target = cast(b32)desc.is_render_target;
    img.width = desc.width;
    img.height = desc.height;
    img.depth = def(desc.depth, 1);
    img.num_mipmaps = def(desc.num_mipmaps, 1);
    img.usage = def(desc.usage, Usage.IMMUTABLE);
    img.pixel_format = def(desc.pixel_format, PixelFormat.RGBA8);
    img.sample_count = def(desc.sample_count, 1);
    img.filter_modes.min = def(desc.filter_modes.min, FilterMode.NEAREST);
    img.filter_modes.mag = def(desc.filter_modes.mag, FilterMode.NEAREST);
    img.wrap.u = def(desc.wrap.u, WrapMode.REPEAT);
    img.wrap.v = def(desc.wrap.v, WrapMode.REPEAT);
    img.wrap.w = def(desc.wrap.w, WrapMode.REPEAT);
    img.max_anisotropy = def(desc.max_anisotropy, 1);
    img.update_frame_index = 0;
    is_injected: b32 = (desc.backend_textures.d3d11 != nil) ? true : false;

    assert(img.width < int(max(u32)));
    assert(img.height < int(max(u32)));
    assert(img.sample_count < int(max(u32)));
    assert(img.depth < int(max(u32)));
    assert(img.max_anisotropy < int(max(u32)));

    using d3d;
    hr: win32.Hresult;
    dev := iState.backend.(State_D3D11).dev;
    if is_valid_rendertarget_color_format(img.pixel_format) {
        assert(bool(!is_injected)); //assert doesn't accept b32?
        img.dxgi_format = get_dxgi_rendertarget_depth_format(img.pixel_format);
        if (img.dxgi_format == DXGIFormat.UNKNOWN) {
            //todo(ryan): better error reporting mechanism
            fmt.printf("trying to create a D3D11 depth-texture with unsupported pixel format\n");
            img.pool_slot.state = ResourceState.FAILED;
            return ResourceState.FAILED;
        }

        tex_desc := D3D11_Texture2D_Desc {
            width = u32(img.width),
            height = u32(img.height),
            mip_levels = 1,
            array_size = 1,
            format = img.dxgi_format,
            usage = D3D11Usage.DEFAULT,
            bind_flags = D3D11BindFlag.DEPTH_STENCIL,
            sample_desc = {
                count = u32(img.sample_count),
                quality = (img.sample_count > 1) ? u32(D3D11StandardMultiSampleQualityLevels.STANDARD_MULTISAMPLE_PATTERN) : 0,
            },
        };
        hr := dev.create_texture_2d(dev, &tex_desc, nil, &img.tex_ds);
        assert(win32.succeeded(hr) && (img.tex_ds != nil));
    } else {
        using d3d;
        init_data: ^D3D11_Sub_Resource_Data = nil;
        if !is_injected && img.usage == Usage.IMMUTABLE && !img.is_render_target {
            //populates both content & subres_data global
            fill_d3d11_subres_data(img, &desc.content);
        init_data = &iState.backend.(State_D3D11).subres_data[0];
        }
        if img.type != ImageType.DEPTH_3D {
            tex_desc: D3D11_Texture2D_Desc;
            tex_desc.width = u32(img.width);
            tex_desc.height = u32(img.height);
            tex_desc.mip_levels = u32(img.num_mipmaps);
            switch (img.type) {
                case ImageType.ARRAY:
                    tex_desc.array_size = u32(img.depth);
                case ImageType.CUBE:
                    tex_desc.array_size = 6;
                case:
                    tex_desc.array_size = 1;
            }
            tex_desc.bind_flags = D3D11BindFlag.SHADER_RESOURCE;
            if img.is_render_target {
                img.dxgi_format = get_dxgi_rendertarget_color_format(img.pixel_format);
                tex_desc.format = img.dxgi_format;
                tex_desc.usage = D3D11Usage.DEFAULT;
                if img.sample_count == 1 {
                    tex_desc.bind_flags |= D3D11BindFlag.RENDER_TARGET;
                }
                tex_desc.cpu_access_flags = D3D11CPUAccessFlag(0);
            } else {
                img.dxgi_format = get_dxgi_texture_format(img.pixel_format);
                tex_desc.format = img.dxgi_format;
                tex_desc.usage = get_d3d11_usage(img.usage);
                tex_desc.cpu_access_flags = get_d3d11_cpu_access_flags(img.usage);
            }
            if img.dxgi_format == DXGIFormat.UNKNOWN {
                fmt.printf("trying to create a D3D11 texture with unsupported pixel format\n");
                img.pool_slot.state = ResourceState.FAILED;
            }
            tex_desc.sample_desc.count = 1;
            tex_desc.sample_desc.quality = 0;
            tex_desc.misc_flags = (img.type == ImageType.CUBE) ? u32(D3D11ResourceMiscFlag.TEXTURE_CUBE) : 0;
            if is_injected {
                img.tex_2d = cast(^ID3D11_Texture2D)desc.backend_textures.d3d11;
                img.tex_2d.add_ref(img.tex_2d);
            } else {
                hr = dev.create_texture_2d(dev, &tex_desc, init_data, &img.tex_2d);
                assert(win32.succeeded(hr) && img.tex_2d != nil);
            }

            if img.sample_count > 1 {
                tex_desc.bind_flags |= D3D11BindFlag.RENDER_TARGET;
                tex_desc.sample_desc.count = u32(img.sample_count);
                tex_desc.sample_desc.quality = u32(D3D11StandardMultiSampleQualityLevels.STANDARD_MULTISAMPLE_PATTERN);
                hr = dev.create_texture_2d(dev, &tex_desc, nil, &img.tex_msaa);
                assert(win32.succeeded(hr) && img.tex_msaa != nil);
            }

            srv_desc: D3D11_Shader_Resource_View_Desc;
            srv_desc.format = tex_desc.format;
            using D3D11ShaderResourceViewDimension;
            switch (img.type) {
                case ImageType.FLAT_2D:
                    srv_desc.view_dimension = TEXTURE2D;
                case ImageType.CUBE:
                    srv_desc.view_dimension = TEXTURE_CUBE;
                case ImageType.ARRAY:
                    srv_desc.view_dimension = TEXTURE2D_ARRAY;
                case: {
                    assert(false);
                }
            }

            hr = dev.create_shader_resource_view(dev, cast(^ID3D11_Resource)img.tex_2d, &srv_desc, &img.srv);
            assert(win32.succeeded(hr) && img.srv != nil);
        } else {
            //3D Texture
            tex_desc: D3D11_Texture3D_Desc;
            tex_desc.width = u32(img.width);
            tex_desc.height = u32(img.height);
            tex_desc.depth = u32(img.depth);
            tex_desc.mip_levels = u32(img.num_mipmaps);
            if img.is_render_target {
                img.dxgi_format = get_dxgi_rendertarget_color_format(img.pixel_format);
                tex_desc.format = img.dxgi_format;
                tex_desc.usage = get_d3d11_usage(img.usage);
                tex_desc.bind_flags = D3D11BindFlag.SHADER_RESOURCE | D3D11BindFlag.RENDER_TARGET;
                tex_desc.cpu_access_flags = D3D11CPUAccessFlag(0);
            } else {
                img.dxgi_format = get_dxgi_texture_format(img.pixel_format);
                tex_desc.format = img.dxgi_format;
                tex_desc.usage = get_d3d11_usage(img.usage);
                tex_desc.bind_flags = D3D11BindFlag.SHADER_RESOURCE;
                tex_desc.cpu_access_flags = get_d3d11_cpu_access_flags(img.usage);
            }
            if img.dxgi_format == DXGIFormat.UNKNOWN {
                fmt.printf("trying to create a D3D11 texture with unsupported pixel format\n");
                img.pool_slot.state = ResourceState.FAILED;
            }

            if is_injected {
                img.tex_3d = cast(^ID3D11_Texture3D)desc.backend_textures.d3d11;
            } else {
                hr = dev.create_texture_3d(dev, &tex_desc, init_data, &img.tex_3d);
                assert(win32.succeeded(hr) && img.tex_3d != nil);
            }

            srv_desc: D3D11_Shader_Resource_View_Desc;
            srv_desc.format = tex_desc.format;
            srv_desc.view_dimension = D3D11ShaderResourceViewDimension.TEXTURE3D;
            srv_desc.texture_3d.num_mip_levels = u32(img.num_mipmaps);
            hr = dev.create_shader_resource_view(dev, cast(^ID3D11_Resource)img.tex_3d, &srv_desc, &img.srv);
            assert(win32.succeeded(hr) && img.srv != nil);
        }

        smp_desc := D3D11_Sampler_Desc {
            filter = get_d3d11_filter(img.filter_modes.min, img.filter_modes.mag, img.max_anisotropy),
            address_u = get_d3d11_texture_address_mode(img.wrap.u),
            address_v = get_d3d11_texture_address_mode(img.wrap.v),
            address_w = get_d3d11_texture_address_mode(img.wrap.w),
            mip_lod_bias = 0.0,
            max_anisotropy = u32(img.max_anisotropy),
            comparison_func = D3D11ComparisonFunc.NEVER,
            border_color = { 0.0, 0.0, 0.0, 0.0 },
            min_lod = desc.lod.min,
            max_lod = def(desc.lod.max, D3D11_FLOAT32_MAX),
        };
        assert(win32.succeeded(hr) && img.smp != nil);
    }
    return ResourceState.VALID;
}

destroy_d3d11_image :: proc (img: ^Image_D3D11) {
    assert(img != nil);
    if img.tex_2d != nil {
        img.tex_2d.release(img.tex_2d);
    }
    if img.tex_3d != nil {
        img.tex_3d.release(img.tex_3d);
    }

    if img.tex_ds != nil {
        img.tex_ds.release(img.tex_ds);
    }

    if img.tex_msaa != nil {
        img.tex_msaa.release(img.tex_msaa);
    }

    if img.srv != nil {
        img.srv.release(img.srv);
    }

    if img.smp != nil {
        img.smp.release(img.smp);
    }
    mem.zero_item(img);
}

compile_d3d11_shader :: proc (stage_desc: ^Shader_Stage_Desc, target: cstring) -> ^d3d.ID3D_Blob {
    using d3d;
    output, errors: ^ID3D_Blob;
    defer if errors != nil do errors.release(errors);
    using D3DCompileFlags;
    d3d_compile(
        &stage_desc.src_text[0], /* pSrcData */
        uint(len(stage_desc.src_text)), /* SrcDatasize */
        nil, /* pSourceName */
        nil, /* pDefines */
        nil, /* pInclude */
        uint(len(stage_desc.entry)) > 0 ? cstring(&stage_desc.entry[0]) : cstring("main"), /* pEntryPoint */
        target, /* pTarget (vs_5_0 or fs_5_0) */
        PACK_MATRIX_COLUMN_MAJOR | OPTIMIZATION_LEVEL3, /* Flags1 */
        D3DCompileFlags2(0), /* Flags2 */
        &output, /* ppCode */
        &errors /* ppErrorMsgs */        
    );
    if errors != nil {
        fmt.print(cstring(errors.get_buffer_pointer(errors)));
        errors = nil;
    }
    assert(output != nil);
    return output;
}

round_d3d11_uniform_size :: proc (val, round_to: int) -> u32 { 
    ret := ((val + round_to)- 1) & ~(round_to - 1); 
    assert(ret > 0 && ret < int(max(u32)));
    return u32(ret);
}

create_d3d11_shader :: proc (shd: ^Shader_D3D11, desc: ^Shader_Desc) -> ResourceState {
    assert(shd != nil && desc != nil);
    assert(shd.pool_slot.state == ResourceState.ALLOC);
    assert(shd.vert_shader == nil && shd.pixel_shader == nil && shd.vert_shader_blob == nil);
    hr: win32.Hresult;

    res := ResourceState.FAILED;

    using d3d;
    dev := iState.backend.(State_D3D11).dev;
    for stage_index := 0; stage_index < NUM_SHADER_STAGES; stage_index += 1 {
        stage_desc := (ShaderStage(stage_index) == ShaderStage.VERTEX) ? &desc.vert_shader : &desc.frag_shader;
        curr_stage := &shd.stages[stage_index];
        assert(curr_stage.num_uniform_blocks == 0);
        for ub_index := 0; ub_index < MAX_SHADERSTAGE_UBS; ub_index += 1 {
            ub_desc := &stage_desc.uniform_blocks[ub_index];
            if (ub_desc.size == 0) {
                break;
            }
            curr_ub := &curr_stage.uniform_blocks[ub_index];
            curr_ub.size = ub_desc.size;

            assert(curr_stage.cbs[ub_index] == nil);
            cb_desc := D3D11_Buffer_Desc {
                byte_width = round_d3d11_uniform_size(curr_ub.size, 16),
                usage = D3D11Usage.DEFAULT,
                bind_flags = D3D11BindFlag.CONSTANT_BUFFER,
            };
            hr = dev.create_buffer(dev, &cb_desc, nil, &curr_stage.cbs[ub_index]);
            assert(win32.succeeded(hr) && curr_stage.cbs[ub_index] != nil);
            curr_stage.num_uniform_blocks += 1;
        }
        assert(curr_stage.num_images == 0);
        for img_index := 0; img_index < MAX_SHADERSTAGE_IMAGES; img_index += 1 {
            img_desc := &stage_desc.images[img_index];
            if img_desc.type == ImageType._DEFAULT {
                break;
            }
            curr_stage.images[img_index].type = img_desc.type;
            curr_stage.num_images += 1;
        }
    }

    vs_ptr, ps_ptr: rawptr;
    vs_len, ps_len: uint;
    vs_blob, ps_blob: ^ID3D_Blob;
    defer  {
        if vs_blob != nil do vs_blob.release(vs_blob);
        if ps_blob != nil do ps_blob.release(ps_blob);
    }

    if desc.vert_shader.byte_code != nil && desc.frag_shader.byte_code != nil {
        vs_ptr = &desc.vert_shader.byte_code[0];
        ps_ptr = &desc.frag_shader.byte_code[0];
        vs_len = uint(len(desc.vert_shader.byte_code));
        ps_len = uint(len(desc.frag_shader.byte_code));
    } else {
        vs_blob = compile_d3d11_shader(&desc.vert_shader, "vs_5_0");
        ps_blob = compile_d3d11_shader(&desc.frag_shader, "ps_5_0");
        if (vs_blob != nil && ps_blob != nil) {
            vs_ptr = vs_blob.get_buffer_pointer(vs_blob);
            vs_len = vs_blob.get_buffer_size(vs_blob);
            ps_ptr = ps_blob.get_buffer_pointer(ps_blob);
            ps_len = ps_blob.get_buffer_size(ps_blob);
        }
    }

    if vs_ptr != nil && ps_ptr != nil && vs_len > 0 && ps_len > 0 {
        hr = dev.create_vertex_shader(dev, vs_ptr, vs_len, nil, &shd.vert_shader);
        assert(win32.succeeded(hr) && shd.vert_shader != nil);
        hr = dev.create_pixel_shader(dev, ps_ptr, ps_len, nil, &shd.pixel_shader);
        assert(win32.succeeded(hr) && shd.pixel_shader != nil);

        shd.vert_shader_blob = make([]u8, vs_len);
        mem.copy(&shd.vert_shader_blob[0], vs_ptr, int(vs_len));
        res = ResourceState.VALID;
    }
    return res;
}

destroy_d3d11_shader :: proc (shd: ^Shader_D3D11) {
    assert(shd != nil);
    if shd.vert_shader != nil do shd.vert_shader.release(shd.vert_shader);
    if shd.pixel_shader != nil do shd.pixel_shader.release(shd.pixel_shader);
    if len(shd.vert_shader_blob) != 0 do free(&shd.vert_shader_blob[0]);
    for stage_index := 0; stage_index < NUM_SHADER_STAGES; stage_index += 1 {
        curr_stage := &shd.stages[stage_index];
        for ub_index := 0; ub_index < curr_stage.num_uniform_blocks; ub_index += 1 {
            curr_cb := curr_stage.cbs[ub_index];
            if curr_cb != nil do 
                curr_cb.release(curr_cb);
        }
    }
    //note(ryan): if i end up using dynamic arrays, we need to zero/free the array as well
    mem.zero_item(shd);
}

create_d3d11_pipeline :: proc (pipe: ^Pipeline_D3D11, shd: ^Shader_D3D11, pipe_desc: ^Pipeline_Desc) -> ResourceState {
    assert(pipe != nil && shd != nil && pipe_desc != nil);
    assert(pipe.pool_slot.state == ResourceState.ALLOC);
    assert(pipe.shader == nil && pipe.shader_handle == nil);
    assert(shd.pool_slot.state == ResourceState.VALID);
    assert(len(shd.vert_shader_blob) > 0);
    assert(pipe.input_layout == nil && pipe.rasterizer_state == nil && 
        pipe.depth_stencil_state == nil && pipe.blend_state == nil);

    hr: win32.Hresult;

    pipe.shader = shd;
    pipe.shader_handle = pipe_desc.shader_handle;
    pipe.index_type = def(pipe_desc.index_type, IndexSizeType.NONE);
    pipe.color_attachment_count = def(pipe_desc.blend.color_attachment_count, 1);
    pipe.color_format = def(pipe_desc.blend.color_format, PixelFormat.RGBA8);
    pipe.depth_format = def(pipe_desc.blend.depth_format, PixelFormat.DEPTH_STENCIL);
    pipe.sample_count = def(pipe_desc.rasterizer.sample_count, 1);
    pipe.index_format = get_d3d11_index_format(pipe_desc.index_type);
    pipe.prim_topology = get_d3d11_primitive_topology(def(pipe_desc.primitive_type, PrimitiveType.TRIANGLES));
    assert(size_of(pipe.blend_color) == size_of(pipe_desc.blend.color));
    pipe.blend_color = pipe_desc.blend.color;
    pipe.stencil_ref = pipe_desc.depth_stencil.stencil_ref;
    
    auto_offset: [MAX_SHADERSTAGE_BUFFERS]u32;
    use_auto_offset := true;

    attr_index := 0;
    for attr_index = 0; attr_index < MAX_VERTEX_ATTTRIBUTES; attr_index += 1 {
        if pipe_desc.layout.attrs[attr_index].offset != 0 {
            use_auto_offset = false;
        }
    }

    using d3d;
    comps: [MAX_VERTEX_ATTTRIBUTES]D3D11_Input_Element_Desc;
    for attr_index = 0; attr_index < MAX_VERTEX_ATTTRIBUTES; attr_index += 1 {
        attr_desc := &pipe_desc.layout.attrs[attr_index];
        if attr_desc.format == VertexFormat.INVALID {
            break;
        }
        assert(attr_desc.buffer_index >= 0 && attr_desc.buffer_index < MAX_SHADERSTAGE_BUFFERS);
        il_desc := &pipe_desc.layout.buffers[attr_desc.buffer_index];
        step_type := def(il_desc.step.type, VertexStepType.PER_VERTEX);
        step_rate := def(il_desc.step.rate, 1);
        assert(step_rate < int(max(u32)));
        curr_comp := &comps[attr_index];
        semantic_index := attr_desc.semantic_index;
        assert(semantic_index < int(max(u32)));
        buffer_index := attr_desc.buffer_index;
        assert(buffer_index < int(max(u32)));
        semantic_name := strings.new_cstring(attr_desc.semantic_name);
        defer mem.delete_cstring(semantic_name);
        curr_comp^ = {
            semantic_name = semantic_name,
            semantic_index = u32(semantic_index),
            format = get_d3d11_vertex_format(attr_desc.format),
            input_slot = u32(buffer_index),
            aligned_byte_offset = use_auto_offset ? u32(auto_offset[attr_desc.buffer_index]) : u32(attr_desc.offset),
            input_slot_class = get_d3d11_input_classification(step_type),
        };
        if step_type == VertexStepType.PER_INSTANCE {
            curr_comp.instance_data_step_rate = u32(step_rate);
        }
        auto_offset[attr_desc.buffer_index] += cast(u32)get_vertex_format_width(attr_desc.format);
        pipe.is_vertex_layout_valid[attr_desc.buffer_index] = true;
    }

    for layout_index := 0; layout_index < MAX_SHADERSTAGE_BUFFERS; layout_index += 1 {
        if pipe.is_vertex_layout_valid[layout_index] {
            il_desc := &pipe_desc.layout.buffers[layout_index];
            stride: u32 = il_desc.stride > 0 ? u32(il_desc.stride) : auto_offset[layout_index];
            assert(stride > 0);
            pipe.vb_strides[layout_index] = stride;
        } else {
            pipe.vb_strides[layout_index] = 0;
        }
    }

    dev := iState.backend.(State_D3D11).dev;
    hr = dev.create_input_layout(dev, &comps[0], u32(attr_index), &shd.vert_shader_blob[0], 
        uint(len(shd.vert_shader_blob)), &pipe.input_layout);
    assert(win32.succeeded(hr) && pipe.input_layout != nil);

    rs_desc:= D3D11_Rasterizer_Desc {
        fill_mode = D3D11FillMode.SOLID,
        cull_mode = get_d3d11_cull_mode(def(pipe_desc.rasterizer.cull_mode, CullMode.NONE)),
        is_front_counter_clockwise = def(pipe_desc.rasterizer.face_winding_mode, FaceWindingMode.CLOCKWISE) == FaceWindingMode.COUNTER_CLOCKWISE,
        depth_bias = i32(pipe_desc.rasterizer.depth_bias),
        depth_bias_clamp = pipe_desc.rasterizer.depth_bias_clamp,
        slope_scaled_depth_bias = pipe_desc.rasterizer.depth_bias_slope_scale,
        depth_clip_enabled = true,
        scissor_enabled = true,
        multisample_enabled = def(pipe_desc.rasterizer.sample_count, 1) > 1,
        antialiased_line_enabled = false,
    };
    hr = dev.create_rasterizer_state(dev, &rs_desc, &pipe.rasterizer_state);
    assert(win32.succeeded(hr) && pipe.rasterizer_state != nil);

    dss_desc := D3D11_Depth_Stencil_Desc {
        depth_enabled = true,
        depth_write_mask = pipe_desc.depth_stencil.depth_write_enabled ? D3D11DepthWriteMask.ALL : D3D11DepthWriteMask.ZERO,
        depth_func = get_d3d11_compare_func(def(pipe_desc.depth_stencil.depth_compare_func, ComparisonFuncType.ALWAYS)),
        stencil_enabled = pipe_desc.depth_stencil.stencil_enabled,
        stencil_read_mask = pipe_desc.depth_stencil.stencil_read_mask,
        stencil_write_mask = pipe_desc.depth_stencil.stencil_write_mask,
    };

    sf := &pipe_desc.depth_stencil.stencil_front;
    dss_desc.front_face.stencil_fail_op = get_d3d11_stencil_op(def(sf.fail_op, StencilOpType.KEEP));
    dss_desc.front_face.depth_fail_op = get_d3d11_stencil_op(def(sf.depth_fail_op, StencilOpType.KEEP));
    dss_desc.front_face.stencil_pass_op = get_d3d11_stencil_op(def(sf.pass_op, StencilOpType.KEEP));
    dss_desc.front_face.stencil_func = get_d3d11_compare_func(def(sf.compare_func, ComparisonFuncType.ALWAYS));

    sb := &pipe_desc.depth_stencil.stencil_back;
    dss_desc.back_face.stencil_fail_op = get_d3d11_stencil_op(def(sb.fail_op, StencilOpType.KEEP));
    dss_desc.back_face.depth_fail_op = get_d3d11_stencil_op(def(sb.depth_fail_op, StencilOpType.KEEP));
    dss_desc.back_face.stencil_pass_op = get_d3d11_stencil_op(def(sb.pass_op, StencilOpType.KEEP));
    dss_desc.back_face.stencil_func = get_d3d11_compare_func(def(sb.compare_func, ComparisonFuncType.ALWAYS));

    hr = dev.create_depth_stencil_state(dev, &dss_desc, &pipe.depth_stencil_state);
    assert(win32.succeeded(hr) && pipe.depth_stencil_state != nil);

    bs_desc := D3D11_Blend_Desc {
        alpha_to_coverage_enabled = b32(pipe_desc.rasterizer.alpha_to_coverage_enabled),
        independent_blend_enabled = false,
    };

    rt := &bs_desc.render_targets[0];
    rt.blend_enabled = b32(pipe_desc.blend.enabled);
    rt.src_blend_type = get_d3d11_blend_factor(def(pipe_desc.blend.src_factor_rgb, BlendFactor.ONE));
    rt.dest_blend_type = get_d3d11_blend_factor(def(pipe_desc.blend.dest_factor_rgb, BlendFactor.ZERO));
    rt.blend_op = get_d3d11_blend_op(def(pipe_desc.blend.op_rgb, BlendOp.ADD));
    rt.src_blend_alpha = get_d3d11_blend_factor(def(pipe_desc.blend.src_factor_alpha, BlendFactor.ONE));
    rt.dest_blend_alpha = get_d3d11_blend_factor(def(pipe_desc.blend.dest_factor_alpha, BlendFactor.ZERO));
    rt.blend_op_alpha = get_d3d11_blend_op(def(pipe_desc.blend.op_alpha, BlendOp.ADD));


    using ColorMask;
    def_write_mask: bit_set[ColorMask] = { R, G, B, A };
    none_write_mask: bit_set[ColorMask] = { };
    rt.render_target_write_mask = get_d3d11_color_write_mask(none_write_mask == pipe_desc.blend.color_write_mask ? 
        def_write_mask : pipe_desc.blend.color_write_mask);

    hr = dev.create_blend_state(dev, &bs_desc, &pipe.blend_state);
    assert(win32.succeeded(hr) && pipe.blend_state != nil);
    
    return ResourceState.VALID;
}

destroy_d3d11_pipeline :: proc (pipe: ^Pipeline_D3D11) {
    assert(pipe != nil);
    if pipe.input_layout != nil do pipe.input_layout.release(pipe.input_layout);
    if pipe.rasterizer_state != nil do pipe.rasterizer_state.release(pipe.rasterizer_state);
    if pipe.depth_stencil_state != nil do pipe.depth_stencil_state.release(pipe.depth_stencil_state);
    if pipe.blend_state != nil do pipe.blend_state.release(pipe.blend_state);
    mem.zero_item(pipe);
}

create_d3d11_pass :: proc (pass: ^Pass_D3D11, att_images: []^Image_D3D11, pass_desc: ^Pass_Desc) -> ResourceState {
    using d3d;
    assert(pass != nil && pass_desc != nil);
    assert(pass.pool_slot.state == ResourceState.ALLOC);
    assert(len(att_images) > 0 && att_images[0] != nil);
    be_state := &iState.backend.(State_D3D11);
    dev := be_state.dev;
    dev_ctx := be_state.dev_ctx;
    curr_att: ^Attachment_D3D11 = nil;
    for i := 0; i < MAX_COLOR_ATTACHMENTS; i += 1 {
        assert(pass.color_atts[i].image == nil);
        assert(pass.rtvs[i] == nil);
        curr_att = &pass.color_atts[i];
        assert(curr_att.num_mip_levels < int(max(u32)));
        num_mip_levels := u32(curr_att.num_mip_levels);
        assert(curr_att.slice < int(max(u32)));
        slice := u32(curr_att.slice);
        att_desc := &pass_desc.color_atts[i];
        if att_desc.image_handle != nil {
            pass.num_color_atts += 1;
            assert(att_images[i] != nil && (att_images[i].pool_slot.handle == att_desc.image_handle));
            assert(is_valid_rendertarget_color_format(att_images[i].pixel_format));
            att := &pass.color_atts[i];
            assert(att.image == nil && att.image_handle == nil);
            att.image = att_images[i];
            att.image_handle = att_desc.image_handle;
            att.num_mip_levels = att_desc.num_mip_levels;
            att.slice = att_desc.slice;
        }

        res: ^ID3D11_Resource = nil;
        is_msaa := curr_att.image.sample_count > 1;
        rtv_desc: D3D11_Render_Target_View_Desc;
        rtv_desc.format = curr_att.image.dxgi_format;
        using ImageType;
        using D3D11RenderTargetViewDimension;
        switch (curr_att.image.type) {
            case FLAT_2D: {
                if is_msaa {
                    res = cast(^ID3D11_Resource)curr_att.image.tex_msaa;
                    rtv_desc.view_dimension = TEXTURE2D_MULTI_SAMPLED;
                } else {
                    res = cast(^ID3D11_Resource)curr_att.image.tex_2d;
                    rtv_desc.view_dimension = TEXTURE2D;
                    rtv_desc.texture_2d.mip_slice = num_mip_levels;
                }
            } 
            case CUBE, ARRAY: {
                if is_msaa {
                    res = cast(^ID3D11_Resource)curr_att.image.tex_msaa;
                    rtv_desc.view_dimension = TEXTURE2D_ARRAY_MULTI_SAMPLED;
                    rtv_desc.texture_2d_array_multi_sampled.first_array_slice = slice;
                    rtv_desc.texture_2d_array_multi_sampled.array_size = 1;
                } else {
                    res = cast(^ID3D11_Resource)curr_att.image.tex_2d;
                    rtv_desc.view_dimension = TEXTURE2D_ARRAY;
                    rtv_desc.texture_2d_array.mip_slice = num_mip_levels;
                    rtv_desc.texture_2d_array.first_array_slice = slice;
                    rtv_desc.texture_2d_array.array_size = 1; 
                }
            }
            case DEPTH_3D: {
                assert(!is_msaa);
                res = cast(^ID3D11_Resource)curr_att.image.tex_3d;
                rtv_desc.view_dimension = D3D11RenderTargetViewDimension.TEXTURE3D;
                rtv_desc.texture_3d.mip_slice = num_mip_levels;
                rtv_desc.texture_3d.first_wslice = slice;
                rtv_desc.texture_3d.wsize = 1;
            }
            case: {
                assert(false);
            }
        }
        assert(res != nil);
        hr: win32.Hresult = dev.create_render_target_view(dev, res, &rtv_desc, &pass.rtvs[i]);
        assert(win32.succeeded(hr) && pass.rtvs[i] != nil);
    }

    assert(pass.depth_stencil_att.image == nil);
    assert(pass.dsv == nil);
    att_desc := &pass_desc.depth_stencil_att;
    ds_img_index := MAX_COLOR_ATTACHMENTS;
    if att_desc.image_handle != nil {
        assert(att_images[ds_img_index] != nil && (att_images[ds_img_index].pool_slot.handle == att_desc.image_handle));
        assert(is_valid_rendertarget_depth_format(att_images[ds_img_index].pixel_format));
        curr_att = &pass.depth_stencil_att;
        assert(curr_att.image == nil && curr_att.image_handle == nil);
        curr_att.image = att_images[ds_img_index];
        curr_att.image_handle = att_desc.image_handle;
        curr_att.num_mip_levels = att_desc.num_mip_levels;
        curr_att.slice = att_desc.slice;

        dsv_desc: D3D11_Depth_Stencil_View_Desc;
        dsv_desc.format = curr_att.image.dxgi_format;
        is_msaa := curr_att.image.sample_count > 1;
        if is_msaa {
            dsv_desc.view_dimension = D3D11DepthStencilViewDimension.TEXTURE2D_MULTI_SAMPLED;
        } else {
            dsv_desc.view_dimension = D3D11DepthStencilViewDimension.TEXTURE2D;
        }
        res := cast(^ID3D11_Resource)curr_att.image.tex_ds;
        assert(res != nil);
        hr: win32.Hresult = dev.create_depth_stencil_view(dev, res, &dsv_desc, &pass.dsv);
        assert(win32.succeeded(hr) && pass.dsv != nil);
    }
    return ResourceState.VALID;
}

destory_d3d11_pass :: proc (pass: ^Pass_D3D11) {
    assert(pass != nil);
    for i := 0; i < MAX_COLOR_ATTACHMENTS; i += 1 {
        if (pass.rtvs[i] != nil) {
            pass.rtvs[i].release(pass.rtvs[i]);
        }
    }
    if pass.dsv != nil {
        pass.dsv.release(pass.dsv);
    }
    mem.zero_item(pass);
}

begin_d3d11_pass :: proc (pass: ^Pass_D3D11, action: ^Pass_Action, w, h: int) {
    using d3d;
    assert(action != nil);
    be_state := &iState.backend.(State_D3D11);
    dev := be_state.dev;
    dev_ctx := be_state.dev_ctx;
    assert(be_state.in_pass == false);
    be_state.in_pass = true;
    be_state.curr_width = w;
    be_state.curr_height = h;
    if pass != nil {
        be_state.curr_pass = pass;
        be_state.curr_pass_handle = pass.pool_slot.handle;
        be_state.num_rtvs = 0;
        for i := 0; i < MAX_COLOR_ATTACHMENTS; i += 1 {
            be_state.curr_rtvs[i] = pass.rtvs[i];
            if be_state.curr_rtvs[i] != nil {
                be_state.num_rtvs += 1;
            }
        }
        be_state.curr_dsv = pass.dsv;
    } else {
        be_state.curr_pass = nil;
        be_state.curr_pass_handle = nil;
        be_state.num_rtvs = 1;
        be_state.curr_rtvs[0] = cast(^ID3D11_Render_Target_View)be_state.get_curr_rtv();
        for i := 1; i < MAX_COLOR_ATTACHMENTS; i += 1 {
            be_state.curr_rtvs[i] = nil;
        }
        be_state.curr_dsv = cast(^ID3D11_Depth_Stencil_View)be_state.get_curr_dsv();
        assert(be_state.curr_rtvs[0] != nil && be_state.curr_dsv != nil);
    }
    dev_ctx.om_set_render_targets(dev_ctx, MAX_COLOR_ATTACHMENTS, &be_state.curr_rtvs[0], be_state.curr_dsv);

    vp := D3D11_Viewport {
        width = f32(w),
        height = f32(h),
        max_depth = 1.0,
    };
    dev_ctx.rs_set_viewports(dev_ctx, 1, &vp);

    assert(w < int(max(i32)));
    assert(h < int(max(i32)));
    rect := D3D11_Rect {
        left = 0,
        top = 0,
        right = i32(w),
        bottom = i32(h),
    };

    dev_ctx.rs_set_scissor_rects(dev_ctx, 1, &rect);

    for i := 0; i < be_state.num_rtvs; i +=1 {
        if action.colors[i].action_type == ActionType.CLEAR {
            dev_ctx.clear_render_target_view(dev_ctx, be_state.curr_rtvs[i], &action.colors[i].value[0]);
        }
    }

    ds_flags: bit_set[D3D11ClearFlag; u32];
    if action.depth.action_type == ActionType.CLEAR {
        ds_flags |= { D3D11ClearFlag.DEPTH };
    }
    if action.stencil.action_type == ActionType.CLEAR {
        ds_flags |= { D3D11ClearFlag.STENCIL };
    }
    if ds_flags != nil && be_state.curr_dsv != nil {
        dev_ctx.clear_depth_stencil_view(dev_ctx, be_state.curr_dsv, ds_flags, action.depth.value, action.stencil.value);
    }
}

calc_d3d11_subresource :: proc (mip_slice, array_slice, num_mip_levels: int) -> int {
    return mip_slice + array_slice * num_mip_levels;
}

end_d3d11_pass :: proc () {
    using d3d;
    be_state := &iState.backend.(State_D3D11);
    be_state.in_pass = false;

    if be_state.curr_pass != nil {
        assert(be_state.curr_pass.pool_slot.handle == be_state.curr_pass_handle);
        for i := 0; i < be_state.num_rtvs; i += 1 {
            curr_att := &be_state.curr_pass.color_atts[i];
            assert(curr_att.image != nil && (curr_att.image.pool_slot.handle == curr_att.image_handle));
            if curr_att.image.sample_count > 1 {
                assert(curr_att.image.tex_2d != nil && curr_att.image.tex_msaa != nil && curr_att.image.tex_3d == nil);
                assert(curr_att.image.dxgi_format != DXGIFormat.UNKNOWN);
                img := curr_att.image;
                subres := cast(u32)calc_d3d11_subresource(curr_att.num_mip_levels, curr_att.slice, img.num_mipmaps);
                be_state.dev_ctx.resolve_sub_resource(be_state.dev_ctx, cast(^ID3D11_Resource)img.tex_2d, subres, cast(^ID3D11_Resource)img.tex_msaa,
                    subres, img.dxgi_format);
            }
        }
    }
    be_state.curr_pass = nil;
    be_state.curr_pass_handle = nil;
    be_state.curr_pipeline = nil;
    be_state.curr_pipeline_handle = nil;
    mem.zero_item(&be_state.curr_rtvs);
    clear_d3d11_state(be_state);
}

apply_d3d11_viewport :: proc (x, y, w, h: i32, is_origin_top_left: bool) {
    be_state := &iState.backend.(State_D3D11);
    assert(be_state.dev_ctx != nil);
    assert(be_state.in_pass == true);
    vp := d3d.D3D11_Viewport {
        top_left_x = f32(x),
        top_left_y = cast(f32)(is_origin_top_left ? y : i32(be_state.curr_height) - (y + h)),
        width = f32(w),
        height = f32(h),
        min_depth = 0.0,
        max_depth = 1.0,
    };
    be_state.dev_ctx.rs_set_viewports(be_state.dev_ctx, 1, &vp);
}

apply_d3d11_scissor_rect :: proc (x, y, w, h: i32, is_origin_top_left: bool) {
    be_state := &iState.backend.(State_D3D11);
    assert(be_state.dev_ctx != nil);
    assert(be_state.in_pass == false);
    rect := d3d.D3D11_Rect {
        left = x,
        top = is_origin_top_left ? y : i32(be_state.curr_height) - y + h,
        right = x + w,
        bottom = is_origin_top_left ? y + h : i32(be_state.curr_height) - y,
    };
    be_state.dev_ctx.rs_set_scissor_rects(be_state.dev_ctx, 1, &rect);
}

@(private)
apply_d3d11_pipeline :: proc (pipe: ^Pipeline_D3D11) {
    be_state := &iState.backend.(State_D3D11);
    assert(pipe != nil);
    assert(pipe.shader != nil);
    assert(be_state.dev_ctx != nil);
    assert(be_state.in_pass != false);
    assert(pipe.rasterizer_state != nil && pipe.blend_state != nil &&
        pipe.depth_stencil_state != nil && pipe.input_layout != nil
    );

    using d3d;
    be_state.curr_pipeline = pipe;
    be_state.curr_pipeline_handle = pipe.pool_slot.handle;
    be_state.use_indexed_draw = pipe.index_format != DXGIFormat.UNKNOWN;

    dev_ctx := be_state.dev_ctx;
    dev_ctx.rs_set_state(dev_ctx, pipe.rasterizer_state);
    dev_ctx.om_set_depth_stencil_state(dev_ctx, pipe.depth_stencil_state, pipe.stencil_ref);
    dev_ctx.om_set_blend_state(dev_ctx, pipe.blend_state, &pipe.blend_color[0], 0xFFFF_FFFF);
    dev_ctx.ia_set_primitive_topology(dev_ctx, pipe.prim_topology);
    dev_ctx.ia_set_input_layout(dev_ctx, pipe.input_layout);
    dev_ctx.vs_set_shader(dev_ctx, pipe.shader.vert_shader, nil, 0);
    dev_ctx.vs_set_constant_buffers(dev_ctx, 0, MAX_SHADERSTAGE_UBS, &pipe.shader.stages[uint(ShaderStage.VERTEX)].cbs[0]);
    dev_ctx.ps_set_shader(dev_ctx, pipe.shader.pixel_shader, nil, 0);
    dev_ctx.ps_set_constant_buffers(dev_ctx, 0, MAX_SHADERSTAGE_UBS, &pipe.shader.stages[uint(ShaderStage.FRAGMENT)].cbs[0]);
}

apply_d3d11_bindings :: proc (pipe: ^Pipeline_D3D11, 
    vbs: []^Buffer_D3D11, vb_offsets: []u32, ib: ^Buffer_D3D11, 
    ib_offset: u32, vs_imgs: []^Image_D3D11, ps_imgs: []^Image_D3D11) {

    assert(pipe != nil);
    be_state := &iState.backend.(State_D3D11);
    assert(be_state.dev_ctx != nil);

    using d3d;
    num_vbs := len(vbs);
    assert(num_vbs <= MAX_SHADERSTAGE_BUFFERS);
    assert(len(vb_offsets) == num_vbs);
    num_vs_imgs := len(vs_imgs);
    num_ps_imgs := len(ps_imgs);
    assert(num_vs_imgs <= MAX_SHADERSTAGE_IMAGES);
    assert(num_ps_imgs <= MAX_SHADERSTAGE_IMAGES);

    curr_vbs: [MAX_SHADERSTAGE_BUFFERS]^ID3D11_Buffer;
    curr_vb_offsets: [MAX_SHADERSTAGE_BUFFERS]u32;
    curr_vs_srvs, curr_ps_srvs: [MAX_SHADERSTAGE_IMAGES]^ID3D11_Shader_Resource_View;
    curr_vs_smps, curr_ps_smps: [MAX_SHADERSTAGE_IMAGES]^ID3D11_Sampler_State;
    curr_ib: ^ID3D11_Buffer = ib != nil ? ib.d3d11_buf : nil;

    for i := 0; i < num_vbs; i +=1 {
        curr_vbs = vbs[i].d3d11_buf;
        curr_vb_offsets = vb_offsets[i];
    }

    for i := 0; i < num_vs_imgs; i +=1 {
        assert(vs_imgs[i].srv != nil);
        assert(vs_imgs[i].smp != nil);
        curr_vs_srvs[i] = vs_imgs[i].srv;
        curr_vs_smps[i] = vs_imgs[i].smp;
    }

    for i := 0; i < num_ps_imgs; i +=1 {
        assert(ps_imgs[i].srv != nil);
        assert(ps_imgs[i].smp != nil);
        curr_ps_srvs[i] = ps_imgs[i].srv;
        curr_ps_smps[i] = ps_imgs[i].smp;
    }

    dev_ctx := be_state.dev_ctx;
    dev_ctx.ia_set_vertex_buffers(dev_ctx, 0, MAX_SHADERSTAGE_BUFFERS, &curr_vbs[0], &pipe.vb_strides[0], &vb_offsets[0]);
    dev_ctx.ia_set_index_buffer(dev_ctx, curr_ib, pipe.index_format, ib_offset);
    dev_ctx.vs_set_shader_resources(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &curr_vs_srvs[0]);
    dev_ctx.vs_set_samplers(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &curr_vs_smps[0]);
    dev_ctx.ps_set_shader_resources(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &curr_ps_srvs[0]);
    dev_ctx.ps_set_samplers(dev_ctx, 0, MAX_SHADERSTAGE_IMAGES, &curr_ps_smps[0]);
}

apply_d3d11_uniforms :: proc (stage_index: ShaderStage, ub_index: int, data: rawptr, num_bytes: int) {
    be_state := iState.backend.(State_D3D11);
    dev_ctx := get_dev_ctx();
    assert(dev_ctx != nil && be_state.in_pass == true);
    assert(data != nil && num_bytes > 0);
    assert(int(stage_index) >= 0 && int(stage_index) < NUM_SHADER_STAGES);
    assert(ub_index >= 0 && ub_index < MAX_SHADERSTAGE_UBS);
    assert(be_state.curr_pipeline != nil && be_state.curr_pipeline.pool_slot.handle == be_state.curr_pipeline_handle);
    assert(be_state.curr_pipeline.shader != nil && be_state.curr_pipeline.shader.pool_slot.handle == be_state.curr_pipeline.shader_handle);
    assert(ub_index < be_state.curr_pipeline.shader.stages[int(stage_index)].uniform_blocks[ub_index].size);

    cb := be_state.curr_pipeline.shader.stages[stage_index].cbs[ub_index];
    assert(cb != nil);

    dev_ctx.update_sub_resource(dev_ctx, cast(^d3d.ID3D11_Resource)cb, 0, nil, data, 0, 0);
}

@(private)
draw_d3d11 :: proc (base_element, num_elements, num_instances: u32) {
    be_state := iState.backend.(State_D3D11);
    assert(be_state.in_pass == true);
    dev_ctx := get_dev_ctx();

    if be_state.use_indexed_draw {
        if num_instances == 1 {
            dev_ctx.draw_indexed(dev_ctx, num_elements, base_element, 0);
        } else {
            dev_ctx.draw_indexed_instanced(dev_ctx, num_elements, num_instances, base_element, 0, 0);
        }
    } else {
        if num_instances == 1 {
            dev_ctx.draw(dev_ctx, num_elements, base_element);
        } else {
            dev_ctx.draw_instanced(dev_ctx, num_elements, num_instances, base_element, 0);
        }
    }
}

@(private)
commit_d3d11 :: proc () {
    assert(iState.backend.(State_D3D11).in_pass == false);
}

get_dev_ctx :: proc () -> ^d3d.ID3D11_Device_Context {
    dev_ctx := iState.backend.(State_D3D11).dev_ctx;
    assert(dev_ctx != nil);
    return dev_ctx;
}

@(private)
update_d3d11_buffer :: proc (buf: ^Buffer_D3D11, data: rawptr, size: int) {
    assert(buf != nil && data != nil && size > 0);
    assert(buf.d3d11_buf != nil);

    using d3d;
    dev_ctx := get_dev_ctx();
    msr: D3D11_Mapped_Sub_Resource;
    hr: win32.Hresult = dev_ctx.map_resource(dev_ctx, cast(^ID3D11_Resource)buf.d3d11_buf, 0, D3D11Map.WRITE_DISCARD, 0, &msr);
    assert(win32.succeeded(hr));
    mem.copy(msr.data, data, size);
    dev_ctx.unmap_resource(dev_ctx, cast(^ID3D11_Resource)buf.d3d11_buf, 0);
}

@(private)
append_d3d11_buffer :: proc (buf: ^Buffer_D3D11, data: rawptr, size: int, is_new_frame: bool) {
    assert(buf != nil && data != nil && size > 0);
    assert(buf.d3d11_buf != nil);

    using d3d;
    dev_ctx := get_dev_ctx();
    map_type := is_new_frame ? D3D11Map.WRITE_DISCARD : D3D11Map.WRITE_NO_OVERWRITE;
    msr: D3D11_Mapped_Sub_Resource;
    hr: win32.Hresult = dev_ctx.map_resource(dev_ctx, cast(^ID3D11_Resource)buf.d3d11_buf, 0, map_type, 0, &msr);
    assert(win32.succeeded(hr));
    dst_ptr := mem.ptr_offset(cast(^u8)msr.data, buf.append_pos);
    mem.copy(dst_ptr, data, int(size));
    dev_ctx.unmap_resource(dev_ctx, cast(^ID3D11_Resource)buf.d3d11_buf, 0);
}

@(private)
update_d3d11_image :: proc (img: ^Image_D3D11, img_data: ^Image_Content) {
    assert(img != nil && img_data != nil);
    assert(img.tex_2d != nil || img.tex_3d != nil);
    
    using d3d;
    dev_ctx := get_dev_ctx();
    res: ^ID3D11_Resource = nil;
    if img.tex_3d != nil {
        res = cast(^ID3D11_Resource)img.tex_3d;
    } else {
        res = cast(^ID3D11_Resource)img.tex_2d;
    }

    assert(res != nil);
    num_faces := img.type == ImageType.CUBE ? 6 : 1;
    num_slices := img.type == ImageType.ARRAY ? img.depth : 1;
    subres_index: u32 = 0;
    hr: win32.Hresult;
    msr: d3d.D3D11_Mapped_Sub_Resource;
    for face_index := 0; face_index < num_faces; face_index +=1 {
        for slice_index := 0; slice_index < num_slices; slice_index += 1 {
            for mip_index: uint = 0; mip_index < uint(img.num_mipmaps); {
                assert(subres_index <= MAX_MIPMAPS * MAX_TEXTUREARRAY_LAYERS);
                mip_width := ((img.width >> mip_index) > 0) ? img.width >> mip_index : 1;
                mip_height := ((img.height >> mip_index) > 0) ? img.height >> mip_index : 1;
                src_pitch := get_pixel_format_row_pitch(img.pixel_format, mip_width);
                subimg_content := &img_data.sub_images[face_index][mip_index];
                slice_size := int(subimg_content.size) / num_slices;
                slice_offset := slice_size * slice_index;
                slice_ptr := mem.ptr_offset(cast(^u8)subimg_content.ptr, slice_offset);
                hr = dev_ctx.map_resource(dev_ctx, res, subres_index, D3D11Map.WRITE_DISCARD, 0, &msr);
                assert(win32.succeeded(hr));
                if src_pitch == int(msr.row_pitch) {
                    mem.copy(msr.data, slice_ptr, slice_size);
                } else {
                    assert(src_pitch < int(msr.row_pitch));
                    src_ptr := slice_ptr;
                    dst_ptr := cast(^u8)msr.data;
                    for row_index := 0; row_index < mip_height; row_index +=1 {
                        mem.copy(dst_ptr, src_ptr, src_pitch);
                        src_ptr = mem.ptr_offset(src_ptr, src_pitch);
                        dst_ptr = mem.ptr_offset(dst_ptr, int(msr.row_pitch));
                    }
                }
                dev_ctx.unmap_resource(dev_ctx, res, subres_index);
            }
        }
    }
}

Pool :: struct {
    size: int,
    unique_counter: int,
    queue_top_id: int,
    free_queue: []int,
}

init_pool :: proc (pool: ^Pool, num_slots: int) {
    assert(pool != nil && num_slots > 1);
    //slot 0 is reserved for 'invalid id'
    pool.size = num_slots + 1;
    pool.queue_top_id = 0;
    pool.unique_counter = 0;
    pool.free_queue = make([]int, num_slots);
    for i := pool.size - 1; i >= 1; i -= 1 {
        pool.free_queue[pool.queue_top_id] = i;
        pool.queue_top_id += 1;
    }
}

discard_pool :: proc (pool: ^Pool) {
    assert(pool != nil);
    assert(len(pool.free_queue) > 0);
    delete(pool.free_queue);
    mem.zero_item(pool);
}

pool_alloc_handle :: proc (pool: ^Pool) -> Gfx_Handle {
    assert(pool != nil);
    assert(len(pool.free_queue) > 0);
    if pool.queue_top_id > 0 {
        pool.queue_top_id -= 1;
        slot_index := pool.free_queue[pool.queue_top_id];
        ret := (pool.unique_counter << SLOT_MASK) | slot_index;
        pool.unique_counter += 1;
        return Gfx_Handle(ret);
    } else {
        return Gfx_Handle(INVALID_ID);
    }
}

pool_free_handle :: proc (pool: ^Pool, hndl: Gfx_Handle) {
    verify_ptr_and_handle(pool, hndl);
    assert(len(pool.free_queue) > 0);
    assert(pool.queue_top_id < pool.size);
    pool.free_queue[pool.queue_top_id] = int(hndl);
    pool.queue_top_id += 1;
    assert(pool.queue_top_id <= (pool.size-1));
}

setup_d3d11_pools :: proc (p: ^Pools_D3D11, setup_desc: ^Setup_Desc) {
    assert(p != nil);
    assert(setup_desc != nil);

    assert(setup_desc.buffer_pool_size >= 0 && setup_desc.buffer_pool_size < MAX_POOL_SIZE);
    init_pool(&p.buffer_pool, def(setup_desc.buffer_pool_size, DEFAULT_BUFFER_POOL_SIZE));
    p.buffers = make([]Buffer_D3D11, p.buffer_pool.size);
    assert(len(p.buffers) > 0);

    assert(setup_desc.image_pool_size >= 0 && setup_desc.image_pool_size < MAX_POOL_SIZE);
    init_pool(&p.image_pool, def(setup_desc.image_pool_size, DEFAULT_IMAGE_POOL_SIZE));
    p.images = make([]Image_D3D11, p.image_pool.size);
    assert(len(p.images) > 0);

    assert(setup_desc.shader_pool_size >= 0 && setup_desc.shader_pool_size < MAX_POOL_SIZE);
    init_pool(&p.shader_pool, def(setup_desc.shader_pool_size, DEFAULT_SHADER_POOL_SIZE));
    p.shaders = make([]Shader_D3D11, p.shader_pool.size);
    assert(len(p.shaders) > 0);

    assert(setup_desc.pipeline_pool_size >= 0 && setup_desc.pipeline_pool_size < MAX_POOL_SIZE);
    init_pool(&p.pipeline_pool, def(setup_desc.pipeline_pool_size, DEFAULT_PIPELINE_POOL_SIZE));
    p.pipelines = make([]Pipeline_D3D11, p.pipeline_pool.size);
    assert(len(p.pipelines) > 0);

    assert(setup_desc.pass_pool_size >= 0 && setup_desc.pass_pool_size < MAX_POOL_SIZE);
    init_pool(&p.pass_pool, def(setup_desc.pass_pool_size, DEFAULT_PASS_POOL_SIZE));
    p.passes = make([]Pass_D3D11, p.pass_pool.size);
    assert(len(p.passes) > 0);
}

discard_d3d11_pools:: proc (p: ^Pools_D3D11) {
    assert(p != nil);
    delete(p.passes);
    delete(p.pipelines);
    delete(p.shaders);
    delete(p.images);
    delete(p.buffers);
    discard_pool(&p.pass_pool);
    discard_pool(&p.pipeline_pool);
    discard_pool(&p.shader_pool);
    discard_pool(&p.image_pool);
    discard_pool(&p.buffer_pool);
}

@(private)
verify_ptr_and_handle :: proc(p: rawptr, hndl: Gfx_Handle) {
    assert(p != nil && int(hndl) != INVALID_ID);
}

buffer_d3d11_at :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Buffer_D3D11 {
    verify_ptr_and_handle(p, hndl);
    slot_index := decode_handle(hndl);
    assert(slot_index >= 0 && slot_index < p.buffer_pool.size);
    return &p.buffers[slot_index];
}

image_d3d11_at :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Image_D3D11 {
    verify_ptr_and_handle(p, hndl);
    slot_index := decode_handle(hndl);
    assert(slot_index >= 0 && slot_index < p.image_pool.size);
    return &p.images[slot_index];
}

shader_d3d11_at :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Shader_D3D11 {
    verify_ptr_and_handle(p, hndl);
    slot_index := decode_handle(hndl);
    assert(slot_index >= 0 && slot_index < p.shader_pool.size);
    return &p.shaders[slot_index];
}

pipeline_d3d11_at :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Pipeline_D3D11 {
    verify_ptr_and_handle(p, hndl);
    slot_index := decode_handle(hndl);
    assert(slot_index >= 0 && slot_index < p.pipeline_pool.size);
    return &p.pipelines[slot_index];
}

pass_d3d11_at :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Pass_D3D11 {
    verify_ptr_and_handle(p, hndl);
    slot_index := decode_handle(hndl);
    assert(slot_index >= 0 && slot_index < p.pass_pool.size);
    return &p.passes[slot_index];
}

context_at :: proc (p: ^Pool, hndl: Gfx_Handle) -> ^Context {
    verify_ptr_and_handle(p, hndl);
    slot_index := decode_handle(hndl);
    assert(slot_index >= 0 && slot_index < iState.context_pool.size);
    return &iState.contexts[slot_index];
}

is_valid_handle :: proc (hndl: Gfx_Handle) -> bool {
    return int(hndl) != INVALID_ID;
}

is_same_handle :: proc (one, two: Gfx_Handle) -> bool {
    return int(one) == int(two);
}

lookup_d3d11_buffer :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Buffer_D3D11 {
    if is_valid_handle(hndl) {
        buf := buffer_d3d11_at(p, hndl);
        if is_same_handle(buf.pool_slot.handle, hndl) {
            return buf;
        }
    }
    return nil;
}

lookup_d3d11_image :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Image_D3D11 {
    if is_valid_handle(hndl) {
        img := image_d3d11_at(p, hndl);
        if is_same_handle(img.pool_slot.handle, hndl) {
            return img;
        }
    }
    return nil;
}

lookup_d3d11_shader :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Shader_D3D11 {
    if is_valid_handle(hndl) {
        shader := shader_d3d11_at(p, hndl);
        if is_same_handle(shader.pool_slot.handle, hndl) {
            return shader;
        }
    }
    return nil;
}

lookup_d3d11_pipeline :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Pipeline_D3D11 {
    if is_valid_handle(hndl) {
        pipe := pipeline_d3d11_at(p, hndl);
        if is_same_handle(pipe.pool_slot.handle, hndl) {
            return pipe;
        }
    }
    return nil;
}

lookup_d3d11_pass :: proc (p: ^Pools_D3D11, hndl: Gfx_Handle) -> ^Pass_D3D11 {
    if is_valid_handle(hndl) {
        pass := pass_d3d11_at(p, hndl);
        if is_same_handle(pass.pool_slot.handle, hndl) {
            return pass;
        }
    }
    return nil;
}

lookup_context :: proc (p: ^Pool, hndl: Gfx_Handle) -> ^Context {
    if is_valid_handle(hndl) {
        ctx := context_at(p, hndl);
        if is_same_handle(ctx.pool_slot.handle, hndl) {
            return ctx;
        }
    }
    return nil;
}

destroy_d3d11_resources :: proc (p: ^Pools_D3D11, ctx_handle: Gfx_Handle) {
    for i := 0; i < p.buffer_pool.size; i += 1 {
        if p.buffers[i].pool_slot.state == ResourceState.VALID {
            if p.buffers[i].pool_slot.ctx_handle == ctx_handle {
                destroy_d3d11_buffer(&p.buffers[i]);
            }
        }
    }
    for i := 0; i < p.image_pool.size; i += 1 {
        if p.images[i].pool_slot.state == ResourceState.VALID {
            if p.images[i].pool_slot.ctx_handle == ctx_handle {
                destroy_d3d11_image(&p.images[i]);
            }
        }
    }
    for i := 0; i < p.shader_pool.size; i += 1 {
        if p.shaders[i].pool_slot.state == ResourceState.VALID {
            if p.shaders[i].pool_slot.ctx_handle == ctx_handle {
                destroy_d3d11_shader(&p.shaders[i]);
            }
        }
    }
    for i := 0; i < p.pipeline_pool.size; i += 1 {
        if p.pipelines[i].pool_slot.state == ResourceState.VALID {
            if p.pipelines[i].pool_slot.ctx_handle == ctx_handle {
                destroy_d3d11_pipeline(&p.pipelines[i]);
            }
        }
    }
    for i := 0; i < p.pass_pool.size; i += 1 {
        if p.passes[i].pool_slot.state == ResourceState.VALID {
            if p.passes[i].pool_slot.ctx_handle == ctx_handle {
                destory_d3d11_pass(&p.passes[i]);
            }
        }
    }
}

gfx_setup :: proc (setup_desc: ^Setup_Desc) {
    assert(setup_desc != nil);
    mem.zero_item(&iState);
    iState.backend = State_D3D11 {};
    be_state := &iState.backend.(State_D3D11);
    iState.frame_index = 1;
    setup_d3d11_backend(be_state, setup_desc);
    assert(setup_desc.context_pool_size >= 0 && setup_desc.context_pool_size < MAX_POOL_SIZE);
    init_pool(&iState.context_pool, def(setup_desc.context_pool_size, DEFAULT_CONTEXT_POOL_SIZE));
    iState.contexts = make([]Context, iState.context_pool.size);
    assert(len(iState.contexts) > 0);
}

gfx_shutdown :: proc() {
    be_state := &iState.backend.(State_D3D11);
    if int(iState.active_context_handle) != INVALID_ID {
        ctx := lookup_context(&iState.context_pool, iState.active_context_handle);
        if ctx != nil {
            destroy_d3d11_resources(&be_state.pools, iState.active_context_handle);
        }
    }
    discard_d3d11_backend(be_state);
    iState.is_valid = false;
}

gfx_is_valid :: proc() -> bool {
    return iState.is_valid;
}

gfx_query_feature :: proc (f: Features) -> bool {
    return query_d3d11_feature(f);
}

gfx_setup_context :: proc() -> Gfx_Context_Handle {
    res: Gfx_Context_Handle;
    res = pool_alloc_handle(&iState.context_pool);
    if int(res) != INVALID_ID {
        ctx := context_at(&iState.context_pool, res);
        assert(ctx != nil);
        ctx.pool_slot.handle = res;
        ctx.pool_slot.state = ResourceState.ALLOC;
        init_context(ctx);
        assert(ctx.pool_slot.state == ResourceState.VALID);
        activate_context(ctx);
    }
    iState.active_context_handle = res;
    return res;
}

gfx_discard_context :: proc(ctx_handle: Gfx_Context_Handle) {
    destroy_d3d11_resources(&iState.backend.(State_D3D11).pools, ctx_handle);
    ctx := lookup_context(&iState.context_pool, ctx_handle);
    if ctx != nil {
        destroy_context(ctx);
        pool_free_handle(&iState.context_pool, ctx_handle);
    }
    iState.active_context_handle = Gfx_Handle(INVALID_ID);
    activate_context(nil);
}

gfx_activate_context :: proc (ctx_handle: Gfx_Context_Handle) {
    iState.active_context_handle = ctx_handle;
    ctx := lookup_context(&iState.context_pool, ctx_handle);
    activate_context(ctx);
}

gfx_alloc_buffer :: proc () -> Gfx_Buffer_Handle {
    be_state := &iState.backend.(State_D3D11);
    res := cast(Gfx_Buffer_Handle)pool_alloc_handle(&be_state.pools.buffer_pool);
    if is_valid_handle(res) {
        buf := buffer_d3d11_at(&be_state.pools, res);
        assert(buf != nil && buf.pool_slot.state == ResourceState.INITIAL &&
            !is_valid_handle(buf.pool_slot.handle));
        buf.pool_slot.handle = res;
        buf.pool_slot.state = ResourceState.ALLOC;
    }
    return res;
}

gfx_alloc_image :: proc() -> Gfx_Image_Handle {
    be_state := &iState.backend.(State_D3D11);
    res := cast(Gfx_Image_Handle)pool_alloc_handle(&be_state.pools.image_pool);
    if is_valid_handle(res) {
        img := image_d3d11_at(&be_state.pools, res);
        assert(img != nil && img.pool_slot.state == ResourceState.INITIAL &&
            !is_valid_handle(img.pool_slot.handle));
        img.pool_slot.handle = res;
        img.pool_slot.state = ResourceState.ALLOC;
    }
    return res;
}

gfx_alloc_shader :: proc() -> Gfx_Shader_Handle {
    be_state := &iState.backend.(State_D3D11);
    res := cast(Gfx_Shader_Handle)pool_alloc_handle(&be_state.pools.shader_pool);
    if is_valid_handle(res) {
        shd := shader_d3d11_at(&be_state.pools, res);
        assert(shd != nil && shd.pool_slot.state == ResourceState.INITIAL &&
            !is_valid_handle(shd.pool_slot.handle));
        shd.pool_slot.handle = res;
        shd.pool_slot.state = ResourceState.ALLOC;
    }
    return res;
}

gfx_alloc_pipeline :: proc () -> Gfx_Pipeline_Handle {
    be_state := &iState.backend.(State_D3D11);
    res := cast(Gfx_Pipeline_Handle)pool_alloc_handle(&be_state.pools.pipeline_pool);
    if is_valid_handle(res) {
        pipe := pipeline_d3d11_at(&be_state.pools, res);
        assert(pipe != nil && pipe.pool_slot.state == ResourceState.INITIAL &&
            !is_valid_handle(pipe.pool_slot.handle));
        pipe.pool_slot.handle = res;
        pipe.pool_slot.state = ResourceState.ALLOC;
    }
    return res;
}

gfx_alloc_pass :: proc () -> Gfx_Pass_Handle {
    be_state := &iState.backend.(State_D3D11);
    res := cast(Gfx_Pass_Handle)pool_alloc_handle(&be_state.pools.pass_pool);
    if is_valid_handle(res) {
        pass := pass_d3d11_at(&be_state.pools, res);
        assert(pass != nil && pass.pool_slot.state == ResourceState.INITIAL &&
            !is_valid_handle(pass.pool_slot.handle));
        pass.pool_slot.handle = res;
        pass.pool_slot.state = ResourceState.ALLOC;
    }
    return res;
}

gfx_init_buffer :: proc (buf_handle: Gfx_Buffer_Handle, desc: ^Buffer_Desc) {
    verify_ptr_and_handle(desc, buf_handle);
    be_state := &iState.backend.(State_D3D11);
    buf := lookup_d3d11_buffer(&be_state.pools, buf_handle);
    assert(buf != nil && buf.pool_slot.state == ResourceState.ALLOC);
    buf.pool_slot.ctx_handle = iState.active_context_handle;
    if validate_buffer_desc(desc) {
        buf.pool_slot.state = create_d3d11_buffer(buf, desc);
    } else {
        buf.pool_slot.state = ResourceState.FAILED;
    }
    assert(buf.pool_slot.state == ResourceState.VALID || buf.pool_slot.state == ResourceState.FAILED);
}

gfx_init_image :: proc (image_handle: Gfx_Image_Handle, desc: ^Image_Desc) {
    verify_ptr_and_handle(desc, image_handle);
    be_state := &iState.backend.(State_D3D11);
    img := lookup_d3d11_image(&be_state.pools, image_handle);
    assert(img != nil && img.pool_slot.state == ResourceState.ALLOC);
    img.pool_slot.ctx_handle = iState.active_context_handle;
    if validate_image_desc(desc) {
        img.pool_slot.state = create_d3d11_image(img, desc);
    } else {
        img.pool_slot.state = ResourceState.FAILED;
    }
    assert(img.pool_slot.state == ResourceState.VALID || img.pool_slot.state == ResourceState.FAILED);
}

gfx_init_shader :: proc (shd_handle: Gfx_Shader_Handle, desc: ^Shader_Desc) {
    verify_ptr_and_handle(desc, shd_handle);
    be_state := &iState.backend.(State_D3D11);
    shd := lookup_d3d11_shader(&be_state.pools, shd_handle);
    assert(shd != nil && shd.pool_slot.state == ResourceState.ALLOC);
    shd.pool_slot.ctx_handle = iState.active_context_handle;
    if validate_shader_desc(desc) {
        shd.pool_slot.state = create_d3d11_shader(shd, desc);
    } else {
        shd.pool_slot.state = ResourceState.FAILED;
    }
    assert(shd.pool_slot.state == ResourceState.VALID || shd.pool_slot.state == ResourceState.FAILED);
}

gfx_init_pipeline :: proc (pipe_handle: Gfx_Pipeline_Handle, desc: ^Pipeline_Desc) {
    verify_ptr_and_handle(desc, pipe_handle);
    be_state := &iState.backend.(State_D3D11);
    pipe := lookup_d3d11_pipeline(&be_state.pools, pipe_handle);
    assert(pipe != nil && pipe.pool_slot.state == ResourceState.ALLOC);
    pipe.pool_slot.ctx_handle = iState.active_context_handle;
    if validate_pipeline_desc(desc) {
        shd := lookup_d3d11_shader(&be_state.pools, desc.shader_handle);
        assert(shd != nil && shd.pool_slot.state == ResourceState.VALID);
        pipe.pool_slot.state = create_d3d11_pipeline(pipe, shd, desc);
    } else {
        pipe.pool_slot.state = ResourceState.FAILED;
    }
    assert(pipe.pool_slot.state == ResourceState.VALID || pipe.pool_slot.state == ResourceState.FAILED);
}

gfx_init_pass :: proc (pass_handle: Gfx_Pass_Handle, desc: ^Pass_Desc) {
    verify_ptr_and_handle(desc, pass_handle);
    be_state := &iState.backend.(State_D3D11);
    pass := lookup_d3d11_pass(&be_state.pools, pass_handle);
    assert(pass != nil && pass.pool_slot.state == ResourceState.ALLOC);
    pass.pool_slot.ctx_handle = iState.active_context_handle;
    if validate_pass_desc(desc) {
        att_imgs := make([]^Image_D3D11, MAX_COLOR_ATTACHMENTS + 1);
        for i := 0; i < MAX_COLOR_ATTACHMENTS; i +=1 {
            if desc.color_atts[i].image_handle != nil {
                att_imgs[i] = lookup_d3d11_image(&be_state.pools, desc.color_atts[i].image_handle);
                assert(att_imgs[i] != nil && att_imgs[i].pool_slot.state == ResourceState.VALID);
            } else {
                att_imgs[i] = nil;
            }
        }
        ds_att_index := MAX_COLOR_ATTACHMENTS;
        if desc.depth_stencil_att.image_handle != nil {
            att_imgs[ds_att_index] = lookup_d3d11_image(&be_state.pools, desc.depth_stencil_att.image_handle);
            assert(att_imgs[ds_att_index] != nil && att_imgs[ds_att_index].pool_slot.state == ResourceState.VALID);
        } else {
            att_imgs[ds_att_index] = nil;
        }
        pass.pool_slot.state = create_d3d11_pass(pass, att_imgs, desc);
    } else {
        pass.pool_slot.state = ResourceState.FAILED;
    }
    assert(pass.pool_slot.state == ResourceState.VALID || pass.pool_slot.state == ResourceState.FAILED);
}

gfx_fail_buffer :: proc (id: Gfx_Buffer_Handle) {
    assert(is_valid_handle(id));
    be_state := &iState.backend.(State_D3D11);
    buf := lookup_d3d11_buffer(&be_state.pools, id);
    assert(buf != nil && buf.pool_slot.state == ResourceState.ALLOC);
    buf.pool_slot.state = ResourceState.FAILED;
}

gfx_fail_image :: proc (id: Gfx_Image_Handle) {
    assert(is_valid_handle(id));
    be_state := &iState.backend.(State_D3D11);
    img := lookup_d3d11_image(&be_state.pools, id);
    assert(img != nil && img.pool_slot.state == ResourceState.ALLOC);
    img.pool_slot.state = ResourceState.ALLOC;
}

gfx_fail_shader :: proc (id: Gfx_Shader_Handle) {
    assert(is_valid_handle(id));
    be_state := &iState.backend.(State_D3D11);
    shd := lookup_d3d11_shader(&be_state.pools, id);
    assert(shd != nil && shd.pool_slot.state == ResourceState.ALLOC);
    shd.pool_slot.state = ResourceState.ALLOC;
}

gfx_fail_pipeline :: proc (id: Gfx_Pipeline_Handle) {
    assert(is_valid_handle(id));
    be_state := &iState.backend.(State_D3D11);
    pipe := lookup_d3d11_pipeline(&be_state.pools, id);
    assert(pipe != nil && pipe.pool_slot.state == ResourceState.ALLOC);
    pipe.pool_slot.state = ResourceState.ALLOC;
}

gfx_fail_pass :: proc (id: Gfx_Pass_Handle) {
    assert(is_valid_handle(id));
    be_state := &iState.backend.(State_D3D11);
    pass := lookup_d3d11_pass(&be_state.pools, id);
    assert(pass != nil && pass.pool_slot.state == ResourceState.ALLOC);
    pass.pool_slot.state = ResourceState.ALLOC;
}

gfx_query_buffer_state :: proc (id: Gfx_Buffer_Handle) -> ResourceState {
    be_state := &iState.backend.(State_D3D11);
    if is_valid_handle(id) {
        buf := lookup_d3d11_buffer(&be_state.pools, id);
        if buf != nil {
            return buf.pool_slot.state;
        }
    }
    return ResourceState.INVALID;
}

gfx_query_image_state :: proc (id: Gfx_Image_Handle) -> ResourceState {
    be_state := &iState.backend.(State_D3D11);
    if is_valid_handle(id) {
        img := lookup_d3d11_image(&be_state.pools, id);
        if img != nil {
            return img.pool_slot.state;
        }
    }
    return ResourceState.INVALID;
}

gfx_query_shader_state :: proc (id: Gfx_Shader_Handle) -> ResourceState {
    be_state := &iState.backend.(State_D3D11);
    if is_valid_handle(id) {
        shd := lookup_d3d11_shader(&be_state.pools, id);
        if shd != nil {
            return shd.pool_slot.state;
        }
    }
    return ResourceState.INVALID;
}

gfx_query_pipeline_state :: proc (id: Gfx_Pipeline_Handle) -> ResourceState {
    be_state := &iState.backend.(State_D3D11);
    if is_valid_handle(id) {
        pipe := lookup_d3d11_pipeline(&be_state.pools, id);
        if pipe != nil {
            return pipe.pool_slot.state;
        }
    }
    return ResourceState.INVALID;
}

gfx_query_pass_state :: proc (id: Gfx_Pass_Handle) -> ResourceState {
    be_state := &iState.backend.(State_D3D11);
    if is_valid_handle(id) {
        pass := lookup_d3d11_pass(&be_state.pools, id);
        if pass != nil {
            return pass.pool_slot.state;
        }
    }
    return ResourceState.INVALID;
}

gfx_make_buffer :: proc (desc: ^Buffer_Desc) -> Gfx_Buffer_Handle {
    assert(desc != nil);
    id := gfx_alloc_buffer();
    if is_valid_handle(id) {
        gfx_init_buffer(id, desc);
    } else {
        fmt.println("[ERROR]: Unable to make buffer.");    
    }
    return id;
}

gfx_make_image :: proc (desc: ^Image_Desc) -> Gfx_Image_Handle {
    assert(desc != nil);
    id := gfx_alloc_image();
    if is_valid_handle(id) {
        gfx_init_image(id, desc);
    } else {
        //log stuff
    }
    return id;
}

gfx_make_shader :: proc (desc: ^Shader_Desc) -> Gfx_Shader_Handle {
    assert(desc != nil);
    id := gfx_alloc_shader();
    if is_valid_handle(id) {
        gfx_init_shader(id, desc);
    } else {
        //log stuff
    }
    return id;
}

gfx_make_pipeline :: proc (desc: ^Pipeline_Desc) -> Gfx_Pipeline_Handle {
    assert(desc != nil);
    id := gfx_alloc_pipeline();
    if is_valid_handle(id) {
        gfx_init_pipeline(id, desc);
    } else {
        //log stuff
    }
    return id;
}

gfx_make_pass :: proc (desc: ^Pass_Desc) -> Gfx_Pass_Handle {
    assert(desc != nil);
    id := gfx_alloc_pass();
    if is_valid_handle(id) {
        gfx_init_pass(id, desc);
    } else {
        //log stuff
    }
    return id;
}

gfx_destroy_buffer :: proc (id: Gfx_Buffer_Handle) {
    be_state := &iState.backend.(State_D3D11);
    buf := lookup_d3d11_buffer(&be_state.pools, id);
    if buf != nil {
        if buf.pool_slot.ctx_handle == iState.active_context_handle {
            destroy_d3d11_buffer(buf);
            pool_free_handle(&be_state.pools.buffer_pool, id);
        } else {
            //log stuff
        }
    }
}

gfx_destroy_image :: proc (id: Gfx_Image_Handle) {
    be_state := &iState.backend.(State_D3D11);
    img := lookup_d3d11_image(&be_state.pools, id);
    if img != nil {
        if img.pool_slot.ctx_handle == iState.active_context_handle {
            destroy_d3d11_image(img);
            pool_free_handle(&be_state.pools.image_pool, id);
        } else {
            //log stuff
        }
    }
}

gfx_destroy_shader :: proc (id: Gfx_Shader_Handle) {
    be_state := &iState.backend.(State_D3D11);
    shd := lookup_d3d11_shader(&be_state.pools, id);
    if shd != nil {
        if shd.pool_slot.ctx_handle == iState.active_context_handle {
            destroy_d3d11_shader(shd);
            pool_free_handle(&be_state.pools.shader_pool, id);
        } else {
            //log stuff
        }
    }
}

gfx_destroy_pipeline :: proc (id: Gfx_Pipeline_Handle) {
    be_state := &iState.backend.(State_D3D11);
    pipe := lookup_d3d11_pipeline(&be_state.pools, id);
    if pipe != nil {
        if pipe.pool_slot.ctx_handle == iState.active_context_handle {
            destroy_d3d11_pipeline(pipe);
            pool_free_handle(&be_state.pools.pipeline_pool, id);
        } else {
            //log stuff
        }
    }
}

gfx_destroy_pass :: proc (id: Gfx_Pass_Handle) {
    be_state := &iState.backend.(State_D3D11);
    pass := lookup_d3d11_pass(&be_state.pools, id);
    if pass != nil {
        if pass.pool_slot.ctx_handle == iState.active_context_handle {
            destory_d3d11_pass(pass);
            pool_free_handle(&be_state.pools.pass_pool, id);
        } else {
            //log stuff
        }
    }
}

gfx_begin_default_pass :: proc (pass_action: ^Pass_Action, width, height: int) {
    assert(pass_action != nil);
    real_pa: Pass_Action;
    resolve_default_pass_action(pass_action, &real_pa);
    iState.curr_pass_handle = nil;
    iState.is_pass_valid = true;
    begin_d3d11_pass(nil, &real_pa, width, height);
}

gfx_begin_pass :: proc (id: Gfx_Pass_Handle, pass_action: ^Pass_Action) {
    assert(pass_action != nil);
    iState.curr_pass_handle = id;
    be_state := &iState.backend.(State_D3D11);
    pass := lookup_d3d11_pass(&be_state.pools, id);
    if pass != nil && validate_begin_pass(pass) {
        iState.is_pass_valid = true;
        pa: Pass_Action;
        resolve_default_pass_action(pass_action, &pa);
        w := pass.color_atts[0].image.width;
        h := pass.color_atts[0].image.height;
        begin_d3d11_pass(pass, &pa, w, h);
    } else {
        iState.is_pass_valid = false;
    }
}

gfx_apply_viewport :: proc (x, y, width, height: int, is_origin_top_left: bool) {
    if !iState.is_pass_valid do return;
    assert(x < int(max(i32)));
    assert(y < int(max(i32)));
    assert(width < int(max(i32)));
    assert(height < int(max(i32)));
    apply_d3d11_viewport(i32(x), i32(y), i32(width), i32(height), is_origin_top_left);
}

gfx_apply_scissor_rect :: proc (x, y, width, height: int, is_origin_top_left: bool) {
    if !iState.is_pass_valid do return;
}

gfx_apply_pipeline :: proc (id: Gfx_Pipeline_Handle) {
    iState.are_bindings_valid = false;
    if !validate_apply_pipeline(id) {
        iState.is_next_draw_valid = false;
        return;
    }
    if !iState.is_pass_valid do return;
    be_state := &iState.backend.(State_D3D11);
    iState.curr_pipeline_handle = id;
    pipe := lookup_d3d11_pipeline(&be_state.pools, id);
    assert(pipe != nil);
    iState.is_next_draw_valid = ResourceState.VALID == pipe.pool_slot.state;
    assert(pipe.shader != nil && pipe.shader.pool_slot.handle == pipe.shader_handle);
    apply_d3d11_pipeline(pipe);
}

gfx_apply_bindings :: proc (bind: ^Bindings) {
    assert(bind != nil);
    if !validate_apply_bindings(bind) {
        iState.is_next_draw_valid = false;
        return;
    }
    be_state := &iState.backend.(State_D3D11);
    iState.are_bindings_valid = true;
    pipe := lookup_d3d11_pipeline(&be_state.pools, iState.curr_pipeline_handle);
    assert(pipe != nil);

    vbs: [MAX_SHADERSTAGE_BUFFERS]^Buffer_D3D11;
    num_vbs := 0;
    for i := 0; i < MAX_SHADERSTAGE_BUFFERS; i +=1 {
        if is_valid_handle(bind.vertex_buffer_handles[i]) {
            vbs[i] = lookup_d3d11_buffer(&be_state.pools, bind.vertex_buffer_handles[i]);
            assert(vbs[i] != nil);
            iState.is_next_draw_valid &= ResourceState.VALID == vbs[i].pool_slot.state;
            iState.is_next_draw_valid &= !(vbs[i].has_append_overflow);
            num_vbs += 1;
        } else {
            break;
        }
    }

    ib: ^Buffer_D3D11 = nil;
    if is_valid_handle(bind.index_buffer_handle) {
        ib = lookup_d3d11_buffer(&be_state.pools, bind.index_buffer_handle);
        assert(ib != nil);
        iState.is_next_draw_valid &= ResourceState.VALID == ib.pool_slot.state;
        iState.is_next_draw_valid &= !ib.has_append_overflow;
    }

    vs_imgs: [MAX_SHADERSTAGE_IMAGES]^Image_D3D11;
    num_vs_imgs := 0;
    for i := 0; i < MAX_SHADERSTAGE_IMAGES; i +=1 {
        if is_valid_handle(bind.vs_image_handles[i]) {
            vs_imgs[i] = lookup_d3d11_image(&be_state.pools, bind.vs_image_handles[i]);
            assert(vs_imgs[i] != nil);
            iState.is_next_draw_valid &= ResourceState.VALID == vs_imgs[i].pool_slot.state;
            num_vs_imgs += 1;
        } else {
            break;
        }
    }
    fs_imgs: [MAX_SHADERSTAGE_IMAGES]^Image_D3D11;
    num_fs_imgs := 0;
    for i := 0; i < MAX_SHADERSTAGE_IMAGES; i +=1 {
        if is_valid_handle(bind.fs_image_handles[i]) {
            fs_imgs[i] = lookup_d3d11_image(&be_state.pools, bind.fs_image_handles[i]);
            assert(fs_imgs[i] != nil);
            iState.is_next_draw_valid &= ResourceState.VALID == fs_imgs[i].pool_slot.state;
            num_fs_imgs += 1;
        } else {
            break;
        }
    }
    if iState.is_next_draw_valid {
        vb_offsets := bind.vertex_buffer_offsets;
        ib_offset := bind.index_buffer_offset;
        apply_d3d11_bindings(pipe, vbs[:num_vbs], vb_offsets[:num_vbs], ib, ib_offset, vs_imgs[:num_vs_imgs], fs_imgs[:num_fs_imgs]);
    }
}

gfx_apply_uniforms :: proc (stage: ShaderStage, ub_index: int, data: rawptr, num_bytes: int) {
    assert(stage == ShaderStage.VERTEX || stage == ShaderStage.FRAGMENT);
    assert(ub_index >= 0 && ub_index < MAX_SHADERSTAGE_UBS);
    assert(data != nil && num_bytes > 0);
    if !validate_apply_uniforms(stage, ub_index, data, num_bytes) {
        iState.is_next_draw_valid = false;
        return;
    }
    if !(iState.is_pass_valid && iState.is_next_draw_valid) do return;
    apply_d3d11_uniforms(stage, ub_index, data, num_bytes);
}

gfx_draw :: proc (base_element, num_elements, num_instances: int) {
    if !(iState.is_pass_valid && iState.are_bindings_valid && iState.is_next_draw_valid) do return;
    
    assert(base_element < int(max(u32)));
    assert(num_elements < int(max(u32)));
    assert(num_instances < int(max(u32)));
    draw_d3d11(u32(base_element), u32(num_elements), u32(num_instances));
}

gfx_end_pass :: proc() {
    if !iState.is_pass_valid do return;
    end_d3d11_pass();
    iState.curr_pass_handle = nil;
    iState.curr_pipeline_handle = nil;
    iState.is_pass_valid = false;
}

gfx_commit :: proc() {
    commit_d3d11();
    iState.frame_index += 1;
}

gfx_reset_state_cache :: proc() {
    reset_state_cache();
}

gfx_update_buffer :: proc (id: Gfx_Buffer_Handle, data: rawptr, num_bytes: int) {
    if num_bytes == 0 do return;

    be_state := &iState.backend.(State_D3D11);
    buf := lookup_d3d11_buffer(&be_state.pools, id);
    if !(buf != nil && buf.pool_slot.state == ResourceState.VALID) do return;

    if validate_update_buffer(buf, data, num_bytes) {
        assert(num_bytes <= buf.size);
        assert(buf.update_frame_index != iState.frame_index);
        assert(buf.append_frame_index != iState.frame_index);
        update_d3d11_buffer(buf, data, num_bytes);
        buf.update_frame_index = iState.frame_index;
    }
}

gfx_append_buffer :: proc (id: Gfx_Buffer_Handle, data: rawptr, num_bytes: int) -> int {
    be_state := &iState.backend.(State_D3D11);
    buf := lookup_d3d11_buffer(&be_state.pools, id);
    if buf != nil {
        if buf.append_frame_index != iState.frame_index {
            buf.append_pos = 0;
            buf.has_append_overflow = false;
        }
        if buf.append_pos + num_bytes > buf.size {
            buf.has_append_overflow = true;
        }
        start_pos := buf.append_pos;
        if buf.pool_slot.state == ResourceState.VALID {
            if validate_append_buffer(buf, data, num_bytes) {
                if !buf.has_append_overflow && num_bytes > 0 {
                    assert(buf.update_frame_index != iState.frame_index);
                    append_d3d11_buffer(buf, data, num_bytes, buf.append_frame_index != iState.frame_index);
                    buf.append_pos += num_bytes;
                    buf.append_frame_index = iState.frame_index;
                }
            }
        }
        return start_pos;
    } else {
        return 0;
    }
}

gfx_update_image :: proc (id: Gfx_Image_Handle, data: ^Image_Content) {
    be_state := &iState.backend.(State_D3D11);
    img := lookup_d3d11_image(&be_state.pools, id);
    if !(img != nil && img.pool_slot.state == ResourceState.VALID) {
        return;
    }
    if validate_update_image(img, data) {
        assert(img.update_frame_index != iState.frame_index);
        update_d3d11_image(img, data);
        img.update_frame_index = iState.frame_index;
    }
}

validate :: proc (cond: bool, err: ValidationError) {
    if !cond do fmt.println(validation_error(err));
}

validate_buffer_desc :: proc (desc: ^Buffer_Desc) -> bool {
    using ValidationError;
    validate(desc.size > 0, BUFFERDESC_SIZE);
    ext := (desc.d3d11_buffer != nil);
    if !ext && def(desc.usage, Usage.IMMUTABLE) == Usage.IMMUTABLE {
        validate(desc.content != nil, BUFFERDESC_CONTENT);
    } else {
        validate(desc.content == nil, BUFFERDESC_NO_CONTENT);
    }

    return true;
}

validate_image_desc :: proc (desc: ^Image_Desc) -> bool {
    using ValidationError;
    assert(desc != nil);
    validate(desc.width > 0, IMAGEDESC_WIDTH);
    validate(desc.height > 0, IMAGEDESC_HEIGHT);
    fmt := def(desc.pixel_format, PixelFormat.RGBA8);
    usage := def(desc.usage, Usage.IMMUTABLE);
    ext := (desc.backend_textures.d3d11 != nil);
    if desc.is_render_target {
        if desc.sample_count > 1 {
            validate(gfx_query_feature(Features.MSAA_RENDER_TARGETS), IMAGEDESC_NO_MSAA_RT_SUPPORT);
        }
        valid_color := is_valid_rendertarget_color_format(fmt);
        valid_depth := is_valid_rendertarget_depth_format(fmt);
        validate(valid_color || valid_depth, IMAGEDESC_RT_PIXELFORMAT);
        validate(usage == Usage.IMMUTABLE, IMAGEDESC_RT_IMMUTABLE);
        validate(desc.content.sub_images[0][0].ptr == nil, IMAGEDESC_RT_NO_CONTENT);
    } else {
        validate(desc.sample_count <= 1, IMAGEDESC_MSAA_BUT_NO_RT);
        valid_nonrt_fmt := !is_valid_rendertarget_depth_format(fmt);
        validate(valid_nonrt_fmt, IMAGEDESC_NONRT_PIXELFORMAT);

    }
    return true;
}

validate_shader_desc :: proc(desc: ^Shader_Desc) -> bool {
    assert(desc != nil);

    using ValidationError;
    validate(len(desc.vert_shader.src_text) > 0 || len(desc.vert_shader.byte_code) > 0, SHADERDESC_SOURCE_OR_BYTECODE);
    validate(len(desc.frag_shader.src_text) > 0 || len(desc.frag_shader.byte_code) > 0, SHADERDESC_SOURCE_OR_BYTECODE);
    for stage_index := 0; stage_index < NUM_SHADER_STAGES; stage_index += 1 {
        stage_desc := (stage_index == 0) ? &desc.vert_shader : &desc.frag_shader;
        uniform_blocks_cont := true;
        for ub_index := 0; ub_index < MAX_SHADERSTAGE_UBS; ub_index += 1 {
            ub_desc := &stage_desc.uniform_blocks[ub_index];
            if ub_desc.size > 0 {
                validate(uniform_blocks_cont, SHADERDESC_NO_CONT_UBS);
                uniforms_cont := true;
                uniform_offset := 0;
                num_uniforms := 0;
                for u_index := 0; u_index < MAX_UB_MEMBERS; u_index += 1 {
                    u_desc := &ub_desc.uniforms[u_index];
                    if u_desc.type != UniformType.INVALID {
                        validate(uniforms_cont, SHADERDESC_NO_CONT_UB_MEMBERS);
                        array_count := def(u_desc.array_count, 1);
                        uniform_offset += get_uniform_type_width(u_desc.type, array_count);
                        num_uniforms += 1;
                    } else {
                        uniforms_cont = false;
                    }
                }
            } else {
                uniform_blocks_cont = false;
            }
        }
        images_cont := true;
        for img_index := 0; img_index < MAX_SHADERSTAGE_IMAGES; img_index += 1 {
            img_desc := &stage_desc.images[img_index];
            if img_desc.type != ImageType._DEFAULT {
                validate(images_cont, SHADERDESC_NO_CONT_IMGS);
            } else {
                images_cont = false;
            }
        }
    }
    return true;
}

validate_pipeline_desc :: proc(desc: ^Pipeline_Desc) -> bool {
    assert(desc != nil);

    using ValidationError;
    validate(is_valid_handle(desc.shader_handle), PIPELINEDESC_SHADER);
    be_state := &iState.backend.(State_D3D11);
    shd := lookup_d3d11_shader(&be_state.pools, desc.shader_handle);
    validate(shd != nil && shd.pool_slot.state == ResourceState.VALID, PIPELINEDESC_SHADER);
    for buf_index := 0; buf_index < MAX_SHADERSTAGE_BUFFERS; buf_index += 1 {
        l_desc := &desc.layout.buffers[buf_index];
        if l_desc.stride == 0 {
            continue;
        }
        validate((l_desc.stride & 3) == 0, PIPELINEDESC_LAYOUT_STRIDE4);
    }
    validate(desc.layout.attrs[0].format != VertexFormat.INVALID, PIPELINEDESC_NO_ATTRS);
    attrs_cont := true;
    for attr_index := 0; attr_index < MAX_VERTEX_ATTTRIBUTES; attr_index += 1 {
        a_desc := &desc.layout.attrs[attr_index];
        if a_desc.format == VertexFormat.INVALID {
            attrs_cont = false;
            continue;
        }
        validate(attrs_cont, PIPELINEDESC_NO_ATTRS);
        assert(a_desc.buffer_index < MAX_SHADERSTAGE_BUFFERS);
        validate(len(a_desc.semantic_name) > 0, PIPELINEDESC_ATTR_SEMANTICS);
    }

    return true;
}

validate_pass_desc :: proc(desc: ^Pass_Desc) -> bool {
    assert(desc != nil);
    atts_cont := true;
    color_fmt := PixelFormat.NONE;
    width, height, sample_count := -1, -1, -1;
    be_state := &iState.backend.(State_D3D11);
    using ValidationError;
    for att_index := 0; att_index < MAX_COLOR_ATTACHMENTS; att_index += 1 {
        att := &desc.color_atts[att_index];
        if !is_valid_handle(att.image_handle) {
            validate(att_index > 0, PASSDESC_NO_COLOR_ATTS);
            atts_cont = false;
            continue;
        }
        validate(atts_cont, PASSDESC_NO_CONT_COLOR_ATTS);
        img := lookup_d3d11_image(&be_state.pools, att.image_handle);
        validate(img != nil && img.pool_slot.state == ResourceState.VALID, PASSDESC_IMAGE);
        validate(att.num_mip_levels < img.num_mipmaps, PASSDESC_MIPLEVEL);
        if img.type == ImageType.CUBE {
            validate(att.face < 6, PASSDESC_FACE);
        } else if img.type == ImageType.ARRAY {
            validate(att.layer < img.depth, PASSDESC_LAYER);
        } else if img.type == ImageType.DEPTH_3D {
            validate(att.slice < img.depth, PASSDESC_SLICE);
        }
        validate(img.is_render_target == true, PASSDESC_IMAGE_NO_RT);
        if att_index == 0 {
            color_fmt = img.pixel_format;
            width = img.width >> uint(att.num_mip_levels);
            height = img.height >> uint(att.num_mip_levels);
            sample_count = img.sample_count;
        } else {
            validate(img.pixel_format == color_fmt, PASSDESC_COLOR_PIXELFORMATS);
            validate(width == img.width >> uint(att.num_mip_levels), PASSDESC_IMAGE_SIZES);
            validate(height == img.height >> uint(att.num_mip_levels), PASSDESC_IMAGE_SIZES);
            validate(sample_count == img.sample_count, PASSDESC_IMAGE_SAMPLE_COUNTS);
        }
        validate(is_valid_rendertarget_color_format(img.pixel_format), PASSDESC_COLOR_INV_PIXELFORMAT);
    }
    if is_valid_handle(desc.depth_stencil_att.image_handle) {
        att := &desc.depth_stencil_att;
        img := lookup_d3d11_image(&be_state.pools, att.image_handle);
        validate(img != nil && img.pool_slot.state == ResourceState.VALID, PASSDESC_IMAGE);
        validate(att.num_mip_levels < img.num_mipmaps, PASSDESC_MIPLEVEL);
         if img.type == ImageType.CUBE {
            validate(att.face < 6, PASSDESC_FACE);
        } else if img.type == ImageType.ARRAY {
            validate(att.layer < img.depth, PASSDESC_LAYER);
        } else if img.type == ImageType.DEPTH_3D {
            validate(att.slice < img.depth, PASSDESC_SLICE);
        }
        validate(img.is_render_target == true, PASSDESC_IMAGE_NO_RT);
        validate(width == img.width >> uint(att.num_mip_levels), PASSDESC_IMAGE_SIZES);
        validate(height == img.height >> uint(att.num_mip_levels), PASSDESC_IMAGE_SIZES);
        validate(sample_count == img.sample_count, PASSDESC_IMAGE_SAMPLE_COUNTS);
        validate(is_valid_rendertarget_depth_format(img.pixel_format), PASSDESC_DEPTH_INV_PIXELFORMAT);
    }
    return true;
}

validate_begin_pass :: proc (pass: ^Pass_D3D11) -> bool {
    using ValidationError;
    validate(pass.pool_slot.state == ResourceState.VALID, BEGINPASS_PASS);
    for i := 0; i < MAX_COLOR_ATTACHMENTS; i += 1 {
        att := &pass.color_atts[i];
        if att.image != nil {
            validate(att.image.pool_slot.state == ResourceState.VALID, BEGINPASS_IMAGE);
            validate(att.image.pool_slot.handle == att.image_handle, BEGINPASS_IMAGE);
        }
    }
    if pass.depth_stencil_att.image != nil {
        att := &pass.depth_stencil_att;
        validate(att.image.pool_slot.state == ResourceState.VALID, BEGINPASS_IMAGE);
        validate(att.image.pool_slot.handle == att.image_handle, BEGINPASS_IMAGE);
    }

    return true;
}

validate_apply_pipeline :: proc (pipe_hndl: Gfx_Pipeline_Handle) -> bool {
    using ValidationError;
    be_state := &iState.backend.(State_D3D11);
    validate(is_valid_handle(pipe_hndl), APIP_PIPELINE_VALID_ID);
    pipe := lookup_d3d11_pipeline(&be_state.pools, pipe_hndl);
    validate(pipe != nil, APIP_PIPELINE_EXISTS);
    if pipe == nil do return false;
    validate(pipe.pool_slot.state == ResourceState.VALID, APIP_PIPELINE_VALID);
    assert(pipe.shader != nil);
    validate(pipe.shader.pool_slot.handle == pipe.shader_handle, APIP_SHADER_EXISTS);
    validate(pipe.shader.pool_slot.state == ResourceState.VALID, APIP_SHADER_VALID);
    pass := lookup_d3d11_pass(&be_state.pools, iState.curr_pass_handle);
    if pass != nil {
        validate(pipe.color_attachment_count == pass.num_color_atts, APIP_ATT_COUNT);
        validate(pipe.color_format == pass.color_atts[0].image.pixel_format, APIP_COLOR_FORMAT);
        validate(pipe.sample_count == pass.color_atts[0].image.sample_count, APIP_SAMPLE_COUNT);
        if pass.depth_stencil_att.image != nil {
            validate(pipe.depth_format == pass.depth_stencil_att.image.pixel_format, APIP_DEPTH_FORMAT);
        } else {
            validate(pipe.depth_format == PixelFormat.NONE, APIP_DEPTH_FORMAT);
        }
    } else {
        validate(pipe.color_attachment_count == 1, APIP_ATT_COUNT);
        validate(pipe.color_format == PixelFormat.RGBA8, APIP_COLOR_FORMAT);
        validate(pipe.depth_format == PixelFormat.DEPTH_STENCIL, APIP_DEPTH_FORMAT);
    }

    return true;
}

validate_apply_bindings :: proc (bind: ^Bindings) -> bool {
    using ValidationError;
    validate(is_valid_handle(iState.curr_pipeline_handle), ABND_PIPELINE);
    be_state := &iState.backend.(State_D3D11);
    pipe := lookup_d3d11_pipeline(&be_state.pools, iState.curr_pipeline_handle);
    validate(pipe != nil, ABND_PIPELINE_EXISTS);
    if pipe == nil do return false;

    validate(pipe.pool_slot.state == ResourceState.VALID, ABND_PIPELINE_VALID);
    assert(pipe.shader != nil);
    for i := 0; i < MAX_SHADERSTAGE_BUFFERS; i +=1 {
        if is_valid_handle(bind.vertex_buffer_handles[i]) {
            validate(pipe.is_vertex_layout_valid[i] == true, ABND_VBS);
            buf := lookup_d3d11_buffer(&be_state.pools, bind.vertex_buffer_handles[i]);
            assert(buf != nil);
            if buf.pool_slot.state == ResourceState.VALID {
                validate(BufferType.VERTEX_BUFFER == buf.type, ABND_VB_TYPE);
                validate(buf.has_append_overflow == false, ABND_VB_OVERFLOW);
            }
        } else {
            validate(pipe.is_vertex_layout_valid[i] == false, ABND_VBS);
        }
    }
    if pipe.index_type == IndexSizeType.NONE {
        validate(!is_valid_handle(bind.index_buffer_handle), ABND_IB);
    } else {
        validate(is_valid_handle(bind.index_buffer_handle), ABND_NO_IB);
    }
    if is_valid_handle(bind.index_buffer_handle) {
        buf := lookup_d3d11_buffer(&be_state.pools, bind.index_buffer_handle);
        assert(buf != nil);
        if buf.pool_slot.state == ResourceState.VALID {
            validate(BufferType.INDEX_BUFFER == buf.type, ABND_IB_TYPE);
            validate(buf.has_append_overflow == false, ABND_IB_OVERFLOW);
        }
    }

    for i := 0; i < MAX_SHADERSTAGE_IMAGES; i +=1 {
        using ValidationError;
        be_state := &iState.backend.(State_D3D11);
        stage := &pipe.shader.stages[uint(ShaderStage.VERTEX)];
        if is_valid_handle(bind.vs_image_handles[i]) {
            validate(i < stage.num_images, ABND_VS_IMGS);
            img := lookup_d3d11_image(&be_state.pools, bind.vs_image_handles[i]);
            assert(img != nil);
            if img.pool_slot.state == ResourceState.VALID {
                validate(img.type == stage.images[i].type, ABND_VS_IMG_TYPES);
            }
        } else {
            validate(i >= stage.num_images, ABND_VS_IMGS);
        }
    }
    for i := 0; i <MAX_SHADERSTAGE_IMAGES; i +=1 {
        stage := &pipe.shader.stages[uint(ShaderStage.FRAGMENT)];
        if is_valid_handle(bind.fs_image_handles[i]) {
            validate(i < stage.num_images, ABND_FS_IMGS);
            img := lookup_d3d11_image(&be_state.pools, bind.fs_image_handles[i]);
            assert(img != nil);
            if img.pool_slot.state == ResourceState.VALID {
                validate(img.type == stage.images[i].type, ABND_FS_IMG_TYPES);
            }
        } else {
            validate(i >= stage.num_images, ABND_FS_IMGS);
        }
    }

    return true;
}

validate_apply_uniforms :: proc (stage_index: ShaderStage, ub_index: int, data: rawptr, num_bytes: int) -> bool {
    using ValidationError;
    be_state := &iState.backend.(State_D3D11);
    assert(stage_index == ShaderStage.VERTEX || stage_index == ShaderStage.FRAGMENT);
    assert(ub_index >= 0 && ub_index < MAX_SHADERSTAGE_UBS);
    validate(is_valid_handle(iState.curr_pipeline_handle), AUB_NO_PIPELINE);
    pipe := lookup_d3d11_pipeline(&be_state.pools, iState.curr_pipeline_handle);
    assert(pipe != nil && pipe.pool_slot.handle == iState.curr_pipeline_handle);
    assert(pipe.shader != nil && pipe.shader.pool_slot.handle == pipe.shader_handle);
    stage := &pipe.shader.stages[stage_index];
    validate(ub_index < stage.num_uniform_blocks, AUB_NO_UB_AT_SLOT);
    validate(num_bytes <= stage.uniform_blocks[ub_index].size, AUB_SIZE);

    return true;
}

validate_update_buffer :: proc (buf: ^Buffer_D3D11, data: rawptr, size: int) -> bool {
    using ValidationError;
    assert(buf != nil && data != nil);
    validate(buf.usage != Usage.IMMUTABLE, UPDATEBUF_USAGE);
    validate(buf.size >= size, UPDATEBUF_SIZE);
    validate(buf.update_frame_index != iState.frame_index, UPDATEBUF_ONCE);
    validate(buf.append_frame_index != iState.frame_index, UPDATEBUF_APPEND);

    return true;
}

validate_append_buffer :: proc (buf: ^Buffer_D3D11, data: rawptr, size: int) -> bool {
    using ValidationError;
    assert(buf != nil && data != nil);
    validate(buf.usage != Usage.IMMUTABLE, APPENDBUF_USAGE);
    validate(buf.size >= (buf.append_pos+size), APPENDBUF_SIZE);
    validate(buf.update_frame_index != iState.frame_index, APPENDBUF_UPDATE);

    return true;
}

validate_update_image :: proc (img: ^Image_D3D11, cont: ^Image_Content) -> bool {
    using ValidationError;
    assert(img != nil && cont != nil);
    validate(img.usage != Usage.IMMUTABLE, UPDIMG_USAGE);
    validate(img.update_frame_index != iState.frame_index, UPDIMG_ONCE);
    validate(!is_compressed_pixel_format(img.pixel_format), UPDIMG_COMPRESSED);
    num_faces: uint = (img.type == ImageType.CUBE) ? 6 : 1;
    num_mips := uint(img.num_mipmaps);
    for face_index: uint = 0; face_index < num_faces; face_index += 1 {
        for mip_index: uint = 0; mip_index < num_mips; mip_index += 1 {
            validate(cont.sub_images[face_index][mip_index].ptr != nil, UPDIMG_NOTENOUGHDATA);
            mip_width := max(img.width >> mip_index, 1);
            mip_height := max(img.height >> mip_index, 1);
            bytes_per_slice := get_surface_pitch(img.pixel_format, mip_width, mip_height);
            expk_size := bytes_per_slice * img.depth;
            validate(cont.sub_images[face_index][mip_index].size <= expk_size, UPDIMG_SIZE);
        }
    }

    return true;
}

validation_error :: proc (err: ValidationError) -> string {
    using ValidationError;
    switch(err) {
        case BUFFERDESC_SIZE:                               return "Buffer_Desc.size cannot be 0";
        case BUFFERDESC_CONTENT:                            return "immutable buffers must be initialized with content (Buffer_Desc.content)";
        case BUFFERDESC_NO_CONTENT:                         return "dynamic/stream usage buffers cannot be initialized with content";

        case IMAGEDESC_WIDTH:                               return "Image_Desc.width must be > 0";
        case IMAGEDESC_HEIGHT:                              return "Image_Desc.height must be > 0";
        case IMAGEDESC_RT_PIXELFORMAT:                      return "invalid pixel format for render-target image";
        case IMAGEDESC_NONRT_PIXELFORMAT:                   return "invalid pixel format for non-render-target image";
        case IMAGEDESC_MSAA_BUT_NO_RT:                      return "non-render-target images cannot be multisampled";
        case IMAGEDESC_NO_MSAA_RT_SUPPORT:                  return "MSAA render targets not supported (Feature.MSAA_RENDER_TARGETS)";
        case IMAGEDESC_RT_IMMUTABLE:                        return "render target images must be Usage.IMMUTABLE";
        case IMAGEDESC_RT_NO_CONTENT:                       return "render target images cannot be initialized with content";
        case IMAGEDESC_CONTENT:                             return "missing or invalid content for immutable image";
        case IMAGEDESC_NO_CONTENT:                          return "dynamic/stream usage images cannot be initialized with content";

        /* shader creation */
        case SHADERDESC_SOURCE:                             return "shader source code required";
        case SHADERDESC_BYTECODE:                           return "shader byte code required";
        case SHADERDESC_SOURCE_OR_BYTECODE:                 return "shader source or byte code required";
        case SHADERDESC_NO_CONT_UBS:                        return "shader uniform blocks must occupy continuous slots";
        case SHADERDESC_NO_CONT_UB_MEMBERS:                 return "uniform block members must occupy continuous slots";
        case SHADERDESC_NO_UB_MEMBERS:                      return "GL backend requires uniform block member declarations";
        case SHADERDESC_UB_MEMBER_NAME:                     return "uniform block member name missing";
        case SHADERDESC_UB_SIZE_MISMATCH:                   return "size of uniform block members doesn't match uniform block size";
        case SHADERDESC_NO_CONT_IMGS:                       return "shader images must occupy continuous slots";
        case SHADERDESC_IMG_NAME:                           return "GL backend requires uniform block member names";

        /* pipeline creation */
        case PIPELINEDESC_SHADER:                           return "Pipeline_Desc.shader missing or invalid";
        case PIPELINEDESC_NO_ATTRS:                         return "Pipeline_Desc.layout.attrs is empty or not continuous";
        case PIPELINEDESC_LAYOUT_STRIDE4:                   return "Pipeline_Desc.layout.buffers[].stride must be multiple of 4";
        case PIPELINEDESC_ATTR_NAME:                        return "GLES2/WebGL vertex layouts must have attribute names";
        case PIPELINEDESC_ATTR_SEMANTICS:                   return "D3D11 vertex layouts must have attribute semantics (sem_name and sem_index)";

        /* pass creation */
        case PASSDESC_NO_COLOR_ATTS:                        return "Pass_Desc.color_attachments[0] must be valid";
        case PASSDESC_NO_CONT_COLOR_ATTS:                   return "color attachments must occupy continuous slots";
        case PASSDESC_IMAGE:                                return "pass attachment image is not valid";
        case PASSDESC_MIPLEVEL:                             return "pass attachment mip level is bigger than image has mipmaps";
        case PASSDESC_FACE:                                 return "pass attachment image is cubemap, but face index is too big";
        case PASSDESC_LAYER:                                return "pass attachment image is array texture, but layer index is too big";
        case PASSDESC_SLICE:                                return "pass attachment image is 3d texture, but slice value is too big";
        case PASSDESC_IMAGE_NO_RT:                          return "pass attachment image must be render targets";
        case PASSDESC_COLOR_PIXELFORMATS:                   return "all pass color attachment images must have the same pixel format";
        case PASSDESC_COLOR_INV_PIXELFORMAT:                return "pass color-attachment images must have a renderable pixel format";
        case PASSDESC_DEPTH_INV_PIXELFORMAT:                return "pass depth-attachment image must have depth pixel format";
        case PASSDESC_IMAGE_SIZES:                          return "all pass attachments must have the same size";
        case PASSDESC_IMAGE_SAMPLE_COUNTS:                  return "all pass attachments must have the same sample count";

        /* sg_begin_pass */
        case BEGINPASS_PASS:                                return "begin_pass: pass must be valid";
        case BEGINPASS_IMAGE:                               return "begin_pass: one or more attachment images are not valid";

        /* sg_apply_pipeline */
        case APIP_PIPELINE_VALID_ID:                        return "gfx_apply_pipeline: invalid pipeline id provided";
        case APIP_PIPELINE_EXISTS:                          return "gfx_apply_pipeline: pipeline object no longer alive";
        case APIP_PIPELINE_VALID:                           return "gfx_apply_pipeline: pipeline object not in valid state";
        case APIP_SHADER_EXISTS:                            return "gfx_apply_pipeline: shader object no longer alive";
        case APIP_SHADER_VALID:                             return "gfx_apply_pipeline: shader object not in valid state";
        case APIP_ATT_COUNT:                                return "gfx_apply_pipeline: color_attachment_count in pipeline doesn't match number of pass color attachments";
        case APIP_COLOR_FORMAT:                             return "gfx_apply_pipeline: color_format in pipeline doesn't match pass color attachment pixel format";
        case APIP_DEPTH_FORMAT:                             return "gfx_apply_pipeline: depth_format in pipeline doesn't match pass depth attachment pixel format";
        case APIP_SAMPLE_COUNT:                             return "gfx_apply_pipeline: MSAA sample count in pipeline doesn't match render pass attachment sample count";

        /* sg_apply_bindings */
        case ABND_PIPELINE:                                 return "gfx_apply_bindings: must be called after sg_apply_pipeline";
        case ABND_PIPELINE_EXISTS:                          return "gfx_apply_bindings: currently applied pipeline object no longer alive";
        case ABND_PIPELINE_VALID:                           return "gfx_apply_bindings: currently applied pipeline object not in valid state";
        case ABND_VBS:                                      return "gfx_apply_bindings: number of vertex buffers doesn't match number of pipeline vertex layouts";
        case ABND_VB_TYPE:                                  return "gfx_apply_bindings: buffer in vertex buffer slot is not a SG_BUFFERTYPE_VERTEXBUFFER";
        case ABND_VB_OVERFLOW:                              return "gfx_apply_bindings: buffer in vertex buffer slot is overflown";
        case ABND_NO_IB:                                    return "gfx_apply_bindings: pipeline object defines indexed rendering, but no index buffer provided";
        case ABND_IB:                                       return "gfx_apply_bindings: pipeline object defines non-indexed rendering, but index buffer provided";
        case ABND_IB_TYPE:                                  return "gfx_apply_bindings: buffer in index buffer slot is not a SG_BUFFERTYPE_INDEXBUFFER";
        case ABND_IB_OVERFLOW:                              return "gfx_apply_bindings: buffer in index buffer slot is overflown";
        case ABND_VS_IMGS:                                  return "gfx_apply_bindings: vertex shader image count doesn't match sg_shader_desc";
        case ABND_VS_IMG_TYPES:                             return "gfx_apply_bindings: one or more vertex shader image types don't match sg_shader_desc";
        case ABND_FS_IMGS:                                  return "gfx_apply_bindings: fragment shader image count doesn't match sg_shader_desc";
        case ABND_FS_IMG_TYPES:                             return "gfx_apply_bindings: one or more fragment shader image types don't match sg_shader_desc";

        /* sg_apply_uniforms */
        case AUB_NO_PIPELINE:                               return "gfx_apply_uniforms: must be called after sg_apply_pipeline()";
        case AUB_NO_UB_AT_SLOT:                             return "gfx_apply_uniforms: no uniform block declaration at this shader stage UB slot";
        case AUB_SIZE:                                      return "gfx_apply_uniforms: data size exceeds declared uniform block size";

        /* sg_update_buffer */
        case UPDATEBUF_USAGE:                               return "gfx_update_buffer: cannot update immutable buffer";
        case UPDATEBUF_SIZE:                                return "gfx_update_buffer: update size is bigger than buffer size";
        case UPDATEBUF_ONCE:                                return "gfx_update_buffer: only one update allowed per buffer and frame";
        case UPDATEBUF_APPEND:                              return "gfx_update_buffer: cannot call sg_update_buffer and sg_append_buffer in same frame";

        /* sg_append_buffer */
        case APPENDBUF_USAGE:                               return "gfx_append_buffer: cannot append to immutable buffer";
        case APPENDBUF_SIZE:                                return "gfx_append_buffer: overall appended size is bigger than buffer size";
        case APPENDBUF_UPDATE:                              return "gfx_append_buffer: cannot call sg_append_buffer and sg_update_buffer in same frame";

        /* sg_update_image */
        case UPDIMG_USAGE:                                  return "gfx_update_image: cannot update immutable image";
        case UPDIMG_NOTENOUGHDATA:                          return "gfx_update_image: not enough subimage data provided";
        case UPDIMG_SIZE:                                   return "gfx_update_image: provided subimage data size too big";
        case UPDIMG_COMPRESSED:                             return "gfx_update_image: cannot update images with compressed format";
        case UPDIMG_ONCE:                                   return "gfx_update_image: only one update allowed per image and frame";

        case: return "unknown validation error";
    }
}

ValidationError :: enum {
    NO_ERROR,

    BUFFERDESC_SIZE,
    BUFFERDESC_CONTENT,
    BUFFERDESC_NO_CONTENT,

    IMAGEDESC_WIDTH,
    IMAGEDESC_HEIGHT,
    IMAGEDESC_RT_PIXELFORMAT,
    IMAGEDESC_NONRT_PIXELFORMAT,
    IMAGEDESC_MSAA_BUT_NO_RT,
    IMAGEDESC_NO_MSAA_RT_SUPPORT,
    IMAGEDESC_RT_IMMUTABLE,
    IMAGEDESC_RT_NO_CONTENT,
    IMAGEDESC_CONTENT,
    IMAGEDESC_NO_CONTENT,

    SHADERDESC_SOURCE,
    SHADERDESC_BYTECODE,
    SHADERDESC_SOURCE_OR_BYTECODE,
    SHADERDESC_NO_BYTECODE_SIZE,
    SHADERDESC_NO_CONT_UBS,
    SHADERDESC_NO_CONT_IMGS,
    SHADERDESC_NO_CONT_UB_MEMBERS,
    SHADERDESC_NO_UB_MEMBERS,
    SHADERDESC_UB_MEMBER_NAME,
    SHADERDESC_UB_SIZE_MISMATCH,
    SHADERDESC_IMG_NAME,

    PIPELINEDESC_SHADER,
    PIPELINEDESC_NO_ATTRS,
    PIPELINEDESC_LAYOUT_STRIDE4,
    PIPELINEDESC_ATTR_NAME,
    PIPELINEDESC_ATTR_SEMANTICS,

    PASSDESC_NO_COLOR_ATTS,
    PASSDESC_NO_CONT_COLOR_ATTS,
    PASSDESC_IMAGE,
    PASSDESC_MIPLEVEL,
    PASSDESC_FACE,
    PASSDESC_LAYER,
    PASSDESC_SLICE,
    PASSDESC_IMAGE_NO_RT,
    PASSDESC_COLOR_PIXELFORMATS,
    PASSDESC_COLOR_INV_PIXELFORMAT,
    PASSDESC_DEPTH_INV_PIXELFORMAT,
    PASSDESC_IMAGE_SIZES,
    PASSDESC_IMAGE_SAMPLE_COUNTS,

    BEGINPASS_PASS,
    BEGINPASS_IMAGE,

    APIP_PIPELINE_VALID_ID,
    APIP_PIPELINE_EXISTS,
    APIP_PIPELINE_VALID,
    APIP_SHADER_EXISTS,
    APIP_SHADER_VALID,
    APIP_ATT_COUNT,
    APIP_COLOR_FORMAT,
    APIP_DEPTH_FORMAT,
    APIP_SAMPLE_COUNT,

    ABND_PIPELINE,
    ABND_PIPELINE_EXISTS,
    ABND_PIPELINE_VALID,
    ABND_VBS,
    ABND_VB_TYPE,
    ABND_VB_OVERFLOW,
    ABND_NO_IB,
    ABND_IB,
    ABND_IB_TYPE,
    ABND_IB_OVERFLOW,
    ABND_VS_IMGS,
    ABND_VS_IMG_TYPES,
    ABND_FS_IMGS,
    ABND_FS_IMG_TYPES,

    /* sg_apply_uniforms validation */
    AUB_NO_PIPELINE,
    AUB_NO_UB_AT_SLOT,
    AUB_SIZE,

    /* sg_update_buffer validation */
    UPDATEBUF_USAGE,
    UPDATEBUF_SIZE,
    UPDATEBUF_ONCE,
    UPDATEBUF_APPEND,

    /* sg_append_buffer validation */
    APPENDBUF_USAGE,
    APPENDBUF_SIZE,
    APPENDBUF_UPDATE,

    /* sg_update_image validation */
    UPDIMG_USAGE,
    UPDIMG_NOTENOUGHDATA,
    UPDIMG_SIZE,
    UPDIMG_COMPRESSED,
    UPDIMG_ONCE,
}