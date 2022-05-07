# frozen_string_literal: true

module CopyList
  class SinceKeys
    include ServiceObject

    def call
      update_dates.each_with_object([]) do |time, updated_keys|
        break updated_keys if time < since.to_i

        updated_keys.push(*keys_by_dates[time])
      end.uniq
    end

    private

    attr_reader :since

    def keys_by_dates
      @keys_by_dates ||= Rails.cache.read(CacheKeys::UPDATED_KEYS) || {}
    end

    def update_dates
      @update_dates ||= Array.wrap(Rails.cache.read(CacheKeys::DATES_OF_UPDATE))
    end
  end
end

# { "key" => value }
# [date1, date2, date3]
# { date1 => [key1, key2], date2 => [key3] }
