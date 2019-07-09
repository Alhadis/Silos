fn main() {
	for i := 0; i < 10; i++ { //在这里i不需要用 mut 声明，因为它在每次循环中都被重新定义并赋值
		println(i)
	}
}
