import edu.holycross.shot.ohco2._
import edu.holycross.shot.cite._
import org.homermultitext.edmodel._
import java.io.PrintWriter
import java.text.Normalizer

// Load the parallel file corpus.sc to load a corpus
// of texts from files on disk prior to loading this script.

val tokens = TeiReader.fromCorpus(corpus)

// Mapping of Modern Greek to Ancient Greek blocks of Unicode
val greekCpMap = Map (
  // tonos:
  '\u03ac'.toInt -> '\u1f71', // alpha
  '\u03ad'.toInt -> '\u1f73',//epsilon
  '\u03cc'.toInt -> '\u1f79', // omicron
  '\u03cd'.toInt -> '\u1f7b', // upsilon
  '\u03ce'.toInt -> '\u1f7d', // omega
  // elision
  '\u1fbd'.toInt -> '\u0027'

)

// HMT definitions that should be moved into a proper class
val elision = '\u0027'
val fishtail = '\u2051'
val cross = '\u2021'
val backslash = '\\'
val punctCPs = Vector('\u003a', '\u003b', '\u002c' , '\u002e', elision, fishtail, cross, '-')
val quants = Vector(
  '_', // macron
  '^' // breve
)


val floatChars = Vector(
  backslash, // grave
  '+',  // diaeresis
  '/',  // acute
  '_', // macron
  '^' // breve
)

// Vector.range() yields values up to but not including second param, e.g.,
// Vector.range(1,3) == Vector(1,2)
val basicAlphabetCPs = Vector.range('\u0391', '\u03a2') ++   Vector.range('\u03a3', '\u03aa') ++  Vector.range('\u0381', '\u03ca') ++ Vector('\u03ca', '\u03cb')

// omit undefined CPs in the extended Greek range.
val combinedFormCPs =   Vector.range('\u1f00','\u1f16') ++  Vector.range('\u1f18','\u1f1e') ++ Vector.range('\u1f20', '\u1f46') ++ Vector.range('\u1f48', '\u1f4e') ++ Vector.range('\u1f50', '\u1f58') ++ Vector('\u1f59', '\u1f5b', '\u1f5d') ++ Vector.range('\u1f5f', '\u1f7e') ++ Vector.range('\u1f80', '\u1fb5') ++ Vector.range('\u1fb6','\u1fbd') ++ Vector.range('\u1fc2', '\u1fc5') ++ Vector.range('\u1fc6','\u1fcd') ++ Vector.range('\u1fd0', '\u1fd4') ++ Vector.range('\u1fd6', '\u1fdc') ++ Vector.range('\u1fe0','\u1fed') ++ Vector.range('\u1ff2','\u1ff5') ++ Vector.range('\u1ff6','\u1ffd')

val allowedCPs = basicAlphabetCPs ++  punctCPs ++  combinedFormCPs ++ floatChars

// turns a string into a vector of codepoints
def strToCps(s: String, cpVector: Vector[Int] = Vector.empty[Int], idx : Int = 0) : Vector[Int] = {
	if (idx >= s.length) {
		cpVector
	} else {
		val cp = s.codePointAt(idx)
		strToCps(s, cpVector :+ cp, idx + java.lang.Character.charCount(cp))
	}
}


case class StringCount(s: String, count: Int) {
  def cex :  String = {
    s + "#" + count
  }
}

case class StringOccurrence(urn: CtsUrn, s: String)

def stringSeq = tokens.map( tkn => {
    // this step is ok...
    StringOccurrence(tkn.analysis.editionUrn, tkn.analysis.readWithAlternate)
  }
)

// Count number of tokens occurring for each token type
def profileTokens(tokens: Vector[TokenAnalysis]) {
  val tokenTypes = tokens.map(_.analysis.lexicalCategory).distinct
  println("Token types:")
  for (ttype <- tokenTypes) {
    val typeTokens = tokens.filter(_.analysis.lexicalCategory == ttype)
    println("\t" + ttype + ": " + typeTokens.size + " tokens. " + typeTokens.map(_.analysis.readWithAlternate).distinct.size + " distinct tokens.")
  }
}

// Compute histogram of tokens
def tokenHisto(tokens: Vector[TokenAnalysis]): Vector[StringCount] = {
  val strs = tokens.map(_.analysis.readWithAlternate)
  val grouped = strs.groupBy(w => w).toVector
  val counted =  grouped.map{ case (k,v) => StringCount(k,v.size) }
  counted.sortBy(_.count).reverse
}

// Compile index of all tokens to URNs where they occur
def tokenIndex(tokens: Vector[TokenAnalysis]) : Vector[String] = {
  def grouped = stringSeq.groupBy ( occ => occ.s).toVector
  val idx = for (grp <- grouped) yield {
    val str = grp._1
    val occurrences = grp._2.map(_.urn)
    val flatList = for (occurrence <- occurrences) yield {
      str + "#" + occurrence.toString
    }
    flatList
  }
  idx.flatten
}

// Compile list of unique "words" (surface forms of tokens)
def wordList(tokens: Vector[TokenAnalysis]): Vector[String] = {
  tokens.map(_.analysis.readWithAlternate).distinct
}

// Compute sequence of code points from sequence of tokens.
def cpsFromTokens(tokens: Vector[TokenAnalysis]) = {
  val snormal = for (tkn <- tokens) yield {
    val rdgs = tkn.analysis.readings.map(_.reading).mkString
    //get alt reading string
    val alts = if (tkn.hasAlternate) {
      tkn.analysis.alternateReading.get.simpleString
    } else { ""}
    val str = (rdgs + alts).replaceAll("\\s","")
    Normalizer.normalize(str, Normalizer.Form.NFC)
  }
  strToCps(snormal.mkString)
}


// compute histogram of code points, and compose
// a  markdown table of the results.
def cpHistoMD(tokens: Vector[TokenAnalysis]) : String = {
  def cps = cpsFromTokens(tokens)
  val grouped = cps.groupBy(cp => cp).toVector
  val counted =  grouped.map{ case (k,v) => (k,v.size) }
  val histo = counted.sortBy(_._2).reverse
  val md = for ((cp, cnt) <- histo) yield {
    val ok = if (allowedCPs.contains(cp)) { "valid" } else { "**<span style=\"color:red\">invalid</span>**"}
    val cols = List(cp.toHexString, new String(Array(cp), 0,1), cnt, ok)
    "| " + cols.mkString(" | ") + " | "
  }
  val hdr = "| Unicode cp | String | Count | Valid HMT? |\n| :------------- | :------------- |:------------- |:------------- |\n"
  hdr + md.mkString("\n")
}


def hmtConvert(cps: Vector[Int]) : Vector[Int] = {
  cps.map( cp => {
    if (greekCpMap.keySet.contains(cp)) {
      greekCpMap(cp)
    } else {
      cp
    }
  })
}
// Dump an index of all invalid codepoints to file
def badChars(tokens: Vector[TokenAnalysis]) = {
  val citableCps = for (tkn <- tokens) yield {
    val rdgs = tkn.analysis.readings.map(_.reading).mkString
    //get alt reading string
    val alts = if (tkn.hasAlternate) {
      tkn.analysis.alternateReading.get.simpleString
    } else { ""}
    val str = (rdgs + alts).replaceAll("\\s","")
    val cpList = strToCps(Normalizer.normalize(str, Normalizer.Form.NFC))
    (tkn.analysis.editionUrn, hmtConvert(cpList))
  }
  val badList = citableCps.filter { case (u,cpList) =>
    val checkOk =  cpList.map(allowedCPs.contains(_)).distinct
    if ((checkOk.size == 1)  && (checkOk(0))) {
    false } else { true }
  }

  val rept = for (bad <- badList) yield {
    val itemReport = StringBuilder.newBuilder
    val cps = bad._2
    itemReport.append(bad._1.toString + " **" + new String(cps.toArray, 0,cps.size) + "** includes invalid characters: ")
    val badChars = for (cp <- cps) yield {
      if (! allowedCPs.contains(cp)) {
        "<span style=\"color:red\">" + new String(Array(cp), 0,1) + s"</span> (${cp.toHexString})"
      } else {""}
    }
    itemReport.append(badChars.filter(_.nonEmpty).mkString(", "))
    itemReport.toString
  }
  rept
}

def profileCorpus (c: Corpus, fileBase: String, subdir: String = "validation") = {
  println("Citable nodes:  " + c.size)
  val tokens = TeiReader.fromCorpus(c)
  profileTokens(tokens)
  val lexTokens = tokens.filter(_.analysis.lexicalCategory == LexicalToken)
  val words = wordList(lexTokens)
  new PrintWriter(subdir + s"/${fileBase}-wordlist.txt"){ write(words.mkString("\n")); close;}
  val idx = tokenIndex(lexTokens)
  new PrintWriter(subdir + s"/${fileBase}-wordindex.txt"){ write(idx.mkString("\n")); close;}

  val histoCex = tokenHisto(lexTokens).map(_.cex)
  new PrintWriter(subdir +  s"/${fileBase}-wordhisto.cex"){write(histoCex.mkString("\n")); close; }


  val charHisto = cpHistoMD(tokens)
  new PrintWriter(subdir + s"/${fileBase}-codepointhisto.md"){write (charHisto); close;}


  val badCharReport = badChars(tokens)
  new PrintWriter(subdir + s"/${fileBase}-invalidCodepointIndex.md"){write (badCharReport.mkString("\n\n")); close;}

  println("\n\nWrote index of all lexical tokens in file 'wordindex.txt'.")
  println("Wrote list of unique lexical token forms in file 'wordlist.txt'")
  println("Wrote histogram of lexical token forms  in .cex format in file 'wordhisto.cex'")
  println("Wrote histogram of all unicode code points  in markdown format in file 'codepointhisto.md'")
  println("Wrote list of all tokens including invalid code point  in markdown format in file 'invalidCodepointIndex.md'")


  val errs = tokens.filter(_.analysis.errors.nonEmpty).map(err => "\n" + err.analysis.editionUrn.toString + s" has ${err.analysis.errors.size} error(s)\n\t" + err.analysis.errors.mkString("\n\t"))
  println("\n\nWrote index of all lexical tokens in file 'wordindex.txt'.")
  println("Wrote list of unique lexical token forms in file 'wordlist.txt'")

  if (errs.nonEmpty) {
    new PrintWriter(s"${fileBase}-errors.txt"){ write(errs.mkString("\n")); close;}
    println("Wrote list of errors in parsing tokens to file 'errors.txt'")
  } else {
    println("No errors in tokenization.")
  }
}


println("\n\nProfile a corpus of texts:")
println("\n\tprofileCorpus(CORPUS, FILENAME)")
