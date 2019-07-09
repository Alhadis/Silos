module TB(); // this module is testbench
	reg clk = 1, rst, memClk = 1;
	reg[14:0] Address = 1024;
	wire ready;
	wire[31:0] out_data;
	CacheMem uut(Address, clk, rst, memClk, ready, out_data);
	integer i;
	initial begin
		rst = 1;
		#100
		rst = 0;
	end
	always #(5) begin
		clk = ~clk;
	end
	always #(20) begin
		memClk = ~memClk;
	end
	always @(ready) begin
		if(ready) begin
			if(Address == 9215)
				$stop();
			Address <= Address + 1;
		end
	end
endmodule
