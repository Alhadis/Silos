`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:16:48 10/27/2017
// Design Name:   datapath
// Module Name:   C:/Users/Subham Rajgaria/Desktop/group14/datapath/testdatapath.v
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

module testdatapath;

	// Inputs
	reg ldMDR;
	reg Tmdr;
	reg ldMAR;
	reg [15:0] data_bus;
	reg ldIR;
	reg Tlabel;
	reg clk;
	reg reset;
	reg ALUon;
	reg [2:0] fnSelect;
	reg mm;
	reg [15:0] out;
	reg ldALUreg;
	reg ldSP;
	reg ldPC;
	reg Tsp;
	reg Tpc;
	reg ldReg;
	reg Treg;
	reg ldFlag;

	// Outputs
	wire [15:0] data_bus_out;
	wire [3:0] ir_1;
	wire [1:0] ir_2;
	wire [2:0] funct;
	wire [15:0] addr_bus;
	wire cc;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.ldMDR(ldMDR), 
		.Tmdr(Tmdr), 
		.ldMAR(ldMAR), 
		.data_bus(data_bus), 
		.data_bus_out(data_bus_out), 
		.ldIR(ldIR), 
		.Tlabel(Tlabel), 
		.clk(clk), 
		.reset(reset), 
		.ir_1(ir_1), 
		.ir_2(ir_2), 
		.ALUon(ALUon), 
		.fnSelect(fnSelect), 
		.funct(funct), 
		.mm(mm), 
		.out(out), 
		.ldALUreg(ldALUreg), 
		.addr_bus(addr_bus), 
		.ldSP(ldSP), 
		.ldPC(ldPC), 
		.Tsp(Tsp), 
		.Tpc(Tpc), 
		.ldReg(ldReg), 
		.Treg(Treg), 
		.ldFlag(ldFlag), 
		.cc(cc)
	);

	initial begin
		// Initialize Inputs
		ldMDR = 0;
		Tmdr = 0;
		ldMAR = 0;
		data_bus = 0;
		ldIR = 0;
		Tlabel = 0;
		clk = 0;
		reset = 0;
		ALUon = 0;
		fnSelect = 0;
		mm = 0;
		out = 0;
		ldALUreg = 0;
		ldSP = 0;
		ldPC = 0;
		Tsp = 0;
		Tpc = 0;
		ldReg = 0;
		Treg = 0;
		ldFlag = 0;

		// Wait 100 ns for global reset to finish
		#100;
		data_bus = 16'b1111010000000000;
		
		Tmdr = 0;
		Tlabel = 0;
		Tpc = 1;
		Tsp = 0;
		Treg = 0;
		ldMAR = 1;
		ldMDR = 0;
		ldALUreg = 0;
		ldIR = 0;
		ldSP = 0;
		ldPC = 0;
		ldReg = 0;
		ldFlag = 0;
		ALUon = 0;
		mm = 0;
		fnSelect = 3'b110;
		reset =0;
		
		
		#15
		data_bus = 16'b1111010000000000;
		
		Tmdr = 0;
		Tlabel = 0;
		Tpc = 1;
		Tsp = 0;
		Treg = 0;
		ldMAR = 0;
		ldMDR = 0;
		ldALUreg = 0;
		ldIR = 1;
		ldSP = 0;
		ldPC = 1;
		ldReg = 0;
		ldFlag = 0;
		ALUon = 0;
		mm = 0;
		fnSelect = 3'b101;
		reset =0;
		
		#15
		data_bus = 16'b1111010000000000;
		
		Tmdr = 0;
		Tlabel = 0;
		Tpc = 0;
		Tsp = 1;
		Treg = 0;
		ldMAR = 1;
		ldMDR = 0;
		ldALUreg = 0;
		ldIR = 1;
		ldSP = 0;
		ldPC = 0;
		ldReg = 0;
		ldFlag = 0;
		ALUon = 0;
		mm = 0;
		fnSelect = 3'b100;
		reset =0;
		
		#15
		data_bus = 16'b1111010000000011;
		
		Tmdr = 0;
		Tlabel = 0;
		Tpc = 0;
		Tsp = 0;
		Treg = 0;
		ldMAR = 0;
		ldMDR = 0;
		ldALUreg = 0;
		ldIR = 1;
		ldSP = 0;
		ldPC = 1;
		ldReg = 0;
		ldFlag = 0;
		ALUon = 0;
		mm = 1;
		fnSelect = 3'b100;
		reset =0;
		#15
		data_bus = 16'b1111010000000000;
		
		Tmdr = 0;
		Tlabel = 0;
		Tpc = 0;
		Tsp = 1;
		Treg = 0;
		ldMAR = 0;
		ldMDR = 0;
		ldALUreg = 0;
		ldIR = 0;
		ldSP = 1;
		ldPC = 0;
		ldReg = 0;
		ldFlag = 0;
		ALUon = 0;
		mm = 0;
		fnSelect = 3'b110;
		reset =0;
		
		#15
		data_bus = 16'b1111010000000000;
		
		Tmdr = 0;
		Tlabel = 0;
		Tpc = 0;
		Tsp = 1;
		Treg = 0;
		ldMAR = 0;
		ldMDR = 0;
		ldALUreg = 0;
		ldIR = 0;
		ldSP = 1;
		ldPC = 0;
		ldReg = 0;
		ldFlag = 0;
		ALUon = 0;
		mm = 0;
		fnSelect = 3'b101;
		reset =0;
		// Add stimulus here*/

	end
	always
	#15 clk = ~clk;
      
endmodule

