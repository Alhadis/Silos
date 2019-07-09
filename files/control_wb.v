/******************************************************************************
 * File: control_wb.v
 * Author: Patrick Payne
 * Date Created: Nov 09, 2013
 * Purpose: Implements the control circuitry for the writeback stage of the
 *  pipelined processor. Produces the control signals rf_write, ir4_load,
 *  and reg_in. We also produce a stop signal for the performance counter.
 *****************************************************************************/

module control_wb (
    input [3:0] opcode,
    input en_wb,
    output reg rf_write, ir4_load, regw_sel, stop);

  /* Define constants for the different possible opcodes. */
  parameter [2:0] i_shift = 3, i_ori = 7;
  parameter [3:0] i_add = 4, i_subtract = 6, i_nand = 8, i_load = 0,
	  i_store = 2, i_bpz = 13, i_bz = 5, i_bnz = 9, i_nop = 10, i_stop = 1;

  always @(*) begin
    if (~en_wb) begin
      rf_write = 0;
      ir4_load = 0;
      regw_sel = 0;
      stop = 0;
    end
    else if (opcode[2:0] == i_shift) begin
      rf_write = 1;
      ir4_load = 1;
      regw_sel = 0;
      stop = 0;
    end
    else if(opcode[2:0] == i_ori) begin
      rf_write = 1;
      ir4_load = 1;
      regw_sel = 1;
      stop = 0;
    end
    else if ((opcode == i_add)|(opcode == i_subtract)|(opcode == i_nand)) begin
      rf_write = 1;
      ir4_load = 1;
      regw_sel = 0;
      stop = 0;
    end
    else if (opcode == i_load) begin
      rf_write = 1;
      ir4_load = 1;
      regw_sel = 0;
      stop = 0;
    end
    else if (opcode == i_stop) begin
      rf_write = 0;
      ir4_load = 0;
      regw_sel = 0;
      stop = 1;
    end
    else begin
      rf_write = 0;
      ir4_load = 1;
      regw_sel = 0;
      stop = 0;
    end
  end
endmodule
