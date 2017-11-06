VCR.configure do |c|  
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # your HTTP request service. 
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end  