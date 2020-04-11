class Restaurant
  attr_reader :phone

  def initialize(restaurant)
    @name = restaurant[:name]
    @yelp_rating = restaurant[:rating]
    @price = restaurant[:price]
    @phone = restaurant[:phone]
    @latitude = restaurant[:coordinates][:latitude]
    @longitude = restaurant[:coordinates][:longitude]
    @location = restaurant[:location]
    @category = restaurant[:categories]
  end

  def average_rating(google_rating)
    return @yelp_rating if google_rating == nil
    (@yelp_rating + google_rating) / 2
  end
end



# name
# @json_response[:businesses][0][:name]
# yelp_rating
# @json_response[:businesses][0][:rating]
# price
# @json_response[:businesses][0][:price]
# phone
# @json_response[:businesses][0][:phone]
