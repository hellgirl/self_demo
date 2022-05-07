# frozen_string_literal: true

module CopyValue
  class Formatter
    include ServiceObject

    DEFAULT = Formatters::Simple
    FORMATS_MAPPING = {
      "datetime" => Formatters::Datetime
    }.freeze

    def call
      value.gsub(/{[^}]*}/) do |key|
        placeholder, format = key.gsub(/{|}/, "").split(", ")
        next key if params[placeholder].blank?

        (FORMATS_MAPPING[format] || DEFAULT).call(raw_value: params[placeholder])
      end
    end

    private

    attr_reader :value, :params
  end
end
