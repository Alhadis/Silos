// 认识关键字: 控制流-2
//
// for/in 循环
// continue/break 循环继续和跳出

fn main() {
    // 1～30，如果是3的倍数，打印vlang
    // 如果是5的倍数，打印 vlang-zh
    // 如果是3和5的倍数，打印 V语言中文网

    mut i := 0
    for {
        i = i+1

        if i%3 == 0 && i%5 == 0 {
            println('${i}: V语言中文网')
            continue
        }

        if i%3 == 0 {
            println('${i}: vlang')
        }
        if i%5 == 0 {
            println('${i}: vlang-zh')
        }

        if i >= 30 {
            break
        }
    }
}

fn try2() {
    x := [1, 2, 3, 5]
    for i, v in x {
        println('${i}: ${v}')
    }
}

fn try1() {
    mut sum := 0
    for i := 1; i <= 100; i++ {
        sum += i
    }
    println(sum)
}
