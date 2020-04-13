require 'sinatra/json'


# should recieve latitude, longitude, radius, price parameters
class Server < Sinatra::Base
  before do
    content_type :json
  end

  get '/search' do
    yelp = YelpService.new(params["latitude"], params["longitude"], params["radius"], params["price"])
    yelp.restaurant.google_rating = GoogleService.new(yelp.restaurant.phone).google_rating
    yelp.restaurant.avg_rating = yelp.restaurant.average_rating(yelp.restaurant.google_rating).to_s
    yelp.restaurant.to_json
  end
end


# google_rating = GoogleService.new(yelp.restaurant.phone).google_rating
# create a facade for the refactor
