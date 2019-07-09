`timescale 1ns / 1ps


module FIB #(WIDTH=6) (
    input clk,
    input rst,
    input [WIDTH-1:0] f0,
    input [WIDTH-1:0] f1,
    output [WIDTH-1:0] fn
    );

	wire [WIDTH-1:0] in, a, b, s, fn_2;

	Register #(.WIDTH(WIDTH)) Reg1(.clk(clk),.rst(rst),.en(1),.in(in),.out(fn_2));	// f(n-1)
	Register #(.WIDTH(WIDTH)) Reg2(.clk(clk),.rst(rst),.en(1),.in(s),.out(fn));		// f(n)

	assign a = fn ? fn_2 : f0;
	assign b = fn ? fn : f1;
	assign in = b;

	ALU #(.WIDTH(WIDTH)) adder(
		.a(a),
		.b(b),
		.sel('b000),
		.s(s)
		);
endmodule