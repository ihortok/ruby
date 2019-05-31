class Elevator
  attr_accessor :computer, :control_panel

  def initialize (computer, control_panel)
    @control_panel = control_panel
    @computer = computer
  end

  def move_to_floor(floor)
    @control_panel.move_to_floor floor
  end

  def start()
    @computer.start
  end

end
