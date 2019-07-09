/**
if语句非常简单，和Go等众多语言类似。

但与类C语言不同的是，条件不需要(),但{}必须。
*/
fn main() {
	x := 1
	if x == 2 {
		println('x=2')
	}
	else if x == 1 {
		println('x = $x')
	}
	else {
		println('hello')
	}
}
