package main

import "core:fmt"
import "core:math/bits"
import "core:strings"

@static input := #load("../input/day08");

IMAGE_WIDTH  :: 25;
IMAGE_HEIGHT :: 6;
IMAGE_SIZE   :: IMAGE_WIDTH * IMAGE_HEIGHT;

ImagePixelColor :: enum {
	Black = 0,
	White = 1,
	Transparent = 2,
}

ImageLayer :: struct {
	checksum: int,
	digits:   []u8,
};

count_digits :: proc(layer: []u8) -> (n0, n1, n2: int) {
	for v, _ in layer {
		switch v {
		case '0': n0 += 1;
		case '1': n1 += 1;
		case '2': n2 += 1;
		}
	}
	return;
}

main :: proc() {
	// --- Part 1 ---
	image_num_digits := len(input) - 1;
	image_num_layers := image_num_digits / IMAGE_SIZE;
	image_layers := make([dynamic]ImageLayer, image_num_layers);

	min_n0 := bits.I32_MAX;
	layer_min_n0: int;

	layer_off := 0;
	layer_len := IMAGE_SIZE;
	for _, i in image_layers {
		input_slice := input[layer_off:][:layer_len];
		n0, n1, n2 := count_digits(input_slice);
		if n0 < min_n0 do min_n0, layer_min_n0 = n0, i;
		image_layers[i].checksum = n1 * n2;
		image_layers[i].digits = input_slice;
		layer_off += layer_len;
	}

	fmt.println("day08 part1", image_layers[layer_min_n0].checksum);


	// --- Part 2 ---
	image_pixels: [IMAGE_SIZE]ImagePixelColor = ImagePixelColor.Transparent;
	for _, layer_index in image_layers {
		for y := 0; y < IMAGE_HEIGHT; y += 1 {
			for x := 0; x < IMAGE_WIDTH; x += 1 {
				i := x + y*IMAGE_WIDTH;
				if image_pixels[i] == ImagePixelColor.Transparent {
					image_pixels[i] = cast(ImagePixelColor)(image_layers[layer_index].digits[i] - '0');
				}
			}
		}
	}

	ANSI_BLACK :: "\x1b[30m";
	ANSI_WHITE :: "\x1b[97m";
	ANSI_MAGENTA :: "\x1b[35m";
	ANSI_RESET :: "\x1b[0m";

	fmt.println("day08 part2");
	for y := 0; y < IMAGE_HEIGHT; y += 1 {
		for x := 0; x < IMAGE_WIDTH; x += 1 {
			i := x + y*IMAGE_WIDTH;
			if image_pixels[i] == ImagePixelColor.Black do fmt.printf("%s%s%s", ANSI_BLACK, "\u2588", ANSI_RESET);
			if image_pixels[i] == ImagePixelColor.White do fmt.printf("%s%s%s", ANSI_WHITE, "\u2588", ANSI_RESET);
			if image_pixels[i] == ImagePixelColor.Transparent do fmt.printf("%s%s%s", ANSI_MAGENTA, "\u2588", ANSI_RESET);
		}
		fmt.printf("\n");
	}
	fmt.printf("\n");
}
