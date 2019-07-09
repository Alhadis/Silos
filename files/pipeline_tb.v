`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:29 07/05/2019
// Design Name:   pipeline
// Module Name:   /home/agustin/TP_FINAL_ARQUI/pipeline_tb.v
// Project Name:  TP_FINAL_ARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipeline_tb;

	// Inputs
	reg clk;
	reg reset;
	reg writeProgramMemory;
	reg [31:0] dataFI;
	reg [31:0] addrFI;

	// Instantiate the Unit Under Test (UUT)
	pipeline uut (
		.clk(clk), 
		.reset(reset), 
		.writeProgramMemory(writeProgramMemory), 
		.dataFromInterface(dataFI), 
		.addrFromInterface(addrFI)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		writeProgramMemory = 0;
		dataFI = 0;
		dataFI[31:26] = 6'b100011; //lw
		dataFI[25:21] = 5'b00101;  //base 	= 5 -> Valor = 0
		dataFI[20:16] = 5'b00000;	//rt   	= 0
		dataFI[15:0]  = 0;			//offset = 0
		addrFI = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Write Instructions into Program Memory
		writeProgramMemory = 1;
		#20;
		writeProgramMemory = 0;
		#20;
		
		addrFI = 4;
		dataFI[31:26] = 6'b100011; //lw
		dataFI[25:21] = 5'b00101;  //base 	= 5 -> Valor = 0
		dataFI[20:16] = 5'b00001;	//rt   	= 1
		dataFI[15:0]  = 1;			//offset = 1
		writeProgramMemory = 1;
		#20;
		writeProgramMemory = 0;
		#20;
		
		addrFI = 16;
		dataFI[31:26] = 0; //special 
		dataFI[25:21] = 5'b00000;  //rs 	= 0
		dataFI[20:16] = 5'b00001;	//rt   	= 1
		dataFI[15:11] = 2;			//rd = 2
		dataFI[10:6]  = 0;			//0
		dataFI[5:0]   = 6'b100001;			//func = addu (rd = rs + rt)
		writeProgramMemory = 1;
		#20;
		writeProgramMemory = 0;
		#20;
		
		addrFI = 20;
		dataFI[31:26] = 6'b101011; //sw
		dataFI[25:21] = 5'b00101;  //base 	= 5 -> Valor = 0
		dataFI[20:16] = 5'b00010;	//rt   	= 2
		dataFI[15:0]  = 2;			//offset = 2
		writeProgramMemory = 1;
		#20;
		writeProgramMemory = 0;
		#20;
		reset = 0;
		
		#200;
		
		$stop;
		//El resultado deberia ser 15.
	end
	
	always
	begin
	clk = ~clk; #10;
	end
      
endmodule

