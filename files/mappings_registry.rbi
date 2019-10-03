# typed: strong

module EntityMapper
  module ActiveRecord
    class MappingsRegistry
      sig { params(active_record_class: Class, map: Mapping::Model).void }
      def register(active_record_class, map)
      end

      sig { params(active_record_object: ::ActiveRecord::Base, context: T.nilable(Context), block: T.nilable(T.proc.params(arg0: T.untyped).void)).returns(T.untyped) }
      def read(active_record_object, context: nil, &block)
      end

      sig { params(entity: T.untyped, context: T.nilable(Context), block: T.nilable(T.proc.params(arg0: ::ActiveRecord::Base).void)).returns(::ActiveRecord::Base) }
      def create(entity, context: nil, &block)
      end
    end
  end
end
