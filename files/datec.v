import os
import time

fn main() {

	if os.args.len != 2 {
		println('usage: datec [date]')
		exit(1)
	}

	arg := os.args[1]
	date := if arg.len == 13 {
		// What's happen...
		arg.substr(0, 10)
	} else {
		arg
	}

	time := time.unix(date)
	println(time.format())
}
