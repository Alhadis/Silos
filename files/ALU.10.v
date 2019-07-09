// build an ALU
module ALU
	(
		dataa,
		datab,
		Function,
		result
	);
	
	// input and output ports
	input	[31:0]	dataa;
	input	[31:0]	datab;
	input	[3:0]	Function;
	output	[31:0]	result;
	
	// registers
	reg		[31:0]	result;
	
	// define parameters
	parameter	[3:0]	ADD = 4'b0000;
	parameter	[3:0]	SUB = 4'b0010;
	parameter	[3:0]	AND = 4'b0100;
	parameter	[3:0]	OR = 4'b0101;
	parameter	[3:0]	NOR = 4'b0110;
	parameter	[3:0]	XOR = 4'b0111;
	parameter	[3:0]	SL = 4'b1000;
	parameter	[3:0]	SRA = 4'b1001;
	parameter	[3:0]	SRL = 4'b1010;
	
	// build module
	
	always @(*)
	begin
		case(Function)
			ADD:
				result = dataa + datab;
			SUB:
				result = dataa - datab;
			AND:
				result = dataa & datab;
			OR:
				result = dataa | datab;
			NOR:
				result = ~(dataa | datab);
			XOR:
				result = dataa ^ datab;
			SL:
				result = {dataa[30:0], 1'b0};
			SRA:
				result = {dataa[31], dataa[31:1]};
			SRL:
				result = {1'b0, dataa[31:1]};
			default:
				result = {32{1'bx}};
		endcase
	end
endmodule
