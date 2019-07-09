/// one true syntax:
// `return` is implicit for literals, like `if` expression
// argument and return types are inferred 
alias name = fn a1, a2 {a1 + a2}
alias name = fn a1, a2 {statement; a1 + a2}
// compiles to function template
fn name(a1!, a2!)! {return a1 + a2}

/// rejected other syntax options:

// function literal, argument and return types inferred
alias twice = fn(x){return 2 * x}
alias add = fn(x,y){return x + y}

// these probably not necessary
alias add = fn x,y -> x + y
alias add = fn x,y return x + y

// lambdas imply return
// use `identifier!` to infer arguments
alias twice = fn 2 * x!
alias square = fn x! * x
assert twice(2) == square(2)

alias add = fn x! + y!
assert add(1,2) == 3

