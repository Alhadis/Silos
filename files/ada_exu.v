/*
 *******************************************************************************
 *  File Name   :   ada_exu.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 1st, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   The Execution unit.
 *                  Performs the following operations:
 *                  - Arithmetic (add, substraction, multiplication and division)
 *                  - Logical (and, nand, or, nor, xor, xnor, not)
 *                  - Shift (logic left, arithmetic right, logic right)
 *                  - Comparison (ce, cne, cg, cge, cgu, cgeu)
 *  Dependencies:   ada_exu_div    :   divider unit
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_exu(
    input               clk,                // clock
    input               rst,                // reset
    input       [31:0]  port_a,             // Operand
    input       [31:0]  port_b,             // Operand
    input       [4:0]   operation,          // Alu operation
    input               ex_stall,           // stall the execution stage
    input               ex_flush,           // flush the execution stage
    output reg  [31:0]  result,             //
    output              exc_div_zero,       // Exception for divide by zero.
    output              haz_ex_stall        // Executing a Div instruction
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: reg
    //--------------------------------------------------------------------------
    reg         [63:0]  hilo;               // hold the result from the mul and div instructions (signed and unsigned)
    reg                 div_active;         // 1 if the divider is currently active.
    reg                 hilo_access;

    ///-------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    wire        [31:0]  A;
    wire        [31:0]  B;
    wire signed [31:0]  As;
    wire signed [31:0]  Bs;
    wire signed [31:0]  addsub_result;
    wire signed [63:0]  mults_result;
    wire signed [63:0]  multu_result;
    wire        [31:0]  quotient;
    wire        [31:0]  remainder;
    wire        [31:0]  hi;
    wire        [31:0]  lo;
    wire                op_divs;
    wire                op_divu;
    wire                div_stall;
    wire                enable_ex;

    //--------------------------------------------------------------------------
    // assigments
    //--------------------------------------------------------------------------
    assign A             = port_a;
    assign B             = port_b;
    assign As            = port_a;
    assign Bs            = port_b;

    assign addsub_result = (operation == `ALU_OP_ADD) ? A + B : A - B;
    assign multu_result  = A * B;
    assign mults_result  = As * Bs;
    assign hi            = hilo[63:32];
    assign lo            = hilo[31:0];
    assign enable_ex     = ~(ex_stall | ex_flush | haz_ex_stall);

    assign op_divs       = (B != 32'd0) & (div_active == 1'b0) & (operation == `ALU_OP_DIVS) & enable_ex;
    assign op_divu       = (B != 32'd0) & (div_active == 1'b0) & (operation == `ALU_OP_DIVU) & enable_ex;

    assign exc_div_zero  = (B == 32'd0) & ((operation == `ALU_OP_DIVS) | (operation == `ALU_OP_DIVU));
    assign haz_ex_stall  = (div_active == 1'b1) & (hilo_access == 1'b1);

    //--------------------------------------------------------------------------
    // instantiate the divider unit
    //--------------------------------------------------------------------------
    ada_exu_div Divider(
        .clk(clk),
        .rst(rst),
        .op_divs(op_divs),
        .op_divu(op_divu),
        .dividend(port_a),
        .divisor(port_b),
        .quotient(quotient),
        .remainder(remainder),
        .stall(div_stall)
        );

    //--------------------------------------------------------------------------
    // the BIG multiplexer
    //--------------------------------------------------------------------------
    always @(*) begin
        case(operation)
            `ALU_OP_ADD  : result <= addsub_result;
            `ALU_OP_SUB  : result <= addsub_result;
            `ALU_OP_CE   : result <= {32{A == B}};
            `ALU_OP_CGE  : result <= {32{As >= Bs}};
            `ALU_OP_CGEU : result <= {32{A >= B}};
            `ALU_OP_CG   : result <= {32{As > Bs}};
            `ALU_OP_CGU  : result <= {32{A > B}};
            `ALU_OP_CNE  : result <= {32{A != B}};
            `ALU_OP_AND  : result <= A & B;
            `ALU_OP_NAND : result <= ~(A & B);
            `ALU_OP_NOR  : result <= ~(A | B);
            `ALU_OP_OR   : result <= A | B;
            `ALU_OP_NOT  : result <= ~A;
            `ALU_OP_XNOR : result <= ~(A ^ B);
            `ALU_OP_XOR  : result <= A ^ B;
            `ALU_OP_RL   : result <= (A << B) | (A >> (6'd32 - B));
            `ALU_OP_RR   : result <= (A >> B) | (A << (6'd32 - B));
            `ALU_OP_SLL  : result <= A << B;
            `ALU_OP_SRA  : result <= As >> B;
            `ALU_OP_SRL  : result <= A >> B;
            `ALU_OP_MULS : result <= mults_result[31:0];
            `ALU_OP_MULU : result <= multu_result[31:0];
            `ALU_OP_MFH  : result <= hi;
            `ALU_OP_MFL  : result <= lo;
            default      : result <= 32'bx;
        endcase
    end

    //--------------------------------------------------------------------------
    // Write to hilo register
    // Div has priority over mult
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            hilo <= 64'h00000000_00000000;
        end
        else if ((div_stall == 1'b0) & (div_active == 1'b1)) begin
            hilo <= {remainder, quotient};                      // Load when div operations has been finished.
        end
        else if(enable_ex) begin
            case (operation)
                `ALU_OP_MULS : hilo <= mults_result;
                `ALU_OP_MULU : hilo <= multu_result;
                `ALU_OP_MACS : hilo <= hilo + mults_result;    // MAC instruction (signed)
                `ALU_OP_MACU : hilo <= hilo + multu_result;    // MAC instruction (unsigned)
                `ALU_OP_MASS : hilo <= hilo - mults_result;    // MAS instruction (signed)
                `ALU_OP_MASU : hilo <= hilo - multu_result;    // MAS instruction (unsigned)
                `ALU_OP_MTH  : hilo <= {A, lo};
                `ALU_OP_MTL  : hilo <= {hi, A};
                default      : hilo <= hilo;
            endcase
        end
        else begin
            hilo <= hilo;
        end
    end

    //--------------------------------------------------------------------------
    // determinate if the dividers is currently on use.
    //--------------------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            div_active <= 1'b0;
        end
        else begin
            case(div_active)
                1'd0 : div_active <= (op_divs || op_divu) ? 1'b1 : 1'b0; // Check hilo_enable is redundant
                1'd1 : div_active <= (~div_stall) ? 1'b0 : 1'b1;
            endcase
        end
    end

    //--------------------------------------------------------------------------
    // Detect access to HILO register
    //--------------------------------------------------------------------------
    always @(*) begin
        case (operation)
            `ALU_OP_DIVS : hilo_access <= 1'b1;
            `ALU_OP_DIVU : hilo_access <= 1'b1;
            `ALU_OP_MULS : hilo_access <= 1'b1;
            `ALU_OP_MULU : hilo_access <= 1'b1;
            `ALU_OP_MACS : hilo_access <= 1'b1;
            `ALU_OP_MACU : hilo_access <= 1'b1;
            `ALU_OP_MASS : hilo_access <= 1'b1;
            `ALU_OP_MASU : hilo_access <= 1'b1;
            `ALU_OP_MTH  : hilo_access <= 1'b1;
            `ALU_OP_MTL  : hilo_access <= 1'b1;
            `ALU_OP_MFH  : hilo_access <= 1'b1;
            `ALU_OP_MFL  : hilo_access <= 1'b1;
            default      : hilo_access <= 1'b0;
        endcase
    end
endmodule

