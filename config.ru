# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

Rails.cache.write(CacheKeys::ALL_COPIES, CopiesFile::Json::Reader.call)
run Rails.application
