# SingleFileTest.v -- Simple tests for making sure basic language stuff works

# Function signature testing:
fn empty_function() { }
fn single_dynamic_argument_function(dynamic_argument) {  }
fn single_static_typed_argument_function(string_argument : string) {  }
fn mixed_argument_function(string_arg : string, int_arg : uint64, dynamic_arg) { }
fn explicit_return_type_function() : uint64 { }
fn generic_function<T, U : string>() { }

# Task signature testing:
task empty_task() { }
task single_dynamic_argument_task(dynamic_argument) {  }
task single_static_typed_argument_task(string_argument: string) {  }
task mixed_argument_task(string_arg: string, int_arg : uint64, dynamic_arg) { }
task explicit_return_type_task() : uint64 { }
task generic_task<T, U : object>() { }

# Inline class tests:
class ParameterlessInlineClass
class EmptyInlineClass()
class ParameterlessDerivedClass : ParameterlessInlineClass
class DynamicParameterInlineClass(dynamicParameter)
class StaticParameterInlineClass(str : string)

# Inline trait tests:
trait EmptyInlineTrait()
trait ParameterlessInlineTrait
trait ParameterlessDerivedTrait : ParameterlessInlineTrait
trait DynamicParameterInlineTrait(dynamicParameter)
trait StaticParameterInlineTrait(str : string)

# Plain Signature Tests
signature test_signature(lhs : string, rhs : object) : String
