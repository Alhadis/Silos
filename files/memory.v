// External data memory. If rdWrt is set, we write. Read otherwise.
module dataMem(input [31:0]addr, [31:0]wrtData, rdWrt, output reg [31:0]data);
  // 1 byte at each address.
  reg [31:0] mem[7:0];
  
  // Write
  always @(addr, wrtData, rdWrt)
  begin
    mem[addr] = wrtData;
  end
  
  // Read
  always @(addr, rdWrt)
  begin
    if (!rdWrt)
      data = mem[addr];
  end
endmodule

// Instruction memory.
module insMem(input [31:0]pc, output reg [15:0]ins);
  reg [2^32-1:0] mem[15:0];
  
  always @(pc)
  begin
    ins = mem[pc];
  end
endmodule