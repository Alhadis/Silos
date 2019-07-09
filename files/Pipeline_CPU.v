

module Pipeline_CPU(CLOCK_50, HEX7 ,HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,SW, LEDR);
//***************************************************************
input [0:0]SW;
input CLOCK_50; // Clock thats going to be fed into the pipeline
wire [31:0] instructionMemory; // instruction buffer
wire [31:0] result; // Result after Execute
wire [7:0] addressResult; // The address result has to be
reg SW1;
output [6:0] HEX7; // debugging purposes
output [6:0] HEX6; // debugging purposes
output [6:0] HEX5; // debugging purposes
output [6:0] HEX4; // debugging purposes
output [6:0] HEX3; // debugging purposes
output [6:0] HEX2; // debugging purposes
output [6:0] HEX1; // debugging purposes
output [6:0] HEX0; // debugging purposes

output reg [6:0]LEDR;
//***************************************************************

always @(posedge CLOCK_50) begin
	SW1 <= SW[0];
end

Fetch grab(CLOCK_50, instructionMemory, SW1);
DecodeExecute decode(CLOCK_50, instructionMemory, SW1, result , addressResult);


// for test purposes 

decoder ZeroDisplay(result[3:0], HEX0[6:0]);
decoder TwoDisplay(result[7:4], HEX1[6:0]);
decoder ThreeDisplay(result[11:8], HEX2[6:0]);
decoder FourthDisplay(result[15:12], HEX3[6:0]);
decoder FifthDisplay(result[19:16], HEX4[6:0]);
decoder SixthDisplay(result[23:20], HEX5[6:0]);
decoder SeventhDisplay(result[27:24], HEX6[6:0]);
decoder EighthDisplay(result[31:28], HEX7[6:0]);
// Read Instruction from Instruction Memory 
// Fetch

// Send Instruction into Decode/Execute
// Decode/Execute

// Store Instruction into Data Memory 
// Store


endmodule 

module decoder(count, out);
	input [3:0] count;
	output reg [6:0] out;

   always@(count) begin
		case(count)
			0 : out = 7'b1000000;
			1 : out = 7'b1111001;
			2 : out = 7'b0100100;
			3 : out = 7'b0110000;
			4 : out = 7'b0011001;
			5 : out = 7'b0010010;
			6 : out = 7'b0000011;
			7 : out = 7'b1111000;
			8 : out = 7'b0000000;
			9 : out = 7'b0010000;
			10 : out = 7'b0001000;
			11 : out = 7'b0000011;
			12 : out = 7'b1000110;
			13 : out = 7'b0100001;
			14 : out = 7'b0000110;
			15 : out = 7'b0001110;
		endcase
	end
endmodule
