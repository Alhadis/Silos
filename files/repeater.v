module repeator(in,clk,out);

input in,clk;
output out,out_1,out_2;
reg out_reg;

HLDT hldt_1(in,clk,out_1);
HLDT hldt_2(~in,clk,out_2);

initial
	begin
		out_reg=0;
	end

always @(posedge clk)
	begin
		if(1 == out_1)
			out_reg <=1;
		if(1 == out_2)
			out_reg <=0;
	end
	
assign out = out_reg;
	
endmodule
