`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 23:14:53
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input wire  [5:0]   ALUop,//58条指令，至少需要6为op位
    input wire  [31:0]  ALUa,
    input wire  [31:0]  ALUb,
    output wire [31:0]  ALUresult,
    output wire         of
    );
	
always@(*)
begin
	case(ALUop)：
		6'b000000:ALUresult = ALUa+ALUb; 	//add
		6'b000001:ALUresult = ALUa+ALUb; 	//addu
		6'b000010:ALUresult = ALUa+ALUb; 	//addu
		6'b000011:ALUresult = ALUa+ALUb; 	//addiu
		6'b000100:ALUresult = ALUa-ALUb;	//sub
		6'b000101:ALUresult = ALUa-ALUb;	//subu
		6'b000110:ALUresult = ALUa*ALUb;	//mult
		6'b000111:ALUresult = ALUa*ALUb;	//multu
		6'b001000:ALUresult = ALUa/ALUb;	//div
		6'b001001:ALUresult = ALUa/ALUb;	//divu
		
		6'b001010:ALUresult = ALUa&ALUb;	//and
		6'b001011:ALUresult = ALUa&ALUb;	//andi
		6'b001100:ALUresult = ALUa|ALUb;	//or
		6'b001101:ALUresult = ALUa|ALUb;	//ori
		6'b001110:ALUresult = ALUa^ALUb;	//xor
		6'b001111:ALUresult = ALUa^ALUb;	//xori
		6'b010000:ALUresult = ~(ALUa|ALUb);	//nor
		6'b010001:ALUresult = ALUa<<16;		//lui:把一个16位的立即数填入到寄存器的高16位，低16位补零
		
		6'b010010:ALUresult = ALUb<<ALUa;	//sll:逻辑左移
		6'b010011:ALUresult = ALUb>>ALUa;	//srl:逻辑右移
		6'b010100:ALUresult = ($signed(ALUb))>>>ALUa;	//sra:算术右移
		6'b010101:ALUresult = ALUb<<ALUa;	//sllv:可变逻辑左移
		6'b010110:ALUresult = ALUb>>ALUa;	//srlv:可变逻辑右移
		6'b010111:ALUresult = ($signed(ALUb))>>> ALUa;//srav:可变算术右移
		
		6'b011000:ALUresult = ALUa+ALUb;	//lw:从存储器中读取一个字的数据到寄存器中
		6'b011001:ALUresult = ALUa+ALUb;	//sw:把一个字的数据从寄存器存储到存储器中
		6'b011010:ALUresult = ALUa+ALUb;	//lb:从存储器中读取一个字节的数据到寄存器中
		6'b011011:ALUresult = ALUa+ALUb;	//lbu
		6'b011100:ALUresult = ALUa+ALUb;	//lh:从存储器中读取半个字的数据到寄存器中
		6'b011101:ALUresult = ALUa+ALUb;	//lhu
		6'b011110:ALUresult = ALUa+ALUb;	//sb:把一个字节的数据从寄存器存储到存储器中
		6'b011111:ALUresult = ALUa+ALUb;	//sh:把半个字节的数据从寄存器存储到存储器中
		
		//mfhi:将值移入特殊寄存器hi
		//mflo:将值移入特殊寄存器lo
		//mthi:将通用寄存器的值传送至乘法单元内部寄存器hi
		//mtlo:将通用寄存器的值传送至乘法单元内部寄存器lo
		
		6'b100100:ALUresult = ALUa-ALUb;	//beq:条件转移指令，当寄存器中内容相等时转移发生
		6'b100101:ALUresult = ALUa-ALUb;	//bne:条件转移指令，当两个寄存器中内容不等时转移发生
		6'b100110:ALUresult = ALUa-ALUb;	//slt:有符号数比较
		6'b101000:ALUresult = ALUa-ALUb;	//slti:立即数比较
		6'b101001:ALUresult = ALUa-ALUb;	//sltu:无符号数比较
		6'b101010:ALUresult = ALUa-ALUb;	//sltiu
		6'b101011:ALUresult = ALUa-ALUb;	//bgez s，label:if (s>=0) goto label
		6'b101100:ALUresult = ALUa-ALUb;	//bgtz s，label:if (s>0) goto label
		6'b101101:ALUresult = ALUa-ALUb;	//blez s，label:if (s<=0) goto label
		6'b101110:ALUresult = ALUa-ALUb;	//bltz s，label:if (s<0) goto label
		6'b101111:ALUresult = ALUa-ALUb;	//bgezal s，label:if (s>=0)调用 label()
		6'b110000:ALUresult = ALUa-ALUb;	//bltzal s，label:if (s<0)调用 label()
		
		//j
		//jr
		//jal:子程序调用
		//jalr:
		
		//break
		//syscall
		
		//eret
		//mfc0
		//mtc0
		
		//nop
		default:ALUresult = 32'b000000;

endmodule
