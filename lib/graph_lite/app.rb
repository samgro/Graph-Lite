module GraphLite
  class App
    attr_accessor :access_token, :app_id, :app_secret
    
    def initialize(options={})
      #Check for options
      raise "param :app_id must be present." if options[:app_id].nil?
      raise "param :app_secret must be present." if options[:app_secret].nil?
      
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
      
      # Initialize API
      GraphLite::API.init(@access_token)
    end
    
    def new_test_user(options={})
      GraphLite::API.post("/#{@app_id}/accounts/test-users", options)
    end
    
    def delete_test_user(id, options={})
      GraphLite::API.delete("/#{id}")
    end
    
  end
end