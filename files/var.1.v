name := 'Rin'
age  := 16

/*
    age = 17
    ↓↓↓
    panic: var.v:3
    `age` is immutable
*/

mut server := 'archer'
server = 'saber'

/*
    route = 'unlimited blade works'
    ↓↓↓
    pass=2 fn=`main`
    panic: var.v:16
    undefined: `route`
*/

route := 'unlimited blade works'
/*
    route := 'unlimited blade works'
    ↓↓↓
    pass=2 fn=`main`
    panic: var.v:16
    undefined: `route`
*/

/*
    a := 10 
    if true {
    	a := 20
    } 
    ↓↓↓
    pass=2 fn=`main`
    panic: var.v:34
    redefinition of `a`
*/


println(name)
println(age)
println(server)