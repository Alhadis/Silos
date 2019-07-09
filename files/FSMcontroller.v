//state macros
`define reset 		4'b0000		//starting stage
`define decode		4'b0001		//decode stage, reset busses 
`define MtoR		4'b0010		//MOV data from memory to register
`define getA		4'b0011 	//getA stage, writes data to the A load register
`define getB		4'b0100		//getB stage, writes data to the N load register
`define operate		4'b0101		//preform ALU operation 
`define writeback	4'b0110		//writeback the data from the ALU to a register
`define if1		4'b0111		//first load instruction stage
`define if2		4'b1000		//second load instruction stage
`define updatePC	4'b1001		//update program counter
`define haltState	4'b1010		//cannot return from this state
`define loadAddr	4'b1011		//load address into the data address register
`define	readRAM		4'b1100		//read from RAm stage
`define writeRAM 	4'b1101		//write to RAM stage
`define DC4			4'bxxxx		//5 bit don't care
//`define Bload       4'1110      //state for loading pc during branch instruction 

//Opcode macros
`define BRANCH 		3'b001      //branching for conditional statements - added lab8
`define MOV 		3'b110		//MOV 
`define	ALU		3'b101		//preform an ALU instruction
`define LDR		3'b011		//load from memory into a register
`define STR		3'b100		//store into memory from a register
`define HALT		3'b111		//HALT instruction, puts cpu into a state it can't return from
`define	DC3		3'bxxx		//dont care(3bit)
`define BLINK           3'b010          //Branch Link


//Branch-Link Ops 
`define BL 2'b11 
`define BX 2'b00
`define BLX 2'b10

//Branch condition Macros
`define B 3'b000
`define BEQ 3'b001
`define BNE 3'b010
`define BLT 3'b011 
`define BLE 3'b100

//MOV op Macros
`define Mem			2'b10 		//MtoR 
`define RtoR		2'b00		//register to register

//ALUop macros
`define ADD			2'b00		//add instruction
`define CMP			2'b01		//compare instruction
`define AND 		2'b10		//and instruction
`define	MVN			2'b11		//not instruction
`define DC2			2'bxx 		//Don't care (2bit)

//wait signal macros
`define Wait		1'b0		//FSM should wait, stay in the start stage
`define Go			1'b1		//FSM should go to the decode stage
`define	DC          1'bx		//don't care (1bit)

//register number macros
`define Rm 			3'b100		//nsel Rm
`define Rd			3'b010		//nsel Rd
`define Rn			3'b001		//nsel Rn

//memory commands
`define MREAD 		2'b00		//read from memory
`define MWRITE		2'b01		//write to memory
`define MNONE 		2'b11		//do nothing

//vsel macros
`define DPout		2'b00		//datapath out input to the vsel mux
`define PC			2'b01		//program counter input to th vsel mux
`define sx8			2'b10		//sign extended 8 bit immediate 
`define mdata		2'b11		//memory input

//this module is a FSM that controls the datapath of our simple RISC CPU
//this is a mealy machine, since its output depends on both the current input, and its state
//inputs:
//	reset		- sets the state back to 0(start) when high
//	clk			- FSM updates state on posedge
//	opcode		- the opcode of the current instruction(MOV, ALU)
//	op			- the operation of the current instruction(ADD, CMP, AND, MVN for ALU, or the two MOV operations)
//outputs:
//	nsel		- selects which of the three reg numbers to read/write to (Rd, Rn, Rm)
//	vsel		- writeback mux control
//	asel		- select for source-operand mux a
//	bsel		- select for source-operand mux b
//	loada		- load control for pipeline register a
//	loadb		- load control for pipeline register b
//	loadc		- load control for pipeline register c
//	loads		- load control for status register
//	write		- allows you to write to regfile when 1
//	load_pc		- load input to the program counter, when high, pc increments on posedge of clk
// 	addr_sel	- select between data add//creates a new state from the input and the the current stateress and program counter registers
//	load_ir 	- load instruction register
//	m_cmd		- memory command, write or read
//	load_addr	- load input of data address
module FSMcontroller(reset, opcode, op, nsel, asel, bsel, vsel, loada, loadb, loadc, loads, write, clk, reset_pc, load_pc, addr_sel, load_ir, m_cmd, load_addr, N, V, Z, branchsel, h, cond, PC_sel);
	input[2:0] opcode, cond;
	input[1:0] op;
	input  reset, clk, N, V, Z;
	output[2:0] nsel;
	output[1:0] vsel, m_cmd;
	output asel, bsel, loada, loadb, loadc, loads, write, reset_pc, load_pc, addr_sel, load_ir, load_addr, branchsel, h, PC_sel;
	wire [19:0] p; //??????????
	wire[3:0] state, nextState, nextOrReset;				//three state busses, the current state, the next state and the next state muxed with the reset signal
	wire flag, nextFlag, setFlag;
	
	assign nextOrReset = reset?`reset:nextState;			//reset mux, sets the state back to start when high
	
	//holds the current state
	vDFF 		#(4)	stateRegister	(clk, nextOrReset, state);		
	
	//set high during the first ALU op in STR, so that it acts differently in the second ALUop
	LoadRegister#(1) 	storeFlag 		(nextFlag, flag, setFlag, clk);
	
	//creates a new state from the input and the the current state
	createState CS(state, opcode, op, nextState, flag);		
	
	//creates the output that controls the datapath
	createOutput CO(state, opcode, op, nsel, asel, bsel, vsel, loada, loadb, loadc, loads, write, reset_pc, load_pc, addr_sel, load_ir, m_cmd, load_addr, flag, nextFlag, setFlag, N, V, Z, branchsel, h, cond, PC_sel, p);
endmodule

//module decides what the next state of the FSM should be based on the current inputs
//*note* this is combinational logic
//inputs:
//	state		- current state of the FSM
//	opcode		- the opcode of the current instruction(MOV, ALU)
//	op			- the operation of the current instruction(ADD, CMP, AND, MVN for ALU, or the two MOV operations)
//	flag 		- set high during ALU operation, used to detect if its in the first or second stage  of STR
//outputs:
//	nextState	- next state for the FSM, generated by a casex
module createState(state, opcode, op, nextState, flag);
	input[3:0] state;
	input[2:0] opcode;
	input[1:0] op;
	input flag;
	
	output reg[3:0] nextState;					
	
	always @(*) begin 
		//concatenate the 4 inputs to allow a single case statement 
		casex({state, opcode, op, flag})
			{`reset, `DC3, `DC2, `DC}: 			nextState = `if1;	 	//go from reset to if1 unconditionally
			{`if1, `DC3, `DC2, `DC}:			nextState = `if2;		//go from if1 to if2 unconditionally
			{`if2, `DC3, `DC2, `DC}:			nextState = `updatePC;	//go from if2 to updatePC unconditionally
			{`updatePC, `DC3, `DC2, `DC}:		nextState = `decode;	//Go from updatePC to decode unconditionally
			{`decode, `MOV, `Mem, `DC}: 		nextState = `MtoR;		//go to immediate to register state if the instruction is MOV and mem
			{`MtoR, `DC3, `DC2, `DC}: 			nextState = `if1;		//return to start unconditionally
			{`decode, `HALT, `DC2, `DC}:		nextState = `haltState;	//if the HALT instruction, go to the haltState and don't return
			{`haltState, `DC3, `DC2, `DC}:	 	nextState = `haltState; //stay in haltSate unconditionally	
			{`decode, `ALU, 2'bx0, `DC}: 		nextState = `getA; 		//getA stage(for add or AND)
			{`decode, `ALU, `CMP, `DC}: 		nextState = `getA; 		//getA stage for comparison
			{`decode, `LDR, `DC2, `DC}:			nextState = `getA; 		//getA stage for LDR
			{`decode, `STR, `DC2, `DC}:			nextState = `getA;		//get A stage for STR
			{`decode, `ALU, `MVN, `DC}: 		nextState = `getB; 		//go directly to getB stage(not)
			{`getA, `ALU, `DC2, `DC}: 			nextState = `getB;		//getB stage(ADD, CMP or AND)
			{`getA, `MOV, `DC2, `DC}: 			nextState = `getB;		//getB stage(MOV)
			{`getA, `LDR, `DC2, `DC}:			nextState = `operate; 	//skip the getB stage for load
			{`getA, `STR, `DC2, `DC}: 			nextState = `operate; 	//skip the getB stage for store
			{`getB, `DC3, `DC2, `DC}: 			nextState = `operate;	//go to the operate phase from getB unconditionally
			{`operate, `ALU, 2'bx0, `DC}:		nextState = `writeback;	//go to writeback phase for AND/ADD
			{`operate, `MOV, `DC2, `DC}:		nextState = `writeback;	//go to writeback for MOV
			{`operate, `LDR, `DC2, `DC}: 		nextState = `loadAddr;	//for LDR, load data address after operate
			{`operate, `STR, `DC2, 1'b0}:		nextState = `loadAddr;	//for STR, if this is the first cycle(ie flag is 0) load data address after operate
			{`operate, `STR, `DC2, 1'b1}:		nextState = `writeRAM;	//for STR, if this is the second cycle(ie flag is 1) write result to RAM
			{`operate, `ALU, `MVN, `DC}: 		nextState = `writeback;	//writeback phase for NOT
			{`operate, `ALU, `CMP , `DC}:		nextState = `if1;		//go right back to start for cmp(skip writeback)
			{`writeback, `DC3, `DC2, `DC}:		nextState = `if1;		//go back to start after writeback
			{`decode, `MOV, `RtoR, `DC}: 		nextState = `getB;		//go directly get B stage for a register to register MOV
			{`loadAddr, `LDR, `DC2, `DC}:		nextState =	`readRAM; 	//
			{`readRAM, `DC3, `DC2, `DC}:		nextState = `MtoR;
			{`loadAddr, `STR, `DC2, `DC}:		nextState = `getB;
			{`writeRAM, `DC3, `DC2, `DC}:		nextState = `if1;
			//BRANCH STATES
			{`decode, `BRANCH, `DC2, `DC}:		nextState = `if1; 
			{`decode, `BLINK, `DC2, `DC}:		nextState = `if1;    
			//{`if1, `BRANCH, `DC2, `DC}:		nextState = `writeback;     
			
			default: 							nextState = `DC4;		//for debugging and no inferred latches
		endcase
	end
endmodule

//module creates outputs based on the state and inputs from and instruction register.
//these outputs control a datapath
//*note* this makes the FSM this is a part of a mealy machine
//*note* although this is part of an FSM, This module is combinational
//inputs:
//	state		- current state of the FSM
//	opcode		- the opcode of the current instruction(MOV, ALU)
//	op			- the operation of the current instruction(ADD, CMP, AND, MVN for ALU, or the two MOV operations)
//	flag 		- set high during ALU operation, used to detect if its in the first or second stage  of STR
//outputs:
//	nsel		- selects which of the three reg numbers to read/write to (Rd, Rn, Rm)
//	vsel		- writeback mux control
//	asel		- select for source-operand mux a
//	bsel		- select for source-operand mux b
//	loada		- load control for pipeline register a
//	loadb		- load control for pipeline register b
//	loadc		- load control for pipeline register c
//	loads		- load control for status register
//	write		- allows you to write to regfile when 1
//	load_pc		- load input to the program counter, when high, pc increments on posedge of clk
// 	addr_sel	- select between data address and program counter registers
//	load_ir 	- load instruction register
//	m_cmd		- memory command, write or read
//	load_addr	- load input of data address
//	nextFlag	- next value for the flag to take, only takes in new values if set flag is high
//	setFlag		- controls if the flag can be set
module createOutput (state, opcode, op, nsel, asel, bsel, vsel, loada, loadb, loadc, loads, write, reset_pc, load_pc, addr_sel, load_ir, m_cmd, load_addr, flag, nextFlag, setFlag, N, V, Z, branchsel, h, cond, PC_sel, p);
	input[3:0] state;
	input[2:0] opcode, cond;
	input[1:0] op;
	input flag, N, V, Z;

	output reg [19:0] p;
	
	output reg[2:0] nsel;
	output reg[1:0] vsel,  m_cmd;
	output reg  asel, bsel, loada, loadb, loadc, loads, write, reset_pc, load_pc, addr_sel, load_ir, load_addr, nextFlag, setFlag, branchsel, h, PC_sel;
	
	//wildcard, updates at change of any input
	always @(*) begin
		//assign output based on state
		casex(state)
			`reset: begin 					//reset stage, first stage of the CPU, resets program counter and flags
				nextFlag=0;
				setFlag=1;
				load_addr=0;
				reset_pc=1;
				load_pc=1;
				addr_sel=0;
				m_cmd=`MNONE;
				load_ir=0;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 1'b0;
				loadb = 1'b0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;					//turn writing off in the regfile to prevent accidental writing
				nsel = 3'b000;
				vsel = `DPout;
				branchsel = 1'b0; 
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`if1: begin						//first stage after executing an instruction or resseting, reset the flag nad begin reading instructionfrom memory
				nextFlag=0;
				setFlag=1;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=1;
				m_cmd=`MREAD;
				load_ir=0;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 1'b0;
				loadb = 1'b0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;					//turn writing off in the regfile to prevent accidental writing
				nsel = 3'b000;
				vsel = `DPout;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b00010000000000000000;
			end
			`if2: begin						//copies the instruction into the Instruction Register
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=1;
				m_cmd=`MREAD;
				load_ir=1;                                   
				asel = 1'b0;
				bsel = 1'b0;
				loada = 1'b0;
				loadb = 1'b0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;					//turn writing off in the regfile to prevent accidental writing
				nsel = 3'b000;
				vsel = `DPout;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`updatePC: begin				//increments the program counter to the next address

				case(opcode)
				`BLINK: begin 
					case(op)
					`BL: begin
						nextFlag=0;
						setFlag=0;
						load_addr=0;
						reset_pc=0;
						load_pc=1; 
						addr_sel=0;
						m_cmd=`MNONE;
						load_ir=0;
						asel = 1'b0;
						bsel = 1'b0;
						loada = 1'b0;
						loadb = 1'b0;
						loads = 0;					//turn loading off on the status reg to prevent accidental writing
						loadc = 0;					//turn loading off on the result reg to prevent accidental writing
						write = 1;					//turn writing off in the regfile to prevent accidental writing
						nsel = 3'b001;                                  //register Rn is R7
						vsel = `PC;
						h = 1'b0;
						PC_sel = 1'b0;
						branchsel = 1'b1;
						p = 20'b0;
						end 

					`BX: begin
						nextFlag=0;
						setFlag=0;
						load_addr=0;
						reset_pc=0;
						load_pc=1; 
						addr_sel=1;
						m_cmd=`MNONE;
						load_ir=0;
						asel = 1'b0;
						bsel = 1'b0;
						loada = 1'b0;
						loadb = 1'b0;
						loads = 0;					//turn loading off on the status reg to prevent accidental writing
						loadc = 0;					//turn loading off on the result reg to prevent accidental writing
						write = 0;					//turn writing off in the regfile to prevent accidental writing
						nsel = 3'b010;
						vsel = `PC;
						h = 1'b0;
						PC_sel = 1'b1;
						branchsel = 1'b0;
						p = 20'b0;
						end 
					
					default: begin 
						nextFlag=0;
						setFlag=0;
						load_addr=0;
						reset_pc=0;
						load_pc=1; 
						addr_sel=0;
						m_cmd=`MNONE;
						load_ir=0;
						asel = 1'b0;
						bsel = 1'b0;
						loada = 1'b0;
						loadb = 1'b0;
						loads = 0;					//turn loading off on the status reg to prevent accidental writing
						loadc = 0;					//turn loading off on the result reg to prevent accidental writing
						write = 0;					//turn writing off in the regfile to prevent accidental writing
						nsel = 3'b000;
						vsel = `DPout;
						h = 1'b0;
						PC_sel = 1'b0;
						branchsel = 1'b0;
						p = 20'b0;
						end 

					endcase
					end
				
				`BRANCH: begin 
						nextFlag=0;
						setFlag=0;
						load_addr=0;
						reset_pc=0;
						load_pc=1; 
						addr_sel=0;
						m_cmd=`MNONE;
						load_ir=0;
						asel = 1'b0;
						bsel = 1'b0;
						loada = 1'b0;
						loadb = 1'b0;
						loads = 0;					//turn loading off on the status reg to prevent accidental writing
						loadc = 0;					//turn loading off on the result reg to prevent accidental writing
						write = 0;					//turn writing off in the regfile to prevent accidental writing
						nsel = 3'b000;
						vsel = `DPout;
						h = 1'b0;
						PC_sel = 1'b0;
						p = 20'b0;

						case(cond)
							`B: branchsel = 1'b1; 
							`BEQ: if(Z===1) branchsel = 1'b1;  else branchsel = 1'b0; 
							`BNE: if(Z===0) branchsel = 1'b1; else 	branchsel = 1'b0;
							`BLT: if(N != V) branchsel = 1'b1; else branchsel = 1'b0; 
							`BLE: if(N!==V || Z===1) branchsel = 1'b1; else branchsel = 1'b0; 
							default: branchsel = 1'b0; 
					        endcase
				   	 end
					
					     
				default: begin 
					nextFlag=0;
					setFlag=0;
					load_addr=0;
					reset_pc=0;
					load_pc=1; 
					addr_sel=0;
					m_cmd=`MNONE;
					load_ir=0;
					asel = 1'b0;
					bsel = 1'b0;
					loada = 1'b0;
					loadb = 1'b0;
					loads = 0;					//turn loading off on the status reg to prevent accidental writing
					loadc = 0;					//turn loading off on the result reg to prevent accidental writing
					write = 0;					//turn writing off in the regfile to prevent accidental writing
					nsel = 3'b000;
					vsel = `DPout;
					h = 1'b0;
					PC_sel = 1'b0;
					branchsel = 1'b0;
					p = 20'b0;
				       end
				endcase 

			end
			`decode: begin 					//wait a cycle for instruction register to take in the new value
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MNONE;
				load_ir=0;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 1'b0;
				loadb = 1'b0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;					//turn writing off in the regfile to prevent accidental writing
				nsel = 3'b000;
				vsel = `DPout;
				branchsel = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
				//if(opcode===`HALT)
					//h=1;
				//else 
				h=0;                                      //set halt signal high since halt state shares same outputs as decode state
			end
			`MtoR: begin 					//MOV from immediate value to Regfile
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				p = 20'b0;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 1'b0;
				loadb = 1'b0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 1;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				
				if(opcode === `LDR) begin	//if preforming the LDR, load the output of memory to Rd
					vsel =`mdata;
					nsel =`Rd;
					m_cmd=`MREAD;
				end
				
				else begin					//otherwise in regular MOV, so write to Rn and input from sx8
					vsel=`sx8;
					nsel=`Rn;
					m_cmd=`MNONE;
				end
			end
			`getA: begin					//load into RegisterA
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MNONE;
				asel = 1'b0;
				bsel = 1'b0;
				loada =1;
				loadb = 1'b0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;
				nsel = `Rn;
				vsel=`sx8;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`getB: begin					//load into Register B
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MNONE;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 0;
				loadb = 1;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
				if(opcode === `STR) begin
					nsel = `Rd;
				end
				else begin
					nsel = `Rm;
				end
				vsel=`sx8;
			end
			`operate: begin					//preform the ALU operation(also used in register to register MOV, LDR and STR)
				load_ir=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MNONE;
				loada = 0;
				loadb = 0;	
				branchsel = 1'b0;
				if((opcode === `MOV)||flag === 1) begin		//writeback for MOV MREAD to R, or for the second phase of STR
					asel=1;
				end
				else begin									//otherwise its just a normal ALU op, so input from registerA
					asel = 0;
				end
				//if in load or the first stage of store, add sximm5 to the register to get the data address
				if((opcode === `LDR)||((opcode === `STR)&&(flag===0))) begin
					bsel = 1;
				end
				
				else begin
					bsel=0;					//input to ALU from register B
				end
				
				if(op === `CMP) begin		//compare, don't care about result, so don't load into register C, but allow status to be written
					loadc = 0;
					loads = 1;
				end
				
				else begin					//otherwise load result in register c, and save the state of status register
					loadc=1;
					loads =0;
				end
				write = 0;
				nsel = 3'b000;
				vsel=`sx8;
				setFlag =1;
				nextFlag = 1;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`writeback: begin				//writeback register c to the regfile		
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MNONE;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 0;
				loadb = 1;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 1;
				nsel = `Rd;					//write to Rd(destination register)
				vsel=`DPout;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`loadAddr: begin				//load address into the data address register
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				reset_pc=0;
				load_pc=0;
				load_addr=1;
				addr_sel=0;
				m_cmd=`MNONE;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 0;
				loadb = 0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;
				nsel = `Rd;					//write to Rd(destination register)
				vsel=`DPout;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`readRAM: begin					//read data from RAM
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MREAD;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 0;
				loadb = 0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;
				nsel = `Rd;					//write to Rd(destination register)
				vsel=`DPout;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`writeRAM: begin				//write data to RAM
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MWRITE;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 0;
				loadb = 0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;
				nsel = `Rd;					//write to Rd(destination register)
				vsel=`DPout;
				branchsel = 1'b0;
				h = 1'b0;
				PC_sel = 1'b0;
				p = 20'b0;
			end
			`haltState: begin 
				load_ir=0;
				nextFlag=0;
				setFlag=0;
				load_addr=0;
				reset_pc=0;
				load_pc=0;
				addr_sel=0;
				m_cmd=`MWRITE;
				asel = 1'b0;
				bsel = 1'b0;
				loada = 0;
				loadb = 0;
				loads = 0;					//turn loading off on the status reg to prevent accidental writing
				loadc = 0;					//turn loading off on the result reg to prevent accidental writing
				write = 0;
				nsel = `Rd;					//write to Rd(destination register)
				vsel=`DPout;
				branchsel = 1'b0;
				h = 1'b1;
				PC_sel = 1'b0;
				p = 20'b0;
			end 
			default: begin					//default case, for debugging and to avoid inferred latches
				load_ir=1'bx;
				nextFlag=1'bx;
				setFlag=1'bx;
				load_addr=1'bx;
				reset_pc=1'bx;
				load_pc=1'bx;
				addr_sel=1'bx;
				m_cmd=`DC2;
				asel = 1'bx;
				bsel = 1'bx;
				loada = 1'bx;
				loadb = 1'bx;
				loadc = 1'bx;
				loads = 1'bx;
				write = 1'bx;
				nsel = 3'bxxx;
				vsel = 2'bxx;
				branchsel = 1'bx;
				h = 1'bx;
				PC_sel = 1'bx;
				p = 20'bxxxxxxxxxxxxxxxxxxxx;
			end
		endcase
	end	
endmodule