`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12/09/16
// Design Name: 
// Module Name:    keypad
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: bomb module will interface with the keypad peripheral
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module keypad(
	input clock, //keeps everything clocked at 27MHz
	input reset, //global reset input
	input enable, //enable bit
//	input [3:0] rng_output, //the random input
    input [6:0] keypad, //inputs 7 keypad user3[29:23]
    output reg strike, //high when the module is messed up to strike module
	output reg module_defused //high when the module is defused
//	output reg [1:0] version, //module version A-D for visuals
//	output reg [2:0] state, //internal state machine
//	output reg rng_enable //when the module is getting set up
	, output reg test
    );
//version (2 bit) 
/*parameter VERSION_A = 2'b00;
parameter VERSION_B = 2'b01;
parameter VERSION_C = 2'b10;
parameter VERSION_D = 2'b11;*/

//states
parameter WAITING = 3'b000;
parameter FIRST_CORRECT = 3'b001;
parameter SECOND_CORRECT = 3'b010;
parameter THIRD_CORRECT = 3'b011;
parameter WRONG = 3'b101;
parameter DEFUSED = 3'b110;

//variables
reg [2:0] state;
reg [6:0] condition_one;
reg [6:0] condition_two;
reg [6:0] condition_three;
reg [6:0] condition_four;
reg [6:0] neutral;

//based on the version picked, assume version A for now
//setup
initial begin
	condition_one = 		7'b1100000; //button 2
	condition_two = 		7'b1100000; // 2
	condition_three = 		7'b0000101; //6
	condition_four = 		7'b0010001; //4
	neutral = 				7'b0000000; //no button pressed
	strike = 0;
	state = WAITING;
	module_defused = 0;
end
//assume always enabled
always@(posedge clock) begin
	if (reset) begin
		strike <= 0;
		module_defused <= 0;
		state <= WAITING;
	end
	if (enable) begin
		if(keypad == neutral) test <= 1;
		case (state) 
			WAITING: begin
				strike <= 0;
				module_defused <= 0;
				if (keypad == condition_one) state <= FIRST_CORRECT;
				else if (keypad != neutral) state <= WRONG;
			end

			FIRST_CORRECT: begin
				strike <= 0;
				if (keypad == condition_two) state <= SECOND_CORRECT;
				else if (keypad != neutral) state <= WRONG;
			end

			SECOND_CORRECT: begin
				strike <= 0;
				if (keypad == condition_three) state <= THIRD_CORRECT;
				else if (keypad != neutral) state <= WRONG;
			end

			THIRD_CORRECT: begin
				strike <= 0;
				if (keypad == condition_four) state <= DEFUSED;
				else if (keypad != neutral) state <= WRONG;
			end

			WRONG: begin
				strike <= 1;
				state <= WAITING;
			end

			DEFUSED: begin
				strike <= 0;
				module_defused <= 1; //module is defused
			end
			default: state <= WAITING;
		endcase
	end
end

endmodule
