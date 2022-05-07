# frozen_string_literal: true
require 'net/http'

module Provider
  module Airtable
    class Fetcher
      include ServiceObject

      def call
        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end
        JSON.parse(response.body)["records"]

      rescue
        # Kind of stub bit, depends on the use case.
        # Basically here we have a set of response codes from airtable that can be handled differently
        []
      end

      private

      def request
        Net::HTTP::Get.new(uri).tap { |request| request['Authorization'] = "Bearer #{ENV["AIRTABLE_KEY"]}" }
      end

      def uri
        @uri ||= URI("https://api.airtable.com/v0/#{ENV["AIRTABLE_BASE"]}/Copies")
      end
    end
  end
end
