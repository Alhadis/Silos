`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:55:31 11/11/2014 
// Design Name: 
// Module Name:    uart_rs 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uart_rs #(parameter DBIT = 8, SB_TICK = 16)
(input wire clk, reset, 
 input wire rx, s_tick,
 //output reg rx_done_tick,
 //output wire [7:0] dout
 output reg [7:0]capture_out
);

localparam [1:0]
	idle = 2'b00,
	start = 2'b01,
	data= 2'b10,
	stop = 2'b11;
	
reg rx_done_tick;	
reg [1:0] state_reg,state_next;
reg [3:0] s_reg,s_next;
reg [2:0] n_reg,n_next;
reg [7:0] b_reg,b_next;

always@(posedge clk,posedge reset)
	if(reset)
		begin
			state_reg <=idle;
			s_reg<=0;
			n_reg<=0;
			b_reg<=0;
		end
	else 
		begin 
			state_reg<=state_next;
			s_reg<=s_next;
			n_reg<=n_next;
			b_reg<=b_next;
		end
		
always@*
begin
	state_next=state_reg;
	rx_done_tick=1'b0;
	s_next=s_reg;
	n_next =n_reg;
	b_next=b_reg;
	case(state_reg)
		idle:
			if(~rx)
				begin	
					state_next=start;
					s_next=0;
				end
		start:
			if(s_tick)
				if(s_reg==7)
					begin
						state_next=data;
						s_next=0;
						n_next=0;
					end
				else	
					s_next=s_reg+4'd1;
					
		data:
			if(s_tick)
				if(s_reg==15)
					begin						
						s_next=0;
						b_next={rx,b_reg[7:1]};
						if(n_reg==(DBIT-1))
							state_next=stop;
						else
							n_next=n_reg+3'd1;
					end
				else	
					s_next=s_reg+4'd1;
		stop:
			if(s_tick)
				if(s_reg==(SB_TICK-1))
					begin	
						state_next=idle;
						rx_done_tick=1'b1;
					end
				else	
					s_next=s_reg+4'd1;
					
	endcase
end
//	assign dout = b_reg;
	
	always @ (posedge clk) begin
		if(reset) capture_out <= 0;
		else begin
			if(rx_done_tick) capture_out <= b_reg;
		end
	end
	
endmodule
