/*
 *******************************************************************************
 *  File Name   :   ada_id_stage.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 7th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   The Instruction Decode Stage
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_id_stage(
    input           clk,                    // clock
    input   [31:0]  instruction,            // machine instruction
    input   [31:0]  pc_current,             // current PC
    input   [31:0]  pc_next,                // PC + 1
    input   [1:0]   forward_port_a_select,  // forwarding selector
    input   [1:0]   forward_port_b_select,  // forwarding selector
    input   [31:0]  exu_fwd_data,           // data from EX stage
    input   [31:0]  mem_fwd_data,           // data from MEM stage
    input   [31:0]  wb_fwd_data,            // data from WB stage
    input   [4:0]   wb_gpr_wa,              // Write Address from WB Stage
    input   [31:0]  wb_gpr_wd,              // Write Data from WB Stage
    input           wb_gpr_we,              // Write Enable from WB Stage
    input   [31:0]  sr_data_input,          // Data from SR
    input           sr_sm,                  // System Mode
    output          haz_take_branch,        // 1 if the branch is taken
    output          exc_op_reset,           // reset the processor
    output          exc_op_shutdown,        // halt the processor
    output          exc_op_syscall,         // syscall exception
    output          exc_op_break,           // break exception
    output          exc_op_invalid,         // Invalid instruction
    output          exc_op_rfe,             // return from exception
    output          exc_op_rfb,             // return from breakpoint
    output          exc_bad_branch_addr,    // 1 if pc_branch[1:0] != 0
    output  [31:0]  pc_branch_address,      // Branch Address
    output  [4:0]   id_gpr_port_a,          // Read Address A
    output  [4:0]   id_gpr_port_b,          // Read Address B
    output  [4:0]   exu_operation,          // ALU operation
    output  [31:0]  exu_port_a,             // Data A
    output  [31:0]  exu_port_b,             // Data B
    output  [31:0]  mem_store_data,         // Data for store instructions
    output  [4:0]   exu_gpr_wa,             // GPR write address
    output          exu_gpr_we,             // GRP write enable
    output  [4:0]   sr_ra,                  // Status Registers: Read address
    output  [4:0]   sr_wa,                  // Status Registers: Write address
    output  [31:0]  sr_wd,                  // Status Registers: Write data
    output          sr_we,                  // Status Registers: Write enable
    output          mem_write,              // Enable Write to Data Memory
    output          mem_read,               // Enable Read from Data Memory
    output          mem_byte,               // Read/Write one byte
    output          mem_halfword,           // Read/Write halfword (16 bits)
    output          mem_sign_ext,           // Get the byte/Halfword sign/zero extended
    output          mem_exu_mem_select,     // Select the source to WB: MEM or EXU
    output          id_can_exception,       // instruction can generate an exception in ID stage
    output          ex_can_exception,       // instruction can generate an exception in EX stage
    output          mem_can_exception       // instruction can generate an exception in MEM stage
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    wire    [5:0]   op;
    wire    [4:0]   op_r0;
    wire    [4:0]   op_r1;
    wire    [4:0]   op_r2;
    wire    [4:0]   op_shamt;
    wire    [5:0]   op_function;
    wire    [15:0]  op_imm16;
    wire    [20:0]  op_imm21;
    wire    [2:0]   exu_port_b_select;
    wire            gpr_port_b_select;
    wire    [4:0]   gpr_addr_port_b;
    wire    [31:0]  gpr_data_port_a;
    wire    [31:0]  gpr_data_port_b;

    //--------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    reg     [31:0]  fwd_data_a_r;
    reg     [31:0]  fwd_data_b_r;
    reg     [31:0]  exu_port_b_r;

    //--------------------------------------------------------------------------
    // assigments
    //--------------------------------------------------------------------------
    assign op              = instruction[`ADA_INSTR_OPCODE];
    assign op_r0           = instruction[`ADA_INSTR_R0];
    assign op_r1           = instruction[`ADA_INSTR_R1];
    assign op_r2           = instruction[`ADA_INSTR_R2];
    assign op_shamt        = instruction[`ADA_INSTR_SHAMT];
    assign op_function     = instruction[`ADA_INSTR_FUNCT];
    assign op_imm16        = instruction[`ADA_INSTR_IMM16];
    assign op_imm21        = instruction[`ADA_INSTR_IMM21];
    assign gpr_addr_port_b = gpr_port_b_select ? op_r0 : op_r2;
    assign id_gpr_port_a   = op_r1;
    assign id_gpr_port_b   = gpr_addr_port_b;
    assign exu_port_a      = fwd_data_a_r;
    assign exu_port_b      = exu_port_b_r;
    assign mem_store_data  = fwd_data_b_r;
    assign exu_gpr_wa      = op_r0;
    assign sr_ra           = op_r1;
    assign sr_wa           = op_r0;
    assign sr_wd           = fwd_data_a_r;

    //--------------------------------------------------------------------------
    // Forwarding A
    //--------------------------------------------------------------------------
    always @(*) begin
        case(forward_port_a_select)
            2'b00   : fwd_data_a_r <= gpr_data_port_a;
            2'b01   : fwd_data_a_r <= exu_fwd_data;
            2'b10   : fwd_data_a_r <= mem_fwd_data;
            2'b11   : fwd_data_a_r <= wb_fwd_data;
            default : fwd_data_a_r <= gpr_data_port_a;
        endcase
    end

    //--------------------------------------------------------------------------
    // Forwarding B
    //--------------------------------------------------------------------------
    always @(*) begin
        case(forward_port_b_select)
            2'b00   : fwd_data_b_r <= gpr_data_port_b;
            2'b01   : fwd_data_b_r <= exu_fwd_data;
            2'b10   : fwd_data_b_r <= mem_fwd_data;
            2'b11   : fwd_data_b_r <= wb_fwd_data;
            default : fwd_data_b_r <= gpr_data_port_b;
        endcase
    end

    //--------------------------------------------------------------------------
    // Select data for EXU port B
    //--------------------------------------------------------------------------
    always @(*) begin
        case(exu_port_b_select)
            3'b000  : exu_port_b_r <= fwd_data_b_r;
            3'b001  : exu_port_b_r <= $signed(op_imm16);
            3'b010  : exu_port_b_r <= $unsigned(op_imm16);
            3'b011  : exu_port_b_r <= op_shamt;
            3'b100  : exu_port_b_r <= pc_next;
            3'b101  : exu_port_b_r <= { op_imm16, 16'b0 };
            3'b110  : exu_port_b_r <= sr_data_input;
            default : exu_port_b_r <= fwd_data_b_r;
        endcase
    end

    //--------------------------------------------------------------------------
    // Instantiate
    //--------------------------------------------------------------------------
    ada_idu decoder(
        .opcode(op),
        .op_function(op_function),
        .system_mode(sr_sm),
        .exc_op_reset(exc_op_reset),
        .exc_op_shutdown(exc_op_shutdown),
        .exc_op_syscall(exc_op_syscall),
        .exc_op_break(exc_op_break),
        .exc_op_invalid(exc_op_invalid),
        .exc_op_rfe(exc_op_rfe),
        .exc_op_rfb(exc_op_rfb),
        .exu_operation(exu_operation),
        .exu_port_b_select(exu_port_b_select),
        .gpr_port_b_select(gpr_port_b_select),
        .exu_gpr_we(exu_gpr_we),
        .sr_we(sr_we),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .mem_byte(mem_byte),
        .mem_halfword(mem_halfword),
        .mem_sign_ext(mem_sign_ext),
        .mem_exu_mem_select(mem_exu_mem_select),
        .id_can_exception(id_can_exception),
        .ex_can_exception(ex_can_exception),
        .mem_can_exception(mem_can_exception)
        );

    ada_reg_file gpr(
        .clk(clk),
        .read_addr_a(id_gpr_port_a),
        .read_addr_b(id_gpr_port_b),
        .write_addr(wb_gpr_wa),
        .write_data(wb_gpr_wd),
        .we(wb_gpr_we),
        .read_data_a(gpr_data_port_a),
        .read_data_b(gpr_data_port_b)
        );

    ada_branch_unit branch_unit(
        .opcode(op),
        .pc(pc_current),
        .data_reg_a(fwd_data_a_r),
        .data_reg_b(fwd_data_b_r),
        .imm21(op_imm21),
        .pc_branch_address(pc_branch_address),
        .haz_take_branch(haz_take_branch),
        .exc_bad_branch_addr(exc_bad_branch_addr)
        );
endmodule
