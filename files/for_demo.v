fn main() {
	mut num := 0 //声明一个可以变化的变量
	for {
		num++
		if num >= 10 {
			break
		}
	}
	println(num)// ==> "10"
}
