require 'twitter'
require 'vcr_setup'

describe "get_twitter_user" do
  before(:each) do
    VCR.insert_cassette("trevmex",
                :record => :new_episodes)
  end    

  it "returns the correct screen_name" do
    trevmex = get_twitter_user(8135682)

    trevmex["screen_name"].should == 
      "trevmex"
  end

  after(:each) do
    VCR.eject_cassette
  end
end
