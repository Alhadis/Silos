`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:48 05/29/2018
// Design Name:   top
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/supertest.v
// Project Name:  MPI-Collective-Router
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module supertest;

	// Inputs
	reg [31:0] dataIn;
	reg clk;
	reg rst;
	reg [2:0] src;
	reg [2:0] dst;
	reg [2:0] rank;
	reg [2:0] root;
	reg [4:0] op;
	reg [3:0] commsize;
	reg [1:0] algtype;
	reg [3:0] index;

	// Outputs
	wire [63:0] Outpacket;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.dataIn(dataIn), 
		.clk(clk), 
		.rst(rst), 
		.Outpacket(Outpacket), 
		.src(src), 
		.dst(dst), 
		.rank(rank), 
		.root(root), 
		.op(op), 
		.commsize(commsize), 
		.algtype(algtype), 
		.index(index), 
		.done(done)
	);

	 initial begin
  // Initialize Inputs
  dataIn = 0;
  clk = 0;
  rst = 1;
  src = 1;
  dst = 0;
  rank = 3'b000;
  root = 0;
  op = 0;
  commsize = 0;
  algtype = 0;
  index = 1;
  // Wait 100 ns for global reset to finish
  #100;
  src=0;
  rst=0;
  dataIn=6;
 
  
  #10;
  src=1;
  dataIn=5;
  //index=1;
  
  #10;
  src=2;
  dataIn=4;
  //index=1;
  
  #10;
  index=0;
  src=3;
  dataIn=2;
  
  #10;
  index=1;
  src=0;
  dataIn=3;
  
  #10;
  index=0;;
  src=1;
  dataIn=1;
  
  #10;
  src=2;
  //dataIn=1;
  //index=1;
  
  #10;
  src=3;
  //dataIn=1;
  //index=1;
  
  #10;
  src=0;
  //dataIn=1;
  //index=0;
  
  #10;
  src=1;
  //dataIn=1;
  //index=1;
  
  #10;
  src=2;
  //dataIn=1;
  //index=1;
  
  #10;
  src=3;
  //dataIn=1;
  //index=1;
  
  #10;
  src=0;
  //dataIn=1;
  //index=0;
  
  #10;
  src=1;
  //dataIn=1;
  //index=1;
  
  #10;
  src=2;
  //dataIn=1;
  //index=1;
  
  #10;
  src=3;
  //dataIn=1;
 	// index=1; 
  // Add stimulus here
 end
 
 always begin
 #5 clk = !clk;
 end
  	
endmodule
