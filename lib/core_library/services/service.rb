module CoreLibrary
  # Base service definition for common operations
  class Service
    include HTTParty
    default_timeout 60
    default_options[:verify] = false

    def default_url
      'https://api.covid19india.org'
    end

    def url(path)
      if self.class.base_uri
        "#{self.class.base_uri}/#{path}"
      else
        "#{service_url}/#{path}"
      end
    end

    protected

    def safe_get(url, headers = {}, query = {})
      rescue_connection_errors(url) do
        self.class.get url, headers: headers, query: query
      end
    end

    def safe_post(url, headers = {}, query = {}, data = {})
      data = data.empty? ? nil : data.to_json
      rescue_connection_errors(url) do
        self.class.post url, headers: headers, query: query, body: data
      end
    end

    def safe_put(url, headers = {}, data = {})
      rescue_connection_errors(url) do
        self.class.put url, headers: headers, body: data.to_json
      end
    end

    def safe_delete(url, headers = {})
      rescue_connection_errors(url) do
        self.class.delete url, headers: headers
      end
    end

    def safe_options(url, headers = {})
      rescue_connection_errors(url) do
        self.class.options url, headers: headers
      end
    end

    private

    def rescue_connection_errors(url)
      yield
    rescue Net::OpenTimeout, SocketError => e
      raise "Failed to connect to #{url}: #{e}"
    end
  end
end
