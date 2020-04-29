ENV['APP_ENV'] = 'test'

require 'spec_helper'

RSpec.describe 'Rev it up api' do
  include Rack::Test::Methods

  def app
    Server
  end

  context 'GET /search' do
    it "returns json response from google and yelp api calls" do
      restaurant_params = {latitude: 39.7392, longitude: -104.9903, radius: 1000, price: "3"}

      get '/search', restaurant_params

      expect(last_response).to be_successful
    end
  end
end
