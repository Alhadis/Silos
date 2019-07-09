// build control unit
module Controller
	(
		Opcode,
		Is_Imm,
		WB_En,
		MEM_R_En,
		MEM_W_En,
		EXE_Cmd,
		BR_Type
	);
	
	// input and output ports
	input	[5:0]	Opcode;
	output			Is_Imm;
	output			WB_En;
	output			MEM_R_En;
	output			MEM_W_En;
	output	[3:0]	EXE_Cmd;
	output	[1:0]	BR_Type;
	
	// registers
	reg				Is_Imm;
	reg				WB_En;
	reg				MEM_R_En;
	reg				MEM_W_En;
	reg	[3:0]		EXE_Cmd;
	reg	[1:0]		BR_Type;
	
	// define cases
	parameter NOP = 0;
	parameter ADD = 1;
	parameter SUB = 3;
	parameter AND = 5;
	parameter OR = 6;
	parameter NOR = 7;
	parameter XOR = 8;
	parameter SLA = 9;
	parameter SLL = 10;
	parameter SRA = 11;
	parameter SRL = 12;
	parameter ADDI = 32;
	parameter SUBI = 33;
	parameter LD = 36;
	parameter ST = 37;
	parameter BEZ = 40;
	parameter BNE = 41;
	parameter JMP = 42;
	
	// build module
	
	always @(*)
	begin
		case(Opcode)
			ADDI:
				Is_Imm = 1;
			SUBI:
				Is_Imm = 1;
			LD:
				Is_Imm = 1;
			ST:
				Is_Imm = 1;
			BEZ:
				Is_Imm = 1;
			BNE:
				Is_Imm = 1;
			JMP:
				Is_Imm = 1;
			default:
				Is_Imm = 0;
		endcase
		
		case(Opcode) // TODO: Check
			NOP:
				WB_En = 0;
			ST:
				WB_En = 0;
			BEZ:
				WB_En = 0;
			BNE:
				WB_En = 0;
			JMP:
				WB_En = 0;
			default:
				WB_En = 1;
		endcase
		
		case(Opcode)
			LD:
				MEM_R_En = 1;
			default:
				MEM_R_En = 0;
		endcase
		
		case(Opcode)
			ST:
				MEM_W_En = 1;
			default:
				MEM_W_En = 0;
		endcase
		
		EXE_Cmd = 0;

		BR_Type = 0;
	end
endmodule
