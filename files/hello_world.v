/* REF: https://vlang.io/docs */

struct Point {
	x int
	y int 
} 

fn main() {
	areas := ['game', 'web', 'tools', 'science', 'systems', 'GUI', 'mobile'] 
	for area in areas {
		println('Hello, $area developers!')
	}

    p := Point{
    	y: 22 
    	x: 11 
    } 
    println(p.x)

    pointer := &Point{15, 20}
    println(pointer.x)

    str := 'hello'
	mut len := str.len
    len += 1
    println('len: $len')
    println('len: ' + len.str())

    mut age := 20
    println(age)
    age = 21
    println(age)

    // map
    mut m := map[string]int{} // Only maps with string keys are allowed for now
    m['one'] = 1
    println(m['one']) // ==> "1"
    println(m['bad_key']) // ==> "0"

    // if expr
    num := 777
    s := if num % 2 == 0 {
    	'even'
    }
    else {
    	'odd'
    }
    println(s) // ==> "odd"
}
