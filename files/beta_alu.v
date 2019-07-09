// beta_alu.v
//
// tom@fors.net, November 25, 2016
//
// Purpose:
//   32-bit ALU for Beta CPU


module beta_alu (
	input      [31:0] a,
	input      [31:0] b,
	input       [5:0] fn,

	output     [31:0] y
);

function mux4;
    input [3:0] a;
    input [1:0] sel;
    begin
        if (sel == 2'b00) mux4 = a[0];
        else if (sel == 2'b01) mux4 = a[1];
        else if (sel == 2'b10) mux4 = a[2];
        else if (sel == 2'b11) mux4 = a[3];
    end
endfunction

wire [31:0] shift_w;
alu_shift shift_i (
	.a(a),
	.b(b[4:0]),
	.sfn(fn[1:0]),
	.y(shift_w)
);

wire [31:0] bool_w;
alu_bool bool_i (
	.a(a),
	.b(b),
	.bfn(fn[3:0]),
	.y(bool_w)
);

wire [31:0] arith_w;
wire z, v, n;
alu_arith arith_i (
	.a(a),
	.b(b),
	.afn(fn[0]),
	.z(z),
	.v(v),
	.n(n),
	.s(arith_w)
);

wire [31:0] cmp_w;
alu_cmp cmp_i (
	.z(z),
	.v(v),
	.n(n),
	.cfn(fn[2:1]),
	.y(cmp_w)
);

generate
    genvar i;
    for (i=0; i<32; i=i+1) begin: loop_gen_block
        assign y[i] = mux4({shift_w[i], bool_w[i], arith_w[i], cmp_w[i]}, fn[5:4]);
    end
endgenerate

endmodule
