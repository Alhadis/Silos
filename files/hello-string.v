fn main() {
    s := 'a,b,c'
    println(s)

    // 替换子串
    // 不改变原始的i 字符串
    println(s.replace('b', 'B'))
    println(s)

    // 拆分字符串
    ss := s.split(',')
    s2 := ss.join(':')
    println(s2)

    // 去掉首尾的空白字符
    s3 := '  22  '
    println('[${s3.trim_space()}]')

    // 释放字符串？
}