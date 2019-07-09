/***************************************************
 * Module: alu
 * Project: core_lapido
 * Author: Afonso Machado e Filipe Boaventura
 * Description: Unidade Logico Aritmetica do
 * processador LAPI DOpaCA LAMBA. Este modulo opera
 * dois valores de 32 bis, de acordo com o código de
 * seleção de operacao da alu. As saidas sao um valor
 * de 32 bits, e uma saida de 6 bits para as flags.
 * A saida flags esta organizada da seginte forma:
 * flags[0] = flag zero
 * flags[1] = flag true
 * flags[2] = flag neg
 * flags[3] = flag overflow
 * flags[4] = flag negzero
 * flags[5] = flag carry
 ***************************************************/
 `include "lapido_defs.v"

module alu
(
    input signed [31:0] op1,   // Primeiro operando
    input signed [31:0] op2,   // Segundo operando
    input [5:0]  alu_funct, // Operacao da alu

    output reg [31:0] alu_res, // resultado da alu
    output reg [5:0] flags     // flags
);

reg [32:0] unsigned_res;

always @ ( * ) begin // quando qualquer entrada mudar, faca...
    unsigned_res = 32'b0;
    case (alu_funct)
        `FN_ADD: begin
            alu_res = op1 + op2;
            unsigned_res = $unsigned(op1) + $unsigned(op2);
            flags[`FL_OVERFLOW] =
                (!op1[31] && !op2[31] && alu_res[31]) ||
                (op1[31] && op2[31] && !alu_res[31]);
            end
        `FN_SUB: begin
            alu_res = op1 - op2;
            unsigned_res = $unsigned(op1) - $unsigned(op2);
            flags[`FL_OVERFLOW] =
                (!op1[31] && op2[31] && alu_res[31]) ||
                (op1[31] && !op2[31] && !alu_res[31]);
            end
        `FN_ASL: begin
            alu_res = op1 <<< 1;
            unsigned_res[32] = op1[31];
            flags[`FL_OVERFLOW] = op1[31] ^ op1[30];
            end
        default: begin
            flags[`FL_OVERFLOW] = 0; // essas operacoes nao causam oveflow
            case (alu_funct)
            `FN_ASR: begin
                alu_res = op1 >>> 1;
                end
            `FN_AND: begin
                alu_res = op1 & op2;
                end
            `FN_NAND: begin
                alu_res = ~(op1 & op2);
                end
            `FN_OR: begin
                alu_res = op1 | op2;
                end
            `FN_NOR: begin
                alu_res = ~(op1 | op2);
                end
            `FN_XNOR: begin
                alu_res = op1 ~^ op2;
                end
            `FN_XOR: begin
                alu_res = op1 ^ op2;
                end
            `FN_NOT: begin
                alu_res = ~op1;
                end
            `FN_LSL: begin
                alu_res = op1 << 1;
                unsigned_res[32] = op1[31];
                end
            `FN_LSR: begin
                alu_res = op1 >> 1;
                end
            `FN_SLT: begin
                if(op1 < op2)
                    begin
                        alu_res = 1;
                    end
                else
                    begin
                        alu_res = 0;
                    end
                end
            `OP_LCL: begin
                // op2 eh o imediato. op1 e o dado do registrador
                alu_res = op2 | (op1 & 32'hffff0000);
            end
            `OP_LCH: begin
                // op2 eh o imediato. op1 e o dado do registrador
                alu_res = (op2 << 16) | (op1 & 32'hffff);
            end
            endcase
            end
    endcase

    flags[`FL_ZERO] = (alu_res == 0);
    flags[`FL_TRUE] = !flags[`FL_ZERO];
    flags[`FL_NEG] = alu_res[31];
    flags[`FL_NEGZERO] = flags[`FL_NEG] | flags[`FL_ZERO];
    flags[`FL_CARRY] = unsigned_res[32];
end

endmodule // alu
