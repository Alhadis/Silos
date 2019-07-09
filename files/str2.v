fn main() {
	name := 'Bob'
	println('Hello, $name!') //这里的$name表示字符串插入
	age := 123
	println('age = ' + age.str()) //这里age是一个int类型，必须采用str()转换
}

/**
输出结果:
Hello, Bob!
age = 123
*/