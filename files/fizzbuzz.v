fn fizzbuzz(n int) string {
    if n % 15 == 0 {
        return 'FizzBuzz'
    }
    else if n % 3 == 0 {
        return 'Fizz'
    }
    else if n % 5 == 0 {
        return 'Buzz'
    }
    else {
        return n.str()
    }
}

fn main() {
    for i := 1; i < 101; i++ {
        println(fizzbuzz(i))
    }
}
