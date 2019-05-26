load 'passenger.rb'

class Elevator
  attr_accessor :floar
  attr_accessor :passengers
  attr_accessor :engines
  attr_accessor :routes
  attr_accessor :direction
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
    @routes << floar unless @routes.include?(floar)
    @routes.sort!
  end

  def free_passenger()
    @passengers.each_index do |i|
      if @passengers[i].floar == @floar
        @total_weight -= @passengers[i].weight
        @passengers.delete_at(i)
      end
    end
  end

  def set_direction()
    if @routes[0] > @floar
      @direction = 'up'
    else
      @direction = 'down'
    end
  end

  def move()
    while @passengers.length > 0
      if @floar == @routes[0]
        self.free_passenger()
        @routes.shift()
      elsif @floar < @routes[0]
        @direction = 'up' unless @direction == 'up'
        @floar += 1
      elsif @floar > @routes[0]
      	@direction = 'down' unless @direction == 'down'
      	@floar -= 1
      end
    end
  end
end

elevator = Elevator.new(1)

elevator.add_passenger(2, 23)
elevator.add_passenger(4, 13)
elevator.add_passenger(6, 43)
elevator.add_passenger(2, 43)
elevator.add_passenger(3, 43)

elevator.move

puts elevator.floar

#puts elevator.floar
#puts elevator.passengers[0].weight
# puts elevator.passengers.length
# puts elevator.total_weight
# elevator.free_passenger
# puts elevator.passengers.length
# puts elevator.total_weight
