/*
 *******************************************************************************
 *  File Name   :   ada_idu.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 6th, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   The instruction decoder.
 *                  This module generate the controls and data inputs for the
 *                  processor
 *******************************************************************************
 */
`include "ada_defines.v"

module ada_idu(
    input   [5:0]   opcode,             // The instruction opcode
    input   [5:0]   op_function,        // For RR-type instruction
    input           system_mode,        // 1 for privilege (kernel) mode.

    output          exc_op_reset,       // reset the processor
    output          exc_op_shutdown,    // halt the processor
    output          exc_op_syscall,     // syscall exception
    output          exc_op_break,       // break exception
    output          exc_op_invalid,     // Invalid instruction
    output          exc_op_rfe,         // return from exception
    output          exc_op_rfb,         // return from breakpoint
    output  [4:0]   exu_operation,      // The EXU opcode/operand
    output  [2:0]   exu_port_b_select,  // Select: GPRB, SExt Imm16, ZExt Imm16, Shamt, PC, CSR
    output          gpr_port_b_select,  // Select the source to GPR RAB: R2(0)/R0(1)
    output          exu_gpr_we,         // GPR's WE.
    output          sr_we,              // Control & System Module's WE.
    output          mem_write,          // Enable Write to Data Memory
    output          mem_read,           // Enable Read from Data Memory
    output          mem_byte,           // Read/Write one byte
    output          mem_halfword,       // Read/Write halfword (16 bits)
    output          mem_sign_ext,       // Get the byte/Halfword sign/zero extended
    output          mem_exu_mem_select, // Select the source to WB: MEM or EXU
    output          id_can_exception,   // ID instruction can generate an exception
    output          ex_can_exception,   // EX instruction can generate an exception
    output          mem_can_exception   // MEM instruction can generate an exception
    );

    //--------------------------------------------------------------------------
    // Signal Declaration: reg
    //--------------------------------------------------------------------------
    reg     [16:0]  datapath;       // Hold all the controls, but the exceptions/hazard signals
    reg             invalid_inst;   //
    reg     [2:0]   exception;      //

    //--------------------------------------------------------------------------
    // assigments
    //--------------------------------------------------------------------------
    /*
        datapath controls.
        All signals are active High.

        Bit     Name                Description
    ----------------------------------------------------------------------------
        21 :    exc_op_reset        Reset instruction
        20 :    exc_op_shutdown     Shutdown instruction
        19 :    exc_op_syscall      Syscall instruction
        18 :    exc_op_break        Break instruction
        17 :    exc_op_invalid      Invalid instruction
        16 :    exu_operation       Operation to execute
        15 :
        14 :
        13 :
        12 :
        11 :    exu_port_b_select   Select from GPRB, SExt Imm16, ZExt Imm16, Shamt, NPC, Imm16 << 16, SR
        10 :                                    0     1           2           3      4    5            6
        9  :
        8  :    gpr_port_b_select   Select the source to GPR RAB: R2(0)/R0(1)
        7  :    exu_gpr_we          GPR's WE.
        6  :    csm_write           Enable write to Control module's registers
        5  :    mem_write           Enable write to data memory (word)
        4  :    mem_read            Enable read from memory (word)
        3  :    mem_byte            Enable read/write one byte
        2  :    mem_halfword        Enable read/write 2 bytes (16 bits data)
        1  :    mem_sign_ext        Get the byte/halfword as sign(1)/zero(0) extended
        0  :    mem_select_exu_mem  Select the source to WB: EXU(0) or MEM(1)
    ----------------------------------------------------------------------------
    */
    assign exc_op_syscall     = (opcode == `OP_TYPE_RRR) && (op_function == `EXT_OP_SYSCALL);
    assign exc_op_break       = (opcode == `OP_TYPE_RRR) && (op_function == `EXT_OP_BREAK);
    assign exc_op_invalid     = invalid_inst;
    assign exu_operation      = datapath[16:12];
    assign exu_port_b_select  = datapath[11:9];
    assign gpr_port_b_select  = datapath[8];
    assign exu_gpr_we         = datapath[7];
    assign sr_we             = datapath[6];
    assign mem_write          = datapath[5];
    assign mem_read           = datapath[4];
    assign mem_byte           = datapath[3];
    assign mem_halfword       = datapath[2];
    assign mem_sign_ext       = datapath[1];
    assign mem_exu_mem_select = datapath[0];
    assign exc_op_reset       = (system_mode && (opcode == `OP_TYPE_RRR) && (op_function == `EXT_OP_RESET))    ? 1'b1 : 1'b0;
    assign exc_op_shutdown    = (system_mode && (opcode == `OP_TYPE_RRR) && (op_function == `EXT_OP_SHUTDOWN)) ? 1'b1 : 1'b0;
    assign exc_op_rfe         = (system_mode && (opcode == `OP_TYPE_RRR) && (op_function == `EXT_OP_RFE))      ? 1'b1 : 1'b0;
    assign exc_op_rfb         = (system_mode && (opcode == `OP_TYPE_RRR) && (op_function == `EXT_OP_RFB))      ? 1'b1 : 1'b0;

    assign id_can_exception   = exception[2];
    assign ex_can_exception   = exception[1];
    assign mem_can_exception  = exception[0];

    //--------------------------------------------------------------------------
    // determine if the instruction is invalid in User mode (system_mode == 0)
    //--------------------------------------------------------------------------
    always @(*) begin
        invalid_inst <= 1'b0;
        if (~system_mode) begin
            if (opcode ==`OP_TYPE_RRR) begin
                case (op_function)
                    `EXT_OP_RESET       :   invalid_inst <= 1'b1;
                    `EXT_OP_RFE         :   invalid_inst <= 1'b1;
                    `EXT_OP_RFB         :   invalid_inst <= 1'b1;
                    `EXT_OP_SHUTDOWN    :   invalid_inst <= 1'b1;
                    `EXT_OP_RSCR        :   invalid_inst <= 1'b1;
                    `EXT_OP_WSCR        :   invalid_inst <= 1'b1;
                    default             :   invalid_inst <= 1'b0;
                endcase
            end
        end
    end

    //--------------------------------------------------------------------------
    // set the control signals
    //--------------------------------------------------------------------------
    always @(*) begin
        case(opcode)
            `OP_TYPE_RRR    :   begin
                                    case(op_function)
                                        `EXT_OP_ADD         :   begin datapath <= `DP_ADD;      exception <= `EXC_ADD;      end
                                        `EXT_OP_AND         :   begin datapath <= `DP_AND;      exception <= `EXC_AND;      end
                                        `EXT_OP_BR          :   begin datapath <= `DP_BR;       exception <= `EXC_BR;       end
                                        `EXT_OP_BREAK       :   begin datapath <= `DP_BREAK;    exception <= `EXC_BREAK;    end
                                        `EXT_OP_CALLR       :   begin datapath <= `DP_CALLR;    exception <= `EXC_CALLR;    end
                                        `EXT_OP_CE          :   begin datapath <= `DP_CE;       exception <= `EXC_CE;       end
                                        `EXT_OP_CG          :   begin datapath <= `DP_CG;       exception <= `EXC_CG;       end
                                        `EXT_OP_CGE         :   begin datapath <= `DP_CGE;      exception <= `EXC_CGE;      end
                                        `EXT_OP_CGEU        :   begin datapath <= `DP_CGEU;     exception <= `EXC_CGEU;     end
                                        `EXT_OP_CGU         :   begin datapath <= `DP_CGU;      exception <= `EXC_CGU;      end
                                        `EXT_OP_CNE         :   begin datapath <= `DP_CNE;      exception <= `EXC_CNE;      end
                                        `EXT_OP_DIVS        :   begin datapath <= `DP_DIVS;     exception <= `EXC_DIVS;     end
                                        `EXT_OP_DIVU        :   begin datapath <= `DP_DIVU;     exception <= `EXC_DIVU;     end
                                        `EXT_OP_MACS        :   begin datapath <= `DP_MACS;     exception <= `EXC_MACS;     end
                                        `EXT_OP_MACU        :   begin datapath <= `DP_MACU;     exception <= `EXC_MACU;     end
                                        `EXT_OP_MASS        :   begin datapath <= `DP_MASS;     exception <= `EXC_MASS;     end
                                        `EXT_OP_MASU        :   begin datapath <= `DP_MASU;     exception <= `EXC_MASU;     end
                                        `EXT_OP_MFH         :   begin datapath <= `DP_MFH;      exception <= `EXC_MFH;      end
                                        `EXT_OP_MFL         :   begin datapath <= `DP_MFL;      exception <= `EXC_MFL;      end
                                        `EXT_OP_MOVE        :   begin datapath <= `DP_MOVE;     exception <= `EXC_MOVE;     end
                                        `EXT_OP_MTH         :   begin datapath <= `DP_MTH;      exception <= `EXC_MTH;      end
                                        `EXT_OP_MTL         :   begin datapath <= `DP_MTL;      exception <= `EXC_MTL;      end
                                        `EXT_OP_MULS        :   begin datapath <= `DP_MULS;     exception <= `EXC_MULS;     end
                                        `EXT_OP_MULU        :   begin datapath <= `DP_MULU;     exception <= `EXC_MULU;     end
                                        `EXT_OP_NAND        :   begin datapath <= `DP_NAND;     exception <= `EXC_NAND;     end
                                        `EXT_OP_NOR         :   begin datapath <= `DP_NOR;      exception <= `EXC_NOR;      end
                                        `EXT_OP_NOT         :   begin datapath <= `DP_NOT;      exception <= `EXC_NOT;      end
                                        `EXT_OP_OR          :   begin datapath <= `DP_OR;       exception <= `EXC_OR;       end
                                        `EXT_OP_RESET       :   begin datapath <= `DP_RESET;    exception <= `EXC_RESET;    end
                                        `EXT_OP_RETURN      :   begin datapath <= `DP_RETURN;   exception <= `EXC_RETURN;   end
                                        `EXT_OP_RFE         :   begin datapath <= `DP_RFE;      exception <= `EXC_RFE;      end
                                        `EXT_OP_RFB         :   begin datapath <= `DP_RFB;      exception <= `EXC_RFB;      end
                                        `EXT_OP_RL          :   begin datapath <= `DP_RL;       exception <= `EXC_RL;       end
                                        `EXT_OP_RLI         :   begin datapath <= `DP_RLI;      exception <= `EXC_RLI;      end
                                        `EXT_OP_RR          :   begin datapath <= `DP_RR;       exception <= `EXC_RR;       end
                                        `EXT_OP_RRI         :   begin datapath <= `DP_RRI;      exception <= `EXC_RRI;      end
                                        `EXT_OP_RSCR        :   begin datapath <= `DP_RSCR;     exception <= `EXC_RSCR;     end
                                        `EXT_OP_SHUTDOWN    :   begin datapath <= `DP_SHUTDOWN; exception <= `EXC_SHUTDOWN; end
                                        `EXT_OP_SLL         :   begin datapath <= `DP_SLL;      exception <= `EXC_SLL;      end
                                        `EXT_OP_SLLI        :   begin datapath <= `DP_SLLI;     exception <= `EXC_SLLI;     end
                                        `EXT_OP_SRA         :   begin datapath <= `DP_SRA;      exception <= `EXC_SRA;      end
                                        `EXT_OP_SRAI        :   begin datapath <= `DP_SRAI;     exception <= `EXC_SRAI;     end
                                        `EXT_OP_SRL         :   begin datapath <= `DP_SRL;      exception <= `EXC_SRL;      end
                                        `EXT_OP_SRLI        :   begin datapath <= `DP_SRLI;     exception <= `EXC_SRLI;     end
                                        `EXT_OP_SUB         :   begin datapath <= `DP_SUB;      exception <= `EXC_SUB;      end
                                        `EXT_OP_SYSCALL     :   begin datapath <= `DP_SYSCALL;  exception <= `EXC_SYSCALL;  end
                                        `EXT_OP_WSCR        :   begin datapath <= `DP_WSCR;     exception <= `EXC_WSCR;     end
                                        `EXT_OP_XNOR        :   begin datapath <= `DP_XNOR;     exception <= `EXC_XNOR;     end
                                        `EXT_OP_XOR         :   begin datapath <= `DP_XOR;      exception <= `EXC_XOR;      end
                                        default             :   begin datapath <= `DP_NONE;     exception <= `EXC_NONE;     end
                                    endcase
                                end
            `OP_ADDI        :   begin datapath <= `DP_ADDI;  exception <= `EXC_ADDI;  end
            `OP_ANDI        :   begin datapath <= `DP_ANDI;  exception <= `EXC_ANDI;  end
            `OP_B           :   begin datapath <= `DP_B;     exception <= `EXC_B;     end
            `OP_BE          :   begin datapath <= `DP_BE;    exception <= `EXC_BE;    end
            `OP_BG          :   begin datapath <= `DP_BG;    exception <= `EXC_BG;    end
            `OP_BGE         :   begin datapath <= `DP_BGE;   exception <= `EXC_BGE;   end
            `OP_BGEU        :   begin datapath <= `DP_BGEU;  exception <= `EXC_BGEU;  end
            `OP_BGU         :   begin datapath <= `DP_BGU;   exception <= `EXC_BGU;   end
            `OP_BNE         :   begin datapath <= `DP_BNE;   exception <= `EXC_BNE;   end
            `OP_CALL        :   begin datapath <= `DP_CALL;  exception <= `EXC_CALL;  end
            `OP_CEI         :   begin datapath <= `DP_CEI;   exception <= `EXC_CEI;   end
            `OP_CGEI        :   begin datapath <= `DP_CGEI;  exception <= `EXC_CGEI;  end
            `OP_CGEUI       :   begin datapath <= `DP_CGEUI; exception <= `EXC_CGEUI; end
            `OP_CGI         :   begin datapath <= `DP_CGI;   exception <= `EXC_CGI;   end
            `OP_CGUI        :   begin datapath <= `DP_CGUI;  exception <= `EXC_CGUI;  end
            `OP_CNEI        :   begin datapath <= `DP_CNEI;  exception <= `EXC_CNEI;  end
            `OP_LDSB        :   begin datapath <= `DP_LDSB;  exception <= `EXC_LDSB;  end
            `OP_LDSH        :   begin datapath <= `DP_LDSH;  exception <= `EXC_LDSH;  end
            `OP_LDUB        :   begin datapath <= `DP_LDUB;  exception <= `EXC_LDUB;  end
            `OP_LDUH        :   begin datapath <= `DP_LDUH;  exception <= `EXC_LDUH;  end
            `OP_LDUI        :   begin datapath <= `DP_LDUI;  exception <= `EXC_LDUI;  end
            `OP_LDW         :   begin datapath <= `DP_LDW;   exception <= `EXC_LDW;   end
            `OP_NANDI       :   begin datapath <= `DP_NANDI; exception <= `EXC_NANDI; end
            `OP_NORI        :   begin datapath <= `DP_NORI;  exception <= `EXC_NORI;  end
            `OP_ORI         :   begin datapath <= `DP_ORI;   exception <= `EXC_ORI;   end
            `OP_STB         :   begin datapath <= `DP_STB;   exception <= `EXC_STB;   end
            `OP_STH         :   begin datapath <= `DP_STH;   exception <= `EXC_STH;   end
            `OP_STW         :   begin datapath <= `DP_STW;   exception <= `EXC_STW;   end
            `OP_XNORI       :   begin datapath <= `DP_XNORI; exception <= `EXC_XNORI; end
            `OP_XORI        :   begin datapath <= `DP_XORI;  exception <= `EXC_XORI;  end
            default         :   begin datapath <= `DP_NONE;  exception <= `EXC_NONE;  end
        endcase
    end
endmodule
