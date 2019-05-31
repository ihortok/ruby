load 'elevator/elevator_parts/control_panel.rb'
load 'elevator/computer.rb'
load 'elevator/elevator.rb'

class ElevatorBuilder
  attr_accessor :elevator

  def initialize
    computer = Computer.new
    computer.add_control_panel(ControlPanel.new(20))
    @elevator = Elevator.new(computer)
  end

end
