class ControlPanel

  attr_accessor :computer

  def move_to_floor(floor)
    @computer.routes << floor
    #puts @computer.routes
  end

end
