class ControlPanel

  attr_accessor :floors, :computer

  def initialize (floors)
    @floors = floors
  end

  def move(floor)
    if floor.between?(1, @floors)
      @computer.floor = floor
    end
  end

end
