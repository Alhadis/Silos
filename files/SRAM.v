
module SRAM
  (
    clk,
    rst,
    write,
    address,
    data
  );

  parameter data_lenght = 262144; // 2 ^ 18
  parameter data_width = 16;

  input clk;
  input rst;
  input write;
  input [$clog2(data_lenght)-1:0] address;
  inout [data_width-1:0] data;

  reg [data_width-1:0] sram[data_lenght-1:0];
  reg [data_width-1:0] data_out;

  always @(posedge clk)
  begin
      if(rst)
      begin
        data_out <= 16'b0;
      end
      else
      begin
        if(write)
        begin
          data_out <= sram [address];
        end
        else
        begin
          sram [address] <= data;
        end
      end
  end

  assign data = (write) ? data_out : {16{1'bz}};

endmodule
