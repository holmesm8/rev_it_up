RSpec.describe "google places API results" do
#test response from
  it "tests google places api", :vcr do
    conn = Faraday.new()
    conn.get('uri')

    response =
  end

#services test
  it "gives a list of restaurants" do
    query_params = {location: "47.6918452,-122.2226413", distance: 2000}
    result = RestaurantService.new(query_params)

      expect(result.name).to_not be_empty
      expect(result.formatted_address).to_not be_empty
      expect(result.rating).to_not be_empty
      expect(result.ratings_total).to_not be_empty
      expect(result.reviews).to_not be_empty
      expect(result.photos).to_not be_empty
      expect(result.opennow).to_not be_empty
      expect(result.location).to_not be_empty
      expect(result.place_id).to_not be_empty
      expect(result.phone_number).to_not be_empty
      expect(result.price_level).to_not be_empty

  end
end
