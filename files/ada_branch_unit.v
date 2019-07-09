/*
 *******************************************************************************
 *  File Name   :   ada_branch_unit.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 2nd, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Calculates the branch address.
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_branch_unit(
    input   [5:0]   opcode,             // Instruction opcode
    input   [31:0]  pc,                 // Instruction address
    input   [31:0]  data_reg_a,         // Data from R0
    input   [31:0]  data_reg_b,         // Data from R1
    input   [20:0]  imm21,              // imm21/Imm16

    output  [31:0]  pc_branch_address,  // Destination address
    output          haz_take_branch,    // 1 if the branch is taken
    output          exc_bad_branch_addr // 1 if pc_branch_address[1:0] != 0
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: reg
    //--------------------------------------------------------------------------
    reg     [31:0]  dest_address;
    reg             take_branch;

    //--------------------------------------------------------------------------
    // Signal Declaration: wire
    //--------------------------------------------------------------------------
    wire            bg;
    wire            bgu;
    wire            bge;
    wire            bgeu;
    wire            eq;
    wire            neq;
    wire    [31:0]  long_jump;
    wire    [31:0]  short_jump;
    wire    [5:0]   inst_function;

    //--------------------------------------------------------------------------
    // assigments
    //--------------------------------------------------------------------------
    assign pc_branch_address   = dest_address;
    assign haz_take_branch     = take_branch;
    assign exc_bad_branch_addr = (dest_address[1:0] == 2'b00 ? 1'b0 : 1'b1) & haz_take_branch;
    assign bg                  = $signed(data_reg_a) > $signed(data_reg_b);
    assign bgu                 = data_reg_a > data_reg_b;
    assign bge                 = bg  | eq;
    assign bgeu                = bgu | eq;
    assign eq                  = data_reg_a == data_reg_b;
    assign neq                 = ~eq;
    assign long_jump           = pc + $signed( { imm21, 2'b00 } );                             // precalculate the jump
    assign short_jump          = pc + $signed( { imm21[`ADA_INSTR_IMM16], 2'b00 } );           // same here
    assign inst_function       = imm21[`ADA_INSTR_FUNCT];

    //--------------------------------------------------------------------------
    // Calculate the destination address
    //--------------------------------------------------------------------------
    always @(*) begin
        case (opcode)
            `OP_B        :  begin dest_address <= long_jump;    take_branch <= 1'b1;                  end
            `OP_BE       :  begin dest_address <= short_jump;   take_branch <= eq   ? 1'b1 : 1'b0;    end
            `OP_BG       :  begin dest_address <= short_jump;   take_branch <= bg   ? 1'b1 : 1'b0;    end
            `OP_BGE      :  begin dest_address <= short_jump;   take_branch <= bge  ? 1'b1 : 1'b0;    end
            `OP_BGEU     :  begin dest_address <= short_jump;   take_branch <= bgeu ? 1'b1 : 1'b0;    end
            `OP_BGU      :  begin dest_address <= short_jump;   take_branch <= bgu  ? 1'b1 : 1'b0;    end
            `OP_BNE      :  begin dest_address <= short_jump;   take_branch <= neq  ? 1'b1 : 1'b0;    end
            `OP_CALL     :  begin dest_address <= long_jump;    take_branch <= 1'b1;                  end
            `OP_TYPE_RRR :  begin
                                case(inst_function)
                                    `EXT_OP_BR      :   begin dest_address <= data_reg_b;   take_branch <= 1'b1;   end
                                    `EXT_OP_CALLR   :   begin dest_address <= data_reg_b;   take_branch <= 1'b1;   end
                                    `EXT_OP_RETURN  :   begin dest_address <= data_reg_b;   take_branch <= 1'b1;   end
                                    default         :   begin dest_address <= 32'bx00;      take_branch <= 1'b0;   end
                                endcase
                            end
            default      :  begin dest_address <= 32'bx00;      take_branch <= 1'b0;                  end
        endcase
    end
endmodule
