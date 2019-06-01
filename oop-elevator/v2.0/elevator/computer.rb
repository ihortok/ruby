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

  def set_direction
  	if @routes[0].nil?
  	  @direction = 'END OF JORNEY'
  	else
      if @routes[0] > @floor then @direction = 'UP'
      else @direction = 'DOWN'
      end
    end
    @log << "Elevator: floor - #{@floor} [direction #{@direction}]"
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

  def count_passengers

    @passengers_quantity += passengers_to_add[0] unless passengers_to_add[0].nil?
    @passengers_quantity -= passengers_to_free[0] unless passengers_to_free[0].nil?
    @log << "Elevator: floor - #{@floor} [total person #{@passengers_quantity}]"
  end

  def start_engine
  	@engines[:first].turned_on = true
  	if @passengers_quantity > 3 && @engines[:second].turned_on == false
      @engines[:second].turned_on = true
      @log << "Elevator: floor - #{@floor} [turn on second engine]"
    elsif @passengers_quantity <= 3 && @engines[:second].turned_on == true
      @engines[:second].turned_on = false
      @log << "Elevator: floor - #{@floor} [turn off second engine]"
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
  end

  def display_data_update
    @displays[:inner].show_main(@floor, @direction)
    @displays[:inner].show_additional(@speed, @passengers_quantity)
    @displays[:outer].show_main(@floor, @direction)
  end

  def elevator_cycle
  	display_data_update
    door_control('open')
    count_passengers
    door_control('close')
    set_direction
    start_engine

    @passengers_to_add.shift
    @passengers_to_free.shift
  end

  def start
    elevator_cycle
    until @routes.empty?
      @floor = @routes[0]
      @routes.shift
      elevator_cycle
      stop_engine
  	end
  	puts @log
  end

end



     #  set_direction()

  	  # @passengers_quantity += passengers_to_add[0] unless passengers_to_add[0].nil?
     #  @passengers_quantity -= passengers_to_free[0] unless passengers_to_free[0].nil?

   	 #  @log << "Elevator: floor - #{@floor} [door open]"
     #  @log << "Elevator: floor - #{@floor} [total person #{@passengers_quantity}]"
     #  @log << "Elevator: floor - #{@floor} [door closed] direction #{@direction}"
     #  if @passengers_quantity > 3 && @engines[:second].turned_on == false
     #    @engines[:second].turned_on = true
     #    @log << "Elevator: floor - #{@floor} [turn on second engine]"
     #  elsif @passengers_quantity <= 3 && @engines[:second].turned_on == true
     #    @engines[:second].turned_on = false
     #    @log << "Elevator: floor - #{@floor} [turn off second engine]"
     #  end

     #  @displays[:inner].show_main(@floor, @direction)
     #  @displays[:inner].show_additional(@speed, @passengers_quantity)
     #  @displays[:outer].show_main(@floor, @direction)

  	 
  	  # @passengers_to_add.shift
  	  # @passengers_to_free.shift