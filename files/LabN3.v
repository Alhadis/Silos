module labN;
reg [31:0] entryPoint, zero;
reg RegDst, RegWrite, clk, ALUSrc, MemRead, MemWrite, Mem2Reg, INT, branch, jump;
reg [2:0] op;
wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z, PCin;
wire [25:0] jTarget;
assign zero = 0; 

yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
yWB myWB(wb, z, memOut, Mem2Reg);
assign wd = wb;
yPC myPC(PCin, PCp4,INT,entryPoint,imm,jTarget,zero,branch,jump);

assign opCode = ins[31:26];
yC1 myC1(rtype, lw, sw, jump, branch, opCode);
yC2 myC2(RegDst, ALUSrc, RegWrite, Mem2Reg, MemRead, MemWrite, rtype, lw, sw, branch);
assign fnCode = ins[5:0];
yC3 myC3(ALUop, rtype, branch);
yC4 myC4(op, ALUop, fnCode);

repeat (43)
		begin
                clk = 1; #1; INT = 0; 
	 
				op = 3'b010;
	 
				clk = 0; #1;

				$display("%h: rd1=%2d rd2=%2d z=%3d zero=%b wb=%2d", ins, rd1, rd2, z, zero, wb);
				
         end
			$finish; 
end
endmodule