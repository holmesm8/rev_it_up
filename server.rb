# server.rb
require 'sinatra'

require './app/poros/restaurant'
require './app/services/yelp_services'
require './app/services/google_services'
# require './app/serializers/restaurant_serializer'
require 'sinatra/json'

# should recieve latitude, longitude, radius, price parameters

get '/' do
  require "pry"; binding.pry
  # make yelp api call
  yelp = YelpService.new(39.7392, -104.9903, 1000, 3)

  #make google apoi call
  google = GoogleService.new(phone).google_rating

  # produce poro
  yelp.restaurant

  # seralize json


end
