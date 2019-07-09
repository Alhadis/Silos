`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:08 10/21/2014 
// Design Name: 
// Module Name:    MaquinaJugador 
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
module MaquinaJugador(
    input clk,
    input reset,
	 input iResetPintar,
	 input pintarEnable,
    input izquierda,
    input derecha,
	 input spaceizq,
	 input spaceder,
    output incremente,
    output decremente,
	 output reg oEnablePintar
    );
		
	reg doblandoizq, doblandoder;
	
	//pag 122 
	parameter[1:0] s0 = 2'b00, //inicio
						s1 = 2'b01, //pintar
						s2 = 2'b10,//izquierda
						s3 = 2'b11; //derecha
						
	reg[1:0] state;
	reg[1:0] next_state;
	
	
	always@(posedge reset or posedge clk)
	 begin
		if(reset)
			state <= s0;
		else
			state <= next_state;
	end
	
	always@(state or izquierda or derecha or pintarEnable or spaceizq or spaceder or iResetPintar) 
		begin
		
			doblandoizq = 1'b0;
			doblandoder = 1'b0;
			oEnablePintar = 0;
			if(iResetPintar)
				next_state = s0;
			else
			begin
				case(state)
					
					s0:begin
							if(pintarEnable)begin
								next_state = s1;
								
							end else
								next_state = s0;
						end
					
					s1:begin
								oEnablePintar = 1;
								next_state = s2;
						end
						
					s2:begin
							oEnablePintar = 1;
							if(izquierda && spaceizq) begin
								doblandoizq = 1'b1;
								next_state = s1;
								
							end else begin
								next_state = s3;							
							end
						end
					
					s3:begin
						oEnablePintar = 1;
						if(derecha && spaceder) begin
								doblandoder = 1'b1;
							end 
								next_state = s1;
						end
								
					default: next_state = s1;
				endcase
			end
		end
	 
    assign incremente = doblandoizq;
    assign decremente = doblandoder;
	

endmodule

