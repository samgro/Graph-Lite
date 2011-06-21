require 'spec_helper'

describe GraphLite::API do
  
  before :all do
    @app = GraphLite::App.new(:app_id => ENV['FB_APP_ID'],
                              :app_secret => ENV['FB_APP_SECRET'])
    GraphLite::API.init(@app.access_token)
  end
  
  describe '.post' do
    it "returns array of Ruby object with results of FQL query" do
      # POST request to create a test user
      test_user = GraphLite::API.post("/#{@app.app_id}/accounts/test-users")
      
      # The user should contain data
      test_user.should_not be_empty
      test_user['id'].should_not be_nil
      
      #clean up test users
      GraphLite::API.delete("/#{test_user['id']}")
    end
  end
  
  describe '.get' do
    it "return HTTP response object from Facebook Graph API get request" do
      # Set up a test user
      new_test_user = GraphLite::API.post("/#{@app.app_id}/accounts/test-users")
      
      # GET request to list test-users
      test_users = GraphLite::API.get("/#{@app.app_id}/accounts/test-users")
      
      # Facebook's response should contain the user
      test_users['data'].should_not be_empty
      test_users['data'].select {|test_user| test_user['id'] == new_test_user['id']}.should_not be_nil
      
      #clean up test users
      GraphLite::API.delete("/#{new_test_user['id']}")
    end
  end
  
  describe '.delete' do
    it "return HTTP response object from Facebook Graph API get request" do
      # Set up a test user
      new_test_user = GraphLite::API.post("/#{@app.app_id}/accounts/test-users")
      
      #DELETE request to remove the test user
      GraphLite::API.delete("/#{new_test_user['id']}")
      
      # A request to list test-users should not contain the deleted test user 
      test_users = GraphLite::API.get("/#{@app.app_id}/accounts/test-users")
      test_users['data'].each do |test_user|
        test_user['id'].should_not == new_test_user['id']
      end
            
    end
  end
  
end

