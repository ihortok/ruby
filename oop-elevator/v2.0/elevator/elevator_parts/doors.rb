class Doors

  attr_accessor :computer

  def open
    @computer.doors_state = 'open'
  end

  def close
    @computer.doors_state = 'closed'
  end

end
