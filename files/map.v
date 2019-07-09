fn main() {
	mut m := map[string]int{}
	// Only maps with string keys are allowed for now
	m['one'] = 1
	println(m['one'])// ==> "1"
	println(m['bad_key'])// ==> "0"
	m['a'] = 0
	println(m['a'] == 1)

    //暂时不支持
    /*
    m := {
        'a':1,
        'b':2,
    }
    */

}