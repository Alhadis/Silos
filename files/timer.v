`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:39 07/11/2011 
// Design Name: 
// Module Name:    timer 
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
module timer(
	input	wire		reset,
	input	wire		tx_clk,

	input	wire		frame_sent,
	input	wire		frame_caught

//	output	wire [19:0]	time_out
    );
	localparam		IDOL	= 3'd0;
	localparam		SENT	= 3'd1;
	localparam		CAUGHT	= 3'd2;
	
//	reg	[19:0]		time_out_reg;
	reg [3:0]		state;
	reg [3:0]		state_next;
	reg	[19:0]		time_count;
	reg	[19:0]		time_caught;

//	Assign Wires
//	assign time_out	= time_out_reg;
//	assign time_out = time_count;
//	time counter
	always @(posedge tx_clk or posedge reset) begin
		if (reset) begin
			state_next = IDOL;
			time_count = 0;
		end 
		else begin
		  case (state)
			IDOL: begin
				if(frame_sent)
					state_next = SENT;
			end
			SENT: begin
				if(frame_caught) begin
					state_next 	= CAUGHT;
//					time_caught = time_count; 
				end
				else
					time_count = time_count + 1;
			end
//			CAUGHT: begin
//				time_out_reg = time_caught;
//			end
		  endcase
		end
	end

//	Sequential Logic
	always @ (posedge tx_clk or posedge reset) begin
		if (reset) begin
			state			<= IDOL;
		end
		else begin
			state			<= state_next;
		end
	end
endmodule
