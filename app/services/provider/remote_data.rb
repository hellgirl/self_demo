# frozen_string_literal: true

module Provider
  class RemoteData
    include ServiceObject

    PROVIDER_TO_CLASS = {
      airtable: { fetcher: Airtable::Fetcher, formatter: Airtable::DataFormatter }
    }.freeze

    def call
      return if (provider = PROVIDER_TO_CLASS[type]).blank?

      provider[:formatter].call(data: provider[:fetcher].call)
    end

    private

    attr_reader :type
  end
end
