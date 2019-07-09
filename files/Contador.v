`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:18 10/16/2014 
// Design Name: 
// Module Name:    Contador 
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
module Contador(
    input iClk,
    input iLoad,
	 input[8:0] iInicio,	
	 input[8:0] iTime,
    output reg[8:0] oFinal
    );
	 
	 reg [8:0] counter_b;

	 
	 
	 always @(posedge iClk)
	 begin
		if(iLoad) begin              
			counter_b <= iInicio;
		end
		else begin   
			counter_b <= counter_b + 1;
			if(counter_b == iTime)
			begin
				counter_b <= iInicio;					
			end	

			oFinal <= counter_b;	
			end
	end


endmodule