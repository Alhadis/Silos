/*
 *  @Name:     time
 *  
 *  @Author:   Brendan Punsky
 *  @Email:    bpunsky@gmail.com
 *  @Creation: 23-10-2018 14:39:21 UTC-5
 *
 *  @Last By:   Brendan Punsky
 *  @Last Time: 23-10-2018 19:55:25 UTC-5
 *  
 *  @Description:
 *  
 */

package time 

import "core:fmt"


using Weekday :: enum {
    Sunday,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday
}

using Month :: enum {
    _,
    January,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    November,
    December
}

Date_Time :: struct {
    year:    int,
    month:   Month,
    weekday: Weekday,
    day:     int,
    hour:    int,
    minute:  int,
    second:  int,
}


Timer :: struct {
    ticks: u64,
    freq:  u64,
}

make_timer :: proc() -> Timer {
    timer: Timer;
    timer.ticks = cpu_ticks();
    timer.freq  = cpu_freq();
    return timer;
}

start :: proc(using timer: ^Timer) {
    ticks = cpu_ticks();
}

query :: proc(using timer: ^Timer) -> f64 {
    return f64(cpu_ticks() - ticks) / (f64(freq) / 1000000);
}


main :: proc() {
    fmt.println(get_time());
}
