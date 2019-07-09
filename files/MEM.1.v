// build a module for instruction decode
module MEM_Stage
	(
		clk,
		rst,
		read,
		write,
		address,
		readdata,
		writedata,
		MEM_NOT_READY,
		SRAMaddress,
		SRAMWEn,
		SRAMdata
	);

	// input and outputs
	input	clk;
	input	rst;
	input	read;
	input	write;
	input	[15:0] address;
	input	[31:0] writedata;
	output SRAMWEn;
	output MEM_NOT_READY;
	output [17:0]	SRAMaddress;
	output [31:0]	readdata;
	inout	[15:0]	SRAMdata;

	// registers and wires
	wire	[15:0]	realaddress;

	// build module

	MemAdd MA	// memory address generator
	(
		.address_in(address),
		.address(realaddress)
	);

	CACHE cache // cache
		(
			.clk(clk),
			.rst(rst),
			.cache_read(read),
			.cache_write(write),
			.address(realaddress),
			.cache_readdata(readdata),
			.cache_writedata(writedata),
			.SRAMaddress(SRAMaddress),
			.SRAMWEn(SRAMWEn),
			.SRAMdata(SRAMdata),
			.MEM_NOT_READY(MEM_NOT_READY)
		);

endmodule
