struct User {
	id int
}

// 多个User
struct Repo {
	users []User
}

// 创建一个Repo实例
fn new_repo() Repo {
	user := User{id: 10}
	return Repo {
		users: [user]
	}
}

// 通过id查询User
fn (r Repo) find_user_by_id(id int) User? {
	for user in r.users {
		if user.id == id {
			// V automatically wraps this into an option type
			return user
		}
	}
	return error('User $id not found')
}

fn main() {
	repo := new_repo()
	user := repo.find_user_by_id(10) or {// Option types must be handled by `or` blocks
	    return// `or` block must end with `return`, `break`, or `continue`
    }

    println(user.id) // ==> "10"
}