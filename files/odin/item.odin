package main

import "core:fmt"

MAX_STACK_SIZE :: 64;

ItemType :: enum u8 {
	LOG,
	PLANK,
	STICK,
	SAWDUST,

	GLOWSTONE,
	GLOWSTONE_DUST,

	REDSTONE_ORE,
	REDSTONE_DUST,

	LAPIS_ORE,
	LAPIS_LAZULI,

	COAL_ORE,
	COAL,

	IRON_ORE,
	STEEL_ORE,
	COPPER_ORE,
	TIN_ORE,
	LEAD_ORE,
	SILVER_ORE,
	GOLD_ORE,

	IRON_INGOT,
	STEEL_INGOT,
	COPPER_INGOT,
	TIN_INGOT,
	LEAD_INGOT,
	SILVER_INGOT,
	GOLD_INGOT,

	IRON_NUGGET,
	STEEL_NUGGET,
	COPPER_NUGGET,
	TIN_NUGGET,
	LEAD_NUGGET,
	SILVER_NUGGET,
	GOLD_NUGGET,

	TORCH,
	REDSTONE_TORCH,
}

ItemStack :: struct {
	type : ItemType,
	count : int
}

merge_stacks :: proc(stacks: ^[dynamic]ItemStack) {
	if len(stacks) == 1 do return;

	counts := make(map[ItemType]int);

	for input in stacks {
		count := input.count;

		value, ok := counts[input.type];
		if ok do count += value;

		counts[input.type] = count;
	}

	// This println is the only thing saving this code from certain death;
	// look at the output of this program and then comment this line and look again.
	fmt.println();

	clear(stacks);

	for k, v in counts {
		i := v;
		for i > MAX_STACK_SIZE {
			append(stacks, ItemStack{k, MAX_STACK_SIZE});
			i -= MAX_STACK_SIZE;
		}
		append(stacks, ItemStack{k, i});
	}
}