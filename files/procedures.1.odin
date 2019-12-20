package cgltf

when ODIN_OS == "windows" do foreign import cgltf_lib "cgltf.lib"

@(default_calling_convention="c")
@(link_prefix="cgltf_")
foreign cgltf_lib {
    print_struct_sizes :: proc() ---

    parse :: proc(
		options: ^Options,
		data: ^u8,
		size: Size,
		out_data: ^^Data) -> Result ---

    parse_file :: proc(
        options: ^Options,
        path: cstring,
        out_data: ^^Data) -> Result ---

    load_buffers :: proc(
        options: ^Options,
        data: ^Data,
        gltf_path: cstring) -> Result ---

    load_buffer_base64 :: proc(
        options: ^Options,
        size: Size,
        base64: cstring,
        out_data: ^rawptr) -> Result ---

    validate :: proc(data: ^Data) -> Result ---

    free :: proc(data: ^Data) ---

    node_transform_local :: proc(
        node: ^Node, out_matrix: ^f32) ---
    node_transform_world :: proc(
        node: ^Node, out_matrix: ^f32) ---

    accessor_read_float :: proc(
        accessor: ^Accessor, index: Size, out: ^f32, element_size: Size) -> Bool ---

    accessor_read_index :: proc(
        accessor: ^Accessor, index: Size) -> Size ---

    num_components :: proc(type: Type) -> Size ---

    accessor_unpack_floats :: proc(
        accessor: ^Accessor, out: ^f32, float_count: Size) -> Size ---

    copy_extras_json :: proc(
        data: ^Data, extras: ^Extras, dest: cstring, dest_size: ^Size) -> Result ---
}
