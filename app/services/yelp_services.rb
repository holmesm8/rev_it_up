class YelpService
  attr_reader :restaurant

  def initialize(latitude, longitude, radius, price)
    conn = Faraday.new("https://api.yelp.com/v3/businesses/search") do |f|
      f.adapter Faraday.default_adapter
      f.headers["Authorization"] = "Bearer #{ENV["YELP_API_KEY"]}"
      f.params["latitude"] = latitude.to_f
      f.params["longitude"] = longitude.to_f
      f.params["radius"] = radius.to_i
      f.params["price"] = price
    end
    response = conn.get
    json_response = JSON.parse(response.body, symbolize_names: true)
    @restaurant = Restaurant.new(json_response[:businesses].shuffle.pop)
  end
end
