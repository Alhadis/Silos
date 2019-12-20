package main

import "core:fmt"

main :: proc() {
	c_ : Container(4);
	c := &c_;

	assert(insert(c, ItemStack{.IRON_INGOT, 42}) == 42);
	assert(insert(c, ItemStack{.GOLD_INGOT, 12}) == 12);
	assert(insert(c, ItemStack{.IRON_INGOT, 18}) == 18);
	assert(insert(c, ItemStack{.STICK, 13}) == 13);

	fmt.println(c, "\n");

	assert(insert(c, ItemStack{.IRON_INGOT, 3}) == 3);

	fmt.println(c, "\n");

	assert(insert(c, ItemStack{.IRON_INGOT, 2}) == 2);

	fmt.println(c, "\n");

	assert(insert(c, ItemStack{.GOLD_INGOT, 14}) == 14);

	fmt.println(c, "\n");

	assert(insert(c, ItemStack{.STICK, 12}) == 12);

	fmt.println(c, "\n");
}