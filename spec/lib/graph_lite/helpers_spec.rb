require 'spec_helper'

describe GraphLite::Helpers do
  describe "post" do
    it "should post a valid facebook address"
  end
  
  describe "get" do
    it "should get a valid facebook address"
  end
  
  describe "url" do
    it "should raise an error if it doesn't start with '/'" do
      expect { GraphLite::Helpers.url('test') }.to raise_error
    end
      
    it "should convert params to url format" do
      url = GraphLite::Helpers.url('/test', {:key1 => 'value 1',
                                             :key2 => 'value 2'})
      url.should match /https:\/\/graph.facebook.com\/test?\S+=\S+&\S+=\S+/
    end
  end
end