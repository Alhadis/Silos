`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2019 09:25:19 PM
// Design Name: 
// Module Name: Master_Controller
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



module Master_controller(
    input twentyFive_mhz_clk,
    // Control input
    input updn,
    input reset,
    input start,
    input stop,
    // Encoder input    
    input enc_a,
    input enc_b,
    input enc_btn,
    input enc_sw,
    // Display Output
    output mode_led,
    output ready_flash,
    output [6:0] seg,
    output [7:0] an,
    // Sound Control
    output speaker,
    // Stopwatch Values
    output [0:31] stopwatch_val
    );
    assign mode_led = updn;
    //States
    reg ready;
    reg [1:0] state, nextstate;
    parameter stop_state=0, start_state=1, set_state=2, reset_state=3;
    reg [3:0] setVal_state, setVal_nextstate;
    parameter set_none= 0, set_f1=1, set_f2=2, set_f3=3, set_f4=4, set_s1=5, set_s2=6, set_m1=7, set_m2=8;
    // Stopwatch Value registers
    reg [3:0] v_f1;
    reg [3:0] v_f2;
    reg [3:0] v_f3;
    reg [3:0] v_f4;
    reg [3:0] v_s1;
    reg [3:0] v_s2;
    reg [3:0] v_m1;
    reg [3:0] v_m2;
    // Set Value registers
     reg [3:0] vSet_f1;
     reg [3:0] vSet_f2;
     reg [3:0] vSet_f3;
     reg [3:0] vSet_f4;
     reg [3:0] vSet_s1;
     reg [2:0] vSet_s2;
     reg [3:0] vSet_m1;
     reg [3:0] vSet_m2; 
    // Assign Stopwatch Value to output
    assign stopwatch_val [0:3] = v_f1;
    assign stopwatch_val [4:7] = v_f2;
    assign stopwatch_val [8:11] = v_f3;
    assign stopwatch_val [12:15] = v_f4;
    assign stopwatch_val [16:19] = v_s1;
    assign stopwatch_val [20:23] = v_s2;
    assign stopwatch_val [24:27] = v_m1;
    assign stopwatch_val [28:31] = v_m2;
    // Counter Control
    reg counter_load;
    reg enable;
    reg count_finished;
    // Set Control
    reg set;
    reg [3:0] set_val;
    // Display Control
    integer display;
    reg v_flash;
    reg [2:0] v_select;
    // Sound
    reg one_second;
    // Clock Divider
    wire ten_khz_clk;
    wire refresh_clk;
    wire one_hz_clk;
    wire four_khz_clk;
    clk_divider clk_div(
        .reset              (0),
        .ten_khz_clk        (ten_khz_clk),
        .refresh_clk        (refresh_clk),
        .twentyFive_mhz_clk (twentyFive_mhz_clk),
        .one_hz_clk         (one_hz_clk),
        .four_khz_clk       (four_khz_clk)
    );
    // Rotary Encoder Debouncer
    wire enc_a_db;
    wire enc_b_db;
    wire enc_btn_db;
    wire enc_a_rise;
    wire enc_b_rise;
    wire enc_btn_rise;
    wire enc_a_fall;
    wire enc_b_fall;
    wire enc_btn_fall;   
    debounce #(
        .width(3),
        .bounce_limit(50000)
        ) deb(
         .clk(twentyFive_mhz_clk),
         .switch_in({enc_a,enc_b,enc_btn}),
         .switch_out({enc_a_db,enc_b_db,enc_btn_db}),
         .switch_rise({enc_a_rise,enc_b_rise,enc_btn_rise}),
         .switch_fall({enc_a_fall,enc_b_fall,enc_btn_fall})
     );
    // Stopwatch control FSM
    always @(posedge refresh_clk or posedge reset or posedge enc_sw) begin
        if(reset) state <= reset_state;
        else if(enc_sw) state <= set_state;
        else state <= nextstate;
    end
    // Set Value control FSM
    always @(posedge twentyFive_mhz_clk or posedge reset) begin
        if(reset) setVal_state <= set_f1;
        else setVal_state <= setVal_nextstate;
    end

    always @(state or start or stop or enc_sw or count_finished) begin
        case(state)
            stop_state: begin
                if(start) nextstate = start_state;
                else nextstate = stop_state;
            end
            start_state: begin
                if(stop | count_finished) nextstate = stop_state;
                else nextstate = start_state;
            end
            set_state: begin
                if(!enc_sw) nextstate = stop_state;
                else nextstate = set_state;
            end
            reset_state: begin
                nextstate = stop_state;
            end
            default nextstate = stop_state;
        endcase
    end
    always @(setVal_state or enc_btn_fall or enc_sw or v_f1 or v_f2 or v_f3 or v_f4 or v_s1 or v_s2 or v_m1 or v_m2) begin
        case(setVal_state)
            set_none: begin
                v_select = 3'b000;
                set_val <= v_f1;
                if(enc_sw) setVal_nextstate = set_f1;
                else setVal_nextstate = set_none;
            end
            set_f1: begin
                v_select = 3'b000;
                set_val <= v_f1;
                if(enc_btn_fall) setVal_nextstate = set_f2;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_f1;
            end
            set_f2: begin
                v_select = 3'b001;
                set_val <= v_f2;
                if(enc_btn_fall) setVal_nextstate = set_f3;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_f2;
            end
            set_f3: begin
                v_select = 3'b010;
                set_val <= v_f3;
                if(enc_btn_fall) setVal_nextstate = set_f4;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_f3;
            end
            set_f4: begin
                v_select = 3'b011;
                set_val <= v_f4;
                if(enc_btn_fall) setVal_nextstate = set_s1;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_f4;
            end
            set_s1: begin
                v_select = 3'b100;
                set_val <= v_s1;
                if(enc_btn_fall) setVal_nextstate = set_s2;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_s1;
            end
            set_s2: begin
                v_select = 3'b101;
                set_val <= v_s2;
                if(enc_btn_fall) setVal_nextstate = set_m1;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_s2;
            end
            set_m1: begin
                v_select = 3'b110;
                set_val <= v_m1;
                if(enc_btn_fall) setVal_nextstate = set_m2;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_m1;
            end
            set_m2: begin
                v_select = 3'b111;
                set_val <= v_m2;
                if(enc_btn_fall) setVal_nextstate = set_f1;
                else if(!enc_sw) setVal_nextstate = set_none;
                else setVal_nextstate = set_m2;
            end
            default: begin
                v_select = 3'b000;
                set_val <= v_f1;
                setVal_nextstate = set_none;
            end
        endcase
    end

    always @(state or set or enable or ready or v_flash) begin
        case(state)
            stop_state: begin
                set = 'b0;
                enable = 'b0;
                ready = 1'b1;
                v_flash = 'b0;
            end
            start_state: begin
                set = 'b0;
                enable = 1'b1;
                ready = 'b0;
                v_flash = 'b0;
            end
            set_state: begin
                set = 1'b1;
                enable = 'b0;
                ready = 'b0;
                v_flash = 1'b1;
            end
            reset_state: begin
                set = 'b0;
                enable = 'b0;
                ready = 'b0;
                v_flash = 'b0;
            end
            default: begin
                set = 'b0;
                enable = 'b0;
                ready = 'b0;
                v_flash = 'b0;
            end
        endcase
    end
    
    always@(posedge ten_khz_clk or posedge reset) begin
        if(reset) begin
            v_f1 <= 'b0;
            v_f2 <= 'b0;
            v_f3 <= 'b0;
            v_f4 <= 'b0;
            v_s1 <= 'b0;
            v_s2 <= 'b0;
            v_m1 <= 'b0;
            v_m2 <= 'b0;
            count_finished <= 'b0;
            one_second <= 'b0;
        end
        else if(set) begin
            v_f1 <= vSet_f1;
            v_f2 <= vSet_f2;
            v_f3 <= vSet_f3;
            v_f4 <= vSet_f4;
            v_s1 <= vSet_s1;
            v_s2 <= vSet_s2;
            v_m1 <= vSet_m1;
            v_m2 <= vSet_m2;
            count_finished <= 'b0;
            one_second <= 'b0;
        end
        else if(enable) begin
            if(state == stop_state) count_finished <= 'b0;
            if(updn) begin
                if(v_f1 == 4'd9 & v_f2 < 4'd9) begin
                    v_f1 <= 4'd0;
                    v_f2 <= v_f2 + 4'b0001;
                end
                else if(v_f1 < 4'd9) begin
                    v_f1 = v_f1 + 4'b0001;
                    count_finished <= 'b0;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 < 4'd9) begin
                    v_f1 <= 4'd0;
                    v_f2 <= 4'd0;
                    v_f3 <= v_f3 + 4'b0001;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 < 4'd9) begin
                    v_f1 <= 4'd0;
                    v_f2 <= 4'd0;
                    v_f3 <= 4'd0;
                    v_f4 <= v_f4 + 4'b0001;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 == 4'd9 & v_s1 < 4'd9) begin
                    v_f1 <= 4'd0;
                    v_f2 <= 4'd0;
                    v_f3 <= 4'd0;
                    v_f4 <= 4'd0;
                    v_s1 <= v_s1 + 4'b0001;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 == 4'd9 & v_s1 == 4'd9 & v_s2 < 4'd5) begin
                    v_f1 <= 4'd0;
                    v_f2 <= 4'd0;
                    v_f3 <= 4'd0;
                    v_f4 <= 4'd0;
                    v_s1 <= 4'd0;
                    v_s2 <= v_s2 + 4'b0001;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 == 4'd9 & v_s1 == 4'd9 & v_s2 == 4'd5 & v_m1 < 4'd9) begin
                    v_f1 <= 4'd0;
                    v_f2 <= 4'd0;
                    v_f3 <= 4'd0;
                    v_f4 <= 4'd0;
                    v_s1 <= 4'd0;
                    v_s2 <= 4'd0;
                    v_m1 <= v_m1 + 4'b0001;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 == 4'd9 & v_s1 == 4'd9 & v_s2 == 4'd5 & v_m1 == 4'd9 & v_m2 < 4'd5) begin
                    v_f1 <= 4'd0;
                    v_f2 <= 4'd0;
                    v_f3 <= 4'd0;
                    v_f4 <= 4'd0;
                    v_s1 <= 4'd0;
                    v_s2 <= 4'd0;
                    v_m1 <= 4'd0;
                    v_m2 <= v_m2 + 4'b0001;
                end
                else if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 == 4'd9 & v_s1 == 4'd9 & v_s2 == 4'd5 & v_m1 == 4'd9 & v_m2 == 4'd5) begin
                    count_finished <= 1'b1;
                end
                if(v_f1 == 4'd9 & v_f2 == 4'd9 & v_f3 == 4'd9 & v_f4 == 4'd9) one_second <= 1'b1;
                else one_second <= 'b0;
            end
            else begin
                if(v_f1 == 4'd0 & v_f2 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= v_f2 - 4'b0001;
                end
                else if(v_f1 > 4'b0) begin
                    v_f1 <= v_f1 - 4'b0001;
                    count_finished <= 'b0;
                end
                else if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= 4'd9;
                    v_f3 = v_f3 - 4'b0001;
                end
                else if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= 4'd9;
                    v_f3 <= 4'd9;
                    v_f4 <= v_f4 - 4'b0001;
                end
                else if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 == 4'd0 & v_s1 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= 4'd9;
                    v_f3 <= 4'd9;
                    v_f4 <= 4'd9;
                    v_s1 <= v_s1 - 4'b0001;
                end
                else if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 == 4'd0 & v_s1 == 4'd0 & v_s2 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= 4'd9;
                    v_f3 <= 4'd9;
                    v_f4 <= 4'd9;
                    v_s1 <= 4'd9;
                    v_s2 <= v_s2 - 4'b0001;
                end
                else if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 == 4'd0 & v_s1 == 4'd0 & v_s2 == 4'd0 & v_m1 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= 4'd9;
                    v_f3 <= 4'd9;
                    v_f4 <= 4'd9;
                    v_s1 <= 4'd9;
                    v_s2 <= 4'd5;
                    v_m1 <= v_m1 - 4'b0001;
                end
                else if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 == 4'd0 & v_s1 == 4'd0 & v_s2 == 4'd0 & v_m1 == 4'd0 & v_m2 > 4'd0) begin
                    v_f1 <= 4'd9;
                    v_f2 <= 4'd9;
                    v_f3 <= 4'd9;
                    v_f4 <= 4'd9;
                    v_s1 <= 4'd9;
                    v_s2 <= 4'd5;
                    v_m1 <= 4'd9;
                    v_m2 <= v_m2 - 4'b0001;
                end
                else if (v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 == 4'd0 & v_s1 == 4'd0 & v_s2 == 4'd0 & v_m1 == 4'd0 & v_m2 == 4'd0) begin
                    count_finished <= 1;
                end
                if(v_f1 == 4'd0 & v_f2 == 4'd0 & v_f3 == 4'd0 & v_f4 == 4'd0) one_second <= 1'b1;
                else one_second <= 'b0;
            end
        end
    end
    
    always@(posedge twentyFive_mhz_clk or posedge reset) begin
		if(reset) begin
            vSet_f1 <= 'b0;
            vSet_f2 <= 'b0;
            vSet_f3 <= 'b0;
            vSet_f4 <= 'b0;
            vSet_s1 <= 'b0;
            vSet_s2 <= 'b0;
            vSet_m1 <= 'b0;
            vSet_m2 <= 'b0;
        end
        else if(setVal_state == set_none) begin
            vSet_f1 <= v_f1;
            vSet_f2 <= v_f2;
            vSet_f3 <= v_f3;
            vSet_f4 <= v_f4;
            vSet_s1 <= v_s1;
            vSet_s2 <= v_s2;
            vSet_m1 <= v_m1;
            vSet_m2 <= v_m2;
        end
		else begin
			if (enc_a_rise)
				if (!enc_b_db)
					case(setVal_state)
						set_f1: if(vSet_f1 > 0) vSet_f1 <= vSet_f1-1;
						set_f2: if(vSet_f2 > 0) vSet_f2 <= vSet_f2-1;
						set_f3: if(vSet_f3 > 0) vSet_f3 <= vSet_f3-1;
						set_f4: if(vSet_f4 > 0) vSet_f4 <= vSet_f4-1;
						set_s1: if(vSet_s1 > 0) vSet_s1 <= vSet_s1-1;
						set_s2: if(vSet_s2 > 0) vSet_s2 <= vSet_s2-1;
						set_m1: if(vSet_m1 > 0) vSet_m1 <= vSet_m1-1;
						set_m2: if(vSet_m2 > 0) vSet_m2 <= vSet_m2-1;
						default: begin
							vSet_f1 <= v_f1;
							vSet_f2 <= v_f2;
							vSet_f3 <= v_f3;
							vSet_f4 <= v_f4;
							vSet_s1 <= v_s1;
							vSet_s2 <= v_s2;
							vSet_m1 <= v_m1;
							vSet_m2 <= v_m2;
						end
					endcase
			else if(enc_b_db)
				case(setVal_state)
					set_none: begin
						vSet_f1 <= v_f1;
						vSet_f2 <= v_f2;
						vSet_f3 <= v_f3;
						vSet_f4 <= v_f4;
						vSet_s1 <= v_s1;
						vSet_s2 <= v_s2;
						vSet_m1 <= v_m1;
						vSet_m2 <= v_m2;
					end
					set_f1: if(vSet_f1 < 9) vSet_f1 <= vSet_f1+1;
					set_f2: if(vSet_f2 < 9) vSet_f2 <= vSet_f2+1;
					set_f3: if(vSet_f3 < 9) vSet_f3 <= vSet_f3+1;
					set_f4: if(vSet_f4 < 9) vSet_f4 <= vSet_f4+1;
					set_s1: if(vSet_s1 < 9) vSet_s1 <= vSet_s1+1;
					set_s2: if(vSet_s2 < 5) vSet_s2 <= vSet_s2+1;
					set_m1: if(vSet_m1 < 9) vSet_m1 <= vSet_m1+1;
					set_m2: if(vSet_m2 < 5) vSet_m2 <= vSet_m2+1;
					default: begin
						vSet_f1 <= v_f1;
						vSet_f2 <= v_f2;
						vSet_f3 <= v_f3;
						vSet_f4 <= v_f4;
						vSet_s1 <= v_s1;
						vSet_s2 <= v_s2;
						vSet_m1 <= v_m1;
						vSet_m2 <= v_m2;
					end
				endcase
		end
    end
    
    Display_controller disp_cont(
        .refresh_clk    (refresh_clk),
        .one_hz_clk     (one_hz_clk),
        .ready          (ready),
        .v_f1           (v_f1),
        .v_f2           (v_f2),
        .v_f3           (v_f3),
        .v_f4           (v_f4),
        .v_s1           (v_s1),
        .v_s2           (v_s2),
        .v_m1           (v_m1),
        .v_m2           (v_m2),
        .v_select       (v_select),
        .v_flash        (v_flash),
        .ready_flash    (ready_flash),
        .seg            (seg),
        .an             (an)
    );

    Sound_controller sound_cont(
        .twentyFive_mhz_clk (twentyFive_mhz_clk),
        .ten_khz_clk        (ten_khz_clk),
        .four_khz_clk       (four_khz_clk),
        .one_hz_clk         (one_hz_clk),
        .enable             (enable),
        .one_second         (one_second),
        .count_finished     (count_finished),
        .enc_btn_press      (enc_btn_fall),
        .enc_sw             (enc_sw),
        .enc_rotate         (enc_a_rise),
        .set_val            (set_val),
        .speaker            (speaker)
    );

endmodule