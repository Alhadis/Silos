// 认识关键字: 类型
//
// enum - 还不能编译
// struct
// interface
// type

// enum: 不能编译，Color.RED不能工作
// struct: 方法名需要是小写，不能用驼峰式命名
// interface: 如何定义公有方法
// type: 和println如何配合工作？str如何定义

struct Point {
    X int
    Y int
}

pub fn (pt Point) print() int {
    println(pt)
    return 0
}

interface Printer {
    pub:
    print() int
}

type MyString string

fn (s mut MyString) str() string {
    return 'abc'
}

fn main() {
    s := MyString('vlang-zh.cn')
    println((s))
}

enum Color {
    RED
    GREEN 
    BLUE
}
fn try1() {
    mut color := GREEN
    color = BLUE
    println(color)
}