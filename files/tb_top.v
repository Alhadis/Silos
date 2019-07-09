`timescale 1ns / 1ps

module tb_top;

	// Inputs
	reg rst;
	reg clk;
	reg [31:0] control_dat;
	reg [31:0] control_adr;
	reg dat_rdy;
	reg set_addressLength;
	reg we;		//we == 0 -> write
	
	
	// Outputs
	wire scl;
	
	// Bidirs
	wire sda;
	
	// Instantiate the Unit Under Test (UUT)
	top uut (
		.rst(rst), 
		.clk(clk),
		.control_dat(control_dat),
		.control_adr(control_adr),
		.set_addressLength(set_addressLength),
		.we(we),
		.sda(sda),
		.scl(scl)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		control_adr = 0;
		control_dat = 0;
		dat_rdy = 0;
		set_addressLength = 0;
		we = 0;

		// Wait 100 ns for global reset to finish
		#100;
		        
		rst = 0;
		#5
		control_adr = 32'h1000_0000;
		control_dat = 32'hffff_ffff;
		set_addressLength = 1;			//10 bit periphery adress
		
		#5
		dat_rdy = 1;
		$display(dat_rdy);
		

	end
	
	always #5
	clk <= ~clk;
      
endmodule

