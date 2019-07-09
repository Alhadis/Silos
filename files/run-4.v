// 认识关键字: 控制流-3
//
// goto 函数内长跳
// defer 延迟执行，还没有实现

fn main() {
    x := 0

    if x == 0 {
        goto IF0
    } else {
        goto IF_ELSE
    }
IF_END:

    println('if-end')

    goto END
    println('aaa')

IF0:
    println('if x == 0')
    goto IF_END

IF_ELSE:
    println('if else')
    goto IF_END

END:
    println('end')
}
