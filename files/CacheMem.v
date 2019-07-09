module CacheMem(Address, clk, rst, memClk, ready, out_data);
	input [14:0] Address;
	input clk, rst, memClk;

	output ready; 
	output[31:0] out_data;

	wire Mem_Ready, CacheWrite, MemRead;
	wire[127:0] Mem_Out;

	Cache cache(CacheWrite, Address, Mem_Out, clk, rst, Miss, out_data);
	CU cu(Address, Miss, Mem_Ready, clk, rst, CacheWrite, MemRead, ready);
	Memory mem(MemRead, Mem_Ready, Address, memClk, rst, Mem_Out);
endmodule