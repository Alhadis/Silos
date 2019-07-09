fn main() {
	p := Point{x: 1, y: 2}
	println(p.x)
	println(p.y)
	pointer := &Point{x: 10, y: 10}
	println(pointer.x)
}

//定义结构体
struct Point {
	x int
	y int
}
