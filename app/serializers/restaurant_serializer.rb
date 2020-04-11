require 'fast_jsonapi'

class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :yelp_rating, :google_rating, :price, :phone
end
