`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:48 10/15/2017 
// Design Name: 
// Module Name:    multicycle 
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
/*module writeToMemory(sp, MAR, MDR);
	input MAR, sp;
	output MDR;
	reg [15:0] sp;
	reg [15:0] MAR [65535:0];
	assign sp=  sp-1;
	assign MAR[sp] = MDR;

endmodule

module add_label(IR, PC, PC_2);
	input IR, PC;
	output PC_2;
	reg [15:0] PC;
	reg [15:0] PC_2;
	reg [15:0] IR;
	assign Y = IR[11:0];
	assign PC_2 = PC+Y;
endmodule

module non_branch(IR, MDR);
	input [15:0] IR,MDR;
	assign decide = IR[11:10];
	case(decide)
		2'b00: assign MDR = R;
		2'b01: writeFromMem();
		assign R = MDR;
		2'b10 : writeFromMem();
		assign Y = MDR;
		assign op = IR[9:8];
		assign R = R op Y;
		2'b11: assign PC = MDR;
	endcase
endmodule
	

module decode(IR);
	input IR[15:0];
	wire [3:0] br;
	assign br = IR[15:12];
	case(br)
		4'b1111: non_branch(IR);
		4'b1010: call();
		default : branch();
	endcase
endmodule

module val_at(MAR, valMAR,SP);
output valMAR[15:0];
input MAR[15:0], SP[15:0];
assign valMAR = MAR[SP];
endmodule


module fetch(PC, MAR, PC_2, IR, SP);

input PC, SP;
output MAR, PC_2, IR;
reg [15:0] one_reg = 16'b0000000000000001;
reg [15:0] SP; 
reg [15:0] PC;
reg [15:0] MAR[65535:0];
reg [15:0] PC_2;
assign PC_2 = PC+1;
wire valMAR[15:0];
assign IR = val_at(MAR, valMAR, SP);

endmodule

module multicycle(clk, rst, go, A, B, state, SP, IR_addr_set, PC);
input IR_addr_set;
input SP[15:0];
input clk, go, rst;
input A[15:0], B[15:0];
reg [15:0] IR_addr_set[15:0];
output state[3:0];
output PC;
reg [15:0] PC;
assign PC = 16'b0;
reg[15:0] MDR;
reg[15:0] IR;
reg[15:0] MAR[65535:0];
fetch(MAR, PC, IR, MDR);


endmodule*/
module top(inp,go,over,out,clk,state);
	input inp,go,clk;
	output over,out, state;
	wire[9:0] inp;
	wire[9:0] out;
	wire[2:0] fn_sel;
	wire[3:0] state;
	datapath D1(ldMAR, TMAR, Tsp, ldSP, ldReg, Treg, ldPC, Tpc, ldMDR, Tmdr, fnSel,clk, reset, ldALUreg, TaluReg,ALUon, MM, mem, ldIR, Tir, R_W, out, bus_y,ir_1,ir_2,ldFlag,cc);
	controller_fsm D2(op, TMDR, Tlabel, Tpc, Tsp, Treg, R_W, LDmar, state, nextstate, LDmdr, LDy, LDir, LDsp, LDpc, LDreg, ALUon, MM, fnSelect, cc, ir_1, ir_2, clk, rst);

endmodule

module controller(op, TMDR, Tlabel, Tpc, Tsp, Treg, R_W, LDmar, state, nextstate, LDmdr, LDy, LDir, LDsp, LDpc, LDreg, ALUon, MM, fnSelect, cc, ir_1, ir_2, clk, rst);

	input op;
	input clk, rst,ir_1,ir_2,cc;
	output TMDR, Tlabel, Tpc, Tsp, Treg, R_W, LDmar, LDmdr, LDy, LDir, LDsp, LDpc, LDreg, ALUon, MM, fnSelect, state, nextstate;
	reg TMDR, Tlabel, Tpc, Tsp, Treg, R_W, LDmar, LDmdr, LDy, LDir, LDsp, LDpc, LDreg, ALUon, MM;
	reg [3:0] state = 4'b0000, nextstate= 4'b0000; 
	reg [2:0] fnSelect;
	wire clk, rst,cc;
	wire [3:0] op;
	wire[3:0] ir_1;
	wire [1:0] ir_2; 
	parameter S0=4'b0000;
	parameter S1=4'b0001;
	parameter S2=4'b0010;
	parameter S3=4'b0011;
	parameter S4=4'b0100;
	parameter S5=4'b0101;
	parameter S6=4'b0110;
	parameter S7=4'b0111;
	parameter S8=4'b1000;
	parameter S9=4'b1001;
	parameter S10=4'b1010;
	parameter S11=4'b1011;
	parameter S12=4'b1100;
	parameter S13=4'b1101;
	parameter S14=4'b1110;
	parameter S15=4'b1111;
	
	always@(posedge clk or posedge rst)
		begin 
			state = nextstate;
		end
	always@(state)
		// if reset is on
		if(rst == 1)
		begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=0;
					R_W=0;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b100; 
					nextstate = S0;
					MM =0;
		end
		else
		begin 
			case(state)
				// S0 and S1 is for fetch instruction
				// S0 transfers PC to MAR
				S0: begin 
					TMDR =0;
					Tlabel =0;
					Tpc = 1;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 1;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					nextstate = S1;
					MM =0;
				end
				// Loads instruction and increments PC by 1
				S1: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 1;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=1;
					LDsp=0;
					LDpc=1;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b100; 
					MM =0;
					if(ir_1 == 4'b1111)
						 if(ir_2 == 2'b00)
							nextstate = S2;
						else
							nextstate = S3;
					else if(ir_1 == 4'b1010)
						nextstate = S9;
					else
						if(cc==1)
							nextstate = S13;
						else
							nextstate = S0;
				end
				// Push instruction 
				S2: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=1;
					R_W=1;
					LDmar = 0;
					LDmdr=1;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S10;
				end
				// S3 and S4 is used to write from Memory to MDR
				// S3 transfers stack pointer to MAR
				S3: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =1;
					Treg=0;
					R_W=1;
					LDmar = 1;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S4;
				end
				// increments stack pointer by 1 and writes data drom address of MAR to MDR
				S4: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =1;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=1;
					LDy=0;
					LDir=0;
					LDsp=1;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b100; 
					MM =1;
					if (ir_2 == 2'b01)
						nextstate = S5;
					else if(ir_2 == 2'b10)
						nextstate = S6;
					else
						nextstate = S8;
				end
				// pop instruction
				S5: begin
					TMDR =1;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=1;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S0;
				end
				// S6 and S7 are used for ALU operations 
				// S6 -ALU operation instruction, loads MDR into Y
				S6: begin
					TMDR =1;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=1;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon = 0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S7;
				end
				// S7 represents the ALU operation in action and switches on the ALU
				S7: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=1;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=1;
					ALUon = 1;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S0;
				end
				
				// return instruction
				S8: begin
					TMDR =1;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=1;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S0;
				end
				
				// call instruction
				S9: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 1;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=1;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S10;
				end
				
				// S10 , S11 and S12 are used to write data from MDR to address pointed by MAR
				// S10 decrements sp by 1
				S10: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =1;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=1;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b101; 
					MM =0;
					nextstate = S11;
				end
				// S11 transfers stack pointer to MAR
				S11: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 0;
					Tsp =1;
					Treg=0;
					R_W=1;
					LDmar = 1;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					nextstate = S12;
				end
				
				// S12 transfers MDR to address pointed by MAR 
				S12: begin
					TMDR =1;
					Tlabel =0;
					Tpc = 0;
					Tsp =0;
					Treg=0;
					R_W=0;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; 
					MM =0;
					if(ir_1 == 4'b1010)
						nextstate = S13;
					else
						nextstate = S0;
				end
				
				// S13 and S14 are used to add label to PC
				// S13 transfers label to Y register of ALU
				S13: begin
					TMDR =0;
					Tlabel =1;
					Tpc = 0;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=1;
					LDir=0;
					LDsp=0;
					LDpc=0;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b110; // Transfer 0
					MM =0;
					nextstate = S14;
				end
				
				// S14 adds Y to PC
				S14: begin
					TMDR =0;
					Tlabel =0;
					Tpc = 1;
					Tsp =0;
					Treg=0;
					R_W=1;
					LDmar = 0;
					LDmdr=0;
					LDy=0;
					LDir=0;
					LDsp=0;
					LDpc=1;
					LDreg=0;
					ALUon =0;
					fnSelect=3'b000;   // For addition 
					MM =0;
					nextstate = S0;
				end
			endcase
		end	
endmodule

module MDR(dataIn, dataOut, clk);
	input dataIn, clk;
	output dataOut;
	wire [15:0] dataIn;
	wire clk;
	reg [15:0] dataOut;
	always@(posedge clk)
		begin
			assign dataOut = dataIn;
		end
endmodule

module ALUcontrol(ALUon, fnSelect, ir_3, operation);
	input ALUon, fnSelect, ir_3;
	output operation;
	wire ALUon;
	wire [2:0] fnSelect;
	wire [1:0] ir_3;
	reg [3:0] operation;
	always @(ir_3)
		begin
			if(ALUon==0)
				operation = fnSelect;
			else
				case(ir_3)
					2'b00: begin operation = 3'b000;
							end
					2'b01: begin operation = 3'b001;
							end
					2'b10: begin operation = 3'b010;
							end
					2'b11: begin operation = 3'b011;
							end
				endcase
		end
	
endmodule 

module ALU(operation, dataX, dataY, ALUresult);
	input operation, dataX, dataY;
	output ALUresult;
	wire [2:0] operation;
	wire [15:0] dataX, dataY;
	reg[15:0] ALUresult;
	always @(operation)
		begin
		case(operation)
			3'b000: begin 
				ALUresult <= dataX+dataY;
			end
			3'b001: begin 
				ALUresult <= -dataY;
			end
			3'b010: begin 
				ALUresult <= dataX|dataY;
			end
			3'b011: begin 
				ALUresult <= ~dataY;
			end
			3'b100: begin 
				ALUresult <= dataX+16'b0000000000000001;
			end
			3'b101: begin 
				ALUresult <= dataX-16'b0000000000000001;
			end
			3'b110: begin 
				ALUresult <= dataY;
			end
		endcase
		end
		
endmodule

module datapath(ldMAR, TMAR, Tsp, ldSP, ldReg, Treg, ldPC, Tpc, ldMDR, Tmdr, fnSel,clk, reset, ldALUreg, TaluReg,ALUon,fnSelect, MM, mem, ldIR, Tir, R_W, out, bus_addr,bus_y,ir_1,ir_2,ldFlag,cc,D_busOut);
	input ldMAR, TMAR, Tsp, ldSP, ldReg, Treg, ldPC, Tpc, ldMDR, Tmdr, fnSel,fnSelect,MM, mem,clk, reset,ldALUreg, TaluReg,ALUon,ldFlag,ldIR,Tir, R_W;
	input bus_y;
	output out,bus_addr, cc, D_busOut;
	output ir_1,ir_2;
	wire [15:0] D_busOut;
	wire [15:0] bus_y, bus_addr;
	wire [15:0] alu_in;
	wire [15:0] alu_out;
	wire [15:0] out;
	wire [2:0]  fnSelect;
	wire [1:0] fnSel;
	wire [3:0] ir_1;
	wire [1:0] ir_2;
	wire [1:0] ir_3;
	wire [2:0] ir_4;
	wire [15:0] MDRdata;
	wire cc,ldFlag;
	reg [2:0] funct;
	wire s,v,c,z;
	registerIR IR(bus_y, ir_1, ir_2, ir_3, ir_4, ldIR, Tlabel, clk);
	MUX3 muxALU(ALUon, fnSel, fnSelect, funct);
	MUX16 muxMDR(mm, bus_y, out, MDRdata);
	register ALUReg(alu_in, alu_out, ldALUreg, 1'b1, clk);
	registerMDR MDR(MDRdata, alu_in, D_busOut, ldMDR, Tmdr, clk);
	register MAR(out, bus_addr, ldMAR, 1'b1, clk);
	register SP(out, alu_in, ldSP, Tsp, clk);
	register PC(out, alu_in, ldPC, Tpc, clk);
	registerBank regBank(out, bus_y, ldReg, Treg, clk);
	functional_unit ALU(alu_in, alu_out, out, funct);
	statusDetector sd(alu_in, alu_out, s,v,c,z);
	statusSelector st(v, c, s, z, ir_1, ldFlag, cc , clk , reset);
	
endmodule 

module MUX3(ALUon, fnSel, fnSelect, funct);
	input ALUon, fnSel, fnSelect;
	output funct;
	wire [2:0] fnSelect;
	reg [1:0] fnSel;
	wire [2:0] funct;
	reg ALUon;
	if(ALUon==1'b0)
		assign funct = fnSelect;
	else
		if(fnSel== 2'b00)
			assign funct = 3'b000;
		else if(fnSel == 2'b01)
			assign funct = 3'b001;
		else if(fnSel == 2'b10)
			assign funct = 3'b010;
		else if(fnSel == 2'b11)
			assign funct = 3'b011;
endmodule

module MUX16(MM, bus_y , out, MDRdata);
	input MM, bus_y, out;
	output MDRdata;
	reg MM;
	wire [15:0] bus_y, out;
	wire [15:0] MDRdata;
	if(MM==1'b1)
		assign MDRdata = bus_y;
	else
		assign MDRdata = out;
endmodule

module registerIR(in, ir_1, ir_2, ir_3, ir_4, ldx, Tx, clk);
	input in, ldx, Tx, clk;
	wire[15:0] in;
	output ir_1, ir_2, ir_3, ir_4;
	reg [3:0] ir_1;
	reg [1:0] ir_2, ir_3;
	reg [2:0] ir_4;
	reg[15:0] data = 16'b0;

	always @(posedge clk)	
		begin
		if(ldx == 1)
			begin
				data[15:12] <= in[15:12];
				data[11:10] <= in[11:10];
				data[9:8] <= in[9:8];
				data[7:5] <= in[7:5];
			end
		else
			data <= data;
		end
	
	always @*
		begin 
		if(Tx == 0)
			begin
			ir_1 <= 4'bz;
			ir_2 <= 2'bz;
			ir_3 <= 3'bz;
			ir_4 <= 3'bz;
			end
		else 
			begin
				ir_1 <= data[15:12];
				ir_2 <= data[11:10];
				ir_3 <= data[9:8];
				ir_4 <= data[7:5];
			end
		end
			
endmodule


module register(in, out, ldx, Tx, clk);
	input in, ldx, Tx, clk;
	wire[15:0] in;
	output out;
	reg[15:0] out;
	reg[15:0] data = 16'b0;

	always @(posedge clk)	
		begin
		if(ldx == 1)
			data <= in;
		else
			data <= data;
		end
	
	always @*
		begin 
		if(Tx == 0)
			begin
			out <= 16'bz;
			end
		else 
			begin
			out <= data;
			end
		end
			
endmodule

module registerMDR(in, out, out2, ldx, Tx, clk);
	input in, ldx, Tx, clk;
	wire[15:0] in;
	output out, out2;
	reg[15:0] out, out2;
	reg[15:0] data = 16'b0;

	always @(posedge clk)	
		begin
		if(ldx == 1)
			data <= in;
		else
			data <= data;
		end
	
	always @*
		begin 
		if(Tx == 0)
			begin
			out <= 16'bz;
			out2 <= 16'bz;
			end
		else 
			begin
			out <= data;
			out2 <= data;
			end
		end
			
endmodule

module functional_unit(a,y,z,fn_sel);
	input a,y,fn_sel;
	wire[15:0] a;
	wire[15:0] y;
	wire[2:0] fn_sel;
	output z;
	reg[15:0] z;
	always @(a or y or fn_sel)
		begin
		case(fn_sel)
			3'b000 : begin
				z <= a+y;
			end
			3'b001 : begin
				z <= -y;
			end
			3'b010 : begin
				z <= a|y;
			end
			3'b011 : begin
				z <= ~y;
			end
			3'b100 : begin
				z<= y+1;
			end
			3'b101 : begin
				z <= y-1;
			end
			3'b110: begin
				z <= y;
			end
		endcase
		end
		
endmodule

module statusDetector(bus_x, bus_y, s,v,c,z);
	input bus_x, bus_y;
	output s,v,c,z;
	reg [15:0] bus_x, bus_y;
	reg B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16;
	reg[15:0] sum;
	carry C1(bus_x[0], bus_y[0], 0, B1);
	carry C2(bus_x[1], bus_y[1], B1, B2);
	carry C3(bus_x[2], bus_y[2], B2, B3);
	carry C4(bus_x[3], bus_y[3], B3, B4);
	carry C5(bus_x[4], bus_y[4], B4, B5);
	carry C6(bus_x[5], bus_y[5], B5, B6);
	carry C7(bus_x[6], bus_y[6], B6, B7);
	carry C8(bus_x[7], bus_y[7], B7, B8);
	carry C9(bus_x[8], bus_y[8], B8, B9);
	carry C10(bus_x[9], bus_y[9], B9, B10);
	carry C11(bus_x[10], bus_y[10], B10, B11);
	carry C12(bus_x[11], bus_y[11], B11, B12);
	carry C13(bus_x[12], bus_y[12], B12, B13);
	carry C14(bus_x[13], bus_y[13], B13, B14);
	carry C15(bus_x[14], bus_y[14], B14, B15);
	carry C16(bus_x[15], bus_y[15], B15, B16);
	assign sum = bus_x + bus_y;
	if(B16 == 1'b1)
		assign c= 1;
	else
		assign c=0;
	if( B16==1'b0)
		if(sum[15]==1)
			assign v = 1;
		else
			assign v = 0;
	else if(B16 == 1'b1)
		if(sum[15]==0)
			assign v= 1;
		else
			assign v =0;
	if(bus_x == 16'b0000000000000000)
		assign z=1;
	else
		assign z=0;
	if(bus_x[15] == 1)
		assign s =1;
	else
		assign s =0;
	
	
endmodule

module carry(x,y,Bin,Bout);
	input x,y,Bin;
	output Bout;
	wire a;
	xor XOR1(a,x,y);
	xor XOR_2(Bout, a,Bin);
endmodule

module registerBank(in , out, ldX, Tx, clk, ir);
	input in, ldX, Tx, clk, ir;
	output out;
	wire[15:0] in;
	wire ldX, Tx, clk;
	wire[2:0] ir;
	reg[15:0] out;
	wire ac1,ac2,ac3,ac4,ac5,ac6,ac7,ac8;
	wire ld1,ld2,ld3,ld4, ld5,ld6,ld7,ld8;
	wire T1,T2,T3,T4,T5,T6,T7,T8;
	
	decoder registers(ir, ac1, ac2,ac3,ac4, ac5, ac6, ac7, ac8);
	
	and LOAD1(ld1, ldX,ac1);
	and LOAD2(ld2, ldX,ac2);
	and LOAD3(ld3, ldX,ac3);
	and LOAD4(ld4, ldX,ac4);
	and LOAD5(ld5, ldX,ac5);
	and LOAD6(ld6, ldX,ac6);
	and LOAD7(ld7, ldX,ac7);
	and LOAD8(ld8, ldX,ac8);
	
	and TR1(T1, Tx,ac1);
	and TR2(T2, Tx,ac2);
	and TR3(T3, Tx,ac3);
	and TR4(T4, Tx,ac4);
	and TR5(T5, Tx,ac5);
	and TR6(T6, Tx,ac6);
	and TR7(T7, Tx,ac7);
	and TR8(T8, Tx,ac8);
	
	regsiter R0(in,out, ld1, T1, clk);
	regsiter R1(in,out, ld2, T2, clk);
	regsiter R2(in,out, ld3, T3, clk);
	regsiter R3(in,out, ld4, T4, clk);
	regsiter R4(in,out, ld5, T5, clk);
	regsiter R5(in,out, ld6, T6, clk);
	regsiter R6(in,out, ld7, T7, clk);
	regsiter R7(in,out, ld8, T8, clk);
	
endmodule

module decoder(ir, ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8);
input [2:0] ir;
output ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8;
assign ac1 =0;
assign ac2 =0;
assign ac3 =0;
assign ac4 =0;
assign ac5 =0;
assign ac6 =0;
assign ac7 =0;
assign ac8 =0;
case(ir)
	3'b000: begin 
		assign ac1 =1;
	end
	3'b001:begin
		assign ac2 = 1;
	end
	3'b010: begin 
		assign ac3 =1;
	end
	3'b011:begin
		assign ac4 = 1;
	end
	3'b100: begin 
		assign ac5 =1;
	end
	3'b101:begin
		assign ac6 = 1;
	end
	3'b110: begin 
		assign ac7 =1;
	end
	3'b111:begin
		assign ac8 = 1;
	end
	endcase
endmodule

module DFF( D, clk, reset, Q);
	input D, clk, reset;
	output reg Q;
	wire D;
	always @(posedge clk, posedge reset)
	begin
		if(reset)
			Q <= 0;
		else 
			Q<= D;
	end
		
endmodule

module statusSelector(Vin, Cin, Sin, Zin, ir, ldFlag, cc , clk , reset);
	input Vin, Cin, Sin, Zin,ir, ldFlag, clk, reset;
	output cc;
	reg cc;
	wire [3:0] ir;
	wire [3:0] S;
	DFF D1(Vin, clk, reset, S[0]);
	DFF D2(Cin, clk, reset, S[1]);
	DFF D3(Sin, clk, reset, S[2]);
	DFF D4(Zin, clk, reset, S[3]);
	always @(ir[0] or ir[1] or ir[2] or ir[3] or S)
	begin
	case(ir)
		4'b0001: cc<=1;
		4'b0010: cc<=S[1];
		4'b0011: cc<=~S[1];
		4'b0100: cc<=S[3];
		4'b0101: cc<=~S[3];
		4'b0110: cc<=S[0];
		4'b0111: cc<=~S[0];
		4'b1000: cc<=S[2];
		4'b1001: cc<=~S[2];
	endcase
	end
endmodule

module data_memory (
input wire [15:0] addr,          // Memory Address
input wire [15:0] write_data,    // Memory Address Contents
input wire memwrite, memread,
input wire clk,                  // All synchronous elements, including memories, should have a clock signal
output reg [15:0] read_data      // Output of Memory Address Contents
);

reg [15:0] MEMO[0:255];  // 256 words of 16-bit memory

integer i;

initial begin
  read_data <= 0;
  for (i = 0; i < 256; i = i + 1) begin
    MEMO[i] = i;
  end
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(posedge clk) begin
  if (memwrite == 1'b1) begin
    MEMO[addr] <= write_data;
  end
  // Use memread to indicate a valid address is on the line and read the memory into a register at that address when memread is asserted
  if (memread == 1'b1) begin
    read_data <= MEMO[addr];
  end
end

endmodule
				
				
				
				