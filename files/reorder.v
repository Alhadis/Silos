module reorder_buffer(
	input clk,
	input stall,
	input[2:0] alu, //Alu index

	input alu_we,
	input[4:0] alu_rd,
	input[31:0] alu_pc,
	input alu_ex,
	input[31:0] alu_val,
	input alu_store,
	input[31:0] alu_addr,
	input alu_pass,

	input[2:0] load, //Load index
	input[31:0] load_pc,
	input load_we,
	input[4:0] load_rd,
	input load_ex,
	input[31:0] load_val,
	input[31:0] load_addr,

	input[2:0] slow, //Slow index
	input slow_we,
	input[31:0] slow_pc,
	input[4:0] slow_rd,
	input slow_ex,
	input[31:0] slow_val,

	output[31:0] val_out,
	output[4:0] rd_out,
	output we,
	output ex_out,

	output store_out,
	output[31:0] pc_out,
	output[31:0] addr_out,
	output stores,

	output[2:0] tail_out,
	input next_head,
	output[4:0] destination_0,
	output[4:0] destination_1,
	output[4:0] destination_2,
	output[4:0] destination_3,
	output[4:0] destination_4,
	output[4:0] destination_5,
	output[4:0] destination_6,
	output[4:0] destination_7,
	output[31:0] val_0,
	output[31:0] val_1,
	output[31:0] val_2,
	output[31:0] val_3,
	output[31:0] val_4,
	output[31:0] val_5,
	output[31:0] val_6,
	output[31:0] val_7,
	output[7:0] valids
);

reg[2:0] head, tail;
reg valid[7:0];
reg[31:0] value[7:0], epc[7:0];
reg exception[7:0];

//Load values
reg[4:0] rd[7:0];
reg pass[7:0];

//Store values
reg store[7:0];
reg[31:0] address[7:0];

assign val_out = value[head];
assign rd_out = rd[head];
assign we = valid[head] & !pass[head];
assign ex_out = exception[head];
assign pc_out = epc[head];

assign store_out = store[head];
assign addr_out = address[head];
assign tail_out = tail;
assign destination_0 = rd[0];
assign val_0 = value[0];
assign destination_1 = rd[1];
assign val_1 = value[1];
assign destination_2 = rd[2];
assign val_2 = value[2];
assign destination_3 = rd[3];
assign val_3 = value[3];
assign destination_4 = rd[4];
assign val_4 = value[4];
assign destination_5 = rd[5];
assign val_5 = value[5];
assign destination_6 = rd[6];
assign val_6 = value[6];
assign destination_7 = rd[7];
assign val_7 = value[7];

assign stores = (store[0]&valid[0]) | (store[1]&valid[1]) | (store[2]&valid[2]) | (store[3]&valid[3]) | (store[4]&valid[4]) | (store[5]&valid[5]) | (store[6]&valid[6]) | (store[7]&valid[7]);

assign valids[0] = valid[0]; 
assign valids[1] = valid[1]; 
assign valids[2] = valid[2]; 
assign valids[3] = valid[3]; 
assign valids[4] = valid[4]; 
assign valids[5] = valid[5]; 
assign valids[6] = valid[6];
assign valids[7] = valid[7]; 


always @(posedge clk) begin
		if(alu_we) begin
			valid[alu] <= 1;
			value[alu] <= alu_val;
			epc[alu] <= alu_pc;
			exception[alu] <= alu_ex;
			rd[alu] <= alu_rd;
			store[alu] <= alu_store;
			address[alu] <= alu_addr;
			pass[alu] <= alu_pass;
		end
		if(load_we) begin
			valid[load] <= 1;
			value[load] <= load_val;
			epc[load] <= load_pc;
			exception[load] <= load_ex;
			rd[load] <= load_rd;
			store[load] <= 0;
			address[load] <= load_addr;
			pass[load] <= 0;
		end
		if(slow_we) begin
			valid[slow] <= 1;
			value[slow] <= slow_val;
			epc[slow] <= slow_pc;
			exception[slow] <= slow_ex;
			rd[slow] <= slow_rd;
			store[slow] <= 0;
			pass[slow] <= 0;
		end
		if(valid[head] & next_head) begin
			valid[head] = 0;
			head = head+1;
		end
		if(!stall) begin
			valid[tail] = 0;
			tail = tail+1;
		end

end

initial begin
	tail <= 0;
	head <= 0;

	valid[0] <= 0;
	value[0] <= 0;
	epc[0] <= 0;
	exception[0] <= 0;
	rd[0] <= 0;
	store[0] <= 0;
	address[0] <= 0;

	valid[1] <= 0;
	value[1] <= 0;
	epc[1] <= 0;
	exception[1] <= 0;
	rd[1] <= 0;
	store[1] <= 0;
	address[1] <= 0;

	valid[2] <= 0;
	value[2] <= 0;
	epc[2] <= 0;
	exception[2] <= 0;
	rd[2] <= 0;
	store[2] <= 0;
	address[2] <= 0;

	valid[3] <= 0;
	value[3] <= 0;
	epc[3] <= 0;
	exception[3] <= 0;
	rd[3] <= 0;
	store[3] <= 0;
	address[3] <= 0;

	valid[4] <= 0;
	value[4] <= 0;
	epc[4] <= 0;
	exception[4] <= 0;
	rd[4] <= 0;
	store[4] <= 0;
	address[4] <= 0;

	valid[5] <= 0;
	value[5] <= 0;
	epc[5] <= 0;
	exception[5] <= 0;
	rd[5] <= 0;
	store[5] <= 0;
	address[5] <= 0;

	valid[6] <= 0;
	value[6] <= 0;
	epc[6] <= 0;
	exception[6] <= 0;
	rd[6] <= 0;
	store[6] <= 0;
	address[6] <= 0;

	valid[7] <= 0;
	value[7] <= 0;
	epc[7] <= 0;
	exception[7] <= 0;
	rd[7] <= 0;
	store[7] <= 0;
	address[7] <= 0;

end

endmodule