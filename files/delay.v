
/*Detector of rising front*/
module edge_detector(out,in,clk);

input 		in,clk;
output 		out;

reg 		out;
reg  		in_flipflop;
reg 		out_flipflop;

initial
begin

	out      	 =0;
	out_flipflop =0;
	in_flipflop  =0;

end

always @(posedge clk)
begin
	in_flipflop <= in;
	out_flipflop <= in_flipflop;
	out <= in_flipflop & ~out_flipflop;
end

endmodule

/*Delay line by 16-bit SLE16 shift register*/
module sreg_delay_16(in,clk,out);

input 	in,clk;
output 	out;

reg		reg_out;

wire	sreg14_out;
wire	one;
wire 	zero;

assign one	= 1;
assign zero	= 0;

SRL16   sreg16_lut( .D(in), .CLK(clk), .Q(sreg14_out),
	             .A0(one), .A1(zero), .A2(zero), .A3(zero));

 initial
 begin
	 reg_out = 0;
 end


 always @(posedge clk)
 begin
	 reg_out    <= sreg14_out;
 end

 assign out = reg_out;

endmodule

/*Fast edge detector by IDDR2*/
module fast_edge_detector(in,clk,fast_clk,fast_clk_180,out);

input	in,
		clk,
		fast_clk,
		fast_clk_180;
output 	[1:0] out;

wire 	q0,q1;
wire	one,zero;

reg [1:0] reg_out;

assign	one  = 1;
assign	zero = 0;

initial
begin
	reg_out[0] = 0;
	reg_out[1] = 0;
end
		
IDDR2 #(.DDR_ALIGNMENT("C0"))
		in_ddr2(.Q0(q0),
			  .Q1(q1),
			  .C0(fast_clk),
			  .C1(fast_clk_180),
			  .CE(one),
			  .D(in),
			  .R(zero),
			  .S(zero));

always @(posedge clk)
begin
	reg_out[0] <= q0;
	reg_out[1] <= q1;
end

assign out = reg_out;

endmodule

/* Edge detector by clk and ~clk for IN[47:0] */
/* out = 11 - means T_clk/2 + T_clk/4 */
/* out = 01 - means T_clk_4 */
/*2 Tclk delay*/
module IN_edge_detector(in,clk,clk_180,out,edge_flag);

input 	in,clk,clk_180;
output 	[1:0] out;
output 	edge_flag;

wire 	q0,q1;
reg 	[1:0] reg_out;


edge_detector pos_edge(q1,in,clk);
edge_detector neg_edge(q0,in,~clk);

initial
begin
	reg_out[0] = 0;
	reg_out[1] = 0;
	
end

always @(posedge clk)
begin
	if(reg_out[0] | reg_out[1])
	begin
		reg_out[0] <= 0;
		reg_out[1] <= 0;
	end

	else
	begin
		reg_out[0] <= q0;
		reg_out[1] <= q1;
	end
end

assign out[0] = reg_out[0];
assign out[1] = reg_out[1];
assign edge_flag = reg_out[0] | reg_out[1];

endmodule 

/*START edge_detector*/
module START_edge_detector(in,clk,clk_180,out,edge_flag);

input 	in,clk,clk_180;
output 	[1:0] out;
output 	edge_flag;

wire 	q0,q1;
reg 	[1:0] reg_out;


edge_detector pos_edge(q0,in,clk);
edge_detector neg_edge(q1,in,~clk);

initial
begin
	reg_out[0] = 0;
	reg_out[1] = 0;
	
end

always @(posedge clk)
begin
	if(reg_out[0] | reg_out[1])
	begin
		reg_out[0] <= 0;
		reg_out[1] <= 0;
	end

	else
	begin
		reg_out[0] <= q0;
		reg_out[1] <= q1;
	end
end

assign out[0] = reg_out[0];
assign out[1] = ~reg_out[1];
assign edge_flag = reg_out[0] | reg_out[1];

endmodule 

/*Time stamp counter 29-bit on GATE line. MAX measure 2.7s*/
module timestamp_counter(clk,gate,out);

input	clk,gate;
output 	[28:0] out;

reg [28:0] counter28_0;

initial
begin
	counter28_0 = 0;
end

always @(posedge clk)
begin
	if(gate)
	begin
		counter28_0 <= counter28_0 + 1;
	end

	else
	begin
		counter28_0 <= 0;
	end

end

assign out[28:0] = counter28_0;

endmodule

/*General 7-bit counter on START line. Total time 500ns
3 T_clk to start count*/
module general_counter(clk,start,reset,out);

input	clk,start,reset;
output [6:0] out;

reg [6:0] counter6_0;
reg flag;
wire enable;

edge_detector edge_start(enable,start,clk);

initial
begin
	counter6_0 	= 0;
	flag = 0;
end

always @(posedge clk)
begin
	if(enable)
	begin
		flag <= 1;
	end

	if(reset | (counter6_0 == 7'b1111111))
	begin
		counter6_0 <= 0;
		flag <= 0;
	end
	
	else
		if(flag)
		begin
			counter6_0 <= counter6_0 + 1;
		end
end

assign out[6:0] = counter6_0;
endmodule

/*7-bit ADD 2-bit*/
module add7_2(reg_7,reg_2,clk,out);

input [6:0] reg_7;
input [1:0] reg_2;
input clk;

output [8:0] out;

reg [8:0] result;

initial
begin
	result[8:0] = 0;
end

always @(posedge clk)
begin
	result = reg_7*4 + reg_2;
end

assign out[8:0] = result;
endmodule