module test;


reg in,clk,clk_180,reset;
reg [6:0] reg_7;
reg [1:0] reg_2;
wire [1:0] out;
wire edge_flag;

//sreg_delay_16	delay(in,clk,out);	//it works
//fast_edge_detector fast_edge(in,clk,fast_clk,fast_clk_180,out); //it doesn't work
START_edge_detector fast_edge(in,clk,clk_180,out,edge_flag); //worked 3*Tclk
//timestamp_counter ts_counter(clk,in,out); //worked; 0*T_clk
//general_counter start_counter(clk,in,reset,out); //worked; 3*T_clk
//add7_2 adder(reg_7,reg_2,clk,out);

always #2 clk <= ~clk;
always #2 clk_180 <= ~clk_180;

initial
begin
	reg_7 = 7'b1101101;
	reg_2 = 2'b01;
	reset 	= 0;
	clk 	= 0;
	clk_180 = 1;
	clk	  	= 0;
	in 		= 0;
end

always @(posedge clk)
begin
	#39 	in 	= 1;
	#1700	reset = 1;
	#1750 	reset = 0;
	#3000 	in 	= 0;
	#7000	$finish;
end

initial 
begin
 
	$dumpfile("out.vcd");
	$dumpvars;
	$dumpall;
	$dumpon;
	
	$monitor(clk,, in,, out);
 end
 
 endmodule