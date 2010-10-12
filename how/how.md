!SLIDE bullets 
# How it works #
* A cassette is a YAML fixture
* The first run of the test checks to see if the cassette exists
* If it does, it uses it
* If it doesn't, it records a new cassette<br />(i.e. makes the HTTP call)

!SLIDE
# The cassette is plain YAML #

    --- 
    - !ruby/struct:VCR::HTTPInteraction 
      request: !ruby/struct:VCR::Request 
        method: :get
        uri: http://api.twitter.com:80/1/users...
        body: 
        headers: 
          accept: 
          - "*/*; q=0.5, application/xml"
          accept-encoding: 
          - gzip, deflate
    ...

## So you can edit your cassettes by hand if needed ##
