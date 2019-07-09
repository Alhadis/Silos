// Can be used to: warn decode about store on lookup stage.
module bypass_bit(input clk, bitin,
					 output bitout);
	always @(posedge clk) begin
		assign bitout = bitin;
	end
endmodule;
