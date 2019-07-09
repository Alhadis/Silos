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
endmodule
