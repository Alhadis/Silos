fn main() {
	println(sub(add(77, 23), 100))
}

fn add(x, y int) int {
	return x + y
}

fn sub(x, y int) int {
	return x - y
}