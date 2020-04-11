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

  # def random_restaurant
  #   @json_response[:businesses].shuffle.pop
  # end

  # def google_api
  #   phone = random_restaurant[:phone][1..-1]
  #   api = Faraday.new("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=%2B#{phone}&inputtype=phonenumber&fields=rating&key=#{ENV["GOOGLE_API_KEY"]}")
  #   response = api.get
  #   google = JSON.parse(response.body, symbolize_names: true)
  #   google[:candidates][0][:rating]
  # end
end

#methods to call on and get information shortcut

# name
# @json_response[:businesses][0][:name]
# yelp_rating
# @json_response[:businesses][0][:rating]
# price
# @json_response[:businesses][0][:price]
# phone
# @json_response[:businesses][0][:phone]
