`include "macro.vh"	
module ctrl_unit(clk, rst, if_instr, instr, 
	cu_branch, cu_wreg, cu_m2reg, cu_wmem, cu_aluc, cu_shift, cu_aluimm, cu_sext,cu_regrt, cu_wpcir);
	
	input clk;
	input rst;
	input [31:0] instr;
	input [31:0] if_instr;
	
	output cu_branch;
	output cu_wreg;
	output cu_m2reg;
	output cu_wmem;
	output [3:0] cu_aluc;
	output cu_shift;
	output cu_aluimm;
	output cu_sext;
	output cu_regrt;
	output wire cu_wpcir;
	
	wire [5:0] func;
	wire [5:0] opcode;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	
	wire [5:0] if_func;
	wire [5:0] if_opcode;
	wire [4:0] if_rs;
	wire [4:0] if_rt;
	wire [4:0] if_rd; 
	
	wire [4:0] ex_rs;
	wire [4:0] ex_rt;
	wire [4:0] ex_rd;
	wire [4:0] mem_rt;
	wire [4:0] mem_rd;
	wire [4:0] wb_rd;
	wire [4:0] wb_rt;
	wire [5:0] ex_op;
	wire [5:0] mem_op;
	wire [5:0] wb_op;

	reg [31:0] ex_instr;
	reg [31:0] mem_instr;
	reg [31:0] wb_instr;
	reg [3:0] cu_aluc;
	
	wire AfromEx;
	wire BfromEx;
	wire AfromMem;
	wire BfromMem;
	wire AfromExLW;
	wire BfromExLW;
	wire AfromMemLW;
	wire BfromMemLW;
	wire stall;
	/*
	output wire AfromEx;
	output wire BfromEx;
	output wire AfromMem;
	output wire BfromMem;
	output wire AfromExLW;
	output wire BfromExLW;
	output wire AfromMemLW;
	output wire BfromMemLW;
	*/
	initial begin 
		ex_instr <= 32'h0;
		mem_instr <= 32'h0;
		wb_instr <= 32'h0;
	end
	
	assign opcode[5:0] =instr[31:26];
	assign rs[4:0] = instr[25:21];
	assign rt[4:0] = instr[20:16];
	assign rd[4:0] = instr[15:11];
	assign func[5:0] = instr[5:0];
	
	assign if_opcode[5:0] = if_instr[31:26];
	assign if_rs[4:0] = if_instr[25:21];
	assign if_rt[4:0] = if_instr[20:16];
	assign if_rd[4:0] = if_instr[15:11];
	assign if_func[5:0] = if_instr[5:0];
	
	assign ex_rs[4:0] = ex_instr[25:21];
	assign ex_rt[4:0] = ex_instr[20:16];
	assign ex_rd[4:0] = ex_instr[15:11];
	assign mem_rt[4:0] = mem_instr[20:16];
	assign mem_rd[4:0] = mem_instr[15:11];
	assign wb_rd[4:0] = wb_instr[15:11];
	assign wb_rt[4:0] = wb_instr[20:16];
	assign ex_op[5:0] = ex_instr[31:26];
	assign mem_op[5:0] = mem_instr[31:26];
	assign wb_op[5:0] = wb_instr[31:26];
	
	
	
	
	
	/////////////////// The assignment of the stall signal//////////////////////////
	assign AfromEx = (if_rs==rd) & (if_rs != 0) & (opcode ==`OP_ALUOp); //if instr.rs=id inst.rd and id instr = ALUOp
	assign BfromEx = (if_rt==rd) & (if_rt != 0) & (opcode ==`OP_ALUOp);
	assign AfromMem = (if_rs==ex_rd) & (if_rs != 0) & (ex_op ==`OP_ALUOp);
	assign BfromMem = (if_rt==ex_rd) & (if_rt != 0) & (ex_op ==`OP_ALUOp);
	assign AfromExLW = (if_rs==rt) & (if_rs != 0) & (opcode == `OP_LW);
	assign BfromExLW = (if_rt==rt) & (if_rt != 0) & (opcode == `OP_LW);
	assign AfromMemLW = (if_rs==ex_rt) &(if_rs != 0) & (ex_op == `OP_LW);
	assign BfromMemLW = (if_rt==ex_rt) &(if_rt!= 0) & (ex_op == `OP_LW);
	assign stall = AfromEx || BfromEx || AfromMem || BfromMem || AfromExLW || BfromExLW || AfromMemLW || BfromMemLW;
	assign cu_wpcir = stall;
	
	
	////////////////////////////////////////////////////////////////////////////////
	assign cu_branch =(opcode == `OP_BEQ || opcode == `OP_BNE); //if instr type is branch type then 1 else 0
	
	assign cu_regrt  =!(opcode == `OP_ALUOp); //if instr type = R type then 0 else 1;

	assign cu_sext   =(opcode[5:1] == 5'b00100||opcode == `OP_LW || opcode ==`OP_SW ||
							 opcode == `OP_BEQ || opcode == `OP_BNE || opcode ==`OP_SLTI);//when need to sign extend?
							 
	assign cu_wreg   =(opcode[5:1] != 5'b00001 && opcode != `OP_SW && opcode != `OP_BEQ 
	                   && opcode != `OP_BNE);//when need to write reg?
	assign cu_m2reg  =(opcode == `OP_LW);//when need to write mem to reg ?
	assign cu_wmem   =(opcode == `OP_SW);//when need to enable write mem?
	assign cu_shift  =(opcode == `OP_ALUOp && func[5:3] == 3'b0);
	assign cu_aluimm =(opcode != `OP_ALUOp && opcode !=`OP_BNE&&opcode !=`OP_BEQ     );//when need to use imm?
	///////////////////////////////////////////////////////
	always @ (posedge clk or posedge rst)
		if(rst == 1)begin
		end
		else begin
			wb_instr[31:0] <= mem_instr[31:0];
			mem_instr[31:0] <= ex_instr[31:0];
			ex_instr[31:0] <= instr[31:0];
		end
	
	always @(clk) begin
			case(opcode)
			   `OP_LW:cu_aluc <=`ALU_ADD;
            `OP_SW:cu_aluc <=`ALU_ADD;
				`OP_BNE: cu_aluc  <=`ALU_SUB;//!
				`OP_BEQ: cu_aluc  <=`ALU_SUB;//!
				`OP_ADDI: cu_aluc <=`ALU_ADD;//!
				`OP_ANDI: cu_aluc <=`ALU_AND;//!
				`OP_ORI: cu_aluc  <=`ALU_OR;//!
				`OP_ALUOp: begin
					case(func)
						`FUNC_ADD: cu_aluc <= `ALU_ADD;
						`FUNC_SUB: cu_aluc <= `ALU_SUB;
						`FUNC_AND: cu_aluc <= `ALU_AND;
						`FUNC_OR: cu_aluc  <= `ALU_OR;
						`FUNC_NOR: cu_aluc <= `ALU_NOR;
						`FUNC_SLT: cu_aluc <= `ALU_SLT;
						`FUNC_SLL: cu_aluc <= `ALU_SLL;
						`FUNC_SRL: cu_aluc <= `ALU_SRL;
						`FUNC_SRA: cu_aluc <= `ALU_SRA;
						default: cu_aluc <= `ALU_NONE;
					endcase
				end
				default: cu_aluc <= `ALU_NONE;
			endcase
		end
endmodule
