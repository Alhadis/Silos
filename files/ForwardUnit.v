// build a module for ForwardUnit detection
module ForwardUnit
	(
		BR_Type,
		WB_En1,
		WB_En2,
		mem_W_En,
		//Is_Imm1,
		//Is_Imm2,
		Is_Imm,
		src1,
		src2,
		readdata2,
		dest1,
		dest2,
		aluResult1,
		aluResult2,
		srcOut1,
		srcOut2,
		memOut,
		shouldForward1,
		shouldForward2,
	);
	
	// define input and output ports
	input			WB_En1;
	input			WB_En2;
	//input			Is_Imm1;
	//input			Is_Imm2;
	input			Is_Imm;
	input			mem_W_En;
	input	[1:0]	BR_Type;
	input	[4:0]	src1;
	input	[4:0]	src2;
	input	[4:0]	dest1;
	input	[4:0]	dest2;
	input	[31:0]	readdata2;
	input	[31:0]	aluResult1;
	input	[31:0]	aluResult2;
	output 			shouldForward1;
	output 			shouldForward2;
	output	[31:0]	srcOut1;
	output	[31:0]	srcOut2;
	output	[31:0]	memOut;

	// wires and registers
	wire        shouldForward1FromExe;
	wire        shouldForward2FromExe;
	wire        shouldForward1FromMem;
	wire        shouldForward2FromMem;
	wire		shouldForwardMemFromExe;
	wire		shouldForwardMemFromMem;
	reg	[31:0]	srcOut1;
	reg	[31:0]	srcOut2;
	reg	[31:0]	memOut;

	// define branch types	
	parameter NO_BRANCH_Code = 2'b0;
	parameter BEZ_Code = 2'b01;
	parameter BNE_Code = 2'b10;
	parameter JMP_Code = 2'b11;

    assign shouldForward1FromExe = !( src1 ^ dest1 ) & WB_En1 & |dest1;
    assign shouldForward2FromExe = !( src2 ^ dest1 ) & WB_En1 & (~Is_Imm | !(BR_Type ^ BNE_Code)) & |dest1;
    assign shouldForwardMemFromExe = !( src2 ^ dest1 ) & WB_En1 & mem_W_En  & |dest1;
    assign shouldForward1FromMem = !( src1 ^ dest2 ) & WB_En2 & |dest2;
    assign shouldForward2FromMem = !( src2 ^ dest2 ) & WB_En2 & (~Is_Imm | !(BR_Type ^ BNE_Code)) & |dest2;
    assign shouldForwardMemFromMem = !( src2 ^ dest2 ) & WB_En2 & mem_W_En & |dest2;
    assign shouldForward1 = shouldForward1FromExe | shouldForward1FromMem;
    assign shouldForward2 = shouldForward2FromExe | shouldForward2FromMem;
	// build module
	always @(*)
	begin
		if( shouldForward1FromExe )
		begin
			srcOut1 <= aluResult1;
		end
		else
		    if( shouldForward1FromMem )
            begin
                srcOut1 <= aluResult2;
            end

		if( shouldForward2FromExe )
		begin
			srcOut2 <= aluResult1;
		end
		else
		    if( shouldForward2FromMem )
            begin
                srcOut2 <= aluResult2;
            end
		
		if (shouldForwardMemFromExe)
			memOut <= aluResult1;
		else
			if (shouldForwardMemFromMem)
				memOut <= aluResult2;
			else
				memOut <= readdata2;
	end
endmodule

