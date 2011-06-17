module GraphLite
  class API
    # Access app token
    def self.get_app_access_token
      uri = URI.encode(
        "https://graph.facebook.com/oauth/access_token?" +
        "client_id=#{FB_APP_ID}&client_secret=#{FB_APP_SECRET}&" +
        "grant_type=client_credentials"
      )
      response = Typhoeus::Request.get(uri,
        :disable_ssl_peer_verification => true)
      response.body =~ /^access_token=(\S+)$/
      $1
    end
    
    # Facebook Helper methods
    def self.init(access_token)
      @access_token = access_token
    end
    
    # Return array of Ruby object with results of FQL query 
    def self.fql(query)
      uri = URI.encode(
        "https://api.facebook.com/method/fql.query?query=#{query}&format=JSON&access_token=#{@access_token}")
      response = Typhoeus::Request.get(uri,
        :disable_ssl_peer_verification => true)
      result = ActiveSupport::JSON.decode(response.body)
    end
    
    # Return HTTP response object from Facebook Graph API call
    def self.get(path)
      response = Typhoeus::Request.get(URI.encode(
        "https://graph.facebook.com/#{path}?access_token=#{@access_token}"),
        :disable_ssl_peer_verification => true)
      result = ActiveSupport::JSON.decode(response.body)
    end
    
    def self.post(path, args)
      uri = URI.encode(
        "https://graph.facebook.com/#{path}?access_token=#{@access_token}&#{args}")
      response = Typhoeus::Request.post(uri,
        :disable_ssl_peer_verification => true)
      result = ActiveSupport::JSON.decode(response.body)
    end
    
  end
end
