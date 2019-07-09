fn main() {
    // key必须是字符串
    // 不支持复杂的map面值
    mut m0 := map[string]int {}
    
    // 只能手工初始化
    m0['1'] = 111
    m0['a'] = 111
    m0['2'] = 111

    // 获取值
    println(m0['1'])

    // 不存在时返回零值
    println(m0['1233'])

    // 通过map的entries遍历key
    // 然后通过m[key]获取值
    // key是添加的顺序
    for v in m0.entries {
        println(v.key)
    }

    // 对key进行排序
    m0.sort()

    // 重新遍历
    for v in m0.entries {
        println(v.key)
    }
}