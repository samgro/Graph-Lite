require 'spec_helper'

describe GraphLite::App do
  before :all do
    @app = GraphLite::App.new(:app_id => ENV['FB_APP_ID'],
                              :app_secret => ENV['FB_APP_SECRET'])
  end
  
  describe "initialization" do
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
      pending "post/get helper"
      user = @app.new_test_user
      user['id'].should_not be_empty
    end
  end
  
  describe "delete_test_user" do
    it "should delete test user"
  end
  
  describe "new_friend_connection" do
    it "should create a new friend connection"
  end
end