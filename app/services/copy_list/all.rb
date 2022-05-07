# frozen_string_literal: true

module CopyList
  class All
    include ServiceObject

    def call
      Rails.cache.fetch(CacheKeys::ALL_COPIES)
    end
  end
end
