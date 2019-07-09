`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:26:47 03/08/2017 
// Design Name: 
// Module Name:    babbage 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module babbage(
	input clk, reset,
	input start,
	input [3:0] i,
	output reg done_tick,
	output reg [3:0] f
	);

	// Symbolic state declaration
	localparam	[1:0] 
		idle 	= 2'b00,
		op 		= 2'b01,
		done 	= 2'b10;

	// Signal declaration
	reg state_reg, state_next;
	reg fn, fn_next;
	reg gn, gn_next;
	reg n, n_next;
	reg ready;
	
	// FSMD state and data registers
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			state_reg <= idle;
			n 	<= 0;
			fn 	<= 0;
			gn	<= 0;
		end	else begin
			state_reg <= state_next;
			n 	<= n_next;
			fn 	<= fn_next;
			gn	<= gn_next;
		end
	end
	
	// FSMD next-state logic
	always @(*) begin
		state_next 	= state_reg;
		n_next 		= n;
		fn_next 	= fn;
		gn_next		= gn;
		done_tick 	= 0;
		ready		= 0;
		f 			= 0;

		case (state_reg)
			idle:
				begin
					ready = 1'b0;
					if (start) begin
						n_next = i;
						fn_next = 5;
						gn_next = 5;
						state_next = op;
					end
				end
			op:
				if (n == 0) begin
					fn_next = fn;
					state_next = done;
				end else if (n == 1) begin
					n_next 	= n - 1;
					fn_next = fn + gn_next;
					gn_next = 5;
					state_next = op;
				end	else begin
					n_next = n - 1;
					fn_next = fn + gn_next;
					gn_next = gn + 4;
					state_next = op;
				end
			done:
				begin
					done_tick = 1'b1;
					f = fn;
					ready = 1'b1;
					state_next = (start) ? done : idle;
				end
			default: state_next = idle;	
		endcase 
	end

endmodule
