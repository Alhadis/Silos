`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:48 06/28/2019 
// Design Name: 
// Module Name:    ALUcontrol 
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
module ALUcontrol(
    input ALUop1, ALUop0,
    input [5:0] funct, opcode,
    output reg [3:0] Operation
);

initial begin
Operation = 4'b0010;
end


    always @(ALUop1, ALUop0, funct) begin
      if ((ALUop1 == 1'b0) & (ALUop0 == 1'b0)) begin // load and store
      Operation <= 3'b010; // add
    end

    if (ALUop0 == 1'b1) begin // branch equal
      Operation <= 4'b0110; // subtract
    end
	 
	 // R-type
	 
    if ((ALUop1 == 1'b1) &( funct == 6'b101010))begin // slt
        Operation <= 4'b0111;
    end
    if ((ALUop1 == 1'b1) & (funct[0] == 1'b0) & (funct[1] == 1'b0) & (funct[2] == 1'b0) & (funct[3] == 1'b0))begin
      Operation <= 4'b0010;
    end

    if ((ALUop1 == 1'b1) & (funct[0] == 1'b0) & (funct[1] == 1'b1) & (funct[2] == 1'b0) & (funct[3] == 1'b0))begin
      Operation<= 4'b0110;
    end

    if ((ALUop1 == 1'b1) & (funct[0] == 1'b0) & (funct[1] == 1'b0) & (funct[2] == 1'b1) & (funct[3] == 1'b0))begin
      Operation<= 4'b0000;
    end

    if ((ALUop1 == 1'b1) & (funct[0] == 1'b1) & (funct[1] == 1'b0) & (funct[2] == 1'b1) & (funct[3] == 1'b0))begin
      Operation<= 4'b0001;
    end

    if ((ALUop1 == 1'b1) & (funct[0] == 1'b1) & (funct[1] == 1'b1) & (funct[2] == 1'b0) & (funct[3] == 1'b1))begin
      Operation<= 4'b0111;
    end

    if ((ALUop1 == 1'b1) & (funct[0] == 1'b1) & (funct[1] == 1'b1) & (funct[2] == 1'b1) & (funct[3] == 1'b0))begin
      Operation<= 4'b1100;
    end

    if ((ALUop1 == 1'b1) & (funct[0] == 1'b0) & (funct[1] == 1'b1) & (funct[2] == 1'b1) & (funct[3] == 1'b0))begin
      Operation<= 4'b0011;
    end
    // add immediate
    if (opcode == 6'b001000) begin
        Operation <= 4'b0010;
    end
    // for or immediate
    if (opcode == 6'b001101) begin
        Operation <= 4'b0000;
    end
    // for and immediate
    if (opcode == 6'b001100) begin
        Operation <= 4'b0000;
    end

    end
endmodule

