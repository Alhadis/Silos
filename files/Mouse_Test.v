`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:43 10/30/2014 
// Design Name: 
// Module Name:    Mouse_Test 
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
module Mouse_Test(
   input CLK_100MHZ,
		input reset,
		inout PS2_CLK,
		inout PS2_DATA,
		output [0:7] LED
    );
	 

	
	// register declarations
	wire LeftButton;
	wire RightButton;
	wire [8:0] XMovement;
	//wire [8:0] YMovement;
	
	// Instantiate the module
	ps2_mouse_interface mouse (
		.clk(CLK_100MHZ), 
		.reset(reset),
		.ps2_clk(PS2_CLK), 
		.ps2_data(PS2_DATA), 
		.left_button(LeftButton), 
		.right_button(RightButton), 
		.x_increment(XMovement)
//		.y_increment(YMovement)
	);

	
	assign LED[0] = RightButton;
	assign LED[1] = LeftButton;
	
	assign LED[2] = XMovement[0];
	assign LED[3] = XMovement[1];
	assign LED[4] = XMovement[2];
	
	assign LED[5] = XMovement[3];
	assign LED[6] = XMovement[4];
	assign LED[7] = XMovement[8];
	
endmodule
