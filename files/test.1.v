module test();

reg clk;
reg reset;

pipeline p(clk, reset);

initial begin

	//100000 LB
  	//100011 LW
  	//000000 ADD
  	//101000 SB
  	//101011 SW
  	//111111 ADDSLW
  	//000101 BNZ
	
	//Instruction 0 Load a 1 to to reg 0
	p.MEM.bytes[3] <= 8'b10000000;
	p.MEM.bytes[2] <= 8'b00011111;
	p.MEM.bytes[1] <= 8'b00000000;
	p.MEM.bytes[0] <= 8'b00100000;

	//Instruction 1 Load a 4 to reg 10000
	p.MEM.bytes[7] <= 8'b10000010;
	p.MEM.bytes[6] <= 8'b00011111;
	p.MEM.bytes[5] <= 8'b00000000;
	p.MEM.bytes[4] <= 8'b00100100;

	//Instruction 2 Load a 1...100 to  reg 10001
	p.MEM.bytes[11] <= 8'b10000010;
	p.MEM.bytes[10] <= 8'b00111111;
	p.MEM.bytes[9] <= 8'b00000000;
	p.MEM.bytes[8] <= 8'b00101000;

	//Instruction 3 Load element of array to reg 1
	p.MEM.bytes[15] <= 8'b10001100;
	p.MEM.bytes[14] <= 8'b00111111;
	p.MEM.bytes[13] <= 8'b00000000;
	p.MEM.bytes[12] <= 8'b00101100;

	//Instruction 4 Add reg 2 + 1 to reg 2
	p.MEM.bytes[19] <= 8'b00000000;
	p.MEM.bytes[18] <= 8'b01000001;
	p.MEM.bytes[17] <= 8'b00010000;
	p.MEM.bytes[16] <= 8'b00000000;

	//Instruction 4 Store
	p.MEM.bytes[23] <= 8'b10101110;
	p.MEM.bytes[22] <= 8'b00111111;
	p.MEM.bytes[21] <= 8'b00000000;
	p.MEM.bytes[20] <= 8'b01000000;

	//Instruction 4 Branch back to loop
	p.MEM.bytes[27] <= 8'b00010110;
	p.MEM.bytes[26] <= 8'b00100000;
	p.MEM.bytes[25] <= 8'b00000000;
	p.MEM.bytes[24] <= 8'b00000100;

	//Instruction 4 Add bnz
	p.MEM.bytes[31] <= 8'b10101100;
	p.MEM.bytes[30] <= 8'b00100000;
	p.MEM.bytes[29] <= 8'b00000000;
	p.MEM.bytes[28] <= 8'b00100010;
	
	//DATA
	p.MEM.bytes[35] <= 8'b00000000;
	p.MEM.bytes[34] <= 8'b00000000;
	p.MEM.bytes[33] <= 8'b00000000;
	p.MEM.bytes[32] <= 8'b00000001;

	p.MEM.bytes[39] <= 8'b00000000;
	p.MEM.bytes[38] <= 8'b00000000;
	p.MEM.bytes[37] <= 8'b00000000;
	p.MEM.bytes[36] <= 8'b00000100;

	p.MEM.bytes[43] <= 8'b11111111;
	p.MEM.bytes[42] <= 8'b11111111;
	p.MEM.bytes[41] <= 8'b11111111;
	p.MEM.bytes[40] <= 8'b11111100;

	p.MEM.bytes[47] <= 8'b00000000;
	p.MEM.bytes[46] <= 8'b00000000;
	p.MEM.bytes[45] <= 8'b00000000;
	p.MEM.bytes[44] <= 8'b00000101;

	clk <=0;
	p.F.pc <= 0;
end

always begin
	clk = ~clk;
	#25;
end

endmodule