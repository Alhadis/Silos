module t_test;

reg  in,clk;
wire out;

test t0(in,clk,out);
always	 #10  clk <= ~clk;

initial
begin 
	clk = 0;
	in = 0;
end

always @(posedge clk)
begin
	#35 in = 1;
	#70 in = 0;
	#110 in = 1;
	#170 in = 0;
end 

always @(posedge clk)
 #200 $finish;

initial 
begin
 
	$dumpfile("out.vcd");
	$dumpvars;
	$dumpon;
	
	$monitor(clk,, in,, out);
 end
 
 endmodule
 
 
