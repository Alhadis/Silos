import "core:fmt.odin"

import "ascii.odin"

main :: proc() {
	width := 80;
	height := 40;
	// ascii.init("ASCII :D", width, height, "fonts/bw_font.png", 8, 12, false, true);
	// ascii.init("ASCII :D", width, height, "fonts/Bisasam_16x16.png", 16, 16, false, true);
	ascii.init("ASCII :D", width, height, "fonts/CGA8x8thick.png", 8, 8, true, true);

	// Switch to event
	close := false;

	fps_buffer: [4096]u8;
	lastTime := cast(f32)ascii.get_time();
	for !close {
		glyph: ascii.Glyph;
		for y := 0; y < height; y += 1 {
			for x := 0; x < width; x += 1 {
				glyph.char += 1;
				if glyph.char >= 255 do glyph.char = 0;

				glyph.fg.r += 0.5 * lastTime;
				glyph.fg.g += 0.1 * lastTime;
				glyph.fg.b += 0.2 * lastTime;

				if glyph.fg.r >= 1 do glyph.fg.r = 0;
				if glyph.fg.g >= 1 do glyph.fg.g = 0;
				if glyph.fg.b >= 1 do glyph.fg.b = 0;

				/*glyph.bg.r += 0.1;
				glyph.bg.g += 0.1;
				glyph.bg.b += 0.1;*/

				ascii.set_glyph(x, y, glyph);
			}
		}
		draw_string :: proc(x, y: int, str: string, fg, bg: ascii.Color,) {
			for c in str {
				char := cast(u32)c;
				if char > 255 do char = 255;
				ascii.set_glyph(x, y, char, fg, bg);
				x += 1;
			}
		}
		draw_string(0, 0, "Hello, world!", ascii.WHITE, ascii.BLACK);
		

		now := cast(f32)ascii.get_time();
		frame_time := (now - lastTime)*1000;
		fps := 1 / (now - lastTime);
		draw_string(0, 1, fmt.bprintf(fps_buffer[..], "%f fps", fps), ascii.WHITE, ascii.BLACK);
		draw_string(0, 2, fmt.bprintf(fps_buffer[..], "%f frame time (ms)", frame_time), ascii.WHITE, ascii.BLACK);
		lastTime = now;

		draw_string(20, 10, "Velkommen til bords!", ascii.WHITE, ascii.BLACK);
		//ascii.draw_rect(20, 11, 10, 10, '#', ascii.WHITE, ascii.BLACK);
		ascii.draw_fancy_rect(20, 11, 10, 10, 205, 205, 186, 186, 201, 187, 200, 188, ascii.Color{0.2, 1, 0.7}, ascii.Color{0.1, 0.4, 1});

		draw_rofl_copter :: proc(x, y: int) {
			f1_line1 := "          :LOL:ROFL    ";
			f1_line2 := "         ___^_____     ";
			f1_line3 := "      __/      [] \\    ";
			f1_line4 := "LOL===__           \\   ";
			f1_line5 := "        \\___ ___ ___]  ";
			f1_line6 := "            I   I      ";
			f1_line7 := "          ----------/  ";

			f2_line1 := "      ROFL:LOL:        ";
			f2_line2 := "         ___^_____     ";
			f2_line3 := " L    __/      [] \\    ";
			f2_line4 := " O ===__           \\   ";
			f2_line5 := " L      \\___ ___ ___]  ";
			f2_line6 := "            I   I      ";
			f2_line7 := "          ----------/  ";

			width := len(f1_line1);
			height := 7;

			x -= width / 2;
			y -= height / 2;


			if cast(int)(ascii.get_time()*10) % 2 != 0 {
				draw_string(x, y,   f1_line1, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+1, f1_line2, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+2, f1_line3, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+3, f1_line4, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+4, f1_line5, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+5, f1_line6, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+6, f1_line7, ascii.WHITE, ascii.BLACK);
			} else {
				draw_string(x, y,   f2_line1, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+1, f2_line2, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+2, f2_line3, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+3, f2_line4, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+4, f2_line5, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+5, f2_line6, ascii.WHITE, ascii.BLACK);
				draw_string(x, y+6, f2_line7, ascii.WHITE, ascii.BLACK);
			}
		}
		draw_rofl_copter(30, 30);

		close = ascii.update_and_render();
		ascii.swap_buffers(); // Pull into update_and_render?
	}
}