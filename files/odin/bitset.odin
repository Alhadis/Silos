import_load "fmt.odin";

Bitset :: struct {
	bits : [dynamic] u32,
	is_not_set : bool,
}

create_set :: proc(pos : ..uint) -> ^Bitset {
	r := new(Bitset);
	set(r, ..pos);
	return r;
}

copy_set :: proc(using b : ^Bitset) -> ^Bitset {
	ret := new(Bitset);
	for _u32 in bits {
		append(ret.bits, _u32);
	}
	ret.is_not_set = is_not_set;
	return ret;
}

destroy_set :: proc(using b : ^Bitset) {
	free(bits);
}

__elementary_set :: proc(using b : ^Bitset, pos : ..uint) {
	for p in pos {
		for uint(len(bits)) * 32 <= p {
			append(bits, 0);
		}
		bits[p >> 5] |= 1 << (p % 32);
	}
}

__elementary_unset :: proc(using b : ^Bitset, pos : ..uint) {
	for p in pos {
		if uint(len(bits)) * 32 <= p {
			return;
		}
		bits[p >> 5] &~= 1 << (p % 32);
	}
}

__elementary_get :: proc(using b : ^Bitset, pos : uint) -> bool {
	if uint(len(bits)) * 32 < pos {
		return false;
	}
	return bits[pos >> 5] & (1 << (pos % 32)) != 0;
}

__elementary_union :: proc(a : ^Bitset, b : ^Bitset) -> ^Bitset {
	if len(a.bits) < len(b.bits) {
		a, b = b, a;
	}
	ret := copy_set(a);
	for _u32, idx in b.bits {
		ret.bits[idx] |= _u32;
	}
	return ret;
}

__elementary_cut :: proc(a : ^Bitset, b : ^Bitset) -> ^Bitset {
	if len(a.bits) < len(b.bits) {
		a, b = b, a;
	}
	ret := copy_set(b);
	for _, idx in b.bits {
		ret.bits[idx] &= a.bits[idx];
	}
	return ret;
}

__elementary_difference :: proc(a : ^Bitset, b : ^Bitset) -> ^Bitset {
	ret := copy_set(a);
	min := (len(a.bits) > len(b.bits) ? len(b.bits) : len(a.bits));
	for idx in 0 ..< min {
		ret.bits[idx] &~= b.bits[idx];
	}
	__fix_len(ret);
	return ret;
}

__fix_len :: proc(using b : ^Bitset) {
	// TODO(Felix): Implement as soon as @ginger_bill has a pop_back
	// function for dynamic arrays
}

set :: proc(using b : ^Bitset, pos : ..uint) {
	if is_not_set {
		__elementary_unset(b, ..pos);
	} else {
		__elementary_set(b, ..pos);
	}
}

unset :: proc(using b : ^Bitset, pos : ..uint) {
	if is_not_set {
		__elementary_set(b, ..pos);
	} else {
		__elementary_unset(b, ..pos);
	}
}

get :: proc(using b : ^Bitset, pos : uint) -> bool {
	if is_not_set {
		return !__elementary_get(b, pos);
	}
	return __elementary_get(b, pos);
}

get_all :: proc(using b : ^Bitset) -> []uint {
	ret := [dynamic]uint;
	// skipping bounds check by not calling get
	for i in 0 ..< uint(32 * len(bits)) {
		if is_not_set {
			if bits[i >> 5] & (1 << (i % 32)) == 0 {
				append(ret, i);
			}
		} else {
			if bits[i >> 5] & (1 << (i % 32)) != 0 {
				append(ret, i);
			}
		}
	}
	return ret[..];
}

 not_set :: proc(a : ^Bitset) -> ^Bitset {
	using ret := copy_set(a);
	is_not_set = is_not_set == true ? false : true;
	return ret;
}

cut_set :: proc(a : ^Bitset, b : ^Bitset) -> ^Bitset {
	if a.is_not_set == b.is_not_set { // neither or both are not_sets
		if !a.is_not_set {            // neither are
			return __elementary_cut(a, b);
		} else {                      // both are
			return __elementary_union(a, b);
		}
	} else {                          // one of them is a not_set
		if a.is_not_set {
			return __elementary_difference(b, a);
		} else {
			return __elementary_difference(a, b);
		}
	}
}

union_set :: proc(a : ^Bitset, b : ^Bitset) -> ^Bitset {
	if a.is_not_set == b.is_not_set { // neither or both are not_sets
		if !a.is_not_set {            // neither are
			return __elementary_union(a, b);
		} else {                      // both are
			return __elementary_cut(a, b);
		}
	} else {                          // one of them is a not_set
		if a.is_not_set {
			ret := __elementary_difference(b, a);
			ret.is_not_set = true;
			return ret;
		} else {
			ret := __elementary_difference(a, b);
			ret.is_not_set = true;
			return ret;
		}
	}
}

difference_set :: proc(a : ^Bitset, b : ^Bitset) -> ^Bitset {
	if a.is_not_set == b.is_not_set { // neither or both are not_sets
		if !a.is_not_set{             // neither are
			return __elementary_difference(a, b);
		} else {                      // both are
			ret := __elementary_difference(b, a);
			ret.is_not_set = false;
			return ret;
		}
	} else {                          // one of them is a not_set
		if a.is_not_set {
			ret := __elementary_union(a, b);
			ret.is_not_set = true;
			return ret;
		} else {
			ret := __elementary_cut(a, b);
			ret.is_not_set = false;
			return ret;
		}
	}
}
