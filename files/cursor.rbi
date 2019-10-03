# typed: strong

module ConsoleGlitter
  module Cursor extend self
    sig { params(distance: Integer).returns(String) }
    def up(distance); end

    sig { params(distance: Integer).returns(String) }
    def down(distance); end

    sig { params(distance: Integer).returns(String) }
    def forward(distance); end
    alias :right :forward

    sig { params(distance: Integer).returns(String) }
    def back(distance); end
    alias :left :back

    sig { params(distance: Integer).returns(String) }
    def nextline(distance); end

    sig { params(distance: Integer).returns(String) }
    def prevline(distance); end
    alias :previousline :prevline

    sig { params(position: Integer).returns(String) }
    def column(position); end

    sig { params(x: Integer, y: Integer).returns(String) }
    def move(x, y); end

    sig { returns(String) }
    def save; end

    sig { returns(String) }
    def restore; end

    sig { returns(String) }
    def hide; end

    sig { returns(String) }
    def show; end
  end
end
