class Engine
  attr_accessor :enable_kwt1, :enable_kwt2, :weight
  def turn_on()
    @enable_kwt1 = true
    @enable_kwt2 = true if weight > 300
  end

  def turn_off()
    @enable_kwt1 = false
    @enable_kwt2 = false
  end
end
