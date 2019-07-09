module complex

pub struct f64c {
	re f64
	im f64
}

fn (c0 f64c) + (c f64c) f64c {
	return f64c{
		c0.re + c.re, 
		c0.im + c.im
	}
}

fn (c0 f64c) - (c f64c) f64c {
	return f64c{
		c0.re - c.re, 
		c0.im - c.im
	}
}

fn (c0 f64c) * (c f64c) f64c {
	return f64c{
		c0.re * c.re - c0.im * c.im,
		c0.re * c.im + c0.im * c.re
	}
}

fn (c0 f64c) / (c f64c) f64c {
	norm := c.re * c.re + c.im * c.im
	assert norm > f64(0)
	return f64c{
		(c0.re * c.re + c0.im * c.im) / norm,
		(c0.im * c.re - c0.re * c.im) / norm
	}
}

fn (c0 mut f64c) conj() {
	c0.im *= f64(-1)
}

pub fn conj(c0 f64c) f64c {
	return f64c{c0.re, -c0.im}
}

fn (c0 f64c) norm() f64 {
	return c0.re * c0.re + c0.im * c0.im
}

fn (c0 f64c) str() string {
	sb := new_string_builder()
	if c0.re != f64(0) {
		sb.write(c0.re.str())
		if c0.im == f64(0) { return sb.str() }
		if c0.im != f64(0) {
			if c0.im > f64(0) {
				sb.write(' + ')
			} else {
				sb.write(' - ')
			}
		}
	} else {
		if c0.im == f64(0) { return '0' }
		if c0.im < f64(0) {
			sb.write('-')
		}
	}
	mut im := c0.im
	if im < f64(0) { im = -im }
	if im != f64(1) {
		sb.write(re.str())
	}
	sb.write('i')
	return sb.str()
}
