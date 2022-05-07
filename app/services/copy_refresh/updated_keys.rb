# frozen_string_literal: true

module CopyRefresh
  class UpdatedKeys
    include ServiceObject

    def call
      api_results.select do |key, value|
        old_file[key] != value
      end.keys
    end

    private

    attr_reader :api_results

    def old_file
      @file_results ||= CopiesFile::Json::Reader.call
    end
  end
end
