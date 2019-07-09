fn main() {
	println('hello world')
	// 打印数字
	my(10000)
	println(sub(10, 2))
	println('daheige')
}

fn my(x int) {
	println(x)
}

fn sub(x, y int) int {
	return x - y
}

/**
输出结果:
hello world
10000
8
daheige
*/

