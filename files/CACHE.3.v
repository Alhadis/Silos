// build a cache module
module CACHE
  (
    clk,
    rst,
    cache_read,
    cache_write,
    address,
    cache_readdata,
    cache_writedata,
		SRAMaddress,
		SRAMWEn,
		SRAMdata,
		MEM_NOT_READY
  );

  parameter data_lenght = 65536; // 2 ^ 16
  parameter data_width = 32;
  parameter cache_lenght = 4;
  localparam cache_width = data_width + ($clog2(data_lenght) - $clog2(cache_lenght)) + 1;

  input clk;
  input rst;
  input cache_read;
  input cache_write;
  input [$clog2(data_lenght)-1:0] address;
  input [data_width-1:0] cache_writedata;
  output [data_width-1:0] cache_readdata;
  output SRAMWEn;
  output MEM_NOT_READY;
  output [17:0] SRAMaddress;
  inout [15:0] SRAMdata;

  wire need_sram_for_read;
  wire need_sram_for_write;
  wire [31:0] SRAM_readdata;
  reg LRU [cache_lenght-1:0];
  reg [cache_width-1:0] cache1 [cache_lenght-1:0];
  reg [cache_width-1:0] cache2 [cache_lenght-1:0];
  wire [$clog2(cache_lenght)-1:0] cache_address;
  wire valid1;
  wire valid2;
  wire foundIn1;
  wire foundIn2;
  wire [$clog2(data_lenght) - $clog2(cache_lenght) - 1:0] tag1;
  wire [$clog2(data_lenght) - $clog2(cache_lenght) - 1:0] tag2;
  wire [$clog2(data_lenght) - $clog2(cache_lenght) - 1:0] tag_address;
  integer i;

  assign cache_address = address[$clog2(cache_lenght)-1:0];
  assign valid1 = cache1[cache_address][cache_width-1];
  assign valid2 = cache2[cache_address][cache_width-1];
  assign tag1 = cache1[cache_address][cache_width-2:data_width];
  assign tag2 = cache2[cache_address][cache_width-2:data_width];
  assign tag_address = address[$clog2(data_lenght)-1:$clog2(cache_lenght)];

  assign foundIn1 = valid1 & !(tag1 ^ tag_address);
  assign foundIn2 = valid2 & !(tag2 ^ tag_address);

  always @(posedge clk)
  begin
    if(rst)
    begin
      for(i=0; i<cache_lenght; i=i+1)
      begin
        LRU[i] <= 1'b0;
        cache1[i] <= {cache_width{1'b0}};
        cache2[i] <= {cache_width{1'b0}};
      end
    end
    else
    begin
      if(cache_write & ~MEM_NOT_READY)
      begin
        if(LRU[cache_address] | foundIn2)
        begin
          cache2[cache_address] <= {1'b1, tag_address, cache_writedata};
          LRU[cache_address] <= 1'b0;
        end
        else
        begin
          cache1[cache_address] <= {1'b1, tag_address, cache_writedata};
          LRU[cache_address] <= 1'b1;
        end
      end
      else if(cache_read & ~MEM_NOT_READY)
      begin
        if(foundIn1)
        begin
          LRU[cache_address] <= 1'b1;
        end
        else if(foundIn2)
        begin
          LRU[cache_address] <= 1'b0;
        end
        else
        begin
          if(LRU[cache_address])
          begin
            cache2[cache_address] <= {1'b1, tag_address, SRAM_readdata};
            LRU[cache_address] <= 1'b0;
          end
          else
          begin
            cache1[cache_address] <= {1'b1, tag_address, SRAM_readdata};
            LRU[cache_address] <= 1'b1;
          end
        end
      end
    end
  end

  assign cache_readdata = foundIn1 ? cache1[cache_address][data_width-1:0] :
                          foundIn2 ? cache2[cache_address][data_width-1:0] :
                          cache_read ? SRAM_readdata : {32{1'bx}};

  assign need_sram_for_read = ~(foundIn1 | foundIn2) & cache_read;
  assign need_sram_for_write = cache_write;

SRAM_CTR sram // on chip SRAM
(
  .clk(clk),
  .rst(rst),
  .MEM_R_EN(need_sram_for_read),
  .MEM_W_EN(need_sram_for_write),
  .SRAMaddress(SRAMaddress),
  .SRAMWEn(SRAMWEn),
  .SRAMdata(SRAMdata),
  .SRAM_NOT_READY(MEM_NOT_READY),
  .writeData(cache_writedata),
  .address(address),
  .readData(SRAM_readdata)
);

endmodule
