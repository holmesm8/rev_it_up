require './app/poros/restaurant'
require './app/services/yelp_services'
require './app/services/google_services'
Bundler.require
# require './app/serializers/restaurant_serializer'
# require 'sinatra'
# require 'sinatra/json'

# should recieve latitude, longitude, radius, price parameters
class Server < Sinatra::Base
  get '/search' do
    # make yelp api call
    yelp = YelpService.new(params["latitude"], params["longitude"], params["radius"], params["price"])
    #make google apoi call
    google = GoogleService.new(yelp.restaurant.phone).google_rating
    # produce poro
    restaurant = yelp.restaurant
    # seralize json
    render json: {data: {id: nil , attributes: {name: restaurant.name,
                                                average_rating: restaurant.average_rating(google),
                                                price: restaurant.price,
                                                phone: restaurant.phone,
                                                latitude: restaurant.latitude,
                                                longitude: restaurant.longitude,
                                                location: restaurant.location,
                                                category: restaurant.categories
                                                }}}
  end
end
