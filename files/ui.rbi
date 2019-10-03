# typed: strict

module ConsoleGlitter
  module UI extend self
    extend ANSI

    include Kernel
    include ANSI

    sig do
      params(question: String,
             options:  T::Hash[Symbol, T.any(String, Regexp, T::Boolean, T::Array[T.any(String, Regexp)])],
             wordlist: T.nilable(T::Array[String]),
             block:    T.nilable(T.proc.params(arg0: String).returns(T::Array[String]))
            ).returns(String)
    end
    def prompt(question, options, wordlist, &block); end

    sig { params(question: String, args: T::Hash[Symbol, T.any(String, Regexp, T::Array[T.any(String, Regexp)])]).returns(T::Boolean) }
    def prompt_yn(question, args); end

    sig do
      params(question: String,
             args:     T::Hash[Symbol, T.any(String, T::Boolean, T::Array[String])],
            ).returns(String)
    end
    def secure_prompt(question, args); end

    sig do
      params(question: String,
             args:     T::Hash[Symbol, T.any(String, T::Boolean, T::Array[String])],
            ).returns(String)
    end
    def prompt_filesystem(question, args); end

    sig { params(message: String, block: T.proc.returns(T::Boolean)).void }
    def spinner(message, &block); end

    sig do
      params(rows: T::Array[T::Hash[String, String]],
             labels: T::Hash[String, String]
            ).returns(String)
    end
    def build_grid(rows, labels); end

    sig do
      params(question: String,
             wordlist: T.nilable(T::Array[String]),
             block:    T.nilable(T.proc.params(arg0: String).returns(T::Array[String]))
            ).returns(String)
    end
    def user_prompt(question, wordlist, &block); end

    sig { params(wordlist: T.nilable(T::Array[String])).returns(T.proc.params(arg0: String).returns(T::Array[String])) }
    def autocomplete_lambda(wordlist); end

    sig { params(valid_answers: T.nilable(T::Enumerable[T.any(String, Regexp, T::Boolean, T::Array[T.any(String, Regexp)])])).returns(T::Array[Regexp]) }
    def regexify_answers(valid_answers); end
  end
end
