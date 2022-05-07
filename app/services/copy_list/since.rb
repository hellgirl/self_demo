# frozen_string_literal: true

module CopyList
  class Since
    include ServiceObject

    def call
      All.call.slice(*SinceKeys.call(since: since))
    end

    private

    attr_reader :since
  end
end
