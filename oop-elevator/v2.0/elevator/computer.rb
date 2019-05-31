class Computer

  attr_accessor :floor, :control_panel

  def initialize()
    @floor = 1
  end

  def add_control_panel(control_panel)
    @control_panel = control_panel
    control_panel.computer = self
  end

end
