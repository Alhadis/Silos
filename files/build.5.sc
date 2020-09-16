// build.sc
import mill._, scalalib._

object practice extends ScalaModule{
  def scalaVersion = "2.13.2"
  def ivyDeps = Agg(
    ivy"ch.qos.logback:logback-classic:1.2.3",
    ivy"com.typesafe.scala-logging::scala-logging:3.9.2",
    ivy"commons-codec:commons-codec:1.14",
    ivy"com.github.tototoshi::scala-csv:1.3.6",
    ivy"org.json4s::json4s-native:3.6.9",
    ivy"org.scalaz::scalaz-core:7.3.2",
    ivy"com.h2database:h2:1.4.192"
  )
  object test extends Tests{
    // utest example
    //def ivyDeps = Agg(ivy"com.lihaoyi::utest:0.7.4")
    //def testFrameworks = Seq("utest.runner.Framework")
    // Scalatest example
    def ivyDeps = Agg(
      ivy"org.scalatest::scalatest:3.2.0",
      ivy"org.scalamock::scalamock:5.0.0",
      ivy"org.scalacheck::scalacheck:1.14.1",
      ivy"org.scalatestplus::scalacheck-1-14:3.2.0.0")
    def testFrameworks = Seq("org.scalatest.tools.Framework")
  }
}
