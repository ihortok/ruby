class Elevator
  attr_accessor :computer, :doors, :control_panel

  def initialize (computer, doors)
    @computer = computer
    # @engines = engines
    # @control_panel = control_panel
    @doors = doors
  end

  def add_passengers(num)
    @computer.add_passengers(num)
  end

end
