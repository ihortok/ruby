load 'elevator_builder.rb'
load 'elevator/elevator_parts/display.rb'


elevator_builder = ElevatorBuilder.new

elevator = elevator_builder.elevator

elevator.add_passengers(2)
elevator.move_to_floor(3)
elevator.add_passengers(3)
elevator.move_to_floor(5)
elevator.free_passengers(3)
elevator.add_passengers(1)
elevator.move_to_floor(2)
elevator.free_passengers(1)
elevator.move_to_floor(12)
elevator.free_passengers(2)

puts elevator.door.condition

elevator.start

puts elevator.door.condition

# display = DisplayInner.new
# display.show_main(3, 'UP')
# puts display.direction
