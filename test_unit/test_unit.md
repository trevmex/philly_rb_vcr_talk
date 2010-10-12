!SLIDE
# VCR can help us out, because it uses... #

!SLIDE full-page
![cassettes][cassettesimageref]

[cassettesimageref]: cassettes.jpg "cassettes"

!SLIDE center
# to record HTTP responses! #

!SLIDE bullets 
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
