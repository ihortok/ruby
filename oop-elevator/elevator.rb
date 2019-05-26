load 'passenger.rb'
load 'motors.rb'

class Elevator
  attr_accessor :passengers
  attr_accessor :floar

  def initialize(floar)
    @floar = floar
    @passengers = []
  end

  def add_passenger(weight)
    @passengers << Passenger.new(weight);
  end

end

elevator = Elevator.new(2)

elevator.add_passenger(23)

puts elevator.floar
puts elevator.passengers[0].weight
