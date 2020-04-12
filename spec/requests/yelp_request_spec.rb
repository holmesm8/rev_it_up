ENV['APP_ENV'] = 'test'

require 'spec_helper'
require './app/services/yelp_services'
require './app/services/google_services'
require './server'
require 'rspec'
# require 'test/unit'
require 'rack/test'
require 'pry'


RSpec.describe 'Rev it up api' do
  include Rack::Test::Methods

  def app
    Server
  end

  it "hits this pry" do
    restaurant_params = {latitude: 39.7392, longitude: -104.9903, radius: 1000, price: "3"}

    get '/search', restaurant_params
    # get "/search?latitude=39.7392&longitude=-104&radius=1000&price=3"
    response = JSON.parse(response.body)
    expect(last_response).to be_successful
  end
end

# RSpec.describe "Yelp api", type: :request do
#   it "can create a service" do
#     #latitude, longitude, radius, price parameters
#     # yelp = YelpService.new(39.7392, -104.9903, 1000, 3)
#     # phone = yelp.restaurant.phone
#     # google = GoogleService.new(phone).google_rating
#   end
# end
