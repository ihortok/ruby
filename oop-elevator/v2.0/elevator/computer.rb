class Computer
  attr_accessor :doors_state, :floar, :doors, :weight

  def initialize()
    @floar = 1
    @passengers = 0
  end

  def add_engine(engine)
    @engine = engine
    engine.computer = self
  end

  def add_doors(doors)
    @doors = doors
    doors.computer = self
  end

  def add_control_panel(control_panel)
    @control_panel = control_panel
    control_panel.computer = self
  end

  def move_to(floar)
    @doors.open
    @floar = floar
    # @doors.close
  end

end
