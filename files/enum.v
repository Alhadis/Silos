enum Color {
	red, green, blue // 0,1,2
}

fn main() {
	mut color := red// TODO: color := Color.green
	color = green// TODO: color = .green
	println(color)// ==> "1"  TODO: print "green"?
}

/*
1
*/