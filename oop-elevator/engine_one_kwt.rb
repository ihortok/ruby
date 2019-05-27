# frozen_string_literal: true

# 1 kwt engine
class EngineOneKwt
  attr_accessor :enable
  def turn_on
    @enable = true
  end

  def turn_off
    @enable = false
  end
end
