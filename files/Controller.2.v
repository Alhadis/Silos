`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:26 06/28/2019 
// Design Name: 
// Module Name:    Controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Controller (clk, reset, Op, Zero, INT, INTD, NMI, IorD, MemWrite, MemtoReg, IRWrite,
PCSrc, ALUSrcB, ALUSrcA, RegWrite, RegDst, PCEn, ALUOp, state);



	input clk;
	input reset;
	input [5:0] Op;
	input Zero;
	input INT;
	input INTD;
	input NMI;

	output reg IorD;
	output reg MemWrite;
	output reg MemtoReg;
	output reg IRWrite;
	output reg PCSrc;
	output reg RegDst;
	output reg RegWrite;
	output reg ALUSrcA;
	output reg [1:0] ALUSrcB;
	output wire PCEn;
	output reg [1:0] ALUOp;
	reg NMI_FLAG;
	integer append_file;
	initial begin
		
		NMI_FLAG = 0;
		
		
	end

	reg PCWrite;
	reg PCWriteCond; 
	

	assign
		PCEn = (PCWrite | (PCWriteCond & Zero));

	//states
	parameter FETCH = 4'b0000;
	parameter DECODE = 4'b0001;
	parameter MEMADRCOMP = 4'b0010;
	parameter MEMACCESSL = 4'b0011;//L1
	parameter MEMREADEND = 4'b0100;//L2
	parameter MEMACCESSS = 4'b0101;//S
	parameter EXECUTION = 4'b0110;
	parameter RTYPEEND = 4'b0111;
	parameter BEQ = 4'b1000;
	
	parameter INTERRUPT = 4'b1111;
	parameter INTERRUPT_2 = 4'b1110;
	parameter NMI_INTERRUPT = 4'b1101;

	output reg [3:0] state;
	reg [3:0] nextstate;

  always@(posedge NMI) begin
		NMI_FLAG = 1;
		
  end
  

  always@(posedge clk)begin
    if (reset)
		state <= FETCH;
      else
		state <= nextstate;
		
end
	always@(state or Op) begin
      	case (state)
			
		  NMI_INTERRUPT:
		  begin
				nextstate = NMI_INTERRUPT;
		  end
			
		  INTERRUPT:
		  begin
				if ((INT == 1) & (INTD == 0)) begin
				nextstate = INTERRUPT_2;
				end
				else begin
				nextstate = FETCH;
				end		  
		  end
		  
		  
		  INTERRUPT_2:
		  begin
				if ((INT == 1) & (INTD == 0)) begin
				nextstate = INTERRUPT;
				end
				else begin
				nextstate = FETCH;
				end		  
		  end

		  
        FETCH:  
		  begin
				nextstate = DECODE;
		  end
        DECODE:  case(Op)
					//OpCode
                   6'b100011:	nextstate = MEMADRCOMP;//lw
                   6'b101011:	nextstate = MEMADRCOMP;//sw
                   6'b000000:	nextstate = EXECUTION;//r
                   6'b000100:	nextstate = BEQ;//beq
                   default: nextstate = FETCH;
                 endcase
        MEMADRCOMP:  case(Op)
                   6'b100011:      nextstate = MEMACCESSL;//lw
                   6'b101011:      nextstate = MEMACCESSS;//sw
                   default: nextstate = FETCH;
                 endcase
        MEMACCESSL:    nextstate = MEMREADEND;
        MEMREADEND: begin
				
		  	   if (INT & (~INTD)) begin
				nextstate = INTERRUPT;
				end
				else begin
				nextstate = FETCH;
				end
				if (NMI_FLAG == 1) begin
					nextstate  = NMI_INTERRUPT;
				end
		  end
        MEMACCESSS: begin
		  	   if (INT & (~INTD)) begin
				nextstate = INTERRUPT;
				end
				else begin
				nextstate = FETCH;
				end
				if (NMI_FLAG == 1) begin
					nextstate  = NMI_INTERRUPT;
				end
		  end
        EXECUTION: nextstate = RTYPEEND;
        RTYPEEND: begin
		  	   if (INT & (~INTD)) begin
				nextstate = INTERRUPT;
				end
				else begin
				nextstate = FETCH;
				end
				if (NMI_FLAG == 1) begin
					nextstate  = NMI_INTERRUPT;
				end
		  end
        BEQ: begin
		  	   if (INT & (~INTD)) begin
				nextstate = INTERRUPT;
				end
				else begin
				nextstate = FETCH;
				end
				if (NMI_FLAG == 1) begin
					nextstate  = NMI_INTERRUPT;
				end
		  end
        default: nextstate = FETCH;
      endcase
    end


	always@(state) begin
	append_file = $fopen("Data.txt", "a");
	$fwrite(append_file, "PCEn:%b,PCWrite:%b,Branch:%b,PCSrc:%b,ALUOp:%b,ALUSrcB:%b,ALUSrcA:%b,RegWrite:%b,IorD:%b,MemWrite:%b,IRWrite:%b,State:%b,INT:%b,INTB:%b,NMI:%b-", PCEn, PCWrite, PCWriteCond, PCSrc, ALUOp, ALUSrcB, ALUSrcA, RegWrite, IorD, MemWrite, IRWrite, state, INT, INTD, NMI);
	$fclose (append_file);
	IorD=1'b0; MemWrite=1'b0; MemtoReg=1'b0; IRWrite=1'b0; PCSrc=1'b0;
	ALUSrcB=2'b00; ALUSrcA=1'b0; RegWrite=1'b0; RegDst=1'b0; PCWrite=1'b0; PCWriteCond=1'b0; ALUOp=2'b00;

    	case (state)
		  NMI_INTERRUPT:
			begin
				IRWrite = 0;
				RegWrite = 0;
				MemWrite = 0;
				PCWrite = 0;
				PCWriteCond = 0;
				ALUSrcA  = 1;
			end	
		
		  INTERRUPT:
			begin
				IRWrite = 0;
				RegWrite = 0;
				MemWrite = 0; 
				PCWrite = 0;
				PCWriteCond = 0;
				ALUSrcA  = 1;
			end		  
			
			INTERRUPT_2:
			begin
				IRWrite = 0;
				RegWrite = 0;
				MemWrite = 0;
				PCWrite = 0;
				PCWriteCond = 0;
				ALUSrcA  = 1;
			end
		  
		  
        FETCH:
          begin
            IRWrite = 1'b1;
            ALUSrcB = 2'b01;
            PCWrite = 1'b1;
          end
        DECODE:
	    ALUSrcB = 2'b11;
        MEMADRCOMP:
          begin
				
            ALUSrcA = 1'b1;
            ALUSrcB = 2'b10;
          end
        MEMACCESSL:
          begin
            IorD    = 1'b1;
          end
        MEMREADEND:
          begin
            RegWrite = 1'b1;
	    MemtoReg = 1'b1;
            RegDst = 1'b0;
          end
        MEMACCESSS:
          begin
            MemWrite = 1'b1;
            IorD     = 1'b1;
          end
        EXECUTION:
          begin
            ALUSrcA = 1'b1;
            ALUOp   = 2'b10;
          end
        RTYPEEND:
          begin
            RegDst   = 1'b1;
            RegWrite = 1'b1;
          end
        BEQ:
          begin
            ALUSrcA = 1'b1;
            ALUOp   = 2'b01;
            PCWriteCond = 1'b1;
	    PCSrc = 2'b01;
          end
      endcase
		
    end
endmodule
