require 'twitter'
require 'vcr_setup'

describe "get_twitter_user" do
  around(:each) do |example|
    VCR.use_cassette("trevmex",
                :record => :new_episodes,
                &example)
  end    

  it "returns the correct screen_name" do
    trevmex = get_twitter_user(8135682)

    trevmex["screen_name"].should == 
      "trevmex"
  end
end
