/*
 *******************************************************************************
 *  File Name   :   ada_memwb_stage.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 8th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Pipeline register: from Memory Access to Write Back
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_memwb_stage(
    input               clk,        // main clock
    input               rst,        // main reset
    input       [31:0]  mem_gpr_wd, // data to GPR
    input       [4:0]   mem_gpr_wa, // GPR write address
    input               mem_gpr_we, // GPR write enable
    input               mem_flush,  // flush MEM stage
    input               mem_stall,  // stall MEM stage
    input               wb_stall,   // stall WB stage
    output  reg [31:0]  wb_gpr_wd,  // data to GPR
    output  reg [4:0]   wb_gpr_wa,  // GPR write address
    output  reg         wb_gpr_we   // GPR write enable
    );

    //--------------------------------------------------------------------------
    // Propagate signals
    // Stall WB only if MEM is stalled, and MEM needs data forwarded from WB.
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        wb_gpr_wd <= (rst) ? 31'b0 : ((wb_stall) ? wb_gpr_wd                                  : mem_gpr_wd);
        wb_gpr_wa <= (rst) ? 5'b0  : ((wb_stall) ? wb_gpr_wa :((mem_stall | mem_flush) ? 5'b0 : mem_gpr_wa));
        wb_gpr_we <= (rst) ? 1'b0  : ((wb_stall) ? wb_gpr_we :((mem_stall | mem_flush) ? 1'b0 : mem_gpr_we));
    end
endmodule
