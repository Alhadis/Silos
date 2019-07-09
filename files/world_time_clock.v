`timescale 1ns / 1ps

//  world_time_clock module
//  ->top level module

module world_time_clock(
    input [15:0] zoneSw,
    input menuBtn, snzBtn, minBtn, plusBtn, offBtn,
    input clock,
    output [15:0] led,
    output [7:0] data,
    output enable, select, rec, play, light, backlight
    );
    
    //wires for interconnections
    wire clock1hz, clock5hz, clock200hz, trigSec, trigMin, isPM, adjustedAMPM;
    wire menuIntrup, ovrIntrup, menu, snz, minus, plus, off, is24HrMode, presetampm;
    wire load_fnA, load_fnB, load_fnC, load, alarm_on, alarm_ampm, backlight_ctrl;
    wire [5:0] count_hour, preset_hour, preset_min, timezone_hour, adjusted_hour;
    wire [5:0] minute, second, alarm_hour, alarm_min;
    wire [127:0] time_top, time_bot, menu_top, menu_bot, ovr_top, ovr_bot, mux_top, mux_bot, timezone_text;
    
    //module connections
    prescaler(.clock(clock), .out1hz(clock1hz), .out5hz(clock5hz), .out200hz(clock200hz));
    button_debounce(.clock(clock5hz), .menuBtn(menuBtn), .snzBtn(snzBtn), .minBtn(minBtn), .plusBtn(plusBtn), .offBtn(offBtn), .menu(menu), .snz(snz), .min(minus), .plus(plus), .off(off));
    counter60 sec(.clock(clock1hz), .out(second), .trigger(trigSec));
    counter60 min(.preset(preset_min), .load(load), .clock(trigSec), .out(minute), .trigger(trigMin), .load_finished(load_fnB));
    counter1224 hour(.preset(preset_hour), .presetampm(presetampm), .load(load), .clock(trigMin), .is24HrMode(is24HrMode), .out(count_hour), .isPM(isPM), .load_finished(load_fnA));
    timezone_control(.select(zoneSw), .out(timezone_hour), .led(led));
    timezone_adjust(.hour(count_hour), .selectedTime(timezone_hour), .is24HrMode(is24HrMode), .isPM(isPM), .loadRefZone(load), .adjustedTime(adjusted_hour), .adjustedAMPM(adjustedAMPM), .load_finished(load_fnC));
    timezone_name(.timezone(timezone_hour), .lcd_out(timezone_text));
    timezone_overlay(.timezone(timezone_hour), .ovrIntrup(ovrIntrup), .top(ovr_top), .bot(ovr_bot));
    time_to_lcd(.hour(adjusted_hour), .minute(minute), .second(second), .is24HrMode(is24HrMode), .isPM(adjustedAMPM), .out(time_bot));
    alarm_control(.clock(clock5hz), .ref_hour(adjusted_hour), .ref_min(minute), .set_hour(alarm_hour), .set_min(alarm_min), .ref_ampm(isPM), .set_ampm(alarm_ampm),
                  .on(alarm_on), .is24HrMode(is24HrMode), .off_btn(off), .snooze_btn(snz), .play_sound(play), .light(light), .backlight(backlight_ctrl));
    alarm_overlay(.alarm_on(alarm_on), .in(timezone_text), .out(time_top));
    display_mux(.menuIntrup(menuIntrup), .ovrIntrup(ovrIntrup), .time_top(time_top), .menu_top(menu_top), .time_bot(time_bot), .menu_bot(menu_bot), .ntzoverlay_top(ovr_top), .ntzoverlay_bot(ovr_bot),
                  .out_top(mux_top), .out_bot(mux_bot));
    display_driver(.clock(clock200hz), .in_top(mux_top), .in_bot(mux_bot), .data(data), .enable(enable), .select(select), .backlight_ctrl(backlight_ctrl), .backlight(backlight));
    menu(.clock(clock5hz), .menuBtn(menu), .minBtn(minus), .plusBtn(plus), .offBtn(off), .menu_top(menu_top), .menu_bot(menu_bot), .menuIntrup(menuIntrup), .rec(rec), .is24HrMode(is24HrMode),
         .presetHour(preset_hour), .presetMin(preset_min), .presetampm(presetampm), .load(load), .load_finished(load_fnA & load_fnB & load_fnC), .alarmHour(alarm_hour), .alarmMin(alarm_min),
         .alarmampm(alarm_ampm), .alarm_on(alarm_on));
         
endmodule
