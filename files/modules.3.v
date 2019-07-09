module HLD(in,clk,out);

input in,clk;
output out;
reg out_reg;
reg  in_flipflop;
reg out_flipflop;

initial
begin

	out_reg      =0;
	out_flipflop =0;
	in_flipflop  =0;

end

always @(posedge clk)
begin
	in_flipflop <= in;
	out_flipflop <= in_flipflop;
	out_reg <= in_flipflop ^ (in_flipflop & out_flipflop);
end

assign out = out_reg;

endmodule


module HLDT(in,clk,out_t);

input in,clk;
output out_t,out_1, out_2;
reg out;

HLD hld_1(in,clk,out_1);
HLD hld_2(in,~clk,out_2);

initial
	begin
		out <= 0;
	end
	
always @(posedge clk or negedge clk)
	begin
		
		if(1 == (out_1 || out_2))
		out <=1;
		if(1 != (out_1 || out_2))
		out <=0;
	end

assign out_t = out;

endmodule

