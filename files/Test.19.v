`timescale 1ns/1ns
module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg				Sel;
	wire  			SRAMWEn;
	wire 	[17:0]	SRAMaddress;
	wire 	[5:0]	Instruction;
	wire 	[15:0]	SRAMdata;

	assign SRAMdata = (SRAMWEn) ? 16'h0400 : {16{1'bz}};
	// module under test
	MIPS UUT
	(
		.clk(clk),
		.rst(rst),
		.Sel(Sel),
		.SRAMWEn(SRAMWEn), 		//	SRAM Write Enable
		.SRAMaddress(SRAMaddress), 	//	SRAM Address bus 18 Bits
		.SRAMdata(SRAMdata) 		//	SRAM Data bus 16 Bits
	);

	// write a test

	initial repeat (900) #(10) clk = ~clk;

	initial
	begin
				clk = 0; 	rst = 0;	Sel = 1;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
		#( 3300 )	Sel = 1;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
	end

endmodule
