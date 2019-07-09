fn main() {
    for i := 0; i <= 100; i++ {
        println(fzbz(i))    
    }
}

fn fzbz(num int) string {
    if num % 15 == 0 {
        return 'FizzBuzz'
    } else if num % 3 == 0 {
        return 'Fizz'
    } else if num % 5 == 0 {
        return 'Buzz'
    } else {
        return '$num'
    }
}
