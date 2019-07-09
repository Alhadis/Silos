module complex

pub struct f32c {
	re f32
	im f32
}

fn (c0 f32c) + (c f32c) f32c {
	return f32c{
		c0.re + c.re, 
		c0.im + c.im
	}
}

fn (c0 f32c) - (c f32c) f32c {
	return f32c{
		c0.re - c.re, 
		c0.im - c.im
	}
}

fn (c0 f32c) * (c f32c) f32c {
	return f32c{
		c0.re * c.re - c0.im * c.im,
		c0.re * c.im + c0.im * c.re
	}
}

fn (c0 f32c) / (c f32c) f32c {
	norm := c.re * c.re + c.im * c.im
	assert norm > f32(0)
	return f32c{
		(c0.re * c.re + c0.im * c.im) / norm,
		(c0.im * c.re - c0.re * c.im) / norm
	}
}

fn (c0 mut f32c) conj() {
	c0.im *= f32(-1)
}

pub fn conj(c0 f32c) f32c {
	return f32c{c0.re, -c0.im}
}

fn (c0 f32c) norm() f64 {
	return f64(c0.re) * f64(c0.re) + f64(c0.im) * f64(c0.im)
}

fn (c0 f32c) str() string {
	sb := new_string_builder()
	if c0.re != f32(0) {
		sb.write(c0.re.str())
		if c0.im == f32(0) { return sb.str() }
		if c0.im != f32(0) {
			if c0.im > f32(0) {
				sb.write(' + ')
			} else {
				sb.write(' - ')
			}
		}
	} else {
		if c0.im == f32(0) { return '0' }
		if c0.im < f32(0) {
			sb.write('-')
		}
	}
	mut im := c0.im
	if im < f32(0) { im = -im }
	if im != f32(1) {
		sb.write(re.str())
	}
	sb.write('i')
	return sb.str()
}
