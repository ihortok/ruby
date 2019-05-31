# frozen_string_literal: true

load 'passenger.rb'
load 'engine_one_kwt.rb'
load 'engine_two_kwt.rb'

# the elevator class
class Elevator_
  attr_writer :floor, :passengers, :passengers_inside, :engines, :routes, :direction, :total_weight
  attr_reader :log

  def initialize(floor)
    @floor = floor
    @passengers = []
    @passengers_inside = []
    @engines = { engine1: EngineOneKwt.new, engine2: EngineTwoKwt.new }
    @routes = { from: [], to: [] }
    @total_weight = 0
    @log = []
  end

  def add_passenger(from, to, weight)
    @passengers << Passenger.new(from, to, weight)
    @routes[:from] << from unless @routes[:from].include?(from)
  end

  def enter_passenger
    counter = 0
    passenger_to_remove = []
    @passengers.each do |passenger|
      next unless passenger.from == @floor

      counter += 1
      @passengers_inside << passenger
      @total_weight += passenger.weight
      passenger_to_remove << passenger
      @routes[:to] << passenger.to unless @routes[:to].include?(passenger.to)
    end
    unless counter.zero?
      passenger_to_remove.each { |passenger| @passengers.delete(passenger) }
      @routes[:from].delete(@floor)
      @log << "Elevator: floor - #{@floor} [add #{counter} passengers]"
    end
  end

  def free_passenger
    counter = 0
    passenger_to_remove = []
    @passengers_inside.each do |passenger|
      next unless passenger.to == @floor

      counter += 1
      @total_weight -= passenger.weight
      passenger_to_remove << passenger
    end
    unless counter.zero?
      passenger_to_remove.each { |passenger| @passengers_inside.delete(passenger) }
      @routes[:to].delete(@floor)
      @log << "Elevator: floor - #{@floor} [free #{counter} passengers]"
    end
  end

  def set_direction
    if !@routes[:from].empty?
      if @routes[:from][0] > @floor
        @direction = 'UP'
      else
        @direction = 'DOWN'
      end
    elsif !@routes[:to].empty?
      if @routes[:to][0] > @floor
        @direction = 'UP'
      else
        @direction = 'DOWN'
      end
    else
      @direction = 'JORNEY ENDS'
    end
  end

  def start
    @routes[:from].sort!
    @routes[:to].sort!
    @engines[:engine1].turn_on
    set_direction
    @log << "Elevator: floor - #{@floor} [1-st engine turned on] direction #{@direction}" if @engines[:engine1].enable == true
    until @routes[:to].empty? && @routes[:from].empty?
      if @routes[:from].include?(@floor) || @routes[:to].include?(@floor)
        @log << "Elevator: floor - #{@floor} [door open]"
        enter_passenger if @routes[:from].include?(@floor)
        free_passenger if @routes[:to].include?(@floor)
        set_direction
        @log << "Elevator: floor - #{@floor} [door close] #{@total_weight} kg, direction #{@direction}"
      end
      if @total_weight >= 300 && @engines[:engine2].enable != true
        @engines[:engine2].turn_on
        @log << "Elevator: floor - #{@floor} [2-nd engine turned on]"
      elsif @total_weight < 300 && @engines[:engine2].enable == true
        @engines[:engine2].turn_off
        @log << "Elevator: floor - #{@floor} [2-nd engine turned off]"
      end
      if @direction == 'UP'
        @floor += 1
      elsif @direction == 'DOWN'
        @floor -= 1
      else
        @log << "Elevator: floor - #{@floor} [1-nd engine turned off]"
      end
    end
  end
end

elevator = Elevator.new(5)

elevator.add_passenger(2, 7, 85)
elevator.add_passenger(4, 1, 100)
elevator.add_passenger(6, 7, 100)


elevator.start

puts elevator.log
