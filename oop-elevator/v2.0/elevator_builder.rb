load 'elevator/elevator_parts/control_panel.rb'
load 'elevator/elevator_parts/engine.rb'
load 'elevator/elevator_parts/display.rb'
load 'elevator/elevator_parts/door.rb'
load 'elevator/computer.rb'
load 'elevator/elevator.rb'

# Evelator builder
class ElevatorBuilder
  attr_accessor :elevator

  def initialize
    control_panel = ControlPanel.new(20)
    display_inner = DisplayInner.new
    door = Door.new('metal')
    computer = Computer.new
    computer.add_control_panel(control_panel)
    computer.add_engine(:first, Engine.new('1 kwt'))
    computer.add_engine(:second, Engine.new('2 kwt'))
    computer.add_display(:inner, display_inner)
    computer.add_display(:outer, DisplayOuter.new)
    computer.add_door(door)
    @elevator = Elevator.new(computer, control_panel, display_inner, door)
  end

end
