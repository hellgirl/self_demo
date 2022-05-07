# frozen_string_literal: true

module CopyValue
  module Formatters
    class Simple < Base

      def call
        raw_value
      end
    end
  end
end
