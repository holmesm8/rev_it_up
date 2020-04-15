class Restaurant
  attr_reader :id,
              :name,
              :yelp_rating,
              :price,
              :phone,
              :latitude,
              :longitude,
              :location,
              :categories,
              :url
  attr_accessor :google_rating,
                :avg_rating

  def initialize(restaurant)
    @id = restaurant[:id]
    @name = restaurant[:name]
    @yelp_rating = restaurant[:rating].to_s
    @google_rating = nil
    @avg_rating = nil
    @price = restaurant[:price]
    @phone = restaurant[:phone]
    @latitude = restaurant[:coordinates][:latitude].to_s
    @longitude = restaurant[:coordinates][:longitude].to_s
    @location = restaurant[:location]
    @categories = restaurant[:categories]
    @url = restaurant[:url]
  end

  def average_rating(google_rating)
    return @yelp_rating if google_rating == nil
    (@yelp_rating.to_f + google_rating.to_f) / 2
  end
end
