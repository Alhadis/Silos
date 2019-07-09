`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:22 10/27/2017 
// Design Name: 
// Module Name:    datapath 
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
module data_memory (
input wire [15:0] addr,          // Memory Address
input wire [15:0] write_data,    // Memory Address Contents
input wire memwrite, memread,
input wire clk,                  // All synchronous elements, including memories, should have a clock signal
output reg [15:0] read_data      // Output of Memory Address Contents
);

reg [15:0] MEMO[0:255];  // 256 words of 16-bit memory

integer i;

initial 
	begin
		//read_data = 16'b0000000000000000;
		MEMO[0] = 16'b1111010000000000;
		MEMO[1] = 16'b1111100000000000;
		MEMO[2] = 16'b1111100100100000;
		MEMO[3] = 16'b1111000000000000;
		MEMO[4] = 16'b1111100000100000;
		MEMO[5] = 16'b1111000000100000;
		MEMO[255] = 1;
		MEMO[254] = 3;
		MEMO[253]= 4;
		//MEMO[0] = 16'b1111100100100000;
		//MEMO[0] = 16'b1111100100100000;
		for (i = 6; i < 253; i = i + 1) 
			begin
					MEMO[i] = 16'b0000000000000000;
			end
	end

	always @(posedge clk)
		begin
			if(memwrite == 1'b0)
				begin
					MEMO[addr] <= write_data;
				end
			else if(memwrite == 1'b1)
				begin
					read_data <= MEMO[addr];
				end
		end
endmodule

module top(addr_bus, data_bus, data_bus_out,clk, reset, R_W);
	input clk,reset,data_bus;
	output addr_bus, data_bus_out,R_W;
	wire[15:0] data_bus;
	wire[15:0] addr_bus,data_bus_out;
	wire [3:0] op;
	wire[2:0] fnSelect, funct;
	wire cc;
	wire[3:0] ir_1; 
	wire[1:0] ir_2;
	wire [3:0] state, nextstate;
	wire [15:0] out;
	wire Tmdr, Tlabel, Tpc, Tsp, Treg,  ldMAR, ldMDR, ldY, ldIR, ldSP, ldPC, ldReg,ldFlag,ALUon,mm;
	datapath D1(ldMDR, Tmdr,ldMAR, data_bus,data_bus_out, ldIR, Tlabel,clk, reset, ir_1, ir_2, ALUon, fnSelect, funct,mm,out, ldY, addr_bus, ldSP, ldPC, Tsp, Tpc, ldReg, Treg, ldFlag,cc);
	controller D2(op, Tmdr, Tlabel, Tpc, Tsp, Treg, R_W, ldMAR, state, nextstate, ldMDR, ldY, ldIR, ldSP, ldPC, ldReg, ALUon, mm, fnSelect, cc, ir_1, ir_2, clk, reset);

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

module datapath(ldMDR, Tmdr,ldMAR, data_bus,data_bus_out,ldIR, Tlabel,clk, reset, ir_1, ir_2, ALUon, fnSelect, funct,mm,out, ldALUreg, addr_bus, ldSP, ldPC, Tsp, Tpc, ldReg, Treg, ldFlag,cc);
	// data_bus -> D_bus
	// check out as input or not
	input ldMDR, Tmdr, ldMAR,data_bus, ldIR,ldFlag, Tlabel, clk,reset, ALUon, fnSelect, mm, out, ldALUreg, ldSP, ldPC, Tsp, Tpc, ldReg, Treg;
	output ir_1, ir_2, funct,addr_bus,cc, data_bus_out;
	wire ldMAR, ldSP,ldPC, Tsp, Tpc, ldReg, Treg;
	wire [3:0] ir_1;
	wire [1:0]ir_2, ir_3;
	wire [2:0] ir_4;
	wire [15:0] data_bus;
	wire ldIR, Tlabel;
	wire [2:0] funct;
	wire [2:0] fnSelect;
	wire [15:0] MDRdata;
	wire [15:0] out;
	wire [15:0] bus_x;  // busin
	wire [15:0] aluRegOut; // Ywire
	wire [15:0] addr_bus;
	wire [15:0] data_bus_out;
	wire [15:0] ir_5;
	wire s,v,c,z;
	wire mm;
	registerIR IR(data_bus, ir_1, ir_2, ir_3, ir_4,ir_5, ldIR, Tlabel, clk);
	MUX3 muxALU(ALUon, ir_3, fnSelect, funct);
	MUX16 muxMDR(mm, data_bus, out, MDRdata);
	register MAR(out, addr_bus, ldMAR, 1'b1, clk);
	registerMDR MDR(MDRdata, bus_x, data_bus_out, ldMDR, Tmdr, clk);
	registerSP SP(out, bus_x, ldSP, Tsp, clk);
	register PC(out, bus_x, ldPC, Tpc, clk);
	register ALUReg(bus_x, aluRegOut, ldALUreg, 1'b1, clk);
	registerBank regBank(out, bus_x, ldReg, Treg, clk,ir_4);
	functional_unit ALU(bus_x, aluRegOut, out, funct);
	statusDetector sd(bus_x, aluRegOut,out, s,v,c,z);
	statusSelector st(v, c, s, z, ir_1, ldFlag, cc , clk , reset);
	//always @(posedge clk)
	//begin
	//$display("The binary value of MDRdata is: %b", MDRdata ) ;
	//$display("The binary value of bus_x is : %b", bus_x);
	//$display("The binary value of aluRegOut is : %b", aluRegOut);
	//end
endmodule

module statusDetector(bus_x, bus_y,out, s,v,c,z);
	input bus_x, bus_y, out;
	output s,v,c,z;
	wire [15:0] bus_x, bus_y, out;
	wire[3:0] ir_1;
	wire B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,B16;
	wire[15:0] sum;
	wire s,v,c,z;
	carry C1(bus_x[0], bus_y[0], 1'b0, B1);
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
	assign c = B16;
	xor x(v, B16, sum[15]);
	assign s = out[15];
	nand n(z, out[15], out[14], out[13], out[12], out[11], out[10], out[9], out[8], out[7], out[6], out[5], out[4], out[3], out[2], out[1], out[0]);  
	always@(bus_x)
	begin
		$display("Heelo \n %b",B15);
		$display("Heelo1 \n %b",B16);
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
		default: cc<=0;
	endcase
	end
endmodule


module carry(x,y,Bin,Bout);
	input x,y,Bin;
	output Bout;
	wire x, y, Bin;
	wire Bout;
	wire a,b,c,d;
	and and1(a,x,y);
	and and2(b,x,Bin);
	and and3(c,y,Bin);
	or  or1(d,a,b);
	or  or2(Bout,d,c);
endmodule

module DFF( D, clk, reset, Q);
	input D, clk, reset;
	output reg Q;
	wire D;
	always @(posedge clk or posedge reset)
	begin
		if(reset)
			Q <= 0;
		else 
			Q<= D;
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
			out2 <= data;
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
				z<= a+1;
			end
			3'b101 : begin
				z <= a-1;
			end
			3'b110: begin
				z <= a;
			end
		endcase
		end
		always @(fn_sel)
		begin
			$display("ac1: %b", z) ;
		end
		
endmodule

module registerBank(in , out, ldX, Tx, clk, ir);
	input in, ldX, Tx, clk, ir;
	output out;
	wire[15:0] in;
	wire ldX, Tx, clk;
	wire[2:0] ir;
	wire [15:0] out;
	reg ac1,ac2,ac3,ac4,ac5,ac6,ac7,ac8;
	wire ld1,ld2,ld3,ld4, ld5,ld6,ld7,ld8;
	wire T1,T2,T3,T4,T5,T6,T7,T8;
	always @(ir)
	begin
	case(ir)
		3'b000: begin 
			ac1 <= 1'b1;
			ac2 <= 1'b0;
			ac3 <= 1'b0;
			ac4 <= 1'b0;
			ac5 <= 1'b0;
			ac6 <= 1'b0;
			ac7 <= 1'b0;
			ac8 <= 1'b0;
		end
		3'b001:begin
			ac1 <= 1'b0;
			ac2 <= 1'b1;
			ac3 <= 1'b0;
			ac4 <= 1'b0;
			ac5 <= 1'b0;
			ac6 <= 1'b0;
			ac7 <= 1'b0;
			ac8 <= 1'b0;
		end
		3'b010: begin 
			ac1 <= 1'b0;
			ac2 <= 1'b0;
			ac3 <= 1'b1;
			ac4 <= 1'b0;
			ac5 <= 1'b0;
			ac6 <= 1'b0;
			ac7 <= 1'b0;
			ac8 <= 1'b0;
		end
		3'b011:begin
			ac1 <= 1'b0;
			ac2 <= 1'b0;
			ac3 <= 1'b0;
			ac4 <= 1'b1;
			ac5 <= 1'b0;
			ac6 <= 1'b0;
			ac7 <= 1'b0;
			ac8 <= 1'b0;
		end
		3'b100: begin 
			ac1 <= 1'b0;
			ac2 <= 1'b0;
			ac3 <= 1'b0;
			ac4 <= 1'b0;
			ac5 <= 1'b1;
			ac6 <= 1'b0;
			ac7 <= 1'b0;
			ac8 <= 1'b0;
		end
		3'b101:begin
			ac1 <= 1'b0;
			ac2 <= 1'b0;
			ac3 <= 1'b0;
			ac4 <= 1'b0;
			ac5 <= 1'b0;
			ac6 <= 1'b1;
			ac7 <= 1'b0;
			ac8 <= 1'b0;
		end
		3'b110: begin 
			ac1 <= 1'b0;
			ac2 <= 1'b0;
			ac3 <= 1'b0;
			ac4 <= 1'b0;
			ac5 <= 1'b0;
			ac6 <= 1'b0;
			ac7 <= 1'b1;
			ac8 <= 1'b0;
		end
		3'b111:begin
			ac1 <= 1'b0;
			ac2 <= 1'b0;
			ac3 <= 1'b0;
			ac4 <= 1'b0;
			ac5 <= 1'b0;
			ac6 <= 1'b0;
			ac7 <= 1'b0;
			ac8 <= 1'b1;
		end
		endcase
	end
	/*always @(clk)
	begin
	$display("ac1: %d", ac1) ;
	$display("ac2: %d", ac2) ;
	$display("ac3: %d", ac3) ;
	$display("ac4: %d", ac4) ;
	$display("ac5: %d", ac5) ;
	$display("ac6: %d", ac6) ;
	$display("ac7: %d", ac7) ;
	$display("ac8: %d", ac8);
	end*/
	
	//decoder registers(ir, ac1, ac2,ac3,ac4, ac5, ac6, ac7, ac8);
	
	/*always @(ir)
	begin
	$display("ac1: %d", ac1) ;
	$display("ac2: %d", ac2) ;
	$display("ac3: %d", ac3) ;
	$display("ac4: %d", ac4) ;
	$display("ac5: %d", ac5) ;
	$display("ac6: %d", ac6) ;
	$display("ac7: %d", ac7) ;
	$display("ac8: %d", ac8) ;
	end*/
	
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
	
	register R0(in,out, ld1, T1, clk);
	register R1(in,out, ld2, T2, clk);
	register R2(in,out, ld3, T3, clk);
	register R3(in,out, ld4, T4, clk);
	register R4(in,out, ld5, T5, clk);
	register R5(in,out, ld6, T6, clk);
	register R6(in,out, ld7, T7, clk);
	register R7(in,out, ld8, T8, clk);
	
endmodule

/*module decoder(ir, ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8);
input [2:0] ir;
output ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8;
reg ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8;
assign ac1 =0;
assign ac2 =0;
assign ac3 =0;
assign ac4 =0;
assign ac5 =0;
assign ac6 =0;
assign ac7 =0;
assign ac8 =0;
wire[2:0] ir;
always @(ir)
begin
case(ir)
	3'b000: begin 
		ac1 <= 1'b1;
	end
	3'b001:begin
		ac2 <= 1'b1;
	end
	3'b010: begin 
		ac3 <= 1'b1;
	end
	3'b011:begin
		ac4 <= 1'b1;
	end
	3'b100: begin 
		ac5 <= 1'b1;
	end
	3'b101:begin
		ac6 <= 1'b1;
	end
	3'b110: begin 
		ac7 <= 1'b1;
	end
	3'b111:begin
		ac8 <= 1'b1;
	end
	endcase
end
endmodule*/

module registerSP(in, out, ldx, Tx, clk);
	input in, ldx, Tx, clk;
	wire[15:0] in;
	output out;
	reg[15:0] out;
	reg[15:0] data = 16'b0;
	
	initial
	begin
		data = 253;
	end

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

module MUX16(MM, bus_y , out, MDRdata);
	input MM, bus_y, out;
	output MDRdata;
	reg [15:0] MDRdata;
	wire [15:0] bus_y;
	wire[15:0]	out;
	wire MM;
	always@(MM)
	begin
		if(MM == 1)
			MDRdata = bus_y;
		else
			MDRdata = out;
	end
endmodule

module MUX3(ALUon, fnSel, fnSelect, funct);
	input ALUon;
	input [1:0] fnSel;
	input [2:0] fnSelect;
	output [2:0] funct;
	
	reg[2:0] funct;
	wire [1:0] fnSel;
	wire ALUon;
	wire [2:0] fnSelect;
	
	always @(ALUon or fnSel)
	begin
		if(ALUon == 0 )
			funct = fnSelect;
		else
			case(fnSel)
				2'b00: funct = 3'b000;
				2'b01: funct = 3'b001;
				2'b10: funct = 3'b010;
				2'b11: funct = 3'b011;
			endcase
	end
endmodule

module registerIR(in, ir_1, ir_2, ir_3, ir_4,ir_5, ldx, Tx, clk);
	input in, ldx, Tx, clk;
	wire[15:0] in;
	output ir_1, ir_2, ir_3, ir_4,ir_5;
	reg [3:0] ir_1;
	reg [1:0] ir_2, ir_3;
	reg [2:0] ir_4;
	reg [15:0] ir_5;
	reg[15:0] data = 16'b0;

	always @(posedge clk)	
		begin
		if(ldx == 1)
			begin
				data <= in;
			end
		else
			data <= data;
		end
	
	always @*
		begin 
		if(Tx == 1)
			begin
			ir_1 <= data[15:12];
			ir_2 <= data[11:10];
			ir_3 <= data[9:8];
			ir_4 <= data[7:5];
			ir_5[15:12] <= 4'b0000;
			ir_5[11:0] <= data[11:0];
			end
		else 
			begin
				ir_1 <= data[15:12];
				ir_2 <= data[11:10];
				ir_3 <= data[9:8];
				ir_4 <= data[7:5];
				ir_5 <= 16'bz;
			end
		end
			
endmodule
