# typed: strong
# frozen_string_literal: true

module MiniService
  class Base
    extend T::Sig

    class << self
      extend T::Sig

      sig do
        params(required: T::Array[Symbol], optional: T::Hash[Symbol, Object])
          .void
      end
      def arguments(required = [], optional = {})
      end

      sig { params(subclass: Class).void }
      def inherited(subclass)
      end

      sig { returns T::Array[Symbol] }
      attr_reader :required

      sig { returns T::Hash[Symbol, Object] }
      attr_reader :optional

      sig { params(opts: Object).returns(Object) }
      def call(**opts)
      end

      sig { params(opts: T::Hash[Symbol, Object]).returns(T::Boolean) }
      def arguments_missing?(opts)
      end

      sig { params(opts: T::Hash[Symbol, Object]).returns(T::Boolean) }
      def extra_arguments?(opts)
      end
    end

    sig { void }
    def perform
    end
  end
end
