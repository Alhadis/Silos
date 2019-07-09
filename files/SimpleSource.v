fn main() {

    fn internal_function() {
      val variable = "This is called from the internal function"

      println(variable)
    }

  val inferred = "This is an inferred variable"
  val explicit : String = "This is an explicitly named variable"

  # Call the second function
  internal_function()

  # Call to external function
  external_function()

  println(inferred)
  println("This is printing a literal")
  println(explicit)
}

fn external_function() {
   println("hello from an external function")
}
