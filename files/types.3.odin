package cgltf

import "core:c"

Bool :: i32;
Size :: int;

File_Type :: enum c.int {
    INVALID,
    GLTF,
    GLB,
};

Options :: struct {
    type: File_Type,
    json_token_count: int,
    memory_alloc: proc "c" (user: rawptr, size: int) -> rawptr,
    memory_free: proc "c" (user: rawptr, ptr: rawptr),
    memory_user_data: rawptr,
}

Result :: enum c.int {
	SUCCESS,
	DATA_TOO_SHORT,
	UNKNOWN_FORMAT,
	INVALID_JSON,
	INVALID_GLTF,
	INVALID_OPTIONS,
	FILE_NOT_FOUND,
	IO_ERROR,
	OUT_OF_MEMORY,
};


Buffer_View_Type :: enum c.int {
    INVALID,
    INDICES,
    VERTICES,
};

Attribute_Type :: enum c.int {
    INVALID,
    POSITION,
    NORMAL,
    TANGENT,
    TEXCOORD,
    COLOR,
    JOINTS,
    WEIGHTS,
};

Component_Type :: enum c.int {
    INVALID,
    R_8, /* byte */
    R_8U, /* unsigned_byte */
    R_16, /* short */
    R_16U, /* unsigned_short */
    R_32U, /* unsigned_int */
    R_32F, /* float */
};

Type :: enum c.int {
    INVALID,
    SCALAR,
    VEC2,
    VEC3,
    VEC4,
    MAT2,
    MAT3,
    MAT4,
};

Primitive_Type :: enum c.int {
    POINTS,
    LINES,
    LINE_LOOP,
    LINE_STRIP,
    TRIANGLES,
    TRIANGLE_STRIP,
    TRIANGLE_FAN,
};

Alpha_Mode :: enum c.int {
    OPAQUE,
    MASK,
    BLEND,
}

Animation_Path_Type :: enum c.int {
	INVALID,
	TRANSLATION,
	ROTATION,
	SCALE,
	WEIGHTS,
}

Interpolation_Type :: enum c.int {
	LINEAR,
	STEP,
	CUBIC_SPLINE,
}

Camera_Type :: enum c.int {
	INVALID,
	PERSPECTIVE,
	ORTHOGRAPHIC,
}

Light_Type :: enum c.int {
	INVALID,
	DIRECTIONAL,
	POINT,
	SPOT,
}

Extras :: struct {
    start_offset: int,
	end_offset: int,
};

Buffer :: struct {
    size: int,
	uri: cstring,
	data: rawptr, /* loaded by load_buffers */
	extras: Extras,
};

Buffer_View :: struct {
	buffer: ^Buffer,
    offset: Size,
    size: Size,
    stride: Size, /* 0 == automatically determined by accessor */
	type: Buffer_View_Type,
	extras: Extras,
};

Accessor_Sparse :: struct {
    count: Size,
	indices_buffer_view: ^Buffer_View,
	indices_byte_offset: Size,
	indices_component_type: Component_Type,
	values_buffer_view: ^Buffer_View,
	values_byte_offset: Size,
	extras: Extras,
	indices_extras: Extras,
	values_extras: Extras,
};

Accessor :: struct {
    component_type: Component_Type,
	normalized: Bool,
	type: Type,
	offset: Size,
	count: Size,
	stride: Size,
	buffer_view: ^Buffer_View,
	has_min: Bool,
	min: [16]f32,
	has_max: Bool,
	max: [16]f32,
	is_sparse: Bool,
    pad2: i32, // TODO: Why is this necessary?
	sparse: Accessor_Sparse,
	extras: Extras,
};

Attribute :: struct {
    name: cstring,
	type: Attribute_Type,
	index: i32,
	data: ^Accessor,
};

Image :: struct {
    name: cstring,
	uri: cstring,
	buffer_view: ^Buffer_View,
	mime_type: cstring,
	extras: Extras,
};

Sampler :: struct {
    mag_filter: i32,
	min_filter: i32,
	wrap_s: i32,
	wrap_t: i32,
	extras: Extras,
};

Texture :: struct
{
    name: cstring,
	image: ^Image,
	sampler: ^Sampler,
	extras: Extras,
}

Texture_Transform :: struct
{
    offset: [2]f32,
	rotation: f32,
	scale: [2]f32,
	texcoord: i32,
};

Texture_View :: struct
{
    texture: ^Texture,
	texcoord: i32,
	scale: f32, /* equivalent to strength for occlusion_texture */
	has_transform: Bool,
	transform: Texture_Transform,
	extras: Extras,
};

Pbr_Metallic_Roughness :: struct
{
    base_color_texture: Texture_View,
	metallic_roughness_texture: Texture_View,

	base_color_factor: [4]f32,
	metallic_factor: f32,
	roughness_factor: f32,

	extras: Extras,
};

Pbr_Specular_Glossiness :: struct
{
    diffuse_texture: Texture_View,
	specular_glossiness_texture: Texture_View,

	diffuse_factor: [4]f32,
	specular_factor: [3]f32,
	glossiness_factor: f32,
};

Material :: struct {
    name: cstring ,
	has_pbr_metallic_roughness: Bool,
	has_pbr_specular_glossiness: Bool,
	pbr_metallic_roughness: Pbr_Metallic_Roughness,
	pbr_specular_glossiness: Pbr_Specular_Glossiness,
	normal_texture: Texture_View,
	occlusion_texture: Texture_View,
	emissive_texture: Texture_View,
	emissive_factor: [3]f32,
	alpha_mode: Alpha_Mode,
	alpha_cutoff: f32,
	double_sided: Bool,
	unlit: Bool,
	extras: Extras,
};

Morph_Target :: struct {
    attributes: ^Attribute,
    attributes_count: Size,
};

Primitive :: struct {
    type: Primitive_Type,
    indices: ^Accessor,
	material: ^Material,
	attributes: ^Attribute,
	attributes_count: Size,
	targets: ^Morph_Target,
	targets_count: Size,
	extras: Extras,
};

Mesh :: struct {
    name: cstring,
    primitives: ^Primitive,
	primitives_count: Size,
	weights: ^f32,
	weights_count: Size,
	target_names: ^cstring,
	target_names_count: Size,
	extras: Extras,
};

Skin :: struct {
    name: cstring,
	joints: ^^Node,
	joints_count: Size,
	skeleton: ^Node,
	inverse_bind_matrices: ^Accessor,
	extras: Extras,
};

Camera_Perspective :: struct {
    aspect_ratio: f32,
    yfov: 	f32,
    zfar: 	f32,
    znear: 	f32,
	extras: Extras,
};

Camera_Orthographic :: struct {
    xmag: f32,
    ymag: 	f32,
    zfar: 	f32,
    znear: 	f32,
	extras: Extras,
};

Camera :: struct {
    name: cstring,
    type: 	Camera_Type,
	matrix: struct #raw_union {
        perspective: Camera_Perspective,
		orthographic: Camera_Orthographic,
	},
    extras: Extras,
};

Light :: struct {
    name: cstring,
    color: 	[3]f32,
    intensity: 	f32,
    type: 	Light_Type,
    range: 	f32,
    spot_inner_cone_angle: 	f32,
    spot_outer_cone_angle: 	f32,
};

Node :: struct {
    name: cstring,
    parent: 	^Node,
    children: 	^^Node,
    children_count: 	Size,
    skin: 	^Skin,
    mesh: 	^Mesh,
    camera: 	^Camera,
    light: 	^Light,
    weights: 	^f32,
    weights_count: 	Size,
    has_translation: 	Bool,
    has_rotation: 	Bool,
    has_scale: 	Bool,
    has_matrix: 	Bool,
    translation: 	[3]f32,
    rotation: 	[4]f32,
    scale: 	[3]f32,
    matrix: 	[16]f32,
	extras: Extras,
};

Scene :: struct {
    name: cstring,
    nodes: ^^Node,
    nodes_count: 	Size,
	extras: Extras,
};

Animation_Sampler :: struct {
    input: ^Accessor,
    output: 	^Accessor,
    interpolation: 	Interpolation_Type,
	extras: Extras,
};

Animation_Channel :: struct {
    sampler: ^Animation_Sampler,
    target_node: 	^Node,
    target_path: 	Animation_Path_Type,
	extras: Extras,
};

Animation :: struct {
    name: cstring,
    samplers: 	^Animation_Sampler,
    samplers_count: 	Size,
    channels: 	^Animation_Channel,
    channels_count: 	Size,
	extras: Extras,
};

Asset :: struct {
    copyright: cstring,
    generator: 	cstring,
    version: 	cstring,
    min_version: 	cstring,
	extras: Extras,
};

Data :: struct {
    file_type: File_Type,
    file_data: 	rawptr,

    asset: 	Asset,

    meshes: 	^Mesh,
    meshes_count: 	Size,

    materials: 	^Material,
    materials_count: 	Size,

    accessors: 	^Accessor,
    accessors_count: 	Size,

    buffer_views: 	^Buffer_View,
    buffer_views_count: 	Size,

    buffers: 	^Buffer,
    buffers_count: 	Size,

    images: 	^Image,
    images_count: 	Size,

    textures: 	^Texture,
    textures_count: 	Size,

    samplers: 	^Sampler,
    samplers_count: 	Size,

    skins: 	^Skin,
    skins_count: 	Size,

    cameras: 	^Camera,
    cameras_count: 	Size,

    lights: 	^Light,
    lights_count: 	Size,

    nodes: 	^Node,
    nodes_count: 	Size,

    scenes: 	^Scene,
    scenes_count: 	Size,

    scene: 	^Scene,

    animations: 	^Animation,
    animations_count: 	Size,

    extras: Extras,

    extensions_used: 	^cstring,
    extensions_used_count: 	Size,

    extensions_required: 	^cstring,
    extensions_required_count: 	Size,

    json: ^u8,
    json_size: 	Size,

    bin: ^u8,
    bin_size: 	Size,

    memory_free: proc "c" (user: rawptr, ptr: rawptr),
    memory_user_data: rawptr,
};

import "core:fmt"
print_sizes :: proc() {
    fmt.println("Options", size_of(Options));
    fmt.println("Data", size_of(Data));
    fmt.println("Accessor", size_of(Accessor));
    fmt.println("  component_type: ", offset_of(Accessor, component_type));
	fmt.println("  normalized: ", offset_of(Accessor, normalized));
	fmt.println("  type: ", offset_of(Accessor, type));
	fmt.println("  offset: ", offset_of(Accessor, offset));
	fmt.println("  count: ", offset_of(Accessor, count));
	fmt.println("  stride: ", offset_of(Accessor, stride));
	fmt.println("  buffer_view: ", offset_of(Accessor, buffer_view));
	fmt.println("  has_min: ", offset_of(Accessor, has_min));
	fmt.println("  min: ", offset_of(Accessor, min));
	fmt.println("  has_max: ", offset_of(Accessor, has_max));
	fmt.println("  max: ", offset_of(Accessor, max));
	fmt.println("  is_sparse: ", offset_of(Accessor, is_sparse));
	fmt.println("  sparse: ", offset_of(Accessor, sparse));
	fmt.println("  extras: ", offset_of(Accessor, extras));

    fmt.println("Accessor_Sparse", size_of(Accessor_Sparse));
    fmt.println("Attribute", size_of(Attribute));
    fmt.println("Primitive", size_of(Primitive));
    fmt.println("Extras", size_of(Extras));
};
