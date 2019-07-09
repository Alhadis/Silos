module tags(
  input [23:0] tag, //Tag
  input [4:0] idx,
	output miss //Miss cable
);
	
reg[23:0] tagList[31:0]; //Tag list (32 tags)
assign miss = (tagList[idx] == tag);

endmodule

module dcache(
  input clk,
  input [31:0] data_in, //Input data to write 
  input [63:0] data_mem, //Full line (from memory)
  input [4:0] idx_mem, //Line to write from memory
  input [4:0] idx, //Line on the cache
  input [2:0] idb, //Byte on the line
  input we, //Write enabled (miss and store)
  input fill, //Fill from memory
  input word, //Read byte
  output[31:0] data_out //Output data for reads
);

 reg[7:0] data[31:0][7:0]; 
 
 assign data_out[7:0] = data[idx][idb];
 assign data_out[15:8] = (word)?data[idx][idb+1]:{8{data[idx][idb][7]}};
 assign data_out[23:16] = (word)?data[idx][idb+2]:{8{data[idx][idb][7]}};
 assign data_out[31:24] = (word)?data[idx][idb+3]:{8{data[idx][idb][7]}};

 always @(posedge clk)
 begin
  if(we) begin
  	if(word) begin
	    data[idx][idb] <= data_in[7:0];
    	data[idx][idb+1] <= data_in[15:8];
      data[idx][idb+2] <= data_in[23:16];
      data[idx][idb+3] <= data_in[31:24];
    end
    else begin
    	data[idx][idb] <= data_in[7:0];
    end
  end 
  if(fill) begin
      data[idx_mem][0] <= data_mem[7:0];
      data[idx_mem][1] <= data_mem[15:8];
      data[idx_mem][2] <= data_mem[23:16];
      data[idx_mem][3] <= data_mem[31:24];
      data[idx_mem][4] <= data_mem[39:32];
      data[idx_mem][5] <= data_mem[47:40];
      data[idx_mem][6] <= data_mem[55:48];
      data[idx_mem][7] <= data_mem[63:56];
    end
 end

endmodule

module icache(
  input clk,
  input [63:0] data_mem, //Full line (from memory)
  input [4:0] idx_mem, //Line to write from memory
  input [4:0] idx, //Line on the cache
  input [2:0] idb, //Byte on the line
  input fill, //Fill from memory
  output[31:0] data_out //Output data for reads
);

 reg[7:0] data[31:0][7:0]; 
 
 assign data_out[7:0] = data[idx][idb];
 assign data_out[15:8] = data[idx][idb+1];
 assign data_out[23:16] = data[idx][idb+2];
 assign data_out[31:24] = data[idx][idb+3];
 
 always @(posedge clk)
 begin
  if(fill)
    begin
      data[idx_mem][0] <= data_mem[7:0];
      data[idx_mem][1] <= data_mem[15:8];
      data[idx_mem][2] <= data_mem[23:16];
      data[idx_mem][3] <= data_mem[31:24];
      data[idx_mem][4] <= data_mem[39:32];
      data[idx_mem][5] <= data_mem[47:40];
      data[idx_mem][6] <= data_mem[55:48];
      data[idx_mem][7] <= data_mem[63:56];
    end
 end

endmodule
