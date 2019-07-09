module control(
	input [5:0] op,
	output mem_write,
	output alu_src,
	output alu_reg_write,
	output mem_reg_write,
	output long_write,
	output branch,
	output word
);


 //determines type of instruction
 wire lb = op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]; //100000 LB
 wire lw = op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]; //100011 LW
 wire aluop = ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]; //000000 ADD
 wire sb = op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]; //101000 SB
 wire sw = op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0]; //101011 SW
 wire addslw = op[5]&op[4]&op[3]&op[2]&op[1]&op[0]; //111111 ADDSLW
 wire bnz = ~op[5]&~op[4]&~op[3]&op[2]&~op[1]&op[0]; //000101 BNZ

 assign mem_write = sb | sw;
 assign alu_src = lb | lw | sb | sw;
 assign alu_reg_write = aluop;
 assign mem_reg_write = lb | lw;
 assign word = sw | lw;
 assign long_write = addslw;
 assign branch = bnz;

endmodule
 