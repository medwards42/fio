%w(sinatra json).each  { |lib| require lib}

#require_relative 'lib/url.rb'

configure :test do
  
end


error do
  content_type :json
  status 500

  e = env['sinatra.error']
  {:status => 500, :message => e.message}.to_json
end

not_found do
  status 404
  'These are not the droids you\'re looking for.'
end

get '/' do 
  status 200
  File.read('/Users/medwards/data.out')
end


