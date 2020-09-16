@0;moduleinfo.sc;5;15;0;gnuc;4;2;0

F10;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/DATA_mem_DATA_MEM.h
F9;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/WB.h
F8;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/MUX_2-1_MUX_2_1.h
F7;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/Mux_4-1_MUX_4_1.h
F6;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/DUAL_PORT_MEMORY.h
F5;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/Theuseus_Risc_V_top_main.cpp
F4;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/Theuseus_Risc_V_top_Theseus_CPU.h
F3;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/Fetch_Fetch.h
F2;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/decode.h
F1;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/ALU.h
F0;C:/Users/sggkalfo/Desktop/riscV_systemc pipelined/immidiate_extend_sign_extend.h


T23;<pointer>;11;65536;4;4;0;0;<NONE>

M22;DATA_MEM<32U>;19;12288;1476;1476;0;0;Theuseus_Risc_V_top_main.dbs;F10;L8
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;clk;12;132;Theuseus_Risc_V_top_main.dbs;T14;F10;L11
P0;reset;12;248;Theuseus_Risc_V_top_main.dbs;T14;F10;L12
P0;addr;12;364;Theuseus_Risc_V_top_main.dbs;T8;F10;L13
P0;control_registers;12;472;Theuseus_Risc_V_top_main.dbs;T8;F10;L14
P0;PC_from_rs2_data_to_Store;12;580;Theuseus_Risc_V_top_main.dbs;T8;F10;L15
P0;ALU_result_to_WB;20;688;Theuseus_Risc_V_top_main.dbs;T8;F10;L16
P0;control_registers_WB;20;800;Theuseus_Risc_V_top_main.dbs;T8;F10;L17
P0;jump_address;20;912;Theuseus_Risc_V_top_main.dbs;T8;F10;L18
P0;stall_j;20;1024;Theuseus_Risc_V_top_main.dbs;T14;F10;L19
P0;take_branch;12;1144;Theuseus_Risc_V_top_main.dbs;T14;F10;L20
P0;PC_MEM;12;1260;Theuseus_Risc_V_top_main.dbs;T8;F10;L21
P0;immidiate_to_MEM;12;1368;Theuseus_Risc_V_top_main.dbs;T8;F10;L22
N0;DATA_MEM;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F10;L29
N0;write_or_read_data;();Theuseus_Risc_V_top_main.dbs;F10;L37
N0;jump_block;();Theuseus_Risc_V_top_main.dbs;F10;L57

M21;Decode<32U>;19;13312;7752;7752;0;0;Theuseus_Risc_V_top_main.dbs;F2;L8
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;clk;12;132;Theuseus_Risc_V_top_main.dbs;T14;F2;L11
P0;reset;12;248;Theuseus_Risc_V_top_main.dbs;T14;F2;L12
P0;instruction;12;364;Theuseus_Risc_V_top_main.dbs;T8;F2;L13
P0;PC_dec;12;472;Theuseus_Risc_V_top_main.dbs;T8;F2;L14
P0;rd_en;12;580;Theuseus_Risc_V_top_main.dbs;T14;F2;L15
P0;rd_data;12;696;Theuseus_Risc_V_top_main.dbs;T8;F2;L16
P0;rd_address;12;804;Theuseus_Risc_V_top_main.dbs;T3;F2;L17
P0;stall_j;12;912;Theuseus_Risc_V_top_main.dbs;T14;F2;L18
P0;PC;12;1028;Theuseus_Risc_V_top_main.dbs;T8;F2;L19
P0;control_registers;20;1136;Theuseus_Risc_V_top_main.dbs;T8;F2;L21
P0;PC_exec;20;1248;Theuseus_Risc_V_top_main.dbs;T8;F2;L22
P0;immidiate_sign_extended;20;1360;Theuseus_Risc_V_top_main.dbs;T8;F2;L23
P0;inputA_reg_file;20;1472;Theuseus_Risc_V_top_main.dbs;T8;F2;L24
P0;inputB_reg_file;20;1584;Theuseus_Risc_V_top_main.dbs;T8;F2;L25
P0;rs2_store_data;20;1696;Theuseus_Risc_V_top_main.dbs;T8;F2;L26
P0;stall;20;1808;Theuseus_Risc_V_top_main.dbs;T14;F2;L27
S0;funct3;2;1928;Theuseus_Risc_V_top_main.dbs;T4;F2;L30
S0;opcode;2;2168;Theuseus_Risc_V_top_main.dbs;T2;F2;L31
S0;funct7;2;2408;Theuseus_Risc_V_top_main.dbs;T2;F2;L32
S0;I_imm;2;2648;Theuseus_Risc_V_top_main.dbs;T8;F2;L33
S0;S_imm;2;2888;Theuseus_Risc_V_top_main.dbs;T8;F2;L34
S0;B_imm;2;3128;Theuseus_Risc_V_top_main.dbs;T8;F2;L35
S0;U_imm;2;3368;Theuseus_Risc_V_top_main.dbs;T8;F2;L36
S0;J_imm;2;3608;Theuseus_Risc_V_top_main.dbs;T8;F2;L37
S0;imm_tmp;2;3848;Theuseus_Risc_V_top_main.dbs;T8;F2;L38
S0;ALU_A_src;2;4088;Theuseus_Risc_V_top_main.dbs;T14;F2;L40
S0;ALU_B_src;2;4248;Theuseus_Risc_V_top_main.dbs;T9;F2;L41
S0;Wr_to_RF;2;4488;Theuseus_Risc_V_top_main.dbs;T14;F2;L42
S0;WB_select;2;4648;Theuseus_Risc_V_top_main.dbs;T14;F2;L43
S0;jump;2;4808;Theuseus_Risc_V_top_main.dbs;T14;F2;L44
S0;jump_r;2;4968;Theuseus_Risc_V_top_main.dbs;T14;F2;L45
S0;MEM_write;2;5128;Theuseus_Risc_V_top_main.dbs;T14;F2;L46
S0;Branch;2;5288;Theuseus_Risc_V_top_main.dbs;T14;F2;L47
S0;rs1_en;2;5448;Theuseus_Risc_V_top_main.dbs;T14;F2;L48
S0;rs2_en;2;5608;Theuseus_Risc_V_top_main.dbs;T14;F2;L49
S0;rs1_tmp;2;5768;Theuseus_Risc_V_top_main.dbs;T3;F2;L51
S0;rs2_tmp;2;6008;Theuseus_Risc_V_top_main.dbs;T3;F2;L52
S0;rd;2;6248;Theuseus_Risc_V_top_main.dbs;T3;F2;L53
S0;ALU_code;2;6488;Theuseus_Risc_V_top_main.dbs;T3;F2;L54
V0;Reg_file;0;6728;Theuseus_Risc_V_top_main.dbs;T6;F2;L56
N0;Decode;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F2;L66
N0;forward_unit;();<NONE>
N0;RF;();Theuseus_Risc_V_top_main.dbs;F2;L202
N0;control_unit;();Theuseus_Risc_V_top_main.dbs;F2;L81
N0;instruction_decoder;();Theuseus_Risc_V_top_main.dbs;F2;L264
N0;stall_unit;();Theuseus_Risc_V_top_main.dbs;F2;L247

M20;Fetch<32U, 15U>;19;12288;928;928;0;0;Theuseus_Risc_V_top_main.dbs;F3;L8
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;clk;12;132;Theuseus_Risc_V_top_main.dbs;T14;F3;L11
P0;reset;12;248;Theuseus_Risc_V_top_main.dbs;T14;F3;L12
P0;next_PC;12;364;Theuseus_Risc_V_top_main.dbs;T8;F3;L14
P0;stall;12;472;Theuseus_Risc_V_top_main.dbs;T14;F3;L15
P0;stall_j;12;588;Theuseus_Risc_V_top_main.dbs;T14;F3;L16
P0;new_PC;20;704;Theuseus_Risc_V_top_main.dbs;T8;F3;L18
P0;PC;20;816;Theuseus_Risc_V_top_main.dbs;T8;F3;L19
N0;Fetch;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F3;L26
N0;fetch_to_decode;();Theuseus_Risc_V_top_main.dbs;F3;L33

M19;MUX_2_1<32U>;19;12288;576;576;0;0;Theuseus_Risc_V_top_main.dbs;F8;L16
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;a;12;132;Theuseus_Risc_V_top_main.dbs;T8;F8;L19
P0;b;12;240;Theuseus_Risc_V_top_main.dbs;T8;F8;L20
P0;choose_wisely;12;348;Theuseus_Risc_V_top_main.dbs;T14;F8;L21
P0;c;20;464;Theuseus_Risc_V_top_main.dbs;T8;F8;L22
N0;MUX_2_1;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F8;L29
N0;always_process_15;();Theuseus_Risc_V_top_main.dbs;F8;L35

M18;MUX_4_1<32U>;19;12288;784;784;0;0;Theuseus_Risc_V_top_main.dbs;F7;L16
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;a;12;132;Theuseus_Risc_V_top_main.dbs;T8;F7;L19
P0;b;12;240;Theuseus_Risc_V_top_main.dbs;T8;F7;L20
P0;c;12;348;Theuseus_Risc_V_top_main.dbs;T8;F7;L21
P0;d;12;456;Theuseus_Risc_V_top_main.dbs;T8;F7;L22
P0;choose_wisely;12;564;Theuseus_Risc_V_top_main.dbs;T9;F7;L23
P0;out;20;672;Theuseus_Risc_V_top_main.dbs;T8;F7;L24
N0;MUX_4_1;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F7;L31
N0;always_process_13;();Theuseus_Risc_V_top_main.dbs;F7;L37

M17;RAM<32U, 18U>;19;2147496960;8392544;8392544;0;0;Theuseus_Risc_V_top_main.dbs;F6;L8
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;clk;12;132;Theuseus_Risc_V_top_main.dbs;T14;F6;L10
P0;funct3;12;248;Theuseus_Risc_V_top_main.dbs;T4;F6;L11
P0;address1;12;356;Theuseus_Risc_V_top_main.dbs;T8;F6;L12
P0;address2;12;464;Theuseus_Risc_V_top_main.dbs;T8;F6;L13
P0;data1;20;572;Theuseus_Risc_V_top_main.dbs;T8;F6;L14
P0;data2;12;684;Theuseus_Risc_V_top_main.dbs;T8;F6;L15
P0;data2_out;20;792;Theuseus_Risc_V_top_main.dbs;T8;F6;L16
P0;MEM_write;12;904;Theuseus_Risc_V_top_main.dbs;T14;F6;L17
P0;stall_j;12;1020;Theuseus_Risc_V_top_main.dbs;T14;F6;L18
V0;Dual_RAM;0;1136;Theuseus_Risc_V_top_main.dbs;T7;F6;L21
S0;tx_byte;2;8389744;Theuseus_Risc_V_top_main.dbs;T14;F6;L24
S0;tx_half;2;8389904;Theuseus_Risc_V_top_main.dbs;T14;F6;L25
S0;tx_word;2;8390064;Theuseus_Risc_V_top_main.dbs;T14;F6;L26
S0;byte_at_00;2;8390224;Theuseus_Risc_V_top_main.dbs;T14;F6;L27
S0;byte_at_01;2;8390384;Theuseus_Risc_V_top_main.dbs;T14;F6;L28
S0;byte_at_10;2;8390544;Theuseus_Risc_V_top_main.dbs;T14;F6;L29
S0;byte_at_11;2;8390704;Theuseus_Risc_V_top_main.dbs;T14;F6;L30
S0;half_at_00;2;8390864;Theuseus_Risc_V_top_main.dbs;T14;F6;L31
S0;half_at_10;2;8391024;Theuseus_Risc_V_top_main.dbs;T14;F6;L32
S0;word_at_00;2;8391184;Theuseus_Risc_V_top_main.dbs;T14;F6;L33
S0;byte0;2;8391344;Theuseus_Risc_V_top_main.dbs;T14;F6;L34
S0;byte1;2;8391504;Theuseus_Risc_V_top_main.dbs;T14;F6;L35
S0;byte2;2;8391664;Theuseus_Risc_V_top_main.dbs;T14;F6;L36
S0;byte3;2;8391824;Theuseus_Risc_V_top_main.dbs;T14;F6;L37
S0;previous_address;2;8391984;Theuseus_Risc_V_top_main.dbs;T8;F6;L38
S0;previous_data;2;8392224;Theuseus_Risc_V_top_main.dbs;T8;F6;L39
V0;i;0;8392464;Theuseus_Risc_V_top_main.dbs;T12;F6;L61
V0;in;0;8392468;Theuseus_Risc_V_top_main.dbs;T23;F6;L62
V0;statusI;0;8392472;Theuseus_Risc_V_top_main.dbs;T12;F6;L63
V0;din;0;8392480;Theuseus_Risc_V_top_main.dbs;T8;F6;L64
V0;addr;0;8392512;Theuseus_Risc_V_top_main.dbs;T8;F6;L65
N0;RAM;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F6;L67
N0;store_data;();<NONE>
N0;retrieve_data;();<NONE>
N0;retrieve_instruction;();<NONE>
N0;always_process_43;();Theuseus_Risc_V_top_main.dbs;F6;L235
N0;assign_process_byte3_39;();Theuseus_Risc_V_top_main.dbs;F6;L229
N0;assign_process_byte2_38;();Theuseus_Risc_V_top_main.dbs;F6;L223
N0;assign_process_byte1_37;();Theuseus_Risc_V_top_main.dbs;F6;L217
N0;assign_process_byte0_36;();Theuseus_Risc_V_top_main.dbs;F6;L211
N0;assign_process_word_at_00_34;();Theuseus_Risc_V_top_main.dbs;F6;L205
N0;assign_process_half_at_10_32;();Theuseus_Risc_V_top_main.dbs;F6;L199
N0;assign_process_half_at_00_31;();Theuseus_Risc_V_top_main.dbs;F6;L193
N0;assign_process_byte_at_11_29;();Theuseus_Risc_V_top_main.dbs;F6;L187
N0;assign_process_byte_at_10_28;();Theuseus_Risc_V_top_main.dbs;F6;L181
N0;assign_process_byte_at_01_27;();Theuseus_Risc_V_top_main.dbs;F6;L175
N0;assign_process_byte_at_00_26;();Theuseus_Risc_V_top_main.dbs;F6;L169
N0;assign_process_tx_word_24;();Theuseus_Risc_V_top_main.dbs;F6;L163
N0;assign_process_tx_half_23;();Theuseus_Risc_V_top_main.dbs;F6;L157
N0;assign_process_tx_byte_22;();Theuseus_Risc_V_top_main.dbs;F6;L151

M16;Theseus_CPU;19;2147496960;8557448;8557448;0;0;Theuseus_Risc_V_top_main.dbs;F4;L14
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;clk;12;132;Theuseus_Risc_V_top_main.dbs;T14;F4;L17
P0;reset;12;248;Theuseus_Risc_V_top_main.dbs;T14;F4;L18
S0;funct3;2;368;Theuseus_Risc_V_top_main.dbs;T4;F4;L31
S0;rs1_en;2;608;Theuseus_Risc_V_top_main.dbs;T14;F4;L32
S0;rs2_en;2;768;Theuseus_Risc_V_top_main.dbs;T14;F4;L33
S0;ALU_code;2;928;Theuseus_Risc_V_top_main.dbs;T3;F4;L34
S0;Wr_to_RF;2;1168;Theuseus_Risc_V_top_main.dbs;T14;F4;L35
S0;Branch;2;1328;Theuseus_Risc_V_top_main.dbs;T14;F4;L36
S0;jump;2;1488;Theuseus_Risc_V_top_main.dbs;T14;F4;L37
S0;MEM_write;2;1648;Theuseus_Risc_V_top_main.dbs;T14;F4;L38
S0;WB_select;2;1808;Theuseus_Risc_V_top_main.dbs;T14;F4;L39
S0;ALU_result;2;1968;Theuseus_Risc_V_top_main.dbs;T8;F4;L41
S0;PC;2;2208;Theuseus_Risc_V_top_main.dbs;T8;F4;L42
S0;new_PC;2;2448;Theuseus_Risc_V_top_main.dbs;T8;F4;L43
S0;next_PC;2;2688;Theuseus_Risc_V_top_main.dbs;T8;F4;L44
S0;PC_exec;2;2928;Theuseus_Risc_V_top_main.dbs;T8;F4;L45
S0;instruction;2;3168;Theuseus_Risc_V_top_main.dbs;T8;F4;L46
S0;take_branch;2;3408;Theuseus_Risc_V_top_main.dbs;T14;F4;L47
S0;rd;2;3568;Theuseus_Risc_V_top_main.dbs;T3;F4;L48
S0;rs1;2;3808;Theuseus_Risc_V_top_main.dbs;T3;F4;L49
S0;rs2;2;4048;Theuseus_Risc_V_top_main.dbs;T3;F4;L50
S0;rd_data;2;4288;Theuseus_Risc_V_top_main.dbs;T8;F4;L51
S0;immidiate;2;4528;Theuseus_Risc_V_top_main.dbs;T8;F4;L52
S0;control_registers;2;4768;Theuseus_Risc_V_top_main.dbs;T8;F4;L53
S0;control_registers_MEM;2;5008;Theuseus_Risc_V_top_main.dbs;T8;F4;L54
S0;control_registers_WB;2;5248;Theuseus_Risc_V_top_main.dbs;T8;F4;L55
S0;ALU_inputA;2;5488;Theuseus_Risc_V_top_main.dbs;T8;F4;L57
S0;ALU_inputB;2;5728;Theuseus_Risc_V_top_main.dbs;T8;F4;L58
S0;data_address;2;5968;Theuseus_Risc_V_top_main.dbs;T8;F4;L59
S0;data_from_memory;2;6208;Theuseus_Risc_V_top_main.dbs;T8;F4;L60
S0;data_to_memory;2;6448;Theuseus_Risc_V_top_main.dbs;T8;F4;L61
S0;instr_address;2;6688;Theuseus_Risc_V_top_main.dbs;T8;F4;L62
S0;load_instruction;2;6928;Theuseus_Risc_V_top_main.dbs;T8;F4;L63
S0;rs2_store_data;2;7168;Theuseus_Risc_V_top_main.dbs;T8;F4;L64
S0;rs2_store_data_MEM;2;7408;Theuseus_Risc_V_top_main.dbs;T8;F4;L65
S0;ALU_result_to_WB;2;7648;Theuseus_Risc_V_top_main.dbs;T8;F4;L66
S0;PC_MEM;2;7888;Theuseus_Risc_V_top_main.dbs;T8;F4;L67
S0;inputA_3;2;8128;Theuseus_Risc_V_top_main.dbs;T8;F4;L70
S0;inputB_3;2;8368;Theuseus_Risc_V_top_main.dbs;T8;F4;L71
S0;MEM_write_4;2;8608;Theuseus_Risc_V_top_main.dbs;T14;F4;L72
S0;WB_5;2;8768;Theuseus_Risc_V_top_main.dbs;T14;F4;L73
S0;funct3_4;2;8928;Theuseus_Risc_V_top_main.dbs;T4;F4;L74
S0;funct3_5;2;9168;Theuseus_Risc_V_top_main.dbs;T4;F4;L75
S0;rd5;2;9408;Theuseus_Risc_V_top_main.dbs;T3;F4;L76
S0;Wr_to_RF_5;2;9648;Theuseus_Risc_V_top_main.dbs;T14;F4;L77
S0;stall;2;9808;Theuseus_Risc_V_top_main.dbs;T14;F4;L78
S0;rs2_data_3;2;9968;Theuseus_Risc_V_top_main.dbs;T8;F4;L79
S0;jump_address;2;10208;Theuseus_Risc_V_top_main.dbs;T8;F4;L80
S0;immidiate_to_MEM;2;10448;Theuseus_Risc_V_top_main.dbs;T8;F4;L81
S0;stall_j;2;10688;Theuseus_Risc_V_top_main.dbs;T14;F4;L82
C0;Fetch_Inst;1;10848;Theuseus_Risc_V_top_main.dbs;M20;F4;L87
C0;Decode_dut;1;11776;Theuseus_Risc_V_top_main.dbs;M21;F4;L88
C0;exec_inst;1;19528;Theuseus_Risc_V_top_main.dbs;M13;F4;L89
C0;DATA_MEM_inst;1;155160;Theuseus_Risc_V_top_main.dbs;M22;F4;L96
C0;WB_inst;1;156640;Theuseus_Risc_V_top_main.dbs;M15;F4;L97
C0;RAM_inst;1;164904;Theuseus_Risc_V_top_main.dbs;M17;F4;L99
N0;Theseus_CPU;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F4;L122
N0;control_registers_deliver;();Theuseus_Risc_V_top_main.dbs;F4;L104
N0;printa;();Theuseus_Risc_V_top_main.dbs;F4;L22

M15;WB<32U>;19;12288;8264;8264;0;0;Theuseus_Risc_V_top_main.dbs;F9;L10
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;WB_select;12;132;Theuseus_Risc_V_top_main.dbs;T14;F9;L13
P0;r_data;12;248;Theuseus_Risc_V_top_main.dbs;T8;F9;L14
P0;ALU_result;12;356;Theuseus_Risc_V_top_main.dbs;T8;F9;L15
P0;funct3;12;464;Theuseus_Risc_V_top_main.dbs;T4;F9;L16
P0;rd_data;20;572;Theuseus_Risc_V_top_main.dbs;T8;F9;L17
S0;Decode_to_Sign_Extend_byte;2;688;Theuseus_Risc_V_top_main.dbs;T8;F9;L19
S0;Decode_to_Sign_Extend_Half_Word;2;928;Theuseus_Risc_V_top_main.dbs;T8;F9;L20
S0;sign_extended_byte;2;1168;Theuseus_Risc_V_top_main.dbs;T8;F9;L21
S0;sign_extended_half_word;2;1408;Theuseus_Risc_V_top_main.dbs;T8;F9;L22
S0;data_to_WB;2;1648;Theuseus_Risc_V_top_main.dbs;T8;F9;L23
S0;ALU_or_Imm;2;1888;Theuseus_Risc_V_top_main.dbs;T8;F9;L24
S0;B_16_0_r_data_31_16__concat;2;2128;Theuseus_Risc_V_top_main.dbs;T8;F9;L25
S0;B_16_0_r_data_15_0__concat;2;2368;Theuseus_Risc_V_top_main.dbs;T8;F9;L26
S0;ALU_result_1;2;2608;Theuseus_Risc_V_top_main.dbs;T14;F9;L27
S0;funct3_un_neg_exp;2;2768;Theuseus_Risc_V_top_main.dbs;T14;F9;L28
S0;B_24_0_r_data_7_0__concat;2;2928;Theuseus_Risc_V_top_main.dbs;T8;F9;L29
S0;B_24_0_r_data_15_8__concat;2;3168;Theuseus_Risc_V_top_main.dbs;T8;F9;L30
S0;B_24_0_r_data_23_16__concat;2;3408;Theuseus_Risc_V_top_main.dbs;T8;F9;L31
S0;B_24_0_r_data_31_24__concat;2;3648;Theuseus_Risc_V_top_main.dbs;T8;F9;L32
S0;ALU_result_1_0;2;3888;Theuseus_Risc_V_top_main.dbs;T9;F9;L33
S0;funct3_1_0;2;4128;Theuseus_Risc_V_top_main.dbs;T9;F9;L34
S0;DECIMAL_0;2;4368;Theuseus_Risc_V_top_main.dbs;T8;F9;L35
C0;Load_Half_Word;1;4608;Theuseus_Risc_V_top_main.dbs;M19;F9;L37
C0;sign_extend_Half_Word;1;5184;Theuseus_Risc_V_top_main.dbs;M1;F9;L38
C0;Load_Byte;1;5652;Theuseus_Risc_V_top_main.dbs;M18;F9;L39
C0;sign_extend_byte;1;6436;Theuseus_Risc_V_top_main.dbs;M0;F9;L40
C0;MUX_4_1_select_Data_to_WB;1;6904;Theuseus_Risc_V_top_main.dbs;M18;F9;L41
C0;ALU_or_Imm_SEL_Write_Back;1;7688;Theuseus_Risc_V_top_main.dbs;M19;F9;L42
N0;WB;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F9;L69
N0;signal_handler;();Theuseus_Risc_V_top_main.dbs;F9;L46

T14;bool;12;0;1;1;0;0;<NONE>

M13;exec<32U>;19;12288;135632;135632;0;0;Theuseus_Risc_V_top_main.dbs;F1;L7
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;clk;12;132;Theuseus_Risc_V_top_main.dbs;T14;F1;L10
P0;reset;12;248;Theuseus_Risc_V_top_main.dbs;T14;F1;L11
P0;control_registers;12;364;Theuseus_Risc_V_top_main.dbs;T8;F1;L12
P0;inputA_reg_file;12;472;Theuseus_Risc_V_top_main.dbs;T8;F1;L13
P0;inputB_reg_file;12;580;Theuseus_Risc_V_top_main.dbs;T8;F1;L14
P0;immidiate;12;688;Theuseus_Risc_V_top_main.dbs;T8;F1;L15
P0;PC_exec;12;796;Theuseus_Risc_V_top_main.dbs;T8;F1;L16
P0;PC_MEM;20;904;Theuseus_Risc_V_top_main.dbs;T8;F1;L17
P0;result;20;1016;Theuseus_Risc_V_top_main.dbs;T8;F1;L18
P0;take_branch;20;1128;Theuseus_Risc_V_top_main.dbs;T14;F1;L19
P0;control_registers_MEM;20;1248;Theuseus_Risc_V_top_main.dbs;T8;F1;L20
P0;rs2_store_data;12;1360;Theuseus_Risc_V_top_main.dbs;T8;F1;L21
P0;rs2_store_data_MEM;20;1468;Theuseus_Risc_V_top_main.dbs;T8;F1;L22
P0;immidiate_to_MEM;20;1580;Theuseus_Risc_V_top_main.dbs;T8;F1;L23
P0;control_registers_from_MEM;12;1692;Theuseus_Risc_V_top_main.dbs;T8;F1;L25
P0;control_registers_WB;12;1800;Theuseus_Risc_V_top_main.dbs;T8;F1;L26
P0;ALU_result_to_WB;12;1908;Theuseus_Risc_V_top_main.dbs;T8;F1;L27
P0;ALU_result_to_MEM;12;2016;Theuseus_Risc_V_top_main.dbs;T8;F1;L28
P0;stall;12;2124;Theuseus_Risc_V_top_main.dbs;T14;F1;L29
S0;inputA;2;2240;Theuseus_Risc_V_top_main.dbs;T8;F1;L35
S0;inputB;2;2480;Theuseus_Risc_V_top_main.dbs;T8;F1;L36
S0;inputA_reg;2;2720;Theuseus_Risc_V_top_main.dbs;T8;F1;L37
S0;inputB_reg;2;2960;Theuseus_Risc_V_top_main.dbs;T8;F1;L38
S0;inputB_to_store;2;3200;Theuseus_Risc_V_top_main.dbs;T8;F1;L39
S0;control_registers_tmp;2;3440;Theuseus_Risc_V_top_main.dbs;T8;F1;L40
S0;ALU_code;2;3680;Theuseus_Risc_V_top_main.dbs;T3;F1;L41
S0;ALU_B_src;2;3920;Theuseus_Risc_V_top_main.dbs;T9;F1;L42
S0;ALU_A_src;2;4160;Theuseus_Risc_V_top_main.dbs;T14;F1;L43
S0;csr_val;2;4320;Theuseus_Risc_V_top_main.dbs;T8;F1;L44
V0;csr;0;4560;Theuseus_Risc_V_top_main.dbs;T5;F1;L46
N0;exec;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F1;L49
N0;ALU_source;();Theuseus_Risc_V_top_main.dbs;F1;L120
N0;forward_unit;();Theuseus_Risc_V_top_main.dbs;F1;L67
N0;entry;();Theuseus_Risc_V_top_main.dbs;F1;L144

T12;int;5;0;4;4;0;0;<NONE>

M11;sc_main;19;2147491968;0;0;0;0;Theuseus_Risc_V_top_main.dbs;F5;L5
S0;clock;2;0;Theuseus_Risc_V_top_main.dbs;T14;F5;L13
S0;reset;2;0;Theuseus_Risc_V_top_main.dbs;T14;F5;L14
C0;dut;1;0;Theuseus_Risc_V_top_main.dbs;M16;F5;L16

M10;sc_module;19;4352;0;0;0;0;<NONE>

T9;sc_uint<2>;17;4608;2;32;0;0;<NONE>

T8;sc_uint<32>;17;4608;32;32;0;0;<NONE>

T7;sc_uint<32>[262144];20;8192;32;8388608;262144;0;<NONE>;T8

T6;sc_uint<32>[32];20;8192;32;1024;32;0;<NONE>;T8

T5;sc_uint<32>[4096];20;8192;32;131072;4096;0;<NONE>;T8

T4;sc_uint<3>;17;4608;3;32;0;0;<NONE>

T3;sc_uint<5>;17;4608;5;32;0;0;<NONE>

T2;sc_uint<7>;17;4608;7;32;0;0;<NONE>

M1;sign_extend<32U, 16U>;19;12288;468;468;0;0;Theuseus_Risc_V_top_main.dbs;F0;L16
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;number_to_extend;12;132;Theuseus_Risc_V_top_main.dbs;T8;F0;L19
P0;enable;12;240;Theuseus_Risc_V_top_main.dbs;T14;F0;L20
P0;sign_extended;20;356;Theuseus_Risc_V_top_main.dbs;T8;F0;L21
N0;sign_extend;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F0;L32
N0;always_process_18;();Theuseus_Risc_V_top_main.dbs;F0;L49

M0;sign_extend<32U, 8U>;19;12288;468;468;0;0;Theuseus_Risc_V_top_main.dbs;F0;L16
B0;sc_core::sc_module;256;0;<NONE>;M10
P0;number_to_extend;12;132;Theuseus_Risc_V_top_main.dbs;T8;F0;L19
P0;enable;12;240;Theuseus_Risc_V_top_main.dbs;T14;F0;L20
P0;sign_extended;20;356;Theuseus_Risc_V_top_main.dbs;T8;F0;L21
N0;sign_extend;(sc_core::sc_module_name);Theuseus_Risc_V_top_main.dbs;F0;L32
N0;always_process_18;();Theuseus_Risc_V_top_main.dbs;F0;L49

