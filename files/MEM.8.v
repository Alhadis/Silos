// build a module for instruction decode
module MEM_Stage
	(
		clk,
		rst,
		read,
		write,
		aluResult,
		writedata,
		SRAM_NOT_READY,
		SRAMaddress,
		SRAMWEn,
		readdata,
		wbData,
		SRAMdata,
	);

	// input and outputs
	input			clk;
	input			rst;
	input			read;
	input			write;
	output 		SRAMWEn;
	input	[31:0]	aluResult;
	input	[31:0]	writedata;
	output [17:0]	SRAMaddress;
	output			SRAM_NOT_READY;
	output	[31:0]	readdata;
	output	[31:0]	wbData;
	inout	[15:0]	SRAMdata;

	// registers and wires
	reg		[31:0]	registers[255:0];

	wire	[15:0]	realaddress;

	// build module

	// memory address generator
	MemAdd MA
	(
		.address_in(aluResult[15:0]),
		.address(realaddress)
	);

	// read part
	// SRAM_CTR sram
	// 	(
	// 		.clk(clk),
	// 		.MEM_R_EN(read),
	// 		.MEM_W_EN(write),
	// 		.rst(rst),
	// 		.SRAMaddress(SRAMaddress),
	// 		.SRAMWEn(SRAMWEn),
	// 		.SRAMdata(SRAMdata),
	// 		.SRAM_NOT_READY(SRAM_NOT_READY),
	// 		.writeData(writedata),
	// 		.address(realaddress),
	// 		.readData(readdata)
	// 	);

	assign SRAM_NOT_READY = 1'b0;
	assign readdata = (read) ? registers[realaddress[7:0]] : 32'b0;
	assign wbData = (read) ? readdata : aluResult;

	// write part
	always @(posedge clk)
	begin
		if(write)
		begin
			registers[realaddress] <= writedata;
		end
	end

endmodule
