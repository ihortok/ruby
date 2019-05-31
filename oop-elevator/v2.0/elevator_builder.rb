load 'elevator/elevator_parts/doors.rb'
load 'elevator/computer.rb'
load 'elevator/elevator.rb'

class ElevatorBuilder
  attr_accessor :computer, :doors, :elevator

  def initialize
    @doors = Doors.new
    @computer = Computer.new
    @computer.add_doors(@doors)
    @elevator = Elevator.new(@computer, @doors)
  end

end
