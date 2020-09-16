object Solution {

  def main(args: Array[String]) {
    val sc = new java.util.Scanner (System.in);
    var s = sc.nextInt();
    var t = sc.nextInt();
    var a = sc.nextInt();
    var b = sc.nextInt();
    var m = sc.nextInt();
    var n = sc.nextInt();
    var apple = new Array[Int](m);
    for(apple_i <- 0 to m-1) {
      apple(apple_i) = sc.nextInt();
    }
    var orange = new Array[Int](n);
    for(orange_i <- 0 to n-1) {
      orange(orange_i) = sc.nextInt();
    }
    val ans_0 = apple count (x => x+a <= t && x+a >= s)
    val ans_1 = orange count (x => x+b <= t && x+b >= s)
    println(ans_0)
    println(ans_1)
  }
}
