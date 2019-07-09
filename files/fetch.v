module fetch(
	input clk,
	
	input[20:0] branch_address, 
	input branch,
	input pc_write,

	input fill,
	input[63:0] stream,

	output [31:0] inst,
	output miss,
	output [31:0] pc_out,
	output tlbmiss
);

reg[31:0] pc, next_pc;
reg wait_branch;
wire[21:0] physical;

TLB tlb(.clk(clk), .virtual(pc[31:10]), .physical(physical), .exception(tlbmiss));
tags t(.clk(clk), .tag({physical, pc[9:8]}), .idx(pc[7:3]), .miss(miss), .fill(fill));
icache c(.clk(clk), .idx(pc[7:3]), .idb(pc[2:0]), .data_out(inst), .fill(fill), .data_mem(stream));

assign pc_out = pc;

always @(posedge clk)
begin
	if(pc_write)
		begin
			if(branch) begin
				pc = {{11{pc[31:21]}},branch_address};
				next_pc = pc + 4;
				wait_branch <= 1;
			end
			else begin
				pc = next_pc;
				next_pc = pc + 4;
			end
		end
	else if(branch) begin
		next_pc = {{11{pc[31:21]}},branch_address};
		wait_branch <= 0;
	end
	else if(wait_branch) begin
		next_pc = pc;
	end
end

initial begin
	pc <= 0;
	next_pc <= 0;
	wait_branch <= 1;
end

endmodule