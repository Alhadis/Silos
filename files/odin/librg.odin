when ODIN_OS == "windows" {
	import "core:sys/windows.odin"
	foreign import lib "librg_static.lib"
}

when ODIN_OS == "linux" || ODIN_OS == "macos" {
	foreign import lib "librg_static.lib"
}

import "shared:odin-enet/enet.odin"

@(link_prefix="librg_", default_calling_convention="c")
foreign lib {
	option_set                   :: proc(option: Options, value: u32) ---;
	option_get                   :: proc(option: Options) -> u32 ---;

	init                         :: proc(ctx: ^Ctx) ---;
	tick                         :: proc(ctx: ^Ctx) ---;
	free                         :: proc(ctx: ^Ctx) ---;
	release                      :: proc(ptr: rawptr) ---;
	release_array                :: proc(ptr: rawptr) ---;

	is_server                    :: proc(ctx: ^Ctx) -> bool ---;
	is_client                    :: proc(ctx: ^Ctx) -> bool ---;

	entity_create                :: proc(ctx: ^Ctx, etype: u32) -> ^Entity ---;
	entity_valid                 :: proc(ctx: ^Ctx, entity: Entity_ID) -> bool ---;
	entity_type                  :: proc(ctx: ^Ctx, entity: Entity_ID) -> u32 ---;
	entity_destroy               :: proc(ctx: ^Ctx, entity: Entity_ID) ---;
	entity_fetch                 :: proc(ctx: ^Ctx, entity: Entity_ID) -> ^Entity ---;
	entity_query                 :: proc(ctx: ^Ctx, entity: Entity_ID, result: ^^Entity_ID) -> uint ---;
	entity_find                  :: proc(ctx: ^Ctx, peer: ^enet.Peer) -> ^Entity ---;
	entity_visibility_set        :: proc(ctx: ^Ctx, entity: Entity_ID, state: bool) ---;
	entity_visibility_set_for    :: proc(ctx: ^Ctx, entity: Entity_ID, target: Entity, state: bool) ---;
	entity_visibility_get        :: proc(ctx: ^Ctx, entity: Entity_ID) -> bool ---;
	entity_visibility_get_for    :: proc(ctx: ^Ctx, entity: Entity_ID, target: Entity) -> bool ---;
	entity_control_set           :: proc(ctx: ^Ctx, entity: Entity_ID, peer: ^enet.Peer) ---;
	entity_control_get           :: proc(ctx: ^Ctx, entity: Entity_ID) -> ^enet.Peer ---;
	entity_control_remove        :: proc(ctx: ^Ctx, entity: Entity_ID) ---;
	entity_iterate               :: proc(ctx: ^Ctx, flags: u64, callback: Entity_Proc) ---;

	event_add                    :: proc(ctx: ^Ctx, event_id: Event_Types, callback: Event_Proc) -> u64 ---;
	event_remove                 :: proc(ctx: ^Ctx, event_id: Event_Types, index: u64) ---;
	event_trigger                :: proc(ctx: ^Ctx, event_id: Event_Types, event: ^Event) ---;
	event_reject                 :: proc(event: ^Event) ---;
	event_rejectable             :: proc(event: ^Event) -> i32 ---;
	event_succeeded              :: proc(event: ^Event) ---;

	data_init                    :: proc(data: ^Data) ---;
	data_init_size               :: proc(data: ^Data, size: uint) ---;
	data_free                    :: proc(data: ^Data) ---;
	data_reset                   :: proc(data: ^Data) ---;
	data_grow                    :: proc(data: ^Data, min_size: uint) ---;
	data_capacity                :: proc(data: ^Data) -> uint ---;
	data_get_rpos                :: proc(data: ^Data) -> uint ---;
	data_get_wpos                :: proc(data: ^Data) -> uint ---;
	data_set_rpos                :: proc(data: ^Data, position: uint) ---;
	data_set_wpos                :: proc(data: ^Data, position: uint) ---;
	data_rptr                    :: proc(data: ^Data, ptr: rawptr, size: uint) ---;
	data_wptr                    :: proc(data: ^Data, ptr: rawptr, size: uint) ---;
	data_rptr_at                 :: proc(data: ^Data, ptr: rawptr, size: uint, position: uint) ---;
	data_wptr_at                 :: proc(data: ^Data, ptr: rawptr, size: uint, position: uint) ---;

	is_connected                 :: proc(ctx: ^Ctx) -> bool ---;
	network_start                :: proc(ctx: ^Ctx, address: Address) ---;
	network_stop                 :: proc(ctx: ^Ctx) ---;
	network_add                  :: proc(ctx: ^Ctx, message_id: u64, message_callback: Message_Proc) ---;
	network_remove               :: proc(ctx: ^Ctx, message_id: u64) ---;
	network_send_all             :: proc(ctx: ^Ctx, data: ^rawptr, size: uint) ---;
	network_send_to              :: proc(ctx: ^Ctx, peer: ^enet.Peer, data: ^rawptr, size: uint) ---;
	network_send_except          :: proc(ctx: ^Ctx, peer: ^enet.Peer, data: ^rawptr, size: uint) ---;
	network_send_instream        :: proc(ctx: ^Ctx, entity: u64, data: ^rawptr, size: uint) ---;
	network_send_instream_except :: proc(ctx: ^Ctx, entity: u64, peer: ^enet.Peer, data: ^rawptr, size: uint) ---;
}

data_write :: proc(data: ^Data, value: $T) {
	ptr := &value;
	data_wptr(data, ptr, size_of(value));
}

data_read :: proc(data: ^Data, value: ^$T) {
	ptr := value;
	data_rptr(data, ptr, size_of(value^));
}

make_address :: proc(host_name: string, port: i32) -> Address {
	return Address{port, &host_name[0]};
}

Options :: enum i32 {
	Platform_Id,
	Platform_Protocol,
	Platform_Build,

	Default_Client_Type,
	Default_Stream_Range,
	Default_Data_Size,

	Network_Capacity,
	Network_Channels,
	Network_Primary_Channel,
	Network_Secondary_Channel,
	Network_Message_Channel,

	Network_Max_Entities_Per_Branch,
	Network_Max_Threads_Per_Update,

	Options_Size,
}

Event_Types :: enum i32 {
	Connection_Init,
	Connection_Request,
	Connection_Refuse,
	Connection_Accept,
	Connection_Disconnect,

	Entity_Create,
	Entity_Update,
	Entity_Remove,
	Client_Streamer_Add,
	Client_Streamer_Remove,
	Client_Streamer_Update,

	First_Free,
}

FIRST_FREE_EVENT :: Event_Types.First_Free;

Entity_Flags :: enum i32 {
	None       = 0,
	Alive      = (1 << 0),
	Client     = (1 << 1),
	Ignoring   = (1 << 2),
	Queried    = (1 << 3),
	Controlled = (1 << 4),
}

Event_Flags :: enum i32 {
	None       = 0,
	Rejected   = (1 << 0),
	Rejectable = (1 << 1),
	Remote     = (1 << 2),
	Local      = (1 << 3),
}

Data :: struct #ordered {
	data: rawptr,
	cap,
	read_pos,
	write_pos: uint,

	allocator: Allocator,
}

Entity :: struct #ordered {
	id: u32,
	kind: u32,
	flags: u64,

	position: Vector3,
	stream_range: f32,

	user_data: rawptr,
	stream_branch: ^Streamer,

	ignored, last_snapshot: Hash_Map,

	client_peer, control_peer: ^enet.Peer,

	last_query: rawptr
}

Address :: struct #ordered {
	port: i32,
	host: ^u8,
}

Message :: struct #ordered {
	ctx: ^Ctx,
	data: ^Data,
	peer: ^enet.Peer,
	packet: ^enet.Packet,
	user_data: rawptr,
}

Event     :: struct #ordered {
	ctx: ^Ctx,
	data: ^Data,
	peer: ^enet.Peer,
	entity: ^Entity,
	flags: Event_Flags,
	user_data: rawptr,
}

Vector3   :: struct #ordered {
	x, y, z: f32,
}

Bounds    :: struct #ordered {
	centre, half_size: Vector3,
}

Streamer  :: struct #ordered {
	allocator: Allocator,
	max_nodes: u32,
	dimensions: int,
	boundary: Bounds,
	min_bounds: Vector3,
	use_min_bounds: u32,
	nodes: rawptr,
	free_nodes: rawptr,
	free_node_count: uint,
	trees: rawptr,
}

Hash_Map     :: struct #ordered {
	hashes, entries: rawptr,
}

Ctx       :: struct #ordered {
	mode: u16,
	tick_delay: u16,

	max_connections: u16,
	max_entities: u32,
	world_size, min_branch_size: Vector3,

	last_update: f32,
	user_data: rawptr,

	network: struct #ordered {
		peer: ^enet.Peer,
		host: ^enet.Host,

		connected_peers: Hash_Map,
	},

	entity: struct #ordered {
		count: u32,
		cursor: u32,
		ignored: Hash_Map,
		list: rawptr,
		remove_queue: rawptr,
	},

	streams: struct #raw_union {
		using stream: struct {
			input, output: Data,
			upd_reliable,
			upd_unreliable: Data,
		},

		streams: [DATA_STREAMS_AMOUNT]Data,
	},

	messages: rawptr,

	allocator: Allocator,
	timers: rawptr,
	events: rawptr,
	streamer: Streamer,
}

Message_Proc   :: #type proc(msg: ^Message);
Entity_Proc    :: #type proc(ctx: ^Ctx, entity: ^Entity);
Event_Proc     :: #type proc(event: ^Event);

MODE_SERVER :: 0;
MODE_CLIENT :: 1;

DATA_STREAMS_AMOUNT :: 4;

Entity_ID :: u32;