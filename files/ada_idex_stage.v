/*
 *******************************************************************************
 *  File Name   :   ada_idex_stage.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 8th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Pipeline register: from Instruction Decode to Execution
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_idex_stage(
    input               clk,                    // Main clock
    input               rst,                    // Main reset
    input       [4:0]   id_exu_operation,       // ALU operation from ID stage
    input       [31:0]  id_exu_port_a,          // Data A
    input       [31:0]  id_exu_port_b,          // Data B
    input       [31:0]  id_mem_store_data,      // Data to Memory
    input               id_mem_write,           // Mem write operation
    input               id_mem_read,            // Mem read operation
    input               id_mem_byte,            // byte operation
    input               id_mem_halfword,        // halfword operation
    input               id_mem_sign_ext,        // Sign/Zero extend data from memory
    input               id_mem_exu_mem_select,  // Select data from EX or MEM
    input       [4:0]   id_gpr_wa,              // GPR write address
    input               id_gpr_we,              // GPR write enable
    input               id_kernel_mode,         // kernel mode in the moment of instruction decode
    //input               id_is_ds ,              // this instruction is a BDS/LDS
    input       [31:0]  id_pc_current,          // instruction's PC
    input               id_ex_can_exc,          // EX instruction can generate an exception
    input               id_mem_can_exc,         // MEM instruction can generate an exception
    input               id_flush,               // Flush ID stage
    input               id_stall,               // Stall ID stage
    input               ex_stall,               // Stall EX stage
    output  reg [4:0]   ex_exu_operation,       // ALU operation to EX stage
    output  reg [31:0]  ex_exu_port_a,          // Data A
    output  reg [31:0]  ex_exu_port_b,          // Data B
    output  reg [31:0]  ex_mem_store_data,      // Data to memory
    output  reg         ex_mem_write,           // Mem write operation
    output  reg         ex_mem_read,            // Mem read operation
    output  reg         ex_mem_byte,            // byte operation
    output  reg         ex_mem_halfword,        // halfword operation
    output  reg         ex_mem_sign_ext,        // Sign/Zero extend data from memory
    output  reg         ex_mem_exu_mem_select,  // Select data from EX or MEM
    output  reg [4:0]   ex_gpr_wa,              // GPR write address
    output  reg         ex_gpr_we,              // GPR write enable
    output  reg         ex_kernel_mode,         // kernel mode in the moment of instruction decode
    //output  reg         ex_is_ds,               // this instruction is a BDS/LDS
    output  reg [31:0]  ex_pc_current,          // instruction's PC
    output  reg         ex_ex_can_exc,          // EX instruction can generate an exception
    output  reg         ex_mem_can_exc          // MEM instruction can generate an exception
    );

    //--------------------------------------------------------------------------
    // Propagate signals
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        ex_exu_operation      <= (rst) ? 5'b0  : ((ex_stall) ? ex_exu_operation      : ((id_stall | id_flush) ? 5'b0    : id_exu_operation));
        ex_exu_port_a         <= (rst) ? 32'b0 : ((ex_stall) ? ex_exu_port_a                                            : id_exu_port_a);
        ex_exu_port_b         <= (rst) ? 32'b0 : ((ex_stall) ? ex_exu_port_b                                            : id_exu_port_b);
        ex_mem_store_data     <= (rst) ? 32'b0 : ((ex_stall) ? ex_mem_store_data                                        : id_mem_store_data);
        ex_mem_write          <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_write          : ((id_stall | id_flush) ? 1'b0    : id_mem_write));
        ex_mem_read           <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_read           : ((id_stall | id_flush) ? 1'b0    : id_mem_read));
        ex_mem_byte           <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_byte                                              : id_mem_byte);
        ex_mem_halfword       <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_halfword                                          : id_mem_halfword);
        ex_mem_sign_ext       <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_sign_ext                                          : id_mem_sign_ext);
        ex_mem_exu_mem_select <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_exu_mem_select                                    : id_mem_exu_mem_select);
        ex_gpr_wa             <= (rst) ? 5'b0  : ((ex_stall) ? ex_gpr_wa             : ((id_stall | id_flush) ? 5'b0    : id_gpr_wa));
        ex_gpr_we             <= (rst) ? 1'b0  : ((ex_stall) ? ex_gpr_we             : ((id_stall | id_flush) ? 1'b0    : id_gpr_we));
        ex_kernel_mode        <= (rst) ? 1'b0  : ((ex_stall) ? ex_kernel_mode        : ((id_stall | id_flush) ? 1'b0    : id_kernel_mode));
        //ex_is_ds              <= (rst) ? 1'b0  : ((ex_stall) ? ex_is_ds                                                 : id_is_ds );
        ex_pc_current         <= (rst) ? 32'b0 : ((ex_stall) ? ex_pc_current                                            : id_pc_current);
        ex_ex_can_exc         <= (rst) ? 1'b0  : ((ex_stall) ? ex_ex_can_exc         : ((id_stall | id_flush) ? 1'b0    : id_ex_can_exc));
        ex_mem_can_exc        <= (rst) ? 1'b0  : ((ex_stall) ? ex_mem_can_exc        : ((id_stall | id_flush) ? 1'b0    : id_mem_can_exc));
    end
endmodule
