`timescale 1ns / 1ps

module synchronizer 
(
	reset,
	clk,
	d,
	q
	
);
	input reset;
	input clk;
	input d;
	output q;

	parameter DEPTH = 2;
	
(*preserve*) reg [DEPTH-1:0] synchronizer_chain;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		synchronizer_chain <= {DEPTH{1'b0}};
	end
	else begin
		synchronizer_chain[DEPTH-2:0] <= synchronizer_chain[DEPTH-1:1];
		synchronizer_chain[DEPTH-1] <= d;
	end
end

assign q = synchronizer_chain[0];	
		
endmodule