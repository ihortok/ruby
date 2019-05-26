load 'passenger.rb'

module NewPassenger
  
end

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
    @routes = []
    @log = []
    @total_weight = 0
  end

  def add_passenger(from, to, weight)
    @passengers << Passenger.new(from, to, weight);
    @routes << from #unless @routes.include?(from)
    @routes << to #unless @routes.include?(to)
  end

  def enter_passenger()
    counter = 0
    indexes = []
    @passengers.each_index do |i|
      if @passengers[i].from == @floar
      	counter += 1
       	@passengers_on_board << @passengers[i]
        @total_weight += @passengers[i].weight
        indexes << i
      end
    end
    indexes.each { |i| @passengers.delete_at(i) }
    @log << "#{counter} passengers entered the elevator" unless counter.zero?
  end

  def free_passenger()
  	counter = 0
  	indexes = []
    @passengers_on_board.each_index do |i|
      if @passengers_on_board[i].to == @floar
      	counter += 1
        @total_weight -= @passengers_on_board[i].weight
        indexes << i
      end
    end
    indexes.each { |i| @passengers_on_board.delete_at(i) }
    @log << "#{counter} passengers left the elevator" unless counter.zero?
  end

  def set_direction()
    if @routes[0] > @floar
      @direction = 'up'
    else
      @direction = 'down'
    end
  end

  def move()
    # while @passengers.length > 0 || @passengers_on_board.length > 0
    while @routes.length > 0
      @log << "elevator is at the #{floar}-st floar"
      if @routes.include?(@floar)
        self.free_passenger()
        self.enter_passenger()
        @routes.delete_at(@routes.index(@floar))
        if @direction == 'up'
          @floar += 1
        else
          @floar -= 1
        end
      elsif @floar < @routes[0]
        @direction = 'up' unless @direction == 'up'
        @floar += 1
      elsif @floar > @routes[0]
        @direction = 'down' unless @direction == 'down'
        @floar -= 1
      end
      @log << "elevator goes #{direction}"
      @log << "---"
    end
  end
end

elevator = Elevator.new(7)

elevator.add_passenger(2, 5, 23)
elevator.add_passenger(4, 9, 13)
elevator.add_passenger(4, 9, 13)
elevator.add_passenger(6, 15, 43)
elevator.add_passenger(2, 19, 43)
elevator.add_passenger(3, 12, 43)

puts elevator.routes

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
