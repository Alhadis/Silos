package calc

import "core:fmt"
using import "core:mem"

Multi_Arena_Allocator :: struct {
	arena_size: int,
	arenas: [dynamic][]byte,
	unused_arenas: [dynamic][]byte,
	current_offset: int,

	backing_allocator: Allocator,
}

multi_arena_allocator :: proc(arena: ^Multi_Arena_Allocator) -> Allocator {
	assert(arena.arena_size > 0, "arena_size is not set!");
	return Allocator {
		procedure = multi_arena_allocator_proc,
		data = arena,
	};
}

@private
multi_arena_allocator_proc :: proc(
		allocator_data: rawptr, mode: Allocator_Mode,
        size, alignment: int,
        old_memory: rawptr, old_size: int, flags: u64 = 0, loc := #caller_location
	) -> rawptr {

	multi_arena_allocator := cast(^Multi_Arena_Allocator) allocator_data;
	using multi_arena_allocator;

	using Allocator_Mode;
	switch mode {
	case Alloc:
		if size+15 > arena_size {
			fmt.panicf("Trying to allocate memory bigger than the arena_size! arena_size: %v, size+15: %v", arena_size, size+15);
		}

		if current_offset + size + 15 >= arena_size {
			// we need a new block
			if len(unused_arenas) > 0 {
				append(&arenas, pop(&unused_arenas));
			} else {
				//a := 
				append(&arenas, make([]byte, arena_size));
			}
			offset := align_forward_uintptr(uintptr(0), uintptr(alignment));
			current_offset = int(offset) + size;
			ptr := &arenas[offset];
			zero(ptr, size);
			return ptr;
		} else {
			// plenty of space
			offset := align_forward_uintptr(uintptr(current_offset), uintptr(alignment));
			current_offset = int(offset) + size;
			ptr := &arenas[offset];
			zero(ptr, size);
			return ptr;
		}

	case Free_All:
		for a in arenas {
			append(&unused_arenas, a);
		}
		clear(&arenas);
	case Free:
		// We just pretend we actuallt freed the thing
	case:
		fmt.panicf("Multi_Arena_Allocator does not support '%v'", mode);
	}

	return nil;
}