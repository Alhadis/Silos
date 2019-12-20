
_T := [64]u32{ 
		0xD76AA478,   0xE8C7B756,   0x242070DB,   0xC1BDCEEE,
		0xF57C0FAF,   0x4787C62A,   0xA8304613,   0xFD469501,
		0x698098D8,   0x8B44F7AF,   0xFFFF5BB1,   0x895CD7BE,
		0x6B901122,   0xFD987193,   0xA679438E,   0x49B40821,
		0xF61E2562,   0xC040B340,   0x265E5A51,   0xE9B6C7AA,
		0xD62F105D,   0x02441453,   0xD8A1E681,   0xE7D3FBC8,
		0x21E1CDE6,   0xC33707D6,   0xF4D50D87,   0x455A14ED,
		0xA9E3E905,   0xFCEFA3F8,   0x676F02D9,   0x8D2A4C8A,
		0xFFFA3942,   0x8771F681,   0x6D9D6122,   0xFDE5380C,
		0xA4BEEA44,   0x4BDECFA9,   0xF6BB4B60,   0xBEBFBC70,
		0x289B7EC6,   0xEAA127FA,   0xD4EF3085,   0x04881D05,
		0xD9D4D039,   0xE6DB99E5,   0x1FA27CF8,   0xC4AC5665,
		0xF4292244,   0x432AFF97,   0xAB9423A7,   0xFC93A039,
		0x655B59C3,   0x8F0CCC92,   0xFFEFF47D,   0x85845DD1,
		0x6FA87E4F,   0xFE2CE6E0,   0xA3014314,   0x4E0811A1,
		0xF7537E82,   0xBD3AF235,   0x2AD7D2BB,   0xEB86D391 
};

__F :: proc(X, Y, Z: u32) -> u32 {
	return (X & Y) | (~X) & Z;
}

__G :: proc(X, Y, Z: u32) -> u32 { 
	return (X & Z) | Y & (~Z);
}

__H :: proc(X, Y, Z: u32) -> u32 { 
	return (X ~ Y) ~ Z;
}

__I :: proc(X, Y, Z: u32) -> u32 { 
	return (Y ~ (X | (~Z))); 
}


__rol :: proc(val, shifts: u32) -> u32 {
	bits : u32 = 4 * 8; //4 bytes = 32 bits
	a := val >> (bits - (shifts % bits));
	b := val << shifts;
	return a | b;
}

__cpy :: proc(src: ^[]u8, dst: ^[]u8, offset, count: int) {
	for i in offset..count {
		dst[i] = src[i];
	}
}

__flip :: proc(i: u32) -> u32 {
	return (i & 0x000000FF) << ((4 - 1) * 8) | (i & 0x0000FF00) << 8 | (i & 0x00FF0000) >> 8 | (i & 0xFF000000) >> ((4 - 1) * 8);
}

__trn1 :: proc(a, b, c, d: ^u32, k, s, i: u32, X: ^[16]u32) {
	a^ = b^ + __rol(((a^ + __F(b^, c^, d^)) + X^[k]) + _T[i-1], s);
}


__trn2 :: proc(a, b, c, d: ^u32, k, s, i: u32, X: ^[16]u32) {
	a^ = b^ + __rol(a^ + __G(b^, c^, d^) + X^[k] + _T[i-1], s);
}


__trn3 :: proc(a, b, c, d: ^u32, k, s, i: u32, X: ^[16]u32) {
	a^ = b^ + __rol(a^ + __H(b^, c^, d^) + X^[k] + _T[i-1], s);
}


__trn4 :: proc(a, b, c, d: ^u32, k, s, i: u32, X: ^[16]u32) {
	a^ = b^ + __rol(a^ + __I(b^, c^, d^) + X^[k] + _T[i-1], s);
}

hash :: proc(data_in: []u8) -> string {
	// https://www.ietf.org/rfc/rfc1321.txt
	// http://motp.sourceforge.net/MD5.java
	// https://rosettacode.org/wiki/MD5/Implementation_Debug

	dataLen := len(data_in);
	paddingLength := 0;
	lenMod := dataLen % 64;
	if lenMod >= 56 {
		paddingLength = (64 - lenMod) + 56;
	}
	else {
		paddingLength = 56 - lenMod;
	}

	newLen : int = dataLen + paddingLength + 8; 
	padded := make([]u8, newLen);
	defer free(padded);

	__cpy(&data_in, &padded, 0, dataLen);
	padded[dataLen] = 0x80;

	for i := 8; i > 0; i -= 1 {
		padded[newLen-i] = u8((dataLen*8) >> uint(((8 - i) * 8)) & 0x00000000000000ff);
	}

	pwLen := newLen/4;
	paddedWord := make([]u32, pwLen); //len(padded) / size_of(u32)
	defer free(paddedWord);
	for i in 0..len(paddedWord) {
		a := u32(u32(padded[(i * 4) + 0]) << (8 * 0));
		b := u32(u32(padded[(i * 4) + 1]) << (8 * 1));
		c := u32(u32(padded[(i * 4) + 2]) << (8 * 2));
		d := u32(u32(padded[(i * 4) + 3]) << (8 * 3));
		paddedWord[i] = a | b | c | d;
	}

	A : u32 = 0x67452301;
	B : u32 = 0xefcdab89;
	C : u32 = 0x98badcfe;
	D : u32 = 0x10325476;

	
	 for i in 0..pwLen/16 {
		X: [16]u32;

		for j in 0..16 {
			X[j] = u32(paddedWord[i * 16 + j]);
		}

		AA: u32 = A;
		BB: u32 = B;
		CC: u32 = C;
		DD: u32 = D;

		__trn1(&A, &B, &C, &D,  0,  7,  1, &X);
		__trn1(&D, &A, &B, &C,  1, 12,  2, &X);
		__trn1(&C, &D, &A, &B,  2, 17,  3, &X);
		__trn1(&B, &C, &D, &A,  3, 22,  4, &X);
		__trn1(&A, &B, &C, &D,  4,  7,  5, &X);
		__trn1(&D, &A, &B, &C,  5, 12,  6, &X);
		__trn1(&C, &D, &A, &B,  6, 17,  7, &X);
		__trn1(&B, &C, &D, &A,  7, 22,  8, &X);
		__trn1(&A, &B, &C, &D,  8,  7,  9, &X);
		__trn1(&D, &A, &B, &C,  9, 12, 10, &X);
		__trn1(&C, &D, &A, &B, 10, 17, 11, &X);
		__trn1(&B, &C, &D, &A, 11, 22, 12, &X);
		__trn1(&A, &B, &C, &D, 12,  7, 13, &X);
		__trn1(&D, &A, &B, &C, 13, 12, 14, &X);
		__trn1(&C, &D, &A, &B, 14, 17, 15, &X);
		__trn1(&B, &C, &D, &A, 15, 22, 16, &X);

		__trn2(&A, &B, &C, &D,  1,  5, 17, &X);
		__trn2(&D, &A, &B, &C,  6,  9, 18, &X);
		__trn2(&C, &D, &A, &B, 11, 14, 19, &X);
		__trn2(&B, &C, &D, &A,  0, 20, 20, &X);
		__trn2(&A, &B, &C, &D,  5,  5, 21, &X);
		__trn2(&D, &A, &B, &C, 10,  9, 22, &X);
		__trn2(&C, &D, &A, &B, 15, 14, 23, &X);
		__trn2(&B, &C, &D, &A,  4, 20, 24, &X);
		__trn2(&A, &B, &C, &D,  9,  5, 25, &X);
		__trn2(&D, &A, &B, &C, 14,  9, 26, &X);
		__trn2(&C, &D, &A, &B,  3, 14, 27, &X);
		__trn2(&B, &C, &D, &A,  8, 20, 28, &X);
		__trn2(&A, &B, &C, &D, 13,  5, 29, &X);
		__trn2(&D, &A, &B, &C,  2,  9, 30, &X);
		__trn2(&C, &D, &A, &B,  7, 14, 31, &X);
		__trn2(&B, &C, &D, &A, 12, 20, 32, &X);	

		__trn3(&A, &B, &C, &D,  5,  4, 33, &X);
		__trn3(&D, &A, &B, &C,  8, 11, 34, &X);
		__trn3(&C, &D, &A, &B, 11, 16, 35, &X);
		__trn3(&B, &C, &D, &A, 14, 23, 36, &X);
		__trn3(&A, &B, &C, &D,  1,  4, 37, &X);
		__trn3(&D, &A, &B, &C,  4, 11, 38, &X);
		__trn3(&C, &D, &A, &B,  7, 16, 39, &X);
		__trn3(&B, &C, &D, &A, 10, 23, 40, &X);
		__trn3(&A, &B, &C, &D, 13,  4, 41, &X);
		__trn3(&D, &A, &B, &C,  0, 11, 42, &X);
		__trn3(&C, &D, &A, &B,  3, 16, 43, &X);
		__trn3(&B, &C, &D, &A,  6, 23, 44, &X);
		__trn3(&A, &B, &C, &D,  9,  4, 45, &X);
		__trn3(&D, &A, &B, &C, 12, 11, 46, &X);
		__trn3(&C, &D, &A, &B, 15, 16, 47, &X);
		__trn3(&B, &C, &D, &A,  2, 23, 48, &X);

		__trn4(&A, &B, &C, &D,  0,  6, 49, &X);
		__trn4(&D, &A, &B, &C,  7, 10, 50, &X);
		__trn4(&C, &D, &A, &B, 14, 15, 51, &X);
		__trn4(&B, &C, &D, &A,  5, 21, 52, &X);
		__trn4(&A, &B, &C, &D, 12,  6, 53, &X);
		__trn4(&D, &A, &B, &C,  3, 10, 54, &X);
		__trn4(&C, &D, &A, &B, 10, 15, 55, &X);
		__trn4(&B, &C, &D, &A,  1, 21, 56, &X);
		__trn4(&A, &B, &C, &D,  8,  6, 57, &X);
		__trn4(&D, &A, &B, &C, 15, 10, 58, &X);
		__trn4(&C, &D, &A, &B,  6, 15, 59, &X);
		__trn4(&B, &C, &D, &A, 13, 21, 60, &X);
		__trn4(&A, &B, &C, &D,  4,  6, 61, &X);
		__trn4(&D, &A, &B, &C, 11, 10, 62, &X);
		__trn4(&C, &D, &A, &B,  2, 15, 63, &X);
		__trn4(&B, &C, &D, &A,  9, 21, 64, &X);
		
		A = A + AA;
		B = B + BB;
		C = C + CC;
		D = D + DD;
	}


	outp := make([]u8, 16);
	defer free(outp);
	for i in 0..4 {
		outp[i + 0] = u8(A >> u8(i * 8));
	}
	for i in 0..4{
		outp[i + 4] = u8(B >> u8(i * 8));
	}
	for i in 0..4 {
		outp[i + 8] = u8(C >> u8(i * 8));
	}
	for i in 0..4 {
		outp[i +12] = u8(D >> u8(i * 8));
	}

	outps := make([]u8, 32);
	defer free(outps);
	hexChars := "0123456789abcdef";
	for b, i in outp {
		// 0x0C
		bh, bl: =
			(b << 0) >> 4,
			(b << 4) >> 4;
		outps[i * 2] = hexChars[bh];
		outps[i * 2 + 1] = hexChars[bl];
	}
	return string(outps);
	
}

main :: proc() {
	
}