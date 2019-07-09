/*
 *******************************************************************************
 *  File Name   :   ada_defines.v
 *  Project     :   ADA processor
 *  Version     :   0.1
 *  Date        :   Aug 1st, 2014
 *  Author      :   Angel Terrones <angelterrones@gmail.com>
 *
 *  Disclaimer  :   Copyright © 2014 Angel Terrones
 *                  Release under the MIT License.
 *
 *  Description :   Language abstraction for the opcodes and other values.
 *******************************************************************************
 */

//------------------------------------------------------------------------------
// Processor info:                 | reserved   | WP | BP | INT  | Rev  |
//------------------------------------------------------------------------------
`define ADA_CPU_INFO            32'b000000000000_1000_1000_100000_000001
`define ADA_INT_NUMBER          32      // 32 external interrupts
`define ADA_WP_NUMBER           8       // 8 watchpoints
`define ADA_BP_NUMBER           8       // 8 breakpoints
`define ADA_SR_NUMBER           16      // 16 Status control registers

//------------------------------------------------------------------------------
// Special GPR Registers
//------------------------------------------------------------------------------
`define ADA_RB_REGISTER         5'd31

//------------------------------------------------------------------------------
// Status Control Register's addresses
//------------------------------------------------------------------------------
`define ADA_SR_PI               5'b00000   // Processor Info Address
`define ADA_SR_SM               5'b00001   // Supervisor Mode Address
`define ADA_SR_IE               5'b00010   // Interrupts Enable Address
`define ADA_SR_EXL              5'b00011   // Exception Mode
`define ADA_SR_IM               5'b00100   // Interrupts Mask Address
`define ADA_SR_IP               5'b00101   // Interrupt Pending Address
`define ADA_SR_ICC              5'b00110   // Instruction Cache Control Address
`define ADA_SR_DCC              5'b00111   // Data Cache Control Address
`define ADA_SR_CC_H             5'b01000   // Cycle Counter Address: High word
`define ADA_SR_CC_L             5'b01001   // Cycle Counter Address: Low word
`define ADA_SR_PIT              5'b01010   // Programmable Interrupt Timer
`define ADA_SR_ITE              5'b01011   // Interrupt Timer Enable
`define ADA_SR_ITA              5'b01100   // Interrupt Timer Acknowledge
`define ADA_SR_EBA              5'b01101   // Exception Base Address Address
`define ADA_SR_EXC_PC           5'b01110   // Exception PC
`define ADA_SR_BAD_ADDRESS      5'b01111   // Address that caused the exception (Load/Store instructions)
`define ADA_SR_EXC_CAUSE        5'b10000   //

//------------------------------------------------------------------------------
// Exception Causes
//------------------------------------------------------------------------------
`define ADA_EXC_RESET           4'b0000 //
`define ADA_EXC_SHUTDOWN        4'b0001 //
`define ADA_EXC_FETCH_ERR       4'b0010 //
`define ADA_EXC_LS_ADDRESS      4'b0011 //
`define ADA_EXC_DIV_ZERO        4'b0100 //
`define ADA_EXC_SYSCALL         4'b0101 //
`define ADA_EXC_BREAKPOINT      4'b0110 //
`define ADA_EXC_BRANCH_ERR      4'b0111 //
`define ADA_EXC_INV_INSTR       4'b1000 //
`define ADA_EXC_PIT             4'b1001 //
`define ADA_EXC_INTERRUPT       4'b1010 //

//------------------------------------------------------------------------------
// Exception Base Address. Default Value
//------------------------------------------------------------------------------
`define ADA_EBA_DEFAULT         32'hA000_0000

//------------------------------------------------------------------------------
// Reset Address.
//------------------------------------------------------------------------------
`define ADA_RESET_DEFAULT       32'hA000_1000

//------------------------------------------------------------------------------
// Physical Space
//------------------------------------------------------------------------------
`define ADA_IO_SPACE_LOW        32'h0000_0000       // 512 MB I/O Space
`define ADA_IO_SPACE_HIGH       32'h1FFF_FFFF
`define ADA_IMEM_SPACE_LOW      32'h2000_0000       // 512 MB Internal Memory
`define ADA_IMEM_SPACE_HIGH     32'h3FFF_FFFF
`define ADA_EMEM_SPACE_LOW      32'h4000_0000       // 3 GB External Memory
`define ADA_EMEM_SPACE_HIGH     32'hFFFF_FFFF

//------------------------------------------------------------------------------
// Virtual Space
//------------------------------------------------------------------------------
`define ADA_USER_SPACE_LOW      32'h0000_0000       // 2GB User Space. Must use MMU (if implemented)
`define ADA_USER_SPACE_HIGH     32'h7FFF_FFFF
`define ADA_KERNEL0_SPACE_LOW   32'h8000_0000       // 512 MB I/O Space. Kernel Mode ONLY
`define ADA_KERNEL0_SPACE_HIGH  32'h9FFF_FFFF
`define ADA_KERNEL1_SPACE_LOW   32'hA000_0000       // 512 MB Boot Code/Internal memory. Bypass Cache
`define ADA_KERNEL1_SPACE_HIGH  32'hBFFF_FFFF
`define ADA_KERNEL2_SPACE_LOW   32'hC000_0000       // 1GB MB OS code. Must use MMU (if implemented)
`define ADA_KERNEL2_SPACE_HIGH  32'hFFFF_FFFF

//------------------------------------------------------------------------------
/*
    Encoding for the ADA Release 1 Architecture

    3 types of instructions:
        - RRR : Register-Register
        - RRI : Register-Immediate
        - J   : Jump

    All cases: Opcode(31-26) is 6-bits wide

    Format:
    ------
        - RRR : Opcode(6) + R0(5) + R1(5) + R2(5) + Imm(11)
        - RRI : Opcode(6) + R0(5) + R1(5) + Imm(16)
        - RI  : Opcode(6) + R0(5) + Imm(21)
*/
//------------------------------------------------------------------------------
// Opcode field for RR instructions
//------------------------------------------------------------------------------
`define OP_TYPE_RRR         6'b00_0000

//------------------------------------------------------------------------------
// Instructions fields
//------------------------------------------------------------------------------
`define ADA_INSTR_OPCODE    31:26
`define ADA_INSTR_R0        25:21
`define ADA_INSTR_R1        20:16
`define ADA_INSTR_R2        15:11
`define ADA_INSTR_SHAMT     10:6
`define ADA_INSTR_FUNCT     5:0
`define ADA_INSTR_IMM16     15:0
`define ADA_INSTR_IMM21     20:0

//------------------------------------------------------------------------------
// Opcode list
//------------------------------------------------------------------------------
`define OP_ADD              `OP_TYPE_RRR
`define OP_ADDI             6'b00_0001      // 0x01
`define OP_AND              `OP_TYPE_RRR
`define OP_ANDI             6'b00_0010      // 0x02
`define OP_B                6'b00_0011      // 0x03
`define OP_BE               6'b00_0100      // 0x04
`define OP_BG               6'b00_0101      // 0x05
`define OP_BGE              6'b00_0110      // 0x06
`define OP_BGEU             6'b00_0111      // 0x07
`define OP_BGU              6'b00_1000      // 0x08
`define OP_BNE              6'b00_1001      // 0x09
`define OP_BR               `OP_TYPE_RRR
`define OP_BREAK            `OP_TYPE_RRR
`define OP_CALL             6'b00_1010      // 0x0A
`define OP_CALLR            `OP_TYPE_RRR
`define OP_CE               `OP_TYPE_RRR
`define OP_CEI              6'b00_1011      // 0x0B
`define OP_CG               `OP_TYPE_RRR
`define OP_CGE              `OP_TYPE_RRR
`define OP_CGEI             6'b00_1100      // 0x0C
`define OP_CGEU             `OP_TYPE_RRR
`define OP_CGEUI            6'b00_1101      // 0x0D
`define OP_CGI              6'b00_1110      // 0x0E
`define OP_CGU               `OP_TYPE_RRR
`define OP_CGUI             6'b00_1111      // 0x0F
`define OP_CNE              `OP_TYPE_RRR
`define OP_CNEI             6'b01_0000      // 0x10
`define OP_DIVS             `OP_TYPE_RRR
`define OP_DIVU             `OP_TYPE_RRR
`define OP_LDSB             6'b01_0001      // 0x11
`define OP_LDSH             6'b01_0010      // 0x12
`define OP_LDUB             6'b01_0011      // 0x13
`define OP_LDUH             6'b01_0100      // 0x14
`define OP_LDUI             6'b01_0101      // 0x15
`define OP_LDW              6'b01_0110      // 0x16
`define OP_MACS             `OP_TYPE_RRR
`define OP_MACU             `OP_TYPE_RRR
`define OP_MASS             `OP_TYPE_RRR
`define OP_MASU             `OP_TYPE_RRR
`define OP_MFH              `OP_TYPE_RRR
`define OP_MFL              `OP_TYPE_RRR
`define OP_MOVE             `OP_TYPE_RRR
`define OP_MTH              `OP_TYPE_RRR
`define OP_MTL              `OP_TYPE_RRR
`define OP_MULS             `OP_TYPE_RRR
`define OP_MULU             `OP_TYPE_RRR
`define OP_NAND             `OP_TYPE_RRR
`define OP_NANDI            6'b01_0111      // 0x17
`define OP_NOR              `OP_TYPE_RRR
`define OP_NORI             6'b01_1000      // 0x18
`define OP_NOT              `OP_TYPE_RRR
`define OP_OR               `OP_TYPE_RRR
`define OP_ORI              6'b01_1001      // 0x19
`define OP_RESET            `OP_TYPE_RRR
`define OP_RETURN           `OP_TYPE_RRR
`define OP_RFE              `OP_TYPE_RRR
`define OP_RFB              `OP_TYPE_RRR
`define OP_RL               `OP_TYPE_RRR
`define OP_RLI              `OP_TYPE_RRR
`define OP_RR               `OP_TYPE_RRR
`define OP_RRI              `OP_TYPE_RRR
`define OP_RSCR             `OP_TYPE_RRR
`define OP_SHUTDOWN         `OP_TYPE_RRR
`define OP_SLL              `OP_TYPE_RRR
`define OP_SLLI             `OP_TYPE_RRR
`define OP_SRA              `OP_TYPE_RRR
`define OP_SRAI             `OP_TYPE_RRR
`define OP_SRL              `OP_TYPE_RRR
`define OP_SRLI             `OP_TYPE_RRR
`define OP_STB              6'b01_1010      // 0x1A
`define OP_STH              6'b01_1011      // 0x1B
`define OP_STW              6'b10_1100      // 0x1C
`define OP_SUB              `OP_TYPE_RRR
`define OP_SYSCALL          `OP_TYPE_RRR
`define OP_WSCR             `OP_TYPE_RRR
`define OP_XNOR             `OP_TYPE_RRR
`define OP_XNORI            6'b01_1101      // 0x1D
`define OP_XOR              `OP_TYPE_RRR
`define OP_XORI             6'b01_1110      // 0x1E

//------------------------------------------------------------------------------
// Functions for RRR-type instructions
//------------------------------------------------------------------------------
`define EXT_OP_ADD          6'b00_0000      // 0x00
`define EXT_OP_AND          6'b00_0001      // 0x01
`define EXT_OP_BR           6'b00_0010      // 0x02
`define EXT_OP_BREAK        6'b00_0011      // 0x03
`define EXT_OP_CALLR        6'b00_0100      // 0x04
`define EXT_OP_CE           6'b00_0101      // 0x05
`define EXT_OP_CG           6'b00_0110      // 0x06
`define EXT_OP_CGE          6'b00_0111      // 0x07
`define EXT_OP_CGEU         6'b00_1000      // 0x08
`define EXT_OP_CGU          6'b00_1001      // 0x09
`define EXT_OP_CNE          6'b00_1010      // 0x0A
`define EXT_OP_DIVS         6'b00_1011      // 0x0B
`define EXT_OP_DIVU         6'b00_1100      // 0x0C
`define EXT_OP_MACS         6'b00_1101      // 0x0D
`define EXT_OP_MACU         6'b00_1110      // 0x0E
`define EXT_OP_MASS         6'b00_1111      // 0x0F
`define EXT_OP_MASU         6'b01_0000      // 0x10
`define EXT_OP_MFH          6'b01_0001      // 0x11
`define EXT_OP_MFL          6'b01_0010      // 0x12
`define EXT_OP_MOVE         6'b01_0011      // 0x13
`define EXT_OP_MTH          6'b01_0100      // 0x14
`define EXT_OP_MTL          6'b01_0101      // 0x15
`define EXT_OP_MULS         6'b01_0110      // 0x16
`define EXT_OP_MULU         6'b01_0111      // 0x17
`define EXT_OP_NAND         6'b01_1000      // 0x18
`define EXT_OP_NOR          6'b01_1001      // 0x19
`define EXT_OP_NOT          6'b01_1010      // 0x1A
`define EXT_OP_OR           6'b01_1011      // 0x1B
`define EXT_OP_RESET        6'b01_1100      // 0x1C
`define EXT_OP_RETURN       6'b01_1101      // 0x1D
`define EXT_OP_RFE          6'b01_1110      // 0x1E
`define EXT_OP_RFB          6'b01_1111      // 0x1F
`define EXT_OP_RL           6'b10_0000      // 0x20
`define EXT_OP_RLI          6'b10_0001      // 0x21
`define EXT_OP_RR           6'b10_0010      // 0x22
`define EXT_OP_RRI          6'b10_0011      // 0x23
`define EXT_OP_RSCR         6'b10_0100      // 0x24
`define EXT_OP_SHUTDOWN     6'b10_0101      // 0x25
`define EXT_OP_SLL          6'b10_0110      // 0x26
`define EXT_OP_SLLI         6'b10_0111      // 0x27
`define EXT_OP_SRA          6'b10_1000      // 0x28
`define EXT_OP_SRAI         6'b10_1001      // 0x29
`define EXT_OP_SRL          6'b10_1010      // 0x2A
`define EXT_OP_SRLI         6'b10_1011      // 0x2B
`define EXT_OP_SUB          6'b10_1100      // 0x2C
`define EXT_OP_SYSCALL      6'b10_1101      // 0x2D
`define EXT_OP_WSCR         6'b10_1110      // 0x2E
`define EXT_OP_XNOR         6'b10_1111      // 0x2F
`define EXT_OP_XOR          6'b11_0000      // 0x30

//------------------------------------------------------------------------------
// ALU Operations
//------------------------------------------------------------------------------
`define ALU_OP_ADD          5'd0
`define ALU_OP_SUB          5'd1
`define ALU_OP_AND          5'd2
`define ALU_OP_NAND         5'd3
`define ALU_OP_DIVS         5'd4
`define ALU_OP_DIVU         5'd5
`define ALU_OP_MACS         5'd6
`define ALU_OP_MACU         5'd7
`define ALU_OP_MASS         5'd8
`define ALU_OP_MASU         5'd9
`define ALU_OP_MULS         5'd10
`define ALU_OP_MULU         5'd11
`define ALU_OP_NOR          5'd12
`define ALU_OP_NOT          5'd13
`define ALU_OP_OR           5'd14
`define ALU_OP_RL           5'd15
`define ALU_OP_RR           5'd16
`define ALU_OP_SLL          5'd17
`define ALU_OP_SRA          5'd18
`define ALU_OP_SRL          5'd19
`define ALU_OP_XNOR         5'd20
`define ALU_OP_XOR          5'd21
`define ALU_OP_MFH          5'd22
`define ALU_OP_MFL          5'd23
`define ALU_OP_MTH          5'd24
`define ALU_OP_MTL          5'd25
`define ALU_OP_CE           5'd26
`define ALU_OP_CGE          5'd27
`define ALU_OP_CGEU         5'd28
`define ALU_OP_CG           5'd29
`define ALU_OP_CGU          5'd30
`define ALU_OP_CNE          5'd31

//------------------------------------------------------------------------------
/*
    Datapath controls.
    All signals are active High.

    Bit     Name                Description
    ------------------------------------------------------------------------
        16 :    exu_operation       Operation to execute
        15 :
        14 :
        13 :
        12 :
        11 :    exu_port_b_select   Select from GPRB, SExt Imm16, ZExt Imm16, Shamt, NPC, Imm16 << 16, CSR
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
    ------------------------------------------------------------------------
*/
//                                                 1           0
//                                          65432 1098 7654 3210
`define DP_NONE                        17'b0_0000_0000_0000_0000
`define DP_ADD                {`ALU_OP_ADD,   12'b0000_1000_0000}
`define DP_ADDI               {`ALU_OP_ADD,   12'b0100_1000_0000}
`define DP_AND                {`ALU_OP_AND,   12'b0000_1000_0000}
`define DP_ANDI               {`ALU_OP_AND,   12'b0100_1000_0000}
`define DP_B                           17'b0_0000_0000_0000_0000
`define DP_BR                          17'b0_0000_0000_0000_0000
`define DP_BE                          17'b0_0000_0001_0000_0000
`define DP_BG                          17'b0_0000_0001_0000_0000
`define DP_BGE                         17'b0_0000_0001_0000_0000
`define DP_BGEU                        17'b0_0000_0001_0000_0000
`define DP_BGU                         17'b0_0000_0001_0000_0000
`define DP_BNE                         17'b0_0000_0001_0000_0000
`define DP_BREAK                       17'b0_0000_0000_0000_0000
`define DP_CALL                        17'b0_0000_1000_1000_0000
`define DP_CALLR                       17'b0_0000_1000_1000_0000
`define DP_CE                 {`ALU_OP_CE,    12'b0000_1000_0000}
`define DP_CG                 {`ALU_OP_CG,    12'b0000_1000_0000}
`define DP_CGE                {`ALU_OP_CGE,   12'b0000_1000_0000}
`define DP_CGEU               {`ALU_OP_CGEU,  12'b0000_1000_0000}
`define DP_CGU                {`ALU_OP_CGU,   12'b0000_1000_0000}
`define DP_CNE                {`ALU_OP_CNE,   12'b0000_1000_0000}
`define DP_CEI                {`ALU_OP_CE,    12'b0010_1000_0000}
`define DP_CGEI               {`ALU_OP_CGE,   12'b0010_1000_0000}
`define DP_CGEUI              {`ALU_OP_CGEU,  12'b0100_1000_0000}
`define DP_CGI                {`ALU_OP_CG,    12'b0010_1000_0000}
`define DP_CGUI               {`ALU_OP_CGU,   12'b0100_1000_0000}
`define DP_CNEI               {`ALU_OP_CNE,   12'b0010_1000_0000}
`define DP_DIVS               {`ALU_OP_DIVS,  12'b0000_0000_0000}
`define DP_DIVU               {`ALU_OP_DIVU,  12'b0000_0000_0000}
`define DP_LDSB               {`ALU_OP_ADD,   12'b0010_1001_1011}
`define DP_LDSH               {`ALU_OP_ADD,   12'b0010_1001_0111}
`define DP_LDUB               {`ALU_OP_ADD,   12'b0010_1001_1001}
`define DP_LDUH               {`ALU_OP_ADD,   12'b0010_1001_0101}
`define DP_LDUI               {`ALU_OP_ADD,   12'b1010_1000_0000}
`define DP_LDW                {`ALU_OP_ADD,   12'b0010_1001_0001}
`define DP_MACS               {`ALU_OP_MACS,  12'b0000_0000_0000}
`define DP_MACU               {`ALU_OP_MACU,  12'b0000_0000_0000}
`define DP_MASS               {`ALU_OP_MASS,  12'b0000_0000_0000}
`define DP_MASU               {`ALU_OP_MASU,  12'b0000_0000_0000}
`define DP_MFH                {`ALU_OP_MFH,   12'b0000_1000_0000}
`define DP_MFL                {`ALU_OP_MFL,   12'b0000_1000_0000}
`define DP_MOVE                        17'b0_0000_0000_1000_0000
`define DP_MTH                {`ALU_OP_MTH,   12'b0000_0000_0000}
`define DP_MTL                {`ALU_OP_MTL,   12'b0000_0000_0000}
`define DP_MULS               {`ALU_OP_MULS,  12'b0000_1000_0000}
`define DP_MULU               {`ALU_OP_MULU,  12'b0000_1000_0000}
`define DP_NAND               {`ALU_OP_NAND,  12'b0000_1000_0000}
`define DP_NANDI              {`ALU_OP_NAND,  12'b0100_1000_0000}
`define DP_NOR                {`ALU_OP_NOR,   12'b0000_1000_0000}
`define DP_NORI               {`ALU_OP_NOR,   12'b0100_1000_0000}
`define DP_NOT                {`ALU_OP_NOT,   12'b0000_1000_0000}
`define DP_OR                 {`ALU_OP_OR,    12'b0000_1000_0000}
`define DP_ORI                {`ALU_OP_OR,    12'b0100_1000_0000}
`define DP_RESET                       17'b0_0000_0000_0000_0000
`define DP_RETURN                      17'b0_0000_0000_0000_0000
`define DP_RFE                         17'b0_0000_0000_0000_0000
`define DP_RFB                         17'b0_0000_0000_0000_0000
`define DP_RL                 {`ALU_OP_RL,    12'b0000_1000_0000}
`define DP_RLI                {`ALU_OP_RL,    12'b0010_1000_0000}
`define DP_RR                 {`ALU_OP_RR,    12'b0010_1000_0000}
`define DP_RRI                {`ALU_OP_RR,    12'b0010_1000_0000}
`define DP_RSCR                        17'b0_0000_1100_1000_0000
`define DP_SHUTDOWN                    17'b0_0000_0000_0000_0000
`define DP_SLL                {`ALU_OP_SLL,   12'b0000_1000_0000}
`define DP_SLLI               {`ALU_OP_SLL,   12'b0100_1000_0000}
`define DP_SRA                {`ALU_OP_SRA,   12'b0000_1000_0000}
`define DP_SRAI               {`ALU_OP_SRA,   12'b0100_1000_0000}
`define DP_SRL                {`ALU_OP_SRL,   12'b0000_1000_0000}
`define DP_SRLI               {`ALU_OP_SRL,   12'b0100_1000_0000}
`define DP_STB                {`ALU_OP_ADD,   12'b0011_0010_1000}
`define DP_STH                {`ALU_OP_ADD,   12'b0011_0010_0100}
`define DP_STW                {`ALU_OP_ADD,   12'b0011_0010_0000}
`define DP_SUB                {`ALU_OP_SUB,   12'b0000_1000_0000}
`define DP_SYSCALL                     17'b0_0000_0000_0000_0000
`define DP_WSCR                        17'b0_0000_0000_0100_0000
`define DP_XNOR               {`ALU_OP_XNOR,  12'b0000_1000_0000}
`define DP_XNORI              {`ALU_OP_XNOR,  12'b0100_1000_0000}
`define DP_XOR                {`ALU_OP_XOR,   12'b0000_1000_0000}
`define DP_XORI               {`ALU_OP_XOR,   12'b0100_1000_0000}

//------------------------------------------------------------------------------
// Exception potential
// bit 0: Can generate exception in MEM
// bit 1: Can generate exception in EX
// bit 2: Can generate exception in ID
//------------------------------------------------------------------------------
`define EXC_NONE              3'b000
`define EXC_ADD               3'b000
`define EXC_ADDI              3'b000
`define EXC_AND               3'b000
`define EXC_ANDI              3'b000
`define EXC_B                 3'b100
`define EXC_BE                3'b100
`define EXC_BG                3'b100
`define EXC_BGE               3'b100
`define EXC_BGEU              3'b100
`define EXC_BGU               3'b100
`define EXC_BNE               3'b100
`define EXC_BR                3'b100
`define EXC_BREAK             3'b100
`define EXC_CALL              3'b100
`define EXC_CALLR             3'b100
`define EXC_CE                3'b000
`define EXC_CEI               3'b000
`define EXC_CG                3'b000
`define EXC_CGE               3'b000
`define EXC_CGEI              3'b000
`define EXC_CGEU              3'b000
`define EXC_CGEUI             3'b000
`define EXC_CGI               3'b000
`define EXC_CGU               3'b000
`define EXC_CGUI              3'b000
`define EXC_CNE               3'b000
`define EXC_CNEI              3'b000
`define EXC_DIVS              3'b010
`define EXC_DIVU              3'b010
`define EXC_LDSB              3'b001
`define EXC_LDSH              3'b001
`define EXC_LDUB              3'b001
`define EXC_LDUH              3'b001
`define EXC_LDUI              3'b000
`define EXC_LDW               3'b001
`define EXC_MACS              3'b000
`define EXC_MACU              3'b000
`define EXC_MASS              3'b000
`define EXC_MASU              3'b000
`define EXC_MFH               3'b000
`define EXC_MFL               3'b000
`define EXC_MOVE              3'b000
`define EXC_MTH               3'b000
`define EXC_MTL               3'b000
`define EXC_MULS              3'b000
`define EXC_MULU              3'b000
`define EXC_NAND              3'b000
`define EXC_NANDI             3'b000
`define EXC_NOR               3'b000
`define EXC_NORI              3'b000
`define EXC_NOT               3'b000
`define EXC_OR                3'b000
`define EXC_ORI               3'b000
`define EXC_RESET             3'b100
`define EXC_RETURN            3'b000
`define EXC_RFE               3'b100
`define EXC_RFB               3'b100
`define EXC_RL                3'b000
`define EXC_RLI               3'b000
`define EXC_RR                3'b000
`define EXC_RRI               3'b000
`define EXC_RSCR              3'b100
`define EXC_SHUTDOWN          3'b100
`define EXC_SLL               3'b000
`define EXC_SLLI              3'b000
`define EXC_SRA               3'b000
`define EXC_SRAI              3'b000
`define EXC_SRL               3'b000
`define EXC_SRLI              3'b000
`define EXC_STB               3'b001
`define EXC_STH               3'b001
`define EXC_STW               3'b001
`define EXC_SUB               3'b000
`define EXC_SYSCALL           3'b100
`define EXC_WSCR              3'b100
`define EXC_XNOR              3'b000
`define EXC_XNORI             3'b000
`define EXC_XOR               3'b000
`define EXC_XORI              3'b000
