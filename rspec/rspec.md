!SLIDE
# You can use it with RSpec, too! #
    @@@ruby
    require 'twitter'
    require 'vcr_setup'

    describe "get_twitter_user" do
      it "returns the correct screen_name" do
        VCR.use_cassette("trevmex",
                    :record => :new_episodes) do
          trevmex = get_twitter_user(8135682)

          trevmex["screen_name"].should == 
            "trevmex"
        end
      end
    end

!SLIDE
# RSpec (better): #
    @@@ruby
    require 'twitter'
    require 'vcr_setup'

    describe "get_twitter_user" do
      before(:each) do
        VCR.insert_cassette("trevmex",
                    :record => :new_episodes)
      end    

      it "returns the correct screen_name" do
        # ...
      end

      after(:each) do
        VCR.eject_cassette
      end
    end
            
!SLIDE
# RSpec 2 (using around): #
    @@@ruby
    require 'twitter'
    require 'vcr_setup'

    describe "get_twitter_user" do
      around(:each) do |example|
        VCR.use_cassette("trevmex",
                    :record => :new_episodes,
                    &example)
      end    

      it "returns the correct screen_name" do
        # ...
      end
    end

!SLIDE bullets incremental
# Works with other test frameworks, too! #
* shoulda
* cucumber
* capybara
* etc.
