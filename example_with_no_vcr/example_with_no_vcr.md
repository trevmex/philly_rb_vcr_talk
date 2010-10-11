!SLIDE
# Example time: Twitter API #

    @@@ruby
    require 'rubygems'
    require 'rest-client'
    require 'json'

    def get_twitter_user(id)
      url = "http://api.twitter.com/1/users/s..."
      user = RestClient.get(url)
      JSON.parse(user)
    end

!SLIDE
# The test: #

    @@@ruby
    require 'twitter'
    require 'test/unit'

    class TwitterTest < Test::Unit::TestCase
      def test_get_twitter_user
        trevmex = get_twitter_user(8135682)

        assert trevmex["screen_name"] ==
          "trevmex"
      end
    end

!SLIDE bullets incremental
# Problems with this test #
* <tt>Finished in <b>4.362348</b> seconds.</tt>
* What if the test user is deleted?
* What if the test user changes their name?
* HTTP calls in tests are bad mojo
