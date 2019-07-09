`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: bhangra
// 
// Create Date:    23:50:47 07/11/2011 
// Design Name: 
// Module Name:    frame_sender 
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
module frame_sender(
	//	Reset, TX Clock
	input	wire		reset,
	input	wire		tx_clk,

	//	Configuration Pins
	output	wire		conf_tx_en,
	output	wire		conf_tx_jumbo_en,
	output	wire		conf_tx_no_gen_crc,

	//	MAC Interface
	output	wire [7:0]	mac_tx_data,
	output	wire		mac_tx_dvld,
	input	wire		mac_tx_ack,

	//	Frame Sent signal to Timer Module
	output wire			frame_sent
);
//	Local Parameters
//	Sample Frames for testing purpose
	localparam SAMPLE_FRAME		= 480'hFFFFFFFFFFFF0012E228130E080600010800060400010012E228130ECBB28F54000000000000CBB28FED00000000000000000000000000008FED0000;
	localparam SAMPLE_FRAME_SIZE= 60;
/*	localparam SAMPLE_FRAME		= 448'hFFFFFFFFFFFF0022FA157ada0806010800060400010022FA157ADACBB28BD5000000000000CBB28B9F0000000000000000000000000000;  
	localparam SAMPLE_FRAME_SIZE	= 56;
*/

//	State Machine Parameters
	localparam IDOL				= 4'd0;
	localparam WAIT_FOR_ACK		= 4'd1;
	localparam MAC_DST			= 4'd2;
	localparam MAC_SRC			= 4'd3;
	localparam ETH_TYPE			= 4'd4;
	localparam DATA				= 4'd5;
	localparam WAIT_ACK			= 4'd6;
	localparam STOPPED			= 4'd7;

	localparam GEN_VALID_FRAME	= 4'hd;
	localparam GEN_CHKSUM		= 4'he;
	localparam RESET			= 4'hf;
	
//	Wires & Regs
	reg			conf_tx_en_out_reg;
	reg			conf_tx_en_out_reg_next;
	reg			conf_tx_jumbo_en_out_reg;
	reg			conf_tx_jumbo_en_out_reg_next;
	reg			conf_tx_no_gen_crc_out_reg;
	reg			conf_tx_no_gen_crc_out_reg_next;

	reg [7:0]	mac_tx_data_out_reg;
	reg			mac_tx_dvld_out_reg;
	wire		mac_tx_dvld_out_reg_next;

	reg	[8*64-1:0]	frame;
	reg	[8*64-1:0]	frame_next;
	reg [3:0]		send_state;
	reg [3:0]		send_state_next;
	reg [30:0]		send_counter;
	reg [30:0]		send_counter_next;

	// Frame Sent signal Out Reg
	reg 			frame_sent_out_reg;

	// Assigning Wires
	assign conf_tx_en		= conf_tx_en_out_reg;
	assign conf_tx_jumbo_en		= conf_tx_jumbo_en_out_reg;
	assign conf_tx_no_gen_crc	= conf_tx_no_gen_crc_out_reg;

	assign mac_tx_data		= mac_tx_data_out_reg;
	assign mac_tx_dvld		= mac_tx_dvld_out_reg;
	
	assign frame_sent		= frame_sent_out_reg;

//	Send MAC
	always @(posedge tx_clk) begin
		case (send_state)
			IDOL: begin
				conf_tx_en_out_reg_next			= 1'b1;
				conf_tx_jumbo_en_out_reg_next	= 1'b0;
				conf_tx_no_gen_crc_out_reg_next = 1'b0;			
			end
			GEN_VALID_FRAME: begin
				frame_next[(8*64)-1:8*(64-(SAMPLE_FRAME_SIZE - 1))] = SAMPLE_FRAME;
			end
			RESET: begin
				mac_tx_data_out_reg             = 8'b00000000; 
			end
			WAIT_FOR_ACK: begin
				mac_tx_data_out_reg	= frame[(8*64)-1:8*63];
				if(mac_tx_ack)
						frame_next	= {frame[(8*63)-1:0],8'd0};
			end
			DATA: begin
				mac_tx_data_out_reg	= frame[(8*64)-1:8*63];
				frame_next			= {frame[(8*63)-1:0],8'd0};
			end
		endcase
	end

//	State Machine & Counter
	always @(posedge tx_clk or posedge reset) begin
	  if (reset) begin
		send_counter_next 	= 1;
		send_state_next		= RESET;
		frame_sent_out_reg 	= 0;
	  end
	  else
		case(send_state)
		  IDOL: begin
			if(send_counter == 100) begin
				send_state_next 	= GEN_VALID_FRAME;
				send_counter_next 	= 1;
			end else
				send_counter_next	= send_counter + 1;
		  end
		  GEN_VALID_FRAME: begin
				send_state_next 	= WAIT_FOR_ACK;
				send_counter_next 	= 1;
		  end 
		  WAIT_FOR_ACK: begin
			if (mac_tx_ack) begin
				send_state_next 	= DATA;
				send_counter_next	= 1;
			end else 
				send_counter_next	= send_counter + 1;
		  end
		  DATA: begin
			if(send_counter == (SAMPLE_FRAME_SIZE - 1)) begin
				send_state_next 	= IDOL;
//				send_state_next 	= STOPPED;
				send_counter_next	= 1;
				frame_sent_out_reg 	= 1;
			end else
				send_counter_next	= send_counter + 1;
		  end
		  RESET: begin
			send_state_next = IDOL;
			send_counter_next	= 1;
		  end
		  STOPPED: begin
			send_counter_next = 1;
		  end
		  default: begin
			send_state_next = IDOL;
			send_counter_next	= 1;
		  end
		endcase
	end


	//	Sequential Logic
	always @(posedge tx_clk or posedge reset) begin
		if (reset) begin
			conf_tx_en_out_reg		<= 1'b0;
			conf_tx_jumbo_en_out_reg	<= 1'b0;
			conf_tx_no_gen_crc_out_reg	<= 1'b0;
			mac_tx_dvld_out_reg		<= 1'b0;
			send_state			<= RESET;
		end
		else begin
			conf_tx_en_out_reg			<= conf_tx_en_out_reg_next;
			conf_tx_jumbo_en_out_reg	<= conf_tx_jumbo_en_out_reg_next;
			conf_tx_no_gen_crc_out_reg	<= conf_tx_no_gen_crc_out_reg_next;
			send_state					<= send_state_next;
			// 	set 0 when not sending & waiting CRC gen
			mac_tx_dvld_out_reg 		<= 
				(send_state == WAIT_FOR_ACK)	||
				(send_state == DATA);

		end
	end
	always @(negedge tx_clk or posedge reset) begin
		if(reset) begin
			send_counter	<= 32'd1;
		end
		else begin
			frame			<= frame_next;
			send_counter	<= send_counter_next;
		end
	end
endmodule
