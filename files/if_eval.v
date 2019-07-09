fn main(){
    num := 777
    s := if num % 2 == 0 {
        'even'
    }
    else {
        'odd'
    }
    println(s) // ==> "odd"
}