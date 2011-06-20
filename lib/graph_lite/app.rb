module GraphLite
  class App
    attr_accessor :access_token, :app_id, :app_secret
    
    def initialize(options)
      # Save ID and secret
      @app_id = options[:app_id]
      @app_secret = options[:app_secret]
      
      # Get app access token
      uri = URI.encode(
        "https://graph.facebook.com/oauth/access_token?" +
        "client_id=#{@app_id}&client_secret=#{@app_secret}&" +
        "grant_type=client_credentials")
      response = Typhoeus::Request.get(uri,
        :disable_ssl_peer_verification => true)
      response.body =~ /^access_token=(\S+)$/
      @access_token = $1
    end
    
    def new_test_user
      
    end
  end
end