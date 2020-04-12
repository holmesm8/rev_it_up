class Restaurant
  attr_reader :name,
              :yelp_rating,
              :price,
              :phone,
              :latitude,
              :longitude,
              :location,
              :categories

  def initialize(restaurant)
    @name = restaurant[:name]
    @yelp_rating = restaurant[:rating]
    @price = restaurant[:price]
    @phone = restaurant[:phone]
    @latitude = restaurant[:coordinates][:latitude]
    @longitude = restaurant[:coordinates][:longitude]
    @location = restaurant[:location]
    @categories = restaurant[:categories]
  end

  def average_rating(google_rating)
    return @yelp_rating if google_rating == nil
    (@yelp_rating + google_rating) / 2
  end
end
