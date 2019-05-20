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
puts num_repeater(1324)

# task 2
# find 3 smallest, 3 middle and 3 greatest of an array of numbers

def find_extreme_values(array = [])
  return 'array should include only integers' unless array.all?(Numeric)

  return 'array length should be more or equel to 9' if array.length < 9

  array_filtered = array.sort!.uniq!
  arraay_middle_el = (array_filtered.length / 2) - 1
  values_smallest = []
  values_middle = []
  values_greatest = []
  (0..2).each do |i|
    values_smallest << array_filtered[i]
    values_middle << array_filtered[arraay_middle_el + i]
    values_greatest << array_filtered[-1 - i]
  end
  puts 'the smallest values: ' + values_smallest.join(', ')
  puts 'the middle values: ' + values_middle.join(', ')
  puts 'the greatest values: ' + values_greatest.join(', ')
end

find_extreme_values([33, 15, 17, 20, 23, 23, 28, 40, 21, 19, 31, 18, 30, 31, 28, 23, 19, 28, 27, 30, 39, 17, 17, 20, 19, 23, 28, 30, 34, 28])
