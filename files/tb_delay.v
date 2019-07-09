`timescale 1ns/1ps
module tb_delay;
parameter CLOCK_PERIOD = 20;
parameter WIDTH = 4;
integer i;
reg clk, rst_n, enbl, set_module_enbl;
reg [WIDTH-1:0] count_module;
wire o_cnt;
delay #(.WIDTH(WIDTH)) inst (
	.clk(clk),
	.i_rst_n(rst_n),
	.i_count_enbl(enbl),
	.i_module(count_module),
	.i_set_module_enbl(set_module_enbl),
	.o_cnt(o_cnt)
	);

initial begin
	clk = 0;
	forever #(CLOCK_PERIOD/2) clk = ~clk;
end

initial begin
	enbl = 0;
	rst_n = 0;
	@(negedge clk)
	rst_n = 1;
	for (count_module = 1; count_module>0 && count_module<=15; count_module = count_module+1) begin
		set_module_enbl = 1;
		@(negedge clk)
		set_module_enbl = 0;
		enbl = 1;	
		for(i = 0;i<2*count_module; i = i+1) begin
			if(i%count_module==0&&!o_cnt==1&&!i==0)
				$display("Error: counter = %d, module = %d, flag not set.", i, count_module);
		@(negedge clk);
		end
	end
	$finish();
end
endmodule