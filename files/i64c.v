module complex

pub struct i64c {
	re i64
	im i64
}

fn (c0 i64c) + (c i64c) i64c {
	return i64c{
		c0.re + c.re, 
		c0.im + c.im
	}
}

fn (c0 i64c) - (c i64c) i64c {
	return i64c{
		c0.re - c.re, 
		c0.im - c.im
	}
}

fn (c0 i64c) * (c i64c) i64c {
	return i64c{
		c0.re * c.re - c0.im * c.im,
		c0.re * c.im + c0.im * c.re
	}
}

fn (c0 mut i64c) conj() {
	c0.im *= i64(-1)
}

pub fn conj(c0 i64c) i64c {
	return i64c{c0.re, -c0.im}
}

fn (c0 i64c) norm() i64 {
	return c0.re * c0.re + c0.im * c0.im
}

fn (c0 i64c) str() string {
	sb := new_string_builder()
	if c0.re != i64(0) {
		sb.write(c0.re.str())
		if c0.im == i64(0) { return sb.str() }
		if c0.im != i64(0) {
			if c0.im > i64(0) {
				sb.write(' + ')
			} else {
				sb.write(' - ')
			}
		}
	} else {
		if c0.im == i64(0) { return '0' }
		if c0.im < i64(0) {
			sb.write('-')
		}
	}
	mut im := c0.im
	if im < i64(0) { im = -im }
	if im != i64(1) {
		sb.write(re.str())
	}
	sb.write('i')
	return sb.str()
}
