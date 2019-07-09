`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Creator: C. Minos Niu
// 
// Module Name:    
// Project Name: 
// Target Devices: XEM6010 - OpalKelly
// Design properties: xc6slx150-2fgg484
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module one_joint_board2_xem6010(
	input  wire [7:0]  hi_in,
	output wire [1:0]  hi_out,
	inout  wire [15:0] hi_inout,
	inout  wire        hi_aa,

	output wire        i2c_sda,
	output wire        i2c_scl,
	output wire        hi_muxsel,
	input  wire        clk1,
	input  wire        clk2,
	
	output wire [7:0]  led,
    output wire pin0,
    output wire pin1,
    output wire pin2,
    output wire spike_out1,   // cross-board spike
    input wire spike_in1    // cross-board spike
	 );
//	 output wire SCK_s,	    //JP1 pin 38 GCLK pin
//    output wire SSEL_s,	    //pin_jp1_42    SSEL_s
//    output wire DATA_0_s, //pin_jp1_43    Data_bic_s
//	// output wire DATA_1_s, //pin_jp1_44    Data_tri_s
//    input wire  SCK_r,	   	//pin_jp2_41   SCK_r
//    input wire  SSEL_r, 	  //pin_jp2_42	   SSEL_r
//    input wire  DATA_0_r 	//pin_jp2_43   DATA_bic_r
//   // input wire  DATA_1_r 	//pin_jp2_44   DATA_tri_r
//   );
//   
//    
//	 // Mapping to UCF files
//	 wire DATA_trilen_r, DATA_biclen_r, DATA_tricepsfr_Ia_s, DATA_triforce_s;
//	 assign DATA_trilen_r = DATA_0_r;
//	// assign DATA_biclen_r = DATA_1_r;
//	 assign DATA_0_s = DATA_tricepsfr_Ia_s;
//	// assign DATA_1_s = DATA_triforce_s;

	parameter NN = 8;
    // *** Dump all the declarations here:
    wire         ti_clk;
    wire [30:0]  ok1;
    wire [16:0]  ok2;   
    wire [15:0]  ep00wire, ep01wire, ep02wire, ep50trig, ep20wire, ep21wire, ep22wire, ep23wire;
    wire [15:0]  ep24wire, ep25wire, ep26wire, ep27wire, ep28wire, ep29wire, ep30wire, ep31wire;
    wire reset_global, reset_sim;
    wire        is_pipe_being_written, is_lce_valid;
    
    wire [15:0] hex_from_py;
    
    reg [17:0] delay_cnt, delay_cnt_max;
    
    reg [15:0] rawspikes;
    wire pipe_out_read;
 
    // *** Target interface bus:
    assign i2c_sda = 1'bz;
    assign i2c_scl = 1'bz;
    assign hi_muxsel = 1'b0;

  // *** Buttons, physical on XEM3010, software on XEM3050 & XEM6010
    // *** Reset & Enable signals
    assign reset_global = ep00wire[0];
    assign reset_sim = ep00wire[1];

    //assign enable_sim = is_waveform_valid;
    wire    [31:0]  IEEE_1, IEEE_0;
	assign IEEE_1 = 32'h3F800000;
	assign IEEE_0 = 32'd0;


    // *** Triggered input from Python
    always @(posedge ep50trig[0] or posedge reset_global)
    begin
        if (reset_global)
            delay_cnt_max <= delay_cnt_max;
        else
            delay_cnt_max <= {2'b00, ep01wire};  //firing rate
    end
    
    
    reg [31:0] f_pps_coef_Ia;
    always @(posedge ep50trig[1] or posedge reset_global)
    begin
        if (reset_global)
            f_pps_coef_Ia <= 32'h3F66_6666;
        else
            f_pps_coef_Ia <= {ep02wire, ep01wire};  //firing rate
    end       
//    
//    reg [31:0] f_pps_coef_II;
//    always @(posedge ep50trig[2] or posedge reset_global)
//    begin
//        if (reset_global)
//            f_pps_coef_II <= 32'h3F66_6666;
//        else
//            f_pps_coef_II <= {ep02wire, ep01wire};  //firing rate
//    end           
//    



    reg [31:0] tau;
    always @(posedge ep50trig[2] or posedge reset_global)
    begin
        if (reset_global)
            tau <= 32'd1; // gamma_sta reset to 80
        else
            tau <= {ep02wire, ep01wire};  
    end      
//    

    reg [31:0] gain;
    always @(posedge ep50trig[3] or posedge reset_global)
    begin
        if (reset_global)
            gain <= 32'd0;
        else
            gain <= {ep02wire, ep01wire};  //firing rate
    end        
    
    reg [31:0] f_gamma_dyn;
    always @(posedge ep50trig[4] or posedge reset_global)
    begin
        if (reset_global)
            f_gamma_dyn <= 32'h42A0_0000; // gamma_dyn reset to 80
        else
            f_gamma_dyn <= {ep02wire, ep01wire};  
    end  
    
    reg [31:0] f_gamma_sta;
    always @(posedge ep50trig[5] or posedge reset_global)
    begin
        if (reset_global)
            f_gamma_sta <= 32'h42A0_0000; // gamma_sta reset to 80
        else
            f_gamma_sta <= {ep02wire, ep01wire};  
    end  
    
    reg signed [31:0] i_gain_mu1_MN;
    always @(posedge ep50trig[6] or posedge reset_global)
    begin
        if (reset_global)
            i_gain_mu1_MN <= 32'd1; // gamma_sta reset to 80
        else
            i_gain_mu1_MN <= {ep02wire, ep01wire};  
    end
	 
    reg signed [31:0] i_gain_mu2_MN;
    always @(posedge ep50trig[7] or posedge reset_global)
    begin
        if (reset_global)
            i_gain_mu2_MN <= 32'd1; // gamma_sta reset to 80
        else
            i_gain_mu2_MN <= {ep02wire, ep01wire};  
    end  

    reg signed [31:0] i_gain_mu3_MN;
    always @(posedge ep50trig[8] or posedge reset_global)
    begin
        if (reset_global)
            i_gain_mu3_MN <= 32'd1; // gamma_sta reset to 80
        else
            i_gain_mu3_MN <= {ep02wire, ep01wire};  
    end  
	 
//    
//    reg [31:0] delay_cnt_max;
//    always @(posedge ep50trig[7] or posedge reset_global)
//    begin
//        if (reset_global)
//            delay_cnt_max <= delay_cnt_max;
//        else
//            delay_cnt_max <= {ep02wire, ep01wire};  //firing rate
//    end        
//    
    reg [31:0] BDAMP_1, BDAMP_2, BDAMP_chain, GI, GII;
    always @(posedge ep50trig[15] or posedge reset_global)
    begin
        if (reset_global)
            BDAMP_1 <= 32'h3E71_4120; // bag 1 BDAMP reset to 0.2356
        else
            BDAMP_1 <= {ep02wire, ep01wire};  //firing rate
    end
    always @(posedge ep50trig[14] or posedge reset_global)
    begin
        if (reset_global)
            BDAMP_2 <= 32'h3D14_4674; // bag 2 BDAMP reset to 0.0362
        else
            BDAMP_2 <= {ep02wire, ep01wire};  //firing rate
    end    
    always @(posedge ep50trig[13] or posedge reset_global)
    begin
        if (reset_global)
            BDAMP_chain <= 32'h3C58_44D0; // chain BDAMP reset to 0.0132 
        else
            BDAMP_chain <= {ep02wire, ep01wire};  //firing rate
    end
    
    // *** Deriving clocks from on-board clk1:
    wire neuron_clk, sim_clk, spindle_clk;
    wire [NN+2:0] neuronCounter;

    gen_clk #(.NN(NN)) useful_clocks_2
    (   .rawclk(clk1), 
        .half_cnt(delay_cnt_max), 
        .clk_out1(neuron_clk), 
        .clk_out2(sim_clk), 
        .clk_out3(spindle_clk),
        .int_neuron_cnt_out(neuronCounter) );
                
    
//    // *** Generating waveform to stimulate the spindle
//     wire    [31:0] f_elbow_pos;
//	waveform_from_pipe gen(	
//        .ti_clk(ti_clk),
//        .reset(reset_global),
//        .repop(reset_sim),
//        .feed_data_valid(is_pipe_being_written),
//        .feed_data(hex_from_py),
//        .current_element(f_elbow_pos),
//        .test_clk(sim_clk),
//        .done_feeding(is_lce_valid)
//    );    
    // *** Generating waveform to stimulate the spindle
    wire    [31:0] f_pos_elbow;
    wire    [31:0] f_rawfr_Ia;
    waveform_from_pipe_bram_2s    generator_2(
                                .reset(reset_sim),
                                .pipe_clk(ti_clk),
                                .pipe_in_write(is_pipe_being_written),
                                .pipe_in_data(hex_from_py),
                                .pop_clk(sim_clk),
                                .wave(f_rawfr_Ia)
    );  
    
    
    wire    [31:0] i_MN_spkcnt;
    wire    dummy_slow;        
    spikecnt count_rawspikes_2
    (   .spike(spike_in1), 
        .int_cnt_out(i_MN_spkcnt), 
        .fast_clk(neuron_clk), 
        .slow_clk(sim_clk), 
        .reset(reset_sim), 
        .clear_out(dummy_slow));

 reg [31:0] i_MN_spkcnt_F0;
 reg [31:0] i_MN_spkcnt_F1;
 reg [31:0] i_MN_spkcnt_F2;
 reg [31:0] i_MN_spkcnt_F3;
 reg [31:0] i_MN_spkcnt_F4;
 reg [31:0] i_MN_spkcnt_F5; 
 reg [31:0] i_MN_spkcnt_F6;
 reg [31:0] i_MN_spkcnt_F7;
 reg [31:0] i_MN_spkcnt_F8;
 reg [31:0] i_MN_spkcnt_F9;
 reg [31:0] i_MN_spkcnt_F10;
 reg [31:0] i_MN_spkcnt_F11;
 reg [31:0] i_MN_spkcnt_F12;
 reg [31:0] i_MN_spkcnt_F13;
 reg [31:0] i_MN_spkcnt_F14;
 reg [31:0] i_MN_spkcnt_F15; 
 reg [31:0] i_MN_spkcnt_F16;
 reg [31:0] i_MN_spkcnt_F17;
 reg [31:0] i_MN_spkcnt_F18;
 reg [31:0] i_MN_spkcnt_F19;
 reg [31:0] i_MN_spkcnt_F20;
 reg [31:0] i_MN_spkcnt_F21;
 reg [31:0] i_MN_spkcnt_F22;
 reg [31:0] i_MN_spkcnt_F23;
 reg [31:0] i_MN_spkcnt_F24;
 reg [31:0] i_MN_spkcnt_F25; 
 reg [31:0] i_MN_spkcnt_F26;
 reg [31:0] i_MN_spkcnt_F27;
 reg [31:0] i_MN_spkcnt_F28;
 reg [31:0] i_MN_spkcnt_F29;
 reg [31:0] i_MN_spkcnt_F30;
   
   
  // delay 30 ms (32 bit data) 
 always @(posedge sim_clk or posedge reset_global)
    begin
        if (reset_global) begin
            i_MN_spkcnt_F0 <= 32'h0; // 
            i_MN_spkcnt_F1 <= 32'h0; // 
            i_MN_spkcnt_F2 <= 32'h0; // 
            i_MN_spkcnt_F3 <= 32'h0; // 
            i_MN_spkcnt_F4 <= 32'h0; // 
            i_MN_spkcnt_F5 <= 32'h0; // 
            i_MN_spkcnt_F6 <= 32'h0; // 
            i_MN_spkcnt_F7 <= 32'h0; // 
            i_MN_spkcnt_F8 <= 32'h0; // 
            i_MN_spkcnt_F9 <= 32'h0; // 
            i_MN_spkcnt_F10 <= 32'h0; //            i_MN_spkcnt_F0 <= 32'h0; // 
            i_MN_spkcnt_F11 <= 32'h0; // 
            i_MN_spkcnt_F12 <= 32'h0; // 
            i_MN_spkcnt_F13 <= 32'h0; // 
            i_MN_spkcnt_F14 <= 32'h0; // 
            i_MN_spkcnt_F15 <= 32'h0; // 
            i_MN_spkcnt_F16 <= 32'h0; // 
            i_MN_spkcnt_F17 <= 32'h0; // 
            i_MN_spkcnt_F18 <= 32'h0; // 
            i_MN_spkcnt_F19 <= 32'h0; // 
            i_MN_spkcnt_F20 <= 32'h0; //
            i_MN_spkcnt_F21 <= 32'h0; // 
            i_MN_spkcnt_F22 <= 32'h0; // 
            i_MN_spkcnt_F23 <= 32'h0; // 
            i_MN_spkcnt_F24 <= 32'h0; // 
            i_MN_spkcnt_F25 <= 32'h0; // 
            i_MN_spkcnt_F26 <= 32'h0; // 
            i_MN_spkcnt_F27 <= 32'h0; // 
            i_MN_spkcnt_F28 <= 32'h0; // 
            i_MN_spkcnt_F29 <= 32'h0; // 
            i_MN_spkcnt_F30 <= 32'h0; //  
        end
        else begin
            i_MN_spkcnt_F0 <= i_MN_spkcnt; 
            i_MN_spkcnt_F1 <= i_MN_spkcnt_F0;
            i_MN_spkcnt_F2 <= i_MN_spkcnt_F1;
            i_MN_spkcnt_F3 <= i_MN_spkcnt_F2;
            i_MN_spkcnt_F4 <= i_MN_spkcnt_F3;
            i_MN_spkcnt_F5 <= i_MN_spkcnt_F4;
            i_MN_spkcnt_F6 <= i_MN_spkcnt_F5;
            i_MN_spkcnt_F7 <= i_MN_spkcnt_F6;
            i_MN_spkcnt_F8 <= i_MN_spkcnt_F7;
            i_MN_spkcnt_F9 <= i_MN_spkcnt_F8;
            i_MN_spkcnt_F10 <= i_MN_spkcnt_F9;
            i_MN_spkcnt_F11 <= i_MN_spkcnt_F10;
            i_MN_spkcnt_F12 <= i_MN_spkcnt_F11;
            i_MN_spkcnt_F13 <= i_MN_spkcnt_F12;
            i_MN_spkcnt_F14 <= i_MN_spkcnt_F13;
            i_MN_spkcnt_F15 <= i_MN_spkcnt_F14;
            i_MN_spkcnt_F16 <= i_MN_spkcnt_F15;
            i_MN_spkcnt_F17 <= i_MN_spkcnt_F16;
            i_MN_spkcnt_F18 <= i_MN_spkcnt_F17;
            i_MN_spkcnt_F19 <= i_MN_spkcnt_F18;
            i_MN_spkcnt_F20 <= i_MN_spkcnt_F19;
            i_MN_spkcnt_F21 <= i_MN_spkcnt_F20;
            i_MN_spkcnt_F22 <= i_MN_spkcnt_F21;
            i_MN_spkcnt_F23 <= i_MN_spkcnt_F22;
            i_MN_spkcnt_F24 <= i_MN_spkcnt_F23;
            i_MN_spkcnt_F25 <= i_MN_spkcnt_F24;
            i_MN_spkcnt_F26 <= i_MN_spkcnt_F25;
            i_MN_spkcnt_F27 <= i_MN_spkcnt_F26;
            i_MN_spkcnt_F28 <= i_MN_spkcnt_F27;
            i_MN_spkcnt_F29 <= i_MN_spkcnt_F28;
            i_MN_spkcnt_F30 <= i_MN_spkcnt_F29;
        end 
    end  
 
 
 
// test this module (IODELAY2) separately in a spare time. 
     
    // IODELAY2: Input and Output Fixed or Variable Delay Element
    // Spartan-6
    // Xilinx HDL Libraries Guide, version 12.4
    
    wire BUSY, DATAOUT, DATAOUT2, DOUT, TOUT;   // ouputs
    wire CAL,CE,CLK,IDATAIN,INC,IOCLK0,IOCLK1,ODATAIN,RST,T;  //inputs 
    
    assign RST = reset_global;
    assign CLK = sim_clk;
    assign ODATAIN = spike_in1;
    assign T = 1'b0;
    assign TOUT = 1'b0;
    
//    
    IODELAY2 #(
    .COUNTER_WRAPAROUND("WRAPAROUND"), // "STAY_AT_LIMIT" or "WRAPAROUND"
    .DATA_RATE("SDR"), // "SDR" or "DDR"
    .DELAY_SRC("ODATAIN"), // "IO", "ODATAIN" or "IDATAIN"
    .IDELAY2_VALUE(0), // Delay value when IDELAY_MODE="PCI" (0-255)
    .IDELAY_MODE("NORMAL"), // "NORMAL" or "PCI"
    .IDELAY_TYPE("DEFAULT"), // "FIXED", "DEFAULT", "VARIABLE_FROM_ZERO", "VARIABLE_FROM_HALF_MAX"
    // or "DIFF_PHASE_DETECTOR"
    .IDELAY_VALUE(0), // Amount of taps for fixed input delay (0-255)
    .ODELAY_VALUE(128), // Amount of taps fixed output delay (0-255)
    .SERDES_MODE("NONE"), // "NONE", "MASTER" or "SLAVE"
    .SIM_TAPDELAY_VALUE(75) // Per tap delay used for simulation in ps
    )
    IODELAY2_inst (
    .BUSY(), // 1-bit output Busy output after CAL
    .DATAOUT(), // 1-bit output Delayed data output to ISERDES/input register
    .DATAOUT2(DATAOUT2), // 1-bit output Delayed data output to general FPGA fabric
    .DOUT(), // 1-bit output Delayed data output
    .TOUT(), // 1-bit output Delayed 3-state output
    .CAL(1'b0), // 1-bit input Initiate calibration input
    .CE(1'b0), // 1-bit input Enable INC input
    .CLK(1'b0), // 1-bit input Clock input
    .IDATAIN(1'b0), // 1-bit input Data input (connect to top-level port or I/O buffer)
    .INC(1'b0), // 1-bit input Increment / decrement input
    .IOCLK0(1'b0), // 1-bit input Input from the I/O clock network
    .IOCLK1(1'b0), // 1-bit input Input from the I/O clock network
    .ODATAIN(ODATAIN), // 1-bit input Output data input from output register or OSERDES2.
    .RST(1'b0), // 1-bit input Reset to zero or 1/2 of total delay period
    .T(1'b0) // 1-bit input 3-state input signal
    );
    // End of IODELAY2_inst instantiation

    wire spike_in1_delayed;
    assign spike_in1_delayed = DATAOUT2;  // check
    
    wire    [31:0] i_MN_spkcnt_delayed;
    wire    dummy_slow_delayed;        
    spikecnt count_rawspikes_delayed
    (   .spike(spike_in1_delayed), 
        .int_cnt_out(i_MN_spkcnt_delayed), 
        .fast_clk(neuron_clk), 
        .slow_clk(sim_clk), 
        .reset(reset_sim), 
        .clear_out(dummy_slow_delayed));

    
    
    
 // ** LEDs
    assign led[0] = ~reset_global;
    assign led[1] = ~reset_sim;
    assign led[2] = ~clk1;
    assign led[3] = ~0;
//    assign led[4] = ~MN_bic_spike;
	 assign led[4] = ~spike_in1;
    assign led[5] =  ~spike_in1;
    assign led[6]  = ~spindle_clk; // slow clock
    //assign led[5] = ~spike;
    //assign led[5] = ~button1_response;
    //assign led[6] = ~button2_response;
    //assign led[6] = ~reset_sim;
    assign led[7] = ~sim_clk; //fast clock
    //assign led[6] = ~execute; // When execute==1, led lits      
    // *** Buttons, physical on XEM3010, software on XEM3050 & XEM6010
    assign reset_global = ep00wire[0];
    assign reset_sim = ep00wire[1];
    
    // *** Endpoint connections:
	assign pin0 = clk1;
    assign pin1 = sim_clk;
    assign pin2 = spindle_clk;
    
    assign spike_out1 = spike_in1;


  // Instantiate the okHost and connect endpoints.
    // Host interface
    // *** Endpoint connections:
  
    okHost okHI(
        .hi_in(hi_in), .hi_out(hi_out), .hi_inout(hi_inout), .hi_aa(hi_aa), .ti_clk(ti_clk),
        .ok1(ok1), .ok2(ok2));
        
    parameter NUM_OK_IO = 14;

    wire [NUM_OK_IO*17 - 1: 0]  ok2x;
    okWireOR # (.N(NUM_OK_IO)) wireOR (ok2, ok2x);
    okWireIn     wi00 (.ok1(ok1),                           .ep_addr(8'h00), .ep_dataout(ep00wire));
    okWireIn     wi01 (.ok1(ok1),                           .ep_addr(8'h01), .ep_dataout(ep01wire));
    okWireIn     wi02 (.ok1(ok1),                           .ep_addr(8'h02), .ep_dataout(ep02wire));
    //okWireIn     wi03 (.ok1(ok1),                           .ep_addr(8'h03), .ep_dataout(ep001wire));


    okWireOut    wo20 (.ep_datain(i_MN_spkcnt[15:0]), .ok1(ok1), .ok2(ok2x[  0*17 +: 17 ]), .ep_addr(8'h20) );
    okWireOut    wo21 (.ep_datain(i_MN_spkcnt[31:16]), .ok1(ok1), .ok2(ok2x[  1*17 +: 17 ]), .ep_addr(8'h21) );
    okWireOut    wo22 (.ep_datain(i_MN_spkcnt_F30[15:0]), .ok1(ok1), .ok2(ok2x[  2*17 +: 17 ]), .ep_addr(8'h22) );
    okWireOut    wo23 (.ep_datain(i_MN_spkcnt_F30[31:16]), .ok1(ok1), .ok2(ok2x[  3*17 +: 17 ]), .ep_addr(8'h23) );
    okWireOut    wo24 (.ep_datain(i_MN_spkcnt_delayed[15:0]), .ok1(ok1), .ok2(ok2x[  4*17 +: 17 ]), .ep_addr(8'h24) );
    okWireOut    wo25 (.ep_datain(i_MN_spkcnt_delayed[31:16]), .ok1(ok1), .ok2(ok2x[  5*17 +: 17 ]), .ep_addr(8'h25) );
//    okWireOut    wo26 (.ep_datain(f_tri_force[15:0]), .ok1(ok1), .ok2(ok2x[  6*17 +: 17 ]), .ep_addr(8'h26) );
//    okWireOut    wo27 (.ep_datain(f_tri_force[31:16]), .ok1(ok1), .ok2(ok2x[  7*17 +: 17 ]), .ep_addr(8'h27) );
//    okWireOut    wo28 (.ep_datain(f_tricepsfr_Ia[15:0]),  .ok1(ok1), .ok2(ok2x[ 8*17 +: 17 ]), .ep_addr(8'h28) );
//    okWireOut    wo29 (.ep_datain(f_tricepsfr_Ia[31:16]), .ok1(ok1), .ok2(ok2x[ 9*17 +: 17 ]), .ep_addr(8'h29) );
//    okWireOut    wo30 (.ep_datain(f_tri_len[15:0]),  .ok1(ok1), .ok2(ok2x[ 10*17 +: 17 ]), .ep_addr(8'h30) );
//    okWireOut    wo31 (.ep_datain(f_tri_len[31:16]), .ok1(ok1), .ok2(ok2x[ 11*17 +: 17 ]), .ep_addr(8'h31) );
    //ep_ready = 1 (always ready to receive)
    okBTPipeIn   ep80 (.ok1(ok1), .ok2(ok2x[ 12*17 +: 17 ]), .ep_addr(8'h80), .ep_write(is_pipe_being_written), .ep_blockstrobe(), .ep_dataout(hex_from_py), .ep_ready(1'b1));
    //okBTPipeOut  epA0 (.ok1(ok1), .ok2(ok2x[ 5*17 +: 17 ]), .ep_addr(8'ha0), .ep_read(pipe_out_read),  .ep_blockstrobe(), .ep_datain(response_nerf), .ep_ready(pipe_out_valid));
    //okBTPipeOut  epA0 (.ok1(ok1), .ok2(ok2x[ 11*17 +: 17 ]), .ep_addr(8'ha1), .ep_read(pipe_out_read),  .ep_blockstrobe(), .ep_datain(rawspikes), .ep_ready(1'b1));

    okTriggerIn ep50 (.ok1(ok1),  .ep_addr(8'h50), .ep_clk(clk1), .ep_trigger(ep50trig));
endmodule




