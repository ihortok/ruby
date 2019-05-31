load 'elevator_builder.rb'

elevator_builder = ElevatorBuilder.new

elevator = elevator_builder.elevator

elevator.move_to_floor(3)
elevator.move_to_floor(9)
elevator.move_to_floor(12)
elevator.move_to_floor(1)
elevator.move_to_floor(4)


elevator.start
