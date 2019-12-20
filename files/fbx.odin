_ := compile_assert(ODIN_OS == "windows");

import "core:fmt.odin";
import "core:os.odin";
import "core:mem.odin";

// for decompressing array data
when ODIN_OS == "windows" do foreign_system_library "miniz.lib";
when ODIN_OS == "linux"   do foreign_system_library "miniz";

foreign miniz {
	mz_uncompress :: proc(pDest: ^u8, pDest_len: ^u32, pSource: ^u8, source_len: u32) -> i32 ---;
	mz_compress   :: proc(pDest: ^u8, pDest_len: ^u32, pSource: ^u8, source_len: u32) -> i32 ---;
}

Property_Record_Types :: enum rune {
	// Primitive Types
	Value_Short  = 'Y',
	Value_Bool   = 'C',
	Value_Int    = 'I',
	Value_Float  = 'F',
	Value_Double = 'D',
	Value_Long   = 'L',

	// Array Types
	Array_Float  = 'f',
	Array_Double = 'd',
	Array_Long   = 'l',
	Array_Int    = 'i',
	Array_Bool   = 'b',

	// Special Types
	String       = 'S',
	Raw          = 'R',
};

// @TODO: Replace "struct #raw_union" with a proper union?
Property_Record_Data :: struct #raw_union {
	// primary types
	val_i64:  i64,
	val_i32:  i32,
	val_i16:  i16,
	val_bool: bool,
	val_f32:  f32,
	val_f64:  f64,

	// array types
	array: struct {
		array_length:      u32,
		encoding:          u32,
		compressed_length: u32,
		contents:          []u8,
	},

	// special types
	special_string: string,
	special_raw: []u8,
};

Property_Record :: struct {
	type_code: Property_Record_Types,
	using property_record_data: Property_Record_Data,
}

Node_Record_Header :: struct #ordered #align 1 {
	end_offset:         u32,
	num_properties:     u32,
	property_list_len:  u32,
	name_len:           u8,
};

Node_Record :: struct {
	using header:  Node_Record_Header,
	root:               ^FBX,
	
	name:               string,

	properties:         [dynamic]Property_Record,
	nested_node_list:   [dynamic]Node_Record,

	node_data:          []u8,
};

FBX :: struct {
	using header: struct {
		magic:      string,
		unknown:    [2]u8,
		version:    u32,
	},

	node_list:  [dynamic]Node_Record,
	
	fbx_data:       []u8,
};

size_from_type :: proc(t: Property_Record_Types) -> int {
	using Property_Record_Types;
	switch t {
		case Value_Bool, Array_Bool:                             return 1;
		case Value_Short:                                        return 2;
		case Value_Int, Value_Float, Array_Int, Array_Float:     return 4;
		case Value_Long, Value_Double, Array_Long, Array_Double: return 8;
	}
	return 0;
}

load_fbx :: proc(filename: string) -> FBX {
	file_data, success := os.read_entire_file(filename);
	assert(success, "Could not read file");

	using fbx: FBX;
	fbx_data = file_data[...];

	// extract the fbx header
	magic = string(fbx_data[0..21]);
	unknown[0], unknown[1] = fbx_data[21], fbx_data[22];
	version = (cast(^u32)&fbx_data[23])^;

	// move past header
	data := fbx_data[27..];

	

	parse_properties :: proc(data: []u8, num: int) -> [dynamic]Property_Record {
		properties: [dynamic]Property_Record;
		
		// Extract the list of properties from data
		for i in 0..num {
			using property: Property_Record;
			s := size_from_type(Property_Record_Types(data[0]));
			
			using Property_Record_Types;
			switch type_code = Property_Record_Types(data[0]); type_code {
			// Primitive types
			case Value_Long:   val_i64  = (cast(^i64)&data[1])^;  data = data[s+1..];
			case Value_Int:    val_i32  = (cast(^i32)&data[1])^;  data = data[s+1..];
			case Value_Short:  val_i16  = (cast(^i16)&data[1])^;  data = data[s+1..];
			case Value_Bool:   val_bool = (cast(^bool)&data[1])^; data = data[s+1..];
			case Value_Float:  val_f32  = (cast(^f32)&data[1])^;  data = data[s+1..];
			case Value_Double: val_f64  = (cast(^f64)&data[1])^;  data = data[s+1..];

			// Array types
			case Array_Bool, Array_Int, Array_Long, Array_Double, Array_Float:
				using array;
				array_length      = (cast(^u32)&data[1])^;
				encoding          = (cast(^u32)&data[5])^;
				compressed_length = (cast(^u32)&data[9])^;
				
				l := encoding == 0 ? cast(int)array_length*s : cast(int)compressed_length;
				
				contents = data[13..13+l];
				data     = data[13+l..];

			// Special types
			case String:
				v := (cast(^u32)&data[1])^;
				special_string = string(data[5..5+v]);
				data = data[5+v..];

				// replace bad printable characters (0x00 followed by 0x01)
				for k in 0..len(special_string)-1 {
					if special_string[k] == 0x00 && special_string[k+1] == 0x01 {
						special_string[k], special_string[k+1] = ':', ':';
						break;
					}
				}
			case Raw:
				v := (cast(^u32)&data[1])^;
				special_raw = data[5..5+v];
				data        = data[5+v..];
			case:
				fmt.println("Unknown Property Record Type:", rune(data[0]));
			}
			append(&properties, property);
		}

		// make sure all the data is parsed, and that the number of properties parsed is as expected
		assert(len(data) == 0);
		assert(len(properties) == num);

		return properties;
	}

	parse_nodes :: proc(data: []u8, fbx: ^FBX, level: int) -> [dynamic]Node_Record {
		node_list: [dynamic]Node_Record;

		// extract node list
		for len(data) > 0 {
			// read header
			using node_record: Node_Record;
			header = (cast(^Node_Record_Header)&data[0])^;
			if header.end_offset == 0 do break;
			
			// extract relevant data from fbx data
			l := cast(int)(&fbx.fbx_data[header.end_offset] - &data[0]);
			node_data = data[..l];
			data = data[l..];
			root = fbx;

			append(&node_list, node_record);
		}

		// expand each node in list recursively
		for i in 0..len(node_list) {
			using node_record := &node_list[i];
			rest := node_data[size_of(Node_Record_Header)..];
			name = string(rest[..name_len]);

			// move past name
			rest = rest[name_len..];

			// parse properties 
			properties = parse_properties(rest[0..property_list_len], cast(int)num_properties);

			nested_node_list_data := rest[property_list_len..len(rest)];
			if len(nested_node_list_data) > 0 do nested_node_list = parse_nodes(nested_node_list_data, fbx, level+1);
			
		}

		return node_list;
	}

	node_list = parse_nodes(data, &fbx, 0);

	return fbx;
}

print_fbx :: proc(fbx: ^FBX) {
	println_indented :: proc(level: int, args: ...any) {
		for i in 0..level do fmt.printf("    "); fmt.println(...args);
	}
	printf_indented :: proc(level: int, fmt_string: string, args: ...any) {
		for i in 0..level do fmt.printf("    "); fmt.printf(fmt_string, ...args);
	}

	print_node_list :: proc(node_list: ^[dynamic]Node_Record, level: int) {
		// expand each node in list recursively
		using Property_Record_Types;

		println_indented(level, "nodes: [");
		for i in 0..len(node_list) {
			using node := node_list[i];
			println_indented(level+1, "{");
			println_indented(level+2, "name:", name);

			println_indented(level+2, "properties: [");
			for j in 0..header.num_properties {
				println_indented(level+3, "{");
				using property := properties[j];

				// Primitive types
				switch type_code {
				case Value_Long:   println_indented(level+4, type_code, ":", val_i64);
				case Value_Int:    println_indented(level+4, type_code, ":", val_i32);
				case Value_Short:  println_indented(level+4, type_code, ":", val_i16);
				case Value_Bool:   println_indented(level+4, type_code, ":", val_bool);
				case Value_Float:  println_indented(level+4, type_code, ":", val_f32);
				case Value_Double: println_indented(level+4, type_code, ":", val_f64);

				// Array types
				case Array_Bool, Array_Int, Array_Long, Array_Double, Array_Float:
					println_indented(level+4, type_code, "{");

					println_indented(level+5, "array_length:", array.array_length);
					println_indented(level+5, "encoding:", array.encoding);
					println_indented(level+5, "compressed_length:", array.compressed_length);
					println_indented(level+5, "contents: <binary blob>");

					println_indented(level+4, "}");

				// Special types
				case String: println_indented(level+4, "string :", special_string);
				case Raw:    println_indented(level+4, "raw :", special_raw);
				}

				println_indented(level+3, "}");
			}
			println_indented(level+2, "]");

			if len(nested_node_list) > 0 do print_node_list(&nested_node_list, level+2);
			
			println_indented(level+1, "}");
		}
		println_indented(level, "]");
	}

	// recursively print the nodes
	println_indented(0, "{");
	print_node_list(&fbx.node_list, 1); 
	println_indented(0, "}");
}


// @TODO:
//  - Add the ability to look up and extract nodes/properties
//  - Add uncompressing of array data




Model :: struct {
	parts: []Geometry,
}
Geometry :: struct {
	vertices: []f64,
	indices: []i32,

	edges: []i32,

	normals: []f64,
	normals_winding: []f64,

	uv: []f64,
	uv_indices: []i32,

	using transform: struct {
		pre_rotation: [3]f64,
		local_translation: [3]f64,
		geometric_translation: [3]f64,
	},

	handle: i64,

}



find_node :: proc(nested_nodes: []Node_Record, str: string) -> ^Node_Record {
	for i in 0..len(nested_nodes) {
		using n := &nested_nodes[i];
		if name == str {
			return n;
		}

		r := find_node(nested_node_list[..], str);
		if r != nil {
			return r;
		}
	}

	return nil;
}

find_node_property :: proc(nested_nodes: []Node_Record, name_property: string) -> ^Node_Record {
		for i in 0..len(nested_nodes) {
			using n := &nested_nodes[i];
			for p, j in properties {
				if p.special_string == name_property do return n;
			}

			r := find_node_property(nested_node_list[..], name_property);
			if r != nil {
				return r;
			}
		}

		return nil;
	}

find_all_nodes :: proc(input_nodes: []Node_Record, output_nodes: ^[dynamic]^Node_Record, str: string) {
	for i in 0..len(input_nodes) {
		using n := &input_nodes[i];
		if name == str do append(output_nodes, n);

		find_all_nodes(nested_node_list[..], output_nodes, str);
	}

	return;
}

uncompress_property :: proc(using p: ^Property_Record) -> ([]u8, int) {		
	assert(p.type_code == Property_Record_Types.Array_Float  || 
		   p.type_code == Property_Record_Types.Array_Double || 
		   p.type_code == Property_Record_Types.Array_Long   || 
		   p.type_code == Property_Record_Types.Array_Int    || 
		   p.type_code == Property_Record_Types.Array_Bool);

	len_compressed : u32 = cast(u32)len(array.contents);
	len_uncompressed: u32 = array.array_length*u32(size_from_type(type_code));
	
	compressed := array.contents;
	uncompressed := make([]u8, len_uncompressed);
	success_uncompress := mz_uncompress(&uncompressed[0], &len_uncompressed, &compressed[0], cast(u32)len(compressed));
	
	if success_uncompress == 0 do assert(len(uncompressed) == cast(int)len_uncompressed);
	else do fmt.println("Error uncompressing:", success_uncompress);

	return uncompressed, len(compressed);
}


create_model_from_fbx :: proc(fbx: ^FBX)-> Model {
	global_settings, property_templates, geometries, models, connections: [dynamic]^Node_Record;
	find_all_nodes(fbx.node_list[..], &global_settings,    "GlobalSettings");
	find_all_nodes(fbx.node_list[..], &property_templates, "PropertyTemplate");
	find_all_nodes(fbx.node_list[..], &geometries,         "Geometry");
	find_all_nodes(fbx.node_list[..], &models,             "Model");
	find_all_nodes(fbx.node_list[..], &connections,        "Connections");

	model := Model{parts = make([]Geometry, len(geometries))};

	total_uncompressed_data, total_compressed_data: int;
	for g, i in geometries {
		v      := find_node(g.nested_node_list[...], "Vertices");
		idx    := find_node(g.nested_node_list[...], "PolygonVertexIndex");
		e      := find_node(g.nested_node_list[...], "Edges");
		n      := find_node(g.nested_node_list[...], "Normals");
		w      := find_node(g.nested_node_list[...], "NormalsW");
		uv     := find_node(g.nested_node_list[...], "UV");
		uv_idx := find_node(g.nested_node_list[...], "UVIndex");
		
		data_v,      len_v      := uncompress_property(&v.properties[0]);
		data_idx,    len_idx    := uncompress_property(&idx.properties[0]);
		data_e,      len_e      := uncompress_property(&e.properties[0]);
		data_n,      len_n      := uncompress_property(&n.properties[0]);
		data_w,      len_w      := uncompress_property(&w.properties[0]);
		data_uv,     len_uv     := uncompress_property(&uv.properties[0]);
		data_uv_idx, len_uv_idx := uncompress_property(&uv_idx.properties[0]);

		total_compressed_data   += len_v + len_idx + len_e + len_n + len_w + len_uv + len_uv_idx;
		total_uncompressed_data += len(data_v) + len(data_idx) + len(data_e) + len(data_n) + len(data_w) + len(data_uv) + len(data_uv_idx);
		
		model.parts[i].vertices         = mem.slice_ptr(cast(^f64)&data_v[0],      len(data_v)/8);
		model.parts[i].indices          = mem.slice_ptr(cast(^i32)&data_idx[0],    len(data_idx)/4);
		model.parts[i].edges            = mem.slice_ptr(cast(^i32)&data_e[0],      len(data_e)/4);
		model.parts[i].normals          = mem.slice_ptr(cast(^f64)&data_n[0],      len(data_n)/8);
		model.parts[i].normals_winding  = mem.slice_ptr(cast(^f64)&data_w[0],      len(data_w)/8);
		model.parts[i].uv               = mem.slice_ptr(cast(^f64)&data_uv[0],     len(data_uv)/8);
		model.parts[i].uv_indices       = mem.slice_ptr(cast(^i32)&data_uv_idx[0], len(data_uv_idx)/4);

		model.parts[i].handle = g.properties[0].val_i64;
	}

	// @WARNING, assuming models are in the same order as geometries. 
	// shuold probably use connections to be safe
	for m, i in models {
		h := m.properties[0].val_i64;
		pre_rotation          := find_node_property(m.nested_node_list[...], "PreRotation");
		local_translation     := find_node_property(m.nested_node_list[...], "Lcl Translation");
		geometric_translation := find_node_property(m.nested_node_list[...], "GeometricTranslation");

		if pre_rotation != nil {
			model.parts[i].pre_rotation[0] = pre_rotation.properties[len(pre_rotation.properties)-3].val_f64;
			model.parts[i].pre_rotation[1] = pre_rotation.properties[len(pre_rotation.properties)-2].val_f64;
			model.parts[i].pre_rotation[2] = pre_rotation.properties[len(pre_rotation.properties)-1].val_f64;
		}

		if local_translation != nil {
			model.parts[i].local_translation[0] = local_translation.properties[len(local_translation.properties)-3].val_f64;
			model.parts[i].local_translation[1] = local_translation.properties[len(local_translation.properties)-2].val_f64;
			model.parts[i].local_translation[2] = local_translation.properties[len(local_translation.properties)-1].val_f64;
		}

		if geometric_translation != nil {
			model.parts[i].geometric_translation[0] = geometric_translation.properties[len(geometric_translation.properties)-3].val_f64;
			model.parts[i].geometric_translation[1] = geometric_translation.properties[len(geometric_translation.properties)-2].val_f64;
			model.parts[i].geometric_translation[2] = geometric_translation.properties[len(geometric_translation.properties)-1].val_f64;
		}

	}

	return model;
}
