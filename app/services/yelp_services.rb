class YelpService
  attr_reader :restaurant

  def initialize(latitude, longitude, radius, price)
    # latitude = latitude.to_f
    # longitude = longitude.to_f
    # radius = radius.to_i
    # # price = price.to_i
    # api = Faraday.new("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}&price=#{price}") do |conn|
    #   conn.authorization :Bearer, ENV["YELP_API_KEY"]
    # end
    # response = api.get
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
