
`timescale 1ns / 1ps

`include "macro.vh"	

////////////////////////////////////////////////////////////////////////////////

// Company: 

// Engineer:

//

// Create Date:   19:36:54 03/24/2014

// Design Name:   ctrl_unit

// Module Name:   D:/STUDY/pipeLineCPU/pipeLineCPU/test_CU.v

// Project Name:  pipeLineCPU

// Target Device:  

// Tool versions:  

// Description: 

//

// Verilog Test Fixture created by ISE for module: ctrl_unit

//

// Dependencies:

// 

// Revision:

// Revision 0.01 - File Created

// Additional Comments:

// 

////////////////////////////////////////////////////////////////////////////////




module test_CU;




	// Inputs

	reg clk;

	reg rst;

	reg [31:0] if_instr;

	reg [31:0] instr;




	// Outputs

	wire cu_branch;

	wire cu_wreg;

	wire cu_m2reg;

	wire cu_wmem;

	wire [3:0] cu_aluc;

	wire cu_shift;

	wire cu_aluimm;

	wire cu_sext;

	wire cu_regrt;
	
	wire cu_wpcir;

	wire AfromEx;
	wire BfromEx;
	wire AfromMem;
	wire BfromMem;
	wire AfromExLW;
	wire BfromExLW;
	wire AfromMemLW;
	wire BfromMemLW;
	wire [31:0] mem_instr;
	wire [31:0] wb_instr;


	// Instantiate the Unit Under Test (UUT)

	ctrl_unit uut (

		.clk(clk), 

		.rst(rst), 

		.if_instr(if_instr), 

		.instr(instr), 

		.cu_branch(cu_branch), 

		.cu_wreg(cu_wreg), 

		.cu_m2reg(cu_m2reg), 

		.cu_wmem(cu_wmem), 

		.cu_aluc(cu_aluc), 

		.cu_shift(cu_shift), 

		.cu_aluimm(cu_aluimm), 

		.cu_sext(cu_sext), 

		.cu_regrt(cu_regrt),
		.cu_wpcir(cu_wpcir),
		.AfromEx(AfromEx),
		.BfromEx(BfromEx),
		.AfromMem(AfromMem),
		.BfromMem(BfromMem),
		.AfromExLW(AfromExLW),
		.BfromExLW(BfromExLW),
		.AfromMemLW(AfromMemLW),
		.BfromMemLW(BfromMemLW),
		.wb_instr(wb_instr),
		.mem_instr(mem_instr)
	);	

	parameter FULL_CYC = 40, HALF_CYC = FULL_CYC/2;

	initial begin

		// Initialize Inputs

		clk = 0;

		rst = 0;

		if_instr = 0;

		instr = 0;




		/*#15;instr[31:26] = `OP_LW;

		#FULL_CYC;instr[31:26] = `OP_SW;

		#FULL_CYC;instr[31:26] = `OP_BEQ;

		#FULL_CYC;instr[31:26] = `OP_BNE;

		#FULL_CYC;instr[31:26] = `OP_ADDI;

		#FULL_CYC;instr[31:26] = `OP_ANDI;

		#FULL_CYC;instr[31:26] = `OP_ORI;

		#FULL_CYC;instr[31:26] = `OP_ALUOp;

		

		#FULL_CYC;instr[5:0] = `FUNC_ADD;

		#FULL_CYC;instr[5:0] = `FUNC_SUB;

		#FULL_CYC;instr[5:0] = `FUNC_AND;

		#FULL_CYC;instr[5:0] = `FUNC_OR;

		#FULL_CYC;instr[5:0] = `FUNC_NOR;

		#FULL_CYC;instr[5:0] = `FUNC_SLT;

		#FULL_CYC;instr[5:0] = `FUNC_SLL;

		#FULL_CYC;instr[5:0] = `FUNC_SRL;

		#FULL_CYC;instr[5:0] = `FUNC_SRA;
		*/
		
		#15;if_instr[31:0]=32'h8c010014;
		
		#FULL_CYC;
		instr[31:0]=32'h8c010014;
		if_instr[31:0] = 32'h8c020015;
		
		#FULL_CYC;
		instr[31:0] = 32'h8c020015;
		if_instr[31:0] = 32'h0022_1820;
		
		#FULL_CYC;
		instr[31:0] = 32'h0022_1820;
		if_instr[31:0] = 32'h0000_1020;
		
		#FULL_CYC;
		instr[31:0] = 32'h0000_1020;
		if_instr[31:0] = 32'h0023_2022;
		
		#FULL_CYC;
		instr[31:0] = 32'h0023_2022;
		if_instr[31:0] = 32'h0064_2824;
		
		#FULL_CYC;
		instr[31:0] = 32'h0064_2824;
		if_instr[31:0] = 32'h0085_3027;
		
		#FULL_CYC;
		instr[31:0] = 32'h0085_3027;
		if_instr[31:0] = 32'hac06_0016;
		
		#FULL_CYC;
		instr[31:0] = 32'hac06_0016;
		if_instr[31:0] = 32'h10c7_fff8;		
	end

	

	always #HALF_CYC clk = ~clk;




endmodule