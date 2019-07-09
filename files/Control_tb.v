

module Control_tb();
	//---------- Entradas ---------------
	reg [5:0]	op;
	reg [5:0]	fn;

	//--------- Saidas------------------
	wire [2:0] selwsource;
	wire [2:0] aluop;
	wire [2:0] compop;
	wire [1:0] selbrjumpz;
	wire [1:0] selregdest;
	wire [1:0] shiftop;
	wire [1:0] selpctype;
	wire  writereg;
	wire  writeov;
	wire  selimregb;
	wire  selalushift;
	wire  readmem;
	wire  writemem;
	wire  unsig;
	//------------------------------------



	//-----------------------------------
	Control dut(op, fn, selwsource, selregdest,
				writereg, writeov, selimregb,
				selalushift,aluop,shiftop,
				readmem, writemem, selbrjumpz,
				selpctype, compop, unsig
				);
	parameter delay=10;
	//----------------------------------

	initial begin
		$dumpfile ("Control.vcd");
		$dumpvars;
		op = 6'b000000;

		//Instrução: SLLV
		fn = 6'b000100;
		#delay;
		$display ("Instrução: SLLV\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em 1", selalushift);
		$display("aluop: %b em x", aluop);
		$display("shiftop: %b em 10", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: SRLV
		fn=6'b000110;
		#delay;
		$display ("Instrução: SRLV\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em 1", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em 00", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: SRVA
		fn = 6'b000111;
		#delay;
		$display ("Instrução: SRVA\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em 1", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em 01", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: JR
		fn = 6'b001000;
		#delay;
		$display ("Instrução: JR\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em xxx", selwsource);
		$display("selregdest: %b em xx", selregdest);
		$display("writereg: %b em 0", writereg);
		$display("writeov: %b em x", writeov);
		$display("selimregb: %b em x", selimregb);
		$display("selalushift: %b em x", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 01", selbrjumpz);
		$display("selpctype: %b em 01", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: ADD
		fn = 6'b100000;
		#delay;
		$display ("Instrução: ADD\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 0", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 010", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em 0\n", unsig);

		//Instrução: ADDU
		fn = 6'b100001;
		#delay;
		$display ("Instrução: ADDU\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 010", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em 1\n", unsig);

		//Instrução: SUB
		fn = 6'b100010;
		#delay;
		$display ("Instrução: SUB\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 0", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 110", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: SUBU
		fn = 6'b100011;
		#delay;
		$display ("Instrução: SUBU\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 110", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em 1\n", unsig);

		//Instrução: AND
		fn = 6'b100100;
		#delay;
		$display ("Instrução: AND\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 000", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: OP
		fn = 6'b100101;
		#delay;
		$display ("Instrução: OR\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 001", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: XOR
		fn = 6'b100110;
		#delay;
		$display ("Instrução: XOR\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 101", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: NOR
		fn = 6'b100111;
		#delay;
		$display ("Instrução: NOR\nOP: %b\nFN: %b", op, fn);
		$display("selwsource: %b em 000", selwsource);
		$display("selregdest: %b em 01", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 0", selimregb);
		$display("selalushift: %b em O", selalushift);
		$display("aluop: %b em 100", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig :%b em x\n", unsig);

		//Instrução: BEQ
		op <= 6'b000100;
		fn <= $random;
		#delay;
		$display("Instrução: BEQ\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em xxx", selwsource);
		$display("selregdest: %b em xx", selregdest);
		$display("writereg: %b em 0", writereg);
		$display("writeov: %b em x", writeov);
		$display("selimregb: %b em x", selimregb);
		$display("selalushift: %b em x", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 10", selbrjumpz);
		$display("selpctype: %b em 00", selpctype);
		$display("compop: %b em 000", compop);
		$display("unsig: %b em 0\n", unsig);

		//Instrução: BNE
		op <= 6'b000101;
		fn <= $random;
		#delay;
		$display("Instrução: BNE\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em xxx", selwsource);
		$display("selregdest: %b em xx", selregdest);
		$display("writereg: %b em 0", writereg);
		$display("writeov: %b em x", writeov);
		$display("selimregb: %b em x", selimregb);
		$display("selalushift: %b em x", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 10", selbrjumpz);
		$display("selpctype: %b em 00", selpctype);
		$display("compop: %b em 101", compop);
		$display("unsig: %b em 0\n", unsig);

		//Instrução: BLEZ
		op <= 6'b000110;
		fn <= $random;
		#delay;
		$display("Instrução: BLEZ\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em xxx", selwsource);
		$display("selregdest: %b em xx", selregdest);
		$display("writereg: %b em 0", writereg);
		$display("writeov: %b em x", writeov);
		$display("selimregb: %b em x", selimregb);
		$display("selalushift: %b em x", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 10", selbrjumpz);
		$display("selpctype: %b em 00", selpctype);
		$display("compop: %b em 010", compop);
		$display("unsig: %b em 0\n", unsig);

		//Instrução: BGTZ
		op <= 6'b000111;
		fn <= $random;
		#delay;
		$display("Instrução: BGTZ\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em xxx", selwsource);
		$display("selregdest: %b em xx", selregdest);
		$display("writereg: %b em 0", writereg);
		$display("writeov: %b em x", writeov);
		$display("selimregb: %b em x", selimregb);
		$display("selalushift: %b em x", selalushift);
		$display("aluop: %b em xxx", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 10", selbrjumpz);
		$display("selpctype: %b em 00", selpctype);
		$display("compop: %b em 011", compop);
		$display("unsig: %b em 0\n", unsig);

		//Instrução: ADDI
		op <= 6'b001000;
		fn <= $random;
		#delay;
		$display("Instrução: ADDI\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em 000", selwsource);
		$display("selregdest: %b em 00", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 0", writeov);
		$display("selimregb: %b em 1", selimregb);
		$display("selalushift: %b em 0", selalushift);
		$display("aluop: %b em 010", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig: %b em 0\n", unsig);

		//Instrução: ADDIU
		op <= 6'b001001;
		fn <= $random;
		#delay;
		$display("Instrução: ADDIU\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em 000", selwsource);
		$display("selregdest: %b em 00", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 1", selimregb);
		$display("selalushift: %b em 0", selalushift);
		$display("aluop: %b em 010", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig: %b em 1\n", unsig);

		//Instrução: ANDI
		op <= 6'b001100;
		fn <= $random;
		#delay;
		$display("Instrução: ANDI\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em 000", selwsource);
		$display("selregdest: %b em 00", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 1", selimregb);
		$display("selalushift: %b em 0", selalushift);
		$display("aluop: %b em 000", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig: %b em x\n", unsig);

		//Instrução: ORI
		op <= 6'b001101;
		fn <= $random;
		#delay;
		$display("Instrução: ORI\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em 000", selwsource);
		$display("selregdest: %b em 00", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 1", selimregb);
		$display("selalushift: %b em 0", selalushift);
		$display("aluop: %b em 001", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig: %b em x\n", unsig);

		//InstruçãO: XORI
		op <= 6'b001110;
		fn <= $random;
		#delay;
		$display("Instrução: xORI\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em 000", selwsource);
		$display("selregdest: %b em 00", selregdest);
		$display("writereg: %b em 1", writereg);
		$display("writeov: %b em 1", writeov);
		$display("selimregb: %b em 1", selimregb);
		$display("selalushift: %b em 0", selalushift);
		$display("aluop: %b em 101", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 0", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig: %b em x\n", unsig);

		//Instrução: SW
		op <= 6'b101011;
		fn <= $random;
		#delay;
		$display("Instrução: SW\nOP: %b\nFN: %b", op, fn);
		$display("selregdest: %b em xxx", selwsource);
		$display("selregdest: %b em xx", selregdest);
		$display("writereg: %b em 0", writereg);
		$display("writeov: %b em x", writeov);
		$display("selimregb: %b em 1", selimregb);
		$display("selalushift: %b em 0", selalushift);
		$display("aluop: %b em 010", aluop);
		$display("shiftop: %b em xx", shiftop);
		$display("readmem: %b em 0", readmem);
		$display("writemem: %b em 1", writemem);
		$display("selbrjumpz: %b em 00", selbrjumpz);
		$display("selpctype: %b em xx", selpctype);
		$display("compop: %b em xxx", compop);
		$display("unsig: %b em 0\n", unsig);
		$finish;
		end
endmodule