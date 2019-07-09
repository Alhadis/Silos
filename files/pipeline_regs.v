module IF_ID(
	input clk, 
	input we, 
	input reset,

	input[31:0] inst_in, 
	output [31:0] inst_out,
	input[31:0] pc_in,
	output[31:0] pc_out,

	input[2:0] rob_index_in,
	output[2:0] rob_index_out
);

reg[31:0] inst;
reg[31:0] pc;
reg[2:0] rob_index;

assign inst_out = inst;
assign pc_out = pc; 
assign rob_index_out = rob_index;

always @(posedge clk)
begin
	if(we) begin
		inst <= inst_in;
		pc <= pc_in;
		rob_index <= rob_index_in;
	end
	if(reset) begin
		inst <= 0;
		pc <= 0;
		rob_index <= 0;
	end
end

initial begin
	inst <= 0;
	pc <= 0;
	rob_index <= 0;	
end

endmodule

module ID_EX(
	input clk, 
	input we, 
	input reset,

	input[31:0] pc_in,
	output[31:0] pc_out,

	input mem_write_in,
	input alu_src_in,
	input alu_reg_write_in,
	input mem_reg_write_in,
	input long_write_in,
	input branch_in,
	input word_in,
	output mem_write_out,
	output alu_src_out,
	output alu_reg_write_out,
	output mem_reg_write_out,
	output long_write_out,
	output branch_out,
	output word_out,
	//Step data	
	input[31:0] rs_data_in,
	output[31:0] rs_data_out, 
	input[31:0] rt_data_in, 
	output[31:0] rt_data_out,
	input[4:0] rd_in,
	output[4:0] rd_out,
	input[4:0] rs_in,
	output[4:0] rs_out,
	input[31:0] imm_in,
	output[31:0] imm_out,
	input[11:0] aluop_in,
	output[11:0] aluop_out,
	input[20:0] baddr_in,
	output[20:0] baddr_out,

	input[2:0] rob_index_in,
	output[2:0] rob_index_out
);

reg [4:0] rd, rs;
reg [31:0] imm, rs_data, rt_data;
reg word, mem_write, alu_src, alu_reg_write, mem_reg_write, long_write, branch;
reg [31:0] pc;
reg [11:0] aluop;
reg [20:0] baddr;
reg [2:0] rob_index;

assign rs_data_out = rs_data;
assign rt_data_out = rt_data;
assign rd_out = rd;
assign rs_out = rs;
assign imm_out = imm;
assign aluop_out = aluop;
assign baddr_out = baddr;

assign mem_write_out = mem_write;
assign alu_src_out = alu_src;
assign alu_reg_write_out = alu_reg_write;
assign mem_reg_write_out = mem_reg_write;
assign long_write_out = long_write;
assign branch_out = branch;
assign word_out = word;

assign pc_out = pc;
assign rob_index_out = rob_index;

always @(posedge clk)
begin
	if(we) begin
		rs_data <= rs_data_in;
		rt_data <= rt_data_in;
		rd <= rd_in;
		rs <= rs_in;
		imm <= imm_in;		
		baddr <= baddr_in;

		mem_write <= mem_write_in;
		alu_src <= alu_src_in;
		alu_reg_write <= alu_reg_write_in;
		mem_reg_write <= mem_reg_write_in;
		long_write <= long_write_in;
		branch <= branch_in;

		aluop <= aluop_in;
		word <= word_in;
		
		pc <= pc_in;
		rob_index <= rob_index_in;
	end
	if(reset) begin
		rs_data <= 0;
		rt_data <= 0;
		rd <= 0;
		imm <= 0;
		rs <= 0;
		mem_write <= 0;
		alu_src <= 0;
		alu_reg_write <= 0;
		mem_reg_write <= 0;
		word <= 0;
		long_write <= 0;
		branch <= 0;
		aluop <= 0;
		pc <= 0;
		rob_index <= 0;
	end
end

initial begin
	rs_data <= 0;
	rt_data <= 0;
	rd <= 0;
	imm <= 0;
	rs <= 0;
	mem_write <= 0;
	alu_src <= 0;
	alu_reg_write <= 0;
	mem_reg_write <= 0;
	long_write <= 0;
	branch <= 0;
	aluop <= 0;
	pc <= 0;
	rob_index <= 0;
	word <= 0;
end

endmodule

module EX_WBTL(
	input clk, 
	input we, 
	input reset,

	input[31:0] pc_in,
	output[31:0] pc_out,

	input[31:0] alu_result_in,
	output[31:0] alu_result_out,
	input[4:0] rd_in,
	output[4:0] rd_out,
	input[4:0] rs_in,
	output[4:0] rs_out,
	input[31:0] rs_data_in,
	output[31:0] rs_data_out,

	input mem_write_in,
	input alu_reg_write_in,
	input mem_reg_write_in,
	output mem_write_out,
	output alu_reg_write_out,
	output mem_reg_write_out,
	input word_in,
	output word_out,
	input branch_in,
	input branch_out,

	input[2:0] rob_index_in,
	output[2:0] rob_index_out
);

reg[4:0] rd, rs;
reg word, mem_write, alu_src, alu_reg_write, mem_reg_write, branch;
reg [31:0] pc, alu_result, rs_data;
reg [2:0] rob_index;


assign rs_data_out = rs_data;
assign alu_result_out = alu_result;
assign rd_out = rd;
assign rs_out = rs;

assign mem_write_out = mem_write;
assign alu_reg_write_out = alu_reg_write;
assign mem_reg_write_out = mem_reg_write;
assign word_out = word;
assign branch_out = branch;

assign pc_out = pc;
assign rob_index_out = rob_index;

always @(posedge clk)
begin
	if(we) begin
		rs <= rs_in;
		rd <= rd_in;
		rs_data <= rs_data_in;
		alu_result <= alu_result_in;

		mem_write <= mem_write_in;
		alu_reg_write <= alu_reg_write_in;
		mem_reg_write <= mem_reg_write_in;
		word <= word_in;
		branch <= branch_in;

		pc <= pc_in;
		rob_index <= rob_index_in;
	end
	if(reset) begin
		rs <= 0;
		rd <= 0;
		rs_data <= 0;
		alu_result <= 0;
		word <= 0;
		branch <= 0;

		mem_write <= 0;
		alu_reg_write <= 0;
		mem_reg_write <= 0;

		pc <= 0;
		rob_index <= 0;
	end
end

initial begin
	rs <= 0;
	rd <= 0;
	rs_data <= 0;
	alu_result <= 0;
	mem_write <= 0;
	alu_reg_write <= 0;
	mem_reg_write <= 0;
	pc <= 0;
	rob_index <= 0;
	branch <= 0;
end

endmodule

module TL_C(
	input clk, 
	input we, 
	input reset,

	input[31:0] pc_in,
	output[31:0] pc_out,

	input[31:0] addr_in,
	output[31:0] addr_out,
	input[31:0] val_in,
	output[31:0] val_out,
	input[4:0] rd_in,
	output[4:0] rd_out,

	input mem_write_in,
	output mem_write_out,
	input word_in,
	output word_out,

	input mem_reg_write_in,
	output mem_reg_write_out,

	input[2:0] rob_index_in,
	output[2:0] rob_index_out
);

reg word, mem_write, mem_reg_write, alu_reg_write;
reg[31:0] pc, addr, val;
reg[4:0] rd;
reg[2:0] rob_index;

assign mem_write_out = mem_write;
assign mem_reg_write_out = mem_reg_write;

assign addr_out = addr;
assign val_out = val;
assign rd_out = rd;

assign pc_out = pc;
assign rob_index_out = rob_index;
assign word_out = word;

always @(posedge clk)
begin
	if(we) begin
		mem_write <= mem_write_in;
		mem_reg_write <= mem_reg_write_in;

		addr <= addr_in;
		val <= val_in;
		rd <= rd_in;
		word <= word_in;

		pc <= pc_in;
		rob_index <= rob_index_in;
	end
	if(reset) begin
		mem_write <= 0;
		mem_reg_write <= 0;

		addr <= 0;
		val <= 0;
		rd <= 0;
		word <= 0;

		pc <= 0;
		rob_index <= 0;
	end
end

initial begin
	mem_write <= 0;
	mem_reg_write <= 0;
	addr <= 0;
	val <= 0;
	rd <= 0;
	pc <= 0;
	word <= 0;
	rob_index <= 0;
end

endmodule

module C_WB(
	input clk,
	input we,
	input reset,

	input[31:0] val_in,
	output[31:0] val_out,

	input[4:0] rd_in,
	input[4:0] rd_out,

	input write_in,
	output write_out,

	input[2:0] rob_index_in,
	output[2:0] rob_index_out,

	input[31:0] addr_in,
	output[31:0] addr_out,

	input[31:0] pc_in,
	output[31:0] pc_out
);

reg[31:0] val;
reg[4:0] rd;
reg write;
reg[2:0] rob_index;
reg[31:0] pc, addr;

assign write_out = write;
assign rd_out = rd;
assign val_out = val;
assign rob_index_out = rob_index;
assign pc_out = pc;
assign addr_out = addr_in;

always @(posedge clk) begin
	if(we) begin
		val <= val_in;
		rd <= rd_in;
		write <= write_in;
		rob_index <= rob_index_in;
		pc <= pc_in;
		addr <= addr_in;
	end
	if(reset) begin
		val <= 0;
		rd <= 0;
		write <= 0;
		rob_index <= 0;
		pc <= 0;
		addr <= 0;
	end
end

initial begin
	val <= 0;
	rd <= 0;
	write <= 0;
	rob_index <= 0;
	pc <= 0;
	addr <= 0;
end

endmodule

/* SLOW INSTRUCTION REGS */

module SLREG(
	input clk,
	input we,
	input reset,

	input[31:0] pc_in,
	input[31:0] value_in,
	input[4:0] rd_in,
	input[2:0] rob_index_in,
	input write_in,

	output[31:0] pc_out,
	output[31:0] value_out,
	output[4:0] rd_out,
	output[2:0] rob_index_out,
	output write_out
);

reg[31:0] pc, value;
reg[5:0] rd;
reg[2:0] rob_index;
reg write;

assign pc_out = pc;
assign value_out = value;
assign rd_out = rd;
assign rob_index_out = rob_index;
assign write_out = write; 

always @(posedge clk) begin
	if(we) begin
		pc <= pc_in;
		value <= value_in;
		rd <= rd_in;
		write <= write_in;
		rob_index <= rob_index_in;
	end
	if(reset) begin
		pc <= 0;
		value <= 0;
		rd <= 0;
		write <= 0;
		rob_index <= 0;
	end
end

initial begin
	pc <= 0;
	value <= 0;
	rd <= 0;
	write <= 0;
	rob_index <= 0;
end

endmodule