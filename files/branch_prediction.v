module branch_prediction #( parameter SAMPLE = 8
						)
						(	// Inputs
							input i_branch_result,
							input i_init,
							input i_clock,
							
							// Outputs
							output [1:0]o_current_state
						);

// All Possible States						
localparam STRONGLY_TAKEN 		= 2'd0;
localparam WEAKLY_TAKEN 		= 2'd1;
localparam WEAKLY_NOT_TAKEN		= 2'd2;
localparam STRONGLY_NOT_TAKEN	= 2'd3;

// intermediate registers
reg [1:0] curr_state;
reg [1:0] next_state;


// output should always be driven by current state
assign o_current_state = curr_state;


always @( posedge i_clock or i_init)
begin
	if ( i_init)
		curr_state <= WEAKLY_TAKEN;
	else
		curr_state <= next_state;
end

always @(*)
begin
	next_state = curr_state;
	
	case ( curr_state )
		STRONGLY_TAKEN:
			next_state = (i_branch_result ) ? STRONGLY_TAKEN : WEAKLY_TAKEN;
			
		WEAKLY_TAKEN:
			next_state = (i_branch_result ) ? STRONGLY_TAKEN : WEAKLY_NOT_TAKEN;
			
		WEAKLY_NOT_TAKEN:
			next_state = (i_branch_result ) ? WEAKLY_TAKEN : STRONGLY_NOT_TAKEN;
			
		STRONGLY_NOT_TAKEN:
			next_state = (i_branch_result ) ? WEAKLY_NOT_TAKEN : STRONGLY_NOT_TAKEN;
			
	endcase
	$display ("branch_result %d", i_branch_result);
end

endmodule
	
			
				