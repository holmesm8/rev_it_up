class RestaurantFacade
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def name
    @data[:name]
  end

  def avg_rating
    @data[:avg_rating]
  end

  def address
    @data[:location][:display_address].join(" ")
  end

  def price
    @data[:price]
  end
end
