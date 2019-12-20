package vm

import "../binary"

op_loadb :: proc(self: ^[dynamic]byte, dst: Reg, val: u8) {
	append(
		self,
		byte(Op.LoadB),
		byte(dst),
		byte(val),
	);
}

op_loadw :: proc(self: ^[dynamic]byte, dst: Reg, val: u16) {
	bytes := binary.little_endian_encode_u16(val);
	append(
		self,
		byte(Op.LoadW),
		byte(dst),
		bytes[0],
		bytes[1],
	);
}

op_loadd :: proc(self: ^[dynamic]byte, dst: Reg, val: u32) {
	bytes := binary.little_endian_encode_u32(val);
	append(
		self,
		byte(Op.LoadD),
		byte(dst),
		bytes[0],
		bytes[1],
		bytes[2],
		bytes[3],
	);
}

op_loadq :: proc(self: ^[dynamic]byte, dst: Reg, val: u64) {
	bytes := binary.little_endian_encode_u64(val);
	append(
		self,
		byte(Op.LoadQ),
		byte(dst),
		bytes[0],
		bytes[1],
		bytes[2],
		bytes[3],
		bytes[4],
		bytes[5],
		bytes[6],
		bytes[7],
	);
}

op_addb :: proc(self: ^[dynamic]byte, dst: Reg, src: Reg) {
	append(
		self,
		byte(Op.AddB),
		byte(dst),
		byte(src),
	);
}

op_addw :: proc(self: ^[dynamic]byte, dst: Reg, src: Reg) {
	append(
		self,
		byte(Op.AddW),
		byte(dst),
		byte(src),
	);
}

op_addd :: proc(self: ^[dynamic]byte, dst: Reg, src: Reg) {
	append(
		self,
		byte(Op.AddD),
		byte(dst),
		byte(src),
	);
}

op_addq :: proc(self: ^[dynamic]byte, dst: Reg, src: Reg) {
	append(
		self,
		byte(Op.AddQ),
		byte(dst),
		byte(src),
	);
}

op_halt :: proc(self: ^[dynamic]byte) {
	append(
		self,
		byte(Op.Halt)
	);
}