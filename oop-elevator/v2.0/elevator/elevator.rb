# frozen_string_literal: true

# Elevator container
class Elevator
  attr_accessor :computer, :control_panel, :display, :door

  def initialize (computer, control_panel, display, door)
    @control_panel = control_panel
    @computer = computer
    @display = display
    @door = door
  end

  def add_passengers(quantity)
    @computer.add_passengers(quantity)
  end

  def free_passengers(quantity)
    @computer.free_passengers(quantity)
  end

  def move_to_floor(floor)
    @control_panel.move_to_floor floor
  end

  def start()
    @computer.start
  end
end
