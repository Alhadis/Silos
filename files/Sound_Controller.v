`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2019 03:30:40 PM
// Design Name: 
// Module Name: Sound_Controller
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


module Sound_controller(
    input twentyFive_mhz_clk,
    input ten_khz_clk,
    input four_khz_clk,
    input one_hz_clk,
    input enable,
    input one_second,
    input count_finished,
    input enc_btn_press,
    input enc_sw,
    input enc_rotate,
    input [3:0] set_val,
    output speaker
    );
    reg sound_on;
    reg adj_sound_on;
    reg speaker_main;
    reg speaker_adj;
    wire adjusted_clk;
    integer count_sound_on = 0;
    integer count_adj_sound_on = 0;
    variable_clk_divider var_clk_div(
        .clk            (ten_khz_clk),
        .set_val        (set_val),
        .adjusted_clk   (adjusted_clk)
    );
    
    always @(posedge twentyFive_mhz_clk) begin
        if(one_second & enable) count_sound_on = 400000;
        else if(count_finished & one_hz_clk) count_sound_on = 1500000;
        else if(enc_btn_press & enc_sw) count_sound_on = 300000;
        else if(enc_rotate & enc_sw) count_adj_sound_on = 300000;
        else sound_on = 0;
        if(count_sound_on > 0) begin
            sound_on = 1;
            count_sound_on = count_sound_on - 1;
        end
        else if(count_sound_on == 0) sound_on = 0;
        
        if(count_adj_sound_on > 0) begin
            adj_sound_on = 1;
            count_adj_sound_on = count_adj_sound_on - 1;
        end
        else if(count_adj_sound_on == 0) adj_sound_on = 0;
    end
    always @(posedge four_khz_clk) begin
        if(sound_on) speaker_main <= !speaker_main;
        else speaker_main <= 0;
    end
    always @(posedge adjusted_clk) begin
        if(adj_sound_on) speaker_adj <= !speaker_adj;
        else speaker_adj <= 0;
    end
    assign speaker = speaker_adj | speaker_main;
endmodule
