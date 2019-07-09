import time
fn main(){   
    // 异步执行(执行顺序不确定)
    for i := 0; i < 5; i++{
        go execute(i)
    }
    println('end')

    time.sleep(1)
}

fn execute(i i8) {
    println('go..$i')
}
