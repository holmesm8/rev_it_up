class YelpService
  attr_reader :restaurant

  def initialize(latitude, longitude, radius, price)
    api = Faraday.new("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}&price=#{price}") do |conn|
      conn.authorization :Bearer, ENV["YELP_API_KEY"]
    end
    response = api.get
    json_response = JSON.parse(response.body, symbolize_names: true)
    @restaurant = Restaurant.new(json_response[:businesses].shuffle.pop)
  end
end
