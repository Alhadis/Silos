package main

import "core:fmt"

Container :: struct(N: int) where N > 0 {
	stacks: [dynamic]ItemStack,
	merged: bool
}

insert :: proc(using c: ^Container($N), stack: ItemStack, allow_partial := true) -> int {
	// If we have free stack slots, just use one and be done.
	
	if len(stacks) < N {
		append(&stacks, stack);
		merged = false;
		return stack.count;
	}

	// If we don't have any free stacks, try merging the stacks
	// (if they aren't already merged) to see if we can free up a slot.
	
	if !merged {
		merge_stacks(&stacks);
		merged = true;

		if len(stacks) < N {
			append(&stacks, stack);
			merged = false;
			return stack.count;
		}
	}

	// We merged the stacks but didn't free up a slot (or didn't); our last hope is that we can add to a
	// slot that contains the same item type but isn't empty. This is where we may end up (if allowed)
	// adding a part of the stack but not the full thing.

	type := stack.type;
	count := stack.count;
	index := 0;
	for index < N && count > 0 {
		if stacks[index].type == type && stacks[index].count < MAX_STACK_SIZE {
			free := MAX_STACK_SIZE - stacks[index].count;
			n := min(free, count);
			count -= n;
			stacks[index].count += n;
		}
		index += 1;
	}

	return stack.count - count;
}