fn  handler(id int) ?bool { 
    if id % 2 == 0 {
        // 不能直接返回 true
        r:=true
        return  r
    }
    return error('User $id not found')
}

fn main() {
    // or 用于捕获error
	r := handler(100) or { 
        println('error')
		return 
	}
	println(r) 
    r1 := handler(101) or { 
        println('error')
		return 
	}
	println(r1) 
}