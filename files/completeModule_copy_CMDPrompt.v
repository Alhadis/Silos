`timescale 1ns / 1ps

module full_adder ( a ,b ,c ,sum ,carry );

    output sum ;
    output carry ;

    input a ;
    input b ;
    input c ;
        
//    assign sum = a ^ b ^ c;  
//    assign carry = (a&b) | (b&c) | (c&a);
   // xor (t, a, b);
    //xor (sum, t1, c);
	 xor(sum, a, b, c);
    and (t1, a,b), (t2, b, c), (t3, c,a);
   // or (tt, t1, t2);
    or (carry, t1, t2, t3);
endmodule

module adder_16 (sum, c_n, c_n_minus_1, a, b, cin);

output [15:0] sum ;
output c_n, c_n_minus_1;

input [15:0] a ;
input [15:0] b ;
input cin;

wire [13:0] s;

full_adder u0 (a[0],b[0],cin,sum[0],s[0]);
full_adder u1 (a[1],b[1],s[0],sum[1],s[1]);
full_adder u2 (a[2],b[2],s[1],sum[2],s[2]);
//full_adder u3 (a[3],b[3],s[2],sum[3],carry);
full_adder u3 (a[3],b[3],s[2],sum[3],s[3]);
full_adder u4 (a[4],b[4],s[3],sum[4],s[4]);
full_adder u5 (a[5],b[5],s[4],sum[5],s[5]);
full_adder u6 (a[6],b[6],s[5],sum[6],s[6]);
full_adder u7 (a[7],b[7],s[6],sum[7],s[7]);

full_adder  u8(a[8],b[8],s[7],sum[8],s[8]);
full_adder  u9(a[9],b[9],s[8],sum[9],s[9]);
full_adder  u10(a[10],b[10],s[9],sum[10],s[10]);
full_adder  u11(a[11],b[11],s[10],sum[11],s[11]);
full_adder  u12(a[12],b[12],s[11],sum[12],s[12]);
full_adder  u13(a[13],b[13],s[12],sum[13],s[13]);
full_adder  u14(a[14],b[14],s[13],sum[14],c_n_minus_1);
full_adder  u15(a[15],b[15],c_n_minus_1, sum[15],c_n);

endmodule

module tb_adder_16;
	reg[15:0] a, b;
	reg cin;
	wire[15:0] sum;
	wire c_n, c_n_minus_1;
	
	adder_16 m(sum, c_n, c_n_minus_1, a, b, cin);
	
	initial
	begin
		cin=1;
		a = 2**15 - 1;
		b = 4;
		#10 a=3; b=5;
	end
	
	initial #10.001 $finish;
endmodule

module alu(
		output[15:0] z,
		output c_n, c_n_minus_1,
		input[15:0] x, y,
		input [2:0] fnsel);

	wire [15:0] cmpOut, orOut, andOut, y1, addsubOut;
	
	xor_16_1 xm(y1, y, fnsel[0]);
	adder_16 addm(addsubOut, c_n, c_n_minus_1, x, y1, fnsel[0]);
	
	and_16 andm(andOut, x, y);
	
	or_16 om(orOut, x, y);
	
	cmp_16 cm(cmpOut, x);
	
	mux8_1_16 mm(z, addsubOut, addsubOut, andOut, orOut, 16'bXXXXXXXXXXXXXXXX, cmpOut, x, 16'bXXXXXXXXXXXXXXXX, fnsel);

endmodule

module tb_alu;
	reg[15:0] x, y;
	reg[2:0] fnsel;
	wire [15:0] z;
	wire c_n, c_n_minus_1;
	
	alu m(z, c_n, c_n_minus_1, x, y, fnsel);
	
	initial
	begin
		x = 5; y = 12;
		#10 fnsel = 0;
		#10 fnsel = 2;
		#10 fnsel = 1;
		#10 fnsel = 3;
		#10 fnsel = 0;
		#10 fnsel = 5;
		#10 fnsel = 4;
		#10 fnsel = 6;
		#10 fnsel = 7;
		#10 $finish;
	end
endmodule

module and_16(
		output[15:0] c,
		input [15:0] a, b);
	genvar i;
	generate for(i=0; i <= 15; i=i+1)
	begin:loop
		and(c[i], a[i], b[i]);
	end
	endgenerate

endmodule

module cmp_16(
		output [15:0] o,
		input[15:0] i);
	wire[15:0] t;
	genvar j;
	generate for(j=0; j <= 15; j=j+1)
	begin:loop
		not(t[j], i[j]);
	end
	endgenerate

	//module adder_16 (sum, c_n, c_n_minus_1, a, b, cin);
	adder_16 m(o, cn, cn1, t, 16'b0000000000000000, 1'b1);
endmodule

module tb_cmp_16;
	reg [15:0] i;
	wire [15:0] o;
	
	cmp_16 m(o, i);
	
	initial
	begin
		i=2;
		#10 i = 2**15 -1;
		#10 i = -5;
		#10 i=-2**15;
		#0.001 $finish;
	end
endmodule
/*
module datapath(
		output [6:0] IW2Contr,
		output [15:0] pcOut, z, p2,
		input [31:0] IW,
		input [15:0] memOut,
		input LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst,
		input [1:0] selM1, selM2, selM3, fnSel);*/
module controller(
		input [6:0] IW2Contr,
		input rstIn, clk,
		output LPC,
		output reg rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		output reg [1:0] selM1, selM2, selM3, fnSel);
	
	assign LPC = clk;
	
	always@(IW2Contr or negedge rstIn or posedge clk)
	begin
		if(rstIn == 0)
		begin
			PCrst = 0;
			rd1=0;
			rd2=0;
			wr_contr=0;
			isJumpInstr=0;
			isCallInstr=0;
			Lflag_contr=0;
			selM1=2'b11;
			selM2=2'b11;
			selM3=2'b11;
			fnSel=2'b11;
			rdM=0;
			wrM_contr=0;
		end
		else
		begin
			PCrst = 1;
			if(IW2Contr[6] == 0 && (IW2Contr[5:3] == 3'b000 || IW2Contr[5:3] == 3'b001 || IW2Contr[5:3] == 3'b010 || IW2Contr[5:3] == 3'b011) && IW2Contr[2] == 0) //{add, sub, and, or}i - rd2, wr_contr, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr, REST=disable
			begin
				rd1=0;
				rd2=1;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b10;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
				$display("add, sub, and, or}i - rd2, wr_contr, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr, REST=disable\n");
			end
			
			else if(IW2Contr[6] == 0 && (IW2Contr[5:3] == 3'b000 || IW2Contr[5:3] == 3'b001 || IW2Contr[5:3] == 3'b010 || IW2Contr[5:3] == 3'b011) && IW2Contr[2] == 1) //{add, sub, and, or}r - rd1, rd2, wr_contr, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr
			begin
				rd1=1;
				rd2=1;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b01;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
				$display("add, sub, and, or}r - rd1, rd2, wr_contr, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr");
			end
			
			else if(IW2Contr[6:2] == 5'b01000) //mnsi - rd2, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr
			begin
				rd1=0;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b10;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
				$display("mnsi - rd2, selM1 = 10, selM2 = 01, fnSel = 00, selM3 = 10, Lflag_contr");
			end
			
			else if(IW2Contr[6:2] == 5'b01000) //mnsr - rd1, rd2, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr
			begin
				rd1=1;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b01;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b00;
				rdM=0;
				wrM_contr=0;
				$display("mnsr - rd1, rd2, selM1=01, selM2=01, fnSel=00, selM3=10, Lflag_contr");
			end
			
			else if(IW2Contr[6:3] == 4'b0101) //cmp - rd2, wr_contr, selM2=01, fnSel=01, selM3=10, Lflag_contr
			begin
				rd1=0;
				rd2=1;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=1;
				selM1=2'b11;
				selM2=2'b01;
				selM3=2'b10;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
				$display("cmp - rd2, wr_contr, selM2=01, fnSel=01, selM3=10, Lflag_contr");
			end
			
			else if(IW2Contr[6:4] == 3'b100 && IW2Contr[2:1] == 2'b00) // li - wr_contr, selM2=10, fnSel=01, selM3=10
			begin
				rd1=0;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b10;
				selM3=2'b10;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
				$display("li - wr_contr, selM2=10, fnSel=01, selM3=10");
			end
			
			else if(IW2Contr[6:4] == 3'b100 && IW2Contr[2:1] == 2'b01) //lr - rd1, wr_contr, selM2=00, fnSel=01, selM3=10
			begin
				rd1=1;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b00;
				selM3=2'b10;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
				$display("lr - rd1, wr_contr, selM2=00, fnSel=01, selM3=10");
			end
			
			else if(IW2Contr[6:4] == 3'b100 && IW2Contr[2:1] == 2'b10) //la - rd1, wr_contr, selM1=01, selM2=10, fnSel=10, rdM, selM3=01
			begin
				rd1=1;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b01;
				selM2=2'b10;
				selM3=2'b01;
				fnSel=2'b10;
				rdM=1;
				wrM_contr=0;
				$display("la - rd1, wr_contr, selM1=01, selM2=10, fnSel=10, rdM, selM3=01");
			end
			
			else if(IW2Contr[6:4] == 3'b101) // sta - rd1, rd2, selM1=01, selM2=10, fnSel=10, wrM_contr
			begin
				rd1=1;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b01;
				selM2=2'b10;
				selM3=2'b11;
				fnSel=2'b10;
				rdM=0;
				wrM_contr=1;
				$display(" sta - rd1, rd2, selM1=01, selM2=10, fnSel=10, wrM_contr");
			end
			
			else if(IW2Contr[6:4] == 3'b110) //{j, jz, ..., jnm} - isJumpInstr
			begin
				rd1=0;
				rd2=0;
				wr_contr=0;
				isJumpInstr=1;
				isCallInstr=0;
				Lflag_contr=0;
				selM1=2'b00;//
				selM2=2'b10;//
				selM3=2'b11;
				fnSel=2'b10;//
				rdM=0;
				wrM_contr=0;
				$display("{j, jz, ..., jnm} - isJumpInstr");
			end
			
			else if(IW2Contr[6:3] == 4'b1110) //jal - isCallInstr, wr_contr, selM3=00,  selM1=00, selM2=10, fnSel=10
			begin
				rd1=0;
				rd2=0;
				wr_contr=1;
				isJumpInstr=0;
				isCallInstr=1;
				Lflag_contr=0;
				selM1=2'b00;
				selM2=2'b10;
				selM3=2'b00;
				fnSel=2'b10;
				rdM=0;
				wrM_contr=0;
				$display("jal - isCallInstr, wr_contr, selM3=00,  selM1=00, selM2=10, fnSel=10");
			end
			
			else if(IW2Contr[6:3] == 4'b1111) // jr - isCallInstr, rd2, selM2=01, fnSel=01
			begin
				rd1=0;
				rd2=1;
				wr_contr=0;
				isJumpInstr=0;
				isCallInstr=1;
				Lflag_contr=0;
				selM1=2'b11;
				selM2=2'b01;
				selM3=2'b11;
				fnSel=2'b01;
				rdM=0;
				wrM_contr=0;
				$display("jr - isCallInstr, rd2, selM2=01, fnSel=01");
			end
			
			else
			begin
				$display("UNDEFINED INSTRUCTION");
			end
		end
	end
endmodule

module tb_controller;
/*module controller(
		input [6:0] IW2Contr,
		input rstIn, clk,
		output LPC,
		output reg rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		output reg [1:0] selM1, selM2, selM3, fnSel);*/
		
		reg [6:0] IW2Contr;
		reg rstIn, clk;
		wire LPC;
		wire rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr;
		wire [1:0] selM1, selM2, selM3, fnSel;
		
		controller uut(
		IW2Contr,
		rstIn, clk,
		LPC,
		rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		selM1, selM2, selM3, fnSel);
		
		// Clock generator
		initial
		begin
			clk = 1;
			forever #5 clk = ~clk;
		end
		
		initial
		begin
			rstIn = 0;
			#10; rstIn=1; IW2Contr = 7'b0000000; $display("addi");
			#10; IW2Contr = 7'b0000100; $display("addr");
			#1; $finish;
		end
endmodule

module datapath(
		output [6:0] IW2Contr,
		output [15:0] pcOut, z, p2,
		input [31:0] IW,
		input [15:0] memOut,
		input LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst,
		input [1:0] selM1, selM2, selM3, fnSel);
//IW[31...25]; pcOut, Z, p2
//LPC, rd1, rd2, wr_contr, selM1, selM2, fnsel[1:0], selM3, isJumpInstr, isCallInstr, Lflag_contr;
//IW, memOut

	wire [15:0] pcIn, incPc, p1, Din, x, y;
	wire [2:0] aluSel, aluSel1;
	wire /*PCrst, */wr, mnsSel, Dcondn, c_n, c_n_minus_1, n2, n3, Lflag, andOut, orOut;
	
	// Instruction Word to controller
	assign IW2Contr[6] = IW[31];
	assign IW2Contr[5] = IW[30];
	assign IW2Contr[4] = IW[29];
	assign IW2Contr[3] = IW[28];
	assign IW2Contr[2] = IW[27];
	assign IW2Contr[1] = IW[26];
	assign IW2Contr[0] = IW[25];
	
	// PC stuff
	register_16 pc(pcOut, pcIn, LPC, PCrst);	//LPC = clk
	adder_16 pcAdder(incPc, , , pcOut, 16'b0000000000000001, 0);
	and(andOut, Dcondn, isJumpInstr);
	or(orOut, andOut, isCallInstr);
	mux2_1_16 muxpc(pcIn, incPc, z, orOut);
	
	// Register Bank
	assign wr = wr_contr & (~LPC);	// '.' LPC = clk
	regBank rgbnk(p1, p2, Din, IW[24:22], IW[22:19], IW[22:19], rd1, rd2, wr);
	
	// MUXes		
	mux4_1_16 m1(y, incPc, p1, IW[15:0], , selM1);
	mux4_1_16 m2(x, p1, p2, IW[15:0], , selM2);
	mux4_1_16 m3(Din, incPc, memOut, z, , selM3);
	
	//ALU
	mux4_1_3 muxfnsel(aluSel1, {IW[30], IW[29], IW[28]}, 3'b110, 3'b000, , fnSel);
	not(n2, aluSel1[1]), (n3, aluSel1[0]);
	and(mnsSel, aluSel1[2], n2, n3);
	mux2_1_3 muxmns(aluSel, aluSel1, 3'b001, mnsSel);
	alu aluop(z, c_n, c_n_minus_1, x, y, aluSel);
	assign Lflag = Lflag_contr & (~LPC);
	statusDetectors condflag(Dcondn, z, c_n, c_n_minus_1, Lflag, IW[28:25]);
	
endmodule

module tb_datapath;
//datapath(
//		output [6:0] IW2Contr,
//		output [15:0] pcOut, z, p2,
//		input [31:0] IW,
//		input [15:0] memOut,
//		input LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst
//		input [1:0] selM1, selM2, selM3, fnSel);
	reg [31:0] IW;
	reg [15:0] memOut;
	reg clk, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst;
	reg [1:0] selM1, selM2, selM3, fnSel;
	
	wire [6:0] IW2Contr;
	wire [15:0] pcOut, z, p2;
	//reg clk;
	datapath uut(IW2Contr, pcOut, z, p2, IW, memOut, clk, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, selM1, selM2, selM3, fnSel);
	
	initial
	begin
		PCrst=1;
		#10 PCrst=0; IW=32'b10000000001100000000000000001111;
		wr_contr=1; selM2=2'b10; fnSel = 2'b01; selM3=2'b10;
	end
	
	initial
	begin
		clk=0;
		#10; clk=1;
		#5 clk = ~clk;
		#2; $finish;
	end
endmodule

module decoder3_8(out, sel);


  input [2:0] sel;
  output reg [7:0] out;

  always @(sel,out)
	 case (sel)
		 3'b000  : out = 8'b00000001;
		 3'b001  : out = 8'b00000010;
		 3'b010  : out = 8'b00000100;
		 3'b011  : out = 8'b00001000;
		 3'b100  : out = 8'b00010000;
		 3'b101  : out = 8'b00100000;
		 3'b110  : out = 8'b01000000;
		 3'b111	: out = 8'b10000000;
	 endcase

endmodule

module demux1_8(
		output reg [7:0] o,
		input i,
		input [2:0] sel);
	always @ (i or sel)
//	begin
//		case(sel)
//			0: begin o0 <= 1; o1 <= 0; o2 <= 0; o3 <= 0; o4 <= 0; o5 <= 0; o6 <= 0; o7 <= 0; end
//			1: begin o0 = 0; o1 = 1; o2 = 0; o3 = 0; o4 = 0; o5 = 0; o6 = 0; o7 = 0; end
//			2: begin o0 = 0; o1 = 0; o2 = 1; o3 = 0; o4 = 0; o5 = 0; o6 = 0; o7 = 0; end
//			3: begin o0 = 0; o1 = 0; o2 = 0; o3 = 1; o4 = 0; o5 = 0; o6 = 0; o7 = 0; end
//			4: begin o0 = 0; o1 = 0; o2 = 0; o3 = 0; o4 = 1; o5 = 0; o6 = 0; o7 = 0; end
//			5: begin o0 = 0; o1 = 0; o2 = 0; o3 = 0; o4 = 0; o5 = 1; o6 = 0; o7 = 0; end
//			6: begin o0 = 0; o1 = 0; o2 = 0; o3 = 0; o4 = 0; o5 = 0; o6 = 1; o7 = 0; end
//			7: begin o0 = 0; o1 = 0; o2 = 0; o3 = 0; o4 = 0; o5 = 0; o6 = 0; o7 = 1; end
//		endcase
		case(sel)
			7: o = {i, 7'b0000000};
			6: o = {1'b0, i, 6'b000000};
			5: o = {2'b00, i, 5'b00000};
			4: o = {3'b000, i, 4'b0000};
			3: o = {4'b0000, i, 3'b000};
			2: o = {5'b00000, i, 2'b00};
			1: o = {6'b000000, i, 1'b0};
			0: o = {7'b0000000, i};
			default: o = 8'b00000000;
		endcase
//	end

endmodule

module tb_demux1_8;
	reg [2:0] sel;
	reg i;
	wire [2:0] o;
	
	demux1_8 m(o, i, sel);
	
	initial
	begin
		i=1; sel=3;
		#10 sel=5;
		#10 i=0;
		#10 sel=4;
		#10 sel=7; i=1;
	end
endmodule

module dff(
		output reg q, nq,
		input d,
		input ld, rst);
	//reg q, nq;
	always @ (posedge ld or negedge rst)
	begin
		if(rst == 0)
			q <= 0;
		else
			begin
				q <= d;
				nq <= ~d;
			end
	end

	//assign nq <= q;
endmodule

module tb_dff;
	reg d;
	reg ld, rst;
	wire q, nq;
	
	dff m(q, nq, d, ld, rst);
	
	initial
	begin
		rst=0; d=1;
		#10 ld=1;
		#10 rst=1;
		#10 ld=0;
		#10 ld=1;
		#10 d=0;
		#10 ld=0;
		#10 ld=1;
		#10 ld=0; rst=0;
	end
endmodule

module Dmem(
		output reg [15:0] memOut,
		input [15:0] Addr, memIn,
		input rdM, wrM_contr, clk);
	wire wrM;
	reg [15:0] M[0:65/*535*/];
	
	assign wrM = wrM_contr && (~clk);
	
	always@(posedge rdM or posedge wrM)
	begin
		if(rdM == 1)
			memOut <= M[Addr];
		else if (wrM == 1)
			M[Addr] <= memIn;
	end

endmodule
module Imem(
		output [31:0] IW,
		input[15:0] pcOut);
	
	reg [31:0] M[0:65/*535*/];
	
	assign IW = M[pcOut];
	initial
	begin
		M[0] = 32'b10000000001010000000000000110010;
		M[1] = 32'b10000101011100000000000000000000;
		M[2] = 32'b00000000001010000000000001100100;
		M[3] = 32'b10101001101010000000000000000001;
		M[4] = 32'b10001001101110000000000000000001;
		M[5] = 32'b11010010000000000000000000010100;
		//M[26] = 32'b01010000001110000000000000000000;
		M[26] = 32'b00000000001110000000000001100100;
	end
endmodule

module mux2_1_16(
		output reg [15:0] o,
		input [15:0] i0, i1,
		input sel);
//	not(nsel, sel);
//	and(t1, i0, nsel), (t2, i1, sel);
//	or(o, t1, t2);
	always @(sel, i0, i1)
	case(sel)
		0: o = i0;
		1: o = i1;
	endcase
endmodule

module tb_mux2_1_16;
	reg [15:0] i0, i1;
	reg sel;
	wire [15:0] o;
	
	mux2_1_16 m(o, i0, i1, sel);
	
	initial
	begin
		i0=30; i1=17;
		#10 sel=0;
		#10 sel=1;
		#10 sel=1;
		#10 sel=0;
		#10 sel=0;
		#10 sel=1;
	end
endmodule

module mux2_1_3(
		output reg [2:0] o,
		input [2:0] i0, i1,
		input sel);
//	not(nsel, sel);
//	and(t1, i0, nsel), (t2, i1, sel);
//	or(o, t1, t2);
	always @(sel, i0, i1)
	case(sel)
		0: o = i0;
		1: o = i1;
	endcase
endmodule

module tb_mux2_1_3;
	reg [2:0] i0, i1;
	reg sel;
	wire [2:0] o;
	
	mux2_1_3 m(o, i0, i1, sel);
	
	initial
	begin
		i0=0; i1=1;
		#10 sel=0;
		#10 sel=1;
		#10 sel=1;
		#10 sel=0;
		#10 sel=0;
		#10 sel=1;
	end
endmodule

module mux4_1_16(
		output reg [15:0] o,
		input [15:0] i0, i1, i2, i3,
		input [1:0] sel);
//	not(nsel, sel);
//	and(t1, i0, nsel), (t2, i1, sel);
//	or(o, t1, t2);
	always @(sel, i0, i1, i2, i3)
	case(sel)
		2'b00: o = i0;
		2'b01: o = i1;
		2'b10: o = i2;
		2'b11: o = i3;
	endcase
endmodule

module tb_mux4_1_16;
	reg [15:0] i0, i1, i2, i3;
	reg [1:0] sel;
	wire [15:0] o;
	
	mux4_1_16 m(o, i0, i1, i2, i3, sel);
	
	initial
	begin
		i0=0; i1=1; i2 = 2; i3 = 3;
		#10 sel=0;
		#10 sel=1;
		#10 sel=2'b10;
		#10 sel=0;
		#10 sel=3;
		#10 sel=1;
	end
endmodule

module mux4_1_3(
		output reg [2:0] o,
		input [2:0] i0, i1, i2, i3,
		input [1:0] sel);
//	not(nsel, sel);
//	and(t1, i0, nsel), (t2, i1, sel);
//	or(o, t1, t2);
	always @(sel, i0, i1, i2, i3)
	case(sel)
		2'b00: o = i0;
		2'b01: o = i1;
		2'b10: o = i2;
		2'b11: o = i3;
	endcase
endmodule

module tb_mux4_1_3;
	reg [2:0] i0, i1, i2, i3;
	reg [1:0] sel;
	wire [2:0] o;
	
	mux4_1_3 m(o, i0, i1, i2, i3, sel);
	
	initial
	begin
		i0=0; i1=1; i2 = 2; i3 = 3;
		#10 sel=0;
		#10 sel=1;
		#10 sel=2'b10;
		#10 sel=0;
		#10 sel=3;
		#10 sel=1;
	end
endmodule

module mux8_1_16(
		output reg [15:0] o,
		input[15:0] i0, i1, i2, i3, i4, i5, i6, i7,
		input[2:0] sel);
	//reg[15:0] o;
	
	always @ (i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or sel)
	case(sel)
		0: o= i0;
		1: o= i1;
		2: o= i2;
		3: o= i3;
		4: o= i4;
		5: o= i5;
		6: o= i6;
		7: o= i7;
	endcase

endmodule

module tb_mux8_1_16;
	reg[15:0] i0, i1, i2, i3, i4, i5, i6, i7;
	reg[2:0] sel;
	wire[15:0] o;
	
	mux8_1_16 m(o, i0, i1, i2, i3, i4, i5, i6, i7, sel);
	
	initial
	begin
		i0=0; i1=1; i2=2; i3=3; i4=4; i5 = 5; i6=6; i7=7;
		#10 sel=0;
		#10 sel=1;
		#10 sel=2;
		#10 sel=3;
		#10 sel=4;
		#10 sel=5;
		#10 sel=6;
		#10 sel=7;
		#10 sel=6;
		#10 sel=1;
	end
endmodule
module muxDcondn(
		output reg Dcondn,
		input iu, iz, inz, ic, inc, iv, inv, is, ins,
		input[3:0] IR12_9);
	//reg[15:0] o;
	
	always @ (iu, iz, inz, ic, inc, iv, inv, is, ins, IR12_9)
	case(IR12_9)
		4'b0000: begin Dcondn= iu; /*$display("Dcondn = iu\n");*/ end
		4'b1000: begin Dcondn= iz; /*$display("Dcondn = iz\n");*/ end
		4'b1001: begin Dcondn= inz; /*$display("Dcondn = inz\n");*/ end
		4'b1010: begin Dcondn= ic; /*$display("Dcondn = ic\n");*/ end
		4'b1011: begin Dcondn= inc; /*$display("Dcondn = inc\n");*/ end
		4'b1100: begin Dcondn= iv; /*$display("Dcondn = iv\n");*/ end
		4'b1101: begin Dcondn= inv; /*$display("Dcondn = inv\n");*/ end
		4'b1110: begin Dcondn= is; /*$display("Dcondn = is\n");*/ end
		4'b1111: begin Dcondn= ins; /*$display("Dcondn = ins\n");*/ end
	endcase

endmodule

module tb_muxDcondn;
	reg i0, i1, i2, i3, i4, i5, i6, i7, i8;
	reg[3:0] sel;
	wire o;
	
	muxDcondn m(o, i0, i1, i2, i3, i4, i5, i6, i7, i8, sel);
	
	initial
	begin
		i0=1;
		i1=1;
		i2=1;
		i3=1;
		i4=1;
		i5=1;
		i6=1;
		i7=1;
		i8=1;
		// i2=2; i3=3; i4=4; i5 = 5; i6=6; i7=7; i8
		//#10 sel=4'b0XXX;
		#10 sel=4'b1011;
		#10 sel=4'b1000;
		#10 sel=4'b1110;
		#10 sel=4'b1010;
		#10 sel=4'b1001;
		#10 sel=4'b0000;
		#10 sel=4'b1100;
		//#10 sel=4'b0111;
		#10 sel=4'b1101;
		#10 sel=4'b1111;
		//#10 sel=4'b0X1X;
		#10 sel=4'b1101;
		#10 sel=4'b1110;
	end
endmodule

module or_16(
		output[15:0] c,
		input [15:0] a, b);
	genvar i;
	generate for(i=0; i <= 15; i=i+1)
	begin:loop
		or(c[i], a[i], b[i]);
	end
	endgenerate

endmodule

module regBank(
		output [15:0] p1, p2,
		input [15:0] Din,
		input [2:0] rpa1, rpa2, wpa,
		input rd1, rd2, wr);
	wire[15:0] q0, q1, q2 ,q3 ,q4 ,q5 ,q6 ,q7;
	wire[7:0] wpaOut, t, u;
	decoder3_8 decm(wpaOut, wpa);
	
	and(ld0, wr, wpaOut[0]);
	and(ld1, wr, wpaOut[1]);
	and(ld2, wr, wpaOut[2]);
	and(ld3, wr, wpaOut[3]);
	and(ld4, wr, wpaOut[4]);
	and(ld5, wr, wpaOut[5]);
	and(ld6, wr, wpaOut[6]);
	and(ld7, wr, wpaOut[7]);
	
	register_16 r0(q0, Din, ld0, rst),
					r1(q1, Din, ld1, rst),
					r2(q2, Din, ld2, rst),
					r3(q3, Din, ld3, rst),
					r4(q4, Din, ld4, rst),
					r5(q5, Din, ld5, rst),
					r6(q6, Din, ld6, rst),
					r7(q7, Din, ld7, rst);
	
	demux1_8 dmm1(t, rd1, rpa1);
	
	triStateBuffer tsbt0(p1, q0, t[0]),
						tsbt1(p1, q1, t[1]),
						tsbt2(p1, q2, t[2]),
						tsbt3(p1, q3, t[3]),
						tsbt4(p1, q4, t[4]),
						tsbt5(p1, q5, t[5]),
						tsbt6(p1, q6, t[6]),
						tsbt7(p1, q7, t[7]);

	demux1_8 dmm2(u, rd2, rpa2);
	
	triStateBuffer tsbu0(p2, q0, u[0]),
						tsbu1(p2, q1, u[1]),
						tsbu2(p2, q2, u[2]),
						tsbu3(p2, q3, u[3]),
						tsbu4(p2, q4, u[4]),
						tsbu5(p2, q5, u[5]),
						tsbu6(p2, q6, u[6]),
						tsbu7(p2, q7, u[7]);

endmodule
module register_16(
		output reg[15:0] q,
		input[15:0] d,
		input ld, rst);
	//reg[15:0] q;
	always @ (posedge ld or negedge rst)
	begin
		if(rst == 0)
			q <= 0;
		else
			q <= d;
	end

endmodule

module tb_register_16;
	reg [15:0] d;
	reg ld, rst;
	wire[15:0] q;
	
	register_16 m(q, d, ld, rst);
	
	initial
	begin
		rst=0; d=5;
		#10 ld=1;
		#10 rst=1;
		#10 ld=0;
		#10 ld=1;
		#10 d=3101;
		#10 ld=0;
		#10 ld=1;
		#10 ld=0; rst=0;
	end
endmodule
/*
module statusDetectors(
		output Zout, nZout, Cout, nCout, Vout, nVout, Sout, nSout,
		input [15:0] z,
		input c_n, c_n_minus_1, Lflag);
	//buf(Cin, c_n);
	
	// assign statement is allowed in Structural coding !!! :)
	assign Cin = c_n;
	
	xor(Vin, c_n, c_n_minus_1);
	
	assign Sin = z[15];
	
	nor(Zin, z[0], z[1], z[2], z[3], z[4], z[5], z[6], z[7], z[8], z[9], z[10], z[11], z[12], z[13], z[14], z[15]);

	dff m1(Zout, nZout, Zin, Lflag, rst),
		 m2(Cout, nCout, Cin, Lflag, rst),
		 m3(Vout, nVout, Vin, Lflag, rst),
		 m4(Sout, nSout, Sin, Lflag, rst);
endmodule*/

module statusDetectors(
		output Dcondn,
		input [15:0] z,
		input c_n, c_n_minus_1, Lflag,
		input [3:0] IR12_9);
	//buf(Cin, c_n);
	
	// assign statement is allowed in Structural coding !!! :)
	assign Cin = c_n;
	
	xor(Vin, c_n, c_n_minus_1);
	
	assign Sin = z[15];
	
	nor(Zin, z[0], z[1], z[2], z[3], z[4], z[5], z[6], z[7], z[8], z[9], z[10], z[11], z[12], z[13], z[14], z[15]);

	dff m1(Zout, nZout, Zin, Lflag, rst),
		 m2(Cout, nCout, Cin, Lflag, rst),
		 m3(Vout, nVout, Vin, Lflag, rst),
		 m4(Sout, nSout, Sin, Lflag, rst);

	muxDcondn DCon(Dcondn, 1'b1, Zout, nZout, Cout, nCout, Vout, nVout, Sout, nSout, IR12_9);
endmodule

/*module datapath(
		output [6:0] IW2Contr,
		output [15:0] pcOut, z, p2,
		input [31:0] IW,
		input [15:0] memOut,
		input LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst,
		input [1:0] selM1, selM2, selM3, fnSel);*/

/*module controller(
		input [6:0] IW2Contr,
		input rstIn, clk,
		output LPC,
		output reg rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr,
		output reg [1:0] selM1, selM2, selM3, fnSel);*/
		
/*module Imem(
		output [31:0] IW,
		input[15:0] pcOut);*/

/*module Dmem(
		output reg [15:0] memOut,
		input [15:0] Addr (z), memIn (p2),
		input rdM, wrM_contr, clk);*/
module topModule(
		input clk, rstIn);
		
	wire LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr;
	wire [1:0] selM1, selM2, selM3, fnSel;
	wire [6:0] IW2Contr;
	wire [15:0] pcOut, z, p2, memOut;
	wire [31:0] IW;
	
	datapath dp(IW2Contr, pcOut, z, p2, IW, memOut, LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, selM1, selM2, selM3, fnSel);
	controller con(IW2Contr, rstIn, clk, LPC, rd1, rd2, wr_contr, isJumpInstr, isCallInstr, Lflag_contr, PCrst, rdM, wrM_contr, selM1, selM2, selM3, fnSel);
	Imem imemM(IW, pcOut);
	Dmem dmemM(memOut, z, p2, rdM, wrM_contr, clk);
endmodule

module tb_topModule;
	reg clk, rstIn;
	
	topModule uut(clk, rstIn);
	
	// Clock generator
	initial
	begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	initial
	begin
			rstIn = 0;
		#5; rstIn = 1;
	end
endmodule

module triStateBuffer(
		output [15:0] b,
		input[15:0] a,
		input enable);
	assign b = (enable) ? a : 16'bzzzzzzzzzzzzzzzz;
	/*always@(a or enable)
		begin
			if(enable)
				b=a;
			else
				b=16'bz;
		end*/
	// STRUCTURAL- DOES NOT WORK !!!
	/*not(nen, enable);
	wire [15:0] t1, t2;
	genvar i;
	generate for(i=0; i <= 15; i = i+1)
	begin:loop
		//and(t1[i], enable, a[i]), (t2[i], nen, 1'bZ);
		//or(b[i], t1[i], t2[i]);
		mux2_1 m(b[i], 1'bZ, a[i], enable);
	end
	endgenerate*/
endmodule

module tb_triStateBuffer;
	reg [15:0] a;
	reg en;
	wire [15:0] b;
	
	triStateBuffer m(b, a, en);
	
	initial
	begin
		a = 30;
		#10 en=0;
		#10 en=1;
		#10 a=2;
		#10 a=5; en=0;
		#10 a=10; en=1;
	end
endmodule

module xor_16_1(
		output[15:0] c,
		input [15:0] a,
		input b);
	genvar i;
	generate for(i=0; i <= 15; i=i+1)
	begin:loop
		xor(c[i], a[i], b);
	end
	endgenerate

endmodule