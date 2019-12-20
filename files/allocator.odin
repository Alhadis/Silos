import gc "boehm.odin"
using import "core:c.odin"

create_gc :: proc() -> Allocator {
	/* if !gc.is_init_called() do */ gc.init();
	return Allocator {
		procedure = gc_allocator_proc,
		data = nil,
	};
}

gc_allocator_proc :: proc(allocator_data: rawptr, mode: Allocator_Mode,
                          size, alignment: int,
                          old_memory: rawptr, old_size: int, flags: u64) -> rawptr {
	using Allocator_Mode;

	switch mode {
	case Alloc:
		return gc.malloc(c_size_t(size));

	case Free:
		gc.free(old_memory);
		return nil;

	case FreeAll:
		// NOTE(zachary): Does nothing

	case Resize:
		ptr := gc.realloc(old_memory, c_size_t(size));
		assert(ptr != nil);
		return ptr;
	}

	return nil;
}