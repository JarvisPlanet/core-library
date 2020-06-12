module CoreLibrary
  # A wrapper for the CovidIndia service API
  class CovidIndia < Service
    include CoreLibrary::Domain

    attr_reader :service_url
    attr_accessor :api_key, :auth_token

    def initialize(api_key = nil)
      @service_url = ENV['URL'] || default_url
      @api_key = api_key || ENV['API_KEY']
    end

    # def default_headers
    #   { 'X-Api-Key' => api_key }
    # end

    # def state_data(headers: default_headers)
    #   CovidResponse.new(safe_get(programme_url, headers))
    # end

    def state_data
      CovidResponse.new(safe_get(state_wise_url))
    end    

    def travel_data
      CovidResponse.new(safe_get(travel_data))
    end

    private

    def state_wise_url
      url "state_district_wise.json"
    end

    def travel_history_url
      url "travel_history.json"
    end

  end
end
