require 'spec_helper'
require './app/services/yelp_services'

RSpec.describe 'Yelp API', type: :request do
  it "can create a service" do
require "pry"; binding.pry
    #latitude, longitude, radius, price parameters
    yelp = YelpService.new(39.7392, -104.9903, 1000, 3)
    phone = yelp.restaurant.phone
    google = GoogleService.new(phone).google_rating

    restaurant_params = {latitude: 39.7392, longitude: -104.9903, radius: 1000, price: 3}

    get "/random_restaurant", :params => restaurant_params


  end
end
