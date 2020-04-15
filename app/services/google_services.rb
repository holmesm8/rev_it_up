class GoogleService
  attr_reader :google_rating

  def initialize(phone_number)
    return nil if phone_number == nil
    number = phone_number[1..-1]
    api = Faraday.new("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=%2B#{number}&inputtype=phonenumber&fields=rating&key=#{ENV["GOOGLE_API_KEY"]}")
    response = api.get
    google = JSON.parse(response.body, symbolize_names: true)
    @google_rating = google[:candidates][0][:rating].to_s
  end
end
