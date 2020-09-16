import java.util.Scanner

/**
  * https://www.hackerrank.com/contests/projecteuler/challenges/euler003
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
      println(largePrimeFactors(sc.nextLong()))
      test(sc, t + 1, max)
    }
  }

  def largePrimeFactors(n: Long): Long = {
    def calc(i: Long, j: Long): Long = {
      if (i % j == 0) calc(i / j, 2)
      else if (j > math.sqrt(i)) i
      else calc(i, j + 1)
    }
    calc(n, 2L)
  }

//  largePrimeFactors(10L) // 5
//  largePrimeFactors(17L) // 17
//  largePrimeFactors(13195) // 29
//  largePrimeFactors(Int.MaxValue)
//  largePrimeFactors(10000000000000L)

}