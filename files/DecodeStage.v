`include "Alu.vh"
`include "Decoder.vh"

module DecodeStage #(
    parameter DBITS = 32
) (
    input [DBITS - 1 : 0] instruction,

    output [`FUNC_BITS - 1 : 0] alu_func,
    output [1 : 0] alu_in2_mux,
    output [1 : 0] regfile_in_mux,
    output [3 : 0] regno1,
    output [3 : 0] regno2,
    output [3 : 0] rd,
    output [DBITS - 1 : 0] immOut,
    output regfile_wrtEn,
    output [3 : 0] regfile_wrtRegno,
    output isStore
);

    wire [3 : 0] fn = instruction[31:28];
    wire [3 : 0] opcode = instruction[27:24];
    wire [15 : 0] imm = instruction[23:8];
    wire [3 : 0] rs2 = instruction[11:8];
    wire [3 : 0] rs1 = instruction[7:4];
    assign rd = instruction[3:0];

    assign regno1 = opcode == `STORE || opcode == `BRANCH ? rd : rs1;

    assign regno2 = opcode == `ALUR || opcode == `CMPR ? rs2 :
                    opcode == `STORE || opcode == `BRANCH ? rs1 :
                    4'bzzzz;

    assign regfile_in_mux = opcode == `ALUR || opcode == `ALUI || opcode == `CMPR || opcode == `CMPI
                            ? `REGFILEINSEL_ALUOUT :
                            opcode == `JAL ? `REGFILEINSEL_PCPLUS4 : 
                            opcode == `LOAD ? `REGFILEINSEL_IO :
                            2'bzz;

    assign regfile_wrtEn = opcode == `ALUR || opcode == `ALUI || opcode == `CMPR || 
                            opcode == `CMPI || opcode == `LOAD || opcode == `JAL 
                            ? 1'b1 : 1'b0;

    assign regfile_wrtRegno = rd;

    assign isStore = opcode == `STORE ? 1'b1 : 1'b0;

    assign alu_func = (opcode == `ALUR || opcode == `ALUI) ? (
        fn == `INSTR_ADD ? `ADD :
        fn == `INSTR_SUB ? `SUB :
        fn == `INSTR_AND ? `AND :
        fn == `INSTR_OR ? `OR :
        fn == `INSTR_XOR ? `XOR :
        fn == `INSTR_NAND ? `NAND :
        fn == `INSTR_NOR ? `NOR :
        fn == `INSTR_XNOR ? `XNOR :
        fn == `INSTR_MVHI ? `MVHI :
        5'bzzzzz
    ) : (opcode == `CMPR || opcode == `CMPI) ? (
        fn == `INSTR_F ? `F :
        fn == `INSTR_EQ ? `EQ :
        fn == `INSTR_LT ? `LT :
        fn == `INSTR_LTE ? `LTE :
        fn == `INSTR_T ? `T :
        fn == `INSTR_NE ? `NE :
        fn == `INSTR_GTE ? `GTE :
        fn == `INSTR_GT ? `GT :
        5'bzzzzz
    ) : opcode == `BRANCH ? (
        fn == `INSTR_BF ? `F :
        fn == `INSTR_BEQ ? `EQ :
        fn == `INSTR_BLT ? `LT :
        fn == `INSTR_BLTE ? `LTE :
        fn == `INSTR_BEQZ ? `EQ :
        fn == `INSTR_BLTZ ? `LT :
        fn == `INSTR_BLTEZ ? `LTE :
        fn == `INSTR_BT ? `T :
        fn == `INSTR_BNE ? `NE :
        fn == `INSTR_BGTE ? `GTE :
        fn == `INSTR_BGT ? `GT :
        fn == `INSTR_BNEZ ? `NE :
        fn == `INSTR_BGTEZ ? `GTE :
        fn == `INSTR_BGTZ ? `GT :
        5'bzzzzz
    ) : (opcode == `LOAD || opcode == `STORE) ? (
        `ADD
    ) : 5'bzzzzz;

    assign alu_in2_mux = opcode == `ALUR || opcode == `CMPR ? `ALUIN2SEL_REG :
                     opcode == `ALUI || opcode == `CMPI  || opcode == `LOAD || opcode == `STORE ? `ALUIN2SEL_IMM :
                     opcode == `BRANCH ? (
                        fn == `INSTR_BNEZ ? `ALUIN2SEL_ZERO : 
                        fn == `INSTR_BGTEZ ? `ALUIN2SEL_ZERO : 
                        fn == `INSTR_BGTZ ? `ALUIN2SEL_ZERO :
                        fn == `INSTR_BEQZ ? `ALUIN2SEL_ZERO : 
                        fn == `INSTR_BLTZ ? `ALUIN2SEL_ZERO : 
                        fn == `INSTR_BLTEZ ? `ALUIN2SEL_ZERO : 
                        fn == `INSTR_BF ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BEQ ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BLT ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BLTE ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BT ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BNE ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BGTE ? `ALUIN2SEL_REG : 
                        fn == `INSTR_BGT ? `ALUIN2SEL_REG :
                        2'bzz
                     ) :
                     2'bzz;
    
SignExtension #(.IN_BIT_WIDTH(16), .OUT_BIT_WIDTH(DBITS)) immSext(imm, immOut);

endmodule