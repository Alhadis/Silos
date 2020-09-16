@0;moduleinfo.sc;5;8;0;gnuc;3;3;0

F16;C:\modeltech_se\Modeltech_6.3\gcc-3.3.1-mingw32/include/c++/3.3.1/bits/basic_string.h
F15;C:\modeltech_se\Modeltech_6.3\gcc-3.3.1-mingw32/include/c++/3.3.1/bits/stringfwd.h
F14;C:\modeltech_se\Modeltech_6.3/include/systemc/sc_port.h
F13;C:\modeltech_se\Modeltech_6.3/include/systemc/sc_clock.h
F12;C:\modeltech_se\Modeltech_6.3/include/systemc/sc_time.h
F11;C:\modeltech_se\Modeltech_6.3/include/systemc/sc_fifo_ifs.h
F10;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/Fork.h
F9;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/InAdapter.h
F8;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/Mixer.h
F7;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/Monitor.h
F6;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/OutAdapter.h
F5;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/ParFir.h
F4;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/Source.h
F3;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/SynFir.h
F2;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/main.cpp
F1;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/Top.cpp
F0;C:/Projects/SystemC/trunk/src/Implement/TemplateFir/src/Top.h


T46;<ignored>;23;0;0;0;0;0

T45;<pointer>;11;0;4;4;0;0

M44;ArchFir;19;12288;8920;8920;0;0;F0;L46
B0;sc_core::sc_module;256;0;M7
C0;inAdapt;1;120;M42;F0;L50
C0;outAdapt;1;612;M38;F0;L51
C0;clock;1;1104;M29;F0;L54
C0;sample_clock;1;1664;M29;F0;L55
S0;reset;2;2224;T33;F0;L56
S0;in_data;2;2336;T11;F0;L58
S0;out_data;2;2488;T11;F0;L59
S0;coeffs;2;2640;T20;F0;L62
C0;firRtl;1;6136;T12;F0;L65
C0;monitor_rtl;1;8648;M40;F0;L68
V0;tracefile;0;8908;T45;F0;L70
V0;pFirCoeff;0;8912;T45;F0;L81
V0;m_samples;0;8916;T31;F0;L82
N0;~ArchFir;();F1;L103
N0;ArchFir;(sc_core::sc_module_name<unnamed>,<unnamed>,);F1;L34

M43;Fork<fir_T>;19;12288;264;264;0;0;F10;L27
B0;sc_core::sc_module;256;0;M7
P0;in;12;120;T17;F10;L30
P0;out;2097156;192;T21;F10;L31
N0;DoFork;();F10;L43
N0;Fork;(sc_core::sc_module_name);F10;L36

M42;InAdapter<fir_T, 18U>;19;12288;492;492;0;8;F9;L14
B0;sc_core::sc_fifo_out_if<fir_T>;256;0;T23;F11;L0
B0;sc_core::sc_module;256;8;M7
P0;clock;12;128;T33;F9;L19
P0;reset;12;220;T33;F9;L20
P0;sample_clock;12;312;T33;F9;L21
P0;out_data;20;404;T11;F9;L22
N0;data_read_event;();F9;L60
N0;num_free;();F9;L54
N0;nb_write;(<unnamed>);F9;L48
N0;InAdapter;(sc_core::sc_module_name);F9;L42
N0;write;(<unnamed>);F9;L25

M41;Mixer<fir_T>;19;12288;312;312;0;0;F8;L28
B0;sc_core::sc_module;256;0;M7
P0;in;2097156;120;T22;F8;L31
P0;out;20;192;T17;F8;L32
V0;m_gain;0;264;T16;F8;L45
N0;DoMix;();F8;L48
N0;Mixer;(sc_core::sc_module_namefir_T,);F8;L40

M40;Monitor<fir_T, 1U>;19;12288;260;260;0;0;F7;L27
B0;sc_core::sc_module;256;0;M7
P0;in;12;120;T17;F7;L30
V0;m_samples;0;192;T31;F7;L48
V0;m_file_name;0;196;T4;F7;L49
V0;m_stop;0;200;T33;F7;L50
V0;delay;0;204;T15;F7;L51
V0;m_in;0;252;T31;F7;L52
V0;m_out;0;256;T31;F7;L52
N0;DoDisplay;();F7;L55
N0;Monitor;(sc_core::sc_module_name<unnamed>,std::string,<unnamed>,);F7;L39

M39;Monitor<fir_T, 6U>;19;12288;500;500;0;0;F7;L27
B0;sc_core::sc_module;256;0;M7
P0;in;12;120;T17;F7;L30
V0;m_samples;0;192;T31;F7;L48
V0;m_file_name;0;196;T4;F7;L49
V0;m_stop;0;200;T33;F7;L50
V0;delay;0;204;T13;F7;L51
V0;m_in;0;492;T31;F7;L52
V0;m_out;0;496;T31;F7;L52
N0;DoDisplay;();F7;L55
N0;Monitor;(sc_core::sc_module_name<unnamed>,std::string,<unnamed>,);F7;L39

M38;OutAdapter<fir_T, 18U>;19;12288;488;488;0;8;F6;L14
B0;sc_core::sc_fifo_in_if<fir_T>;256;0;T26;F11;L0
B0;sc_core::sc_module;256;8;M7
P0;clock;12;128;T33;F6;L19
P0;reset;12;220;T33;F6;L20
P0;sample_clock;12;312;T33;F6;L21
P0;in_data;12;404;T11;F6;L22
N0;data_written_event;();F6;L69
N0;num_available;();F6;L63
N0;nb_read;(<unnamed>);F6;L57
N0;OutAdapter;(sc_core::sc_module_name);F6;L51
N0;read;();F6;L30
N0;read;(<unnamed>);F6;L25

M37;ParFir<fir_T, 23U>;19;12288;2472;2472;0;0;F5;L33
B0;sc_core::sc_module;256;0;M7
P0;in;12;120;T17;F5;L36
P0;out;20;192;T17;F5;L37
V0;m_delay_line;0;264;T14;F5;L57
V0;m_coeffs;0;1368;T14;F5;L58
N0;DoCalculate;();F5;L61
N0;ParFir;(sc_core::sc_module_name<unnamed>,);F5;L44

M36;Source<fir_T>;19;12288;204;204;0;0;F4;L31
B0;sc_core::sc_module;256;0;M7
P0;out;20;120;T17;F4;L34
V0;m_samples;0;192;T31;F4;L51
V0;m_fo;0;196;T31;F4;L52
V0;m_fs;0;200;T31;F4;L53
N0;DoStimuli;();F4;L61
N0;Sine;(<unnamed>);F4;L56
N0;Source;(sc_core::sc_module_name<unnamed>,<unnamed>,<unnamed>,);F4;L46

M35;SynFir;19;13312;3976;3976;0;0;F3;L13
B0;sc_core::sc_module;256;0;M7
P0;clock;12;120;T33;F3;L17
P0;reset;12;212;T33;F3;L18
P0;sample_clock;12;304;T33;F3;L19
P0;in_data;12;396;T11;F3;L20
P0;out_data;20;480;T11;F3;L21
P0;in_coef0;12;568;T9;F3;L24
P0;in_coef1;12;652;T9;F3;L25
P0;in_coef2;12;736;T9;F3;L26
P0;in_coef3;12;820;T9;F3;L27
P0;in_coef4;12;904;T9;F3;L28
P0;in_coef5;12;988;T9;F3;L29
P0;in_coef6;12;1072;T9;F3;L30
P0;in_coef7;12;1156;T9;F3;L31
P0;in_coef8;12;1240;T9;F3;L32
P0;in_coef9;12;1324;T9;F3;L33
P0;in_coef10;12;1408;T9;F3;L34
P0;in_coef11;12;1492;T9;F3;L35
P0;in_coef12;12;1576;T9;F3;L36
P0;in_coef13;12;1660;T9;F3;L37
P0;in_coef14;12;1744;T9;F3;L38
P0;in_coef15;12;1828;T9;F3;L39
P0;in_coef16;12;1912;T9;F3;L40
P0;in_coef17;12;1996;T9;F3;L41
P0;in_coef18;12;2080;T9;F3;L42
P0;in_coef19;12;2164;T9;F3;L43
P0;in_coef20;12;2248;T9;F3;L44
P0;in_coef21;12;2332;T9;F3;L45
P0;in_coef22;12;2416;T9;F3;L46
V0;m_delay_line;0;2504;T10;F3;L49
V0;m_coeffs;0;3240;T8;F3;L50
N0;SynFir;(sc_core::sc_module_name);F3;L57
N0;DoCalculate;()

M34;Top;19;12288;3904;3904;0;0;F0;L86
B0;sc_core::sc_module;256;0;M7
S0;input_1k;2;120;T17;F0;L91
S0;input_2k;2;380;T17;F0;L92
S0;input_3k;2;640;T17;F0;L93
S0;mix_out;2;900;T17;F0;L94
S0;fir_in;2;1160;T17;F0;L95
S0;monitor_in;2;1420;T17;F0;L96
S0;output;2;1680;T17;F0;L97
C0;src_sine_1k;1;1940;M36;F0;L100
C0;src_sine_2k;1;2144;M36;F0;L103
C0;src_sine_3k;1;2348;M36;F0;L106
C0;mix;1;2552;M41;F0;L109
C0;fork;1;2864;M43;F0;L112
C0;monitor_mix;1;3128;M40;F0;L115
V0;pHighPass;65536;3388;T45;F0;L117
V0;pLowPass;0;3392;T45;F0;L118
C0;pFir;33;3396;M37;F0;L119
C0;monitor_ref;1;3400;M39;F0;L122
C0;pArchFir;33;3900;M44;F0;L125
N0;Top;(sc_core::sc_module_name);F1;L131

T33;bool;12;0;1;1;0;0

T32;double;9;0;8;8;0;0

T31;int;5;0;4;4;0;0

T30;sc_bit;13;4096;1;0;0;0

M29;sc_core::sc_clock;19;16790528;560;560;0;4;F13;L59
B0;sc_core::sc_signal_in_if<bool>;256;0;T46
B0;sc_core::sc_module;256;4;M7
V0;m_period;0;128;T19;F13;L223
V0;m_duty_cycle;0;136;T32;F13;L224
V0;m_start_time;0;144;T19;F13;L225
V0;m_posedge_first;0;152;T33;F13;L226
V0;m_posedge_time;0;160;T19;F13;L227
V0;m_negedge_time;0;168;T19;F13;L228
V0;m_cur_val;0;176;T33;F13;L230
V0;m_value_changed_event;0;180;T18;F13;L232
V0;m_posedge_event;0;252;T18;F13;L233
V0;m_negedge_event;0;324;T18;F13;L234
V0;m_next_posedge_event;0;396;T18;F13;L236
V0;m_next_negedge_event;0;468;T18;F13;L237
V0;m_delta;0;544;T0;F13;L239
S0;sig;34;552;T33;F13;L242
N0;observe_foreign_signal;(<unnamed>);F13;L277
N0;control_foreign_signal;(<unnamed>);F13;L271
N0;mti_get_sub_interface;();F13;L262
N0;mti_bind_sub_interface;();F13;L261
N0;is_clock;();F13;L252
N0;operator=;(<unnamed>)
N0;sc_clock;(<unnamed>)
N0;init;(<unnamed><unnamed>,<unnamed>,<unnamed>,)
N0;report_error;(<unnamed><unnamed>,)
N0;negedge_action;();F13;L385
N0;posedge_action;();F13;L372
N0;stop;();F13;L206
N0;start;(<unnamed>);F13;L203
N0;start;(<unnamed>sc_core::sc_time_unit,);F13;L200
N0;start;(<unnamed>);F13;L197
N0;signal;();F13;L194
N0;signal;();F13;L191
N0;kind;();F13;L186
N0;dump;(<unnamed>)
N0;print;(<unnamed>)
N0;trace;(<unnamed>);F13;L177
N0;time_stamp;()
N0;start_time;();F13;L167
N0;posedge_first;();F13;L164
N0;duty_cycle;();F13;L159
N0;period;();F13;L155
N0;operator const bool &;();F13;L150
N0;delayed;()
N0;negedge;();F13;L362
N0;posedge;();F13;L353
N0;event;();F13;L344
N0;get_data_ref;();F13;L130
N0;is_reset;();F13;L126
N0;read;();F13;L334
N0;negedge_event;();F13;L324
N0;posedge_event;();F13;L315
N0;value_changed_event;();F13;L306
N0;default_event;();F13;L296
N0;~sc_clock;()
N0;sc_clock;(sc_core::sc_module_name<unnamed>,<unnamed>,<unnamed>,<unnamed>,)
N0;sc_clock;(sc_core::sc_module_name<unnamed>,sc_core::sc_time_unit,<unnamed>,<unnamed>,sc_core::sc_time_unit,<unnamed>,)
N0;sc_clock;(sc_core::sc_module_name<unnamed>,sc_core::sc_time_unit,<unnamed>,)
N0;sc_clock;(sc_core::sc_module_name<unnamed>,<unnamed>,<unnamed>,<unnamed>,)
N0;sc_clock;(sc_core::sc_module_name)
N0;sc_clock;()

T28;sc_core::sc_fifo_blocking_in_if<fir_T>;22;1280;4;4;0;0;F11;L75

T27;sc_core::sc_fifo_blocking_out_if<fir_T>;22;1280;4;4;0;0;F11;L142

T26;sc_core::sc_fifo_in_if<fir_T>;0;1280;8;8;0;0;F11;L92
B0;sc_core::sc_fifo_nonblocking_in_if<fir_T>;256;0;T25;F11;L0
B0;sc_core::sc_fifo_blocking_in_if<fir_T>;256;4;T28;F11;L0
N0;operator=;(<unnamed>)
N0;sc_fifo_in_if;(<unnamed>)
N0;sc_fifo_in_if;();F11;L106
N0;num_available;()

T25;sc_core::sc_fifo_nonblocking_in_if<fir_T>;22;1280;4;4;0;0;F11;L56

T24;sc_core::sc_fifo_nonblocking_out_if<fir_T>;22;1280;4;4;0;0;F11;L123

T23;sc_core::sc_fifo_out_if<fir_T>;0;1280;8;8;0;0;F11;L159
B0;sc_core::sc_fifo_nonblocking_out_if<fir_T>;256;0;T24;F11;L0
B0;sc_core::sc_fifo_blocking_out_if<fir_T>;256;4;T27;F11;L0
N0;operator=;(<unnamed>)
N0;sc_fifo_out_if;(<unnamed>)
N0;sc_fifo_out_if;();F11;L173
N0;num_free;()

T22;sc_core::sc_port<sc_core::sc_fifo_in_if<fir_T>, 0, sc_core::SC_ONE_OR_MORE_BOUND>;23;0;72;0;0;0;F14;L434

T21;sc_core::sc_port<sc_core::sc_fifo_out_if<fir_T>, 0, sc_core::SC_ONE_OR_MORE_BOUND>;23;0;72;0;0;0;F14;L434

T20;sc_core::sc_signal<sc_dt::sc_int<32> >[23];24;8192;152;3496;23;0;T9

T19;sc_core::sc_time;0;0;8;8;0;0;F12;L86
V0;m_value;0;0;T0;F12;L147

T18;sc_event;26;4096;1;72;0;0

T17;sc_fifo<fir_T>;25;4096;0;72;0;0;T16

T16;sc_fixed<18,2>;18;4096;18;48;2;0;T30

T15;sc_fixed<18,2>[1];20;8192;48;48;1;0;T16

T14;sc_fixed<18,2>[23];20;8192;48;1104;23;0;T16

T13;sc_fixed<18,2>[6];20;8192;48;288;6;0;T16

T12;sc_foreign_module;23;4096;0;0;0;0

T11;sc_int<18>;17;4096;18;32;0;0;T30

T10;sc_int<18>[23];20;8192;32;736;23;0;T11

T9;sc_int<32>;17;4096;32;32;0;0;T30

T8;sc_int<32>[23];20;8192;32;736;23;0;T9

M7;sc_module;19;4352;0;0;0;0

T6;sc_root;0;64;0;0;0;0
V0;std::basic_string<char, std::char_traits<char>, std::allocator<char> >::npos;64;0;T2;F16;L237
V0;std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_S_empty_rep_storage;64;0;T1;F16;L245

T5;std::allocator<char>;22;256;1;1;0;0;F15;L49

T4;std::basic_string<char, std::char_traits<char>, std::allocator<char> >;0;0;4;4;0;0;F15;L56
V0;_M_dataplus;0;0;T3;F16;L241

T3;std::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider;0;0;4;4;0;0;F16;L225
B0;std::allocator<char>;256;0;T5;F15;L0
V0;_M_p;0;0;T45;F16;L230
N0;_Alloc_hider;(<unnamed><unnamed>,);F16;L227

T2;unsigned int;5;512;4;4;0;0

T1;unsigned int[4];20;0;4;16;4;0;T2

T0;unsigned long long;7;512;8;8;0;0

