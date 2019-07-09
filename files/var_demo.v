/**
使用:=声明和初始化变量。 这是在V语言中声明变量的 唯一方法。这意味着变量始终具有初始值。

变量的类型是从右侧的值推断出来的。要强制使用其他类型，请使用类型转换：表达式 T(v)将值 v转换为类型 T。

与大多数其他语言不同，V语言中只允许在函数中定义变量。 不允许使用全局（模块级别）变量

mut x :=1 
如果需要再次改变变量的值，必须用mut修饰变量
因为字符串是只读的，因此字符串的取子字符串的操作会比较高效：不需要复制，也不需要额外分配内存。

V语言中运算符两边值的类型必须是一样的
*/

fn main() {
	// 打印字符串
	println('daheige')
	// 变量name,age
	name := 'blob'
	age := 20
	large_number := i64(999999999)
	println(name)
	println(age)
	println(large_number)

    x := i64(1)
	println(x)

	mut y :=1 
	println(y)

	y = 12
	println(y)

	a := 10
	if a > 10{
		println(a)
	} else {
		println('a= $a')
	}

	username := 'daheige'
	println(username.len) //字符串长度
	println(username.substr(1,3)) //截取字符串
}
/**
输出结果：
daheige
blob
20
999999999
*/