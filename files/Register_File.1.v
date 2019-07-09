// build a register file
module Register_File
	(
		clk,
		rst,
		readaddress1,
		readaddress2,
		writeaddress,
		writedata,
		write,
		readdata1,
		readdata2
	);
	
	// inputs and outputs
	input			clk;
	input			rst;
	input			write;
	input	[4:0]	readaddress1;
	input	[4:0]	readaddress2;
	input	[4:0]	writeaddress;
	input	[31:0]	writedata;
	output	[31:0]	readdata1;
	output	[31:0]	readdata2;
	
	// registers
	reg[31:0] register[31:0];
	
	// build module
	
	// read part
	assign readdata1 = register[readaddress1];
	assign readdata2 = register[readaddress2];
	
	// write part
	always @(posedge clk)
	begin
		if(rst)
		begin
			register[0] <= 0;
			register[1] <= 1;
			register[2] <= 2;
			register[3] <= 3;
			register[4] <= 4;
			register[5] <= 5;
			register[6] <= 6;
			register[7] <= 7;
			register[8] <= 8;
			register[9] <= 9;
			register[10] <= 10;
			register[11] <= 11;
			register[12] <= 12;
			register[13] <= 13;
			register[14] <= 14;
			register[15] <= 15;
			register[16] <= 16;
			register[17] <= 17;
			register[18] <= 18;
			register[19] <= 19;
			register[20] <= 20;
			register[21] <= 21;
			register[22] <= 22;
			register[23] <= 23;
			register[24] <= 24;
			register[25] <= 25;
			register[26] <= 26;
			register[27] <= 27;
			register[28] <= 28;
			register[29] <= 29;
			register[30] <= 30;
			register[31] <= 31;
		end
		else
			if((|writeaddress) & write)
				register[writeaddress] <= writedata;
	end
	
endmodule
