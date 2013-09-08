require 'spec_helper'

describe 'App' do

  describe 'GET /health_check ' do
    it 'should respond with \'All Systems Go!\'' do
      get '/health_check' 
      last_response.body.should == 'All Systems Go!'
    end
  end
  
  describe 'Get / ' do
    it 'should return a valid json document' do
      get '/'
      last_response.original_headers["Content-Type"].should == 'application/json;charset=utf-8'
    end
  end

end
