/******************************************************************************
 * File: control_fetch.v
 * Author: Patrick Payne
 * Date Created: Nov 09, 2013
 * Purpose: Implements the control circuitry for the fetch stage of the
 *  pipelined processor. The fetch stage controls the PCSel, PCWrite, and
 *  IR1load signals. It also accepts an input control signal for loading a
 *  target address from a branch instruction.
 *****************************************************************************/

module control_fetch (
    input branch, en_fetch, input [3:0] opcode,
    output reg pc_sel, pc0); 
  
  always @(*) begin 
    if ((branch | (opcode != 4'b1)) & en_fetch) begin
      pc_sel = branch;
      pc0 = 1;
    end
    else begin
      pc0 = 0;
      pc_sel = 0;
    end
  end

endmodule
