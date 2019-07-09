`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:11:03 10/27/2017
// Design Name:   datapath
// Module Name:   C:/Users/student/Desktop/datapath/datatest_4.v
// Project Name:  datapath
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datatest_4;

	// Inputs
	reg ldMAR;
	reg [15:0] data_bus;
	reg ldIR;
	reg Tlabel;
	reg clk;
	reg ALUon;
	reg [2:0] fnSelect;
	reg mm;
	reg [15:0] out;

	// Outputs
	wire [3:0] ir_1;
	wire [1:0] ir_2;
	wire [1:0] ir_3;
	wire [2:0] ir_4;
	wire [2:0] funct;
	wire s;
	wire v;
	wire c;
	wire z;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.ldMAR(ldMAR), 
		.data_bus(data_bus), 
		.ldIR(ldIR), 
		.Tlabel(Tlabel), 
		.clk(clk), 
		.ir_1(ir_1), 
		.ir_2(ir_2), 
		.ir_3(ir_3), 
		.ir_4(ir_4), 
		.ALUon(ALUon), 
		.fnSelect(fnSelect), 
		.funct(funct), 
		.mm(mm), 
		.out(out), 
		.s(s), 
		.v(v), 
		.c(c), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		ldMAR = 0;
		data_bus = 0;
		ldIR = 0;
		Tlabel = 0;
		clk = 0;
		ALUon = 0;
		fnSelect = 0;
		mm = 0;
		out = 0;


		#10;
		clk=0;
		#5
		clk=1;
		data_bus = 16'b1111000101010101;
		ldIR =1;
		Tlabel =0;
		ldMAR =0;
		ALUon =1;
		fnSelect = 3'b100;
		mm =1;
		out = 16'b1111000101010111;
		#5
		clk=0;
		#5
		clk=1;
		data_bus = 16'b1111011101010101;
		ldIR =1;
		Tlabel =1;
		ldMAR =1;
		ALUon =0;
		fnSelect = 3'b101;
		mm=0;
		out = 16'b1111000101010001;
		#5
		clk =0;
		#5
		clk=1;
		data_bus = 16'b1111000101010101;
		ldIR =1;
		Tlabel =0;
		ldMAR =0;
		ALUon =1;
		fnSelect = 3'b100;
		mm =1;
		out = 16'b1111000101010111;
		#5
		clk=0;
		data_bus = 16'b1111000101010101;
		ldIR =1;
		Tlabel =0;
		ldMAR =0;
		ALUon =1;
		fnSelect = 3'b100;
		mm =1;
		out = 16'b1111000101010111;
		#5
		clk=0;
		data_bus = 16'b1111000101010101;
		ldIR =1;
		Tlabel =0;
		ldMAR =0;
		ALUon =1;
		fnSelect = 3'b100;
		mm =1;
		out = 16'b1111000101010111;
		#5
		clk=0;
		data_bus = 16'b1111000101010101;
		ldIR =1;
		Tlabel =0;
		ldMAR =0;
		ALUon =1;
		fnSelect = 3'b100;
		mm =1;
		out = 16'b1111000101010111;
		#5
		clk=0;		
		// Add stimulus here       
		// Add stimulus here

	end
      
endmodule

