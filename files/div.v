// Uses overflow detection from https://stackoverflow.com/a/24587824

module div8(out, a, b);
	localparam SIZE = 8;
	localparam MSB = SIZE - 1;

	input signed [(SIZE-1):0] a;
	input signed [(SIZE-1):0] b;
	output signed [(SIZE-1):0] out;

	assign out = a / b;
endmodule

module div16(out, a, b);
	localparam SIZE = 16;
	localparam MSB = SIZE - 1;

	input signed [(SIZE-1):0] a;
	input signed [(SIZE-1):0] b;
	output signed [(SIZE-1):0] out;

	assign out = a / b;
endmodule