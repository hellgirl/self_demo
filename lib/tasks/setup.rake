# frozen_string_literal: true

namespace :setup do
  desc "load data from airtable to json file"
  task :airtable, [] => :environment do
    data = Provider::RemoteData.call(type: :airtable)
    CopiesFile::Json::Writer.call(data: data)
  end
end
