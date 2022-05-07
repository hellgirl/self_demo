# frozen_string_literal: true

module CopiesFile
  module Json
    class Base
      include ServiceObject

      FILE_NAME = "copies.json"

      private

      def file_path
        File.join(Rails.root, FILE_NAME)
      end
    end
  end
end
