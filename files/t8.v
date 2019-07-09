`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	Ali Behrouzi 9532266
//
// Create Date:   18:30:47 07/03/2019
// Design Name:   node
// Module Name:   D:/darsi/fpga/Project/project/t8.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: node
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t8;

	// Inputs
	reg clock;
	reg [3:0] crc;
	reg [1:0] mod;
	reg [63:0] data;
	reg [3:0] addr;

	// Bidirs
	wire bus;

	// Instantiate the Unit Under Test (UUT)
	node uut (
		.clock(clock), 
		.crc(crc), 
		.mod(mod), 
		.data(data), 
		.bus(bus), 
		.addr(addr)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		crc = 0;
		mod = 1;
		data = 5;
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      always #1 clock=~clock;
endmodule

