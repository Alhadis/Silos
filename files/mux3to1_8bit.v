`timescale 1 ps / 1 ps

module mux3to1_8bit (
	data0x,
	data1x,
	data2x,
	sel,
	result);

	input	[7:0]  data0x;
	input	[7:0]  data1x;
	input	[7:0]  data2x;
	input	[1:0]  sel;
	output reg [7:0]  result;

	always @(*)
	begin
		case (sel)
			2'b00: result <= data0x;
			2'b01: result <= data1x;
			2'b10: result <= data2x;
			default: result <= data2x;
		endcase
	end
	
endmodule