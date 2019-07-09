/*
 *******************************************************************************
 *  File Name   :   ada_iaif_stage.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 8th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Pipeline register: from Instruction Address to Instruction
 *                  Fetch
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_iaif_stage(
    input               clk,        // main clock
    input               rst,        // main reset
    input       [31:0]  pc_in,      // New PC.
    input               if_stall,   // Stall signal
    output  reg [31:0]  pc_out      // PC to IF stage
    );

    //--------------------------------------------------------------------------
    // A simple register
    // Do not update PC if IF stage is stalled.
    //--------------------------------------------------------------------------
    always @(posedge clk ) begin
        pc_out <= (rst) ? `ADA_RESET_DEFAULT : ((if_stall) ? pc_out : pc_in);
    end
endmodule
