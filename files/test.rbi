module Assertions
  def assert_equal: (any, any, *any) -> void
  def assert_nil: (any, *any) -> void
  def assert_instance_of: (any, any, *any) -> void
end

class ReaderTest
  include Assertions

  def assert_json_object: (any, any) -> void
end

class WriterTest
  include Assertions
end

