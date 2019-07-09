module control
	(
		input reset_n,
		input go,
		input clk,
		input left,
		input right,
		input rotate,
		input down,
		output reg [7:0] X,
		output reg [6:0] Y,
		output reg [5:0] colour,
		output reg writeEn,
		output reg [7:0] total_score
	);
	
	localparam
		GET_PIECE = 5'd2,
		GET_PIECE_WAIT = 5'd3,
		DETECT_COLLISION = 5'd4,
		MOVE_PIECE = 5'd5,
		BUFFER = 5'd6,
		WRITE_TO_RAM = 5'd8,
		SETUP_ERASE_OLD = 5'd9,
		ERASE_OLD = 5'd10,
		SETUP_DRAW_NEW = 5'd11,
		DRAW_NEW = 5'd12,
		DRAW_NEW_WAIT = 5'd13,
		DRAW_RAM = 5'd14,
		ROW_CLEAR = 5'd15,
		BOARD_CLEAR = 5'd16,
		END_GAME = 5'd17;

	reg [4:0] curr_state, next_state;
	
	// The following wires are wired into the RAM module
	reg [7:0] ram_addr;
	reg [5:0] ram_in;
	wire [5:0] ram_out;
	reg ram_wren;
	
	ram_board board(ram_addr, clk, ram_in, ram_wren, ram_out);
	
	reg [3:0] curr_anc_X;
	reg [4:0] curr_anc_Y;
	reg [3:0] new_anc_X;
	reg [4:0] new_anc_Y;
	reg [2:0] curr_piece;
	reg [1:0] curr_rotation;
	reg [1:0] new_rotation;
	reg [2:0] piece_rng; // RNG for pieces

	reg [4:0] X_to_Draw;
	reg [5:0] Y_to_Draw;
	
	reg [7:0] module_select; // Determines which module we're currently using
	wire [7:0] module_complete; // 1 on the clock cycle where the module finishes computation (and this is when the results can be used)
	
	// 0 is detect collision
	// 1 is for draw piece
	// 2 is for rate divider
	// 3 is for adding to ram
	// 6 is for check rotation
	// 7 is for clear board
	
	/* MODULES */
	wire [7:0] collision_ram_addr;
	wire collides_left, collides_right, collides_down, collides_rotate;
	reg no_move;
	collision f(
		.enable(module_select[0]), 
		.X_anchor(curr_anc_X),
		.Y_anchor(curr_anc_Y), 
		.block(curr_piece),
		.curr_rotation(curr_rotation),
		.clk(clk), 
		.ram_Q(ram_out), 
		.collides_left(collides_left),
		.collides_right(collides_right),
		.collides_down(collides_down),
		.collides_rotate(collides_rotate),
		.ram_addr(collision_ram_addr), 
		.complete(module_complete[0])
	);
	
	reg draw_clear;
	wire [7:0] draw_x;
	wire [6:0] draw_y;
	wire [5:0] draw_colour;
	draw_tetromino draw (
		.enable(module_select[1]),
		.block(curr_piece),
		.rotation(curr_rotation),
		.X_in(X_to_Draw), 
		.Y_in(Y_to_Draw),
		.clear(draw_clear),
		.clk(clk), 
		.X_vga(draw_x), 
		.Y_vga(draw_y), 
		.colour_out(draw_colour),
		.complete(module_complete[1])
	);
	
	rate_divider rd(
		.enable(module_select[2]),
		.score(total_score),
		.down(down),
		.clk(clk),
		.rd(module_complete[2])
	);

	wire [7:0] atr_ram_addr;
	wire [5:0] atr_ram_data;
	wire atr_ram_wren;
	add_to_ram atr(
		.enable(module_select[3]),
		.x_anc(new_anc_X),
		.y_anc(new_anc_Y),
		.block(curr_piece),
		.rotation(curr_rotation),
		.clk(clk),
		.ram_addr(atr_ram_addr),
		.wren(atr_ram_wren),
		.data(atr_ram_data),
		.complete(module_complete[3])
	);
	
	wire [7:0] draw_ram_addr;
	wire [7:0] draw_r_x;
	wire [6:0] draw_r_y;
	wire [5:0] draw_r_colour;
	draw_ram draw_r (
		.enable(module_select[4]),
		.clk(clk),
		.ram_Q(ram_out),
		.X(draw_r_x),
		.Y(draw_r_y),
		.colour(draw_r_colour),
		.ram_addr(draw_ram_addr),
		.complete(module_complete[4])
	);
	
	wire [7:0] clr_ram_addr;
	wire [5:0] clr_ram_data;
	wire clr_ram_wren;
	wire [1:0] rows_cleared;
	row_clear rowclr (
        .enable(module_select[5]),
        .clk(clk),
        .ram_Q(ram_out),
        .ram_addr(clr_ram_addr), 
        .ram_data(clr_ram_data),
        .ram_wren(clr_ram_wren),
		  .rows_cleared(rows_cleared),
        .complete(module_complete[5])
    );

	wire [7:0] clr_board_addr;
	wire [5:0] clr_board_data;
	wire clr_board_wren;
	clear_ram clean_board(
		.enable(module_select[7]),
		.clk(clk),
		.ram_addr(clr_board_addr),
		.wren(clr_board_wren),
		.data(clr_board_data),
		.complete(module_complete[7])
	);

	always @(*)
   	begin: state_table
		case (curr_state)
			GET_PIECE: next_state = GET_PIECE_WAIT; 
			GET_PIECE_WAIT : next_state = DETECT_COLLISION;
			DETECT_COLLISION: next_state = module_complete[0] ? MOVE_PIECE : DETECT_COLLISION;
			MOVE_PIECE: next_state = no_move ? (curr_anc_Y == 5'd1 ? END_GAME : WRITE_TO_RAM) : SETUP_ERASE_OLD;
			END_GAME: next_state = BOARD_CLEAR;
			WRITE_TO_RAM: next_state = module_complete[3] ? ROW_CLEAR : WRITE_TO_RAM;
			ROW_CLEAR: next_state = module_complete[5] ? DRAW_RAM : ROW_CLEAR;
			DRAW_RAM: next_state = module_complete[4] ? GET_PIECE : DRAW_RAM;
			SETUP_ERASE_OLD: next_state = ERASE_OLD;
			ERASE_OLD: next_state = module_complete[1] ? BUFFER : ERASE_OLD;
			BUFFER: next_state = SETUP_DRAW_NEW;
			SETUP_DRAW_NEW: next_state = DRAW_NEW;
			DRAW_NEW: next_state = module_complete[1] ? DRAW_NEW_WAIT : DRAW_NEW;
			DRAW_NEW_WAIT: next_state = module_complete[2] ? DETECT_COLLISION : DRAW_NEW_WAIT;
			BOARD_CLEAR: next_state = module_complete[7] && go ? DRAW_RAM : BOARD_CLEAR;
			default: next_state = BOARD_CLEAR;
		endcase
   end // state_table

	always @(*) 
	begin: enable_signals
		// Setting default values for all these signals
		X_to_Draw = 3'b000;
		Y_to_Draw = 3'b000;
		module_select = 8'b00000000;
		writeEn = 1'b0;
		ram_addr = 8'b00000000;
		draw_clear = 1'b1;
		X = draw_x;
		Y = draw_y;
		colour = draw_colour;
		ram_in = 6'b000000;
		ram_wren = 1'b0;
		case (curr_state)
			BOARD_CLEAR: begin
				ram_addr = clr_board_addr;
				ram_in = clr_board_data;
				ram_wren = clr_board_wren;
				module_select = 8'b10000000;
			end
			DETECT_COLLISION: begin
				ram_addr = collision_ram_addr;
				module_select = 8'b00000001;
			end
			MOVE_PIECE: begin
				module_select = 8'b00000001;
			end
			WRITE_TO_RAM: begin
				ram_addr = atr_ram_addr;
				ram_in = atr_ram_data;
				ram_wren = atr_ram_wren;
				module_select = 8'b00001000;
			end
			ROW_CLEAR: begin
				ram_addr = clr_ram_addr;
				ram_in = clr_ram_data;
				ram_wren = clr_ram_wren;
				module_select = 8'b00100000;
			end
			DRAW_RAM: begin
				ram_addr = draw_ram_addr; 
				module_select = 8'b00010000;
				X = draw_r_x;
				Y = draw_r_y;
				colour = draw_r_colour;
				writeEn = 1'b1;
			end
			SETUP_ERASE_OLD: begin
				X_to_Draw = curr_anc_X;
				Y_to_Draw = curr_anc_Y;
				module_select = 8'b00000010; 
			end
			ERASE_OLD: begin
				X_to_Draw = curr_anc_X;
				Y_to_Draw = curr_anc_Y;
				X = draw_x;
				Y = draw_y;
				writeEn = 1'b1;
				module_select = 8'b00000010;
			end
			BUFFER: begin
			end
			SETUP_DRAW_NEW: begin
				X_to_Draw = new_anc_X;
				Y_to_Draw = new_anc_Y;
				module_select = 8'b00000010;
			end
			DRAW_NEW: begin
				X_to_Draw = new_anc_X;
				Y_to_Draw = new_anc_Y;
				draw_clear = 1'b0;
				module_select = 8'b00000010;
				X = draw_x;
				Y = draw_y;
				writeEn = 1'b1;
			end
			DRAW_NEW_WAIT: begin
				module_select = 8'b00000100;
			end
			default: begin
			end
		endcase
	end
	
	always @(posedge clk) begin
		if (~reset_n) begin 
			curr_state <= BOARD_CLEAR;
			curr_anc_X <= 4'd4;
			curr_anc_Y <= 5'd0;
			piece_rng <= 3'b000;
			no_move <= 1'b0;
		end
		else begin

			curr_state <= next_state;

			if (piece_rng < 3'b110) piece_rng <= piece_rng + 1'b1;
			else piece_rng <= 3'b000;
			
			if (curr_state == BOARD_CLEAR) total_score <= 4'b0;

			if (curr_state == MOVE_PIECE) begin
				if (rotate && !collides_rotate) begin
					new_rotation <= curr_rotation + 1'b1;
					no_move <= 1'b0;
				end
				else if (left && !collides_left) begin
					new_anc_Y <= curr_anc_Y;
					new_anc_X <= curr_anc_X - 1'b1;
					no_move <= 1'b0;
				end
				else if (right && !collides_right) begin
					new_anc_Y <= curr_anc_Y;
					new_anc_X <= curr_anc_X + 1'b1;
					no_move <= 1'b0;
				end
				else if (!collides_down) begin
					new_anc_Y <= curr_anc_Y + 1'b1;
					new_anc_X <= curr_anc_X;
					no_move <= 1'b0;
				end
				else no_move <= 1'b1;
			end
			
			if (curr_state == ROW_CLEAR) begin
				if (module_complete[5]) total_score <= total_score + rows_cleared;
			end
			
			if (curr_state == SETUP_DRAW_NEW) begin
				curr_rotation <= new_rotation;
			end
			
			if (curr_state == DRAW_NEW_WAIT) begin
				curr_anc_X <= new_anc_X;
				curr_anc_Y <= new_anc_Y;
			end
			
			if (curr_state == GET_PIECE) begin
				// Reset X and Y back to the top
				curr_piece <= piece_rng;
				curr_rotation <= 2'b00;
				new_rotation <= 2'b00;
				curr_anc_X <= 4'd4;
				curr_anc_Y <= 1'd0;
				no_move <= 1'b0;
			end
		end
	end
endmodule
