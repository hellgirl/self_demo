# frozen_string_literal: true

module ServiceObject
  extend ActiveSupport::Concern

  class_methods do
    def call(**kwargs)
      new(kwargs).call
    end
  end

  def initialize(**kwargs)
    Array(kwargs).each do |(key, value)|
      instance_variable_set("@#{key}".to_sym, value)
    end
  end
end
