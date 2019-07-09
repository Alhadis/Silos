module IDEXBuffer(clk,hazard,reset,opcode,RA1,RA2,FN_offset,RD1,RD2,SE_offset,regWrite,r0Write,alusource,alusource2,memRead,memWrite,memSource,opcode_o,RA1_o,RA2_o,FN_offset_o,RD1_o,RD2_o,SE_offset_o,regWrite_o,r0Write_o,alusource_o,alusource2_o,memRead_o,memWrite_o,memSource_o);
	input clk, hazard, reset,regWrite,r0Write,alusource,alusource2,memRead,memWrite,memSource;
	input[3:0] RA1,RA2,FN_offset,opcode;
	input[15:0] SE_offset,RD1,RD2;
	output reg regWrite_o,r0Write_o,alusource_o,alusource2_o,memRead_o,memWrite_o,memSource_o;
	output reg[3:0] RA1_o,RA2_o,opcode_o,FN_offset_o;
	output reg[15:0] SE_offset_o,RD1_o,RD2_o;

	always @(posedge clk or negedge reset)
	begin
		if (!reset || hazard) begin
			opcode_o <= 0;
			RA1_o <= 0;
			RA2_o <= 0;
			FN_offset_o <= 0;
			RD1_o <= 0;
			RD2_o <= 0;
			SE_offset_o <= 0;
			regWrite_o <= 0;
			r0Write_o <= 0;
			alusource_o <= 0;
			alusource2_o <= 0;
			memRead_o <= 0;
			memWrite_o <= 0;
			memSource_o <= 0;
		end
		else begin
			opcode_o <= opcode;
			RA1_o <= RA1;
			RA2_o <= RA2;
			FN_offset_o <= FN_offset;
			RD1_o <= RD1;
			RD2_o <= RD2;
			SE_offset_o <= SE_offset;
			regWrite_o <= regWrite;
			r0Write_o <= r0Write;
			alusource_o <= alusource;
			alusource2_o <= alusource2;
			memRead_o <= memRead;
			memWrite_o <= memWrite;
			memSource_o <= memSource;
		end
	end
endmodule