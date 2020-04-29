class GoogleService
  attr_reader :google_rating

  def initialize(phone_number)
    @google_rating = 1
    if phone_number == nil
      return @google_rating
    end
    number = phone_number[1..-1]
    api = Faraday.new("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=%2B#{number}&inputtype=phonenumber&fields=rating&key=#{ENV["GOOGLE_API_KEY"]}")
    response = api.get
    google = JSON.parse(response.body, symbolize_names: true)
    if google[:status] == "INVALID_REQUEST"
      rating = 1
    else
      rating = google[:candidates][0][:rating].to_s
    end
    @google_rating = rating
  end
end
