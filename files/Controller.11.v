`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:36 10/27/2013 
// Design Name: 
// Module Name:    Controller 
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
module Controller
(
	input[5:0] op,
	input[5:0] fn,
	
	output reg[1:0] regDst,
	output reg writeEn,
	
	output reg ALUimm,
	output reg Alufn,
	output reg logicfn,
	output reg fnClass,
	
	output reg RegImm,
	output reg AL,
	output reg leftright,
	
	output reg DWrite,
	output reg DRead,
	
	output reg[2:0] brType,
	output reg[1:0] PCSel,
	
	output reg[1:0] RegInData
);

wire r_i;
assign r_i=op[3]|op[2]|op[1]|op[0];

always@(op,fn)
begin
	casex({op,fn})
	   //Arithmetic
		//add registers
		12'b000000000001:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'b0;
							Alufn		<=	1'b0;
							logicfn	<=	1'bx;
							fnClass	<=	1'b0;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b01;
						 end
		//compliment register				 
		12'b000000000010:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'b0;
							Alufn		<=	1'b1;
							logicfn	<=	1'bx;
							fnClass	<=	1'b0;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b01;
						 end
		//add immediate				 
		12'b000001xxxxxx:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'b1;
							Alufn		<=	1'b0;
							logicfn	<=	1'bx;
							fnClass	<=	1'b0;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b01;
						 end
		//compliment imm
		12'b000010xxxxxx:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'b1;
							Alufn		<=	1'b1;
							logicfn	<=	1'bx;
							fnClass	<=	1'b0;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b01;
						 end
		//Logical
		12'b100000000001:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'b0;
							fnClass	<=	1'b1;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b01;
						 end
		
		12'b100000000010:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'b1;
							fnClass	<=	1'b1;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b01;
						 end
		//Shifter
		12'b110000000000:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'b0;
							AL			<=	1'b1;
							leftright<=	1'b1;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b11;
						 end
		
		12'b110000100000:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'b0;
							AL			<=	1'b1;
							leftright<=	1'b0;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b11;
						 end
		
		12'b110000000001:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'b1;
							AL			<=	1'b1;
							leftright<=	1'b1;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b11;
						 end
		
		12'b110000100001:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'b1;
							AL			<=	1'b1;
							leftright<=	1'b0;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b11;
						 end
		
		12'b110000100010:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'b0;
							AL			<=	1'b0;
							leftright<=	1'b0;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b11;
						 end
		
		12'b110000100011:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b1;
							RegImm	<=	1'b1;
							AL			<=	1'b0;
							leftright<=	1'b0;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b11;
						 end
		//LoadStore
		12'b110100xxxxxx:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'b01;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'b1;
							Alufn		<=	1'b0;
							logicfn	<=	1'bx;
							fnClass	<=	1'b0;
							DRead		<=	1'b1;
							DWrite	<=	1'b0;
							RegInData<=	2'b00;
						 end
		
		12'b110101xxxxxx:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b00;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'b1;
							Alufn		<=	1'b0;
							logicfn	<=	1'bx;
							fnClass	<=	1'b0;
							DRead		<=	1'b0;
							DWrite	<=	1'b1;
							RegInData<=	2'bxx;
						 end
		//Branch
		12'b010001xxxxxx:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b01;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010000000001:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b11;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010010xxxxxx:begin
							brType	<=	3'b100;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010011xxxxxx:begin
							brType	<=	3'b000;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010100xxxxxx:begin
							brType	<=	3'b101;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010101xxxxxx:begin
							brType	<=	3'b001;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010110xxxxxx:begin
							brType	<=	3'b110;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b010111xxxxxx:begin
							brType	<=	3'b010;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b011000xxxxxx:begin
							brType	<=	3'b111;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b011001xxxxxx:begin
							brType	<=	3'b011;
							PCSel		<=	2'b10;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
		
		12'b011010xxxxxx:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b01;
							regDst	<=	2'b11;
							writeEn	<=	1'b1;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b10;
						 end
						 
		12'b010000000010:begin
							brType	<=	3'bxxx;
							PCSel		<=	2'b11;
							regDst	<=	2'bxx;
							writeEn	<=	1'b0;
							RegImm	<=	1'bx;
							AL			<=	1'bx;
							leftright<=	1'bx;
							ALUimm	<=	1'bx;
							Alufn		<=	1'bx;
							logicfn	<=	1'bx;
							fnClass	<=	1'bx;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'bxx;
						 end
						 
		default:		 begin
							brType	<=	3'b000;
							PCSel		<=	2'b00;
							regDst	<=	2'b00;
							writeEn	<=	1'b0;
							RegImm	<=	1'b0;
							AL			<=	1'b0;
							leftright<=	1'b0;
							ALUimm	<=	1'b0;
							Alufn		<=	1'b0;
							logicfn	<=	1'b0;
							fnClass	<=	1'b0;
							DRead		<=	1'b0;
							DWrite	<=	1'b0;
							RegInData<=	2'b00;
						 end
		
	endcase
end


endmodule
