require 'twitter'
require 'test/unit'
require 'vcr_setup'

class TwitterTest < Test::Unit::TestCase
  def test_get_twitter_user
    VCR.use_cassette("trevmex",
                :record => :new_episodes) do
      trevmex = get_twitter_user(8135682)

      assert trevmex["screen_name"] == 
        "trevmex"
    end
  end
end
