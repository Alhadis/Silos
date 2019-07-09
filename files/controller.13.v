`timescale 1ns / 1ps
/*
module datapath(
		output [6:0] IW2Contr,
		output [15:0] pcOut, z, p2,
		input [31:0] IW,
		input [15:0] memOut,
		input LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst,
		input [1:0] selM1, selM2, selM3, fnSel);*/
module controller(
		input [6:0] IW2Contr,
		input rstIn, clk,
		output LPC,
		output reg rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		output reg [1:0] selM1, selM2, selM3, fnSel);
	
	assign LPC = clk;
	
	always@(IW2Contr or negedge rstIn or posedge clk)
	begin
		if(rstIn == 0)
		begin
			PCrst = 0;
			rd1=0;
			rd2=0;
			wr_contr=0;
			isJumpInstr=0;
			isCallInstr=0;
			Lflag_contr=0;
			selM1=2'b11;
			selM2=2'b11;
			selM3=2'b11;
			fnSel=2'b11;
			rdM=0;
			wrM_contr=0;
		end
		else
		begin
			PCrst = 1;
			if(IW2Contr[6] == 0 && (IW2Contr[5:3] == 3'b000 || IW2Contr[5:3] == 3'b001 || IW2Contr[5:3] == 3'b010 || IW2Contr[5:3] == 3'b011) && IW2Contr[2] == 0) //{add, sub, and, or}i - rd2, wr_contr, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr, REST=disable
			begin
				rd1=0;
				rd2=1;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b10;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
				$display("rd2, wr_contr, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr, REST=disable\n");
			end
			
			else if(IW2Contr[6] == 0 && (IW2Contr[5:3] == 3'b000 || IW2Contr[5:3] == 3'b001 || IW2Contr[5:3] == 3'b010 || IW2Contr[5:3] == 3'b011) && IW2Contr[2] == 1) //{add, sub, and, or}r - rd1, rd2, wr_contr, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr
			begin
				rd1=1;
				rd2=1;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b01;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
				$display("rd1, rd2, wr_contr, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr");
			end
			
			else if(IW2Contr[6:2] == 5'b01000) //mnsi - rd2, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr
			begin
				rd1=0;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b10;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:2] == 5'b01000) //mnsr - rd1, rd2, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr
			begin
				rd1=1;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b01;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:3] == 4'b0101) //cmp - rd2, wr_contr, selM2=01, fnSel=01, selM3=10, Lflag_contr
			begin
				rd1=0;
				rd2=1;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b11;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:4] == 3'b100 && IW2Contr[2:1] == 2'b00) // li - wr_contr, selM2=10, fnSel=01, selM3=10
			begin
				rd1=0;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b10;
				selM3=2'b10;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:4] == 3'b100 && IW2Contr[2:1] == 2'b01) //lr - rd1, wr_contr, selM2=00, fnSel=01, selM3=10
			begin
				rd1=1;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b00;
				selM3=2'b10;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:4] == 3'b100 && IW2Contr[2:1] == 2'b10) //la - rd1, wr_contr, selM1=01, selM2=10, fnSel=10, rdM, selM3=01
			begin
				rd1=1;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b01;
				selM2=2'b10;
				selM3=2'b01;
				fnSel=2'b10;
				rdM=1;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:4] == 3'b101) // sta - rd1, rd2, selM1=01, selM2=10, fnSel=10, wrM_contr
			begin
				rd1=1;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b01;
				selM2=2'b10;
				selM3=2'b11;
				fnSel=2'b10;
				rdM=0;
				wrM_contr=1;
			end
			
			else if(IW2Contr[6:4] == 3'b110) //{j, jz, ..., jnm} - isJumpInstr
			begin
				rd1=0;
				rd2=0;
				wr_contr=0;
				isJumpInstr=1;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b11;
				selM3=2'b11;
				fnSel=2'b11;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:3] == 4'b1110) //jal - isCallInstr, wr_contr, selM3=00,  selM1=00, selM2=10, fnSel=10
			begin
				rd1=0;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=1;
				Lflag_contr=0;
				selM1=2'b00;
				selM2=2'b10;
				selM3=2'b00;
				fnSel=2'b10;
				rdM=0;
				wrM_contr=0;
			end
			
			else if(IW2Contr[6:3] == 4'b1111) // jr - isCallInstr, rd2, selM2=01, fnSel=01
			begin
				rd1=0;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=1;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b01;
				selM3=2'b11;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
			end
			
			else
			begin
				$display("UNDEFINED INSTRUCTION");
			end
		end
	end
endmodule

module tb_controller;
/*module controller(
		input [6:0] IW2Contr,
		input rstIn, clk,
		output LPC,
		output reg rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		output reg [1:0] selM1, selM2, selM3, fnSel);*/
		
		reg [6:0] IW2Contr;
		reg rstIn, clk;
		wire LPC;
		wire rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr;
		wire [1:0] selM1, selM2, selM3, fnSel;
		
		controller uut(
		IW2Contr,
		rstIn, clk,
		LPC,
		rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		selM1, selM2, selM3, fnSel);
		
		// Clock generator
		initial
		begin
			clk = 1;
			forever #5 clk = ~clk;
		end
		
		initial
		begin
			rstIn = 0;
			#10; rstIn=1; IW2Contr = 7'b0000000; $display("addi");
			#10; IW2Contr = 7'b0000100; $display("addr");
			#1; $finish;
		end
endmodule
