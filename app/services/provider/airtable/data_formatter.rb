# frozen_string_literal: true

module Provider
  module Airtable
    class DataFormatter
      include ServiceObject

      def call
        data.each_with_object({}) do |copies, copies_hash|
          fields = copies["fields"]
          copies_hash[fields["Key"]] = fields["Copy"]
        end
      end

      private

      attr_reader :data
    end
  end
end
