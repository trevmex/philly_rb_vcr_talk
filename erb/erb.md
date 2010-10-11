!SLIDE
# You can even use ERB to pass in variables to your cassettes #

!SLIDE 
# Add some ERB hooks to your cassette: #
    request: !ruby/struct:VCR::Request 
      method: :get
      uri: http://twit.com/users/<%= user.id %>
      body: 
      headers: 
      ...
    response: !ruby/struct:VCR::Response 
      ...
      body: Hello, <%= user.name %>!
         
!SLIDE
# Then call use_cassette with a passed in ERB variable: #
    @@@ruby
    VCR.use_cassette('twit-user',
             :erb => { :user => User.last }) do
      # do something that makes an HTTP request
    end
