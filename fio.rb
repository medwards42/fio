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
  'These are not the droids you\'re looking for.' +
  '<br>It would appear that you either forgot to add an extension as a parameter,' +
  '<br>or you did not post any data for processing.' +
  '<br><br>In any case you should probably refer to the README located <a href="https://github.com/medwards42/fio" target="_blank"> here</a>.'
end

get '/health_check' do
  status 200
  "All Systems Go!"
end

get '/' do 
  params.empty? ? raise(Sinatra::NotFound) : raise(Sinatra::NotFound)
end

get '/:ext' do 
  status 200
  content_type :json
  @title = "fio - Speed Dial"
  @f = JSON.parse(File.read("./public/directory.json"), :symbolize_names => true)
  @ext = params[:ext].to_s
  @f = @f[:extensions].find { |e| e[:dn] == @ext }
  if @f == nil 
   status 500 
   body "Extension does not exist."
  else
    "#{@f.to_json}"
  end
  

  #erb :extension
end



