//shifter
//shifts bits right or left based on shift
//inputs:
//	in 		- main input, these bits get shifted
//	shift 	- controls which way bits shift, and what replaces the shift
//				-00 - no shift occurs
//				-01 - shift left one bit, MSB is lost, LSB = 0
// 				-10 - shift right one bit, LSB is lost, MSB = 0
//				-11 - shift right one bit, LSB is lost, MSB = MSB of in 
//outputs:
//	sout - shifted output
module shifter(in, shift, sout);

	input 		[15:0]	in;
	input		[1:0]		shift;		
	output reg	[15:0]	sout;
	
	always @(*) begin
		//shift codes for shift operation
		case(shift)
			2'b00: sout = in;					//let input pass through
			2'b01: sout = {in[14:0], 1'b0};		//shift left, replace LSB with 0
			2'b10: sout = {1'b0, in[15:1]};		//shift right, replace MSB with 0
			2'b11: sout = {in[15], in[15:1]};	//shift right, replace MSB with MSB of in
			default: sout =16'bxxxxxxxxxxxxxxxx;//default for debugging
		endcase
	end
endmodule//Shifter