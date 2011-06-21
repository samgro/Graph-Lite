require 'spec_helper'

describe GraphLite::App do
  before :all do
    @app = GraphLite::App.new(:app_id => ENV['FB_APP_ID'],
                              :app_secret => ENV['FB_APP_SECRET'])
    GraphLite::API.init(@app.access_token)
  end
  
  describe "initialization" do
    
    it "should raise an error if params app_id not set" do
      expect { GraphLite::App.new(:app_secret => ENV['FB_APP_SECRET']) }.to raise_error
    end
    
    it "should raise an error if params app_secret not set" do
      expect { GraphLite::App.new(:app_id => ENV['FB_APP_ID']) }.to raise_error
    end
    
    it "should get valid app access token from FB" do
      uri = URI.encode(
        "https://graph.facebook.com/#{@app.app_id}/insights?access_token=#{@app.access_token}")
      response = Typhoeus::Request.get(uri,
        :disable_ssl_peer_verification => true)
      response.should be_success
    end
    
  end
  
  describe "new_test_user" do
    it "should return a valid hash of test user properties" do
      user = @app.new_test_user
      
      user.should_not be_empty
      user['id'].should_not be_nil
      user['login_url'].should_not be_nil
      user['password'].should_not be_nil
      user['email'].should_not be_nil
      user['access_token'].should_not be_nil
            
      # Clean up test users
      GraphLite::API.delete("/#{user['id']}")
    end
  end
  
  describe "delete_test_user" do
    it "should return true if the user was deleted" do
      user = @app.new_test_user
      @app.delete_test_user(user["id"]).should be_true
    end
    
    it "should throw OAuth Exception if id does not exist" do
      result = @app.delete_test_user("notrealid")
      result['error']['type'].should == "OAuthException"
    end
  end
  
  describe "new_friend_connection" do
    it "should create a new friend connection"
  end
end