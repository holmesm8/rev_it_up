require 'sinatra/json'

class Server < Sinatra::Base
  before do
    content_type :json
  end

end
