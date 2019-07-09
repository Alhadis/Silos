struct Dog { }

struct Cat { }

fn (d Dog) speak() string {
	return 'woof'
}

fn (c Cat) speak() string {
	return 'meow'
}

interface Speaker {
	speak() string
}

fn perform(s Speaker) {
	println(s.speak())
}

//鸭子式的方式，实现接口，和golang实现机制一样
//和Go语言类似，结构体通过实现某接口中的方法来"实现"该接口，没有明确的声明
//也没有像Java中的 implements 关键字
fn main() {
	dog := Dog{}
	cat := Cat{}
	perform(dog)// ==> "woof"
	perform(cat)// ==> "meow"
}

/**
woof
meow
*/