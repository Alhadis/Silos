// ALU for a 6502 cpu


module alu(
    input clk,
    input [2:0] op,
    input [7:0] a,
    input [7:0] b,
    input c_in,
    output reg [7:0] result,
    output reg c_out,
    output reg z_out,
    output reg v_out,
    output reg n_out);

`include "cpu6502/alu.vh"
always @*
begin
    case (op)
        ALU_OR:
            result <= a | b;
        ALU_AND:
            result <= a & b;
        ALU_EOR:
            result <= a ^ b;
        ALU_ADC:
        begin
            {c_out, result} <= {1'b0, a} + {1'b0, b} + {8'b0, c_in};
            v_out <= ~(a[7] ^ b[7]) & (a[7] ^ result[7]);
        end
        ALU_SHL:
            {c_out, result} <= {a, c_in};
        ALU_SHR:
            {result, c_out} <= {c_in, a};
        ALU_CMP,
        ALU_SBC:
        begin
            {c_out, result} <= {1'b0, a} + {1'b0, ~b} + {8'b0, c_in};
            v_out <= (a[7] ^ b[7]) & (a[7] ^ result[7]);
        end
    endcase
    n_out <= result[7];
    z_out <= ~|result;
end
endmodule
