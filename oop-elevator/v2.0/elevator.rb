load 'elevator_builder.rb'

elevator = ElevatorBuilder.new

elevator.move_to(3)

puts elevator.computer.doors_state
