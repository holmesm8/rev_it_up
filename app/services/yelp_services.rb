class YelpService

  def initialize(latitude, longitude, radius, price)
    api = Faraday.new("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}&price=#{price}") do |conn|
      conn.authorization :Bearer, ENV["YELP_API_KEY"]
    end
    response = api.get
    @json_response = JSON.parse(response.body, symbolize_names: true)
  end

  def random_restaurant
    @json_response[:businesses].shuffle.pop
  end

  def google_api
    phone = random_restaurant[:phone][1..-1]
    api = Faraday.new("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=%2B#{phone}&inputtype=phonenumber&fields=rating&key=#{ENV["GOOGLE_API_KEY"]}")
    response = api.get
    test = JSON.parse(response.body, symbolize_names: true)
    test[:candidates][0][:rating]
  end
end
