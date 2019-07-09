module Reg(clk, rst, en, data_in, data_out);
	parameter SIZE = 32;
	input clk, rst, en;
	input [SIZE-1:0] data_in;
	output reg [SIZE-1:0] data_out;
	
	always@(posedge clk, posedge rst) begin
		if(rst)
			data_out <= 0;
		else if(en)
			data_out <= data_in;
	end
endmodule