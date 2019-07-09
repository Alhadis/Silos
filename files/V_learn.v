//  V 语言初学

// 单行注释

/* 多行注释

  for 条件{}
  for {条件} 
  for i := 0; i < 10; i++ {
	println(i)
  }
   
   V 在C语法的基础上进行了精简,一些结构特别相似.
*/

fn add(x int, y int) int {
	return x + y
}

fn sub(x int, y int) int {
	return x - y
}



fn condition() {
	val := add(77, 33)  //常量定义
	println(val)
	println(sub(100, 50))
	
	mut age := 20  //变量声明
	age = 123 //变量赋值
	if age >130 {
		println('if 语句 $age !')
	}else if age < 120{
		println('else if 语句')	
	}else {
		println('else 语句')	
	}
	str1 := '年龄:'+ age.str()
	println('串连接: $str1 .')

}
fn array_tmp(){
	mut asd := [1,2,3,4,5]  //同类型
	println(asd)
	println(asd[2])  //3
	asd<<[6,7,8]
	println(3 in asd)  //1
	println(asd.len)
	
	for iter1 in asd {
		println('迭代: $iter1')
	}
}
fn map_tmp() {
	mut m := map[string]int{}  //只能用string做key
	m['one'] = 111
	m['two'] = 222
	m['three']=333
	
	println(m['one'])
	println(m['bad_key'])  //0

	for key,value in m {
		println('$key is $value.')
	}
}
fn jiegou() {
	sys:='linux'   //  \panic: tmp.v:69   dot(): cannot find type `t`

	
	switch sys {
		case 'darwin':
			println('macOS.')
		case 'linux':
			println('Linux.')
		default:
			println('Windows 7') 
	}
	
	
	struct list {
		mut:
			len int
		pub:
			value int
	}
	list_A :=list{len:10,value:13}
	println('结构体的len为: $list_A.len')
	
	// fn (对象 类名) 函数名(参数 参数类型)返回值类型{}
	// interface Speaker { speak() string }
	// enum Color { red green blue  } 
	// 对象.free() 释放对象
	
	const (
		PI    = 3.14
		World = '世界'
	) 
}

fn main() {
	println('hello world')
	//condition()
	//array_tmp()
	//map_tmp()
	//jiegou()
	
}