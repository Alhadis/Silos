`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	Ali Behrouzi 9532266
//
// Create Date:   17:54:50 07/03/2019
// Design Name:   FPGA
// Module Name:   D:/darsi/fpga/Project/project/t6.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t6;

	// Inputs
	reg [3:0] CRC1;
	reg [3:0] CRC2;
	reg [3:0] CRC3;
	reg [3:0] CRC4;
	reg [3:0] CRC5;
	reg [3:0] CRC6;
	reg [3:0] CRC7;
	reg [3:0] CRC8;
	reg [3:0] CRC9;
	reg [3:0] CRC10;
	reg [3:0] CRC11;
	reg [3:0] CRC12;
	reg [3:0] CRC13;
	reg [3:0] CRC14;
	reg [3:0] CRC15;
	reg [3:0] CRC16;
	reg [63:0] Data1;
	reg [63:0] Data2;
	reg [63:0] Data3;
	reg [63:0] Data4;
	reg [63:0] Data5;
	reg [63:0] Data6;
	reg [63:0] Data7;
	reg [63:0] Data8;
	reg [63:0] Data9;
	reg [63:0] Data10;
	reg [63:0] Data11;
	reg [63:0] Data12;
	reg [63:0] Data13;
	reg [63:0] Data14;
	reg [63:0] Data15;
	reg [63:0] Data16;
	reg clock;

	// Outputs
	wire bus_out;

	// Instantiate the Unit Under Test (UUT)
	FPGA uut (
		.CRC1(CRC1), 
		.CRC2(CRC2), 
		.CRC3(CRC3), 
		.CRC4(CRC4), 
		.CRC5(CRC5), 
		.CRC6(CRC6), 
		.CRC7(CRC7), 
		.CRC8(CRC8), 
		.CRC9(CRC9), 
		.CRC10(CRC10), 
		.CRC11(CRC11), 
		.CRC12(CRC12), 
		.CRC13(CRC13), 
		.CRC14(CRC14), 
		.CRC15(CRC15), 
		.CRC16(CRC16), 
		.Data1(Data1), 
		.Data2(Data2), 
		.Data3(Data3), 
		.Data4(Data4), 
		.Data5(Data5), 
		.Data6(Data6), 
		.Data7(Data7), 
		.Data8(Data8), 
		.Data9(Data9), 
		.Data10(Data10), 
		.Data11(Data11), 
		.Data12(Data12), 
		.Data13(Data13), 
		.Data14(Data14), 
		.Data15(Data15), 
		.Data16(Data16), 
		.clock(clock), 
		.bus_out(bus_out)
	);

	initial begin
		// Initialize Inputs
		CRC1 = 1;
		CRC2 = 1;
		CRC3 = 0;
		CRC4 = 0;
		CRC5 = 0;
		CRC6 = 0;
		CRC7 = 0;
		CRC8 = 0;
		CRC9 = 0;
		CRC10 = 0;
		CRC11 = 0;
		CRC12 = 0;
		CRC13 = 0;
		CRC14 = 0;
		CRC15 = 0;
		CRC16 = 0;
		Data1 = 1;
		Data2 = 2;
		Data3 = 0;
		Data4 = 0;
		Data5 = 0;
		Data6 = 0;
		Data7 = 0;
		Data8 = 0;
		Data9 = 0;
		Data10 = 0;
		Data11 = 0;
		Data12 = 0;
		Data13 = 0;
		Data14 = 0;
		Data15 = 0;
		Data16 = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      always clock=~clock;
endmodule

