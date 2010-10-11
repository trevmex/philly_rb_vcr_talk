!SLIDE
# Which HTTP Stubbing Library to use? #
## FakeWeb or WebMock ##
    @@@ruby
    VCR.config do |c|
      c.http_stubbing_library = :fakeweb 
      # or 
      c.http_stubbing_library = :webmock
    end

!SLIDE bullets incremental
# FakeWeb is ... #
* About 3 times faster than WebMock
* <b>but</b> you can only use Net::HTTP-based libraries
* like httparty and RestClient

!SLIDE bullets incremental
# WebMock is... #
* slow, but...
* you can use other HTTP libraries:
* libcurl-based: Patron, Curb (coming soon)
* libwww-perl-based: HTTPClient
* EventMachine-based: em-http-request
* as well as all Net::HTTP-based libraries

!SLIDE
# Regardless of which you choose, all you need to do to set it up is: #
    @@@ruby
    VCR.config do |c|
      c.http_stubbing_library = :fakeweb 
      # or 
      c.http_stubbing_library = :webmock
    end
## No need to set up fakeweb or webmock,<br />VCR takes care of that for you. ##
