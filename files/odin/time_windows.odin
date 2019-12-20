/*
 *  @Name:     time_windows
 *  
 *  @Author:   Brendan Punsky
 *  @Email:    bpunsky@gmail.com
 *  @Creation: 23-10-2018 14:40:36 UTC-5
 *
 *  @Last By:   Brendan Punsky
 *  @Last Time: 23-10-2018 19:54:58 UTC-5
 *  
 *  @Description:
 *  
 */

package time

import "core:sys/win32"


cpu_ticks :: inline proc() -> u64 {
    ticks: i64;
    win32.query_performance_counter(&ticks);
    return u64(ticks);
}

cpu_freq :: inline proc() -> u64 {
    freq: i64;
    win32.query_performance_frequency(&freq);
    return u64(freq);
}

cpu_time :: inline proc() -> f64 {
    return f64(cpu_ticks()) / (f64(cpu_freq()) / 1000000);
}


get_time :: proc() -> Date_Time {
    time: win32.Systemtime;
    win32.get_local_time(&time);
    
    return Date_Time {
        int(time.year),
        Month(time.month),
        Weekday(time.day_of_week),
        int(time.day),
        int(time.hour),
        int(time.minute),
        int(time.second),
    };
}
