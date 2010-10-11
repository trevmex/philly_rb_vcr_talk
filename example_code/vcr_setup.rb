require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'vcr/cassettes'
  c.http_stubbing_library = :fakeweb
end
