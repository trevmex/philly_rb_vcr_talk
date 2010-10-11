!SLIDE
# Request Matching #
## In order for VCR to detect an HTTP request, it will match on the URI and HTTP method by default: ##
## <tt>GET http://twit.co.jp/users/1.json</tt> ##

!SLIDE
# But, you can customize this with the <tt>:match_requests_on</tt> option #
    @@@ruby
    VCR.use_cassette("trevmex",
        :match_requests_on => 
          [:uri, :method, :body]) do
      # ...
    end
