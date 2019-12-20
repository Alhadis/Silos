package binary

little_endian_decode_u16 :: proc(b: []byte) -> u16 {
	return u16(b[0]) | u16(b[1]) << 8;
}

little_endian_decode_u32 :: proc(b: []byte) -> u32 {
	return	u32(b[0]) |
			u32(b[1]) << 8 |
			u32(b[2]) << 16 |
			u32(b[3]) << 24;
}

little_endian_decode_u64 :: proc(b: []byte) -> u64 {
	return	u64(b[0]) |
			u64(b[1]) << 8 |
			u64(b[2]) << 16 |
			u64(b[3]) << 24 |
			u64(b[4]) << 32 |
			u64(b[5]) << 40 |
			u64(b[6]) << 48 |
			u64(b[7]) << 54;
}


little_endian_encode_u16 :: proc(v: u16) -> [2]byte {
	return [2]byte {
		byte(v),
		byte(v >> 8),
	};
}

little_endian_encode_u32 :: proc(v: u32) -> [4]byte {
	return [4]byte {
		byte(v),
		byte(v >> 8),
		byte(v >> 16),
		byte(v >> 24),
	};
}

little_endian_encode_u64 :: proc(v: u64) -> [8]byte {
	return [8]byte {
		byte(v),
		byte(v >> 8),
		byte(v >> 16),
		byte(v >> 24),
		byte(v >> 32),
		byte(v >> 40),
		byte(v >> 48),
		byte(v >> 54),
	};
}
