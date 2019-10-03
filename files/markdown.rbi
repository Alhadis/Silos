# typed: strong

class Redcarpet::Markdown
  extend T::Sig
  extend T::Generic

  sig { params(value1: MarkdownRender, value2: Hash).returns(String) }
  def new(value1, value2); end

  sig { params(value1: MarkdownRender, value2: Hash).returns(String) }
  def initialize(value1, value2); end
end
