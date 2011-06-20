module GraphLite
  class Helpers
    GRAPH_ROOT_URL = "https://graph.facebook.com"
    
    def self.post
    end
    
    def self.get
    end
    
    def self.url(path, params = {})
      raise "path must start with '/'" if path.split('')[0] != '/'
      url = GRAPH_ROOT_URL + path
      
      # convert params to url format
      unless params.empty?
        url += "?" + URI.encode(params.to_a.map{|p| p.join('=')}.join('&'))
      end
      
      url
    end
  end
end
