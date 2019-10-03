class Runners::IO
  attr_reader ios: Array<any>

  def initialize: (*any) -> any
  def write: (*any) -> void
  def flush: (*any) -> void
  def finalize!: () -> void
end

Runners::IO::REQUIRED_METHODS_FOR_IOS: Array<Symbol>
