/*
 *  @Name:     jwin32
 *  
 *  @Author:   Mikkel Hjortshoej
 *  @Email:    hjortshoej@handmade.network
 *  @Creation: 02-05-2017 21:38:35
 *
 *  @Last By:   Mikkel Hjortshoej
 *  @Last Time: 24-09-2017 23:09:58
 *  
 *  @Description:
 *      Contains windows API not covered by Odin Core.
 */
// User32
combine_hi_lo :: proc(lo : u32, hi : u32) -> u64 {
    return u64(u64(lo) << 32 | u64(hi));
}