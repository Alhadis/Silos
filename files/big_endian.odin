package binary

big_endian_decode_u16 :: proc(b: []byte) -> u16 {
	return u16(b[1]) | u16(b[0]) << 8;
}

big_endian_decode_u32 :: proc(b: []byte) -> u32 {
	return	u32(b[3]) |
			u32(b[2]) << 8 |
			u32(b[1]) << 16 |
			u32(b[0]) << 24;
}

big_endian_decode_u64 :: proc(b: []byte) -> u64 {
	return	u64(b[7]) |
			u64(b[6]) << 8 |
			u64(b[5]) << 16 |
			u64(b[4]) << 24 |
			u64(b[3]) << 32 |
			u64(b[2]) << 40 |
			u64(b[1]) << 48 |
			u64(b[0]) << 54;
}


big_endian_encode_u16 :: proc(v: u16) -> [2]byte {
	return [2]byte {
		byte(v >> 8),
		byte(v),
	};
}

big_endian_encode_u32 :: proc(v: u32) -> [4]byte {
	return [4]byte {
		byte(v >> 24),
		byte(v >> 16),
		byte(v >> 8),
		byte(v),
	};
}

big_endian_encode_u64 :: proc(v: u64) -> [8]byte {
	return [8]byte {
		byte(v >> 54),
		byte(v >> 48),
		byte(v >> 40),
		byte(v >> 32),
		byte(v >> 24),
		byte(v >> 16),
		byte(v >> 8),
		byte(v),
	};
}
