module test_detector;

output reg [7:0]cnt_reg = 8'b00000000;
reg in,clk,flag;
wire out;


//HLDT h_det(in,clk,out);
repeator rpt(in,clk,out);
always #10 clk <= ~clk;

initial
begin
	flag = 0;
	clk = 0;
	in  = 0;
	
end

always @(posedge clk)
begin
	
	#28 in = 1;
	#55 in = 0;
	#70 in = 1;
	#200 in = 0;
end
/*
always @(posedge clk)
begin 

	if(out == 1 || flag == 1) 
	begin
		flag <= 1;
		cnt_reg <= cnt_reg + 1'b1;
	end
	if(out == 1 && flag == 1)
	begin
		flag <= 0;
		cnt_reg <= 8'b00000000;
	end
end*/

always @(posedge clk)
	#500 $finish;

initial 
begin
 
	$dumpfile("out.vcd");
	$dumpvars;
	$dumpall;
	$dumpon;
	
	$monitor(clk,, in,, out,, cnt_reg[0],, cnt_reg[1],, cnt_reg[2],, cnt_reg[3],, cnt_reg[4],, cnt_reg[5],, cnt_reg[6],, cnt_reg[7]);
 end
 
 endmodule

