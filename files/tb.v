`timescale 1ns/1ps
module tb ();

integer i, pass_count, fail_count;
reg clock, CLK;
wire [1:0] current;
reg init = 1'b1;
reg [7:0] vector1;
reg [7:0] vector2;
reg [7:0] vector3;

// UUT -> Unit Under Test
branch_prediction predict
						(	// Inputs 
							.i_branch_result(clock),
							.i_init(init),
							.i_clock(CLK),
							.o_current_state(current)
						);

						
initial
begin
	
	pass_count <= 0;
	fail_count <= 0;
	CLK <= 0;
	clock = 0;
	#0.1 init <= 1'b0;
	
	// initialize the vectors
	vector1 = 8'b11111111;
	vector2 = 8'b01010101;
	vector3 = 8'b00010001;
	
	
	for ( i = 0; i < 8; i = i + 1)
	begin
	
		@ (posedge CLK)
		clock = vector1[i];
		
		if ( current == 2'd0)
			pass_count = pass_count + 1;
		else
			fail_count = fail_count + 1;
			
		$display("num: %d %b %b", i, clock, current);
		
	end
	
	
	// for ( i = 0; i < 8; i = i + 1)
	// begin
		// clock = vector2[i];
		
		// if ( ((clock == 0) && (current == 2'd2)) || ((clock == 1) && (current == 2'd1)) )
			// pass_count = pass_count + 1;
		// else
			// fail_count = fail_count + 1;
			
		// $display("num: %d %b %b", i, clock, current);
	// end
	
	
	// for ( i = 0; i < 8; i = i + 1)
	// begin
		// clock = vector3[i];
		
		// if ( (i == 0) && (current == 0'd2))
			// pass_count = pass_count + 1;
		// else if ( ( i == 1) && (current == 0'd3) )
			// pass_count = pass_count + 1;
		// else if ( (i==2) && (current ==0'd3))
			// pass_count = pass_count + 1;
		// else if ( (i == 3) && (current == 0'd2))
			// pass_count = pass_count + 1;
		// else if ( current == 0'd3)
			// pass_count = pass_count + 1;
		// else
			// fail_count = fail_count + 1;
			
		// $display("num: %d %b %b", i, clock, current);
			
	// end	
	
	$display("Number of tests passed: %d", pass_count);
	$display("Number of FAILED tests: %d", fail_count);
end

always @(*)
	#0.5 CLK <= ~CLK;

endmodule
	