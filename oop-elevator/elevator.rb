load 'passenger.rb'
load 'engine_one_kwt.rb'
load 'engine_two_kwt.rb'

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
    @engines = { engine1: EngineOneKwt.new, engine2: EngineTwoKwt.new}
    @routes = {from: [], to: []}
    @total_weight = 0
    @log = []
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
      @log << "Elevator: floar - #{@floar} [add #{counter} passengers]" 
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
      @log << "Elevator: floar - #{@floar} [free #{counter} passengers]"
    end
  end

  def set_direction()
  	if @routes[:from].length > 0
      if @routes[:from][0] > @floar
        @direction = "UP"
      else
        @direction = "DOWN"
      end
    elsif @routes[:to].length > 0
      if @routes[:to][0] > @floar
        @direction = "UP"
      else
        @direction = "DOWN"
      end
    else
      @direction = "JORNEY ENDS"
    end
  end

  def start()
  	@routes[:from].sort!
  	@routes[:to].sort!
  	@engines[:engine1].turn_on()
  	self.set_direction()
  	@log << "Elevator: floar - #{@floar} [1-st engine turned on] direction #{@direction}" if @engines[:engine1].enable == true
    while @routes[:to].length > 0 || @routes[:from].length > 0
      if @routes[:from].include?(@floar) || @routes[:to].include?(@floar)
        @log << "Elevator: floar - #{@floar} [door open]"
        if @routes[:from].include?(@floar)
          self.enter_passenger()
        end
        if @routes[:to].include?(@floar)
          self.free_passenger()
        end
        self.set_direction()
        @log << "Elevator: floar - #{@floar} [door close] #{@total_weight} kg, direction #{@direction}"
      end
      if @total_weight >= 300 && @engines[:engine2].enable != true
        @engines[:engine2].turn_on()
        @log << "Elevator: floar - #{@floar} [2-nd engine turned on]"
      elsif @total_weight < 300 && @engines[:engine2].enable == true
      	@engines[:engine2].turn_off()
        @log << "Elevator: floar - #{@floar} [2-nd engine turned off]"
      end
      if @direction == "UP"
      	@floar += 1
      elsif @direction == "DOWN"
        @floar -= 1
      else
      	@log << "Elevator: floar - #{@floar} [1-nd engine turned off]"
      end
    end
  end
end

elevator = Elevator.new(10)

elevator.add_passenger(3, 12, 85)
elevator.add_passenger(11, 5, 93)
elevator.add_passenger(2, 5, 76)
elevator.add_passenger(4, 9, 90)
elevator.add_passenger(7, 2, 112)
elevator.add_passenger(3, 10, 92)

elevator.start

puts elevator.log
