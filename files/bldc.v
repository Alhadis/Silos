/* BLDC motor driver           */
/* Author: Renze Nicolai       */
/* Date: 25-11-2018            */

`timescale 1 ps / 1 ps
`default_nettype none

module bldc (
	input  wire       clk,          //Input from the system clock
	input  wire       reset,        //Reset input (active high)
	input  wire       enableHigh,   //High side enable input
	input  wire       enableLow,    //Low side enable input
	input  wire [2:0] hal,          //Input from HAL sensors
	output wire [1:0] coilA,        //Output to the MOSFETs of coil A
	output wire [1:0] coilB,        //Output to the MOSFETs of coil B
	output wire [1:0] coilC         //Output to the MOSFETs of coil C
	);
		
	function [5:0] fnCoils;
	input [2:0] hal;
	begin
		case (hal)
		//     abc                112233
		//                        hlhlhl
			3'b001:  fnCoils = 6'b100100;
			3'b101:  fnCoils = 6'b100001;
			3'b100:  fnCoils = 6'b001001;
			3'b110:  fnCoils = 6'b011000;
			3'b010:  fnCoils = 6'b010010;
			3'b011:  fnCoils = 6'b000110;
			default: fnCoils = 6'b000000;
		endcase
	end
	endfunction
	
	reg [2:0] halReg;
	always @(posedge clk) begin
		halReg <= hal;
	end
		
	wire [5:0] coils = fnCoils(halReg);
	assign coilA[1] = (enableHigh && (!reset)) ? coils[5] : 1'b0;
	assign coilA[0] = (enableLow  && (!reset)) ? coils[4] : 1'b0;
	assign coilB[1] = (enableHigh && (!reset)) ? coils[3] : 1'b0;
	assign coilB[0] = (enableLow  && (!reset)) ? coils[2] : 1'b0;
	assign coilC[1] = (enableHigh && (!reset)) ? coils[1] : 1'b0;
	assign coilC[0] = (enableLow  && (!reset)) ? coils[0] : 1'b0;
		
endmodule

`resetall
