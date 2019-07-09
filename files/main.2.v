struct InternalCase {
     numbers int
mut: lists []string
     floatN  f64
     content string
}

fn main() {
	mut ic := &InternalCase {
		numbers: 2019,
		lists: ['saya', 'mencoba', 'vlang'],
		floatN: .5,
		content: 'cutting the edge'
	}
	ic.lists << 'cool'
	println(ic.numbers)
	println(ic.lists)
	println('$ic.content and $ic.floatN')
}

