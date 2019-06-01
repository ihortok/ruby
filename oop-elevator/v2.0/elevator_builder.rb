load 'elevator/elevator_parts/control_panel.rb'
load 'elevator/elevator_parts/engine.rb'

load 'elevator/computer.rb'
load 'elevator/elevator.rb'

class ElevatorBuilder
  attr_accessor :elevator

  def initialize
  	cp = ControlPanel.new(20)
  	engine_1kwt = Engine.new('1 kwt')
  	engine_2kwt = Engine.new('2 kwt')
    computer = Computer.new
    computer.add_control_panel(cp)
    computer.add_engine(1, engine_1kwt)
    computer.add_engine(2, engine_2kwt)
    @elevator = Elevator.new(computer, cp)
  end

end
