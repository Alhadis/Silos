class Person
  @name: String
  @contacts: Array<Email | Phone>

  def initialize: (name: String) -> any
  def name: -> String
  def contacts: -> Array<Email | Phone>
  def guess_country: -> (String | nil)
end
