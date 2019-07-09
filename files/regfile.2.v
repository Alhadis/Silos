//regfile
//collection of 8 registers for use in the data path of our 
//simple RISC machine. Read and write select are controlled 
//through binary input busses writenum and readnum. All registers
//share a common clock.
//inputs:
//	data_in 	- data to be copied to the state of the selected register 
//	writenum	- selects which register to write to
// 	readnum 	- selects which register to read from
// 	write		- when 1, data_in is copied to the selected register on
//				  posedge of clk. when 0, register zare unaffected by data_in
//	clk			- clock signal for all registers in the module
//outputs:
//	dtata_out	- equal to the state of the selected register. Not dependent on 
//				  the state of clk.
module regfile(data_in, writenum, write, readnum, clk, data_out);

	input  	[15:0] 	data_in;
	input  	[2:0] 	writenum, readnum;
	input 			write, clk;
	output 	[15:0]	data_out;
	
	wire	[7:0] 	writenumOneHot, regSelect;
	wire	[15:0]	R0, R1, R2, R3, R4, R5, R6, R7;
	
	//decode the writenum create a one hot reg select signal
	Decoder #(3,8) writeDecoder(writenum,writenumOneHot);
	assign regSelect  = writenumOneHot&{8{write}};//will be all 0s if write is 0
	
	//create 8 load registers
	LoadRegister #(16) Reg0 (data_in, R0, regSelect[0], clk);	//register 0
	LoadRegister #(16) Reg1 (data_in, R1, regSelect[1], clk);	//register 1
	LoadRegister #(16) Reg2 (data_in, R2, regSelect[2], clk);	//register 2
	LoadRegister #(16) Reg3 (data_in, R3, regSelect[3], clk);	//register 3
	LoadRegister #(16) Reg4 (data_in, R4, regSelect[4], clk);	//register 4
	LoadRegister #(16) Reg5 (data_in, R5, regSelect[5], clk);	//register 5
	LoadRegister #(16) Reg6 (data_in, R6, regSelect[6], clk);	//register 6
	LoadRegister #(16) Reg7 (data_in, R7, regSelect[7], clk);	//register 7
	
	//mux outputs the state of the register selected to be read
	//**note** this is a binary select mux, so it had a built-in decoder
	Muxb8 #(16) readMux(R7, R6, R5, R4, R3, R2, R1, R0, readnum, data_out);
	
endmodule