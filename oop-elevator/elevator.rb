load 'passenger.rb'

class Elevator
  attr_accessor :floar
  attr_accessor :passengers
  attr_accessor :engines
  attr_accessor :routes
  attr_accessor :total_weight

  def initialize(floar)
    @floar = floar
    @passengers = []
    @engines = []
    @routes = []
    @total_weight = 0
  end

  def add_passenger(floar, weight)
    @passengers << Passenger.new(floar, weight);
    @total_weight += weight
  end

  def free_passenger()
    @passengers.each_index do |i|
      if @passengers[i].floar == @floar
        @total_weight -= @passengers[i].weight
        @passengers.delete_at(i)
      end
    end
  end

end

elevator = Elevator.new(2)

elevator.add_passenger(2, 23)
elevator.add_passenger(4, 13)
elevator.add_passenger(6, 43)
elevator.add_passenger(2, 43)




#puts elevator.floar
#puts elevator.passengers[0].weight
puts elevator.passengers.length
puts elevator.total_weight
elevator.free_passenger
puts elevator.passengers.length
puts elevator.total_weight

