# frozen_string_literal: true

# LESSON 3
# task 1
# repeap an array element (number) as much time as this number is

def num_repeater(array = [])
  return 'incorrect array' unless array.is_a? Array

  array_with_repeated_num = []
  array.each do |e|
    unless e.is_a? Integer
      array_with_repeated_num << e
      next
    end
    (1..e).each { array_with_repeated_num << e }
  end
  array_with_repeated_num
end

puts num_repeater([1, 2, 'smth', 3, 4, 5])
