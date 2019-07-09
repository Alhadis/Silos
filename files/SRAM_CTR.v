// build a module for ForwardUnit detection
module SRAM_CTR
	(
		clk,
		rst,
		MEM_R_EN,
		MEM_W_EN,
		SRAMaddress,
		SRAMWEn,
		SRAMdata,
		SRAM_NOT_READY,
		writeData,
		address,
		readData
	);
	// define input and output ports
	input			clk;
	input			MEM_R_EN;
	input			MEM_W_EN;
	input			rst;
	output 			SRAMWEn;
	output	[17:0]	SRAMaddress;
	input	[31:0]	writeData;
	input	[15:0]	address;
	output			SRAM_NOT_READY;
	output	[31:0]	readData;
	inout	[15:0]	SRAMdata;

	// parameters
	localparam INIT = 0;
	localparam READ_1 = 1;
	localparam READ_2 = 2;
	localparam WRITE_1 = 3;
	localparam WAIT = 4;

	// wire and registers
	reg 			SRAMWEn;
	reg		[17:0]	SRAMaddress;
	reg				InnerStall;
	reg 	[2:0] 	counter;
	reg		[2:0]	presentState;
	reg		[2:0]	nextState;
	reg		[15:0]	readData_L;
	reg		[15:0]	readData_H;
	reg 	[15:0] data_to_sram;

	// build module
	assign SRAM_NOT_READY = |counter | InnerStall;
	assign readData = { readData_H, readData_L };

	always @(negedge clk) begin
		if (rst)
		begin
			readData_L <= 16'b0;
			readData_H <= 16'b0;
		end
		else
			if ( !(presentState ^ READ_1) )
				readData_L <= SRAMdata;
			if ( !(presentState ^ READ_2) )
				readData_H <= SRAMdata;
		begin
		end
	end
	// stall counter
	always @(posedge clk)
	begin
		if( rst )
		begin
			counter <= 3'b0;
		end
		else
		begin
			if( InnerStall )
			begin
				counter <= 3'h4;
			end
			if( ~InnerStall & |counter )
			begin
				counter <= counter - 1;
			end
		end
	end

	// controller
	always @( posedge clk )
	begin
		if( rst )
			presentState <= INIT;
		else
			presentState <= nextState;
	end

	always @(*) begin
		case (presentState)
			INIT:
			begin
				if (MEM_R_EN)
				begin
					nextState = READ_1;
				end
				else if (MEM_W_EN)
				begin
					nextState = WRITE_1;
				end
				else
				begin
					nextState = INIT;
				end
			end
			READ_1:
			begin
				nextState = READ_2;
			end
			READ_2:
			begin
				nextState = WAIT;
			end
			WRITE_1:
			begin
				nextState = WAIT;
			end
			WAIT:
				if ( SRAM_NOT_READY )
				begin
					nextState = WAIT;
				end
				else
				begin
					nextState = INIT;
				end
		endcase
	end

	always @(*)
	begin
		case(presentState)
			INIT:
			begin
				if (MEM_R_EN)
				begin
					InnerStall = 1'b1;
					SRAMWEn = 1'b1;
					SRAMaddress = { 1'b0, address, 1'b0 };
					data_to_sram = {16{1'bz}};
				end
				else
				begin
					if (MEM_W_EN)
					begin
						InnerStall = 1'b1;
						SRAMWEn = 1'b0;
						SRAMaddress = { 1'b0, address, 1'b0 };
						data_to_sram = writeData[15:0];
					end
					else
					begin
						InnerStall = 1'b0;
						SRAMWEn = 1'b1;
						SRAMaddress = { 1'b0, address, 1'b0 };
						data_to_sram = {16{1'bz}};
					end
				end
			end
			READ_1:
			begin
				InnerStall = 1'b0;
				SRAMWEn = 1'b1;
				SRAMaddress = { 1'b0, address, 1'b1 };
				data_to_sram = {16{1'bz}};
			end
			READ_2:
			begin
				InnerStall = 1'b0;
				SRAMWEn = 1'b1;
				SRAMaddress = { 1'b0, address, 1'b1 };
				data_to_sram = {16{1'bz}};
			end
			WRITE_1:
			begin
				InnerStall = 1'b0;
				SRAMWEn = 1'b0;
				SRAMaddress = { 1'b0, address, 1'b1 };
				data_to_sram = writeData[31:16];
			end
			WAIT:
			begin
				InnerStall = 1'b0;
				SRAMWEn = 1'b1;
				SRAMaddress = { 1'b0, address, 1'b1 };
				data_to_sram = {16{1'bz}};
			end
		endcase
	end

	assign SRAMdata = data_to_sram;

endmodule
