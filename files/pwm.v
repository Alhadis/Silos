`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:44 10/07/2014 
// Design Name: 
// Module Name:    pwm 
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
module pwm #(parameter CTR_SIZE = 8) (
    input clk,
	 input rst,
	 input [CTR_SIZE-1:0] compare,
	 output pwm
    );

reg pwm_d, pwm_q;
reg [CTR_SIZE-1:0] ctr_d, ctr_q;

assign pwm = pwm_q;

always@(*) begin
    ctr_d = ctr_q + 1'b1;
	 if (compare > ctr_d) begin
	     pwm_d = 1'b0;
    end else begin
        pwm_d = 1'b1;
    end		  
end

always@(posedge clk) begin
    if (rst) begin
	     ctr_q <= 1'b0;
	 end else begin
	     ctr_q <= ctr_d;
	 end
	 
	 pwm_q <= pwm_d;
end

endmodule
