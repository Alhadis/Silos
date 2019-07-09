/***************************************************
 * Module:
 * Project: core_lapido
 * Author:  Filipe Boaventura
 * Description: Arquivo contendo as definicoes de
 * varios aspectios do processador LAPI DOpaCA LAMBA
 ***************************************************/

`define INSTRUCTION_WIDTH   32 // Tamanho da instrucao
`define PC_WIDTH            32 // Tamanho do pc
`define REGISTER_FILE_SIZE  16 // Numero de registradores de proposito geral
`define GPR_WIDTH           32 // Tamanho do registrador de proposito geral
`define GRP_ADDR_WIDTH       5 // Tamanho do endereco do registrador
`define DATA_MEM_ADDR_WIDTH 32 // Tamanho do endereco da memoria de dados
`define DATA_MEM_SIZE     1024 // Tamanho da memoria de dados
`define INST_MEM_SIZE      256 // Tamanho da memoria de instrucao
`define FLAG_REG_WIDTH      32 // Tamanho do registrador de flags

/***************** Instrucao NOP *******************/
`define NOP_INSTRUCTION 32'h20000000 // addi r0,r0,0

/**************** Codigo das flags *****************/
`define FL_ZERO     5'b00000
`define FL_TRUE     5'b00001
`define FL_NEG      5'b00010
`define FL_OVERFLOW 5'b00011
`define FL_NEGZERO  5'b00100
`define FL_CARRY    5'b00101

/******************** opcode ***********************/
`define OP_R_TYPE  6'h00
`define OP_J_TYPE  6'h02
`define OP_JAL     6'h03
`define OP_LOAD    6'h23
`define OP_STORE   6'h2B
`define OP_BEQ     6'h04
`define OP_BNE     6'h05
`define OP_JT      6'h09
`define OP_JF      6'h10
`define OP_ADDI    6'h08
`define OP_ANDI    6'h0C
`define OP_ORI     6'h0D
`define OP_SLTI    6'h0A
`define OP_LCL     6'h01
`define OP_LCH     6'h07
`define OP_LOADLIT 6'h06
`define OP_PASSB      6'h11

/******************* funct *********************/
`define FN_ADD  6'h20
`define FN_SUB  6'h22
`define FN_AND  6'h24
`define FN_OR   6'h25
`define FN_NOT  6'h21
`define FN_XOR  6'h26
`define FN_NOR  6'h27
`define FN_XNOR 6'h28
`define FN_NAND 6'h1B
`define FN_LSL  6'h00
`define FN_LSR  6'h02
`define FN_ASL  6'h04
`define FN_ASR  6'h03
`define FN_SLT  6'h2A
`define FN_JR   6'h08

/***************** Controle ********************/
// Seletores do registrador de destino
`define REG_DST_RT 2'h0
`define REG_DST_RD 2'h1
`define REG_DST_15 2'h2

// Seletores do segundo operando da alu
`define ALU_SRC_REG 2'h0
`define ALU_SRC_IMM 2'h1

// Seletores do salto incondicional
`define SEL_JR 1'h0
`define SEL_J  1'h1

// Seletores do branch
`define SEL_BEQ 1'h0
`define SEL_BNE 1'h1
`define SEL_JF  1'h0
`define SEL_JT  1'h1

// Seleciona entre jt/jf e beq/bne
`define SEL_JFLAG 1'b0
`define SEL_BRANCH 1'b1

// Seletores do mux do WB
`define WB_ALU 2'h0
`define WB_MEM 2'h1
`define WB_PC  2'h2
`define WB_IMM 2'h3

// Seletores dos mux de fowarding
`define FOWARD_EX  2'h2
`define FOWARD_MEM 2'h1
`define NO_FOWARD  2'h0
