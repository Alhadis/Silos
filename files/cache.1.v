module tags(
  input clk,
  input [23:0] tag, //Tag
  input [4:0] idx,
  input fill,
	output miss //Miss cable
);
	
reg[23:0] tagList[31:0]; //Tag list (32 tags)
assign miss = (tagList[idx] != tag);

always @(posedge clk) begin
  if(fill) begin
    tagList[idx] <= tag;
  end
end

initial begin
  tagList[0] <= 23'b11111111111111111111111;
  tagList[1] <= 23'b11111111111111111111111;
  tagList[2] <= 23'b11111111111111111111111;
  tagList[3] <= 23'b11111111111111111111111;
  tagList[4] <= 23'b11111111111111111111111;
  tagList[5] <= 23'b11111111111111111111111;
  tagList[6] <= 23'b11111111111111111111111;
  tagList[7] <= 23'b11111111111111111111111;
  tagList[8] <= 23'b11111111111111111111111;
  tagList[9] <= 23'b11111111111111111111111;
  tagList[10] <= 23'b11111111111111111111111;
  tagList[11] <= 23'b11111111111111111111111;
  tagList[12] <= 23'b11111111111111111111111;
  tagList[13] <= 23'b11111111111111111111111;
  tagList[14] <= 23'b11111111111111111111111;
  tagList[15] <= 23'b11111111111111111111111;
  tagList[16] <= 23'b11111111111111111111111;
  tagList[17] <= 23'b11111111111111111111111;
  tagList[18] <= 23'b11111111111111111111111;
  tagList[19] <= 23'b11111111111111111111111;
  tagList[20] <= 23'b11111111111111111111111;
  tagList[21] <= 23'b11111111111111111111111;
  tagList[22] <= 23'b11111111111111111111111;
  tagList[23] <= 23'b11111111111111111111111;
  tagList[24] <= 23'b11111111111111111111111;
  tagList[25] <= 23'b11111111111111111111111;
  tagList[26] <= 23'b11111111111111111111111;
  tagList[27] <= 23'b11111111111111111111111;
  tagList[28] <= 23'b11111111111111111111111;
  tagList[29] <= 23'b11111111111111111111111;
  tagList[30] <= 23'b11111111111111111111111;
  tagList[31] <= 23'b11111111111111111111111;

end

endmodule

module dtags(
  input clk,
  input [23:0] tag, //Tag
  input [4:0] idx,
  input fill,
  output miss, //Miss cable
  output dirty
);
  
reg[23:0] tagList[31:0]; //Tag list (32 tags)
reg dirtyBits[31:0];

assign miss = (tagList[idx] != tag);
assign dirty = dirtyBits[idx];

always @(posedge clk) begin
  if(fill) begin
    tagList[idx] <= tag;
    dirtyBits[idx] <= 0;
  end
end

initial begin
  tagList[0] <= 23'b11111111111111111111111;
  tagList[1] <= 23'b11111111111111111111111;
  tagList[2] <= 23'b11111111111111111111111;
  tagList[3] <= 23'b11111111111111111111111;
  tagList[4] <= 23'b11111111111111111111111;
  tagList[5] <= 23'b11111111111111111111111;
  tagList[6] <= 23'b11111111111111111111111;
  tagList[7] <= 23'b11111111111111111111111;
  tagList[8] <= 23'b11111111111111111111111;
  tagList[9] <= 23'b11111111111111111111111;
  tagList[10] <= 23'b11111111111111111111111;
  tagList[11] <= 23'b11111111111111111111111;
  tagList[12] <= 23'b11111111111111111111111;
  tagList[13] <= 23'b11111111111111111111111;
  tagList[14] <= 23'b11111111111111111111111;
  tagList[15] <= 23'b11111111111111111111111;
  tagList[16] <= 23'b11111111111111111111111;
  tagList[17] <= 23'b11111111111111111111111;
  tagList[18] <= 23'b11111111111111111111111;
  tagList[19] <= 23'b11111111111111111111111;
  tagList[20] <= 23'b11111111111111111111111;
  tagList[21] <= 23'b11111111111111111111111;
  tagList[22] <= 23'b11111111111111111111111;
  tagList[23] <= 23'b11111111111111111111111;
  tagList[24] <= 23'b11111111111111111111111;
  tagList[25] <= 23'b11111111111111111111111;
  tagList[26] <= 23'b11111111111111111111111;
  tagList[27] <= 23'b11111111111111111111111;
  tagList[28] <= 23'b11111111111111111111111;
  tagList[29] <= 23'b11111111111111111111111;
  tagList[30] <= 23'b11111111111111111111111;
  tagList[31] <= 23'b11111111111111111111111;

  dirtyBits[0] <= 0;
  dirtyBits[1] <= 0;
  dirtyBits[2] <= 0;
  dirtyBits[3] <= 0;
  dirtyBits[4] <= 0;
  dirtyBits[5] <= 0;
  dirtyBits[6] <= 0;
  dirtyBits[7] <= 0;
  dirtyBits[8] <= 0;
  dirtyBits[9] <= 0;
  dirtyBits[10] <= 0;
  dirtyBits[11] <= 0;
  dirtyBits[12] <= 0;
  dirtyBits[13] <= 0;
  dirtyBits[14] <= 0;
  dirtyBits[15] <= 0;
  dirtyBits[16] <= 0;
  dirtyBits[17] <= 0;
  dirtyBits[18] <= 0;
  dirtyBits[19] <= 0;
  dirtyBits[20] <= 0;
  dirtyBits[21] <= 0;
  dirtyBits[22] <= 0;
  dirtyBits[23] <= 0;
  dirtyBits[24] <= 0;
  dirtyBits[25] <= 0;
  dirtyBits[26] <= 0;
  dirtyBits[27] <= 0;
  dirtyBits[28] <= 0;
  dirtyBits[29] <= 0;
  dirtyBits[30] <= 0;
  dirtyBits[31] <= 0;
end

endmodule
  
module dcache(
  input clk,
  input [31:0] data_in, //Input data to write 
  input [63:0] data_mem, //Full line (from memory)
  input [4:0] idx, //Line on the cache
  input [4:0] fidx, //Line on the cache
  input [2:0] idb, //Byte on the line
  input we, //Write enabled (miss and store)
  input fill, //Fill from memory
  input word, //Read byte
  output[31:0] data_out,
  output[63:0] data_mem_in //Evictions
);

 reg[7:0] data[31:0][7:0]; 
 
 assign data_out[7:0] = data[idx][idb];
 assign data_out[15:8] = (word)?data[idx][idb+1]:{8{data[idx][idb][7]}};
 assign data_out[23:16] = (word)?data[idx][idb+2]:{8{data[idx][idb][7]}};
 assign data_out[31:24] = (word)?data[idx][idb+3]:{8{data[idx][idb][7]}};

 assign data_mem_in[7:0] = data[idx][0];
 assign data_mem_in[15:8] = data[idx][1]; 
 assign data_mem_in[23:16] = data[idx][2]; 
 assign data_mem_in[31:24] = data[idx][3];
 assign data_mem_in[39:32] = data[idx][4];
 assign data_mem_in[47:40] = data[idx][5];
 assign data_mem_in[55:48] = data[idx][6];
 assign data_mem_in[63:56] = data[idx][7];

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
      data[fidx][0] <= data_mem[7:0];
      data[fidx][1] <= data_mem[15:8];
      data[fidx][2] <= data_mem[23:16];
      data[fidx][3] <= data_mem[31:24];
      data[fidx][4] <= data_mem[39:32];
      data[fidx][5] <= data_mem[47:40];
      data[fidx][6] <= data_mem[55:48];
      data[fidx][7] <= data_mem[63:56];
    end
 end

endmodule

module icache(
  input clk,
  input [63:0] data_mem, //Full line (from memory)
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
      data[idx][0] <= data_mem[7:0];
      data[idx][1] <= data_mem[15:8];
      data[idx][2] <= data_mem[23:16];
      data[idx][3] <= data_mem[31:24];
      data[idx][4] <= data_mem[39:32];
      data[idx][5] <= data_mem[47:40];
      data[idx][6] <= data_mem[55:48];
      data[idx][7] <= data_mem[63:56];
    end
 end

 initial begin 
    data[0][0] <= 8'b11111111;
    data[0][1] <= 8'b11111111;
    data[0][2] <= 8'b11111111;
    data[0][3] <= 8'b11111111;
    data[0][4] <= 8'b11111111;
    data[0][5] <= 8'b11111111;
    data[0][6] <= 8'b11111111;
    data[0][7] <= 8'b11111111;
    data[1][0] <= 8'b11111111;
    data[1][1] <= 8'b11111111;
    data[1][2] <= 8'b11111111;
    data[1][3] <= 8'b11111111;
    data[1][4] <= 8'b11111111;
    data[1][5] <= 8'b11111111;
    data[1][6] <= 8'b11111111;
    data[1][7] <= 8'b11111111;
    data[2][0] <= 8'b11111111;
    data[2][1] <= 8'b11111111;
    data[2][2] <= 8'b11111111;
    data[2][3] <= 8'b11111111;
    data[2][4] <= 8'b11111111;
    data[2][5] <= 8'b11111111;
    data[2][6] <= 8'b11111111;
    data[2][7] <= 8'b11111111;
    data[3][0] <= 8'b11111111;
    data[3][1] <= 8'b11111111;
    data[3][2] <= 8'b11111111;
    data[3][3] <= 8'b11111111;
    data[3][4] <= 8'b11111111;
    data[3][5] <= 8'b11111111;
    data[3][6] <= 8'b11111111;
    data[3][7] <= 8'b11111111;
    data[4][0] <= 8'b11111111;
    data[4][1] <= 8'b11111111;
    data[4][2] <= 8'b11111111;
    data[4][3] <= 8'b11111111;
    data[4][4] <= 8'b11111111;
    data[4][5] <= 8'b11111111;
    data[4][6] <= 8'b11111111;
    data[4][7] <= 8'b11111111;
    data[5][0] <= 8'b11111111;
    data[5][1] <= 8'b11111111;
    data[5][2] <= 8'b11111111;
    data[5][3] <= 8'b11111111;
    data[5][4] <= 8'b11111111;
    data[5][5] <= 8'b11111111;
    data[5][6] <= 8'b11111111;
    data[5][7] <= 8'b11111111;
    data[6][0] <= 8'b11111111;
    data[6][1] <= 8'b11111111;
    data[6][2] <= 8'b11111111;
    data[6][3] <= 8'b11111111;
    data[6][4] <= 8'b11111111;
    data[6][5] <= 8'b11111111;
    data[6][6] <= 8'b11111111;
    data[6][7] <= 8'b11111111;
    data[7][0] <= 8'b11111111;
    data[7][1] <= 8'b11111111;
    data[7][2] <= 8'b11111111;
    data[7][3] <= 8'b11111111;
    data[7][4] <= 8'b11111111;
    data[7][5] <= 8'b11111111;
    data[7][6] <= 8'b11111111;
    data[7][7] <= 8'b11111111;
    data[8][0] <= 8'b11111111;
    data[8][1] <= 8'b11111111;
    data[8][2] <= 8'b11111111;
    data[8][3] <= 8'b11111111;
    data[8][4] <= 8'b11111111;
    data[8][5] <= 8'b11111111;
    data[8][6] <= 8'b11111111;
    data[8][7] <= 8'b11111111;
    data[9][0] <= 8'b11111111;
    data[9][1] <= 8'b11111111;
    data[9][2] <= 8'b11111111;
    data[9][3] <= 8'b11111111;
    data[9][4] <= 8'b11111111;
    data[9][5] <= 8'b11111111;
    data[9][6] <= 8'b11111111;
    data[9][7] <= 8'b11111111;
    data[10][0] <= 8'b11111111;
    data[10][1] <= 8'b11111111;
    data[10][2] <= 8'b11111111;
    data[10][3] <= 8'b11111111;
    data[10][4] <= 8'b11111111;
    data[10][5] <= 8'b11111111;
    data[10][6] <= 8'b11111111;
    data[10][7] <= 8'b11111111;
    data[11][0] <= 8'b11111111;
    data[11][1] <= 8'b11111111;
    data[11][2] <= 8'b11111111;
    data[11][3] <= 8'b11111111;
    data[11][4] <= 8'b11111111;
    data[11][5] <= 8'b11111111;
    data[11][6] <= 8'b11111111;
    data[11][7] <= 8'b11111111;
    data[12][0] <= 8'b11111111;
    data[12][1] <= 8'b11111111;
    data[12][2] <= 8'b11111111;
    data[12][3] <= 8'b11111111;
    data[12][4] <= 8'b11111111;
    data[12][5] <= 8'b11111111;
    data[12][6] <= 8'b11111111;
    data[12][7] <= 8'b11111111;
    data[13][0] <= 8'b11111111;
    data[13][1] <= 8'b11111111;
    data[13][2] <= 8'b11111111;
    data[13][3] <= 8'b11111111;
    data[13][4] <= 8'b11111111;
    data[13][5] <= 8'b11111111;
    data[13][6] <= 8'b11111111;
    data[13][7] <= 8'b11111111;
    data[14][0] <= 8'b11111111;
    data[14][1] <= 8'b11111111;
    data[14][2] <= 8'b11111111;
    data[14][3] <= 8'b11111111;
    data[14][4] <= 8'b11111111;
    data[14][5] <= 8'b11111111;
    data[14][6] <= 8'b11111111;
    data[14][7] <= 8'b11111111;
    data[15][0] <= 8'b11111111;
    data[15][1] <= 8'b11111111;
    data[15][2] <= 8'b11111111;
    data[15][3] <= 8'b11111111;
    data[15][4] <= 8'b11111111;
    data[15][5] <= 8'b11111111;
    data[15][6] <= 8'b11111111;
    data[15][7] <= 8'b11111111;
    data[16][0] <= 8'b11111111;
    data[16][1] <= 8'b11111111;
    data[16][2] <= 8'b11111111;
    data[16][3] <= 8'b11111111;
    data[16][4] <= 8'b11111111;
    data[16][5] <= 8'b11111111;
    data[16][6] <= 8'b11111111;
    data[16][7] <= 8'b11111111;
    data[17][0] <= 8'b11111111;
    data[17][1] <= 8'b11111111;
    data[17][2] <= 8'b11111111;
    data[17][3] <= 8'b11111111;
    data[17][4] <= 8'b11111111;
    data[17][5] <= 8'b11111111;
    data[17][6] <= 8'b11111111;
    data[17][7] <= 8'b11111111;
    data[18][0] <= 8'b11111111;
    data[18][1] <= 8'b11111111;
    data[18][2] <= 8'b11111111;
    data[18][3] <= 8'b11111111;
    data[18][4] <= 8'b11111111;
    data[18][5] <= 8'b11111111;
    data[18][6] <= 8'b11111111;
    data[18][7] <= 8'b11111111;
    data[19][0] <= 8'b11111111;
    data[19][1] <= 8'b11111111;
    data[19][2] <= 8'b11111111;
    data[19][3] <= 8'b11111111;
    data[19][4] <= 8'b11111111;
    data[19][5] <= 8'b11111111;
    data[19][6] <= 8'b11111111;
    data[19][7] <= 8'b11111111;
    data[20][0] <= 8'b11111111;
    data[20][1] <= 8'b11111111;
    data[20][2] <= 8'b11111111;
    data[20][3] <= 8'b11111111;
    data[20][4] <= 8'b11111111;
    data[20][5] <= 8'b11111111;
    data[20][6] <= 8'b11111111;
    data[20][7] <= 8'b11111111;
    data[21][0] <= 8'b11111111;
    data[21][1] <= 8'b11111111;
    data[21][2] <= 8'b11111111;
    data[21][3] <= 8'b11111111;
    data[21][4] <= 8'b11111111;
    data[21][5] <= 8'b11111111;
    data[21][6] <= 8'b11111111;
    data[21][7] <= 8'b11111111;
    data[22][0] <= 8'b11111111;
    data[22][1] <= 8'b11111111;
    data[22][2] <= 8'b11111111;
    data[22][3] <= 8'b11111111;
    data[22][4] <= 8'b11111111;
    data[22][5] <= 8'b11111111;
    data[22][6] <= 8'b11111111;
    data[22][7] <= 8'b11111111;
    data[23][0] <= 8'b11111111;
    data[23][1] <= 8'b11111111;
    data[23][2] <= 8'b11111111;
    data[23][3] <= 8'b11111111;
    data[23][4] <= 8'b11111111;
    data[23][5] <= 8'b11111111;
    data[23][6] <= 8'b11111111;
    data[23][7] <= 8'b11111111;
    data[24][0] <= 8'b11111111;
    data[24][1] <= 8'b11111111;
    data[24][2] <= 8'b11111111;
    data[24][3] <= 8'b11111111;
    data[24][4] <= 8'b11111111;
    data[24][5] <= 8'b11111111;
    data[24][6] <= 8'b11111111;
    data[24][7] <= 8'b11111111;
    data[25][0] <= 8'b11111111;
    data[25][1] <= 8'b11111111;
    data[25][2] <= 8'b11111111;
    data[25][3] <= 8'b11111111;
    data[25][4] <= 8'b11111111;
    data[25][5] <= 8'b11111111;
    data[25][6] <= 8'b11111111;
    data[25][7] <= 8'b11111111;
    data[26][0] <= 8'b11111111;
    data[26][1] <= 8'b11111111;
    data[26][2] <= 8'b11111111;
    data[26][3] <= 8'b11111111;
    data[26][4] <= 8'b11111111;
    data[26][5] <= 8'b11111111;
    data[26][6] <= 8'b11111111;
    data[26][7] <= 8'b11111111;
    data[27][0] <= 8'b11111111;
    data[27][1] <= 8'b11111111;
    data[27][2] <= 8'b11111111;
    data[27][3] <= 8'b11111111;
    data[27][4] <= 8'b11111111;
    data[27][5] <= 8'b11111111;
    data[27][6] <= 8'b11111111;
    data[27][7] <= 8'b11111111;
    data[28][0] <= 8'b11111111;
    data[28][1] <= 8'b11111111;
    data[28][2] <= 8'b11111111;
    data[28][3] <= 8'b11111111;
    data[28][4] <= 8'b11111111;
    data[28][5] <= 8'b11111111;
    data[28][6] <= 8'b11111111;
    data[28][7] <= 8'b11111111;
    data[29][0] <= 8'b11111111;
    data[29][1] <= 8'b11111111;
    data[29][2] <= 8'b11111111;
    data[29][3] <= 8'b11111111;
    data[29][4] <= 8'b11111111;
    data[29][5] <= 8'b11111111;
    data[29][6] <= 8'b11111111;
    data[29][7] <= 8'b11111111;
    data[30][0] <= 8'b11111111;
    data[30][1] <= 8'b11111111;
    data[30][2] <= 8'b11111111;
    data[30][3] <= 8'b11111111;
    data[30][4] <= 8'b11111111;
    data[30][5] <= 8'b11111111;
    data[30][6] <= 8'b11111111;
    data[30][7] <= 8'b11111111;
    data[31][0] <= 8'b11111111;
    data[31][1] <= 8'b11111111;
    data[31][2] <= 8'b11111111;
    data[31][3] <= 8'b11111111;
    data[31][4] <= 8'b11111111;
    data[31][5] <= 8'b11111111;
    data[31][6] <= 8'b11111111;
    data[31][7] <= 8'b11111111;
 end

endmodule

 module TLB(
  input clk, 
  input [21:0] virtual, 
  output [21:0] physical, 
  output exception
);
  // Page size: 2^16.
  wire[2:0] match;
  reg [43:0] translations[3:0];

  assign match = (translations[0][43:22]==virtual)?2'd0:
  (translations[1][43:22]==virtual)?2'd1:
  (translations[2][43:22]==virtual)?2'd2:2'd3;

  assign exception = (translations[0][43:22] != virtual) &
    (translations[1][43:22] != virtual)&
    (translations[2][43:22] != virtual)&
    (translations[3][43:22] != virtual);

  assign physical = translations[match][21:0];

  initial
  begin
    translations[0] <= 0;
    translations[1] <= 0;
    translations[2] <= 0;
    translations[3] <= 0;
  end
    
endmodule