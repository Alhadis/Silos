class Phone
  @country: String
  @number: String

  def initialize: (country: String, number: String) -> any
  def country: -> String
  def number: -> String

  def self.countries: -> Hash<String, String>
end
