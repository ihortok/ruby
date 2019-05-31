class Elevator
  attr_accessor :computer

  def initialize (computer)
    @computer = computer
  end

  def move_to_floor(floor)
    @computer.control_panel.move(floor)
  end

  def show
    puts @computer.floor
  end

end
