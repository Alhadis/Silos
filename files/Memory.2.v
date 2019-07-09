module Memory(clk, read, address, data, ready);
	input clk, read;
	input[14:0] address;
	output reg ready;
	output reg[127:0] data;
	reg[32768] mem;

	always@(posedge clk) begin
		if(read && ready) begin
			
		end
	end
endmodule