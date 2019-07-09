`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2018 17:17:40
// Design Name: 
// Module Name: PWM_Generator_Module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PWM_Generator_Module(
    input clk,      // Input Clock
    input [15:0] PR, // Period Value
    input [15:0] CR1, // Compare Value
    input [7:0] DT1_r, // Deadtime Rise 
    input [7:0] DT1_f,// Deadtime Fall
    
    input [15:0] CR2, // Compare Value
    input [7:0] DT2_r,// Deadtime Rise 
    input [7:0] DT2_f,// Deadtime Fall
        
    input [15:0] CR3, // Compare Value
    input [7:0] DT3_r,// Deadtime Rise 
    input [7:0] DT3_f,// Deadtime Fall
    
    input [15:0] CR4, // Compare Value
    input [7:0] DT4_r,// Deadtime Rise 
    input [7:0] DT4_f,  // Deadtime Fall 

    input [2:0] start_sel,
    input start,
    
    input [2:0] stop_sel,
    input stop,
    
    input [2:0] reset_sel,
    input reset,
    
    output PWM_out1_a,
    output PWM_out1_b,
    output PWM_out2_a,
    output PWM_out2_b,
    output PWM_out3_a,
    output PWM_out3_b,
    output PWM_out4_a,
    output PWM_out4_b
    );
    

wire start_sig;
input_trigger_module START (
    start,
    start_sel,
    clk,
    start_sig
    );
    
wire stop_sig;
input_trigger_module STOP (
    stop,
    stop_sel,
    clk,
    stop_sig
    );
    
wire reset_sig;
input_trigger_module RESET (
    reset,
    reset_sel,
    clk,
    reset_sig
    );
        
    
wire PWM_out1;
wire PWM_out2;
wire PWM_out3;
wire PWM_out4;
    
PWM_core_module PWM_CORE (
    clk,      // Input Clock
    PR, // Period Value
    CR1, // Compare Value 1
    CR2, // Compare Value 2
    CR3, // Compare Value 3
    CR4, // Compare Value 4
    
    start_sig,
    stop_sig,
    reset_sig,
    
    PWM_out1,
    PWM_out2,
    PWM_out3,
    PWM_out4
);

wire PWM_out1a_temp;
deadtime_module DT1_RISE (PWM_out1, DT1_r, PWM_out1a_temp);

wire PWM_out1b_temp;
deadtime_module DT1_FALL (PWM_out1, DT1_f, PWM_out1b_temp);

wire PWM_out2a_temp;
deadtime_module DT2_RISE (PWM_out2, DT2_r, PWM_out2a_temp);

wire PWM_out2b_temp;
deadtime_module DT2_FALL (PWM_out2, DT2_f, PWM_out2b_temp);

wire PWM_out3a_temp;
deadtime_module DT3_RISE (PWM_out3, DT3_r, PWM_out3a_temp);

wire PWM_out3b_temp;
deadtime_module DT3_FALL (PWM_out3, DT3_f, PWM_out3b_temp);

wire PWM_out4a_temp;
deadtime_module DT4_RISE (PWM_out4, DT4_r, PWM_out4a_temp);

wire PWM_out4b_temp;
deadtime_module DT4_FALL (PWM_out4, DT4_f, PWM_out4b_temp);


// temporary. to be modified later
assign PWM_out1_a =  PWM_out1a_temp;
assign PWM_out1_b =  PWM_out1b_temp;

assign PWM_out2_a =  PWM_out2a_temp;
assign PWM_out2_b =  PWM_out2b_temp;

assign PWM_out3_a =  PWM_out3a_temp;
assign PWM_out3_b =  PWM_out3b_temp;

assign PWM_out4_a =  PWM_out4a_temp;
assign PWM_out4_b =  PWM_out4b_temp;


endmodule
