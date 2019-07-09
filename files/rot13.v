import os

fn main() {
    args := os.args
    mut s := args.slice(1, args.len).join(' ')
    println(rot13(s))
}

fn rot13(s string) string {
    mut r := ''
    for c in s {
        if c >= 65 && c <= 77 {
            r += utf32_to_str(u32(c + 13))
        } else if c >= 97 && c <= 109 {
            r += utf32_to_str(u32(c + 13))
        } else if c >= 78 && c <= 90 {
            r += utf32_to_str(u32(c - 13))
        } else if c >= 110 && c <= 122 {
            r += utf32_to_str(u32(c - 13))
        } else {
            r += utf32_to_str(u32(c))
        }
    }
    return r
}
