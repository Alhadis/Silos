/*
 *******************************************************************************
 *  File Name   :   ada_exception.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 10th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright (c) 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Exception and system control unit.
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_exception(
    input               clk,                        // main clock
    input               rst,                        // main reset
    input       [4:0]   reg_ra,                     // Read address
    input       [4:0]   reg_wa,                     // Write address
    input       [31:0]  reg_data_i,                 // Data to control register
    input               reg_we,                     // write enable
    input               id_stall,                   // stall ID stage
    input               id_is_flushed,              // ignore ID instruction
    input               exc_if_invalid_address,     // ID exception: bad address
    input               exc_op_reset,               // ID exception: software reset
    input               exc_op_shutdown,            // ID exception: shutdown
    input               exc_op_syscall,             // ID exception: syscall
    input               exc_op_break,               // ID exception: break
    input               exc_op_invalid,             // ID exception: invalid instruction
    input               exc_branch_invalid_address, // ID exception: invalid branch address
    input               exc_div_zero,               // EX exception: Divide by zero
    input               exc_mem_invalid_address,    // MEM exception: bad address
    input               op_rfe,                     // ID instruction: return from exception
    input               op_rfb,                     // ID instruction: return from breakpoint
    input       [31:0]  io_interrupt,               // interrupt port
    input       [31:0]  if_bad_address,             // instruction address at IF stage
    input       [31:0]  id_exc_pc,                  // instruction address at ID stage
    input       [31:0]  ex_exc_pc,                  // instruction address at EX stage
    input       [31:0]  mem_exc_pc,                 // instruction address at MEM stage
    input       [31:0]  mem_bad_address,            // address for Load/Store at MEM stage
    input               id_can_exc,                 // The instruction at ID can generate an exception
    input               ex_can_exc,                 // The instruction at EX can generate an exception
    input               mem_can_exc,                // The instruction at MEM can generate an exception (?)
    output  reg [31:0]  reg_data_o,                 // Data from control registers
    output              kernel_mode,                // the current mode
    output              if_exc_flush,               // flush the IF stage
    output              id_exc_flush,               // flush the ID stage
    output              ex_exc_flush,               // flush the EX stage
    output              mem_exc_flush,              // flush the MEM stage
    output              if_exception_stall,         // stall the IF stage
    output              id_exception_stall,         // stall the ID stage
    output              ex_exception_stall,         // stall the EX stage
    output              mem_exception_stall,        // stall the MEM stage
    output              exception_pc_selector,      // Select Normal PC(0)/Exception PC(1)
    output  reg [31:0]  exception_pc,               // Exception PC
    output              icache_flush,               // flush cache
    output              dcache_flush                // flush cache
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: reg
    //--------------------------------------------------------------------------
    reg             sm;                         // System Mode
    reg             ie;                         // Interrupt Enable
    reg             exl;                        // Exception Level
    reg     [31:0]  im;                         // Interrupt Mask
    reg     [31:0]  ip;                         // Interrupt Pending
    reg     [31:0]  pit_cmp;                    // Programmable interrupt timer: top value
    reg             pit_ie;                     // Programmable interrupt timer: interrupt enable
    reg             pit_ack;                    // Programmable interrupt timer: acknowledge interrupt
    reg     [31:0]  eba;                        // Exception Base Address
    reg             icc;                        // Instruction Cache Control
    reg             dcc;                        // Data Cache Control

    reg     [63:0]  cc;                         // Cycle Counter
    reg     [31:0]  pit_cc;                     // Programmable interrupt timer: counter

    reg             exc_pit;

    reg     [3:0]   exc_cause;                  // Exception Cause
    reg     [31:0]  exc_pc;                     // PC of the faulty instruction
    reg     [31:0]  exc_address;                // Bad Address (Memory access)

    reg     [3:0]   exc_cause_aux;              // hold the cause of exception

    //--------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    wire    [31:0]  cc_h;                       // Cycle Counter High
    wire    [31:0]  cc_l;                       // Cycle Counter Low

    wire    [31:0]  pit_cc_next;

    wire            mem_exception;
    wire            ex_exception;
    wire            id_exception;
    wire            if_exception;

    wire            ex_exception_mask;
    wire            id_exception_mask;
    wire            if_exception_mask;

    wire            mem_exception_ready;
    wire            ex_exception_ready;
    wire            id_exception_ready;
    wire            if_exception_ready;

    wire            valid_interrupts;
    wire            exc_interrupt;

    wire            reg_write_enable;
    wire            return_exception;
    //--------------------------------------------------------------------------
    // assignments
    //--------------------------------------------------------------------------
    /*
        List all the possible exceptions.

        Exception Name              Pipeline Stage      ID
        ------------------------------------------------------------
        Reset                       ID/External          0
        Shutdown                    ID                   1
        Fetch Address Error         IF                   2
        Load/Store Address Error    MEM                  3
        Division by Zero            EX                   4
        Syscall                     ID                   5
        Breakpoint                  ID                   6
        Branch Address Error        ID                   7
        Invalid Instruction         ID                   8
        PIT                         ID                   9
        Interrupt                   ID                  10
    */
    assign valid_interrupts      = (im & ip) != 32'b0;
    assign exc_interrupt         = ie & ~exl & valid_interrupts & ~id_is_flushed;

    assign mem_exception         = exc_mem_invalid_address;
    assign ex_exception          = exc_div_zero;
    assign id_exception          = exc_interrupt | exc_pit | exc_op_syscall | exc_op_break | exc_op_reset | exc_op_shutdown | exc_branch_invalid_address | exc_op_invalid;
    assign if_exception          = exc_if_invalid_address;

    assign ex_exception_mask     = mem_can_exc;                                                                         // check for possible exceptions in forward stages
    assign id_exception_mask     = ex_can_exc | mem_can_exc;                                                            // check for possible exceptions in forward stages
    assign if_exception_mask     = id_can_exc | ex_can_exc | mem_can_exc;                                               // check for possible exceptions in forward stages

    assign mem_exception_stall   = 0;                                                                                   // never stall
    assign ex_exception_stall    = ex_exception & ~mem_exception & ex_exception_mask;                                   // this will stall if EX exception and LS instruction at MEM
    assign id_exception_stall    = (id_exception | return_exception | reg_we) & ~(ex_exception | mem_exception) & id_exception_mask;
    assign if_exception_stall    = if_exception & ~(id_exception | ex_exception | mem_exception) & if_exception_mask;

    assign mem_exception_ready   = mem_exception;                                                                       // MEM exception is always ready (?)
    assign ex_exception_ready    = ex_exception  & ~ex_exception_mask;                                                  // ready only if no other problematic instructions
    assign id_exception_ready    = id_exception  & ~id_exception_mask;                                                  // ready only if no other problematic instructions
    assign if_exception_ready    = if_exception  & ~if_exception_mask;                                                  // ready only if no other problematic instructions

    assign mem_exc_flush         = mem_exception;
    assign ex_exc_flush          = mem_exception | ex_exception;
    assign id_exc_flush          = mem_exception | ex_exception | id_exception;
    assign if_exc_flush          = mem_exception | ex_exception | id_exception | if_exception | return_exception;       // return_exception -> delay slot

    assign kernel_mode           = sm | exl;
    assign reg_write_enable      = kernel_mode & reg_we & ~id_stall;

    assign exception_pc_selector = rst | mem_exception_ready | ex_exception_ready | id_exception_ready | if_exception_ready | return_exception;
    assign return_exception      = (op_rfe | op_rfb) & ~id_stall;

    assign cc_h                  = cc[63:32];
    assign cc_l                  = cc[31:0];

    assign pit_cc_next           = pit_cc + 32'b1;

    assign icache_flush          = icc;
    assign dcache_flush          = dcc;

    //--------------------------------------------------------------------------
    // 64-bits cycle counter
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            cc <= 32'h0;
        end
        else begin
            cc <= cc + 1;
        end
    end

    //--------------------------------------------------------------------------
    // PIT counter
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        pit_cmp  = (rst) ? 32'hFFFF_FFFF : (((reg_wa == `ADA_SR_PIT) & reg_write_enable) ? reg_data_i                                                : pit_cmp);
        pit_ie   = (rst) ? 1'b0          : (((reg_wa == `ADA_SR_ITE) & reg_write_enable) ? reg_data_i[0]                                             : pit_ie);
        pit_ack  = (rst) ? 1'b0          : (((reg_wa == `ADA_SR_ITA) & reg_write_enable) ? reg_data_i[0]                                             : 1'b0);
        pit_cc  <= (rst) ? 32'h0000_0000 : ((~pit_ie)                                    ? 32'h0000_0000 : ((pit_cc_next == pit_cmp) ? 32'h0000_0000 : pit_cc_next));
        exc_pit <= (rst) ? 1'b0          : ((pit_cc_next == pit_cmp)                     ? pit_ie                                                    : exc_pit & ~pit_ack);
    end

    //--------------------------------------------------------------------------
    // System mode
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            sm <= 1'b1;
        end
        else if (return_exception) begin
            sm <= 1'b0;
        end
        else if (mem_exception_ready | ex_exception_ready | id_exception_ready | if_exception_ready) begin
           sm <= 1'b1;
        end
    end

    //--------------------------------------------------------------------------
    // read Exception & system Control registers
    //--------------------------------------------------------------------------
    always @(*) begin
        if (kernel_mode) begin
            case(reg_ra)
                `ADA_SR_PI          : reg_data_o <= `ADA_CPU_INFO;
                `ADA_SR_IE          : reg_data_o <= $unsigned(ie);
                `ADA_SR_IM          : reg_data_o <= im;
                `ADA_SR_IP          : reg_data_o <= ip;
                `ADA_SR_ICC         : reg_data_o <= 32'b0;
                `ADA_SR_DCC         : reg_data_o <= 32'b0;
                `ADA_SR_CC_H        : reg_data_o <= cc_h;
                `ADA_SR_CC_L        : reg_data_o <= cc_l;
                `ADA_SR_PIT         : reg_data_o <= pit_cmp;
                `ADA_SR_ITE         : reg_data_o <= $unsigned(pit_ie);
                `ADA_SR_ITA         : reg_data_o <= $unsigned(pit_ack);
                `ADA_SR_EBA         : reg_data_o <= eba;
                `ADA_SR_EXC_PC      : reg_data_o <= exc_pc;
                `ADA_SR_BAD_ADDRESS : reg_data_o <= exc_address;
                `ADA_SR_EXC_CAUSE   : reg_data_o <= $unsigned(exc_cause);
                default             : reg_data_o <= 32'h0;
            endcase
        end
        else begin
            reg_data_o <= 32'b0;
        end
    end

    //--------------------------------------------------------------------------
    // write Instruction/Data cache control
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
            icc <= (rst) ? 1'b0 : (reg_wa == `ADA_SR_ICC) & reg_write_enable;
            dcc <= (rst) ? 1'b0 : (reg_wa == `ADA_SR_DCC) & reg_write_enable;
    end

    //--------------------------------------------------------------------------
    // write interrupt control signals: IM and IP.
    //--------------------------------------------------------------------------
    always @(posedge clk ) begin
        if (rst) begin
            im <= 32'b0;
            ip <= io_interrupt;
        end
        else begin
            im <= ((reg_wa == `ADA_SR_IM) & reg_write_enable) ? reg_data_i : im;
            ip <= ((reg_wa == `ADA_SR_IP) & reg_write_enable) ? reg_data_i : io_interrupt;
        end
    end

    //--------------------------------------------------------------------------
    // write exception control signals
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            ie          <= 1'b0;
            exl         <= 1'b0;
            eba         <= `ADA_EBA_DEFAULT;
            exc_pc      <= 32'b0;
            exc_address <= 32'b0;
            exc_cause   <= `ADA_EXC_RESET;
        end
        else begin
            if (mem_exception_ready) begin
                ie          <= ie;
                exl         <= 1'b1;
                eba         <= eba;
                exc_pc      <= (exl) ? exc_pc : mem_exc_pc;
                exc_address <= mem_bad_address;
                exc_cause   <= exc_cause_aux;
            end
            else if (ex_exception_ready) begin
                ie          <= ie;
                exl         <= 1'b1;
                eba         <= eba;
                exc_pc      <= (exl) ? exc_pc : ex_exc_pc;
                exc_address <= exc_address;
                exc_cause   <= exc_cause_aux;
            end
            else if (id_exception_ready) begin
                ie          <= ie;
                exl         <= 1'b1;
                eba         <= eba;
                exc_pc      <= (exl) ? exc_pc : id_exc_pc; // why exc_op_reset
                exc_address <= exc_address;
                exc_cause   <= exc_cause_aux;
            end
            else if (if_exception_ready) begin
                ie          <= ie;
                exl         <= 1'b1;
                eba         <= eba;
                exc_pc      <= (exl) ? exc_pc : if_bad_address;
                exc_address <= if_bad_address;
                exc_cause   <= exc_cause_aux;
            end
            else begin
                ie          <= ((reg_wa == `ADA_SR_IE)     & reg_write_enable) ? reg_data_i[0]                                    : ie;
                exl         <= ((reg_wa == `ADA_SR_EXL)    & reg_write_enable) ? reg_data_i[0] : ((exl & return_exception) ? 1'b0 : exl);
                eba         <= ((reg_wa == `ADA_SR_EBA)    & reg_write_enable) ? reg_data_i                                       : eba;
                exc_pc      <= ((reg_wa == `ADA_SR_EXC_PC) & reg_write_enable) ? reg_data_i                                       : exc_pc;
                exc_address <= exc_address;
                exc_cause   <= exc_cause;
            end
        end
    end

    //--------------------------------------------------------------------------
    // write cause register
    //--------------------------------------------------------------------------
    always @(*) begin
        if      (exc_mem_invalid_address)    exc_cause_aux <= `ADA_EXC_LS_ADDRESS;
        else if (exc_div_zero)               exc_cause_aux <= `ADA_EXC_DIV_ZERO;
        else if (exc_op_reset)               exc_cause_aux <= `ADA_EXC_RESET;
        else if (exc_op_shutdown)            exc_cause_aux <= `ADA_EXC_SHUTDOWN;
        else if (exc_op_syscall)             exc_cause_aux <= `ADA_EXC_SYSCALL;
        else if (exc_op_break)               exc_cause_aux <= `ADA_EXC_BREAKPOINT;
        else if (exc_branch_invalid_address) exc_cause_aux <= `ADA_EXC_BRANCH_ERR;
        else if (exc_op_invalid)             exc_cause_aux <= `ADA_EXC_INV_INSTR;
        else if (exc_if_invalid_address)     exc_cause_aux <= `ADA_EXC_FETCH_ERR;
        else if (exc_pit)                    exc_cause_aux <= `ADA_EXC_PIT;
        else if (exc_interrupt)              exc_cause_aux <= `ADA_EXC_INTERRUPT;
        else                                 exc_cause_aux <= 4'b0000;
    end

    //--------------------------------------------------------------------------
    // Get the Exception PC
    //--------------------------------------------------------------------------
    always @(*) begin
        if (rst | exc_op_reset) begin
            exception_pc <= `ADA_RESET_DEFAULT;
        end
        else if (return_exception) begin
            exception_pc <= exc_pc;
        end
        else begin
           exception_pc <= eba;
        end
    end
endmodule
