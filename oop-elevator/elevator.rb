load 'passenger.rb'

class Elevator
  attr_accessor :floar
  attr_accessor :passengers
  attr_accessor :passengers_on_board
  attr_accessor :engines
  attr_accessor :routes
  attr_accessor :direction
  attr_accessor :total_weight
  attr_accessor :log

  def initialize(floar)
    @floar = floar
    @passengers = []
    @passengers_on_board = []
    @engines = []
    @routes = {from: [], to: []}
    @log = []
    @total_weight = 0
  end

  def add_passenger(from, to, weight)
    @passengers << Passenger.new(from, to, weight);
    @routes[:from] << from unless @routes[:from].include?(from)
  end

  def enter_passenger()
    counter = 0
    passenger_to_remove = []
    @passengers.each do |passenger|
      if passenger.from == @floar
        counter += 1
        @passengers_on_board << passenger
        @total_weight += passenger.weight
        passenger_to_remove << passenger
        @routes[:to] << passenger.to unless @routes[:to].include?(passenger.to)
      end
    end
    unless counter.zero?
      passenger_to_remove.each { |passenger| @passengers.delete(passenger) }
      @routes[:from].delete(@floar)
      @log << "#{counter} passengers entered the elevator" 
    end
  end

  def free_passenger()
    counter = 0
    passenger_to_remove = []
    @passengers_on_board.each do |passenger|
      if passenger.to == @floar
        counter += 1
        @total_weight -= passenger.weight
        passenger_to_remove << passenger
      end
    end
    unless counter.zero?
      passenger_to_remove.each { |passenger| @passengers_on_board.delete(passenger) }
      @routes[:to].delete(@floar)
      @log << "#{counter} passengers left the elevator"
    end
  end

  def set_direction()
  	if @routes[:from].length > 0
      if @routes[:from][0] > @floar
        @direction = "elevator goes up"
        @floar += 1
      else
        @direction = "elevator goes down"
        @floar -= 1
      end
    elsif @routes[:to].length > 0
      if @routes[:to][0] > @floar
        @direction = "elevator goes up"
        @floar += 1
      else
        @direction = "elevator goes down"
        @floar -= 1
      end
    else
        @direction = "elevator's jorney ends"
    end
  end

  def move()
  	@routes[:from].sort!
  	@routes[:to].sort!
    while @routes[:to].length > 0 || @routes[:from].length > 0
      @log << "elevator is at the #{floar}-st floar"
      if @routes[:from].include?(@floar)
        self.enter_passenger()
        self.set_direction()
      elsif @routes[:to].include?(@floar)
      	self.free_passenger()
        self.set_direction()
      else
        self.set_direction()
      end
      @log << @direction
    end
  end
end

elevator = Elevator.new(1)

elevator.add_passenger(9, 5, 23)
elevator.add_passenger(11, 5, 23)
elevator.add_passenger(2, 5, 23)
elevator.add_passenger(4, 9, 13)
elevator.add_passenger(4, 9, 13)
elevator.add_passenger(6, 15, 43)
elevator.add_passenger(6, 15, 43)
elevator.add_passenger(2, 19, 43)
elevator.add_passenger(3, 12, 43)
elevator.add_passenger(1, 1, 43)


#puts elevator.routes

elevator.move

puts elevator.log

# puts elevator.routes

# puts elevator.floar
# puts elevator.passengers[0].weight
# puts elevator.passengers.length
# puts elevator.total_weight
# elevator.free_passenger
# puts elevator.passengers.length
# puts elevator.total_weight
