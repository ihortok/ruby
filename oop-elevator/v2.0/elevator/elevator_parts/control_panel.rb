# frozen_string_literal: true

# Control panel for elevator
class ControlPanel
  attr_accessor :buttons_quantity, :computer

  def initialize(buttons_quantity)
    @buttons_quantity = buttons_quantity
  end

  def move_to_floor(floor)
    raise 'floor should be an integer' unless floor.is_a? Integer

    raise 'given froor doesn\'t exist' if floor < 0 || floor > buttons_quantity

    @computer.routes << floor unless @computer.routes.include?(floor) || @computer.floor == floor
    @computer.check_passengers
  end
end
