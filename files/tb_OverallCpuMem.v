`timescale 100ps / 1ps

module topOverall_CPUmem(
		input clk, rstIn);// clk, rstIn
	 
	 wire Dcondn, rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, rdM, wrM, PCrst, mfc;
	 wire [6:0] irContr;
	 wire [15:0] Abus, Dbus;
	 wire [1:0] fnSel, selreg;
	 
	datapath dpO(Dcondn, irContr, Abus, Dbus, rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, PCrst, fnSel, selreg);
	controller contrO(rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, rdM, wrM, PCrst, fnSel, selreg, Dcondn, clk, rstIn, mfc, irContr);
	memoryModule memO(Abus, Dbus, rdM, wrM, mfc);

endmodule

module tb_topOverall_CPUmem;
	reg clk,rstIn;
	
	topOverall_CPUmem uutO(clk, rstIn);
	
	// Clock generator
	initial
	begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	//Stimulus generator
	initial
	begin
		rstIn = 0;
		#5; rstIn = 1;
	end
endmodule
module memoryModule(
		//input [15:0] M[2^16-1:0],
		input [15:0] Abus,
		inout [15:0] Dbus,
		input rdM, wrM,
		output reg mfc);
//	reg [15:0] M[2^16-1:0];
	reg [15:0] M[0:65535];
	
	//Filling the instructions into memory
	initial
	begin
		M[0] = 16'b1000000110001111;
		M[1] = 16'b0000000111110100;
		M[2] = 16'b1001011111010101;
		M[3] = 16'b0000000000000000;
		M[4] = 16'b1000010111101110;
		M[5] = 16'b0000000000000001;
		M[6] = 16'b0000001110000101;
		M[7] = 16'b1010010111101110;
		M[8] = 16'b0000000000001010;
		M[9] = 16'b0100100111110101;
		M[10] = 16'b1111111111111000;
		M[11] = 16'b1101001101010101;
		M[12] = 16'b0000000001011000;
		M[100] = 16'b1001000111000001;
		M[101] = 16'b0000000001111001;
		M[499] = 16'b0000001000001000;
		M[500] = 16'b0000000000001111;
		M[516] = 16'b0000000000000111;
		M[520] = 16'b0000000000001010;
	end
	
	reg [15:0] DbusReg;
	assign Dbus = (rdM) ? DbusReg : 16'bzzzzzzzzzzzzzzzz;
		
	always@(posedge rdM or posedge wrM)
	begin
		if(rdM == 1) begin
			DbusReg = M[Abus];
		end
		
		else if(wrM == 1) begin
			//M[Abus] = Dbus;
			#(1*0.01); 
			M[Abus] = Dbus;
		end
		
	end
	
	always @ (posedge rdM or posedge wrM)
	begin
		mfc = 0;
		#21;
		mfc = 1;
	end
endmodule

module controller(
		output reg rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, rdM, wrM, PCrst,
		// as usual PCrst (to reset only the PC register in the datapath) is active low signal
		////PCrst was previously active high signal
		output reg [1:0] fnSel, selreg,
		input Dcondn, clk, rstIn, mfc, //rstIn is also active low
		input [6:0] irContr);

	parameter f0=0,
		  f1 =1,
		  f2 =2,
		  f3 =3,
		  f4 =4,
		  
		  ai1=5,
		  ai2=6,
		  ai3=7,
		  ai4=8,
		  ai5=9,
		  ai6=10,
		  
		  mi6=11,
		  
		  ar1=12,
		  ar2=13,
		  
		  mr2=14,
		  
		  ax1=15,
		  ax2=16,
		  ax3=17,
		  ax4=18,
		  ax5=19,
		  ax6=20,
		  ax7=21,
		  ax8=22,
		  ax9=23,
		  ax10=24,
		  ax11=25,
		  ax12=26,
		  
		  mx12=27,
		  
		  aa1=28,
		  aa2=29,
		  aa3=30,
		  aa4=31,
		  aa5=32,
		  aa6=33,
		  aa7=34,
		  aa8=35,
		  aa9=36,
		  aa10=37,
		  
		  ma10=38,
		  
		  an1=39,
		  an2=40,
		  an3=41,
		  an4=42,
		  an5=43,
		  an6=44,
		  an7=45,
		  an8=46,
		  an9=47,
		  an10=48,
		  an11=49,
		  an12=50,
		  an13=51,
		  an14=52,
		  an15=53,
		  
		  mn15=54,
		  
		  cmpState=55,
		  
		  li5 = 56,
		  lr1 = 57,
		  lx11 = 58,
		  la9 = 59,
		  ln14 = 60,
		  
		  sx8 = 61,
		  sx9 = 62,
		  sx10 = 63,
		  
		  sa6 = 64,
		  sa7 = 65,
		  sa8 = 66,
		  
		  sn12 = 67,
		  sn13 = 68,
		  sn14 = 69,
		  
		  j1 = 70,
		  j2 = 71,
		  j3 = 72,
		  j4 = 73,
		  j5 = 74,
		  
		  jal1 = 75,
		  jal2 = 76,
		  jal3 = 77,
		  jal4 = 78,
		  jal5 = 79,
		  jal6 = 80,
		  jal7 = 81,
		  
		  jrState = 82;
		  
   	reg [6:0] state, next_state; //82+1 (=83) states
   	
	always @ (posedge clk or negedge rstIn)
	begin
		if(rstIn==0) state <= f0;
		else state <= next_state;
	end
	
	// State transitions (for next state)
	always @ (state, irContr, Dcondn, mfc)
	begin
		next_state = state;
		case(state)
		f0:	next_state = f1;
		f1:	next_state = f2;
		f2:	if(mfc == 0) next_state = f2;
				else next_state = f3;
		f3:	next_state = f4;
		f4: 	if((irContr[6] == 0 | irContr[6:4] == 3'b100) && irContr[2:0] == 3'b000 && irContr[6:3] != 4'b0101) //{add,sub,and,or,mns,ld}i
					next_state = ai1;
				else if(irContr[6] == 0 && irContr[2:0] == 001 && irContr[6:3] != 4'b0101) //{add,sub,and,or,mns}r
					next_state = ar1;
				else if(irContr[6:4] == 3'b100 && irContr[2:0] == 001) //ldr
					next_state = lr1;
				else if((irContr[6] == 0 | irContr[6:5] == 2'b10) && irContr[2:0] == 3'b010 && irContr[6:3] != 4'b0101) //{add,sub,and,or,mns,ld,st}x
					next_state = ax1;
				else if((irContr[6] == 0 | irContr[6:5] == 2'b10) && irContr[2:0] == 3'b011 && irContr[6:3] != 4'b0101) //{add,sub,and,or,mns,ld,st}a
					next_state = aa1;
				else if((irContr[6] == 0 | irContr[6:5] == 2'b10) && irContr[2:0] == 3'b100 && irContr[6:3] != 4'b0101) //{add,sub,and,or,mns,ld,st}n
					next_state = an1;
				else if(irContr[6:3] == 4'b0101) //cmp
					next_state = cmpState;
				else if(irContr[6:4] == 3'b110) //j{_,z,nz,c,nc,v,nv,m,nm}
					next_state = j1;
				else if(irContr[6:3] == 4'b1110) //jal
					next_state = jal1;
				else if(irContr[6:3] == 4'b1111) //jr
					next_state = jrState;
				else
					$display("UNDEFINED INSTRUCTION ! (Execution of all the instrucions completed).");
		ai1:	next_state = ai2;
		ai2:	if(mfc == 0) next_state = ai2;
				else next_state = ai3;
		ai3:	next_state = ai4;
		ai4:	if(irContr[6:4] == 3'b100) next_state = li5;
				else next_state = ai5;
		ai5:	if(4'b0100 == irContr[6:3]) next_state = mi6;
				else next_state = ai6;
		ai6:	next_state = f1;
		mi6:	next_state = f1;
		ar1:	if(4'b0100 == irContr[6:3]) next_state = mr2;
				else next_state = ar2;
		ar2:	next_state = f1;
		mr2:	next_state = f1;
		ax1:	next_state = ax2;
		ax2:	if(mfc == 0) next_state = ax2;
				else next_state = ax3;
		ax3:	next_state = ax4;
		ax4:	next_state = ax5;
		ax5:	next_state = ax6;
		ax6:	next_state = ax7;
		ax7:	if(3'b101 == irContr[6:4]) next_state = sx8;
				else next_state = ax8;
		ax8: next_state = ax9;
		ax9:	if(mfc == 0) next_state = ax9;
				else next_state = ax10;
		ax10: if(3'b100 == irContr[6:4]) next_state = lx11;
				else next_state = ax11;
		ax11: if(4'b0100 == irContr[6:3]) next_state = mx12;
				else next_state = ax12;
		ax12: next_state = f1;
		mx12: next_state = f1;
		aa1:	next_state = aa2;
		aa2:	if(mfc == 0) next_state = aa2;
				else next_state = aa3;
		aa3:	next_state = aa4;
		aa4:	next_state = aa5;
		aa5:	if(3'b101 == irContr[6:4]) next_state = sa6;
				else next_state = aa6;
		aa6:	next_state = aa7;
		aa7:	if(mfc == 0) next_state = aa7;
				else next_state = aa8;
		aa8:	if(3'b100 == irContr[6:4]) next_state = la9;
				else next_state = aa9;
		aa9:	if(4'b0100 == irContr[6:3]) next_state = ma10;
				else next_state = aa10;
		aa10:	next_state = f1;
		ma10:	next_state = f1;
		an1:	next_state = an2;
		an2:	if(mfc == 0) next_state = an2;
				else next_state = an3;
		an3:	next_state = an4;
		an4:	next_state = an5;
		an5:	next_state = an6;
		an6:	next_state = an7;
		an7:	next_state = an8;
		an8:	next_state = an9;
		an9:	if(mfc == 0) next_state = an9;
				else next_state = an10;
		an10:	next_state = an11;
		an11:	if(3'b101 == irContr[6:4]) next_state = sn12;
				else next_state = an12;
		an12:	if(mfc == 0) next_state = an12;
				else next_state = an13;
		an13:	if(3'b100 == irContr[6:4]) next_state = ln14;
				else next_state = an14;
		an14:	if(4'b0100 == irContr[6:3]) next_state = mn15;
				else next_state = an15;
		an15:	next_state = f1;
		mn15:	next_state = f1;
		cmpState:	next_state = f1;
		li5:	next_state = f1;
		lr1:	next_state = f1;
		lx11:	next_state = f1;
		la9:	next_state = f1;
		ln14:	next_state = f1;
		sx8:	next_state = sx9;
		sx9:	next_state = sx10;
		sx10:	if(mfc == 0) next_state = sx10;
				else next_state = f1;
		sa6:	next_state = sa7;
		sa7:	next_state = sa8;
		sa8:	if(mfc == 0) next_state = sa8;
				else next_state = f1;
		sn12:	next_state = sn13;
		sn13:	next_state = sn14;
		sn14:	if(mfc == 0) next_state = sn14;
				else next_state = f1;
		j1:	next_state = j2;
		j2:	if(mfc == 0) next_state = j2;
				else next_state = j3;
		j3:	next_state = j4;
		j4:	if(Dcondn) next_state = j5;
				else next_state = f1;
		j5:	next_state = f1;
		jal1:	next_state = jal2;
		jal2:	next_state = jal3;
		jal3:	next_state = jal4;
		jal4:	if(mfc == 0) next_state = jal4;
				else next_state = jal5;
		jal5:	next_state = jal6;
		jal6:	next_state = jal7;
		jal7:	next_state = f1;
		jrState:	next_state = f1;
		default: $display("UNDEFINED STATE !!! No state transition possible.- %0d", $time);
		endcase
	end
	
	// For output signals
	always @ (state)
	begin
		rd = 0; wr = 0; LPC = 0; TPC = 0; LT = 0; TT = 0; LMAR = 0; TMAR = 0; LIR = 0; RMDRExt = 0; RMDRInt = 0; TMDR2X = 0; TMDR2Ext = 0; TMDR2IR = 0; LMDR = 0; LregY = 0; T1 = 0; Lflag = 0; rdM = 0; wrM = 0; PCrst = 1;
		fnSel = 2'b11; selreg = 2'b11; //for don't care cases
		case(state)
		f0:	begin #1; PCrst <= 0; $display("State= %d, %b- %0d(x100ps):- PCrst <= 0;", state, irContr, $time); end
		f1:	begin TPC <= 1; fnSel <= 2'b01; LMAR <= 0; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("\n\nState= %d, %b- %0d(x100ps):- TPC <= 1; fnSel <= 2'b01; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, irContr, $time); #5; LMAR <= 1; end
		f2:	begin TMAR <= 1; rdM <= 1; $display("State= %d, %b- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, irContr, $time); end
		f3:	begin TMAR <= 1; rdM <= 1; LIR <= 0;/*always@ begin (clk) LIR <= ~clk; end*/ /*LIR <= ~clk;*/ T1 <= 1; LregY <= 0;/*LregY <= ~clk;*/ $display("State= %d, %b- %0d(x100ps):- TMAR <= 1; rdM <= 1; LIR <= ~clk; T1 <= 1; LregY <= ~clk;", state, irContr, $time); #5; LIR <= 1; LregY <= 1; end
		f4:	begin TPC <= 1; fnSel <= 2'b10; /*LPC = ~clk;*/ $display("State= %d, %b- %0d(x100ps):- TPC <= 1; fnSel <= 2'b10; LPC <= ~clk;", state, irContr, $time); #5; LPC <= 1; end
		ai1:	begin TPC <= 1; fnSel <= 2'b01; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2'b01; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		ai2:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		ai3:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ T1 <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk; T1 <= 1; LregY <= ~clk;", state, $time); #5; LMDR <= 1; LregY <= 1;end
		ai4:	begin TPC <= 1; fnSel <= 2'b10; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2'b10; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		ai5:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		ai6:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*wr <= ~clk;*/ /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; wr <= ~clk; Lflag <= ~clk;", state, $time); #5; wr <= 1; Lflag <= 1; end
		mi6:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; Lflag <= ~clk;", state, $time); #5; Lflag <= 1; end
		ar1:	begin rd <= 1; selreg <= 0; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 0; LregY <= ~clk;", state, $time); #5; LregY <= 1; #5; LregY <= 1; end
		ar2:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*wr <= ~clk;*/ /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; wr <= ~clk; Lflag <= ~clk;", state, $time); #5; wr <= 1; Lflag <= 1; end
		mr2:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; Lflag <= ~clk;", state, $time); #5; Lflag <= 1; end
		ax1:	begin TPC <= 1; fnSel <= 1; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 1; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		ax2:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		ax3:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ T1 <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk; T1 <= 1; LregY <= ~clk;", state, $time); #5; LMDR <= 1; LregY <= 1; end
		ax4:	begin TPC <= 1; fnSel <= 2; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		ax5:	begin rd <= 1; selreg <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		ax6:	begin rd <= 1; selreg <= 0; fnSel <= 2; /*LT <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 0; fnSel <= 2; LT <= ~clk;", state, $time); #5; LT <= 1; end
		ax7:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		ax8:	begin TT <= 1; fnSel <= 2; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TT <= 1; fnSel <= 2; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		ax9:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		ax10:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		ax11:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		ax12:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*wr <= ~clk;*/ /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; wr <= ~clk; Lflag <= ~clk;", state, $time); #5; wr <= 1; Lflag <= 1; end
		mx12:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; Lflag <= ~clk;", state, $time); #5; Lflag <= 1; end
		aa1:	begin TPC <= 1; fnSel <= 1; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 1; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		aa2:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		aa3:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ T1 <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk; T1 <= 1; LregY <= ~clk;", state, $time); #5; LMDR <= 1; LregY <= 1; end
		aa4:	begin TPC <= 1; fnSel <= 2; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		aa5:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		aa6:	begin rd <= 1; selreg <= 0; fnSel <= 2; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 0; fnSel <= 2; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		aa7:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		aa8:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		aa9:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		aa10:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*wr <= ~clk;*/ /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; wr <= ~clk; Lflag <= ~clk;", state, $time); #5; wr <= 1; Lflag <= 1; end
		ma10:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; Lflag <= ~clk;", state, $time); #5; Lflag <= 1; end
		an1:	begin TPC <= 1; fnSel <= 1; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 1; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		an2:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		an3:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ T1 <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk; T1 <= 1; LregY <= ~clk;", state, $time); #5; LMDR <= 1; LregY <= 1; end
		an4:	begin TPC <= 1; fnSel <= 2; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		an5:	begin rd <= 1; selreg <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		an6:	begin rd <= 1; selreg <= 0; fnSel <= 2; /*LT <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 0; fnSel <= 2; LT <= ~clk;", state, $time); #5; LT <= 1; end
		an7:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		an8:	begin TT <= 1; fnSel <= 2; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TT <= 1; fnSel <= 2; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		an9:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		an10:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		an11:	begin TMDR2X <= 1; fnSel <= 1; /*LMAR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; fnSel <= 1; LMAR <= ~clk;", state, $time); #5; LMAR <= 1; end
		an12:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		an13:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		an14:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		an15:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*wr <= ~clk;*/ /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; wr <= ~clk; Lflag <= ~clk;", state, $time); #5; wr <= 1; Lflag <= 1; end
		mn15:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; Lflag <= ~clk;", state, $time); #5; Lflag <= 1; end
		cmpState:	begin rd <= 1; selreg <= 2; fnSel <= 0; /*wr <= ~clk;*/ /*Lflag <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 0; wr <= ~clk; Lflag <= ~clk;", state, $time); #5; wr <= 1; Lflag <= 1; end
		li5:	begin TMDR2X <= 1; fnSel <= 1; /*wr <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; fnSel <= 1; wr <= ~clk;", state, $time); #5; wr <= 1; end
		lr1:	begin rd <= 1; selreg <= 0; fnSel <= 1; /*wr <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 0; fnSel <= 1; wr <= ~clk;", state, $time); #5; wr <= 1; end
		lx11:	begin TMDR2X <= 1; fnSel <= 1; /*wr <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; fnSel <= 1; wr <= ~clk;", state, $time); #5; wr <= 1; end
		la9:	begin TMDR2X <= 1; fnSel <= 1; /*wr <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; fnSel <= 1; wr <= ~clk;", state, $time); #5; wr <= 1; end
		ln14:	begin TMDR2X <= 1; fnSel <= 1; /*wr <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; fnSel <= 1; wr <= ~clk;", state, $time); #5; wr <= 1; end
		sx8:	begin rd <= 1; selreg <= 2; fnSel <= 1; RMDRInt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 1; RMDRInt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		sx9:	begin TT <= 1; fnSel <= 2; /*LMAR <= ~clk;*/ TMAR <= 1; TMDR2Ext <= 1; /*wrM <= 1;*/ $display("State= %d- %0d(x100ps):- TT <= 1; fnSel <= 2; LMAR <= ~clk; TMAR <= 1; TMDR2Ext <= 1; wrM <= 1;", state, $time); #5; LMAR <= 1; /*TMDR2Ext <= 1;*/end
		sx10:	begin TMAR <= 1; TMDR2Ext <= 1; wrM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; TMDR2Ext <= 1; wrM <= 1;", state, $time); end
		sa6:	begin rd <= 1; selreg <= 2; fnSel <= 1; RMDRInt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 1; RMDRInt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		sa7:	begin rd <= 1; selreg <= 0; fnSel <= 2; /*LMAR <= ~clk;*/ TMAR <= 1; TMDR2Ext <= 1; /*wrM <= 1;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 0; fnSel <= 2; LMAR <= ~clk; TMAR <= 1; TMDR2Ext <= 1; wrM <= 1;", state, $time); #5; LMAR <= 1; end
		sa8:	begin TMAR <= 1; TMDR2Ext <= 1; wrM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; TMDR2Ext <= 1; wrM <= 1;", state, $time); end
		sn12:	begin rd <= 1; selreg <= 2; fnSel <= 1; RMDRInt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 1; RMDRInt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		sn13:	begin TMAR <= 1; TMDR2Ext <= 1; wrM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; TMDR2Ext <= 1; wrM <= 1;", state, $time); end
		sn14:	begin TMAR <= 1; TMDR2Ext <= 1; wrM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; TMDR2Ext <= 1; wrM <= 1;", state, $time); end
		j1:	begin TPC <= 1; fnSel <= 1; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 1; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		j2:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		j3:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		j4:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		j5:	begin TPC <= 1; fnSel <= 2; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		jal1:	begin T1 <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- T1 <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		jal2:	begin TPC <= 1; fnSel <= 2; /*wr <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2; wr <= ~clk;", state, $time); #5; wr <= 1; end
		jal3:	begin TPC <= 1; fnSel <= 1; /*LMAR <= ~clk;*/ TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 1; LMAR <= ~clk; TMAR <= 1; rdM <= 1;", state, $time); #5; LMAR <= 1; end
		jal4:	begin TMAR <= 1; rdM <= 1; $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1;", state, $time); end
		jal5:	begin TMAR <= 1; rdM <= 1; RMDRExt <= 1; /*LMDR <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMAR <= 1; rdM <= 1; RMDRExt <= 1; LMDR <= ~clk;", state, $time); #5; LMDR <= 1; end
		jal6:	begin TMDR2X <= 1; /*LregY <= ~clk;*/ $display("State= %d- %0d(x100ps):- TMDR2X <= 1; LregY <= ~clk;", state, $time); #5; LregY <= 1; end
		jal7:	begin TPC <= 1; fnSel <= 2; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- TPC <= 1; fnSel <= 2; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		jrState:	begin rd <= 1; selreg <= 2; fnSel <= 1; /*LPC <= ~clk;*/ $display("State= %d- %0d(x100ps):- rd <= 1; selreg <= 2; fnSel <= 1; LPC <= ~clk;", state, $time); #5; LPC <= 1; end
		endcase
	end
endmodule


module datapath(
		output Dcondn,
		output [6:0] irContr,
		output [15:0] Abus,
		inout [15:0] Dbus,
		//inout [15:0] chk,
		input rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, PCrst,
		input [1:0] fnSel,
		input [1:0] selreg);

	wire [15:0] DbusOut;// Dbus10;
	wire [15:0] Xbus, Zbus, y, irOut, irIn, mdrIn, mdrOut, marOut, tOut, pcOut;
	//reg [15:0] irOut;
	wire [2:0] pa, wpa, rb, rx, rdst, aluSel, alusel1;
	wire c_n, c_n_minus_1;
	
	assign rb[0] = irOut[6];
	assign rb[1] = irOut[7];
	assign rb[2] = irOut[8];
	
	assign rx[0] = irOut[3];
	assign rx[1] = irOut[4];
	assign rx[2] = irOut[5];
	
	assign rdst[0] = irOut[0];
	assign rdst[1] = irOut[1];
	assign rdst[2] = irOut[2];
	
	assign wpa[0] = irOut[0];
	assign wpa[1] = irOut[1];
	assign wpa[2] = irOut[2];
	
	// IR, MDR, MAR- memory 
	register_16 ir(irOut, Dbus, LIR, rst),
					mdr(mdrOut, mdrIn, LMDR, rst),
					mar(marOut, Zbus, LMAR, rst);
	genvar fli;
	generate for(fli = 0; fli <= 6; fli = fli + 1)
	begin:loop
		assign irContr[fli] = irOut[fli+9];
	end
	endgenerate
	
//	triStateBuffer tmdr2ir(irIn, mdrOut, TMDR2IR),
	triStateBuffer rmdrext(mdrIn, Dbus, RMDRExt),
						rmdrint(mdrIn, Zbus, RMDRInt),
						tmdr2ext(DbusOut, mdrOut, TMDR2Ext),
						tmdr2x(Xbus, mdrOut, TMDR2X),
						tmar(Abus, marOut, TMAR);
	
	assign Dbus = (TMDR2Ext) ? DbusOut : 16'bzzzzzzzzzzzzzzzz;

	register_16 t(tOut, Zbus, LT, rst),
					pc(pcOut, Zbus, LPC, PCrst),
					regy(y, Xbus, LregY, rst);
	triStateBuffer tt(Xbus, tOut, TT),
						tpc(Xbus, pcOut, TPC),
						t1(Xbus, 16'b0000000000000001, T1);
	regBank rgbnk(Xbus, Zbus, pa, wpa, rd, wr);
	mux4_1_3 muxpa(pa, rb, rx, rdst, , selreg);
	
	mux4_1_3 muxfnsel(alusel1, {irOut[14], irOut[13], irOut[12]}, 3'b110, 3'b000, 3'bXXX, fnSel);
	not(n2, alusel1[1]), (n3, alusel1[0]);
	and(mnsSel, alusel1[2], n2, n3);
	mux2_1_3 muxmns(aluSel, alusel1, 3'b001, mnsSel);
	alu aluop(Zbus, c_n, c_n_minus_1, Xbus, y, aluSel);
	statusDetectors condflag(Dcondn, Zbus, c_n, c_n_minus_1, Lflag, irOut[12:9]);
	
endmodule

