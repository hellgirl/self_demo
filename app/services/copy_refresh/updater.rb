# frozen_string_literal: true

module CopyRefresh
  class Updater
    include ServiceObject

    def call
      return if (updated_keys = UpdatedKeys.call(api_results: api_results)).blank?

      CopiesFile::Json::Writer.call(data: api_results)
      CachesUpdater.call(updated_keys: updated_keys)
      Rails.cache.write(CacheKeys::ALL_COPIES, CopiesFile::Json::Reader.call)
    end

    private

    attr_reader :data_provider

    def api_results
      @airtable_results ||= Array.wrap(Provider::RemoteData.call(type: data_provider))
    end
  end
end
