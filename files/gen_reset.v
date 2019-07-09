`timescale 1 ns / 1 ps

module gen_reset(
		clk,
		reset_n_in,
		reset_out
	);
parameter   CTR_WIDTH   =   16;

input 	    clk;	
input       reset_n_in;
output reg  reset_out;

reg		[CTR_WIDTH-1:0]		ctr;	// Reset counter


always	@(posedge clk or negedge reset_n_in)
begin
	if	(!reset_n_in)
	begin
		reset_out <= 1;
		ctr <= 0;
	end else begin
		if	(ctr == {CTR_WIDTH{1'b1}})
            reset_out <=  0;
		else begin
		    ctr <= ctr + 1'b1;
		    reset_out <= 1;
		end
	end
end

endmodule
