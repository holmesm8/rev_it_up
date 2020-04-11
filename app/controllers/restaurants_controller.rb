require './app/poros/restaurant'
require './app/services/yelp_services'
require './app/serializers/restaurant_serializer'

class RestaurantController
  get '/random_restaurant' do
    # make yelp api call
    yelp = YelpService.new(39.7392, -104.9903, 1000, 3)

    #make google apoi call
    google = GoogleService.new(phone).google_rating

    # produce poro
    yelp.restaurant

    # seralize json
    

  end
end
