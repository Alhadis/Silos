extension Class (ActiveSupport)
  def subclasses: -> Array<Class>
end

extension Module (ActiveSupport)
  def delegate: (*(String | Symbol), to: (String | Symbol), ?prefix: (String | Symbol), ?allow_nil: bool) -> void
end
