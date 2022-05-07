# frozen_string_literal: true

module V1
  class RefreshController < ApplicationController

    def create
      CopyRefresh::Updater.call(data_provider: :airtable)
      render status: :ok
    end
  end
end

