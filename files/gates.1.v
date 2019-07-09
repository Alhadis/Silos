//Declare Inverter 
module _inv(a,y);

input a;		//Declare input data a and output data y
output y;

assign y=~a;		//output y = reverse of input a

endmodule


//Declare 2-input And gate
module _and2(a,b,y);

input a,b;	//Declare input data a,b and output data y
output y;

assign y=a&b;	//output y = product of input a,b

endmodule

//Declare 2-input Or gate
module _or2(a,b,y);

input a,b;	//Declare input data a,b and output data y
output y;

assign y=a|b;	//output y = sum of input a, b

endmodule

//Declare 2-input Nand gate
module _nand2(a,b,y);

input a,b;	//Declare input data a,b and output data y
output y;

assign y=~(a&b);	//output y = reverse of product of input a,b

endmodule

//Declare 2-input Xor gate
module _xor2(a,b,y);

input a,b;	//Declare input data a,b and output data y
output y;

wire [3:0]w;	//Declare wire w[0]~w[3]

_inv a0_inv (a, w[0]);				//Inverter module instance a0_inv
_inv b0_inv (b, w[1]);				//Inverter module instance b0_inv
_and2 I0_and2 (a, w[1], w[2]);	//2-input And module instance I0_and2
_and2 I1_and2 (b, w[0], w[3]);	//2-input And module instance I1_and2
_or2 I2_or2 (w[2], w[3], y);		////2-input Or module instance I2_and2

endmodule

//Declare 3-input And gate
module _and3(a,b,c,y);

//Declare input data a,b,c and output data y
input a,b,c;
output y;

assign y=a&b&c;	//output y = product of input a,b,c

endmodule

//Declare 4-input And gate
module _and4(a,b,c,d,y);

//Declare input data a,b,c,d and output data y
input a,b,c,d;
output y;

assign y=a&b&c&d;	//output y = product of input a,b,c,d

endmodule

//Declare 5-input And gate
module _and5(a,b,c,d,e,y);

//Declare input data a,b,c,d,e and output data y
input a,b,c,d,e;
output y;

assign y=a&b&c&d&e;	//output y = product of input a,b,c,d,e

endmodule

//Declare 3-input Or gate
module _or3(a,b,c,y);

//Declare input data a,b,c and output data y
input a,b,c;
output y;

assign y=a|b|c;	//output y = sum of input a,b,c

endmodule

//Declare 4-input Or gate
module _or4(a,b,c,d,y);

//Declare input data a,b,c,d and output data y
input a,b,c,d;
output y;

assign y=a|b|c|d;	//output y = sum of input a,b,c,d

endmodule

//Declare 5-input Or gate
module _or5(a,b,c,d,e,y);

input a,b,c,d,e;	//Declare input data a,b,c,d,e and output data y
output y;

assign y=a|b|c|d|e;	//output y = sum of input a,b,c,d,e

endmodule

//Declare 3-input Xor gate
module _xor3(a,b,c,y);

//Declare input data a,b,c and output data y
input a,b,c;
output y;

wire w;

//two instance _xor2 with three inputs and wire w
_xor2 U0_xor2(.a(a), .b(b), .y(w));
_xor2 U1_xor2(.a(c), .b(w), .y(y));

endmodule

//Declare 4-bit inverter
module _inv_4bits(a,y);
	//Declare 4-bit in/output data
	input [3:0] a;
	output [3:0] y;

	assign y=~a;	//output y = reverse of input a
endmodule

//Declare 4-bit 2-input And gate
module _and2_4bits(a,b,y);
	//Declare 4-bit input data a,b and output data y
	input [3:0] a,b;
	output [3:0] y;
	
	assign y=a&b;	//output y = product of input a,b
endmodule

//Declare 4-bit 2-input Or gate
module _or2_4bits(a,b,y);
	//Declare 4-bit input data a,b and output data y
	input [3:0] a,b;
	output [3:0] y;
	
	assign y=a|b;	//output y = sum of input a, b
endmodule

//Declare 4-bit 2-input Xor gate
module _xor2_4bits(a,b,y);
	//Declare 4-bit input data a,b and output data y
	input [3:0] a,b;
	output [3:0] y;
	
	//each bit instance _xor2 gate 
	_xor2 U0_xor2(.a(a[0]), .b(b[0]), .y(y[0]));
	_xor2 U1_xor2(.a(a[1]), .b(b[1]), .y(y[1]));
	_xor2 U2_xor2(.a(a[2]), .b(b[2]), .y(y[2]));
	_xor2 U3_xor2(.a(a[3]), .b(b[3]), .y(y[3]));
endmodule

//Declare 4-bit 2-input Xnor gate
module _xnor2_4bits(a,b,y);
	//Declare 4-bit input data a,b,output data y and wire
	input [3:0] a,b;
	output [3:0] y;
	wire [3:0] w0;
	
	//instance _xor2_4bits, _inv_4bits modules 
	_xor2_4bits U0_xor2_4bits(.a(a), .b(b), .y(w0));
	_inv_4bits U1_inv_4bits(.a(w0), .y(y));
endmodule

//Declare 32-bit inverter
module _inv_32bits(a,y);
	//Declare 32-bit in/output data
	input [31:0] a;
	output [31:0] y;

	assign y=~a;	//output y = reverse of input a
endmodule

//Declare 32-bit 2-input And gate
module _and2_32bits(a,b,y);
	//Declare 32-bit input data a,b and output data y
	input [31:0] a,b;
	output [31:0] y;

	assign y=a&b;	//output y = product of input a,b
endmodule

//Declare 32-bit 2-input Or gate
module _or2_32bits(a,b,y);
	//Declare 32-bit input data a,b and output data y
	input [31:0] a,b;
	output [31:0] y;

	assign y=a|b;	//output y = sum of input a, b
endmodule

//Declare 32-bit 2-input Xor gate
module _xor2_32bits(a,b,y); 
	//Declare 32-bit input data a,b and output data y
	input [31:0] a,b; 
	output [31:0] y; 
	
	//eight instance _xor2_4bits module with per 4-bits data
	_xor2_4bits U0_xor2_4bits(.a(a[3:0]), .b(b[3:0]), .y(y[3:0])); 
	_xor2_4bits U1_xor2_4bits(.a(a[7:4]), .b(b[7:4]), .y(y[7:4])); 
	_xor2_4bits U2_xor2_4bits(.a(a[11:8]), .b(b[11:8]), .y(y[11:8]));
	_xor2_4bits U3_xor2_4bits(.a(a[15:12]), .b(b[15:12]), .y(y[15:12])); 
	_xor2_4bits U4_xor2_4bits(.a(a[19:16]), .b(b[19:16]), .y(y[19:16])); 
	_xor2_4bits U5_xor2_4bits(.a(a[23:20]), .b(b[23:20]), .y(y[23:20])); 
	_xor2_4bits U6_xor2_4bits(.a(a[27:24]), .b(b[27:24]), .y(y[27:24])); 
	_xor2_4bits U7_xor2_4bits(.a(a[31:28]), .b(b[31:28]), .y(y[31:28])); 
endmodule

//Declare 32-bit 2-input Xnor gate
module _xnor2_32bits(a,b,y);
	//Declare 32-bit input data a,b and output data y
	input [31:0] a,b;
	output [31:0] y;

	//eight instance _xnor2_4bits module with per 4-bits data
	_xnor2_4bits U0_xnor2_4bits(.a(a[3:0]), .b(b[3:0]), .y(y[3:0]));
	_xnor2_4bits U1_xnor2_4bits(.a(a[7:4]), .b(b[7:4]), .y(y[7:4]));
	_xnor2_4bits U2_xnor2_4bits(.a(a[11:8]), .b(b[11:8]), .y(y[11:8]));
	_xnor2_4bits U3_xnor2_4bits(.a(a[15:12]), .b(b[15:12]), .y(y[15:12]));
	_xnor2_4bits U4_xnor2_4bits(.a(a[19:16]), .b(b[19:16]), .y(y[19:16]));
	_xnor2_4bits U5_xnor2_4bits(.a(a[23:20]), .b(b[23:20]), .y(y[23:20]));
	_xnor2_4bits U6_xnor2_4bits(.a(a[27:24]), .b(b[27:24]), .y(y[27:24]));
	_xnor2_4bits U7_xnor2_4bits(.a(a[31:28]), .b(b[31:28]), .y(y[31:28]));
endmodule

//Declare 2-input Nor gate
module _nor2(a,b,y);
	//declare two input and output y
	input a,b;
	output y;
	
	//y=not of sum of a and b
	assign y=~(a|b);
endmodule
