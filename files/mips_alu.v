module mips_alu(aluOut, rsCont, rtCont, op, fn, sa, imm);

	output reg[31:0] aluOut;		// alu sonucu
	input [31:0] rsCont;				// rs content
	input [31:0] rtCont;				// rt content
	input [5:0] op;					// op code
	input [5:0] fn;					// func code
	input [4:0] sa;					// shift amount
	input [15:0] imm;					// immediate
	
// R- Type func codes
wire[5:0] addOP = 6'b100000;
wire[5:0] adduOP = 6'b100001;
wire[5:0] subOP = 6'b100010;
wire[5:0] andOP = 6'b100100;
wire[5:0] orOP = 6'b100101;
wire[5:0] sraOP = 6'b000011;
wire[5:0] srlOP = 6'b000010;
wire[5:0] sllOP = 6'b000000;
wire[5:0] sltuOP = 6'b101011;

wire[5:0] jrOP = 6'b001000;
wire[5:0] norOP = 6'b100111;
wire[5:0] sltOP = 6'b101010;
wire[5:0] subuOP = 6'b100011;
///////////////////////////////
// I - Type op codes
wire[5:0] addiOP = 6'b001000;
wire[5:0] addiuOP = 6'b001001;

wire[5:0] andiOP = 6'b001100;
wire[5:0] beqOP = 6'b000100;
wire[5:0] bneOP = 6'b000101;
wire[5:0] lbuOP = 6'b100100;
wire[5:0] lhuOP = 6'b100101;
wire[5:0] llOP = 6'b110000;
wire[5:0] luiOP = 6'b001111;
wire[5:0] lwOP = 6'b100011;
wire[5:0] oriOP = 6'b001101;
wire[5:0] sltiOP = 6'b001010;
wire[5:0] sltiuOP = 6'b001011;
wire[5:0] sbOP = 6'b101000;
wire[5:0] scOP = 6'b111000;
wire[5:0] shOP = 6'b101001;
wire[5:0] swOP = 6'b101011;

///////////////////////////////

// J - Type op codes
//////////////////////////////
wire[5:0] jOP = 6'b000010;
wire[5:0] jalOP = 6'b000011;
//////////////////////////////

// rs veya rt contentinin degisimine gore islem yapar
always @(rsCont or rtCont)
begin
	if(op == 6'b0) // r type instruction'lar
	begin
	
		if(fn == addOP)
			aluOut = $signed(rtCont) + $signed(rsCont);
		else if(fn == adduOP)
			aluOut = rtCont + rsCont;
		else if(fn == subOP)
			aluOut = $signed(rsCont) - $signed(rtCont);
		else if(fn == andOP)
			aluOut = rtCont & rsCont; 
		else if(fn == orOP)
			aluOut = rtCont | rsCont; 
		else if(fn == sraOP)
			aluOut = $signed(rtCont) >>> sa; 
		else if(fn == srlOP)
			aluOut = rtCont >> sa;
		else if(fn == sllOP)
			aluOut = rtCont << sa;
		else if(fn == sltuOP)
			aluOut = (rsCont < rtCont)? 32'b1 : 32'b0;
		else if(fn == jrOP)
			aluOut = rsCont;
		else if(fn == norOP)
			aluOut = !(rsCont | rtCont);
		else if(fn == sltOP)
			aluOut = $signed(rsCont) < $signed(rtCont)? 32'b1 : 32'b0;
		else if(fn == subuOP)
			aluOut = rsCont - rtCont;
		else
			aluOut = 32'b0;
	end
	else   // diger (I type ve J type) instructionlar
	begin 

		if(op == addiOP)
			aluOut = $signed(rsCont) + $signed(imm);
		
		else if(op == addiuOP)
			aluOut = rsCont + $signed(imm);
		
		else if(op == andiOP)
			aluOut = rsCont + $signed(imm);
		
		else if(op == oriOP)
			aluOut = rsCont | $signed(imm);
		
		else if(op == sltiOP)
			aluOut = (rsCont < $signed(imm))? 1 : 0;
		
		else if(op == sltiuOP)
			aluOut = (rsCont < imm)? 1 : 0;
		
		else if(op == beqOP)
		begin
			if(rsCont == rtCont)
				aluOut = 32'b1;
			else
				aluOut = 32'b0;
		end
		
		else if(op == bneOP)
		begin
			if(rsCont != rtCont)
				aluOut = 32'b1;
			else
				aluOut = 32'b0;
		end
		
		else if(op == lwOP || op == llOP)
			aluOut = rsCont + $signed(imm);
		
		else if(op == lbuOP)
			aluOut = rsCont + $signed(imm);
		
		else if(op == luiOP)
			aluOut = {imm, 16'b0};
		
		else if(op == swOP)
			aluOut = rsCont + $signed(imm);
		
		else if(op == sbOP)
			aluOut = rsCont + $signed(imm);			
		
		else if(op == shOP)
			aluOut = rsCont + $signed(imm);
		
		else
			aluOut = 32'b0;	
	end

end

endmodule