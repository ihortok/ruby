class Computer

  attr_accessor :floor, :control_panel, :passengers_to_add, :passengers_to_free, :direction, :routes, :log

  def initialize()
    @floor = 1
    @routes = []
    @passengers_to_add = []
    @passengers_to_free = []
    @passengers_counter = 0
    @didection = 'UP'
    @log = []
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
  end

  def passengers_check
  	@passengers_to_add << 0 if @passengers_to_add.length < @routes.length
  	@passengers_to_free << 0 if @passengers_to_free.length < @routes.length
  end

  def add_passengers(quantity)
    passengers_to_add << quantity
  end

  def free_passengers(quantity)
    passengers_to_free << quantity
  end

  def start
    @passengers_counter += passengers_to_add[0]
    @passengers_counter -= passengers_to_free[0]
    set_direction()

    @log << "Elevator: floor - #{@floor} [door open]"
    @log << "Elevator: floor - #{@floor} [total person #{@passengers_counter}]"
    @log << "Elevator: floor - #{@floor} [door closed] direction #{@direction}"

    @passengers_to_add.shift
    @passengers_to_free.shift

    until @routes.empty?
  	  # puts @routes
  	  # puts '-'
  	  # puts @passengers_to_add
  	  # puts '-'
  	  # puts @passengers_to_free
  	  # puts '---'


  	 

      @floor = @routes[0]
@routes.shift
set_direction()

  	  @passengers_counter += passengers_to_add[0] unless passengers_to_add[0].nil?
      @passengers_counter -= passengers_to_free[0] unless passengers_to_free[0].nil?

   	  @log << "Elevator: floor - #{@floor} [door open]"
      @log << "Elevator: floor - #{@floor} [total person #{@passengers_counter}]"
      @log << "Elevator: floor - #{@floor} [door closed] direction #{@direction}"

  	 
  	  @passengers_to_add.shift
  	  @passengers_to_free.shift
  	end
  	puts @log
  end

end
