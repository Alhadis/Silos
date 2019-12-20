package vm

import "../binary"

Op :: enum byte {
	LoadB,
	LoadW,
	LoadD,
	LoadQ,
	AddB,
	AddW,
	AddD,
	AddQ,
	Halt,
}

Reg :: enum byte {
	R0,
	R1,
	R2,
	R3,
	R4,
	R5,
	R6,
	R7,
}

Reg_Value :: struct #raw_union {
	B: u8,
	W: u16,
	D: u32,
	Q: u64,
}

Core :: struct {
	r: [8]Reg_Value,
	ip: u64,
}

_popB :: proc(c: ^Core, b: []byte) -> u8 {
	r := b[c.ip];
	c.ip += size_of(u8);
	return r;
}

_popW :: proc(c: ^Core, b: []byte) -> u16 {
	r := binary.little_endian_decode_u16(b[c.ip:]);
	c.ip += size_of(u16);
	return r;
}

_popD :: proc(c: ^Core, b: []byte) -> u32 {
	r := binary.little_endian_decode_u32(b[c.ip:]);
	c.ip += size_of(u32);
	return r;
}

_popQ :: proc(c: ^Core, b: []byte) -> u64 {
	r := binary.little_endian_decode_u64(b[c.ip:]);
	c.ip += size_of(u64);
	return r;
}

cpu :: proc(c: ^Core, b: []byte) -> bool {
	op := Op(_popB(c, b));
	#complete switch op {
	case Op.LoadB:
		dst := _popB(c, b);
		c.r[dst].B = _popB(c, b);
		return false;
	case Op.LoadW:
		dst := _popB(c, b);
		c.r[dst].W = _popW(c, b);
		return false;
	case Op.LoadD:
		dst := _popB(c, b);
		c.r[dst].D = _popD(c, b);
		return false;
	case Op.LoadQ:
		dst := _popB(c, b);
		c.r[dst].Q = _popQ(c, b);
		return false;
	case Op.AddB:
		dst := _popB(c, b);
		src := _popB(c, b);
		c.r[dst].B += c.r[src].B;
		return false;
	case Op.AddW:
		dst := _popB(c, b);
		src := _popB(c, b);
		c.r[dst].W += c.r[src].W;
		return false;
	case Op.AddD:
		dst := _popB(c, b);
		src := _popB(c, b);
		c.r[dst].D += c.r[src].D;
		return false;
	case Op.AddQ:
		dst := _popB(c, b);
		src := _popB(c, b);
		c.r[dst].Q += c.r[src].Q;
		return false;
	case Op.Halt:
		return true;
	}
	return true;
}