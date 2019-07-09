module memory(
  input clk, 
  
  input [31:0] iaddr,
  input [31:0] daddr,
  input imiss,
  input dmiss,

  output [63:0] data, 
  output ifill, 
  output dfill,

  input[63:0] data_in,
  input we,
  input[31:0] addr_in
);

  reg tmpdf0, tmpdf1, tmpdf2;
  reg tmpif0, tmpif1, tmpif2;
  reg[63:0] tmpd1, tmpd2;
  reg[31:0] arq;
  
  reg [7:0]bytes [2048:0];

  assign data = tmpd2;
  assign ifill = tmpif2;
  assign dfill = tmpdf2;

  always @(posedge clk)
  // Write register.
  begin
    if(we) begin
      bytes[addr_in] <= data_in[0];
      bytes[addr_in+1] <= data_in[1];  
      bytes[addr_in+2] <= data_in[2];  
      bytes[addr_in+3] <= data_in[3]; 
      bytes[addr_in+4] <= data_in[4]; 
      bytes[addr_in+5] <= data_in[5]; 
      bytes[addr_in+6] <= data_in[6]; 
      bytes[addr_in+7] <= data_in[7]; 
    end

    if(dmiss & !tmpdf1 & !tmpdf0 & !tmpdf2) begin
      arq[31:3] <= daddr[31:3];
      tmpdf0 <= 1;
    end
    else if(imiss & !tmpif1 & !tmpif0 & !tmpif2) begin
      arq[31:3] <= iaddr[31:3];
      tmpif0 <= 1;
    end

    
    tmpd1[7:0] <= bytes[arq];    
    tmpd1[15:8] <= bytes[arq+1];
    tmpd1[23:16] <= bytes[arq+2];
    tmpd1[31:24] <= bytes[arq+3];
    tmpd1[39:32] <= bytes[arq+4];
    tmpd1[47:40] <= bytes[arq+5];
    tmpd1[55:48] <= bytes[arq+6];
    tmpd1[63:56] <= bytes[arq+7];
    tmpd2 <= tmpd1;

    if(tmpif0) begin
      tmpif1 <= tmpif0;
      tmpif0 <= 0;
    end
    if(tmpif1) begin
      tmpif2 <= tmpif1;
      tmpif1 <= 0;
    end
    if(tmpdf0) begin
      tmpdf1 <= tmpdf0;
      tmpdf0 <= 0;
    end
    if(tmpdf1) begin
      tmpdf2 <= tmpdf1;
      tmpdf1 <= 0;
    end
    if(tmpdf2) begin
      tmpdf2 <= 0;
    end
    if(tmpif2) begin
      tmpif2 <= 0;
    end

  end

  initial begin
    arq <= 0;
    tmpd1 <= 0;
    tmpd2 <= 0;
    tmpdf0 <= 0;
    tmpdf1 <= 0; 
    tmpdf2 <= 0;
    tmpif1 <= 0; 
    tmpif2 <= 0;
    tmpif0 <= 0;
    arq <= 32'd0;
  end
endmodule