`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:27:48 05/30/2018
// Design Name:   top
// Module Name:   C:/Users/joshtern/MPI-Collective-Router/london.v
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

module london;
 
	// Inputs
	reg clk;
	reg rst;
	reg valid_in; 
	reg [2:0] dst_z;
	reg [2:0] dst_y;
	reg [2:0] dst_x;
	reg [2:0] src_z;
	reg [2:0] src_y;
	reg [2:0] src_x;
	reg [8:0] rank;
	reg [7:0] contextId;
	reg [7:0] tag;
	reg [1:0] algtype;
	reg [3:0] op;
	reg [31:0] payload;
	reg [61:0] new_comm;

	// Outputs
	wire [81:0] Outpacket;
	wire done;
	wire valid_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.Outpacket(Outpacket), 
		.done(done), 
		.valid_out(valid_out), 
		.clk(clk), 
		.rst(rst), 
		.valid_in(valid_in), 
		.dst_z(dst_z), 
		.dst_y(dst_y), 
		.dst_x(dst_x), 
		.src_z(src_z), 
		.src_y(src_y), 
		.src_x(src_x), 
		.rank(rank),
		.contextId(contextId), 
		.tag(tag), 
		.algtype(algtype), 
		.op(op), 
		.payload(payload),
		.new_comm(new_comm)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		valid_in = 0;
		dst_z = 0;
		dst_y = 0;
		dst_x = 0;
		src_z = 0;
		src_y = 0;
		src_x = 0;
		rank=0;
		contextId = 0;
		tag = 1;
		algtype = 0;
		op = 4'b1000;
		payload = 0;
		new_comm = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst=0;
		
		#10;
		valid_in = 1;
		op = 4'b1000;
      //src_x = 1;
		payload=6;
 
		#10;
	   payload=5;
		//tag=0;
	  
	   #10;
	   payload=4;
		//tag=1;
	  
	   #10;
	   payload=3;
		//tag=0;
	  
	   #10;
	   payload=2;  
		//tag=1;
		
		#10;
	   payload=1;  
		//tag=0;
		
		#10;
	   payload=6;  
		//tag=1;
		
		#10;
	   payload=5;  
	//	tag=0;
		
		#10;
	   payload=4;  
		//tag=1;
		
	end
	
	always begin
	#5 clk = !clk;
	end
      
endmodule

