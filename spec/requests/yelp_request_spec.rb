ENV['APP_ENV'] = 'test'

require 'spec_helper'

RSpec.describe 'Rev it up api' do
  include Rack::Test::Methods

  def app
    Server
  end

  it "hits this pry" do
    restaurant_params = {latitude: 39.7392, longitude: -104.9903, radius: 1000, price: "3"}

    get '/search', restaurant_params

    expect(last_response).to be_successful
    response = JSON.parse(last_response.body)
  end
end
