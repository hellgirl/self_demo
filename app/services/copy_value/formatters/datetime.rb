# frozen_string_literal: true

module CopyValue
  module Formatters
    class Datetime < Base

      TIME_FORMAT = "%a %b %d %I:%M:%S%p"

      def call
        Time.at(raw_value.to_i).strftime(TIME_FORMAT)
      end
    end
  end
end
