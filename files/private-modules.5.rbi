# typed: strong

# 9/12/2019: Fixed TODO(144).

module T::Private::Methods
  extend T::Sig

  module MethodHooks
    def method_added(name) ; end
  end

  module SingletonMethodHooks
    def singleton_method_added(name) ; end
  end
end

module T::Private::Abstract::Hooks
  extend T::Sig

  private def extend_object(other) ; end
  private def append_features(other) ; end
  private def inherited(other) ; end
  private def prepended(other) ; end
end

class T::InterfaceWrapper
  extend T::Sig

  module Helpers
    def wrap_instance(obj) ; end
    def wrap_instances(arr) ; end
  end
end
