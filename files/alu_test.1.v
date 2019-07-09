`timescale 1ns / 1ps
// 
module alu_test ();
	`include "risc_constants.vh"
	
	reg clock;
	reg signed [31:0] a, b;
	reg [5:0] fn;
	wire signed [31:0] alu_out;

	alu uut(a, b, fn, alu_out);

	initial begin   // system clock
		forever #10 clock = !clock;
	end

	initial begin
		clock = 0;
		a = 0;
		b = 0;
		fn = `alu_ADD;

		#100;

		a = 1;
		b = 1;

		#10 a = 2;
		#10 b = -1;
		#5 b = 3;
		fn = `alu_SUB;
		#10;
		
		$stop;
	end
endmodule
