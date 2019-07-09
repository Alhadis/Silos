struct Character {
	name string
	age int
} 

struct Story {
    character Character
}

rin := Character{
	name: '遠坂凛' 
	age: 16 
}

sakura := &Character{'間桐桜', 16}

println(rin.name)
println(sakura.name)


story := Story{sakura}
println(story.character.age)