%w(sinatra json builder).each  { |lib| require lib}

# Define Constants
  DirectoryFile = "./public/directory.json"

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
  begin
    @file = JSON.parse(File.read(DirectoryFile))
    "All Systems Go!"
  rescue Exception => e
    raise "Directory File Not Found!"
  end
  
  
end

get '/' do 
  raise(Sinatra::NotFound)  if params.empty? 
end

get '/:ext' do 
  status 200
  content_type :json
  @ext = params[:ext].to_s
  @file = JSON.parse(File.read(DirectoryFile), :symbolize_names => true)[:extensions].find { |e| e[:dn] == @ext }
  if @file == nil 
   status 500 
   body "Extension does not exist."
  else
    "#{@file.to_json}"
  end
end

get '/:ext/xml' do 
  status 200
  content_type :xml
  @ext = params[:ext].to_s
  @file = JSON.parse(File.read(DirectoryFile), :symbolize_names => true)[:extensions].find { |e| e[:dn] == @ext }
  if @file == nil 
   status 500 
   body "Extension does not exist."
  else
    "#{@file.to_xml}"
  end
end

