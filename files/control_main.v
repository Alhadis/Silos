/******************************************************************************
 * File: control_main.v
 * Author: Patrick Payne
 * Date Created: Nov 09, 2013
 * Purpose: Implements the control circuitry for the writeback stage of the
 *  pipelined processor. Produces the control signals rf_write, ir4_load,
 *  and reg_in. We also produce a stop signal for the performance counter.
 *****************************************************************************/

module control_main (
    input clock, reset, N, Z,
    input [7:0] ir1, ir2, ir3, ir4,
    output reg ir1_load, ir2_load, ir3_load, ir4_load, branch,
    output reg bypass_R1, bypass_R2, bypass_ALU1, bypass_ALU2,
    output reg en_fetch, en_read, en_exec, en_wb,
    output reg WB_writing);
    
  /* Define constants for the different possible opcodes. */
  parameter [2:0] i_shift = 3, i_ori = 7;
  parameter [3:0] i_add = 4, i_subtract = 6, i_nand = 8, i_load = 0,
	  i_store = 2, i_bpz = 13, i_bz = 5, i_bnz = 9, i_nop = 10, i_stop = 1;
  
  /* Define some parameters for the IR enable state machine. */
  reg [2:0] state;
  parameter [2:0] state_reset = 0, state_1 = 1, state_2 = 2, state_3 = 3,
     state_4 = 4;

  /* Create a reg that says whether the instruction in WB is going to perform
   * a write. Also indicate which register will be written to.
   */
  //reg WB_writing;
  reg [1:0] WB_reg;

  /* Keep loading new IR values until you hit a stop instruction. */
  always @(*) begin
    ir1_load = branch | (ir1[3:0] != i_stop);
    ir2_load = (ir1[3:0] != i_stop) | (ir2[3:0] != i_stop);
    ir3_load = (ir2[3:0] != i_stop) | (ir3[3:0] != i_stop);
    ir4_load = (ir3[3:0] != i_stop) | (ir4[3:0] != i_stop);
  end

  /* Determine whether we are taking a branch. */
  always @(*) begin
    case (ir3[3:0])
      i_bpz: if(N) branch = 0; else branch = 1;
      i_bnz: if(Z) branch = 0; else branch = 1;
      i_bz: if(Z) branch = 1; else branch = 0;
      default: branch = 0;
    endcase
  end
  

  /* Determine if we need to bypass the ALU inputs. We check if the
   * instruction in the EXEC stage needs the value being written back in the
   * WB stage.
   */
  // Preprocess information from the WB stage.
  always @(*) begin
    if (!en_wb) begin
      WB_writing = 0;
      WB_reg = 2'b00;
    end
    else if (ir4[2:0] == i_ori) begin
      WB_writing = 1;
      WB_reg = 2'b01;
    end
    else if ((ir4[2:0] == i_shift) | (ir4[3:0] == i_add) |
             (ir4[3:0] == i_subtract) | (ir4[3:0] == i_nand) | (ir4[3:0] == i_load)) begin
      WB_writing = 1;
      WB_reg = ir4[7:6];
    end
    else begin
      WB_writing = 0;
      WB_reg = 2'b00;
    end
  end

  // Determine if we need to bypass ALU1.
  always @(*) begin
    if (WB_writing) begin
      if ((ir3[2:0] == i_ori) & (WB_reg == 2'b01)) begin
        bypass_ALU1 = 1;
      end
      else if ((ir3[2:0] == i_shift) & (ir3[7:6] == WB_reg)) begin
        bypass_ALU1 = 1;
      end
      else if (((ir3[3:0] == i_add) | (ir3[3:0] == i_subtract) |
               (ir3[3:0] == i_nand) | (ir3[3:0] == i_load))
               & (ir3[7:6] == WB_reg)) begin
          bypass_ALU1 = 1;
      end
      else begin
        bypass_ALU1 = 0;
      end
    end
    else begin
      bypass_ALU1 = 0;
    end
  end

  // Now deal with bypassing ALU2.
  always @(*) begin
    if (((ir3[3:0] == i_add) | (ir3[3:0] == i_subtract) |
        (ir3[3:0] == i_nand) | (ir3[3:0] == i_load) | (ir3[3:0] == i_store))
        & (ir3[5:4] == WB_reg) & (WB_writing)) begin
      bypass_ALU2 = 1;
    end
    else begin
      bypass_ALU2 = 0;
    end
  end
  
  // Determine if we need to bypass R1.
  always @(*) begin
    if (WB_writing) begin
      if ((ir2[2:0] == i_ori) & (WB_reg == 2'b01)) begin
        bypass_R1 = 1;
      end
      else if ((ir2[2:0] == i_shift) & (ir2[7:6] == WB_reg)) begin
        bypass_R1 = 1;
      end
      else if (((ir2[3:0] == i_add) | (ir2[3:0] == i_subtract) |
               (ir2[3:0] == i_nand) | (ir2[3:0] == i_load))
               & (ir2[7:6] == WB_reg)) begin
          bypass_R1 = 1;
      end
      else begin
        bypass_R1 = 0;
      end
    end
    else begin
      bypass_R1 = 0;
    end
  end

  // Now deal with bypassing R2.
  always @(*) begin
    if (((ir2[3:0] == i_add) | (ir2[3:0] == i_subtract) |
        (ir2[3:0] == i_nand) | (ir2[3:0] == i_load) | (ir2[3:0] == i_store))
        & (ir2[5:4] == WB_reg) & (WB_writing)) begin
      bypass_R2 = 1;
    end
    else begin
      bypass_R2 = 0;
    end
  end

  /* Determine next state. */
  always @(posedge clock, posedge reset) begin
    if(reset) begin
      state = state_reset;
    end
    else begin
      if (branch) begin
        // Cannot be in above since branch is not in the sensitivity list.
        state = state_reset;
      end
      else begin
        case(state)
          state_reset: state = state_1;
          state_1: state = state_2;
          state_2: state = state_3;
          state_3: state = state_4;
          state_4: state = state_4;
          default: state = state_reset;
        endcase
      end
    end
  end
  
  /* Produce enable outputs. */
  always @(*) begin
    case(state)
      state_reset: begin
        en_fetch = 1;
        en_read = 0;
        en_exec = 0;
        en_wb = 0;
      end
      state_1: begin
        en_fetch = 1;
        en_read = 0;
        en_exec = 0;
        en_wb = 0;
      end
      state_2: begin
        en_fetch = 1;
        en_read = 1;
        en_exec = 0;
        en_wb = 0;
      end
      state_3: begin
        en_fetch = 1;
        en_read = 1;
        en_exec = 1;
        en_wb = 0;
      end
      state_4: begin
        en_fetch = 1;
        en_read = 1;
        en_exec = 1;
        en_wb = 1;
      end
    endcase
  end
endmodule
