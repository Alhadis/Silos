
`timescale 10ns/1ns
module SimCPU;
  reg CLOCK;
  reg SW1;
  wire [31:0] instructionMemory;
  wire [6:0] currentAddress;
  wire [31:0] result;
  wire [6:0] addressResult;
  
  Fetch grab(CLOCK, instructionMemory, SW1);
  DecodeExecute decode(CLOCK, instructionMemory, SW1, result , addressResult);
  
  initial begin 
    CLOCK = 0;
    #1 SW1 = 1;
  end
  
  
  
  always begin
    #5 CLOCK = ~CLOCK;
  end
  
  
  
endmodule