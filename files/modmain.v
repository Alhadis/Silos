
module main

import fetchbaidu

import json

struct User {
    name string
    age int
}
fn main() {
    s := '{"age": 10, "name": "dalongdemo"}'
    u := json.decode(User, s) or {
		exit(1) 
		return
	}
    printuserinfo(u)
    fetchbaidu.fetchindexpage()
}

fn printuserinfo(u User) {
    println(u.name)
} 