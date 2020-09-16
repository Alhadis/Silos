object RemoveBlanks {
  // Removes blank lines from text file
  def apply(path: String, compressWhiteSpace: Boolean = false): Seq[String] =
    for {
      line <- scala.io.Source.fromFile(path).getLines.toSeq
      if line.matches("""^\s*$""") == false
      line2 = if (compressWhiteSpace) line.replaceAll("\\s+", " ")
      else line
    } yield line2
}

val path2 = "./removeblanks.sc"
val (compress, path) = if (path2.startsWith("-")) (true, path2.substring(1))
else (false, path2)
val line = RemoveBlanks.apply(path, compress)
println(line)

