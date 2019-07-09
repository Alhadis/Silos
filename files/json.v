import json

struct User {
	name string
	age  int
}
 
fn main() {
	data := '{"name":"Frodo","age": 25 }'
    println(data)
    user := json.decode(User, data) or {
		eprintln('Failed to decode json')
		return
	}
    
	println(user.name)
	println(user.age)
}
