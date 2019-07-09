// build a module for write back
module WB_Stage
	(
		MEM_R_En,
		ALU_result,
		Mem_Data,
		WB_Data
	);
	
	// input and output ports
	input			MEM_R_En;
	input	[31:0]	ALU_result;
	input	[31:0]	Mem_Data;
	output	[31:0]	WB_Data;
	
	// build module
	assign WB_Data = (MEM_R_En) ? Mem_Data : ALU_result;
endmodule
