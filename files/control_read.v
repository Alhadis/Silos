/******************************************************************************
 * File: control_read.v
 * Author: Alex Papanicolaou
 * Date Created: Original 2007, modifications November 2013
 * Purpose: Implements the control of the multicycle processor. See project
 *    documentation for details.
 *****************************************************************************/
 
 module control_read (
     input [3:0] instr,
     input en_read,
     output reg ir2_load, r1r2_load, r1_sel);
     
  /* Define constants for the different possible opcodes. */
  parameter [2:0] i_shift = 3, i_ori = 7;
  parameter [3:0] i_add = 4, i_subtract = 6, i_nand = 8, i_load = 0,
	  i_store = 2, i_nop = 10, i_stop = 1, i_bpz = 13, i_bz = 5, i_bnz = 9;  
    
  always @(*) begin
    if(~en_read) begin
      r1_sel = 0;
      r1r2_load = 0;
      ir2_load = 0;
    end
    else if(instr[2:0] == i_shift) begin
      r1_sel = 0;
      r1r2_load = 1;
      ir2_load = 1;
    end
    else if(instr[2:0] == i_ori) begin
      r1_sel = 1;
      r1r2_load = 1;
      ir2_load = 1;
    end
    else if(instr == i_add | instr == i_subtract | instr == i_nand) begin
      r1_sel = 0;
      r1r2_load = 1;
      ir2_load = 1;
    end
    else if(instr == i_load | instr == i_store) begin
      r1_sel = 0;
      r1r2_load = 1;
      ir2_load = 1;
    end
    else if(instr == i_nop | instr == i_bz | instr == i_bpz | instr == i_bnz) begin
      r1_sel = 0;
      r1r2_load = 0;
      ir2_load = 1;
    end
    else if(instr == i_stop) begin
      r1_sel = 0;
      r1r2_load = 0;
      ir2_load = 0;
    end
    else begin
      r1_sel = 0;
      r1r2_load = 0;
      ir2_load = 1;
    end
  end
endmodule