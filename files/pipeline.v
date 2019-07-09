module pipeline(
	input clk, 
	input reset
);

wire[21:0] physical_TL;

wire itlb_miss, dtlb_miss;
wire IFID_we, IFID_reset;
wire IDEX_we, IDEX_reset;
wire EXWBTL_we, EXWBTL_reset;
wire TLC_we, TLC_reset;
wire CWB_we, CWB_reset;
wire S12_we, S12_reset;
wire S23_we, S23_reset;
wire S34_we, S34_reset;
wire EXS1_we, EXS1_reset;

wire [31:0] inst_F, inst_D; //Instruction propagation wires
wire [31:0] pc_F, pc_D, pc_EX, pc_WBTL, pc_C, pc_WB, pc_S1, pc_S2, pc_S3, pc_S4; //PC propagation wires

wire [31:0] result_EX, result_WBTL, val_S1, val_S2, val_S3, val_S4, val_C, val_WB;

wire pc_we;

//Control wires
wire mem_write_D, mem_write_EX, mem_write_WBTL;
wire alu_src_D, alu_src_EX;
wire alu_reg_write_D, alu_reg_write_EX, alu_reg_write_WBTL;
wire mem_reg_write_D, mem_reg_write_EX, mem_reg_write_WBTL, mem_reg_write_C;
wire long_write_D, long_write_EX, long_write_WBTL;
wire branch_D, branch_EX, branch_WBTL, jump;

//Register selectors
wire[4:0] rs_D, rs_EX, rs_WBTL;
wire[4:0] rt_D;
wire[4:0] rd_D, rd_EX, rd_WBTL, rd_S1, rd_S2, rd_S3, rd_S4, rd_WB, rd_C;
wire[31:0] imm_D, imm_EX;
wire[20:0] baddr_D, baddr_EX;
wire[11:0] aluop_D, aluop_EX;

wire[31:0] rs_data_D, rs_data_EX, rs_data_WBTL;
wire[31:0] rt_data_D, rt_data_EX;
wire[31:0] reg_write_data;

wire overflow_EX;

wire imiss, ifill, dmiss, dfill, dcache_miss, mem_instruction; //cache wires
wire [4:0] fill_idx;
wire [63:0] mem_stream, mem_stream_in;
wire eviction;

wire ROB_stall;

wire[31:0] addr_TL, addr_C, addr_WB, load_C, val_in;

//ROB wires
wire[2:0] rob_index_F, rob_index_D, rob_index_EX, rob_index_L, rob_index_C, rob_index_WB, rob_index_S1, rob_index_S2, rob_index_S3, rob_index_S4;
wire[4:0] rd_ROB;
wire[31:0] val_ROB, addr_ROB;
wire IRB_we, store_ROB, stores_ROB;
wire[4:0] rds_ROB[7:0];
wire[7:0] valids_ROB;

wire bubble;
wire[31:0] rsdata, pc_ROB;
wire[31:0] rtdata;
wire[31:0] rob_values[7:0];


wire ex, ex_F, ex_D, ex_EX, ex_TL, ex_C, ex_WB, ex_S1, ex_S2, ex_S3, ex_S4, ex_S5;

reg rm0, rm1;
reg trap_pc;

always @(posedge clk)
if(ex) begin
	rm1 <= addr_ROB;
	rm0 <= pc_ROB;
	F.pc <= trap_pc;
end

assign addr_TL = (store_ROB)?addr_ROB:result_WBTL; //Address to lookup in case of store or load

assign mem_instruction = mem_write_WBTL | mem_reg_write_WBTL;
assign dmiss = dcache_miss & mem_instruction;
//TMP

exception_regs eregs(
	.clk(clk),
	.iF(itlb_miss),
	.iD(1'b0),
	.iEX(1'b0),
	.iTL(dtlb_miss), 
	.iC(1'b0),
	.iWB(1'b0),
	.iS1(1'b0),
	.iS2(1'b0),
	.iS3(1'b0),
	.iS4(1'b0),
	.iS5(1'b0),
	.oF(ex_F),
	.oD(ex_D),
	.oEX(ex_EX),
	.oTL(ex_TL),
	.oC(ex_C),
	.oWB(ex_WB),
	.oS1(ex_S1),
	.oS2(ex_S2),
	.oS3(ex_S3),
	.oS4(ex_S4),
	.oS5(ex_S5)
);
exceptions exception_unit(
	.clk(clk),
	.dmiss(dmiss),
	.imiss(imiss),
	.dfill(dfill),
	.ifill(ifill),
	.jump(jump),
	.remaining_stores(stores_ROB & mem_reg_write_D),

	.IFID_we(IFID_we),
	.IDEX_we(IDEX_we),
	.EX_WBTL_we(EXWBTL_we),
	.TLC_we(TLC_we),
	.CWB_we(CWB_we),
	.EXS1_we(EXS1_we),
	.S12_we(S12_we),
	.S23_we(S23_we),
	.S34_we(S34_we),

	.IFID_reset(IFID_reset),
	.IDEX_reset(IDEX_reset),
	.EX_WBTL_reset(EXWBTL_reset),
	.TLC_reset(TLC_reset),
	.CWB_reset(CWB_reset),
	.EXS1_reset(EXS1_reset),
	.S12_reset(S12_reset),
	.S23_reset(S23_reset),
	.S34_reset(S34_reset),
	.pc_we(pc_we)
);

wire bypass_rs_TL, bypass_rs_WB, bypass_rt_TL, bypass_rs_C, bypass_rt_C, bypass_rt_EX, bypass_rt_WB, bypass_rs_ROB, bypass_rt_ROB;
wire[2:0] rt_in_ROB, rs_in_ROB;

bypasses forwarding_unit(
	.rs_D(rs_D),
	.rt_D(rt_D),

	.rd_EX(rd_EX),
	.rd_TL(rd_WBTL),
	.rd_C(rd_C),
	.rd_WB(rd_WB),

	.rob_rd_0(rds_ROB[0]),
	.rob_rd_1(rds_ROB[1]),
	.rob_rd_2(rds_ROB[2]),
	.rob_rd_3(rds_ROB[3]),
	.rob_rd_4(rds_ROB[4]),
	.rob_rd_5(rds_ROB[5]),
	.rob_rd_6(rds_ROB[6]),
	.rob_rd_7(rds_ROB[7]),
	.rob_valids(valids_ROB),

	.rs_from_EX(bypass_rs_EX),
	.rs_from_TL(bypass_rs_TL),
	.rs_from_C(bypass_rs_C),
	.rs_from_WB(bypass_rs_WB),

	.rt_from_EX(bypass_rt_EX),
	.rt_from_TL(bypass_rt_TL),
	.rt_from_WB(bypass_rt_WB),
	.rt_from_C(bypass_rt_C),

	.ROB_tail(rob_index_F),

	.rt_from_ROB(rt_in_ROB),
	.rs_ROB(bypass_rs_ROB),
	.rs_from_ROB(rs_in_ROB),
	.rt_ROB(bypass_rt_ROB)
);

reorder_buffer ROB(
	.clk(clk),
	.stall(!pc_we),
	
	.alu(rob_index_L), //Alu index
	.alu_we(alu_reg_write_WBTL | mem_write_WBTL | branch_WBTL),
	.alu_pc(pc_WBTL),
	.alu_rd(rd_WBTL),
	.alu_ex(ex_TL),
	.alu_val( (mem_write_WBTL)?rs_data_WBTL:result_WBTL ),
	.alu_store(mem_write_WBTL),
	.alu_addr(result_WBTL),
	.alu_pass(branch_WBTL), //Branches dont write

	.load(rob_index_WB), //Load index
	.load_pc(pc_WB),
	.load_we(write_WB),
	.load_rd(rd_WB),
	.load_ex(ex_WB),
	.load_val(val_WB),
	.load_addr(pc_ROB),

	.slow(rob_index_S4), //Slow index
	.slow_pc(pc_S4),
	.slow_we(write_S4),
	.slow_rd(rd_S4),
	.slow_ex(ex_S5),
	.slow_val(val_S4),

	.val_out(val_ROB),
	.rd_out(rd_ROB),
	.we(IRB_we),
	.stores(stores_ROB),
	.ex_out(ex),
	.pc_out(pc_ROB),

	.store_out(store_ROB),
	.addr_out(addr_ROB),

	.tail_out(rob_index_F),
	.next_head(!store_ROB | !dmiss),
	.destination_0(rds_ROB[0]),
	.destination_1(rds_ROB[1]),
	.destination_2(rds_ROB[2]),
	.destination_3(rds_ROB[3]),
	.destination_4(rds_ROB[4]),
	.destination_5(rds_ROB[5]),
	.destination_6(rds_ROB[6]),
	.destination_7(rds_ROB[7]),
	.val_0(rob_values[0]),
	.val_1(rob_values[1]),
	.val_2(rob_values[2]),
	.val_3(rob_values[3]),
	.val_4(rob_values[4]),
	.val_5(rob_values[5]),
	.val_6(rob_values[6]),
	.val_7(rob_values[7]),
	.valids(valids_ROB)
);



IF_ID IFID(
	.clk(clk), 
	.we(IFID_we & !bubble ),	
	.reset(IFID_reset | ex),

	.inst_in(inst_F), 
	.inst_out(inst_D),

	.pc_in(pc_F),
	.pc_out(pc_D),
	.rob_index_in(rob_index_F),
	.rob_index_out(rob_index_D)
);

//assign bubble = ((bypass_rt_EX | bypass_rs_EX) & !alu_reg_write_EX & mem_reg_write_EX) | ((bypass_rs_TL | bypass_rt_TL) & mem_reg_write_WBTL);

assign bubble = 0;
assign rsdata = rs_data_D;
assign rtdata = rt_data_D;
/*
assign rsdata = (bypass_rs_EX & alu_reg_write_EX)?result_EX:
	(bypass_rs_C & mem_reg_write_C)?load_C:
	(bypass_rs_WB)?val_WB:
	(bypass_rs_ROB)?rob_values[rs_in_ROB]:
	rs_data_D;
assign rtdata = (bypass_rt_EX & alu_reg_write_EX)?result_EX:
	(bypass_rt_C & mem_reg_write_C)?load_C:
	(bypass_rt_WB)?val_WB:
	(bypass_rt_ROB)?rob_values[rt_in_ROB]:
	rt_data_D;
*/

ID_EX IDEX(
	.clk(clk),
	.we(IDEX_we & !bubble),
	.reset(IDEX_reset | jump | ex),

	.pc_in(pc_D),
	.pc_out(pc_EX),

	.mem_write_in(mem_write_D),
	.mem_write_out(mem_write_EX),
	.alu_src_in(alu_src_D),
	.alu_src_out(alu_src_EX),
	.alu_reg_write_in(alu_reg_write_D),
	.alu_reg_write_out(alu_reg_write_EX),
	.mem_reg_write_in(mem_reg_write_D),
	.mem_reg_write_out(mem_reg_write_EX),
	.long_write_in(long_write_D),
	.long_write_out(long_write_EX),
	.branch_in(branch_D),
	.branch_out(branch_EX),
	.aluop_in(aluop_D),
	.aluop_out(aluop_EX),

	.rs_data_in(rsdata),
	.rs_data_out(rs_data_EX),
	.rt_data_in(rtdata),
	.rt_data_out(rt_data_EX),
	.rs_in(rs_D),
	.rs_out(rs_EX),
	.rd_in(rd_D),
	.rd_out(rd_EX),
	.imm_in(imm_D),
	.imm_out(imm_EX),
	.baddr_in(baddr_D),
	.baddr_out(baddr_EX),
	.rob_index_in(rob_index_D),
	.rob_index_out(rob_index_EX),
	.word_in(word_D),
	.word_out(word_EX)
);

EX_WBTL EXWBTL(
	.clk(clk), 
	.we(EXWBTL_we | jump), 
	.reset(EXWBTL_reset | ex),

	.pc_in(pc_EX),
	.pc_out(pc_WBTL),

	.alu_result_in(result_EX),
	.alu_result_out(result_WBTL),
	.rd_in(rd_EX),
	.rd_out(rd_WBTL),
	.rs_in(rs_EX),
	.rs_out(rs_WBTL),
	.rs_data_in(rs_data_EX),
	.rs_data_out(rs_data_WBTL),

	.mem_write_in(mem_write_EX),
	.alu_reg_write_in(alu_reg_write_EX),
	.mem_reg_write_in(mem_reg_write_EX),
	.mem_write_out(mem_write_WBTL),
	.alu_reg_write_out(alu_reg_write_WBTL),
	.mem_reg_write_out(mem_reg_write_WBTL),
	.word_in(word_EX),
	.word_out(word_WBTL),
	.branch_in(branch_EX),
	.branch_out(branch_WBTL),

	.rob_index_in(rob_index_EX),
	.rob_index_out(rob_index_L)
);


TL_C TLC(
	.clk(clk), 
	.we(TLC_we), 
	.reset(WBTLC_reset | ex),

	.pc_in(pc_WBTL),
	.pc_out(pc_C),

	.addr_in( {physical_TL ,addr_TL[9:0]} ),
	.addr_out( addr_C ),
	.val_in(val_ROB),
	.val_out(val_C),
	.rd_in(rs_WBTL),
	.rd_out(rd_C),

	.mem_write_in(!dmiss&store_ROB),
	.mem_reg_write_in(mem_reg_write_WBTL),
	.mem_write_out(mem_write_C),
	.mem_reg_write_out(mem_reg_write_C),
	.word_in(word_WBTL),
	.word_out(word_C),
	.rob_index_in(rob_index_L),
	.rob_index_out(rob_index_C)
);

C_WB CWB(
	.clk(clk),
	.we(CWB_we),
	.reset(CWB_reset | ex),
	.addr_in(addr_C),
	.addr_out(addr_WB),
	.val_in(load_C),
	.val_out(val_WB),
	.rd_in(rd_C),
	.rd_out(rd_WB),
	.write_in(mem_reg_write_C),
	.write_out(write_WB),
	.rob_index_in(rob_index_C),
	.rob_index_out(rob_index_WB),
	.pc_in(pc_C),
	.pc_out(pc_WB)
);

/* STUFF FOR THE SLOW INSTRUCTION */

SLREG EXS1(.clk(clk),.we(EXS1_we),.reset(EXS1_reset | ex),.pc_in(pc_EX),.value_in(result_EX),.rd_in(rd_EX),.rob_index_in(rob_index_EX),.write_in(long_write_EX),.pc_out(pc_S1),.value_out(val_S1),.rd_out(rd_S1),.rob_index_out(rob_index_S1),.write_out(write_S1));
SLREG S12(.clk(clk), .we(S12_we), .reset(S12_reset | ex), .pc_in(pc_S1), .value_in(val_S1), .rd_in(rd_S1), .rob_index_in(rob_index_S1), .write_in(write_S1), .pc_out(pc_S2), .value_out(val_S2), .rd_out(rd_S2), .rob_index_out(rob_index_S2), .write_out(write_S2));
SLREG S23(.clk(clk), .we(S23_we), .reset(S23_reset | ex), .pc_in(pc_S2), .value_in(val_S2), .rd_in(rd_S2), .rob_index_in(rob_index_S2), .write_in(write_S2), .pc_out(pc_S3), .value_out(val_S3), .rd_out(rd_S3), .rob_index_out(rob_index_S3), .write_out(write_S3));
SLREG S34(.clk(clk), .we(S34_we), .reset(S34_reset | ex), .pc_in(pc_S3), .value_in(val_S3), .rd_in(rd_S3), .rob_index_in(rob_index_S3), .write_in(write_S3), .pc_out(pc_S4), .value_out(val_S4), .rd_out(rd_S4), .rob_index_out(rob_index_S4), .write_out(write_S4));

//REGEND

exec EX(
	.rs(rs_data_EX),
	.rt(rt_data_EX),
	.imm(imm_EX),

	.result(result_EX),

	.aluop(aluop_EX),
	.alu_src(alu_src_EX),
	.branch(branch_EX),
	.jump(jump),
	.overflow(overflow_EX)
);

//LOAD FOLLOWS STORE APPROACH

TLB tlb(.clk(clk), .virtual(addr_TL[31:10]), .physical(physical_TL), .exception(dtlb_miss));
dtags TL(.clk(clk), .tag({physical_TL ,addr_TL[9:8]}), .idx(addr_TL[7:3]), .miss(dcache_miss), .fill(dfill), .dirty(dirty));


dcache C(
	.clk(clk),
	.data_in(val_C), //Input data to write 
  	.data_mem(mem_stream), //Full line (from memory)
  	.idx(addr_C[7:3]), //Line on the cache
  	.fidx(addr_TL[7:3]), //
  	.idb(addr_C[2:0]), //Byte on the line
  	.we(mem_write_C), //Write enabled (miss and store)
  	.fill(dfill), //Fill from memory
  	.word(word_C), //Read byte
  	.data_out(load_C), //Output data for reads
  	.data_mem_in(mem_stream_in)
);

assign eviction = mem_write_C & dirty;

decode D(
	.inst(inst_D),
	
	.mem_write(mem_write_D),
	.alu_src(alu_src_D),
	.alu_reg_write(alu_reg_write_D),
	.mem_reg_write(mem_reg_write_D),
	.long_write(long_write_D),
	.branch(branch_D),
	.word(word_D),

	.rs(rs_D),
	.rt(rt_D),
	.rd(rd_D),
	.imm(imm_D),
	.baddr(baddr_D),
	.aluop(aluop_D)
);

register_bank IRB(
  .clk(clk), 
  .we(IRB_we), 
  
  .rs(rs_D),
  .rt(rt_D),
  .rd(rd_ROB),

  .rd_data(val_ROB), //A complex one, heh, THIS IS AN INPUT AND NOT AN EASY ONE
  .rs_data(rs_data_D),
  .rt_data(rt_data_D)
);

fetch F(
	.clk(clk), 

	.branch_address(baddr_EX),
	.branch(jump),
	.pc_write(pc_we),

	.fill(ifill),
	.stream(mem_stream),

	.inst(inst_F), 
	.miss(imiss),
	.pc_out(pc_F),
	.tlbmiss(itlb_miss)
);

memory MEM(
  .clk(clk), 
  
  .iaddr(pc_F),
  .daddr(addr_TL),
  .imiss(imiss),
  .dmiss(dmiss),

  .data(mem_stream), 
  .ifill(ifill), 
  .dfill(dfill),

  .data_in(mem_stream_in),
  .we(eviction),
  .addr_in({addr_C[31:3], 3'b000})
);

always @(reset)
begin
	if(reset) begin
		F.pc = 32'd0;
		IRB.regs[0] <= 0;
		IRB.regs[1] <= 0;
		IRB.regs[2] <= 0;
		IRB.regs[3] <= 0;
		IRB.regs[4] <= 0;
		IRB.regs[5] <= 0;
		IRB.regs[6] <= 0;
		IRB.regs[7] <= 0;
		IRB.regs[8] <= 0;
		IRB.regs[9] <= 0;
		IRB.regs[10] <= 0;
		IRB.regs[11] <= 0;
		IRB.regs[12] <= 0;
		IRB.regs[13] <= 0;
		IRB.regs[14] <= 0;
		IRB.regs[15] <= 0;
		IRB.regs[16] <= 0;
		IRB.regs[17] <= 0;
		IRB.regs[18] <= 0;
		IRB.regs[19] <= 0;
		IRB.regs[20] <= 0;
		IRB.regs[21] <= 0;
		IRB.regs[22] <= 0;
		IRB.regs[23] <= 0;
		IRB.regs[24] <= 0;
		IRB.regs[25] <= 0;
		IRB.regs[26] <= 0;
		IRB.regs[27] <= 0;
		IRB.regs[28] <= 0;
		IRB.regs[29] <= 0;
		IRB.regs[30] <= 0;
		IRB.regs[31] <= 0;
	end
end

endmodule