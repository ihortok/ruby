load 'elevator/elevator_parts/control_panel.rb'
load 'elevator/computer.rb'
load 'elevator/elevator.rb'

class ElevatorBuilder
  attr_accessor :elevator

  def initialize
  	cp = ControlPanel.new
    computer = Computer.new
    computer.add_control_panel(cp)
    @elevator = Elevator.new(computer, cp)
  end

end
