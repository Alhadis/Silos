/*
By Artur Lach
4bit ALU can perform 10 different operations, operation output selected by opcode
*/


module ALU_4bit(in1, in2, cin, opcode, cout, out);
input [3:0] opcode, in1, in2;
input cin;
output [3:0] out;
output cout;
wire [3:0] add_sub_result;
wire[3:0] or_result;
wire[3:0] and_result;
wire[3:0] xor_result;
wire[3:0] not_result;
wire[3:0] pass_through_result;
wire[3:0] rl_shift_result;

// Create instance of each operation modules
// Adder subtracter module - add or subtr can be determined with bit 0 in opcode
adder_subtr_4bit adder_subtr_module(.in1(in1), .in2(in2), .ci(cin), .sub_select(opcode[0]), .co(cout), .out(add_sub_result));
// And module
and_4bit and_module(.in1(in1), .in2(in2), .result(and_result));
// OR module
 or_4bit or_module(.in1(in1), .in2(in2), .result(or_result));
// XOR module
xor_4bit xor_module(.in1(in1), .in2(in2), .result(xor_result));
// NOT module
not_4bit not_module(.in1(in1), .result(not_result));
// Pass through module
passthrough_4bit pass_through_module(.in1(in1), .result(pass_through_result));
// rl_shoft module - shift type can be determined with bits [1:0] in opcode
rl_shift_4bit shift_module(.in1(in1), .in2(in2), .shift_select(opcode[1:0]), .result(rl_shift_result));
// create instance of multiplexer module
multiplex_4bit multiplex_module(.control(opcode), .add_sub_res(add_sub_result), 
.not_res(not_result), .or_res(or_result), .and_res(and_result), .xor_res(xor_result),
 .l_r_res(rl_shift_result), .pass_through_res(pass_through_result), .out(out));

 endmodule


