// Uses overflow detection from https://stackoverflow.com/a/24587824

module add8(overflow, out, a, b);
	localparam SIZE = 8;
	localparam MSB = SIZE - 1;

	input signed [(SIZE-1):0] a;
	input signed [(SIZE-1):0] b;
	wire extra;
	output overflow;
	output signed [(SIZE-1):0] out;

	assign {extra, out} = {a[MSB], a} + {b[MSB], b};
	assign overflow = extra ^ out[MSB];
endmodule

module add16(overflow, out, a, b);
	localparam SIZE = 16;
	localparam MSB = SIZE - 1;

	input signed [(SIZE-1):0] a;
	input signed [(SIZE-1):0] b;
	wire extra;
	output overflow;
	output signed [(SIZE-1):0] out;

	assign {extra, out} = {a[MSB], a} + {b[MSB], b};
	assign overflow = extra ^ out[MSB];
endmodule