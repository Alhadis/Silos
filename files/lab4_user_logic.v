`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab4_user_logic
/////////////////////////////////////////////////////////////////

module lab4_user_logic(
    input S_AXI_ACLK,
    input slv_reg_wren,
    input [2:0] axi_awaddr,
    input [31:0] S_AXI_WDATA,
    input S_AXI_ARESETN,
    output reg [3:0] LED
    );
      
  always @( posedge S_AXI_ACLK )
  begin
    if ( S_AXI_ARESETN == 1'b0 )
        LED <= 4'b0;
    else 
      if (slv_reg_wren && (axi_awaddr == 3'h0))
          LED <= S_AXI_WDATA[3:0];
      end
endmodule
