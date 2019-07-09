fn main() {
	u := User {
		age: 15,
	}
	println(u.can_register())
	u2 := User {
		age: 90,
	}
	println(u2.can_register())
}

struct User {
	age int
}

//跟golang一样，接受者 方法名称 返回值
fn (u User) can_register() bool {
	return u.age > 16
}

/**
输出结果
false
true
*/