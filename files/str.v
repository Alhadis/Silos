fn main() {
	name := 'Bob'
	println('Hello, $name!')
	println(name.len)
 
	bobby := name + 'by' // + is used to concatenate strings 
	println(bobby) // ==> "Bobby"  
 
	println(bobby.substr(1, 3)) // ==> "ob"  
	// println(bobby[1:3]) // This syntax will most likely replace the substr() method   
} 
