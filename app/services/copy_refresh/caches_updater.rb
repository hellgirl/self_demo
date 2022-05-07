# frozen_string_literal: true

module CopyRefresh
  class CachesUpdater
    include ServiceObject

    def call
      updated_at = Time.new.utc.to_i
      update_dates_array(updated_at)
      update_keys_by_date(updated_at)
    end

    private

    attr_reader :updated_keys

    def update_dates_array(time)
      old_updates = Array.wrap(Rails.cache.read(CacheKeys::DATES_OF_UPDATE))
      Rails.cache.write(CacheKeys::DATES_OF_UPDATE, old_updates.prepend(time))
    end

    def update_keys_by_date(time)
      updated_keys_by_time = Rails.cache.read(CacheKeys::UPDATED_KEYS) || {}
      updated_keys_by_time[time] = updated_keys
      Rails.cache.write(CacheKeys::UPDATED_KEYS, updated_keys_by_time)
    end
  end
end
