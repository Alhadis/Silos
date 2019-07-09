//Arithmetic Logic Unit
//module can preform 4 mathematical and logic operations, depending on the ALUop
//inputs
//	Ain   - first input of the ALU 
//	Bin   - second input of the ALU
// 	ALUop - codes for the operation of the ALU
//			- 2'b00 - Ain + Bin
//			- 2'b01 - Ain - Bin
//			- 2'b10 - Ain & Bin
//			- 2'b11 - ~Bin
//Outputs
//	out   - the main output of the ALU. The result of the ALU's operation
// 	z     - status output of the ALU. 
//			Z[0] if the output is all 0s, output 1, otherwise 0
//			Z[1] if the output is negative, ie MSB is 1, output 1
//			Z[2] overflow flag, 1 if ALU has overflowed
module ALU(Ain, Bin, ALUop, out, Z);

	input  [15:0] 	Ain, Bin;
	input  [1:0] 	ALUop;
	output [15:0]	out;
	output [2:0]	Z;
	
	wire   [15:0] 	ABmath, AandB, notB, ABlogic; 			//internal wires between operations

	assign AandB 	= 	Ain&Bin; 							//assigns AandB to and logic operation
	assign notB	 	= 	~Bin;								//assigns AandB to and logic operation
	
	assign ABlogic 	=	ALUop[0] ? notB 	: AandB;		//assigns the logic to its corresponding operation based on LSB of ALUop
	assign out  	= 	ALUop[1] ? ABlogic 	: ABmath;		//assigns output to either logic or math, based on MSB of ALUop
	
	assign Z[0]		=   ~(|out);							//output 1 if result is all 0s, otherwise output 0
	assign Z[1] 	= 	out[15];							//negative flag, 1 if MSB is 1, 0 if not
	
	//adds and subtracts the two inputs operation(add or subtract) is 
	//determined by the LSB of ALUop
	//overflow is assigned to MSB of Z
	AddSub #(16) plusMinus (.a(Ain),.b(Bin),.sub(ALUop[0]),.s(ABmath), .ovf(Z[2]));
	
endmodule//ALU