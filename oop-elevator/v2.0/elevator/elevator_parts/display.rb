# frozen_string_literal: true

# Evelator display module
module Display

  def show(floor, message_key, value)
    print "Elevator: floor - #{floor} "
    case message_key
    when 'door'
      puts "[door #{value}]"
    when 'direction'
      puts "[direction #{value}]"
    end
  end

end

# Evelator inner display
class DisplayInner

  include Display

  def show_details(floor, message_key, value = nil)
    print "Elevator: floor - #{floor} "
    case message_key
    when 'speed'
      puts "[speed: #{value}]"
    when 'passengers'
      puts "[total passengers #{value}]"
    when 'second_engine_on'
      puts "[turn on second engine]"
    when 'second_engine_off'
      puts "[turn off second engine]"
    end
  end
end

# Evelator outer display
class DisplayOuter
  include Display
end
