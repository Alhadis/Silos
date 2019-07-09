// build a module for instruction decode
module MEM_Stage
	(
		clk,
		rst,
		read,
		write,
		address,
		readdata,
		writedata
	);

	// input and outputs
	input			clk;
	input			rst;
	input			read;
	input			write;
	input	[15:0]	address;
	input	[31:0]	writedata;
	output	[31:0]	readdata;

	// registers and wires
	reg		[31:0]	registers[255:0];

	wire	[15:0]	realaddress;

	// build module

	// memory address generator
	MemAdd MA
	(
		.address_in(address),
		.address(realaddress)
	);

	// read part
	assign readdata = (read) ? registers[realaddress[7:0]] : 32'b0;

	// write part
	always @(posedge clk)
	begin
		if(write)
		begin
			registers[realaddress] <= writedata;
		end
	end

endmodule
