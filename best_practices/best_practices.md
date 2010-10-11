!SLIDE
# Best Practices #

!SLIDE
## Set up your default cassette options to record none: ##
    @@@ruby
    require 'vcr'

    VCR.config do |c|
      c.cassette_library_dir    = 'vcr/cassette'
      c.http_stubbing_library   = :fakeweb
      c.default_cassette_options= 
        { :record => :none }
    end
### When an HTTP request is made, you'll get an error such as: ###
### <tt>Real HTTP connections are disabled.<br />Unregistered request: get http://example.com</tt>

!SLIDE
## Set your cassettes to record new episodes: ##
    @@@ruby
    VCR.use_cassette("trevmex",
      :record => :new_episodes) do
      # ...
    end
### Previously recorded HTTP interactions will be replayed.<br />New HTTP interactions will be recorded. ###
