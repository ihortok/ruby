load 'elevator/elevator_parts/doors.rb'
load 'elevator/computer.rb'

class ElevatorBuilder
  attr_accessor :computer, :doors

  def initialize
    @doors = Doors.new
    @computer = Computer.new
    @computer.add_doors(@doors)
  end

end
