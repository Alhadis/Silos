`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:48:20 02/27/2017 
// Design Name: 
// Module Name:    asm_ex 
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
module asm_ex(
    input clk, start, reset,
	 input [3:0] din,
	 output reg [6:0] dout,
	 output reg done_tick
);

//state register
reg [1:0] next_s, current_s;
//data registers
reg [3:0] next_n, n;
reg [6:0] next_fn, fn; // next_fn = f(n), fn = f(n-1)

localparam idle=2'b00, op=2'b01, done=2'b10;

//register bahavior
always @(posedge clk, posedge reset)
if (reset) 
	begin
		current_s <= idle;
		n <= 0;
		fn <= 1;
	end	
else
	begin
		current_s <= next_s;
		n <= next_n;
		fn <= next_fn;
	end	

//combinational logic circuit
always @* begin
	next_s = current_s;
	next_n = n;
	next_fn = fn;
	done_tick = 0;
	dout = 0;
	case(current_s)
		idle: 
			begin
				next_n=0;
				next_fn=1;
				next_s = (start) ? ((din==0) ? done:op) : idle;
			end
		op:
			begin
				next_n = n + 1;
				next_fn = fn + 5;
				next_s = (n==din) ? done : op;
			end
		done:
			begin
				done_tick = 1'b1;
				dout = fn;
				next_s  = idle;
			end
		default: next_s = idle;	
	endcase //end next_state logic
end //end always
	
endmodule
