module complex

pub struct i8c {
	re i8
	im i8
}

fn (c0 i8c) + (c i8c) i8c {
	return i8c{
		c0.re + c.re, 
		c0.im + c.im
	}
}

fn (c0 i8c) - (c i8c) i8c {
	return i8c{
		c0.re - c.re, 
		c0.im - c.im
	}
}

fn (c0 i8c) * (c i8c) i8c {
	return i8c{
		c0.re * c.re - c0.im * c.im,
		c0.re * c.im + c0.im * c.re
	}
}

fn (c0 mut i8c) conj() {
	c0.im *= i8(-1)
}

pub fn conj(c0 i8c) i8c {
	return i8c{c0.re, -c0.im}
}

fn (c0 i8c) norm() i64 {
	return i64(c0.re) * i64(c0.re) + i64(c0.im) * i64(c0.im)
}

fn (c0 i8c) str() string {
	sb := new_string_builder()
	if c0.re != i8(0) {
		sb.write(c0.re.str())
		if c0.im == i8(0) { return sb.str() }
		if c0.im != i8(0) {
			if c0.im > i8(0) {
				sb.write(' + ')
			} else {
				sb.write(' - ')
			}
		}
	} else {
		if c0.im == i8(0) { return '0' }
		if c0.im < i8(0) {
			sb.write('-')
		}
	}
	mut im := c0.im
	if im < i8(0) { im = -im }
	if im != i8(1) {
		sb.write(re.str())
	}
	sb.write('i')
	return sb.str()
}
