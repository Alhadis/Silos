fn main() {
	nums := [1, 2, 3, 4, 5, 7]
	println(nums)
	println(nums[1])// ==> "2"
	mut names := ['John', 'daheige', 'vlang']// 定义数组采用mut作为变量类型前缀
	// 往数组中末尾追加元素
	names << 'Peter'
	names << 'Sam'
	// names << 10  <-- This will not compile. `names` is an array of strings.
	println(names.len)// ==> 5
	println(names.contains('Alex'))// ==> "false"
	// We can also preallocate a certain amount of elements.
	nr_ids := 50
        
    //定义一个数组，50个元素，全部都是0
	mut ids := [0; nr_ids]// This creates an array with 50 zeroes
	println(ids)
	println('daheige' in names)
}

/**
输出结果：
[1, 2, 3, 4, 5, 7]
2
5
false
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
*/
