module decode(
	input [31:0] inst,
	output mem_write,
	output alu_src,
	output alu_reg_write,
	output mem_reg_write,
	output long_write,
	output word,
	output branch,
	output[4:0] rs,
	output[4:0] rt,
	output[4:0] rd,
	output[31:0] imm,
	output[20:0] baddr,
	output[11:0] aluop
);

control c(
	.op(inst[31:26]),
	.mem_write(mem_write),
	.alu_src(alu_src),
	.alu_reg_write(alu_reg_write),
	.mem_reg_write(mem_reg_write),
	.long_write(long_write),
	.branch(branch),
	.word(word)
);

assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign aluop = inst[11:0];
assign baddr = inst[20:0];
assign imm = { {16{inst[15]}}, inst[15:0] };

endmodule