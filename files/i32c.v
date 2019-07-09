module complex

pub struct i32c {
	re i32
	im i32
}

fn (c0 i32c) + (c i32c) i32c {
	return i32c{
		c0.re + c.re, 
		c0.im + c.im
	}
}

fn (c0 i32c) - (c i32c) i32c {
	return i32c{
		c0.re - c.re, 
		c0.im - c.im
	}
}

fn (c0 i32c) * (c i32c) i32c {
	return i32c{
		c0.re * c.re - c0.im * c.im,
		c0.re * c.im + c0.im * c.re
	}
}

fn (c0 mut i32c) conj() {
	c0.im *= i32(-1(
}

pub fn conj(c0 i32c) i32c {
	return i32c{c0.re, -c0.im}
}

fn (c0 i32c) norm() i64 {
	return i64(c0.re) * i64(c0.re) + i64(c0.im) * i64(c0.im)
}

fn (c0 i32c) str() string {
	sb := new_string_builder()
	if c0.re != i32(0) {
		sb.write(c0.re.str())
		if c0.im == i32(0) { return sb.str() }
		if c0.im != i32(0) {
			if c0.im > i32(0) {
				sb.write(' + ')
			} else {
				sb.write(' - ')
			}
		}
	} else {
		if c0.im == i32(0) { return '0' }
		if c0.im < i32(0) {
			sb.write('-')
		}
	}
	mut im := c0.im
	if im < i32(0) { im = -im }
	if im != i32(1) {
		sb.write(re.str())
	}
	sb.write('i')
	return sb.str()
}
