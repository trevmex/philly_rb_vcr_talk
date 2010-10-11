require 'rubygems'
require 'rest-client'
require 'json'

def get_twitter_user(id)
  url = "http://api.twitter.com/1/users/show/#{id}.json"
  user = RestClient.get(url)
  JSON.parse(user)
end
