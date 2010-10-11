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

  def test_get_deleted_twitter_user
    VCR.use_cassette("deleted_trevmex",
                :record => :new_episodes) do
      assert_raise RestClient::ResourceNotFound do
        trevmex = get_twitter_user(8135682)
      end
    end    
  end
end
