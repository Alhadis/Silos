module complex

pub struct i16c {
	re i16
	im i16
}

fn (c0 i16c) + (c i16c) i16c {
	return i16c{
		c0.re + c.re, 
		c0.im + c.im
	}
}

fn (c0 i16c) - (c i16c) i16c {
	return i16c{
		c0.re - c.re, 
		c0.im - c.im
	}
}

fn (c0 i16c) * (c i16c) i16c {
	return i16c{
		c0.re * c.re - c0.im * c.im,
		c0.re * c.im + c0.im * c.re
	}
}

fn (c0 mut i16c) conj() {
	c0.im *= i16(-1)
}

pub fn conj(c0 i16c) i16c {
	return i16c{c0.re, -c0.im}
}

fn (c0 i16c) norm() i64 {
	return i64(c0.re) * i64(c0.re) + i64(c0.im) * i64(c0.im)
}

fn (c0 i16c) str() string {
	sb := new_string_builder()
	if c0.re != i16(0) {
		sb.write(c0.re.str())
		if c0.im == i16(0) { return sb.str() }
		if c0.im != i16(0) {
			if c0.im > i16(0) {
				sb.write(' + ')
			} else {
				sb.write(' - ')
			}
		}
	} else {
		if c0.im == i16(0) { return '0' }
		if c0.im < i16(0) {
			sb.write('-')
		}
	}
	mut im := c0.im
	if im < i16(0) { im = -im }
	if im != i16(1) {
		sb.write(re.str())
	}
	sb.write('i')
	return sb.str()
}
