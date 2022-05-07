# frozen_string_literal: true

module CopyValue
  module Formatters
    class Base
      include ServiceObject

      private

      attr_reader :raw_value
    end
  end
end
