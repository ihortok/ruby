# frozen_string_literal: true

# Elevator engine
class Engine
  attr_accessor :power, :turned_on
  def initialize(power)
    @power = power
    @turned_on = false
  end
end
