module cos8(out, a);
	localparam SIZE = 8;
	localparam MSB = SIZE - 1;

	input signed [(SIZE-1):0] a;
	output signed [(SIZE-1):0] out;

	assign out=sqrt(a);
endmodule
