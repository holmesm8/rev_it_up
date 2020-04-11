require 'spec_helper'
require './app/services/yelp_services'

RSpec.describe 'Yelp API', type: :request do
  it "can create a service" do
    #latitude, longitude, radius, price parameters
    yelp = YelpService.new(39.7392, -104.9903, 1000, 3)
    phone = yelp.restaurant.phone
    google = GoogleService.new(phone).google_rating
  end
end
