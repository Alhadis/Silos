package main

import rb "shared:odin-ring_buffer"

RecipeExecutorType :: enum u8 {
	CRAFTING_TABLE,
	FURNACE,
	SAWMILL
}

Recipe :: struct {
	executor: RecipeExecutorType
	inputs: []ItemStack,
	outputs: []ItemStack,
	cost: uint
}

RecipeExecutionRequest :: struct {
	recipe: ^Recipe
}

RecipeExecutionResult :: struct {

}

RecipeExecutor :: struct(type: RecipeExecutorType) {
	input_queue: rb.RingBuffer(8, RecipeExecutionRequest),
	output_queue: rb.RingBuffer(8, RecipeExecutionResult),

	active_job: ^Recipe,
	progress: uint
}