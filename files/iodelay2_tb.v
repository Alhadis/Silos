`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Creator: 
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
module iodelay2_tb;

    reg reset;
    reg clk1, clk2;

    parameter NN = 8;

    always
        begin
        #1 clk1 = ~clk1;
        end
        initial
        begin 
        $timeformat(-9, 1, " ns", 6);
        clk1 = 1'b0; clk2 = 1'b0; reset = 1; spike = 0;
        #10 reset = 0; 
        #40 spike = 1;
        #2  spike = 0;    
        #10 spike = 1;
        #2  spike = 0;
        #10 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #4 spike = 1;
        #2  spike = 0;
        #4 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;
        #40 spike = 1;
        #2  spike = 0;#40 spike = 1;#40 spike = 1;#40 spike = 1;
        #300000
        $finish; // to shut down the simulation
    end //initial

//    // *** Deriving clocks from on-board clk1:
//    reg neuron_clk, sim_clk, spindle_clk;
//    wire [NN+2:0] neuronCounter;
//
//    gen_clk #(.NN(NN)) useful_clocks_2
//    (   .rawclk(clk1), 
//        .half_cnt(delay_cnt_max), 
//        .clk_out1(neuron_clk), 
//        .clk_out2(sim_clk), 
//        .clk_out3(spindle_clk),
//        .int_neuron_cnt_out(neuronCounter) );
//              
  
//    always 
//        #10  clk2 = ~clk2;

        
    reg spike;
//    always 
//    begin
//        #40  spike = 0;
//        #1  spike = 1;
//        #1  spike = 0;
//    end

//    wire [18:0] blk_size;
//    assign blk_size = 19'd200000;
//    
//    reg [18:0] write_index, read_index;
//    reg write;
//    reg blk_mem_filled;
//    
//    wire [3:0] read_write_diff;
//    assign read_write_diff = 4'd5;
//    
//    always @ (posedge clk1 or posedge reset)
//    begin
//        if (reset) begin
//            write <= 0;
//            write_index<=0;
//            read_index <=0;
//            blk_mem_filled <=0;
//        end 
//        else begin
//            write_index <= write_index + 1;
//            write <= 1;  // always write
//            if (write_index == (blk_size - read_write_diff )) begin   // wrap around the blk_mem
//                blk_mem_filled <= 1;             // stay filled after initial fill. 
//                read_index <= 1;
//            end
//            if (write_index == blk_size) 
//                write_index <= 0;
//            if (blk_mem_filled) begin
//                read_index <= read_index + 1;
//                if (read_index == blk_size) 
//                    read_index <= 0; 
//                else 
//                    read_index <= read_index + 1;
//            end 
//        end
//    end
//    
//    reg reset_global;
//    wire spike_in1;
//    assign spike_in1 = spike;
//    
//    wire spike_in1_delayed;
////    wire write;
////    assign write = 1'b1;
//
//     
//
//   test_ram spike_ram1(
//    .clka(clk1),
//    .wea(write),
//    .addra(write_index),
//    .dina(spike_in1),
//    .clkb(clk1),
//    .addrb(read_index),
//    .doutb(spike_in1_delayed)
//    );



 // delay by blk memory (1 bit) 
    wire [20:0] blk_size;
    assign blk_size = 21'd1600000;
    
    reg [20:0] write_index, read_index;
    reg write;
    reg blk_mem_filled;
    
    wire [3:0] read_write_diff;
    assign read_write_diff = 4'd5;
    
    always @ (posedge clk1 or posedge reset)
    begin
        if (reset) begin
            write <= 0;
            write_index<=0;
            read_index <=0;
            blk_mem_filled <=0;
        end 
        else begin
            write_index <= write_index + 1;
            write <= 1;  // always write
            if (write_index == (blk_size - read_write_diff)) begin   // wrap around the blk_mem
                blk_mem_filled <= 1;             // stay filled after initial fill. 
                read_index <= read_index + 1;
            end
                
            if (write_index == blk_size) // write_index wraps around. 
                write_index <= 0;
                
            if (blk_mem_filled) begin
                read_index <= read_index + 1;
                if (read_index == blk_size)  // 
                    read_index <= 0; 
                else 
                    read_index <= read_index + 1;
            end 
        end
    end
    wire spike_in1_delayed;
    
blk_mem_gen_v6_1 spike_ram1(
    .clka(clk1),
    .wea(write),
    .addra(write_index),
    .dina(spike),
    .clkb(clk1),
    .addrb(read_index),
    .doutb(spike_in1_delayed)
    );
    
//// test this module (IODELAY2) separately in a spare time. 
//     
//    // IODELAY2: Input and Output Fixed or Variable Delay Element
//    // Spartan-6
//    // Xilinx HDL Libraries Guide, version 12.4
//    
//    wire BUSY, DATAOUT, DATAOUT2, DOUT, TOUT;   // ouputs
//    wire CAL,CE,CLK1,CLK2, IDATAIN,INC,IOCLK0,IOCLK1,ODATAIN,RST,T;  //inputs 
//    
//    
//    assign RST = reset_global;
//    assign CLK1 = clk1;
//    assign CLK2 = clk2;
//    assign ODATAIN = spike_in1;
//    assign T = 1'b0;
//    assign TOUT = 1'b0;
    
////    
//    IODELAY2 #(
//    .COUNTER_WRAPAROUND("WRAPAROUND"), // "STAY_AT_LIMIT" or "WRAPAROUND"
//    .DATA_RATE("SDR"), // "SDR" or "DDR"
//    .DELAY_SRC("IO"), // "IO", "ODATAIN" or "IDATAIN"
//    .IDELAY2_VALUE(0), // Delay value when IDELAY_MODE="PCI" (0-255)
//    .IDELAY_MODE("NORMAL"), // "NORMAL" or "PCI"
//    .IDELAY_TYPE("DEFAULT"), // "FIXED", "DEFAULT", "VARIABLE_FROM_ZERO", "VARIABLE_FROM_HALF_MAX"
//    // or "DIFF_PHASE_DETECTOR"
//    .IDELAY_VALUE(0), // Amount of taps for fixed input delay (0-255)
//    .ODELAY_VALUE(255), // Amount of taps fixed output delay (0-255)
//    .SERDES_MODE("NONE"), // "NONE", "MASTER" or "SLAVE"
//    .SIM_TAPDELAY_VALUE(75) // Per tap delay used for simulation in ps
//    )
//    IODELAY2_inst (
//    .BUSY(), // 1-bit output Busy output after CAL
//    .DATAOUT(DATAOUT), // 1-bit output Delayed data output to ISERDES/input register
//    .DATAOUT2(DATAOUT2), // 1-bit output Delayed data output to general FPGA fabric
//    .DOUT(), // 1-bit output Delayed data output
//    .TOUT(), // 1-bit output Delayed 3-state output
//    .CAL(1'b0), // 1-bit input Initiate calibration input
//    .CE(1'b0), // 1-bit input Enable INC input
//    .CLK(CLK2), // 1-bit input Clock input
//    .IDATAIN(1'b0), // 1-bit input Data input (connect to top-level port or I/O buffer)
//    .INC(1'b0), // 1-bit input Increment / decrement input
//    .IOCLK0(CLK2), // 1-bit input Input from the I/O clock network
//    .IOCLK1(CLK2), // 1-bit input Input from the I/O clock network
//    .ODATAIN(ODATAIN), // 1-bit input Output data input from output register or OSERDES2.
//    .RST(1'b0), // 1-bit input Reset to zero or 1/2 of total delay period
//    .T(1'b0) // 1-bit input 3-state input signal
//    );
//    // End of IODELAY2_inst instantiation
//
//    wire spike_in1_delayed;
//    assign spike_in1_delayed = DATAOUT2;  // check
//    

endmodule


