class Computer
  attr_accessor :doors_state, :floar, :doors

  def initialize()
    @doors_state = 'closed'
    @floar = 1
  end

  def add_doors(doors)
    self.doors = doors
    doors.computer = self
  end

  def move_to(floar)
    @doors.open
    @floar = floar
    # @doors.close
  end

end
