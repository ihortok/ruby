# frozen_string_literal: true

# Evelator computer
class Computer
  attr_accessor :floor, :engines, :door, :control_panel, :passengers_to_add, :passengers_to_free, :direction, :routes, :log, :speed

  def initialize()
    @floor = 1
    @routes = []
    @passengers_to_add = []
    @passengers_to_free = []
    @passengers_quantity = 0
    @didection = 'UP'
    @log = []
    @speed = 35
    @engines = {}
    @displays = {}
  end

  def add_engine(key, engine)
    @engines[key] = engine
  end

  def add_display(key, display)
    @displays[key] = display
  end

  def add_door(door)
    @door = door
  end

  def add_control_panel(control_panel)
    @control_panel = control_panel
    control_panel.computer = self
  end

  def add_passengers(quantity)
    passengers_to_add << quantity
  end

  def free_passengers(quantity)
    passengers_to_free << quantity
  end

  def check_passengers
    @passengers_to_add << 0 if @passengers_to_add.length < @routes.length
    @passengers_to_free << 0 if @passengers_to_free.length < @routes.length
  end

  def start
    elevator_cycle
    until @routes.empty?
      @routes.shift
      elevator_cycle
    end
  end

  private

  def set_direction
    if @routes[0].nil?
      @direction = 'END OF JORNEY'
    else
      if @routes[0] > @floor then @direction = 'UP'
      else @direction = 'DOWN'
      end
    end
    @log << "Elevator: floor - #{@floor} [direction #{@direction}]"
    @displays[:inner].show(@floor, 'direction', @direction)
    @displays[:outer].show(@floor, 'direction', @direction)
  end

  def count_passengers
    @passengers_quantity += passengers_to_add[0] unless passengers_to_add[0].nil?
    @passengers_quantity -= passengers_to_free[0] unless passengers_to_free[0].nil?
    @log << "Elevator: floor - #{@floor} [total passengers #{@passengers_quantity}]"
    @displays[:inner].show_details(@floor, 'passengers', @passengers_quantity)
  end

  def start_engine
    @engines[:first].turned_on = true
    if @passengers_quantity > 3 && @engines[:second].turned_on == false
      @engines[:second].turned_on = true
      @log << "Elevator: floor - #{@floor} [turn on second engine]"
      @displays[:inner].show_details(@floor, 'second_engine_on')
    elsif @passengers_quantity <= 3 && @engines[:second].turned_on == true
      @engines[:second].turned_on = false
      @log << "Elevator: floor - #{@floor} [turn off second engine]"
      @displays[:inner].show_details(@floor, 'second_engine_off')
    end
  end

  def stop_engine
    @engines[:first].turned_on = false
    @engines[:second].turned_on = false
  end

  def door_control(action)
    @door.condition = 'closed' if action == 'close'
    @door.condition = 'open' if action == 'open'
    @log << "Elevator: floor - #{@floor} [door #{@door.condition}]"
    @displays[:inner].show(@floor, 'door', @door.condition)
    @displays[:outer].show(@floor, 'door', @door.condition)
  end

  def elevator_cycle
    door_control('open')
    count_passengers
    door_control('close')
    set_direction
    start_engine
    @floor = @routes[0]
    stop_engine
    @passengers_to_add.shift
    @passengers_to_free.shift
  end

end
