`timescale 100ps / 1ps
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

module tb_controller;
	
//	controller(
//		output rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, rdM, wrM, PCrst,
//		// as usual PCrst (to reset only the PC register in the datapath) is active low signal
//		/*//PCrst was previously active high signal*/
//		output [1:0] fnSel, selreg,
//		input Dcondn, clk, rstIn, mfc, //rstIn is also active low
//		input [6:0] irContr);

	wire rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, rdM, wrM, PCrst;
	wire [1:0] fnSel, selreg;
	reg Dcondn, clk, rstIn, mfc;
	reg [6:0] irContr;
	
	controller uut(rd, wr, LPC, TPC, LT, TT, LMAR, TMAR, LIR, RMDRExt, RMDRInt, TMDR2X, TMDR2Ext, TMDR2IR, LMDR, LregY, T1, Lflag, rdM, wrM, PCrst, fnSel, selreg, Dcondn, clk, rstIn, mfc, irContr);
	
	// Clock generator
	initial
	begin
		clk = 1;
		forever #5 clk = ~clk;
	end
	
	//Terminate simulation
//	initial #300 $finish;
	// Stimulus generator
	initial
	begin
////		$display("Dcondn = %b", Dcondn);
//		rstIn = 0; mfc = 0;
//		#10; 
//			rstIn = 1; irContr = 7'b1101000; $display("IR = %b", irContr);
////			repeat
////			begin
////				forever begin #1 irContr = irContr + 1; $display("IR = %b", irContr); end
////			end
//////		#(10+30+40+30+40);
//		#10; mfc = 0;
//		#10; 
//		#10;
//		#11; mfc=1;
//		#10;//f3
//		#10;
//		#10;//ai1
//		#10;
//		#10;
//		#10; Dcondn = 0;
//		#10;
//		#10;

/*		rstIn = 0; mfc = 0;
		#10; 
			rstIn = 1; irContr = 7'b0100000; $display("IR = %b", irContr);
		#10; mfc = 0;
		#10;
		#11; mfc=1;
		#10;//f3
		#10;
		#10;//ai1
		#10; mfc = 0;
		#10; //Dcondn = 1;
		#11; mfc=1;
		#10;//ai3
		#10; 
		#10;
		#10; 
		#10; $finish;
*/
		rstIn = 0;// mfc = 0;
		#10; 
			rstIn = 1; irContr = 7'b0010000; $display("IR = %b- {add, sub, and, or}i", irContr);
		#10; mfc = 0;
		#10;
		#11; mfc=1;
		#9;//f3
		#10;
		#10;//ai1
		#10; mfc = 0;
		#10; //Dcondn = 1;
		#11; mfc=1;
		#9;//ai3
		#10; 
		#10;
		#10; 
				//irContr = 7'b0100000; $display("IR = %b- mnsi", irContr);
		#10; irContr = 7'b0100000; $display("\nIR = %b- mnsi", irContr);
		#10; mfc = 0;
		#10;
		#11; mfc=1;
		#9;//f3
		#10;
		#10;//ai1
		#10; mfc = 0;
		#10; //Dcondn = 1;
		#11; mfc=1;
		#9;//ai3
		#10; 
		#10;
		#10; 
//				irContr = 7'b1000000; $display("IR = %b- li", irContr);
		#10; irContr = 7'b1000000; $display("\nIR = %b- li", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; //f3
		#10;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; //7
		#10;
		#10;
		
		#10; irContr = 7'b0000001; $display("\nIR = %b- {add, sub, and, or}r", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;
		#10;
		#10;
		
		#10; irContr = 7'b0100001; $display("\nIR = %b- mnsr", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;
		#10;
		#10;
		
		#10; irContr = 7'b1001001; $display("\nIR = %b- lr", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		
		#10; irContr = 7'b0001010; $display("\nIR = %b- {add,sub,&,|}x", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;
		#10;
		#10;
		#10;
		#10;
		#10; mfc=0;
		#10; 
		#11; mfc=1;
		#9;
		#10;
		#10;
		
		#10; irContr = 7'b0001011; $display("\nIR = %b- {add,sub,&,|}a", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		
		#10; irContr = 7'b0001100; $display("\nIR = %b- {add,sub,&,|}n", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		
		#10; irContr = 7'b1011100; $display("\nIR = %b- sx", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		#10;
		#10;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		
		#9; irContr = 7'b0101110; $display("\nIR = %b- cmp", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		
		#10; irContr = 7'b1101010; $display("\nIR = %b- jump instructions", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10; Dcondn=1;
		#10;
		
		#10; irContr = 7'b1110111; $display("\nIR = %b- jal", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		#10;
		#10;
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9;
		#10;
		#10;
		
		#10; irContr = 7'b1111000; $display("\nIR = %b- jr", irContr);
		#10; mfc=0;
		#10;
		#11; mfc=1;
		#9; 
		#10;//f4
		#10;
		
		#1; $finish;
		
	end
endmodule
