//module takes in the input of the instruction register and generates control signals for the datapath and State machines
//inputs:
//	instructionIn 	- the input from the instruction register. this is broken down into individual signals for the ALU/FSM
//	nsel 		  	- selects which of the 3 register values stored in the instruction to use at a gven time, controlled by FSM
//outputs:
// 	opcode			- two different opcodes. 110 - MOV operation. 101 - ALU operation
//	op				- which type of MOV operatio. 10 - memory to register. 00 - register to register. 
//					  *note* 2nd can be shifter before written to 2nd register
//	ALUop			- which ALUoperation to preform. 00 - ADD. 01 - CMP. 10 - AND. 11 - MVN.
//	sximm5			- sign extended 5 bit immediate
// 	sximm8			- sign extended 8 bit immediate
//	shift			- indicates which shift operation
//	readnum		  	- which register to read from
//	writenum		- which register to write to

module InstructionDecoder(instructionIn, nsel, opcode, op, ALUop, sximm5, sximm8, shift, readnum, writenum, sx9imm8, cond);
	
	input	[15:0]	instructionIn;
	input	[2:0] 	nsel;
	
	output	[15:0] 	sximm5, sximm8;
	output  [8:0]    sx9imm8;
	output	[2:0] 	readnum, writenum, opcode, cond;
	output	[1:0] 	ALUop, shift, op;
	
	wire	[7:0] 	imm8;
	wire	[4:0] 	imm5;
	wire	[2:0] 	muxOut, Rn, Rd, Rm;
	wire			shiftEnable;
	
	assign 	opcode 	= instructionIn[15:13];			//instruction op code
	assign 	op		= instructionIn[12:11];			//register operation, (register to register or memory to register)
	assign 	ALUop	= instructionIn[12:11];			//ALU operation, (add, compare, and, not)
	assign 	imm5	= instructionIn[4:0];			//5-bit input to the datapath
	assign 	imm8	= instructionIn[7:0];			//8 bit input to the datapath
	assign 	shift 	= (instructionIn[4:3])&{2{shiftEnable}};			//shift operation
	
	assign  cond    =  instructionIn[10:8];

	assign	Rn 		= instructionIn[10:8];			//first register to read/ write to
	assign 	Rd		= instructionIn[7:5];			//register gets the output of the ALU
	assign 	Rm 		= instructionIn[2:0];			//second register to read from
	
	assign shiftEnable = (opcode == 3'b110) | 		//only allow shift in ALU and MOV instructions
						(opcode == 3'b101);
	
	assign readnum	= muxOut;						//readnum is the output of the mux
	assign writenum = muxOut;						//writenum is the output of the mux
	
	assign sximm8 = {{8{imm8[7]}}, imm8};			//sign extend imm8 to 16 bits
	assign sximm5 = {{11{imm5[4]}}, imm5};			//sign extend imm5 to 16 bits 
	assign sx9imm8 = {imm8[7],imm8};                //sign extend imm8 to 9 bits 
	
	Mux3 #(3) RWmux(Rm, Rd, Rn, nsel, muxOut);		//multiplexes the three register values, nsel controls which gets used
	
endmodule