class Temperature
  def (constructor) self.celsius: (Numeric) -> instance
  def (constructor) self.fahrenheit: (Numeric) -> instance

  def self.f2c: (any) -> Numeric
  def self.c2f: (any) -> Numeric

  def initialize: (Numeric) -> any

  def celsius: -> Numeric
  def celsius_label: -> String
  def fahrenheit: -> Numeric
  def fahrenheit_label: -> String
end

extension Class (X)
  def private_class_method: (Symbol) -> any
end