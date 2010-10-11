require 'twitter'
require 'test/unit'

class TwitterTest < Test::Unit::TestCase
  def test_get_twitter_user
    trevmex = get_twitter_user(8135682)

    assert trevmex["screen_name"]=="trevmex"
  end
end
