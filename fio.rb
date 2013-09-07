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
  
  @title = "fio - Speed Dial"
  @f = JSON.parse(File.read("./public/directory.json"), :symbolize_names => true)
  "#{@f.to_json}"
  #erb :index
end

get '/:ext' do 
  status 200
  
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



