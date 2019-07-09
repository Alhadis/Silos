module mul8(out, a, b);
	localparam SIZE = 8;

	input  signed [(SIZE-1):0]   a;
	input  signed [(SIZE-1):0]   b;
	output signed [(2*SIZE-1):0] out;

	assign out = a * b;
endmodule

module mul16(out, a, b);
	localparam SIZE = 16;

	input  signed [(SIZE-1):0]   a;
	input  signed [(SIZE-1):0]   b;
	output signed [(2*SIZE-1):0] out;

	assign out = a * b;
endmodule
