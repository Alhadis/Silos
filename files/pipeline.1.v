`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:41:22 06/28/2019 
// Design Name: 
// Module Name:    pipeline 
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
module pipeline#(parameter len = 32)(
	input clk,
	input reset,
	//IF
	input writeProgramMemory,
	input [31:0]dataFromInterface,
	input [31:0]addrFromInterface
   );
	

//Latches
//IF
wire [31:0] if_instruction;
wire [31:0] if_nextins;

//ID
reg [31:0] id_instruction = 0;
reg [31:0] id_nextins = 0;
wire [31:0] id_jumpins;
wire [31:0] id_extended;
wire [31:0] id_rdata1;
wire [31:0] id_rdata2;
wire id_jump, id_branch, id_memread, id_memtoreg, 
	id_memwrite, id_alusrc, id_regwrite;
wire [1:0] id_aluop;
wire[4:0] id_wregister;

//EX
reg [31:0] ex_instruction = 0;
reg [5:0] ex_function = 0;
reg [31:0] ex_nextins = 0;
reg [31:0] ex_jumpins = 0;
reg [31:0] ex_extended = 0;
reg [31:0] ex_rdata1 = 0;
reg [31:0] ex_rdata2 = 0;
reg ex_jump = 0, ex_branch = 0, ex_memread = 0, 
	ex_memtoreg = 0,	ex_memwrite = 0, 
	ex_alusrc = 0, ex_regwrite = 0;
reg [1:0] ex_aluop = 0;
reg[4:0] ex_wregister = 0;
wire [31:0] ex_aluout;
wire [31:0] ex_branchins;
wire ex_zero;


//MA	
reg [31:0] ma_instruction = 0;
reg [31:0] ma_fromalu = 0;
reg [31:0] ma_writedata = 0;
reg [31:0] ma_nextins = 0;
reg [31:0] ma_jumpins = 0;
reg [31:0] ma_branchins = 0;
reg ma_branch = 0, ma_jump = 0, ma_zero = 0, ma_memread = 0, ma_memwrite = 0,
	ma_memtoreg = 0, ma_regwrite = 0;
reg[4:0] ma_wregister = 0;
wire [31:0] ma_rdatamem;
wire ma_pcsrc;

//WB
reg [31:0] wb_instruction = 0;
reg [31:0] wb_fromalu = 0;
reg [31:0] wb_frommemory = 0;
reg wb_jump = 0, wb_regwrite = 0, wb_memtoreg = 0;
reg[4:0] wb_wregister = 0;
wire [31:0] wb_writedata;

always@(negedge clk)
begin
// IF/ID
id_instruction <= if_instruction;
id_nextins		<= if_nextins;
// ID/EX
ex_instruction <= id_instruction;
ex_function <= id_instruction[5:0];
ex_nextins	<= id_nextins;
ex_jumpins 	<= id_jumpins;
ex_extended <= id_extended;
ex_rdata1	<= id_rdata1;
ex_rdata2	<= id_rdata2;
ex_wregister <= id_wregister;

ex_jump 		<= id_jump;
ex_branch 	<= id_branch;
ex_memread 	<= id_memread;
ex_memtoreg <= id_memtoreg;
ex_aluop 	<= id_aluop;
ex_memwrite <= id_memwrite;
ex_alusrc   <= id_alusrc;
ex_regwrite <= id_regwrite;
// EX/MA
ma_instruction <= ex_instruction;
ma_fromalu 		<= ex_aluout;
ma_writedata 	<= ex_rdata2;
ma_nextins		<= ex_nextins;
ma_jumpins		<= ex_jumpins;
ma_branchins	<= ex_branchins;
ma_wregister 	<= ex_wregister;

ma_branch	<= ex_branch;
ma_jump		<= ex_jump;
ma_zero		<= ex_zero;
ma_memread	<= ex_memread;
ma_memwrite <= ex_memwrite;
ma_memtoreg <= ex_memtoreg;
ma_regwrite <= ex_regwrite;		
// MA/WB
wb_instruction <= ma_instruction;
wb_fromalu 		<= ma_fromalu;
wb_frommemory 	<= ma_rdatamem;
wb_wregister	<= ma_wregister;
wb_memtoreg		<= ma_memtoreg;

wb_jump		<= ma_jump;
wb_regwrite	<= ma_regwrite;

if(reset)
begin
	id_instruction <= 0;
	id_nextins		<= 0;
	// ID/EX
	ex_instruction <= 0;
	ex_function <= 0;
	ex_nextins	<= 0;
	ex_jumpins 	<= 0;
	ex_extended <= 0;
	ex_rdata1	<= 0;
	ex_rdata2	<= 0;
	ex_wregister <= 0;

	ex_jump 		<= 0;
	ex_branch 	<= 0;
	ex_memread 	<= 0;
	ex_memtoreg <= 0;
	ex_aluop 	<= 0;
	ex_memwrite <= 0;
	ex_alusrc   <= 0;
	ex_regwrite <= 0;
	// EX/MA
	ma_instruction <= 0;
	ma_fromalu 		<= 0;
	ma_writedata 	<= 0;
	ma_nextins		<= 0;
	ma_jumpins		<= 0;
	ma_branchins	<= 0;
	ma_wregister 	<= 0;

	ma_branch	<= 0;
	ma_jump		<= 0;
	ma_zero		<= 0;
	ma_memread	<= 0;
	ma_memwrite <= 0;
	ma_memtoreg <= 0;
	ma_regwrite <= 0;	
	// MA/WB
	wb_instruction <= 0;
	wb_fromalu 		<= 0;
	wb_frommemory 	<= 0;
	wb_wregister	<= 0;
	wb_memtoreg		<= 0;
	
	wb_jump		<= 0;
	wb_regwrite	<= 0;
end
end

//IF
//nextIns;	address of ins + 4

	
instruction_fetch IF(
	.reset(reset), 
	.clk(clk), 
	.Wr(writeProgramMemory), 
	.dataFromInterface(dataFromInterface), 
	.addrFromInterface(addrFromInterface),
	.pm_out(if_instruction), 
	.nextIns(if_nextins), //adder_out
	.PCSrc(ma_pcsrc),
	.Jump(ma_jump),
	.branchIns(ma_branchins),
	.jumpIns(ma_jumpins)
);
	
instruction_decode ID(
	.clk(clk), 
	.reset(reset),
	.instruction(id_instruction), 
	.WriteData(wb_writedata),
	.nextIns(id_nextins), 
	.Branch(id_branch), 
	.MemRead(id_memread), 
	.MemtoReg(id_memtoreg), 
	.AluOp(id_aluop), 
	.Jump(id_jump),
	.MemWrite(id_memwrite), 
	.AluSrc(id_alusrc), 
	.ReadData1(id_rdata1), 
	.ReadData2(id_rdata2), 
	.extendOut(id_extended),
	.jumpIns(id_jumpins),
	.WB_WriteRegister(wb_wregister),	//in
	.WB_RegWrite(wb_regwrite),		//in
	.WriteRegister(id_wregister), //out
	.RegWrite(id_regwrite)			//out
);

execution EX(
	.insFunction(ex_function), 
	.ALUOp(ex_aluop), 
	.next_ins(ex_nextins), 
	.rd1(ex_rdata1), 
	.rd2(ex_rdata2), 
	.extendIn(ex_extended), 
	.ALUSrc(ex_alusrc), 
	.zero(ex_zero), 
	.ALUout(ex_aluout), 
	.ADDout(ex_branchins)
);

memory_access MA(
	.clk(clk), 
	.Branch(ma_branch), 
	.Zero(ma_zero), 
	.MemWrite(ma_memwrite), 
	.MemRead(ma_memread), 
	.Address(ma_fromalu), //The address comes from the alu
	.writeDataMemory(ma_writedata),
	//.nextIns(ma_nextins), 
	//.branchIns(ma_branchins), 
	.memoryOut(ma_rdatamem),
	//.branchMux(ma_muxins),
	.PCSrc(ma_pcsrc)
);

//WB
write_back WB(
	//.Jump(wb_jump), 
	.MemToReg(wb_memtoreg), 
	//.branchMux(wb_muxins), 
	//.jumpIns(wb_jumpins),
	.dataFromAlu(wb_fromalu), 
	.dataFromMemory(wb_frommemory), 
	.dataMux(wb_writedata)
	//.jumpMux(wb_executeins)
);

endmodule

