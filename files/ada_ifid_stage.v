/*
 *******************************************************************************
 *  File Name   :   ada_ifid_stage.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 8th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Pipeline register: from Instruction Fetch to Instruction
 *                  Decode
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_ifid_stage(
    input               clk,            // main clock
    input               rst,            // main reset
    input       [31:0]  if_instruction, // Instruction from IF
    input       [31:0]  if_pc_current,  // PC from IF
    input       [31:0]  if_pc_add4,     // PC + 1 from IF
    input               if_stall,       // Stall IF
    input               if_flush,       // Flush IF
    input               id_stall,       // Stall ID
    input               if_is_ds,       // this instruction is a Branch Delay Slot
    output  reg [31:0]  id_instruction, // ID instruction
    output  reg [31:0]  id_pc_current,  // PC to ID
    output  reg [31:0]  id_pc_add4,     // PC + 1 to ID
    //output  reg         id_is_ds ,      // this instruction is a Branch Delay Slot.
    output  reg         id_is_flushed   // this instruction is discarded.
    );

    //--------------------------------------------------------------------------
    // In case of a stall/flush, use the current PC as address for the generated
    // NOP instruction, so in case of an interrupt, use it as the return address.
    //
    // xx_is_flushed is used to ignore the instruction at ID in case of interrupt.
    //
    // The signal xx_is_ds  indicates "bubbles" in the pipeline. In that case,
    // keep the last PC (the branch instruction), so in an interrupt occurs, the
    // instruction to restart is the branch, not the "bubble" a.k.a. Branch Delay
    // Slot.
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        id_instruction <= (rst) ? 32'b0 : ((id_stall)             ? id_instruction : ((if_stall | if_flush| if_is_ds ) ? 32'b0 : if_instruction));
        id_pc_current  <= (rst) ? 32'b0 : ((id_stall | if_is_ds ) ? id_pc_current                                              : if_pc_current);
        id_pc_add4     <= (rst) ? 32'b0 : ((id_stall)             ? id_pc_add4     : ((if_stall | if_flush| if_is_ds ) ? 32'b0 : if_pc_add4));
        //id_is_ds       <= (rst) ? 1'b0  : ((id_stall)             ? id_is_ds                                                   : if_is_ds );
        id_is_flushed  <= (rst) ? 1'b0  : ((id_stall)             ? id_is_flushed                                              : if_flush);
    end
endmodule
