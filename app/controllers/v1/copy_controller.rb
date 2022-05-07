# frozen_string_literal: true

module V1
  class CopyController < ApplicationController

    def index
      render json: CopyList::Fetcher.call(since: params[:since]), status: :ok
    end

    def show
      render json: { value: CopyValue::Fetcher.call(key: params[:key], params: request.query_parameters) }, status: :ok
    end
  end
end

