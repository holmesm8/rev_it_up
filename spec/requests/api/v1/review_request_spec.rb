describe "reviews API" do
  it "sends a single restaurant" do
    
    get '/api/v1/random_restaurant'

    expect(response).to be_successful

    restaurant = JSON.parse(response.body)

    expect(restaurant["name"]).to_not be_empty
    expect(restaurant["formatted_address"]).to_not be_empty
    expect(restaurant["rating"]).to_not be_empty
    expect(restaurant["User Ratings Total"]).to_not be_empty
    expect(restaurant["reviews"]).to_not be_empty
    expect(restaurant["photos"]).to_not be_empty
    expect(restaurant["opennow"]).to_not be_empty
    expect(restaurant["Location"]).to_not be_empty
    expect(restaurant["Place ID"]).to_not be_empty
    expect(restaurant["Website"]).to_not be_empty
    expect(restaurant["Phone Number"]).to_not be_empty
    expect(restaurant["Price Level"]).to_not be_empty
  end
end
