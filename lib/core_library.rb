require 'httparty'
require 'json'
require 'hashie'

require_relative 'core_library/services'
require_relative 'core_library/domain'
require_relative 'core_library/rake_task'

module CoreLibrary
  include Services

  Hashie.logger.level = Logger.const_get 'ERROR'
end
