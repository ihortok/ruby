class Computer

  attr_accessor :floor, :control_panel, :routes

  def initialize()
    @floor = 1
    @routes = []
  end

  def add_control_panel(control_panel)
    @control_panel = control_panel
    control_panel.computer = self
  end

  def start
    @routes.sort!
    puts @routes
  end

end
