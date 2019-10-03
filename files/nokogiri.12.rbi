module Nokogiri::XML::Searchable
  def css: (String) -> NodeSet
end

class Nokogiri::XML::Document
  include Searchable

  attr_reader errors: Array<Nokogiri::XML::SyntaxError>

  def self.parse: (String) -> Document
end

class Nokogiri::XML::Node
  include Searchable

  def []: (Symbol) -> any
end

class Nokogiri::XML::NodeSet
  include Searchable

  def each: { (Node) -> any } -> any
end

class Nokogiri::XML::SyntaxError < StandardError
  attr_reader message: String
end
