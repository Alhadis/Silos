`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:36:46 07/27/2017
// Design Name:   outputFn_beh
// Module Name:   C:/Users/Subham Rajgaria/Desktop/group14/assignment1/outputTest.v
// Project Name:  assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: outputFn_beh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module outputTest;

	// Inputs
	reg clk;
	reg rst;
	reg inp;

	// Outputs
	wire out;
	wire [1:0] state;
	
	reg[15:0] sequence;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	outputFn_beh uut (
		.clk(clk), 
		.rst(rst), 
		.inp(inp), 
		.out(out), 
		.state(state)
	);
	outputFn_beh sample ( state, out, inp, rst, clk);
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		sequence = 16'b0010001110110010;
		
		#5 rst =0;
		
		for(i=0;i<=15;i=i+1)
		begin
			inp= sequence[i];
			#2 clk = 1;
			#2 clk = 0;
			$display("State =%2b ", state, " Input = " , inp, " Output = ", out);
		end

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:17:56 07/25/2017
// Design Name:   outputFn_beh
// Module Name:   C:/Users/Subham Rajgaria/Desktop/group14/assignment1/outputTest.v
// Project Name:  assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: outputFn_beh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*module outputTest;

	// Inputs
	reg clk;
	reg rst;
	reg inp;

	// Outputs
	wire out;
	wire[1:0] state;
	reg[15:0] sequence;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	outputFn_beh uut (
		.clk(clk), 
		.rst(rst), 
		.inp(inp), 
		.out(out)
	);
	
	outputFn_beh sample ( state, out, clk, rst, inp);
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		sequence = 16'b0010001110110010;
		
		#5 rst =0;
		
		for(i=0;i<=15;i=i+1)
		begin
			inp= sequence[i];
			#2 clk = 1;
			#2 clk = 0;
			$display("State =%2b ", state, " Input = " , inp, " Output = ", out);
		end
			test2;
		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
	
	task test2;
		for( i=0; i<=15; i=i+1)
	 begin
		inp= $random %2;
		#2 clk = 1;
		#2 clk = 0;
		$display("State =%2b ", state, "Input = ", inp, "Output = ", out);

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here
		end
	endtask*/
      
//endmodule


endmodule

