`timescale 1ns/1ns
module test;

	// registers and wires
	reg				clk;
	reg				rst;
	reg				sel;
	wire  			SRAMWEn;
	wire 	[17:0]	SRAMaddress;
	wire 	[15:0]	SRAMdata;

	// module for test
 SRAM sram
  (
    .clk(clk),
    .rst(rst),
    .write(SRAMWEn),
    .address(SRAMaddress),
    .data(SRAMdata)
  );
	// defparam sram.data_lenght = 20;

	// module under test
	MIPS UUT
	(
		.clk(clk),
		.rst(rst),
		.sel(sel),
		.SRAMWEn(SRAMWEn), 		//	SRAM Write Enable
		.SRAMaddress(SRAMaddress), 	//	SRAM Address bus 18 Bits
		.SRAMdata(SRAMdata) 		//	SRAM Data bus 16 Bits
	);

	// write a test

	initial repeat (2000) #(10) clk = ~clk;

	initial
	begin
				clk = 0; 	rst = 0;	sel = 1;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
		#( 10000 )	sel = 0;
		#( 35 ) rst = 1;
		#( 40 ) rst = 0;
	end

endmodule
