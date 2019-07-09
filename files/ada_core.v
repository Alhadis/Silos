/*
 *******************************************************************************
 *  File Name   :   ada_core.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 19th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright  2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   The top-level ADA processor.
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_core(
    input           clk,
    input           rst,
    // external interrupts
    input   [31:0]  io_interrupt,           //
    // I/O port
    input   [31:0]  io_data_i,              // data from device
    input           io_ready,               // device is ready
    output  [31:0]  io_address,             // device address
    output  [31:0]  io_data_o,              // data to device
    output          io_we,                  // write to device
    output          io_enable,              // enable operation
    // External Instruction Memory/Instruction Cache
    input   [31:0]  eimem_cache_data_i,     // Data from memory
    input           eimem_cache_ready,      // memory is ready
    output  [31:0]  eimem_cache_address,    // data address
    output          eimem_cache_wr,         // write = 1, read = 0,
    output          eimem_cache_enable,     // enable operation
    // External Data Memory/Data Cache
    input   [31:0]  edmem_cache_data_i,     // Data from memory
    input           edmem_cache_ready,      // memory is ready
    output  [31:0]  edmem_cache_address,    // data address
    output  [31:0]  edmem_cache_data_o,     // data to memory
    output          edmem_cache_wr,         // write = 1, read = 0,
    output          edmem_cache_enable,      // enable operation
    // Instruction & Data cache
    output          icache_flush,
    output          dcache_flush
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    wire    [31:0]  if_pc_add4;
    wire    [31:0]  ia_pc;
    wire    [31:0]  if_pc;

    wire    [31:0]  id_instruction;
    wire    [31:0]  id_pc_current;
    wire    [31:0]  id_pc_add4;

    wire    [4:0]   id_exu_operation;
    wire    [31:0]  id_exu_port_a;
    wire    [31:0]  id_exu_port_b;
    wire    [31:0]  id_mem_store_data;
    wire            id_mem_write;
    wire            id_mem_read;
    wire            id_mem_byte;
    wire            id_mem_halfword;
    wire            id_mem_sign_ext;
    wire            id_mem_exu_mem_select;
    wire    [4:0]   id_gpr_wa;
    wire            id_gpr_we;

    wire    [4:0]   ex_exu_operation;
    wire    [31:0]  ex_exu_port_a;
    wire    [31:0]  ex_exu_port_b;
    wire    [31:0]  ex_mem_store_data;
    wire            ex_mem_write;
    wire            ex_mem_read;
    wire            ex_mem_byte;
    wire            ex_mem_halfword;
    wire            ex_mem_sign_ext;
    wire            ex_mem_exu_mem_select;
    wire    [4:0]   ex_gpr_wa;
    wire            ex_gpr_we;
    wire            ex_kernel_mode;
    wire    [31:0]  ex_pc_current;
    wire            ex_mem_can_exception;

    wire    [31:0]  ex_exu_result;

    wire    [31:0]  mem_exu_result;
    wire            mem_mem_exu_mem_select;
    wire    [4:0]   mem_gpr_wa;
    wire    [31:0]  mem_gpr_wd;
    wire            mem_gpr_we;
    wire    [4:0]   wb_gpr_wa;
    wire    [31:0]  wb_gpr_wd;
    wire            wb_gpr_we;

    wire    [4:0]   id_gpr_port_a;
    wire    [4:0]   id_gpr_port_b;
    wire    [1:0]   forward_port_a_select;
    wire    [1:0]   forward_port_b_select;
    wire            if_stall;
    wire            id_stall;
    wire            ex_stall;
    wire            mem_stall;
    wire            wb_stall;

    wire    [4:0]   sr_ra;
    wire    [4:0]   sr_wa;
    wire    [31:0]  sr_wd;
    wire            sr_we;
    wire            id_is_flushed;
    wire            exc_op_reset;
    wire            exc_op_shutdown;
    wire            exc_op_syscall;
    wire            exc_op_break;
    wire            exc_op_invalid;
    wire            exc_op_rfe;
    wire            exc_op_rfb;
    wire            exc_bad_branch_addr;
    wire            exc_div_zero;
    wire    [31:0]  mem_pc_current;
    wire            id_id_can_exception;
    wire            id_ex_can_exception;
    wire            id_mem_can_exception;
    wire            ex_ex_can_exception;
    wire    [31:0]  sr_data_input;
    wire            id_kernel_mode;
    wire            if_flush;
    wire            id_flush;
    wire            ex_flush;
    wire            mem_flush;
    wire            if_exception_stall;
    wire            id_exception_stall;
    wire            ex_exception_stall;
    wire            mem_exception_stall;
    wire            exception_pc_selector;
    wire    [31:0]  exception_pc;
    //------------------------------------------------
    // watch from here
    wire    [31:0]  if_instruction;
    wire    [31:0]  dmem_data_o;
    wire            if_mem_request_stall;
    wire            mem_request_stall;
    wire            exc_bad_if_address;
    wire            exc_bad_mem_address;
    wire            haz_take_branch;
    wire    [31:0]  pc_branch_address;
    wire            haz_ex_stall;
    wire    [31:0]  mem_mem_store_data;
    wire            mem_mem_write;
    wire            mem_mem_read;
    wire            mem_mem_byte;
    wire            mem_mem_halfword;
    wire            mem_mem_sign_ext;
    wire            mem_kernel_mode;
    wire            mem_mem_can_exception;
    wire    [31:0]  iimem_address;
    wire    [31:0]  iimem_data_i;
    wire            iimem_we;
    wire    [31:0]  dimem_data_i;
    wire    [31:0]  dimem_address;
    wire    [31:0]  dimem_data_o;
    wire            dimem_we;
    //--------------------------------------------------------------------------
    // Instantiate
    //--------------------------------------------------------------------------
    ada_mux_4_1 pc_source(
        .select({exception_pc_selector, haz_take_branch}),
        .in0(if_pc_add4),
        .in1(pc_branch_address),
        .in2(exception_pc),
        .in3(exception_pc),
        .out(ia_pc)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_iaif_stage iaif_register(
        .clk(clk),
        .rst(rst),
        .pc_in(ia_pc),
        .if_stall(if_stall),
        .pc_out(if_pc)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_add pc_add4(
        .A(if_pc),
        .B(32'h0000_0004),
        .C(if_pc_add4)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_ifid_stage ifid_register(
        .clk(clk),
        .rst(rst),
        .if_instruction(if_instruction),
        .if_pc_current(if_pc),
        .if_pc_add4(if_pc_add4),
        .if_stall(if_stall),
        .if_flush(if_flush),
        .id_stall(id_stall),
        .if_is_ds(haz_take_branch),
        .id_instruction(id_instruction),    //
        .id_pc_current(id_pc_current),
        .id_pc_add4(id_pc_add4),
        .id_is_flushed(id_is_flushed)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_id_stage id_stage(
        .clk(clk),
        .instruction(id_instruction),
        .pc_current(id_pc_current),
        .pc_next(id_pc_add4),
        .forward_port_a_select(forward_port_a_select),
        .forward_port_b_select(forward_port_b_select),
        .exu_fwd_data(ex_exu_result),
        .mem_fwd_data(mem_gpr_wd),
        .wb_fwd_data(wb_gpr_wd),
        .wb_gpr_wa(wb_gpr_wa),
        .wb_gpr_wd(wb_gpr_wd),
        .wb_gpr_we(wb_gpr_we),
        .sr_data_input(sr_data_input),
        .sr_sm(id_kernel_mode),
        .haz_take_branch(haz_take_branch),             //
        .exc_op_reset(exc_op_reset),
        .exc_op_shutdown(exc_op_shutdown),
        .exc_op_syscall(exc_op_syscall),
        .exc_op_break(exc_op_break),
        .exc_op_invalid(exc_op_invalid),
        .exc_op_rfe(exc_op_rfe),
        .exc_op_rfb(exc_op_rfb),
        .exc_bad_branch_addr(exc_bad_branch_addr),
        .pc_branch_address(pc_branch_address),
        .id_gpr_port_a(id_gpr_port_a),
        .id_gpr_port_b(id_gpr_port_b),
        .exu_operation(id_exu_operation),
        .exu_port_a(id_exu_port_a),
        .exu_port_b(id_exu_port_b),
        .mem_store_data(id_mem_store_data),
        .exu_gpr_wa(id_gpr_wa),
        .exu_gpr_we(id_gpr_we),
        .sr_ra(sr_ra),
        .sr_wa(sr_wa),
        .sr_wd(sr_wd),
        .sr_we(sr_we),
        .mem_write(id_mem_write),
        .mem_read(id_mem_read),
        .mem_byte(id_mem_byte),
        .mem_halfword(id_mem_halfword),
        .mem_sign_ext(id_mem_sign_ext),
        .mem_exu_mem_select(id_mem_exu_mem_select),
        .id_can_exception(id_id_can_exception),
        .ex_can_exception(id_ex_can_exception),
        .mem_can_exception(id_mem_can_exception)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_idex_stage idex_register(
        .clk(clk),
        .rst(rst),
        .id_exu_operation(id_exu_operation),
        .id_exu_port_a(id_exu_port_a),
        .id_exu_port_b(id_exu_port_b),
        .id_mem_store_data(id_mem_store_data),
        .id_mem_write(id_mem_write),
        .id_mem_read(id_mem_read),
        .id_mem_byte(id_mem_byte),
        .id_mem_halfword(id_mem_halfword),
        .id_mem_sign_ext(id_mem_sign_ext),
        .id_mem_exu_mem_select(id_mem_exu_mem_select),
        .id_gpr_wa(id_gpr_wa),
        .id_gpr_we(id_gpr_we),
        .id_kernel_mode(id_kernel_mode),
        .id_pc_current(id_pc_current),
        .id_ex_can_exc(id_ex_can_exception),
        .id_mem_can_exc(id_mem_can_exception),
        .id_flush(id_flush),
        .id_stall(id_stall),
        .ex_stall(ex_stall),
        .ex_exu_operation(ex_exu_operation),    //
        .ex_exu_port_a(ex_exu_port_a),
        .ex_exu_port_b(ex_exu_port_b),
        .ex_mem_store_data(ex_mem_store_data),
        .ex_mem_write(ex_mem_write),
        .ex_mem_read(ex_mem_read),
        .ex_mem_byte(ex_mem_byte),
        .ex_mem_halfword(ex_mem_halfword),
        .ex_mem_sign_ext(ex_mem_sign_ext),
        .ex_mem_exu_mem_select(ex_mem_exu_mem_select),
        .ex_gpr_wa(ex_gpr_wa),
        .ex_gpr_we(ex_gpr_we),
        .ex_kernel_mode(ex_kernel_mode),
        .ex_pc_current(ex_pc_current),
        .ex_ex_can_exc(ex_ex_can_exception),
        .ex_mem_can_exc(ex_mem_can_exception)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_exu ex_unit(
        .clk(clk),
        .rst(rst),
        .port_a(ex_exu_port_a),
        .port_b(ex_exu_port_b),
        .operation(ex_exu_operation),
        .ex_stall(ex_stall),
        .ex_flush(ex_flush),
        .result(ex_exu_result),         //
        .exc_div_zero(exc_div_zero),
        .haz_ex_stall(haz_ex_stall)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_exmem_stage exmem_register(
        .clk(clk),
        .rst(rst),
        .ex_exu_result(ex_exu_result),
        .ex_mem_store_data(ex_mem_store_data),
        .ex_mem_write(ex_mem_write),
        .ex_mem_read(ex_mem_read),
        .ex_mem_byte(ex_mem_byte),
        .ex_mem_halfword(ex_mem_halfword),
        .ex_mem_sign_ext(ex_mem_sign_ext),
        .ex_mem_exu_mem_select(ex_mem_exu_mem_select),
        .ex_gpr_wa(ex_gpr_wa),
        .ex_gpr_we(ex_gpr_we),
        .ex_kernel_mode(ex_kernel_mode),
        .ex_pc_current(ex_pc_current),
        .ex_mem_can_exc(ex_mem_can_exception),
        .ex_flush(ex_flush),
        .ex_stall(ex_stall),
        .mem_stall(mem_stall),
        .mem_exu_result(mem_exu_result),                //
        .mem_mem_store_data(mem_mem_store_data),
        .mem_mem_write(mem_mem_write),
        .mem_mem_read(mem_mem_read),
        .mem_mem_byte(mem_mem_byte),
        .mem_mem_halfword(mem_mem_halfword),
        .mem_mem_sign_ext(mem_mem_sign_ext),
        .mem_mem_exu_mem_select(mem_mem_exu_mem_select),
        .mem_gpr_wa(mem_gpr_wa),
        .mem_gpr_we(mem_gpr_we),
        .mem_kernel_mode(mem_kernel_mode),
        .mem_pc_current(mem_pc_current),
        .mem_mem_can_exc(mem_mem_can_exception)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_mux_2_1 mux_2_1(
        .select(mem_mem_exu_mem_select),
        .in0(mem_exu_result),
        .in1(dmem_data_o),
        .out(mem_gpr_wd)        //
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_memwb_stage memwb_register(
        .clk(clk),
        .rst(rst),
        .mem_gpr_wd(mem_gpr_wd),
        .mem_gpr_wa(mem_gpr_wa),
        .mem_gpr_we(mem_gpr_we),
        .mem_flush(mem_flush),
        .mem_stall(mem_stall),
        .wb_stall(wb_stall),
        .wb_gpr_wd(wb_gpr_wd),  //
        .wb_gpr_wa(wb_gpr_wa),
        .wb_gpr_we(wb_gpr_we)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_hazard hazard_unit(
        .id_gpr_port_a(id_gpr_port_a),
        .id_gpr_port_b(id_gpr_port_b),
        .ex_gpr_wa(ex_gpr_wa),
        .mem_gpr_wa(mem_gpr_wa),
        .wb_gpr_wa(wb_gpr_wa),
        .ex_gpr_we(ex_gpr_we),
        .mem_gpr_we(mem_gpr_we),
        .wb_gpr_we(wb_gpr_we),
        .if_mem_request_stall(if_mem_request_stall),
        .ex_data_read(ex_mem_read),
        .mem_request_stall(mem_request_stall),
        .if_exception_stall(if_exception_stall),
        .id_exception_stall(id_exception_stall),
        .ex_exception_stall(ex_exception_stall),
        .mem_exception_stall(mem_exception_stall),
        .ex_exu_stall(haz_ex_stall),
        .forward_port_a_select(forward_port_a_select),  //
        .forward_port_b_select(forward_port_b_select),
        .if_stall(if_stall),
        .id_stall(id_stall),
        .ex_stall(ex_stall),
        .mem_stall(mem_stall),
        .wb_stall(wb_stall)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_exception exception_unit(
        .clk(clk),
        .rst(rst),
        .reg_ra(sr_ra),
        .reg_wa(sr_wa),
        .reg_data_i(sr_wd),
        .reg_we(sr_we),
        .id_stall(id_stall),
        .id_is_flushed(id_is_flushed),
        .exc_if_invalid_address(exc_bad_if_address),
        .exc_op_reset(exc_op_reset),
        .exc_op_shutdown(exc_op_shutdown),
        .exc_op_syscall(exc_op_syscall),
        .exc_op_break(exc_op_break),
        .exc_op_invalid(exc_op_invalid),
        .exc_branch_invalid_address(exc_bad_branch_addr),
        .exc_div_zero(exc_div_zero),
        .exc_mem_invalid_address(exc_bad_mem_address),
        .op_rfe(exc_op_rfe),
        .op_rfb(exc_op_rfb),
        .io_interrupt(io_interrupt),
        .if_bad_address(if_pc),
        .id_exc_pc(id_pc_current),
        .ex_exc_pc(ex_pc_current),
        .mem_exc_pc(mem_pc_current),
        .mem_bad_address(mem_exu_result),
        .id_can_exc(id_id_can_exception | id_ex_can_exception | id_mem_can_exception),
        .ex_can_exc(ex_ex_can_exception | ex_mem_can_exception),
        .mem_can_exc(mem_mem_can_exception),
        .reg_data_o(sr_data_input),                                                              ////////////////////////////
        .kernel_mode(id_kernel_mode),
        .if_exc_flush(if_flush),
        .id_exc_flush(id_flush),
        .ex_exc_flush(ex_flush),
        .mem_exc_flush(mem_flush),
        .if_exception_stall(if_exception_stall),
        .id_exception_stall(id_exception_stall),
        .ex_exception_stall(ex_exception_stall),
        .mem_exception_stall(mem_exception_stall),
        .exception_pc_selector(exception_pc_selector),
        .exception_pc(exception_pc),
        .icache_flush(dcache_flush),
        .dcache_flush(icache_flush)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_bram internal_memory(
        // instruction
        .a_clk(clk),
        .a_wr(iimem_we),
        .a_addr(iimem_address[7:0]),
        .a_din(32'hFFFF_FFFF),
        .a_dout(iimem_data_i),
        // data
        .b_clk(clk),
        .b_wr(dimem_we),
        .b_addr(dimem_address[7:0]),
        .b_din(dimem_data_o),
        .b_dout(dimem_data_i)
        );
    //------------------------------------------------------------------------------------------------------------------
    ada_mem_decoder mem_decoder(
        .clk(clk),
        .rst(rst),
        // IF interface
        .imem_address(if_pc),                           // Instruction address
        .imem_data(if_instruction),                     // Instruction data
        // MEM interface
        .dmem_address(mem_exu_result),                  // Data address
        .dmem_data_i(mem_mem_store_data),               // Data to memory
        .data_word(~(mem_mem_halfword | mem_mem_byte)), // word access
        .data_halfword(mem_mem_halfword),               // halfword access
        .data_byte(mem_mem_byte),                       // byte access
        .dmem_read(mem_mem_read),                       // read data memory
        .dmem_write(mem_mem_write),                     // write data memory
        .data_sign_extend(mem_mem_sign_ext),            // read data (byte/half) with sign extended
        .dmem_data_o(dmem_data_o),                      // data from memory
            // I/O
            .io_data_i(io_data_i),                          // data from device
            .io_ready(io_ready),                            // device is ready
            .io_address(io_address),                        // device address
            .io_data_o(io_data_o),                          // data to device
            .io_we(io_we),                                  // write to device
            .io_enable(io_enable),                          // enable operation
        // Internal IM
        .iimem_data_i(iimem_data_i),                    // data from memory
        .iimem_address(iimem_address),                  // instruction address
        .iimem_we(iimem_we),                            // write enable
        // Internal DM
        .dimem_data_i(dimem_data_i),                    // data from memory
        .dimem_address(dimem_address),                  // instruction address
        .dimem_data_o(dimem_data_o),                    // data to memory
        .dimem_we(dimem_we),                            // write enable
            // External Instruction Memory/Instruction Cache
            .eimem_cache_data_i(eimem_cache_data_i),        // Data from memory
            .eimem_cache_ready(eimem_cache_ready),          // memory is ready
            .eimem_cache_address(eimem_cache_address),      // data address
            .eimem_cache_wr(eimem_cache_wr),                // write = 1, read = 0,
            .eimem_cache_enable(eimem_cache_enable),        // enable operation
            // External Data Memory/Data Cache
            .edmem_cache_data_i(edmem_cache_data_i),        // Data from memory
            .edmem_cache_ready(edmem_cache_ready),          // memory is ready
            .edmem_cache_address(edmem_cache_address),      // data address
            .edmem_cache_data_o(edmem_cache_data_o),        // data to memory
            .edmem_cache_wr(edmem_cache_wr),                // write = 1, read = 0,
            .edmem_cache_enable(edmem_cache_enable),        // enable operation
        // pipeline
        .if_kernel_mode(id_kernel_mode),                // privilege access in IF stage
        .mem_kernel_mode(mem_kernel_mode),              // privilege access in MEM stage
        .if_stall(if_stall),                            // Stop transactions if IF is stalled
        .if_flush(if_flush),                            // abort IF
        .exc_bad_if_address(exc_bad_if_address),        // panic
        .exc_bad_mem_address(exc_bad_mem_address),      // panic
        .if_stall_md(if_mem_request_stall),             // long operation
        .mem_stall_md(mem_request_stall)                // long operation
        );
    //------------------------------------------------------------------------------------------------------------------
endmodule
