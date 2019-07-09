`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2019 03:30:40 PM
// Design Name: 
// Module Name: Display_Controller
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


module Display_controller(
    input refresh_clk,
    input one_hz_clk,
    input ready,
    input [3:0] v_f1,
    input [3:0] v_f2,
    input [3:0] v_f3,
    input [3:0] v_f4,
    input [3:0] v_s1,
    input [3:0] v_s2,
    input [3:0] v_m1,
    input [3:0] v_m2,
    input [2:0] v_select,
    input v_flash,
    output reg ready_flash,
    output reg [6:0] seg,
    output reg [7:0] an
    );
    reg v_toggle;
    integer display;
    integer v_flash_count;
    /////////////////////////////////////// f1
    wire [6:0] seg_f1;
    wire [7:0] an_f1;
    BCD_Decoder f1_bcd(
        .v      (v_f1),
        .anum   (3'd0),
        .seg    (seg_f1),
        .an     (an_f1)
    );
    /////////////////////////////////////// f2
    wire [6:0] seg_f2;
    wire [7:0] an_f2;
    BCD_Decoder f2_bcd(
        .v      (v_f2),
        .anum   (3'd1),
        .seg    (seg_f2),
        .an     (an_f2)
    );
    /////////////////////////////////////// f3
    wire [6:0] seg_f3;
    wire [7:0] an_f3;
    BCD_Decoder f3_bcd(
        .v      (v_f3),
        .anum   (3'd2),
        .seg    (seg_f3),
        .an     (an_f3)
    );
    /////////////////////////////////////// f4
    wire [6:0] seg_f4;
    wire [7:0] an_f4;
    BCD_Decoder f4_bcd(
        .v      (v_f4),
        .anum   (3'd3),
        .seg    (seg_f4),
        .an     (an_f4)
    );
    /////////////////////////////////////// s1
    wire [6:0] seg_s1;
    wire [7:0] an_s1;
    BCD_Decoder s1_bcd(
        .v      (v_s1),
        .anum   (3'd4),
        .seg    (seg_s1),
        .an     (an_s1)
    );
    /////////////////////////////////////// s2
    wire [6:0] seg_s2;
    wire [7:0] an_s2;
    BCD_Decoder s2_bcd(
        .v      (v_s2),
        .anum   (3'd5),
        .seg    (seg_s2),
        .an     (an_s2)
    );
    /////////////////////////////////////// m1
    wire [6:0] seg_m1;
    wire [7:0] an_m1;
    BCD_Decoder m1_bcd(
        .v      (v_m1),
        .anum   (3'd6),
        .seg    (seg_m1),
        .an     (an_m1)
    );
    /////////////////////////////////////// m2
    wire [6:0] seg_m2;
    wire [7:0] an_m2;
    BCD_Decoder m2_bcd(
        .v      (v_m2),
        .anum   (3'd7),
        .seg    (seg_m2),
        .an     (an_m2)
    );
    // 7-Segment display
    always @(posedge refresh_clk) begin
        if(v_flash_count == 300) begin
            v_flash_count = 0;
            v_toggle = !v_toggle;
        end
        case(display)
        9: display = 0;
        8: begin
            if(v_flash & v_select == 3'b111) begin
                 if(v_toggle) seg[6:0] <= seg_m2[6:0]; 
                 else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_m2[6:0];; 
            end
            an[7:0] <= an_m2[7:0];
        end
        7: begin
             if(v_flash & v_select == 3'b110) begin
                if(v_toggle) seg[6:0] <= seg_m1[6:0]; 
                else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_m1[6:0]; 
            end
                an[7:0] <= an_m1[7:0];
        end
        6: begin
            if(v_flash & v_select == 3'b101) begin
                if(v_toggle) seg[6:0] <= seg_s2[6:0]; 
                else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_s2[6:0];; 
            end
                an[7:0] <= an_s2[7:0];
        end
        5: begin
            if(v_flash & v_select == 3'b100) begin
                if(v_toggle) seg[6:0] <= seg_s1[6:0]; 
                else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_s1[6:0];; 
            end
                an[7:0] <= an_s1[7:0];
            end
        4: begin
            if(v_flash & v_select == 3'b011) begin
                if(v_toggle) seg[6:0] <= seg_f4[6:0]; 
                else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_f4[6:0]; 
            end
            an[7:0] <= an_f4[7:0];
        end
        3: begin
            if(v_flash & v_select == 3'b010) begin
                if(v_toggle) seg[6:0] <= seg_f3[6:0]; 
                else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_f3[6:0];; 
            end
            an[7:0] <= an_f3[7:0];
        end
        2: begin
            if(v_flash & v_select == 3'b001) begin
                if(v_toggle) seg[6:0] <= seg_f2[6:0]; 
                else seg[6:0] <= 7'b1111111;
            end
            else begin
                seg[6:0] <= seg_f2[6:0]; 
            end
            an[7:0] <= an_f2[7:0];
        end
        1: begin
          if(v_flash & v_select == 3'b000) begin
               if(v_toggle) seg[6:0] <= seg_f1[6:0]; 
               else seg[6:0] <= 7'b1111111;
          end
          else begin
              seg[6:0] <= seg_f1[6:0]; 
          end
          an[7:0] <= an_f1[7:0];
        end
        endcase
        display = display + 1;
        v_flash_count = v_flash_count + 1;
    end
    // Ready On Flash
    always @ (posedge one_hz_clk) begin
        if(ready) begin 
            ready_flash = !ready_flash;
        end
        else ready_flash = 'b0;
    end
endmodule
