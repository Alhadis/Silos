import "core:os.odin"
import "core:mem.odin"

Material_Flag :: enum u32 {
	Texture_Diffuse           = 0x00040000,
	Colored                   = 0x08000000,
	Mipmapping                = 0x00800000,
	Animated_Texture_Diffuse  = 0x04000000,
	Animated_Texture_Alpha    = 0x02000000,
	Double_Sided              = 0x10000000,
	Environment_Map           = 0x00080000,
	Texture_Blend_Normal      = 0x00000100,
	Texture_Blend_Multiply    = 0x00000200,
	Texture_Blend_Additive    = 0x00000400,
	Calc_Reflect_Texture_Y    = 0x00001000,
	Project_Reflect_Texture_Y = 0x00002000,
	Project_Reflect_Texture_Z = 0x00004000,
	Additional_Effect         = 0x00008000,
	Alpha_Texture             = 0x40000000,
	Color_Key                 = 0x20000000,
	Additive_Mixing           = 0x80000000,
}

Mesh_Type :: enum u8 {
	Standard = 0x01,
	Sector   = 0x05,
	Dummy    = 0x06,
	Target   = 0x07,
	Bone     = 0x0a,
}

Visual_Mesh_Type :: enum u8 {
	Standard     = 0x0,
	Single_Mesh  = 0x02,
	Single_Morph = 0x03,
	Billboard    = 0x04,
	Morph        = 0x05,
	Glow         = 0x06,
	Mirror       = 0x08,
}

Mesh_Render_Flag :: enum u16 {
	Use_Depth_Bias = 0x0001,
	Use_Shadows    = 0x0002,
	Unknown        = 0x0008,
	Use_Projection = 0x0020,
	Forbid_Fog     = 0x0080,
}

Mesh_Occluding_Flag :: enum u8 {
	Normal   = 0x09,
	Sector   = 0x7D,
	Wall     = 0x3D,
	Portal   = 0x1D,
	Inactive = 0x11,
}

Material :: struct #ordered {
	flags: Material_Flag,

	ambient, diffuse, emission: [3]f32,

	transparency: f32, // 0.0 - transparent, 1.0 - opaque

	env: struct #ordered {
		ratio: f32,
		name: string,
	},

	diff: struct #ordered {
		name: string,
	},

	alpha: struct #ordered {
		name: string,
	},

	anim: struct #ordered {
		sequence_length: u32,
		_unk0: u16,
		frame_period: u32,
		_unk1: [2]u32,
	},
}

Vertex :: struct #packed {
	pos, normal: [3]f32,
	uv: [2]f32,
}

Face :: struct #packed {
	a, b, c: u16,
}

Face_Group :: struct #ordered {
	faces: []Face,
	material_id: u16,
}

LOD :: struct #ordered {
	relative_dist: f32,
	vertices: []Vertex,
	face_groups: []Face_Group,
}

Standard :: struct #ordered {
	instanced: u16,
	lods: []LOD,
}

Target :: struct #ordered {
	_: u16,
	targets: []u16,
}

Bone :: struct #packed {
	transform: [16]f32,
	bone_id: u32,
}

Portal :: struct #ordered {
	_unk0: u32,
	_unk1: [6]f32,
	vertices: [][3]f32,
}

Sector :: struct #ordered {
	_: [2]u32,
	vertices: [][3]f32,
	faces: []Face,
	min_box, max_box: [3]f32,
	portals: []Portal,
}

Billboard :: struct #ordered {
	standard: Standard,
	rot_axis: u32,
	ignore_cam: u8,
}

Dummy :: struct #packed {
	min_box, max_box: [3]f32,
}

Glow_Data :: struct #packed {
	position: f32,
	material_id: u16,
}

Glow :: struct #packed {
	glow_data: []Glow_Data,
}

Mirror :: struct #ordered {
	min_box, max_box: [3]f32,
	_unk0: [4]f32,
	reflection_mat: [16]f32,
	background_color: [3]f32,
	view_distance: f32,
	vertices: [][3]f32,
	faces: []Face,
}

Morph_LOD_Vertex :: struct #packed {
	position, normal: [3]f32,
}

Morph_LOD :: struct #ordered {
	vertices: []Morph_LOD_Vertex,
	_: u8,
	vertex_links: []u16,
}

Morph :: struct #ordered {
	standard: Standard,
	frame_count: u8,
	lod_level: u8, // Equals to len(standard.lods)
	_: u8,
	lods: []Morph_LOD,
	min_box, max_box: [3]f32,
	_: [4]f32,
}

Single_Mesh_LOD_Joint :: struct #ordered {
	transform: [16]f32,
	_: u32,
	bone_id: u32,
	min_box, max_box: [3]f32,
	additional_values: []f32,
}

Single_Mesh_LOD :: struct #ordered {
	_: u32,
	min_box, max_box: [3]f32,
	joints: []Single_Mesh_LOD_Joint,
}

Single_Mesh :: struct #ordered {
	standard: Standard,
	lods: []Single_Mesh_LOD,
}

Single_Morph :: struct #ordered {
	single_mesh: Single_Mesh,
	morph: Morph,
}

Mesh :: struct #ordered {
	mesh_type: Mesh_Type,
	visual_mesh_type: Visual_Mesh_Type,
	render_flags: Mesh_Render_Flag,

	parent_id: u16,

	position, scale: [3]f32,
	rotation: [4]f32, // wxyz quaternion

	occluding_flags: Mesh_Occluding_Flag,

	name: string,
	params: string,

	kind: struct #raw_union {
		standard: Standard,
		dummy: Dummy,
		mirror: Mirror,
		glow: Glow,
		billboard: Billboard,
		sector: Sector,
		target: Target,
		bone: Bone,
		morph: Morph,
		single_mesh: Single_Mesh,
		single_morph: Single_Morph,
	},
}

Header :: struct #ordered {
	signature: string,
	version: u16, // PC : 0x1D (29)
	timestamp: u64,

	materials: []Material,
	meshes: []Mesh,

	use_5ds: u8,
}

material_load :: proc(header: ^Header, data: []u8) -> ([]Material, []u8) {
	count := (cast(^u16)&data[0])^; data = data[2..];

	materials := make([]Material, count);

	for x in 0..count {
		using mat := Material{};

		flags = (cast(^Material_Flag)&data[0])^;
		ambient = (cast(^[3]f32)&data[4])^;
		diffuse = (cast(^[3]f32)&data[16])^;
		emission = (cast(^[3]f32)&data[28])^;

		transparency = (cast(^f32)&data[40])^; data = data[44..];

		if flags & Material_Flag.Environment_Map > 0 {
			env.ratio = (cast(^f32)&data[0])^;
			name_len := (cast(^u8)&data[4])^; data = data[5..];
			env.name = string(data[..name_len]); data = data[name_len..];
		}

		diff_name_len := (cast(^u8)&data[0])^; data = data[1..];
		diff.name = string(data[..diff_name_len]); data = data[diff_name_len..];

		if flags & Material_Flag.Alpha_Texture > 0 {
			alpha_name_len := (cast(^u8)&data[0])^; data = data[1..];
			alpha.name = string(data[..alpha_name_len]); data = data[alpha_name_len..];
		}

		if flags & Material_Flag.Animated_Texture_Diffuse > 0 {
			anim.sequence_length = (cast(^u32)&data[0])^; data = data[4..];
			anim._unk0 = (cast(^u16)&data[0])^; data = data[2..];
			anim.frame_period = (cast(^u32)&data[0])^; data = data[4..];
			anim._unk1 = (cast(^[2]u32)&data[0])^; data = data[8..];
		}

		materials[x] = mat;
	}

	return materials, data;
}

standard_load :: proc(header: ^Header, data: []u8) -> (Standard, []u8) {
	using standard := Standard{};

	instanced = (cast(^u16)&data[0])^; data = data[2..];

	if instanced == 0 {
		levels := (cast(^u8)&data[0])^; data = data[1..];

		lods = make([]LOD, levels);

		for x in 0..levels {
			using lod := LOD{};

			relative_dist = (cast(^f32)&data[0])^;
			vert_count   := (cast(^u16)&data[4])^; data = data[6..];

			vertices = make([]Vertex, vert_count);
			for v in 0..vert_count {
				vert := Vertex{};
				vert = (cast(^Vertex)&data[0])^; data = data[size_of(Vertex)..];
				vertices[v] = vert;
			}

			faceg_count := (cast(^u8)&data[0])^; data = data[1..];

			face_groups = make([]Face_Group, faceg_count);
			for g in 0..faceg_count {
				using fg := Face_Group{};
				face_count := (cast(^u16)&data[0])^; data = data[2..];

				faces = make([]Face, face_count);
				for f in 0..face_count {
					face := Face{};
					face = (cast(^Face)&data[0])^; data = data[size_of(Face)..];
					faces[f] = face;
				}

				material_id = (cast(^u16)&data[0])^; data = data[2..];

				face_groups[g] = fg;
			}


			lods[x] = lod;
		}
	}

	return standard, data;
}

mirror_load :: proc(header: ^Header, data: []u8) -> (Mirror, []u8) {
	using mirror := Mirror{};

	min_box = (cast(^[3]f32)&data[0])^;
	max_box = (cast(^[3]f32)&data[12])^; data = data[24..];

	_unk0 = (cast(^[4]f32)&data[0])^;
	reflection_mat   = (cast(^[16]f32)&data[16])^; data = data[80..];
	background_color = (cast(^[3]f32)&data[0])^;   data = data[12..];

	view_distance  = (cast(^f32)&data[0])^;
	vert_count    := (cast(^u32)&data[4])^;
	face_count    := (cast(^u32)&data[8])^; data = data[12..];

	vertices = make([][3]f32, vert_count);
	for v in 0..vert_count {
		vi := [3]f32{};
		vi = (cast(^[3]f32)&data[0])^; data = data[12..];
		vertices[v] = vi;
	}

	faces = make([]Face, face_count);
	for f in 0..face_count {
		fi := Face{};
		fi = (cast(^Face)&data[0])^; data = data[size_of(Face)..];
		faces[f] = fi;
	}

	return mirror, data;
}

glow_load :: proc(header: ^Header, data: []u8) -> (Glow, []u8) {
	using glow := Glow{};

	count := (cast(^u8)&data[0])^; data = data[1..];

	glow_data = make([]Glow_Data, count);
	for x in 0..count {
		using _data := Glow_Data{};
		position    = (cast(^f32)&data[0])^;
		material_id = (cast(^u16)&data[4])^; data = data[6..];
		glow_data[x] = _data;
	}

	return glow, data;
}

portal_load :: proc(header: ^Header, data: []u8) -> (Portal, []u8) {
	using portal := Portal{};

	vert_count    := (cast(^u8)&data[0])^; data = data[1..];

	_unk0 = (cast(^u32)&data[0])^;
	_unk1 = (cast(^[6]f32)&data[4])^; data = data[28..];

	vertices = make([][3]f32, vert_count);
	for v in 0..vert_count {
		vi := [3]f32{};
		vi = (cast(^[3]f32)&data[0])^; data = data[12..];
		vertices[v] = vi;
	}

	return portal, data;
}

mesh_load :: proc(header: ^Header, data: []u8) -> ([]Mesh, []u8) {
	count := (cast(^u16)&data[0])^; data = data[2..];

	meshes := make([]Mesh, count);

	for x in 0..count {
		using mesh := Mesh{};

		mesh_type = (cast(^Mesh_Type)&data[0])^; data = data[1..];

		if mesh_type == Mesh_Type.Standard {
			visual_mesh_type = (cast(^Visual_Mesh_Type)&data[0])^;
			render_flags = (cast(^Mesh_Render_Flag)&data[1])^; data = data[3..];
		}

		parent_id = (cast(^u16)&data[0])^;

		position = (cast(^[3]f32)&data[2])^;
		scale    = (cast(^[3]f32)&data[14])^;
		rotation = (cast(^[4]f32)&data[26])^; data = data[42..];

		occluding_flags = (cast(^Mesh_Occluding_Flag)&data[0])^; data = data[1..];

		name_len := (cast(^u8)&data[0])^; data = data[1..];
		name = string(data[0..name_len]); data = data[name_len..];

		params_len := (cast(^u8)&data[0])^; data = data[1..];
		params = string(data[0..params_len]); data = data[params_len..];

		switch mesh_type {
		case Mesh_Type.Standard:
			switch visual_mesh_type {
			case Visual_Mesh_Type.Standard:
				kind.standard, data = standard_load(header, data);

			case Visual_Mesh_Type.Mirror:
				kind.mirror, data = mirror_load(header, data);

			case Visual_Mesh_Type.Glow:
				kind.glow, data = glow_load(header, data);
			}
		}

		meshes[x] = mesh;
	}

	return meshes, data;
}

load :: proc(data: []u8) -> (^Header, bool) {
	using header := new(Header);

	signature = string(data[0..3]); data = data[4..];

	if signature != "4DS" {
		free(header);
		return nil, false;
	}

	version = (cast(^u16)&data[0])^;
	timestamp = (cast(^u64)&data[2])^; data = data[10..];

	materials, data = material_load(header, data);
	meshes, data    = mesh_load(header, data);

	return header, true;
}

import "core:fmt.odin"

main :: proc()
{
	file, _ := os.read_entire_file("w:/odin/pg/mafia_libs/baliksena.4ds");
	header, status := load(file);
	fmt.println(header^);
}