import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future
import scala.util.{Success,Failure}
// all these examples will run well on the Scala REPL
// and not on the Worksheet for some reason
// it does not like Futures
// :load /path/to/scala_script.sc

val salary = Future{Thread.sleep(2000);4000}
val bonus = 500

val salaryWithBonus = salary.map(value => value + 500)
salaryWithBonus

salaryWithBonus

salaryWithBonus.onComplete(
  {
    case Success(result) => println("result was " + result)
    case Failure(e) => println("Something went wrong "+e)
  }
  )



