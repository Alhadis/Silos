/*
 *******************************************************************************
 *  File Name   :   ada_exmem_stage.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 8th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Pipeline register: from Execution to Memory Access
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_exmem_stage(
    input               clk,                    // main clock
    input               rst,                    // main reset
    input       [31:0]  ex_exu_result,          // ALU result
    input       [31:0]  ex_mem_store_data,      // data to memory
    input               ex_mem_write,           // Mem write operation
    input               ex_mem_read,            // Mem read operation
    input               ex_mem_byte,            // byte operation
    input               ex_mem_halfword,        // halfword operation
    input               ex_mem_sign_ext,        // Sign/Zero extend data from memory
    input               ex_mem_exu_mem_select,  // Select data from EX or MEM
    input       [4:0]   ex_gpr_wa,              // GPR write address
    input               ex_gpr_we,              // GPR write enable
    input               ex_kernel_mode,         // kernel mode in the moment of instruction decode
    //input               ex_is_ds,               // this instruction is a BDS
    input       [31:0]  ex_pc_current,          // instruction's PC
    input               ex_mem_can_exc,         // MEM instruction can generate an exception
    input               ex_flush,               // flush EX stage
    input               ex_stall,               // stall EX stage
    input               mem_stall,              // stall MEM stage
    output  reg [31:0]  mem_exu_result,         // ALU result
    output  reg [31:0]  mem_mem_store_data,     // data to memory
    output  reg         mem_mem_write,          // Mem write operation
    output  reg         mem_mem_read,           // Mem read operation
    output  reg         mem_mem_byte,           // byte operation
    output  reg         mem_mem_halfword,       // halfword operation
    output  reg         mem_mem_sign_ext,       // Sign/Zero extend data from memory
    output  reg         mem_mem_exu_mem_select, // Select data from EX or MEM
    output  reg [4:0]   mem_gpr_wa,             // GPR write address
    output  reg         mem_gpr_we,             // GPR write enable
    output  reg         mem_kernel_mode,        // kernel mode in the moment of instruction decode
    //output  reg         mem_is_ds,              // this instruction is a BDS
    output  reg [31:0]  mem_pc_current,         // instruction's PC
    output  reg         mem_mem_can_exc         // MEM instruction can generate an exception
    );

    //--------------------------------------------------------------------------
    // Propagate signals
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        mem_exu_result         <= (rst) ? 32'b0 : ((mem_stall) ? mem_exu_result                                         : ex_exu_result);
        mem_mem_store_data     <= (rst) ? 32'b0 : ((mem_stall) ? mem_mem_store_data                                     : ex_mem_store_data);
        mem_mem_write          <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_write          : ((ex_stall | ex_flush) ? 1'b0 : ex_mem_write));
        mem_mem_read           <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_read           : ((ex_stall | ex_flush) ? 1'b0 : ex_mem_read));
        mem_mem_byte           <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_byte                                           : ex_mem_byte);
        mem_mem_halfword       <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_halfword                                       : ex_mem_halfword);
        mem_mem_sign_ext       <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_sign_ext                                       : ex_mem_sign_ext);
        mem_mem_exu_mem_select <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_exu_mem_select                                 : ex_mem_exu_mem_select);
        mem_gpr_wa             <= (rst) ? 5'b0  : ((mem_stall) ? mem_gpr_wa             : ((ex_stall | ex_flush) ? 5'b0 : ex_gpr_wa));
        mem_gpr_we             <= (rst) ? 1'b0  : ((mem_stall) ? mem_gpr_we             : ((ex_stall | ex_flush) ? 1'b0 : ex_gpr_we));
        mem_kernel_mode        <= (rst) ? 1'b0  : ((mem_stall) ? mem_kernel_mode        : ((ex_stall | ex_flush) ? 1'b0 : ex_kernel_mode));
        //mem_is_ds              <= (rst) ? 1'b0  : ((mem_stall) ? mem_is_ds                                              : ex_is_ds);
        mem_pc_current         <= (rst) ? 32'b0 : ((mem_stall) ? mem_pc_current                                         : ex_pc_current);
        mem_mem_can_exc        <= (rst) ? 1'b0  : ((mem_stall) ? mem_mem_can_exc        : ((ex_stall | ex_flush) ? 1'b0 : ex_mem_can_exc));
    end
endmodule
