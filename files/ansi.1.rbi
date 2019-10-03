# typed: strong
module ConsoleGlitter
  module ANSI extend self
    # Cheating a little to allow for runtime definition of the base ansi methods
    sig { params(name: T.any(Symbol, String)).void }
    def define_method(name); end

    sig { params(color: String).returns(String) }
    def hex_color(color); end

    sig { params(color: String).returns(String) }
    def bg_hex_color(color); end

    sig { params(sequence: String).returns(String) }
    def escape(sequence); end

    sig { params(color: String).returns(Integer) }
    def closest(color); end

    sig { returns(String) }
    def reset(); end

    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bold(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def faint(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def underline(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def blink(&block); end

    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def black(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def red(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def green(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def brown(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def blue(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def magenta(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def cyan(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def white(&block); end

    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_black(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_red(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_green(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_brown(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_blue(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_magenta(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_cyan(&block); end
    sig { params(block: T.nilable(T.proc.returns(String))).returns(String) }
    def bg_white(&block); end
  end
end
