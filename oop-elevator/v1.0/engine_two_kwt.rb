# frozen_string_literal: true

# 2 kwt engine
class EngineTwoKwt
  attr_accessor :enable
  def turn_on
    @enable = true
  end

  def turn_off
    @enable = false
  end
end
