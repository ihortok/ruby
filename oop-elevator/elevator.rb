class Passenger
  attr_accessor :weight

  def initialize(weight)
    @weight = weight
  end
end


class Elevator
  attr_accessor :passengers

  def add_passenger(weight)
    @passengers = Passenger.new(weight);
  end

end

elevator = Elevator.new

elevator.add_passenger(23)

puts elevator.passengers.weight
