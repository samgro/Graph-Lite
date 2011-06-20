require 'uri'
require 'typhoeus'
require 'json'
require 'graph_lite/helpers'
require 'graph_lite/app'

module GraphLite
  
  class API
    
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
