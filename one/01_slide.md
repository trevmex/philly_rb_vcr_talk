!SLIDE center
# Why talk about VCR? #

!SLIDE bullets incremental 
# Because I SUCK at mocks #
* I understand the concept, but it is hard for me
* http://tinyurl.com/mocks_are_hard

!SLIDE bullets incremental
# I wrote a Big Ruby library #
* with no tests...
* What was I thinking?
* Code it fast, test it later.
* I suck

!SLIDE center
# So I wrote a lot of tests fast... #

!SLIDE center
# But I don't understand mocks... #

!SLIDE center
# (so I don't use them...) #

!SLIDE bullets incremental
# Oh no! Lots of HTTP calls == #
* Slooooow tests
* Changing data sets for tests
* Annoying debugging sessions
* Angry Coworkers

!SLIDE center
# The solution... #

!SLIDE center full-page
![VCR][VCRimageref]

[VCRimageref]: VCR.jpg "VCR"

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

!SLIDE
# VCR can help us out, because... #

!SLIDE center
# VCR uses... #

!SLIDE center full-page
![cassettes][cassettesimageref]

[cassettesimageref]: cassettes.jpg "cassettes"

!SLIDE center
# to record HTTP responses! #

!SLIDE bullets incremental
# Two steps: #
* Setup your VCR
* Use a cassette

!SLIDE
# Setup your VCR #
## (in a vcr_setup.rb file) ##
    @@@ruby
    require 'vcr'

    VCR.config do |c|
      c.cassette_library_dir = 'vcr/cassettes'
      c.http_stubbing_library = :fakeweb
    end

!SLIDE
# Use a cassette #
    @@@ruby
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

!SLIDE bullets incremental
# Good things about this test #
* <tt>Finished in <b>0.002326</b> seconds.</tt>
* Still works even if the test user is deleted.
* Still works even if the test user's data changes
* The HTTP call is done <b>once</b>, and stored in a cassette for all future runs.


