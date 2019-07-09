module Memory(MemRead, Mem_Ready, Address, clk, rst, Out_Data);
  input MemRead, clk, rst;
  output reg Mem_Ready;
  input [14:0] Address;
  output reg [127:0] Out_Data;

  reg [15:0] Miss_Count;
  reg [127:0] Memory [0:8191];
  
  integer i;
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      for(i = 0; i < 8192; i = i+1) begin
        Memory[i] <= i;
      end
      Mem_Ready = 0;
    end
    else if(MemRead) begin //   read to Cache
      Out_Data <= Memory[Address[14:2]];
      Miss_Count <= Miss_Count + 1;
      Mem_Ready <= 1;
    end
    else 
      Mem_Ready <= 0;
  end

  always@(MemRead) begin
    if(MemRead) begin
      Mem_Ready = 0;
    end
  end
endmodule


