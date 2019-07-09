`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:51:33 07/11/2011 
// Design Name: 
// Module Name:    frame_catcher 
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
module frame_catcher(
	//	Reset, TX Clock
	input	wire		reset,
	input	wire		rx_clk,

	//	Configuration Pins
	output	wire		conf_rx_en,
	output	wire		conf_rx_no_chk_crc,
	output	wire		conf_rx_jumbo_en,

	//	MAC Interface
	input	wire [7:0]	mac_rx_data,
	input	wire		mac_rx_dvld,
	input	wire		mac_rx_goodframe,
	input	wire		mac_rx_badframe,
	
	//	Frame Caught signal to the Timer Module
	output	wire		frame_caught
    );

//	State Machine Parameters
	localparam IDOL		= 4'd0;
	localparam DATA		= 4'd1;
	localparam CHECK	= 4'd2;
	localparam RESET	= 4'd15;

//	Wires & Regs
	reg				conf_rx_en_out_reg;
	reg				conf_rx_en_out_reg_next;
	reg				conf_rx_jumbo_en_out_reg;
	reg				conf_rx_jumbo_en_out_reg_next;
	reg				conf_rx_no_chk_crc_out_reg;
	reg				conf_rx_no_chk_crc_out_reg_next;

	reg				frame_caught_out_reg;

	reg [3:0]		catch_state;
	reg [3:0]		catch_state_next;
	reg [13:0]		catch_counter;
	reg [13:0]		catch_counter_next;
	reg [7:0]		frame_in	[0:64];

//	Assigning Wires
	assign conf_rx_en 			= conf_rx_en_out_reg;
	assign conf_rx_jumbo_en 	= conf_rx_jumbo_en_out_reg;
	assign conf_rx_no_chk_crc 	= conf_rx_no_chk_crc_out_reg;

	assign frame_caught 		= frame_caught_out_reg;

//	Configuration 
	always @(posedge rx_clk) begin
		conf_rx_en_out_reg_next 		= 1'b1;
		conf_rx_jumbo_en_out_reg_next 	= 1'b0;
		conf_rx_no_chk_crc_out_reg_next = 1'b0;
	end
//	Counter
	always @(posedge rx_clk) begin
		if(catch_state != catch_state_next)
			catch_counter_next = 1;
		else
			catch_counter_next = catch_counter + 1;
	end

//	Frame Catcher
	always @(posedge rx_clk) begin
		if (mac_rx_goodframe) begin
			frame_caught_out_reg 	= 1;
		end
/*		case (catch_state) begin
			
		endcase
*/
	end

//	State Machine
	always @(posedge rx_clk) begin
	  if (reset) begin
		catch_state_next = RESET;
	  end
	  else
		case (catch_state) 
			IDOL: begin
			  if(mac_rx_dvld)
				catch_state_next = DATA;	
			end
			DATA: begin
			  if (!mac_rx_dvld)
				catch_state_next = CHECK;	
			end
			CHECK: begin
				catch_state_next = IDOL;
			end
			RESET: begin
				catch_state_next = IDOL;
			end
			default: begin
				catch_state_next = IDOL;
			end
		endcase
	end

//	Sequential Logic
	always @(posedge rx_clk or posedge reset) begin
		if (reset) begin
			conf_rx_en_out_reg			<= 1'b0;
			conf_rx_jumbo_en_out_reg 	<= 1'b0;
			conf_rx_no_chk_crc_out_reg	<= 1'b0;
			catch_state					<= RESET;
			catch_counter 				<= 13'd0;
		end
		else begin
			conf_rx_en_out_reg 			<= conf_rx_en_out_reg_next;
			conf_rx_jumbo_en_out_reg	<= conf_rx_jumbo_en_out_reg_next;
			conf_rx_no_chk_crc_out_reg	<= conf_rx_no_chk_crc_out_reg_next;
			catch_state					<= catch_state_next;
			catch_counter 				<= catch_counter_next;
		end
	end
endmodule
