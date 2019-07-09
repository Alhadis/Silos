`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITEP
// Engineer: SvirLex
// 
// Create Date:    12:53:47 12/04/2015 
// Design Name: 	 wfd125
// Module Name:    toksync 
// Project Name: 	 wfd125_main
// Target Devices: XC6slx45t
// Tool versions: 
// Description: 	 Send a packet with 45-bit GTIME on tokens 0, 256, 512, 768. type = 5.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//		Block sent to memory fifo
//		0	1000 000L LLLL LLLL - L=4 - data length in 16-bit words not including CW 
// 	1	0ttt p0nn nnnn nnnn - ttt - trigger block type (3'b101 = 5 - token synchronization block)
//										 n - 10-bit trigger token,	 p - block sequential number LSB
//		2	0 GTIME[14:0]		  - lower GTIME
//		3	0 GTIME[29:15]		  - middle GTIME
//		4	0 GTIME[44:30]		  - high GTIME
//////////////////////////////////////////////////////////////////////////////////
module toksync(
    input clk,				// gtp clock
    input [9:0] token,	// token
    input tok_rdy,		// token strob
    output reg [15:0] tok_dat,	// data to FIFO
    output reg tok_vld,	// valid to FIFO
    input inhibit,		// global inhibit
	 input enable			// enable these blocks
    );

	reg [44:0] GTIME = 0;
	reg [44:0] GTIMES = 0;
	reg [2:0] send_cnt = 0;
	reg blk_par = 0;

	always @ (posedge clk) begin
		tok_vld <= 0;
		if (inhibit) begin
			GTIME <= 0;
			blk_par <= 0;
		end else begin
			GTIME <= GTIME + 1;
			case (send_cnt) 
			0 : begin
						if (enable && tok_rdy && (token[7:0] == 0)) begin
							GTIMES <= GTIME;
							tok_dat <= 16'h8004;
							tok_vld <= 1;
							send_cnt <= 1;
						end
				end
			1 : begin
					tok_dat <= {4'b0101, blk_par, 1'b0, token};
					tok_vld <= 1;
					send_cnt <= 2;
				end
			2 : begin
					tok_dat <= {1'b0, GTIMES[14:0]};
					tok_vld <= 1;
					send_cnt <= 3;
					blk_par <= !blk_par;					
				end
			3 : begin
					tok_dat <= {1'b0, GTIMES[29:15]};
					tok_vld <= 1;
					send_cnt <= 4;					
				end
			4 : begin
					tok_dat <= {1'b0, GTIMES[44:30]};
					tok_vld <= 1;
					send_cnt <= 0;	
				end
			default : send_cnt <= 0;
			endcase 
		end
	end
endmodule
