//simple RISC CPU
//currently implemented instructions:
//	MOV			- Move immediate value to a register, or mov data from a register to another register
//	LDR			- Load data from memory into a register
//	HALT		- Puts the cpu into a state it cannot return from without reseting, used at the end of a program
//inputs:
//	clk 		- Clock signal
//	reset		- resets the FSM and the program counter
//	read_data	- Data input from the RAM
//outputs:
//	write_data 	- Data output to the RAM
//	mem_addr	- Memory address to read/write to
//	m_cmd		- memory command to use(read/write)
module cpu(clk,reset,read_data,write_data,mem_addr,m_cmd, h);
	input clk, reset;
	input [15:0] read_data;
	
	output [15:0] write_data;
	output [8:0] mem_addr;
	output [1:0] m_cmd;
	output h;
	
	wire[15:0] instructionIn, sximm8, sximm5;
	wire[8:0] PC, dataAddress_out, typical_next_PC, next_PC, sx9imm8, branchAdder, R7toPC;
	wire[2:0] writenum, readnum, opcode, Z_out, nsel, cond;
	wire[1:0] ALUop, shift, vsel, op;
	wire write, loada, loadb, loads, loadc, asel, bsel,  load_addr, reset_pc, load_pc, addr_sel, load_ir, N, V, Z, branchsel, PC_sel;
	
	assign Z = Z_out[0];
	assign N = Z_out[1];
	assign V = Z_out[2]; 
	
	//holds the current instruction, loaded from memory
	LoadRegister #(16) InstructionRegister(read_data, instructionIn, load_ir, clk);
	
	//automates the loading and execution of instructions
	FSMcontroller FSM (reset, opcode, op, nsel, asel, bsel, vsel, loada, loadb, loadc, loads, write, 
					  clk, reset_pc, load_pc, addr_sel, load_ir, m_cmd, load_addr, N, V, Z, branchsel, h, cond, PC_sel);
	
	//Contains the ALU, registers and the associated registers
	datapath DP (read_data, write_data, vsel, writenum, write, readnum, clk,
				 loada, loadb, shift, asel, bsel, ALUop, loads, loadc, Z_out, sximm8, sximm5, PC, R7toPC);
	
	//program counter, holds the address of the current instruction and increments on rising edge of clk when load_pc is high
	//counter #(9) counter (PC, load_pc, reset_pc, clk); 
	
	LoadRegister #(9) program_counter(next_PC, PC, load_pc, clk);         //program_counter register 
	assign branchAdder = branchsel ? sx9imm8 : 9'b0;                		    //multiplexer for adding im8 to PC in a branch instruction 
	assign typical_next_PC = reset_pc? 9'b0 : PC + 1 + branchAdder;											//update PC 

	assign next_PC = PC_sel? R7toPC : typical_next_PC;          //if instruction is BX, load PC wit R7toPC
	
	//contains the address of the data we want to read or write to
	LoadRegister #(9) data_address(write_data [8:0], dataAddress_out, load_addr, clk);
	
	//select between the address in the data_address register and the program counter
	assign mem_addr = addr_sel ? PC : dataAddress_out;
	
	//breaks the instruction into individual signals for the different components of CPU
	InstructionDecoder ID(instructionIn, nsel, opcode, op, ALUop, sximm5, sximm8, shift, readnum, writenum, sx9imm8, cond);
endmodule 