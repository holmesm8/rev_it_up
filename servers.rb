# require './app/poros/restaurant'
# require './app/services/yelp_services'
# require './app/services/google_services'
# require './app/serializers/restaurant_serializer'
require 'sinatra/json'


# should recieve latitude, longitude, radius, price parameters
class Server < Sinatra::Base
  before do
    content_type :json
  end

  get '/search' do
    yelp = YelpService.new(params["latitude"], params["longitude"], params["radius"], params["price"])
    google_rating = GoogleService.new(yelp.restaurant.phone).google_rating
    yelp.restaurant.to_json
    # require "pry"; binding.pry
    # average_rating = restaurant.average_rating(google_rating)
    # response = RestaurantSerializer.new(restaurant)
  end
end
