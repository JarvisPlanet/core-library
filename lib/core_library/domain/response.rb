module CoreLibrary
  module Domain
    # A base class to represent a response from COVID API
    class Response
      attr_reader :code, :body, :headers

      def initialize(response)
        @code = response.code
        @body = Hashie::Mash.new(JSON.parse(response.body))
        @headers = response.headers
      end
    end
  end
end
