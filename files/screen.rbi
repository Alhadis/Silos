# typed: strong

module ConsoleGlitter
  module Screen extend self
    include Kernel

    sig { params(direction: Symbol).returns(String) }
    def clear(direction); end
    alias :clear_to :clear

    sig { returns(String) }
    def clear_to_end; end

    sig { returns(String) }
    def clear_to_beginning; end

    sig { returns(String) }
    def clear_to_both; end
    alias :clear_screen :clear_to_both

    sig { params(direction: Symbol).returns(String) }
    def erase_line(direction); end
    alias :erase_line_to :erase_line

    sig { returns(String) }
    def erase_line_to_end; end

    sig { returns(String) }
    def erase_line_to_beginning; end

    sig { returns(String) }
    def erase_line_to_both; end

    sig { params(distance: Integer).returns(String) }
    def scroll_up(distance); end

    sig { params(distance: Integer).returns(String) }
    def scroll_down(distance = 1); end
  end
end
