# frozen_string_literal: true

module CopyValue
  class Fetcher
    include ServiceObject

    def call
      raw = CopyList::All.call[key]
      return raw if raw.blank? || params.blank?

      Formatter.call(value: raw, params: params)
    end

    private

    attr_reader :key, :params
  end
end
