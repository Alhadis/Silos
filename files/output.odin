using import "core:bits.odin";

// XorShift, Random Shift: state = 2*output
xsh_rs ::  inline proc(state: u16) -> u8 {
	return  u8(((state >> 7) ~ state) >> ((state >> 14) + 3));
}
xsh_rs ::  inline proc(state: u32) -> u16 {
	return u16(((state >> 11) ~ state) >> ((state >> 30) + 11));
}
xsh_rs ::  inline proc(state: u64) -> u32 {
	return u32(((state >> 22) ~ state) >> ((state >> 61) + 22));
}
xsh_rs :: inline proc(state: u128) -> u64 {
	return u64(((state >> 43) ~ state) >> ((state >> 124) + 45));
}

// XorShift, Random Rotation: state = 2*output
xsh_rr :: inline proc(state: u16) -> u8 {
	return rotate_right(u8(((state >> 5) ~ state) >>  5),
			uint(state >> 13));
}
xsh_rr :: inline proc(state: u32) -> u16 {
	return rotate_right(u16(((state >> 10) ~ state) >> 12),
			uint(state>>28));
}
xsh_rr :: inline proc(state: u64) -> u32 {
	return rotate_right(u32(((state >> 18) ~ state) >> 27),
			uint(state >> 59));
}
xsh_rr :: inline proc(state: u128) -> u64 {
	return rotate_right(u64(((state >> 29) ~ state) >>  58),
			uint(state >> 122));
}

// Random XorShift, Multiplication, XorShift: state = output
rxs_m_xs :: inline proc(state: u8) -> u8 {
	word := ((state >> ((state >> 6) + 2)) ~ state) * 217;
	return (word >> 6) ~ word;
}
rxs_m_xs :: inline proc(state: u16) -> u16 {
	word := ((state >> ((state >> 13) + 3)) ~ state) * 62169;
	return (word >> 11) ~ word;
}
rxs_m_xs :: inline proc(state: u32) -> u32 {
	word := ((state >> ((state >> 28) + 4)) ~ state) * 277803737;
	return (word >> 22) ~ word;
}
rxs_m_xs :: inline proc(state: u64) -> u64 {
	word := ((state >> ((state >> 59) + 5)) ~ state)
		* 12605985483714917081;
	return (word >> 43) ~ word;
}
rxs_m_xs :: inline proc(state: u128) -> u128 {
	word := ((state >> ((state >> 122) + 5)) ~ state)
		* 327738287884841127335028083622016905945;
	return (word >> 86) ~ word;
}

// XorShift Low, Random Rotation: state = 2*output, state >= 64
xsl_rr :: inline proc(state: u64) -> u32 {
	return rotate_right(u32(state >> 32) ~ u32(state), uint(state >> 59));
}
xsl_rr :: inline proc(state: u128) -> u64 {
	return rotate_right(u64(state >> 64) ~ u64(state), uint(state >> 122));
}

// XSL, RR, RR: state = output, state >= 64
xsl_rr_rr :: inline proc(state: u64) -> u64 {
	rot1 := u32(state >> 59);
	high := u32(state >> 32);
	low  := u32(state);
	xored := high ~ low;
	newlow := rotate_right(xored, uint(rot1));
	newhigh := rotate_right(high, uint(newlow & 31));
	return (u64(newhigh) << 32) | u64(newlow);
}
xsl_rr_rr :: inline proc(state: u128) -> u128 {
	rot1 := u32(state >> 122);
	high := u64(state >> 64);
	low  := u64(state);
	xored := high ~ low;
	newlow := rotate_right(xored, uint(rot1));
	newhigh : u64 = rotate_right(high, uint(newlow & 63));
	return (u128(newhigh) << 64) | u128(newlow);
}

/* TODO: report bug:
func :: proc() -> u64 {
	foo, bar: u32;
	return (u64(foo) << 32) | bar;
}
BUG: complains about binary expression `(u64(foo) << 32)` : u64 vs u32
It should mention bar, as bar is the variable with a mismatched type
(untyped constants can't be of the wrong type here, by definition)
*/
