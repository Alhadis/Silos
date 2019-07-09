fn main() {
    // 定义数组
    arr := [3, 2, 1, 0]

    // 数组长度
    println('arr.len: $arr.len')

    // 遍历数组
    for v in arr {
        println(v)
    }

    // 遍历数组
    // 带元素下标
    for i, v in arr {
        println('$i: $v')
    }

    // 切片，不得超出范围
    arr1 := arr.slice(1, 3)
    for i, v in arr1 {
        println('arr1: $i: $v')
    }

    // 指定长度
    // `a` 表示单个字母，第一个元素决定数组类型
    // 分号之后是数组长度
    arr2 := [` `; 5]
    for i, v in arr2 {
        println('arr2: $i: $v')
    }
}
