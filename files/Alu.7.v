`ifndef _ALU_
`define _ALU_

`include "Processor.vh"

module Alu(
input [4:0] alu_fn,
input signed [BIT_WIDTH-1:0] in1, in2,
output reg signed [BIT_WIDTH-1:0] out
);

parameter BIT_WIDTH = 32;

always @(*) begin
    case (alu_fn)
        `FN_ADD  : out = in1 + in2;
        `FN_SUB  : out = in1 - in2;
        `FN_AND  : out = in1 & in2;
        `FN_OR   : out = in1 | in2;
        `FN_XOR  : out = in1 ^ in2;
        `FN_NAND : out = ~(in1 & in2);
        `FN_NOR  : out = ~(in1 | in2);
        `FN_XNOR : out = ~(in1 ^ in2);
        `FN_MVHI : out = {in2[BIT_WIDTH-1:16],16'h0000};

        `FN_F    : out = 0;
        `FN_EQ   : out = (in1 == in2) ? 1 : 0;
        `FN_LT   : out = (in1 < in2) ? 1 : 0;
        `FN_LTE  : out = (in1 <= in2) ? 1 : 0;
        `FN_T    : out = 1;
        `FN_NE   : out = (in1 != in2) ? 1 : 0;
        `FN_GTE  : out = (in1 >= in2) ? 1 : 0;
        `FN_GT   : out = (in1 > in2) ? 1 : 0;
        default : out = 0;
    endcase
end

endmodule

`endif //_ALU_