// 认识关键字
//
// fn 定义或声明函数
// return 从函数返回
// import 导入其它模块

import base64

fn hi(s string) string {
    return '你好: ${s}'
}
fn encode(s string) string {
    return base64.encode(s)
}

fn main() {
    println(encode('valng-zh.cn'))
    println(base64.decode('dmFsbmctemguY24='))
}

