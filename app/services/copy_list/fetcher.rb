# frozen_string_literal: true

module CopyList
  class Fetcher
    include ServiceObject

    def call
      since.present? ? Since.call(since: since) : All.call
    end

    attr_reader :since
  end
end
