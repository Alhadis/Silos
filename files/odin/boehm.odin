foreign import gc "system:gc"
using import "core:c.odin"

Event_Type :: enum {
	START /* COLLECTION */,
	MARK_START,
	MARK_END,
	RECLAIM_START,
	RECLAIM_END,
	END /* COLLECTION */,
	PRE_STOP_WORLD /* STOPWORLD_BEGIN */,
	POST_STOP_WORLD /* STOPWORLD_END */,
	PRE_START_WORLD /* STARTWORLD_BEGIN */,
	POST_START_WORLD /* STARTWORLD_END */,
	THREAD_SUSPENDED,
	THREAD_UNSUSPENDED
}

when size_of(rawptr) == 4 {
	word  :: #alias u32;
	sword :: #alias i32;
} else {
	word  :: #alias u64;
	sword :: #alias i64;
}

TIME_UNLIMITED : c_ulong : 999999;

@(link_prefix = "GC_")
foreign gc {
	set_on_collection_event :: proc(proc "c" (event: Event_Type)) ---;
	get_on_collection_event :: proc() -> proc "c" (event: Event_Type) ---;

	set_on_thread_event :: proc(proc "c" (event: Event_Type, thread_id: rawptr)) ---;
	get_on_thread_event :: proc() -> proc "c" (event: Event_Type, thread_id: rawptr) ---;

	set_find_leak :: proc(i32) ---;
	get_find_leak :: proc() -> i32 ---;

	set_full_freq :: proc(i32) ---;
	get_full_freq :: proc() -> i32 ---;

	set_time_limit :: proc(c_ulong) ---;
	get_time_limit :: proc() -> c_ulong ---;

	set_pages_executable :: proc(i32) ---;
	get_pages_executable :: proc() -> i32 ---;

	set_handle_fork :: proc(i32) ---;

	init   :: proc() ---;
	deinit :: proc() ---;


	malloc               :: proc(c_size_t) -> rawptr ---;
	malloc_atomic        :: proc(c_size_t) -> rawptr ---;
	malloc_uncollectable :: proc(c_size_t) -> rawptr ---;
	malloc_stubborn      :: proc(c_size_t) -> rawptr ---;

	strdup  :: proc(^u8) -> ^u8 ---;
	strndup :: proc(^u8, c_size_t) -> ^u8 ---;

	free :: proc(rawptr) ---;

	change_stubborn     :: proc(rawptr) ---;
	end_stubborn_change :: proc(rawptr) ---;

	base         :: proc(rawptr) -> rawptr ---;
	size         :: proc(rawptr) -> c_size_t ---;

	realloc :: proc(rawptr, c_size_t) -> rawptr ---;


	set_max_heap_size :: proc(word) ---;

	gcollect :: proc() ---;

	get_heap_size      :: proc() -> c_size_t ---;
	get_free_bytes     :: proc() -> c_size_t ---;
	get_unmapped_bytes :: proc() -> c_size_t ---;
	get_bytes_since_gc :: proc() -> c_size_t ---;
	get_total_bytes    :: proc() -> c_size_t ---;

	disable :: proc() ---;

	enable :: proc() ---;

	enable_incremental :: proc() ---;

	collect_a_little :: proc() -> i32 ---;
}
foreign gc {
	@(link_name = "GC_gcollect") collect :: proc() ---; // An alias to make the API seem more consistent.
	@(link_name = "GC_is_init_called")       _is_init_called :: proc() -> i32 ---;
	@(link_name = "GC_is_heap_ptr")          _is_heap_ptr :: proc(rawptr) -> i32 ---;
	@(link_name = "GC_expand_hp")            _expand_hp :: proc(c_size_t) -> i32 ---;
	@(link_name = "GC_is_disabled")          _is_disabled :: proc() -> i32 ---;
	@(link_name = "GC_is_incremental_mode")  _is_incremental_mode :: proc() -> i32 ---;
}

is_init_called :: inline proc() -> bool {
	return _is_init_called() != 0;
}

is_heap_ptr :: inline proc(ptr: rawptr) -> bool {
	return _is_heap_ptr(ptr) != 0;
}

expand_hp :: proc(size: c_size_t) -> bool {
	return _expand_hp(size) == 1;
}

is_disabled :: proc() -> bool {
	return _is_disabled() != 0;
}

is_incremental_mode :: proc() -> bool {
	return _is_incremental_mode() != 0;
}