/******************************************************************************
 * File: control_exec.v
 * Author: Alex Papanicolaou
 * Date Created: Original 2007, modifications November 2013
 * Purpose: Implements the control of the multicycle processor. See project
 *    documentation for details.
 *****************************************************************************/
 
 module control_exec (
     input [3:0] instr,
     input en_exec, bypass_ALU1, bypass_ALU2,
     output reg ir3_load, mem_read, mem_write, mdr_load,
     output reg flag_write, alu_out_write,
     output reg [1:0] alu1,
     output reg [2:0] alu_2, alu_op,
     output reg reg_in);
     
  /* Define constants for the different possible opcodes. */
  parameter [2:0] i_shift = 3, i_ori = 7;
  parameter [3:0] i_add = 4, i_subtract = 6, i_nand = 8, i_load = 0,
	  i_store = 2, i_nop = 10, i_stop = 1, i_bpz = 13, i_bz = 5, i_bnz = 9;
    
  /* Define constants for different ALU operation modes. */
  parameter [2:0] aluop_add = 3'b000, aluop_sub = 3'b001, aluop_or = 3'b010,
      aluop_nand = 3'b011, aluop_shift = 3'b100;

  /* Define constants for the ALU1 mux inputs. */
  parameter [1:0] ALU1_PC3 = 2'b00, ALU1_R1 = 2'b01, ALU1_ALUOUT = 2'b10;

  /* Define constants for the ALU2 mux inputs. */
  parameter [2:0] ALU2_R2 = 3'b000, ALU2_ALUOUT = 3'b001, ALU2_IMM4 = 3'b010,
      ALU2_IMM5 = 3'b011, ALU2_IMM3 = 3'b100;
  
  always @(*) begin
    if(~en_exec) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      alu_2 = ALU2_R2;
      alu_op = aluop_add;
      alu_out_write = 0;
      ir3_load = 0;
      flag_write = 0;
      alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr[2:0] == i_shift) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      alu_2 = ALU2_IMM3;
      alu_op = aluop_shift;
      alu_out_write = 1;
      ir3_load = 1;
      flag_write = 1;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr[2:0] == i_ori) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      alu_2 = ALU2_IMM5;
      alu_op = aluop_or;
      alu_out_write = 1;
      ir3_load = 1;
      flag_write = 1;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr == i_add) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      if (bypass_ALU2) alu_2 = ALU2_ALUOUT; else alu_2 = ALU2_R2;
      alu_op = aluop_add;
      alu_out_write = 1;
      ir3_load = 1;
      flag_write = 1;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr == i_subtract) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      if (bypass_ALU2) alu_2 = ALU2_ALUOUT; else alu_2 = ALU2_R2;
      alu_op = aluop_sub;
      alu_out_write = 1;
      ir3_load = 1;
      flag_write = 1;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr == i_nand) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      if (bypass_ALU2) alu_2 = ALU2_ALUOUT; else alu_2 = ALU2_R2;
      alu_op = aluop_nand;
      alu_out_write = 1;
      ir3_load = 1;
      flag_write = 1;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr == i_load) begin
      mem_read = 1;
      mem_write = 0;
      mdr_load = 1;
      if (bypass_ALU2) alu_2 = ALU2_ALUOUT; else alu_2 = ALU2_R2;
      alu_op = aluop_or;
      alu_out_write = 1;
      ir3_load = 1;
      flag_write = 0;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 1;
    end
    else if(instr == i_store) begin
      mem_read = 0;
      mem_write = 1;
      mdr_load = 0;
      if (bypass_ALU2) alu_2 = ALU2_ALUOUT; else alu_2 = ALU2_R2;
      alu_op = aluop_or;
      alu_out_write = 0;
      ir3_load = 1;
      flag_write = 0;
      if (bypass_ALU1) alu1 = ALU1_ALUOUT; else alu1 = ALU1_R1;
      reg_in = 0;
    end
    else if(instr == i_nop | instr == i_bz | instr == i_bpz | instr == i_bnz) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      alu_2 = ALU2_IMM4;
      alu_op = aluop_add;
      alu_out_write = 0;
      ir3_load = 1;
      flag_write = 0;
      alu1 = ALU1_PC3; // Use PC3out to calculate branch target.
      reg_in = 0;
    end
    else if(instr == i_stop) begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      alu_2 = ALU2_R2;
      alu_op = aluop_or;
      alu_out_write = 0;
      ir3_load = 0;
      flag_write = 0;
      alu1 = ALU1_R1;
      reg_in = 0;
    end
    else begin
      mem_read = 0;
      mem_write = 0;
      mdr_load = 0;
      alu_2 = ALU2_R2;
      alu_op = aluop_or;
      alu_out_write = 0;
      ir3_load = 1;
      flag_write = 0;
      alu1 = ALU1_R1;
      reg_in = 0;
    end
  end
endmodule
