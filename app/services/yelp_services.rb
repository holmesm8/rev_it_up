class YelpService

  def initialize(latitude, longitude)
    api = Faraday.new("https://api.yelp.com/v3/businesses/search?latitude=#{latitude}&longitude=#{longitude}") do |conn|
      conn.authorization :Bearer, ENV["YELP_API_KEY"]
    end
    response = api.get
    json_response = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
