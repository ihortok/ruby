load 'elevator_builder.rb'

elevator_builder = ElevatorBuilder.new

elevator = elevator_builder.elevator

elevator.move_to_floor(4)
