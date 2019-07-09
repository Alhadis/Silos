`ifndef _DECODER_
`define _DECODER_

`include "Processor.vh"

module Decoder(
input [INST_BIT_WIDTH-1:0] data,
output reg [4:0] alu_fn,
output [3:0] opcode,
output reg [REG_INDEX_WIDTH-1:0] src_reg1, src_reg2, dest_reg,
output reg [IMM_BIT_WIDTH-1:0] imm,
output reg [1:0] sel_alu_sr2, sel_reg_din,
output reg wr_reg, wr_mem
);

localparam REG_INDEX_WIDTH = 4;
localparam DATA_BIT_WIDTH = 32;
localparam INST_BIT_WIDTH = 32;
localparam IMM_BIT_WIDTH = 16;

wire [3:0] fn, b_fn;

assign fn = data[31:28];
assign opcode = data[27:24];

always @(*) begin
    src_reg1 = data[7:4];
    src_reg2 = data[11:8];
    dest_reg = data[3:0];
    imm = data[23:8];
    if (opcode == `OP_SW || opcode == `OP_BCOND) begin
        src_reg1 = data[3:0];
        src_reg2 = data[7:4];
    end
end

always @(*) begin
    alu_fn      = 4'bzzzz;;
    wr_mem      = 1'b0;
    wr_reg      = 1'b0;
    sel_reg_din = 2'bzz;
    sel_alu_sr2 = 2'bzz;
    if (data[15:0] != `DEAD) begin
        case (opcode)
            `OP_ALUR: begin
                alu_fn      = {1'b0, fn};
                sel_alu_sr2 = `ALU_SRC2_REG2;
                wr_reg      = 1'b1;
                sel_reg_din = `REG_IN_ALU;
            end
            `OP_ALUI: begin
                alu_fn      = {1'b0, fn};
                sel_alu_sr2 = `ALU_SRC2_IMM;
                wr_reg      = 1'b1;
                sel_reg_din = `REG_IN_ALU;
                if (alu_fn == `FN_MVHI)
                    sel_reg_din = `REG_IN_IMM16;
            end
            `OP_CMPR: begin
                alu_fn      = {1'b1, fn};
                sel_alu_sr2 = `ALU_SRC2_REG2;
                wr_reg      = 1'b1;
                sel_reg_din = `REG_IN_ALU;
            end
            `OP_CMPI: begin
                alu_fn      = {1'b1, fn};
                sel_alu_sr2 = `ALU_SRC2_IMM;
                wr_reg      = 1'b1;
                sel_reg_din = `REG_IN_ALU;
            end
            `OP_BCOND: begin
                sel_alu_sr2 = `ALU_SRC2_REG2;
                alu_fn = {1'b1, fn};
                if (fn[3:2] == 2'b01) begin
                    alu_fn  = {1'b1, 2'b00, fn[1:0]};
                    sel_alu_sr2 = `ALU_SRC2_ZERO;
                end else if (fn[3:2] == 2'b10) begin
                    alu_fn  = {1'b1, 2'b11, fn[1:0]};
                    sel_alu_sr2 = `ALU_SRC2_ZERO;
                end

            end
            `OP_SW: begin
                alu_fn      = {1'b0, `FN_ADD};
                sel_alu_sr2 = `ALU_SRC2_IMM;
                wr_mem      = 1'b1;
            end
            `OP_LW: begin
                alu_fn      = {1'b0, `FN_ADD};
                sel_alu_sr2 = `ALU_SRC2_IMM;
                wr_reg      = 1'b1;
                sel_reg_din = `REG_IN_DOUT;
            end
            `OP_JAL: begin
                alu_fn      = {1'b0, `FN_ADD};
                sel_alu_sr2 = `ALU_SRC2_IMM4;
                sel_reg_din = `REG_IN_PC4;
                wr_reg      = 1'b1;
            end
        endcase
    end
end

endmodule

`endif //_DECODER_