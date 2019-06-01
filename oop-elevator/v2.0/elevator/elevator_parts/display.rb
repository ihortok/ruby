# frozen_string_literal: true

# Evelator display module
module Display
  attr_accessor :floor, :direction

  def show_main(floor, direction)
    @floor = floor
    @direction = direction
  end
end

# Evelator inner display
class DisplayInner
  attr_accessor :speed, :total_weight

  include Display

  def show_additional(speed, total_passengers)
    @speed = speed.to_s + 'km/h'
    @total_weight = total_passengers
  end
end

# Evelator outer display
class DisplayOuter
  include Display
end
