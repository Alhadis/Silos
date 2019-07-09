import time

fn main() {
	// 获取当前系统时间
	now := time.now()
	// 格式化输出时间(不显示秒)
	println(now.format())
	// 格式化输出时间(显示秒)
	println(now.format_ss())
	// 获取今天是周几（0：周日）
	println(now.day_of_week())
	// 获取当前毫秒数
	println(now.uni)
	// 字符串转换成时间
	t:=time.parse('2019-06-23 13:59:01')
	println(t.format_ss())
	// 获取给定时间和系统当前时间差（如果小于30毫秒则显示now）
	println(now.relative())

	// 休眠1秒
	time.sleep(1)
	println('中文：睡醒了')
	println('泰文：ตื่นขึ้นมา')
	println('日文：ตื目が覚める')
	println('韩文：깨어났다.')
}