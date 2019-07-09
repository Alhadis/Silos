//V语言中只有一个循环结构for。
fn main() {
	numbers := [1, 2, 3, 4, 5, 6, 7]
	// 遍历数组 
    //for...in循环用于遍历数组的元素。如果需要索引，则可以使用 for index,value in 的形式
	for num in numbers {
		println(num)
	}
	// 遍历 k-v形式
	names := ['Sam', 'Peter']
	for i, name in names {
		println('$i) $name')// Output: 0) Sam
	}
}

/**
1
2
3
4
5
6
7
0) Sam
1) Peter
*/