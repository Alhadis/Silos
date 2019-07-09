
interface Speaker {
	speak() string
}

fn perform(s Speaker) { 
	println(s.speak())
}

struct Dog {
	a int
	b int
	s Speaker
}
struct Cat {}

fn (d Dog) speak() string { 
	return 'woof'
} 

fn (c Cat) speak() string { 
	return 'meow' 
} 

fn main() {
	dog := Dog{}
	cat := Cat{}

	perform(dog) // ==> "woof"
	perform(cat) // ==> "meow"
}
