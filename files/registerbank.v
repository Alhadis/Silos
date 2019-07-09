module register_bank(
  input clk, 
  input we, 
  
  input [4:0] rs,
  input [4:0] rt,
  input [4:0] rd,

  input [31:0] rd_data, 
  output [31:0] rs_data,
  output [31:0] rt_data   
);
  
  reg [31:0]regs [31:0];

  assign rs_data = regs[rs];
  assign rt_data = regs[rt];
  
  always @(posedge clk)
  // Write register.
  begin
    if(we)
    begin
      regs[rd] <= rd_data; 
    end
  end

  initial begin
    regs[0] <= 32'd0;
    regs[1] <= 32'd0;
    regs[2] <= 32'd0;
    regs[3] <= 32'd0;
    regs[4] <= 32'd0;
    regs[5] <= 32'd0;
    regs[6] <= 32'd0;
    regs[7] <= 32'd0;
    regs[8] <= 32'd0;
    regs[9] <= 32'd0;
    regs[10] <= 32'd0;
    regs[11] <= 32'd0;
    regs[12] <= 32'd0;
    regs[13] <= 32'd0;
    regs[14] <= 32'd0;
    regs[15] <= 32'd0;
    regs[16] <= 32'd0;
    regs[17] <= 32'd0;
    regs[18] <= 32'd0;
    regs[19] <= 32'd0;
    regs[20] <= 32'd0;
    regs[21] <= 32'd0;
    regs[22] <= 32'd0;
    regs[23] <= 32'd0;
    regs[24] <= 32'd0;
    regs[25] <= 32'd0;
    regs[26] <= 32'd0;
    regs[27] <= 32'd0;
    regs[28] <= 32'd0;
    regs[29] <= 32'd0;
    regs[30] <= 32'd0;
    regs[31] <= 32'd0;
  end
endmodule
