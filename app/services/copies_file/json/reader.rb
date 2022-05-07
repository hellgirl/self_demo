# frozen_string_literal: true

module CopiesFile
  module Json
    class Reader < Base

      def call
        file = File.read(file_path)
        JSON.parse(file)
      end
    end
  end
end
