require 'spec_helper'
require './app/services/yelp_services'

RSpec.describe 'Yelp API', type: :request do
  it "can create a service" do
    service = YelpService.new(39.7392, -104.9903)
  end
end
