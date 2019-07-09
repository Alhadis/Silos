`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:41 03/18/2014 
// Design Name: 
// Module Name:    id_stage 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//id_stage
module id_stage (clk, rst, if_inst, if_pc4, wb_destR, wb_dest,wb_wreg, 
	cu_wreg, cu_m2reg, cu_wmem, cu_aluc, cu_shift, cu_aluimm, cu_branch, id_pc4, id_inA, id_inB, 
id_imm, cu_regrt, rt, rd, 
	IF_ins_type, IF_ins_number, ID_ins_type, ID_ins_number, which_reg, reg_content, id_wpcir);
	
	input clk;
	input rst;
	input [31:0] if_inst;        //the instruction
	input [31:0] if_pc4;         // the result of pc+4
	
	input [4:0] wb_destR;      //  the reg to write 
	input [31:0] wb_dest;        //
	input wb_wreg;           //the data written to the register
	
	input[3:0] IF_ins_type;       //the type of the instruction now in the id
	input[3:0] IF_ins_number;        // the pc of the instruction now in the id 
	
	input [4:0] which_reg;           //  the reg to display
	output [31:0] reg_content;		// the content of the register
	
	output cu_branch;
	output cu_wreg;
	output cu_m2reg;
	output cu_wmem;
	output [3:0] cu_aluc;
	output cu_shift;
	output cu_aluimm;
	output [31:0] id_pc4;
	output [31:0] id_inA;
	output [31:0] id_inB;
	output [31:0] id_imm;
	output [4:0] cu_regrt;
	output [4:0] rd;
	output [4:0] rt;
	output id_wpcir;
	output[3:0] ID_ins_type;
	output[3:0] ID_ins_number;
	
	wire cu_wpcir;  //
	wire cu_sext;
	wire cu_regrt;
	wire cu_branch;
	
	reg [31:0] reg_inst;
	reg [31:0] pc4;
	
	wire [31:0] rdata_A;
	wire [31:0] rdata_B;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [15:0] imm;
	wire [31:0] id_imm;
	
	wire [31:0] id_pc4;
	
	reg[3:0] ID_ins_type;
	reg[3:0] ID_ins_number;
	assign id_wpcir = cu_wpcir;  //
	assign imm = reg_inst[15:0];
	assign rt= reg_inst[20:16];
	assign rd = reg_inst[15:11];
	assign id_imm = cu_sext?( imm[15]?{16'b1,imm}:{16'b0,imm}):{16'b0,imm};
	assign id_pc4 =pc4;		//! pc4
	
	always @ (posedge clk or posedge rst) begin
		if (rst==1)begin
			reg_inst <= 32'b00000_100000;//#
		end
		else begin
			if(!cu_wpcir) begin
				reg_inst <= if_inst;
				pc4 <=if_pc4;	//! if_pc4
				ID_ins_number <= IF_ins_number;	
				ID_ins_type <= IF_ins_type;				
			end
			else begin
				reg_inst <= 32'h0;
				ID_ins_type <= `INST_TYPE_NONE;
			end

			

	
		end
	end
		
	
	regfile x_regfile(clk, rst, reg_inst[25:21], reg_inst[20:16], wb_destR, wb_dest, wb_wreg, 
rdata_A, rdata_B,
		which_reg, reg_content);
	ctrl_unit x_ctrl_unit(clk, rst, if_inst[31:0], reg_inst[31:0],
		cu_branch, cu_wreg, cu_m2reg, cu_wmem, cu_aluc, cu_shift, cu_aluimm, 
cu_sext,cu_regrt,cu_wpcir);
	
	assign id_inA=rdata_A;
	assign id_inB=rdata_B;//! rdata_B
endmodule
