`ifndef GATES
`define GATES

module BUF(output Y, input A);
	buf #1 g0(Y, A);
endmodule

module NOT(output Y, input A);
	not #1 g0(Y, A);
endmodule

module NAND(output Y, input A, B);
	nand #2 g0(Y, A, B);
endmodule

module AND(output Y, input A, B);
	and #3 g0(Y, A, B);
endmodule

module NOR(output Y, input A, B);
	nor #2 g0(Y, A, B);
endmodule

module OR(output Y, input A, B);
	or #3 g0(Y, A, B);
endmodule

module XOR(output Y, input A, B);
	xor #5 g0(Y, A, B);
endmodule

module AND4(output Y, input A, B, C, D);
	wire w0, w1;
	AND g0(w0, A, B);
	AND g1(w1, C, D);
	AND g2(Y, w0, w1);
endmodule

module OR4(output Y, input A, B, C, D);
	wire w0, w1;
	OR g0(w0, A, B);
	OR g1(w1, C, D);
	OR g2(Y, w0, w1);
endmodule

module AND3(output Y, input A, B, C);
	wire w0;
	AND g0(w0, A, B);
	AND g1(Y, w0, C);
endmodule

module OR3(output Y, input A, B, C);
	wire w0;
	OR g0(w0, A, B);
	OR g1(Y, w0, C);
endmodule

`endif