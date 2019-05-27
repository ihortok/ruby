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
    @routes = {from: [], to: []}
    @log = []
    @total_weight = 0
  end

  def add_passenger(from, to, weight)
    @passengers << Passenger.new(from, to, weight);
    @routes[:from] << from #unless @routes[:from].include?(from)
    #@routes[:to] << to #unless @routes[:to].include?(to)
  end

  def enter_passenger()
    counter = 0
    indexes = []
    @passengers.each_index do |i|
      if @passengers[i].from == @floar
      	counter += 1
       	@passengers_on_board << @passengers[i]
        @total_weight += @passengers[i].weight
        indexes << @passengers[i]
        @routes[:to] << @passengers[i].to
      end
    end
    unless counter.zero?
      indexes.each { |i| @passengers.delete(i) }
      @routes[:from].delete(@floar)
      @log << "#{counter} passengers entered the elevator" 
    end
  end

  def free_passenger()
    counter = 0
    indexes = []
    @passengers_on_board.each_index do |i|
      if @passengers_on_board[i].to == @floar
        counter += 1
        @total_weight -= @passengers_on_board[i].weight
        indexes << @passengers_on_board[i]
      end
    end
    unless counter.zero?
      indexes.each { |i| @passengers_on_board.delete(i) }
      @routes[:to].delete(@floar)
      @log << "#{counter} passengers left the elevator"
    end
  end

  def set_direction()
  	if @routes[:from].length > 0
      if @routes[:from][0] > @floar
        @direction = 'up'
        @floar += 1
      else
        @direction = 'down'
        @floar -= 1
      end
    else
      if @routes[:to][0] > @floar
        @direction = 'up'
        @floar += 1
      else
        @direction = 'down'
        @floar -= 1
      end
    end
  end

  def move()
  	@routes[:from].sort!
  	@routes[:to].sort!
    #while @passengers.length > 0 || @passengers_on_board.length > 0
    while @routes[:to].length > 0 || @routes[:from].length > 0
    #while @routes[:to].length > 0 #|| @passengers_on_board.length > 0
      @log << @routes[:to].join(', ')
      @log << "elevator is at the #{floar}-st floar"
      # @passengers_on_board.each { |e| @log << e.to }
      if @routes[:from].include?(@floar) || @routes[:to].include?(@floar)
        self.free_passenger()
        self.enter_passenger()
        if @direction == 'up'
          @floar += 1
        else
          @floar -= 1
        end
      else
        self.set_direction()
      end
      @log << "elevator goes #{direction}"
    end
  end
end

elevator = Elevator.new(7)

elevator.add_passenger(9, 5, 23)
elevator.add_passenger(11, 5, 23)
elevator.add_passenger(2, 5, 23)
elevator.add_passenger(4, 9, 13)
elevator.add_passenger(4, 9, 13)
elevator.add_passenger(6, 15, 43)
elevator.add_passenger(6, 15, 43)
elevator.add_passenger(2, 19, 43)
elevator.add_passenger(3, 12, 43)

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
