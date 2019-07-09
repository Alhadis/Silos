// build control unit
module Controller
	(
		Opcode,
		Stall_Special_Condition,
		Is_Imm,
		WB_En,
		MEM_R_En,
		MEM_W_En,
		EXE_Cmd,
		BR_Type
	);
	
	// input and output ports
	input	[5:0]	Opcode;
	output			Stall_Special_Condition;
	output			Is_Imm;
	output			WB_En;
	output			MEM_R_En;
	output			MEM_W_En;
	output	[3:0]	EXE_Cmd;
	output	[1:0]	BR_Type;
	
	// registers
	reg				Stall_Special_Condition;
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
	
	// define branch types
	parameter NO_BRANCH_Code = 2'b0;
	parameter BEZ_Code = 2'b01;
	parameter BNE_Code = 2'b10;
	parameter JMP_Code = 2'b11;

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
		
		case(Opcode)
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
		
		case(Opcode)
			ADD:
				EXE_Cmd = 4'b0000;
			SUB:
				EXE_Cmd = 4'b0010;
			AND:
				EXE_Cmd = 4'b0100;
			OR:
				EXE_Cmd = 4'b0101;
			NOR:
				EXE_Cmd = 4'b0110;
			XOR:
				EXE_Cmd = 4'b0111;
			SLA:
				EXE_Cmd = 4'b1000;
			SLL:
				EXE_Cmd = 4'b1000;
			SRA:
				EXE_Cmd = 4'b1001;
			SRL:
				EXE_Cmd = 4'b1010;
			ADDI:
				EXE_Cmd = 4'b0000;
			SUBI:
				EXE_Cmd = 4'b0010;
			LD:
				EXE_Cmd = 4'b0000;
			ST:
				EXE_Cmd = 4'b0000;
			default:
				EXE_Cmd = {4{1'bx}};
		endcase
		
		case(Opcode)
			BEZ:
				BR_Type = BEZ_Code;
			BNE:
				BR_Type = BNE_Code;
			JMP:
				BR_Type = JMP_Code;
			default:
				BR_Type = NO_BRANCH_Code;
		endcase
		
		case(Opcode)
			BNE:
				Stall_Special_Condition = 1;
			BEZ:
				Stall_Special_Condition = 1;
			default:
				Stall_Special_Condition = 0;
		endcase
	end
endmodule
