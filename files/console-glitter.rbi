# typed: strong

module ConsoleGlitter
  VERSION = T.let(T.unsafe(nil), String)

  sig { params(sequence: String).returns(String) }
  def escape(sequence); end
end
