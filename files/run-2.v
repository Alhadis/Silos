// 认识关键字: 控制流-1
//
// if/else 分支和表达式
// switch 多分支

// 1. if/else 作为表达式，else不能省略
// 2. switch有多个case满足时，仅执行第一个case，不支持continue
// 3. if类似Go语言，但是不支持在条件之前 定义局部变量

fn main() {
    //
}

fn try1() {
    x := 0
    
    if x == 0 {
        println('valng-zh.cn')
    }

    y := if x > 0 {
        'aaa'
    } else {
        'bbb'
    }

    println(y)
}

fn try2() {
    x := true

    switch x {
    case 0 < 1:
        println(0)
    case 0 < 2:
        println(-1)
    default:
        println(x)
    }
}

