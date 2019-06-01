load 'elevator_builder.rb'
load 'elevator/elevator_parts/display.rb'

elevator_builder = ElevatorBuilder.new

elevator = elevator_builder.elevator

elevator.add_passengers(2)
elevator.move_to_floor(3)
elevator.add_passengers(3)
elevator.move_to_floor(5)
elevator.free_passengers(3)
elevator.add_passengers(13)
elevator.move_to_floor(2)
elevator.free_passengers(10)
elevator.move_to_floor(12)
elevator.free_passengers(5)

elevator.start
