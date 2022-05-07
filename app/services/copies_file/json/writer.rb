# frozen_string_literal: true

module CopiesFile
  module Json
    class Writer < Base

      def call
        File.open(file_path, "w+") do |file|
          file.write(data.to_json)
        end
      end

      private

      attr_reader :data
    end
  end
end
