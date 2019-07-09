`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:52:34 07/06/2019
// Design Name:   Memory
// Module Name:   D:/Uni/Arch/project/MIPSproject/Memory_Test.v
// Project Name:  MIPSproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Memory_Test;

	// Inputs
	reg [31:0] addr;
	reg [31:0] write_data;
	reg MemWrite;
	reg clk;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.addr(addr), 
		.write_data(write_data), 
		.MemWrite(MemWrite), 
		.clk(clk), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		addr = 0;
		write_data = 0;
		MemWrite = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		addr = 50;
		#100;
		addr = 51;
		write_data = 100;
		MemWrite = 1;
		
		#100 ;
		MemWrite= 0;
		write_data = 100;
		addr = 53;
        
		// Add stimulus here

	end
	
	always begin
	#50;
	clk = ~clk;
	end
    	
      
endmodule

