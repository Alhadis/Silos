import java.util.Scanner

/**
  * https://www.hackerrank.com/contests/projecteuler/challenges/euler002
  *
  * @author Luiz Henrique Rapatao - rapatao@rapatao.com
  * @since 13/01/2017
  */
object Solution {

  def main(args: Array[String]) {
    val sc = new Scanner(System.in)
    test(sc, 0, sc.nextLong())
  }

  def test(sc: Scanner, t: Long, max: Long) {
    if (t < max) {
      println(fibonacci(sc.nextLong()))
      test(sc, t + 1, max)
    }
  }

  def fibonacci(max: Long): Long = {
    def gen(i: Long, j: Long, s: Long): Long = {
      val n = i + j
      var sum = s
      if (n % 2 == 0)
        sum = sum + n
      if (n > max)
        s
      else
        gen(j, i + j, sum)
    }

    gen(0, 1, 0)
  }

}