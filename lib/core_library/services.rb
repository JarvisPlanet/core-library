require_relative 'domain'
require_relative 'services/service'
require_relative 'services/covidindia'


module CoreLibrary
  # Accessors for defined services for easy accessibility in tests
  module Services
    def covidindia
      @covidindia ||= CovidIndia.new
    end

    def rms_service
      @rms_service ||= Service.new
    end
  end
end
