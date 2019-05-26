class Passenger
  attr_accessor :from
  attr_accessor :to
  attr_accessor :weight

  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
  end
end

# module NewPassenger
#   attr_accessor :passengers_list

#   def add_passenger(from, to, weight)
#     @passengers_list << Passenger.new(from, to, weight);
#   end
# end
