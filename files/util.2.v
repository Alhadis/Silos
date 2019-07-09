`ifdef UTIL
`else
`define UTIL

//control
// `define DATA       "dat/00064x0096"
// `define DATA_s     "dat/00064x0096_s.dat"
// `define DATA_t     "dat/00064x0096_t.dat"
// `define DATA_s_len "dat/00064x0096_s_len.dat"
// `define DATA_S_TOTAL 64

`define DATA       "dat/00256x0256"
`define DATA_s     "dat/00256x0256_s.dat"
`define DATA_t     "dat/00256x0256_t.dat"
`define DATA_s_len "dat/00256x0256_s_len.dat"
`define DATA_S_TOTAL 256

//parameter setting
`define Alpha_Beta_Bit 4
`define V_E_F_Bit 18 // 17 value + 1 signed
`define Match_bit  4 // 4 value

//SRAM
`define Sram_Word 256
`define Sram_Addr 1024
`define Sram_Word_log $clog2(`Sram_Word)
`define Sram_Addr_log $clog2(`Sram_Addr)
`define T_per_word 7
`define BIT_P_GROUP `V_E_F_Bit *2

`define Max_T_size `Sram_Addr * `T_per_word
`define Max_T_size_log $clog2(`Max_T_size)
`define HEADER_BIT  4 //`Sram_Word - (`V_E_F_Bit*2) * `T_per_word

//PEARRAY
`define PE_Array_size 64
`define PE_Array_size_log $clog2(`PE_Array_size)

//QUEUE
`define QUEUE_SIZE 16
`define QUEUE_SIZE_LOG $clog2(`QUEUE_SIZE)

//DATA PROCESSOR
`define DP_LIMIT 96

`include "src/utilModule.v"

`endif