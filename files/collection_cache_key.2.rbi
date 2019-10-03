# typed: strong

# 9/13/2019: Fixed TODO(103)

module ActiveRecord
  extend T::Sig

  module CollectionCacheKey
    def collection_cache_key(collection = all, timestamp_column = :updated_at) ; end
  end
end
