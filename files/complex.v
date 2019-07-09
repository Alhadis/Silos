module complex

import math

struct Complex {
mut:
	real f64
	imag f64
}

pub fn new(r, i f64) Complex {
	return Complex{r, i}
}

pub fn zero() Complex {
	return new(f64(0),f64(0))
}

// TODO remove when `==` will support structs
pub fn (z Complex) eq(x Complex) bool {
	return z.real == x.real && z.imag == x.imag
}

pub fn (z Complex) + (x Complex) Complex {
	return new(z.real + x.real, z.imag + x.imag)
}

pub fn (z Complex) - (x Complex) Complex {
	return new(z.real - x.real, z.imag - x.imag)
}

pub fn (z Complex) * (x Complex) Complex {
	a1 := z.real
	b1 := z.imag
	a2 := x.real
	b2 := x.imag
	return new(a1*a2 - b1*b2, a1*b2 + a2*b1)
}

pub fn (z Complex) / (x Complex) Complex {
	a1 := z.real
	b1 := z.imag
	a2 := x.real
	b2 := x.imag
	dp := a2*a2 + b2*b2 // denom part
	rp := (a1 * a2 + b1 * b2) / dp // real part
	ip := (a2 * b1 - a1 * b2) / dp // imag part
	return new(rp, ip)
}

pub fn (z Complex) abs() f64 {
	return math.sqrt(z.real * z.real + z.imag * z.imag)
}

pub fn (z Complex) str() string {
	return 'Complex{${z.real}, ${z.imag}}'
}
