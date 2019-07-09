//datapath of the simple risc cpu. built from 3 pipeline registers, a status register, a register file
//a shifter unit, ALU 2 2:1 binary select multiplexers and a 4:1 binary select multiplexer
//inputs:
//	mdata		- memory input(for use in lab 7)
//	sximm8 		- sign extended 8 bit immediate
//	sximm5 		- sign extended 5 bit immediate
//	PC			- program counter 
//	readnum		- register to read from
//	writenum	- register to write to
//	ALUop		- ALU operation
//	shift		- shift operation
//	vsel		- which input to select into the regfile
//	write		- whien high, the regfile is writeable
//	clk			- registers update on rising edge
//	asel		- source operand mux a select
//	bsel		- source operand mux b select
//	loada		- load control for pipeline register a
//	loadb		- load control for pipeline register b
//	loadc		- load control for pipeline register c
//	loads		- load control for status register
//outputs:
//	datapath_out- output of the c register
//	Z_out		- output of the status register
module datapath(mdata, datapath_out, vsel, writenum, write, readnum,clk,
				 loada, loadb, shift, asel, bsel, ALUop, loads, loadc, Z_out, sximm8, sximm5, PC, R7toPC);

	input	[15:0] 	mdata, sximm8, sximm5;
	input   [8:0]   PC;
	input	[2:0]  	readnum, writenum;
	input 	[1:0] 	ALUop, shift, vsel;
	input		write, clk, asel, bsel, loads, loada,loadb, loadc;
	
	output	[15:0] 	datapath_out; 
	output  [8:0]   R7toPC;
	output	[2:0] 	Z_out;

	
	wire 	[15:0] 	aout, bout, data_out, Ain, Bin, ALUout, data_in, sout;
	wire 	[2:0] 	status_in;

	wire [8:0] PC_plus = PC + 1'b1; 
	
	Muxb4 #(16) WBmux (mdata, sximm8, {7'b0, PC_plus}, datapath_out, vsel, data_in);			//write-back multiplexer
	
	//old writeback mux from earlier version
	//assign data_in =  vsel? datapath_in:datapath_out;									
	
	//source operand multiplexers
	assign Ain = asel?16'b0:aout;														//source operand mux A
	assign Bin = bsel?sximm5:sout;		

	assign R7toPC = data_out[8:0];           //for BX instruction 
	
	//16-bit pipeline registers and a 1 bit status register
	LoadRegister #(16) 	a		(data_out, aout, loada, clk);							//Pipeline register A, feeds into ALU
	LoadRegister #(16) 	b		(data_out, bout, loadb, clk);							//Pipeline Register B, feeds into ALU
	LoadRegister #(16) 	c		(ALUout, datapath_out, loadc, clk);						//Pipeline Register C, holds the output of ALU
	LoadRegister #(3)	status	(status_in, Z_out, loads, clk);							//status register, holds the status of ALU
	
	shifter 			SHIFTER	(bout, shift, sout);									//allows bout to be shifted
	ALU 				ALU		(Ain, Bin, ALUop, ALUout, status_in);					//Arithmetic Logic unit
	regfile 			REGFILE	(data_in, writenum, write, readnum, clk, data_out);		//register file, 8 registers for storing data 

endmodule
