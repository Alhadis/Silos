struct Saber {}
struct Archer {}

fn (s Saber) get_weapon() string { 
	return 'sword'
}

fn (a Archer) get_weapon() string { 
	return 'bow'
}
// interface names temporarily have to end with `er`
interface Servant {
    get_weapon() string
}

fn attack(s Servant) string { 
	weapon := s.get_weapon()
    println('attack with $weapon')
} 

fn main(){
    saber := Saber{}
    archer := Archer{}
    attack(saber)
    attack(archer)
}